import 'package:flutter/material.dart';
import 'webview_page.dart';


class TreinoPage extends StatelessWidget {
  const TreinoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Treino')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebViewPage(
                      url: 'https://luana-napoli.github.io/SiteTBMobile/Arquivo_web_para_mobile/treinoGuiado.html',
                      titulo: 'Treinar sem IA',
                    ),
                  ),
                );
              },
              child: const Text('Treinar sem IA'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebViewPage(
                      url: 'https://luana-napoli.github.io/SiteTBMobile/Arquivo_web_para_mobile/treinoIA.html',
                      titulo: 'Treinar com IA',
                    ),
                  ),
                );
              },
              child: const Text('Treinar com IA'),
            ),
          ],
        ),
      ),
    );
  }
}
