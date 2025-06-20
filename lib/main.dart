import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'package:order_aap/pages/main_pages.dart';


void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => CartProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Order App',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: MainPage(),
      debugShowCheckedModeBanner: false,
      
    );
  }
}
