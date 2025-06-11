#version 330 core
layout (location = 0) in vec3 aPos;         // Posição do vértice (x, y, z)
layout (location = 1) in vec2 aTexCoord;    // Coordenada de textura (s, t)

out vec2 TexCoord;                          // Passa a coordenada de textura para o Fragment Shader

uniform mat4 model;                         // Matriz de modelo para transformações do objeto
uniform mat4 projection;                    // Matriz de projeção (câmera)

void main()
{
    gl_Position = projection * model * vec4(aPos, 1.0); // Calcula a posição final do vértice
    TexCoord = aTexCoord;                               // Passa a coordenada de textura
}