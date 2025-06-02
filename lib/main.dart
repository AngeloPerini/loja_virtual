
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loja_virtual_mind/services/auth_service.dart';
import 'package:loja_virtual_mind/utils/app_constants.dart';
import 'package:loja_virtual_mind/pages/login_page.dart';
import 'package:loja_virtual_mind/pages/cadastro_page.dart';
import 'package:loja_virtual_mind/pages/home_page.dart';
import 'package:loja_virtual_mind/pages/cart_page.dart';
import 'package:loja_virtual_mind/pages/profile_page.dart';
import 'package:loja_virtual_mind/pages/company_info_page.dart';
import 'package:loja_virtual_mind/services/product_service.dart';
import 'package:loja_virtual_mind/services/cart_service.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => ProductService()),
        ChangeNotifierProvider(create: (_) => CartService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, child) {
        return MaterialApp(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.orange,
            fontFamily: 'Arial',
            appBarTheme: const AppBarTheme(
              centerTitle: true,
              elevation: 0,
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: authService.isUserLoggedIn ? '/home' : '/login',
          routes: {
            '/login': (context) => const LoginPage(),
            '/cadastro': (context) => const CadastroPage(),
            '/home': (context) => const HomePage(),
            '/cart': (context) => const CartPage(),
            '/perfil': (context) => const ProfilePage(),
            '/company-info': (context) => const CompanyInfoPage(),
          },
        );
      },
    );
  }
}