Loja Mind - E-commerce Simples (Frontend Web)
Este é um projeto de frontend web simples para uma loja de e-commerce, desenvolvido com HTML, CSS e JavaScript. Ele simula funcionalidades básicas de uma loja online, como cadastro/login de usuários e exibição de produtos.

Visão Geral
O projeto Loja Mind oferece uma interface de usuário responsiva e intuitiva para um e-commerce. Ele é construído com tecnologias web padrão, focando na demonstração das seguintes funcionalidades:

Páginas Essenciais: Login, Cadastro, Página Principal (Home), Carrinho e Perfil do Usuário.
Autenticação Simples: Gerenciamento de sessão de usuário (simulada via localStorage).
Estilo Responsivo: Adaptação da interface para diferentes tamanhos de tela (desktop e mobile) usando CSS.
Interatividade Básica: Manipulação do DOM e eventos com JavaScript puro.
Observação: Este projeto foca no frontend (interface do usuário) e na lógica do lado do cliente. O armazenamento de dados de usuário e produtos é feito localmente no navegador (via localStorage) e não é seguro ou escalável para um ambiente de produção real.

Estrutura do Projeto
A estrutura do projeto é a seguinte:

loja_virtual_mind/
├── assets/
│   └── images/      # <--- Pasta para suas imagens locais (se você adicionar)
├── css/
│   ├── login-cadastro.css
│   └── style.css
├── pages/           # Pasta para suas páginas HTML principais
│   ├── cadastro.html
│   ├── index.html
│   ├── login.html
│   └── perfil.html
├── README.md        # Este arquivo
└── (outros arquivos de configuração do Flutter, se houver, como pubspec.yaml)

Como Visualizar o Projeto
Para visualizar este projeto em seu navegador:

Clone este repositório (ou baixe os arquivos).
Abra o arquivo login.html diretamente em seu navegador web (Google Chrome, Firefox, Edge, etc.).
Como a autenticação é gerenciada localmente, você pode:

Registrar um novo usuário na página cadastro.html.
Fazer login com as credenciais cadastradas na página login.html.
Após o login, você será redirecionado para index.html.
Funcionalidades Implementadas (Frontend)
Página de Login (login.html): Permite que usuários existentes façam login.
Página de Cadastro (cadastro.html): Permite que novos usuários criem uma conta, salvando dados no localStorage.
Página Principal (index.html): Exibe o nome do usuário logado e possui seções de navegação (Home, Produtos, Carrinho, Perfil, Contato).
Página de Perfil (perfil.html): Exibe as informações do usuário logado e oferece uma opção de logout.
Estilo Responsivo: A interface se adapta para diferentes tamanhos de tela (desktop e mobile).
Tecnologias Utilizadas
HTML5: Estrutura das páginas web.
CSS3: Estilização e responsividade da interface.
JavaScript (ES6+): Lógica de frontend, manipulação do DOM e gerenciamento de localStorage para simulação de autenticação.
Potencial Futuro / Migração para Mobile (Flutter)
Este projeto foi inicialmente desenvolvido como uma aplicação web. No entanto, houve discussões e tentativas de migração ou integração com o framework Flutter.

Se o objetivo for transformar esta aplicação em um aplicativo móvel nativo (Android/iOS) ou um aplicativo híbrido, as seguintes abordagens podem ser consideradas:

Reescrita em Flutter: A abordagem recomendada para um desempenho e experiência de usuário nativos. Isso envolveria reescrever toda a interface e a lógica de front-end em Dart, utilizando os widgets do Flutter.
lib/main.dart: Ponto de entrada principal do aplicativo Flutter.
lib/utils/app_constants.dart: Para constantes globais do Flutter.
lib/services/auth_service.dart: Para gerenciar a autenticação e estado do usuário com Provider.
lib/pages/: Pasta para os widgets/telas do Flutter (ex: login_page.dart, cadastro_page.dart, home_page.dart).
Progressive Web App (PWA): Otimizar a aplicação web existente para que ela possa ser "instalada" na tela inicial dos dispositivos móveis, oferecendo funcionalidades offline e uma experiência mais próxima de um aplicativo.
Empacotamento com Cordova/Capacitor: Usar ferramentas como Apache Cordova ou Capacitor para empacotar a aplicação web (HTML/CSS/JS) em um contêiner nativo para Android e iOS.
Os erros de compilação do Flutter mencionados anteriormente (Undefined name 'main', MSB8066, Too few positional arguments) são desafios comuns na configuração e desenvolvimento com Flutter, e as soluções para eles foram discutidas para auxiliar em uma eventual migração.
