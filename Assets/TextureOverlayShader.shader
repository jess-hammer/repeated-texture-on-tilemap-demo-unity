Shader "Custom/OverlayShader"
{
    Properties
    {
        _OverlayTex("Overlay Texture", 2D) = "white" {} // Texture to overlay
        _Scale("Scale", Float) = 0.006944444 // Scale factor
    }
    SubShader
    {
        Tags { "RenderType"="Transparent" "Queue"="Transparent" }
        LOD 200
        
        Pass
        {
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Off
            ZWrite Off

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            sampler2D _MainTex; // Main texture (Unity provides this by default for sprites)
            sampler2D _OverlayTex; // Overlay texture
            float _Scale; // should be pixels per unit divided by texture size

            struct appdata_t
            {
                float4 vertex : POSITION;
                float2 texcoord : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float2 worldPos : TEXCOORD1;
                float4 vertex : SV_POSITION;
            };

            v2f vert(appdata_t v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                
                // Calculate the world position (in 2D space, so xy)
                float4 worldPos = mul(unity_ObjectToWorld, v.vertex);
                o.worldPos = worldPos.xy;
                
                o.uv = v.texcoord;
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                // Sample the main texture
                fixed4 color = tex2D(_MainTex, i.uv);
                
                // Use the red channel of the main texture as a mask
                float mixAmount = floor(color.r);

                // Sample the overlay texture using the scaled world position
                float2 overlayUV = i.worldPos * _Scale;
                fixed4 overlayColor = tex2D(_OverlayTex, overlayUV);

                // Mix the original color with the overlay color based on the mask
                return lerp(color, overlayColor, mixAmount);
            }
            ENDCG
        }
    }
}
