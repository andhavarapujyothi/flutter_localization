import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      path: 'assets/translations/',
      supportedLocales: const [
        Locale("en"),
        Locale("te"),
        Locale("ar"),
      ],
      fallbackLocale: const Locale("en"),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter localization',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      home: const LocalScreen(),
    );
  }
}

class LocalScreen extends StatefulWidget {
  const LocalScreen({super.key});

  @override
  State<LocalScreen> createState() => _LocalScreenState();
}

class _LocalScreenState extends State<LocalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'.tr()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'I am your guide today'.tr(),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.setLocale(const Locale("en"));
                    },
                    child: const Text('Engish')),
                ElevatedButton(
                    onPressed: () {
                      context.setLocale(const Locale("te"));
                    },
                    child: const Text('Telugu')),
                ElevatedButton(
                    onPressed: () {
                      context.setLocale(const Locale("ar"));
                    },
                    child: const Text('Arabic')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
