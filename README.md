# Meu Treino — Android

App de treinos offline com o mesmo HTML simplificado testado no Samsung.

- Treino feminino: 3 dias por semana
- Treino masculino: 5 dias por semana
- Instruções passo a passo, cronômetro, marcar exercícios concluídos
- Sem anotação de cargas e sem login

## APK

Abra a aba **Actions**, selecione **Gerar APK Meu Treino** e clique em **Run workflow**. Após sucesso, abra a execução e baixe o artefato **Meu_Treino_Android_APK**. Extraia o ZIP e instale `app-release.apk`.

O build usa Flutter e Android SDK, e não o gerador artesanal anterior. A assinatura padrão gerada pelo Flutter sem chave de release é apenas para testes; a instalação e inicialização em Android real ainda precisam ser verificadas.

Os arquivos `lib/main.dart`, `pubspec.yaml` e `assets/index.html` são copiados pelo workflow para um novo projeto Flutter durante a compilação.
