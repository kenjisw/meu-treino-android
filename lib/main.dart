import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MeuTreinoApp());
}

class MeuTreinoApp extends StatelessWidget {
  const MeuTreinoApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Meu Treino',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(useMaterial3: true),
        home: const TelaTreino(),
      );
}

class TelaTreino extends StatefulWidget {
  const TelaTreino({super.key});

  @override
  State<TelaTreino> createState() => _TelaTreinoState();
}

class _TelaTreinoState extends State<TelaTreino> {
  WebViewController? controller;
  String? erro;
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    _iniciar();
  }

  Future<void> _iniciar() async {
    try {
      final web = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setBackgroundColor(const Color(0xFF0B1420))
        ..setNavigationDelegate(NavigationDelegate(
          onPageFinished: (_) {
            if (mounted) setState(() { carregando = false; erro = null; });
          },
          onWebResourceError: (event) {
            if (event.isForMainFrame == true && mounted) {
              setState(() {
                carregando = false;
                erro = 'Erro ao carregar: ${event.description}';
              });
            }
          },
        ));

      if (mounted) setState(() => controller = web);
      await web.loadFlutterAsset('assets/index.html');
    } on PlatformException catch (e) {
      if (mounted) setState(() { carregando = false; erro = 'Falha no Android: ${e.message}'; });
    } catch (e) {
      if (mounted) setState(() { carregando = false; erro = 'Falha ao abrir: $e'; });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFF0B1420),
        body: SafeArea(
          child: Stack(children: [
            if (controller != null) WebViewWidget(controller: controller!),
            if (carregando)
              const Center(child: CircularProgressIndicator()),
            if (erro != null)
              Center(child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Text(erro!, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  FilledButton(onPressed: () {
                    setState(() { controller = null; carregando = true; erro = null; });
                    _iniciar();
                  }, child: const Text('Tentar novamente')),
                ]),
              )),
          ]),
        ),
      );
}
