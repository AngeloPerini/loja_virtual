import 'package:flutter/material.dart';
import 'package:loja_virtual_mind/services/auth_service.dart';
import 'package:loja_virtual_mind/utils/app_colors.dart';
import 'package:loja_virtual_mind/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    if (!authService.isUserLoggedIn) {
      // Redireciona para login se não estiver logado
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacementNamed('/login');
      });
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.light,
      appBar: const CustomAppBar(
        title: 'Perfil do Usuário',
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0), // Padding do main no CSS
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              'Informações do Usuário',
              style: TextStyle(
                fontSize: 24, // 1.5rem
                fontWeight: FontWeight.bold, // 700
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 24), // 1.5rem
            _buildInfoItem('Nome de usuário:', authService.loggedInUser ?? 'Não informado'),
            _buildInfoItem('E-mail:', authService.registeredEmail ?? 'Não informado'),
            _buildInfoItem('Telefone:', authService.registeredPhone ?? 'Não informado'),
            _buildInfoItem('Endereço:', authService.registeredAddress ?? 'Não informado'),
            const SizedBox(height: 32), // 2rem
            ElevatedButton(
              onPressed: () async {
                await authService.logoutUser();
                Navigator.of(context).pushReplacementNamed('/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary, // --primary
                foregroundColor: AppColors.light, // --light
                minimumSize: const Size(double.infinity, 50), // width: 100%, max-width: 300px
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12), // 0.8rem 1.5rem
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // 8px
                ),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold, // 700
                ),
              ),
              child: const Text('Sair da conta'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0), // gap: 1rem
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // 0.75rem 1rem
      decoration: BoxDecoration(
        color: AppColors.navBackground, // #F9B233
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold, // 600
              color: AppColors.dark,
              fontSize: 16,
            ),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontWeight: FontWeight.normal, // 400
                color: AppColors.dark,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}