#version 330 core
out vec4 FragColor;     // Cor final do fragmento

in vec2 TexCoord;       // Coordenada de textura interpolada do Vertex Shader

uniform sampler2D tex_buffer; // Objeto sampler 2D para acessar a textura

void main()
{
    FragColor = texture(tex_buffer, TexCoord); // Amostra a cor da textura na coordenada TexCoord
}