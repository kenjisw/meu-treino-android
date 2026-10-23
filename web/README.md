# Meu Treino — Versão Web (iPhone, Android e computador)

O web app usa o mesmo HTML de `assets/index.html` da versão Android; a publicação acrescenta um **manifesto PWA**, service worker e ícones.

## Como publicar

Acesse `Settings → Pages → Build and deployment → Source → GitHub Actions` e depois rode o workflow **Publicar Meu Treino Web** na aba Actions.

**Atenção:** com GitHub Free, GitHub Pages exige repositório **público**. Para preservar o código-fonte privado, utilize GitHub Pro ou um serviço de hospedagem alternativo. Tornar o repositório público expõe também o código da versão Android (sem dados pessoais; este projeto usa armazenamento local).

Após publicado, o endereço padrão será `https://kenjisw.github.io/meu-treino-android/`.

No iPhone: abrir no Safari → Compartilhar → Adicionar à Tela de Início → Abrir como App da Web → Adicionar.

### Recursos

- Perfis masculino (hipertrofia, 5 dias) e feminino (3 dias)
- Exercícios passo a passo, séries e repetições de referência
- Marcar exercícios concluídos e cronômetro
- Sem campos para registrar cargas
- Dados locais no navegador, sem conta; limpar dados do Safari pode apagar marcações
- Offline após abrir a versão publicada e permitir que o cache seja instalado.

O arquivo local `.html` continua funcionando de forma independente, mas o modo instalável e cache offline exigem HTTPS.
