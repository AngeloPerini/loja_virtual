import 'package:flutter/material.dart';
import 'package:loja_virtual_mind/services/auth_service.dart';
import 'package:loja_virtual_mind/utils/app_colors.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      final authService = Provider.of<AuthService>(context, listen: false);
      bool success = await authService.loginUser(
        _usernameController.text,
        _passwordController.text,
      );

      if (success) {
        Navigator.of(context).pushReplacementNamed('/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuário ou senha inválidos!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light, // --light
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            padding: const EdgeInsets.all(32.0), // 2rem 2.5rem no CSS
            decoration: BoxDecoration(
              color: const Color(0xFFF9F9F9), // #f9f9f9
              borderRadius: BorderRadius.circular(10.0), // 10px
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15, // 15px
                  offset: const Offset(0, 4), // 0 4px
                ),
              ],
            ),
            constraints: const BoxConstraints(maxWidth: 400),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 28, // 1.8rem
                      fontWeight: FontWeight.bold, // 700
                      color: AppColors.primary, // --primary
                    ),
                  ),
                  const SizedBox(height: 24), // 1.5rem
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: 'Usuário',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0), // 6px
                        borderSide: const BorderSide(color: Color(0xFFCCCCCC)), // #ccc
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: const BorderSide(color: AppColors.primary),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // 0.75rem 1rem
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira seu usuário.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16), // 1rem
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: const BorderSide(color: AppColors.primary),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira sua senha.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16), // 1rem
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary, // --primary
                      foregroundColor: AppColors.light, // --light
                      textStyle: const TextStyle(
                        fontSize: 18, // 1.1rem
                        fontWeight: FontWeight.bold, // 700
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12.0), // 0.75rem
                      minimumSize: const Size.fromHeight(50), // Garante largura total
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0), // 6px
                      ),
                      elevation: 0,
                    ),
                    child: const Text('Entrar'),
                  ),
                  const SizedBox(height: 16), // 1rem
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/cadastro');
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Ainda não tem conta? ',
                        style: TextStyle(
                          fontSize: 14, // 0.9rem
                          color: AppColors.dark.withOpacity(0.8), // Cor do texto do link
                        ),
                        children: [
                          TextSpan(
                            text: 'Cadastre-se',
                            style: TextStyle(
                              color: AppColors.primary, // --primary
                              fontWeight: FontWeight.bold, // 600
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}