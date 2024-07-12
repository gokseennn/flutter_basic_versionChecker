import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:version_check/api_service/api_service.dart';
import 'package:version_check/version_service/version_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ApiService(baseUrl: "http://localhost:3000"), permanent: true);
  Get.put(
    VersionService(),
    permanent: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo'),
        ),
        body: const Center(
          child: Text('Hello, Flutter!'),
        ),
      ),
    );
  }
}
