import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/presentation/discover/screens/discover_screen.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false, // los proveedores ejecutan LAZY por defecto, es decir, no se ejecutan hasta que se les llama
          create: (_) => DiscoverProvider()..loadNextPage(), // Operador de cascada (es lo mismo que correr el constructor y luego ejecutar el metodo)
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().themeData,
        home: const DiscoverScreen(),
      ),
    );
  }
}
