import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VersionChange extends StatelessWidget {
  const VersionChange({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Yeni Sürüm Mevcut'),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Uygulamanın yeni bir sürümü mevcut.'),
          SizedBox(height: 10),
          Text('Yeni sürüm Mevuct'),
          SizedBox(height: 10),
          Text('Lütfen uygulamayı güncelleyin.'),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Daha Sonra'),
          onPressed: () {
            Get.close(1);
          },
        ),
        ElevatedButton(
          child: const Text('Şimdi Güncelle'),
          onPressed: () {
            // Kullanıcıyı uygulama mağazasına yönlendir
            // Örneğin: launch('https://play.google.com/store/apps/details?id=com.yourapp');
          },
        ),
      ],
    );
  }
}
