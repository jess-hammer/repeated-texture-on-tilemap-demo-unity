# Repeated texture on a tilemap
This is a demo of a very simple shader that overlays a texture across a tilemap using Unity 2023.1.11f1

See Godot version here: https://github.com/jess-hammer/repeated-texture-on-tilemap-demo-godot

## The texture:
<img src="https://github.com/user-attachments/assets/cd4db28c-d90a-49fc-bec7-2bae51e83686" width="300" title="Example texture (screenshot)">

## The result:
<img width="1438" alt="Screenshot 2024-11-23 at 12 57 14 pm" src="https://github.com/user-attachments/assets/64074aee-7720-4e84-b46a-ba939100a721">


## Example tile set:
It will only overlay the provided texture across the parts of the tiles that are fully red, so that the edges can be preserved in the final result.

![Screenshot 2024-08-31 at 11 26 44 AM](https://github.com/user-attachments/assets/f1b551ef-b98b-4f03-9aa2-fae372cd999c)

## Lit Shader
There is also lit version of the shader that is compatible with URP lighting. It was easier to get it working using Shader Graph.

![Screenshot 2024-11-30 at 1 15 48 pm](https://github.com/user-attachments/assets/7575e4c8-18b1-4492-9fe9-b01bf67689d6)
