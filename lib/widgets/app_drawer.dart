import 'package:flutter/material.dart';
import 'package:loja_virtual_mind/services/auth_service.dart';
import 'package:loja_virtual_mind/utils/app_colors.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Drawer(
      backgroundColor: AppColors.navBackground, // #F9B233
      child: Column(
        children: [
          AppBar(
            title: const Text(
              'Navegação',
              style: TextStyle(color: AppColors.dark),
            ),
            automaticallyImplyLeading: false, // Remove o ícone de hambúrguer
            backgroundColor: AppColors.navBackground,
            elevation: 0,
          ),
          ListTile(
            leading: const Icon(Icons.home, color: AppColors.dark),
            title: const Text('Página Inicial',
                style: TextStyle(color: AppColors.dark)),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart, color: AppColors.dark),
            title: const Text('Carrinho',
                style: TextStyle(color: AppColors.dark)),
            onTap: () {
              Navigator.of(context).pushNamed('/cart');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person, color: AppColors.dark),
            title: const Text('Perfil',
                style: TextStyle(color: AppColors.dark)),
            onTap: () {
              Navigator.of(context).pushNamed('/perfil');
            },
          ),
          ListTile(
            leading: const Icon(Icons.info, color: AppColors.dark),
            title: const Text('Dados da Empresa',
                style: TextStyle(color: AppColors.dark)),
            onTap: () {
              Navigator.of(context).pushNamed('/company-info');
            },
          ),
          const Divider(color: AppColors.dark),
          ListTile(
            leading: const Icon(Icons.logout, color: AppColors.dark),
            title: const Text('Sair',
                style: TextStyle(color: AppColors.dark)),
            onTap: () async {
              await authService.logoutUser();
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
    );
  }
}