// lib/pages/cadastro_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loja_virtual_mind/services/auth_service.dart'; // Seu AuthService

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>(); // Chave para o formulário
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Center( // Centraliza o conteúdo
        child: SingleChildScrollView( // Permite rolar se o teclado aparecer
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // Atribui a chave ao formulário
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'Usuário'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu usuário';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira sua senha';
                    }
                    if (value.length < 5) {
                      return 'A senha deve ter pelo menos 5 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu e-mail';
                    }
                    // Regex mais robusta para e-mail
                    final emailRegex = RegExp(r"^[^\s@]+@[^\s@]+\.[^\s@]+$");
                    if (!emailRegex.hasMatch(value)) {
                      return 'Por favor, insira um e-mail válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                // Campo de Celular com Validação
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'Celular (Ex: (XX) XXXXX-XXXX)'),
                  keyboardType: TextInputType.phone, // Teclado numérico
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu celular';
                    }
                    // Regex para telefone brasileiro (com ou sem DDD, com 8 ou 9 dígitos no número)
                    // Aceita (DD) XXXXX-XXXX, DD XXXXX-XXXX, XXXXXXXXXXX, etc.
                    final phoneRegex = RegExp(r"^(\(\d{2}\)\s?)?\d{4,5}[-\s]?\d{4}$");
                    if (!phoneRegex.hasMatch(value)) {
                      return 'Formato inválido (Ex: (XX) XXXXX-XXXX ou XXXXXXXXXXX)';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(labelText: 'Endereço'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu endereço';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    // Valida todos os campos do formulário
                    if (_formKey.currentState!.validate()) {
                      await authService.registerUser(
                        _usernameController.text,
                        _passwordController.text,
                        _emailController.text,
                        _phoneController.text,
                        _addressController.text,
                      );
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Cadastro realizado com sucesso!')),
                        );
                        Navigator.pushReplacementNamed(context, '/login');
                      }
                    }
                  },
                  child: const Text('Cadastrar'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: const Text('Já tem conta? Faça login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}