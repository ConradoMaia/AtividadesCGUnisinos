# AtividadesCGUnisinos

Atividades relacionadas a matéria Computação Gráfica 2025/1.

Aluno: Conrado Maia Heckler

## Resultados

* **Módulo 1:** [Ver Resultados do Módulo 1](src/m1/RESULT.md)
* **Módulo 2:** [Ver Resultados do Módulo 2](src/m2/RESULT.md)
* **Módulo 3:** [Ver Resultados do Módulo 3](src/m3/RESULT.md)
* **Módulo 4:** [Ver Resultados do Módulo 4](src/m4/RESULT.md)
* **Módulo 5:** [Ver Resultados do Módulo 5](src/m5/RESULT.md)
* **Módulo 6:** [Ver Resultados do Módulo 6](src/m6/RESULT.md)


## Atividade GB

Este projeto consiste em um visualizador de cenas tridimensionais interativo, desenvolvido ao longo dos módulos da disciplina. Ele permite carregar cenas complexas, interagir com objetos, controlar a câmera em primeira pessoa, e visualizar iluminação e animações de trajetória.

### Decisões de Projeto

* **Arquitetura:**
    * O projeto adota uma arquitetura modular e orientada a objetos, com classes dedicadas para abstrair funcionalidades como `Camera`, `Mesh`, `Shader`, `Scene` e `Bezier`.
    * A configuração da cena é feita através de um arquivo JSON (`assets/scene_config.json`), garantindo flexibilidade e facilitando a modificação de objetos, luzes e parâmetros da câmera sem recompilação do código.

* **Interface e Interação:**
    * **Seleção de Objetos:** Objetos individuais na cena podem ser selecionados usando as teclas numéricas de `1` a `9`.
    * **Transformações de Objetos (selecionado):**
        * **Escala:** Teclas `[` (diminuir) e `]` (aumentar).
        * **Translação:** Setas do teclado (movimento no plano XZ); `Page Up` e `Page Down` (movimento no eixo Y).
        * **Rotação:** Teclas `X`, `Y`, `Z` ativam a rotação contínua nos respectivos eixos; a tecla `P` pausa a rotação e reseta as transformações para o estado inicial definido no JSON.
    * **Controle de Câmera (Primeira Pessoa):**
        * **Movimento:** Teclas `W`, `A`, `S`, `D` para frente, esquerda, trás e direita, respectivamente.
        * **Orientação:** O mouse controla a direção para onde a câmera está "olhando".
        * Os parâmetros iniciais da câmera (posição, vetor frontal, vetor "up" e campo de visão) são carregados de `scene_config.json`.

* **Iluminação:**
    * O visualizador implementa o **modelo de iluminação Phong**, que calcula a cor final de um pixel considerando as componentes ambiente, difusa e especular da luz.
    * As propriedades da(s) fonte(s) de luz (posição, cores ambiente, difusa e especular) e as propriedades de material dos objetos (Ka, Kd, Ks, Ns) são configuráveis no arquivo `scene_config.json`.

* **Animação de Trajetórias:**
    * Objetos podem seguir trajetórias pré-definidas por **curvas de Bezier**, adicionando movimento dinâmico à cena.
    * Os pontos de controle da curva e a velocidade da animação são especificados no `scene_config.json`.
    * A ativação/desativação da trajetória para o objeto selecionado é controlada pela tecla `V`.

### Recursos Utilizados

* **Assets 3D da Cena:**
    * Modelos 3D no formato `.obj` (ex: Suzanne, Cubo) e suas texturas associadas (`.png` ou `.jpg`) e arquivos de material (`.mtl`), localizados em `assets/Modelos3D/`.
    * Os modelos `.obj` são previamente triangulados e incluem informações de normais e coordenadas de textura.
    * Pontos de controle para trajetórias (ex: `assets/trajectories/trajectory_points.txt`).

* **Bibliotecas (Dependências):**
    * **GLFW:** Biblioteca para criação de janelas OpenGL e gerenciamento de entrada (teclado, mouse).
    * **GLAD:** Carregador de ponteiros de função OpenGL.
    * **GLM (OpenGL Mathematics):** Biblioteca de matemática para gráficos 3D (vetores, matrizes, transformações).
    * **stb_image:** Biblioteca para carregamento de imagens em diversos formatos (usado para texturas).
    * **tinyobjloader:** Biblioteca para carregar arquivos de modelo 3D no formato Wavefront .OBJ.
    * **nlohmann/json:** Biblioteca para parsing e manipulação de arquivos JSON.

### Como Compilar e Executar

Este projeto utiliza o CMake para gerenciar o processo de build.

* **Pré-requisitos:**
    * [CMake](https://cmake.org/download/) (versão 3.10 ou superior).
    * Um compilador C++ (ex: [MinGW-UCRT64](https://code.visualstudio.com/docs/cpp/config-mingw) para Windows, GCC para Linux, Clang para macOS).
    * [VS Code](https://code.visualstudio.com/) com as extensões **CMake Tools** e **C/C++** instaladas.
    * [Git](https://git-scm.com/downloads) (necessário para o CMake baixar automaticamente as dependências do projeto).

* **Passos:**
    1.  **Clonar o Repositório:** Abra um terminal e clone o repositório:
        ```bash
        git clone [https://github.com/ConradoMaia/AtividadesCGUnisinos]
        ```
    2.  **Abrir no VS Code:** Abra a pasta clonada no VS Code usando `Arquivo -> Abrir Pasta...` (ou `File -> Open Folder...`).
    3.  **Configurar CMake:** No VS Code, use `Ctrl + Shift + P` para abrir a paleta de comandos:
        * Procure por `CMake: Scan for Kits` e execute.
        * Em seguida, procure por `CMake: Select a Kit` e selecione o compilador apropriado (ex: `GCC for MSYS2 UCRT64`).
        * Se o CMake não configurar automaticamente, execute `CMake: Configure`.
    4.  **Compilar o Projeto:** Use `Ctrl + Shift + P` e execute `CMake: Build`. Alternativamente, no terminal na raiz do projeto:
        ```bash
        mkdir build
        cd build
        cmake ..
        cmake --build .
        ```
    5.  **Executar o Visualizador:** Após a compilação, o executável estará na pasta `build/`. Navegue até ela e execute o programa (ex: `./GB.exe`).
        * O `CMakelists.txt` está configurado para gerar executáveis individuais para cada módulo/atividade listada na variável `EXERCISES`. O executável principal da Atividade Vivencial é `GB.exe`.

### Estrutura do Repositório

* `src/`: Contém os arquivos `.cpp` dos módulos de ensino e da atividade vivencial.
* `Common/`: Contém os cabeçalhos (`.h`) e implementações (`.cpp`) de classes e funções comuns (Câmera, Shader, Mesh, Scene, Bezier, etc.).
* `assets/`: Contém os modelos 3D (`Modelos3D/`), texturas (`tex/`) e arquivos de configuração da cena (`scene_config.json`, `trajectories/`).
* `shaders/`: Contém os arquivos de shader GLSL (`.vs` para vertex shader e `.fs` para fragment shader).
* `include/`: Contém os cabeçalhos de bibliotecas externas (ex: `glad/`).
* `CMakelists.txt`: O arquivo de configuração principal do CMake para o projeto.
* `.gitignore`: Define quais arquivos e diretórios devem ser ignorados pelo controle de versão.

### Considerações Finais

* **Maiores Desafios Encontrados:**
    * Configuração e depuração do ambiente de desenvolvimento (CMake, compiladores, VS Code, Git).
    * Integração e gerenciamento de dependências externas no sistema de build.
    * Depuração de problemas visuais em OpenGL e lógicas de shader.
* **Pontos Fortes do Projeto:**
    * Arquitetura modular e extensível para cenas 3D.
    * Configuração da cena baseada em JSON, facilitando a prototipagem e modificação.
    * Controles interativos de câmera e objetos.
    * Implementação de animações de trajetória de Bezier.

### Referências

* **Tutoriais e Guias:**
    * [LearnOpenGL](https://learnopengl.com).
    * [CMake Documentation](https://cmake.org/documentation/).
    * [VS Code C++ Configuration Guides](https://code.visualstudio.com/docs/languages/cpp).
    * [GitHub Desktop](https://desktop.github.com/).
    * [Tutorial de Entregas pelo Github](TutorialEntregasGithub.pdf).
    * [Organizando seu Repositório no Github](OrganizandoRepositorioGithub.pdf).

* **Bibliotecas de Terceiros:**
    * [GLFW](https://www.glfw.org/).
    * [GLM](https://glm.g-truc.net/0.9.9/index.html).
    * [stb_image](https://github.com/nothings/stb).
    * [tinyobjloader](https://github.com/tinyobjloader/tinyobjloader).
    * [nlohmann/json](https://github.com/nlohmann/json).