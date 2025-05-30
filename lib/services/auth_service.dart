// lib/services/auth_service.dart
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  String? _loggedInUser;
  String? _registeredEmail;
  String? _registeredPhone;
  String? _registeredAddress;

  String? get loggedInUser => _loggedInUser;
  String? get registeredEmail => _registeredEmail;
  String? get registeredPhone => _registeredPhone;
  String? get registeredAddress => _registeredAddress;

  // Construtor
  AuthService() {
    _loadUserFromPrefs(); // Chama o método de inicialização no construtor
  }

  // Método privado para carregar dados do SharedPreferences
  Future<void> _loadUserFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _loggedInUser = prefs.getString('usuarioLogado');
    _registeredEmail = prefs.getString('emailCadastrado');
    _registeredPhone = prefs.getString('celularCadastrado');
    _registeredAddress = prefs.getString('enderecoCadastrado');
    notifyListeners(); // Notifica os ouvintes que os dados foram carregados
  }

  // Métodos de autenticação
  bool get isUserLoggedIn => _loggedInUser != null;

  Future<void> registerUser(String username, String password, String email, String phone, String address) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('usuarioCadastrado', username);
    await prefs.setString('senhaCadastrada', password);
    await prefs.setString('emailCadastrado', email);
    await prefs.setString('celularCadastrado', phone);
    await prefs.setString('enderecoCadastrado', address);
    _registeredEmail = email; // Atualiza o estado local
    _registeredPhone = phone;
    _registeredAddress = address;
    notifyListeners();
  }

  Future<bool> loginUser(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final storedUsername = prefs.getString('usuarioCadastrado');
    final storedPassword = prefs.getString('senhaCadastrada');

    if (username == storedUsername && password == storedPassword) {
      _loggedInUser = username;
      // Carregar os outros dados do usuário logado se houver necessidade
      _registeredEmail = prefs.getString('emailCadastrado');
      _registeredPhone = prefs.getString('celularCadastrado');
      _registeredAddress = prefs.getString('enderecoCadastrado');
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> logoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('usuarioLogado');
    _loggedInUser = null;
    notifyListeners();
  }
}