import 'package:flutter/material.dart';
import 'package:loja_virtual_mind/utils/app_colors.dart';
import 'package:loja_virtual_mind/widgets/custom_app_bar.dart';

class CompanyInfoPage extends StatelessWidget {
  const CompanyInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      appBar: const CustomAppBar(
        title: 'Dados da Empresa',
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Informações da Loja Mind',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 16),
            Text('Fale conosco através dos canais abaixo:',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('• Email: suporte@lojamind.com', style: TextStyle(fontSize: 16)),
            Text('• Telefone: (11) 99999-9999', style: TextStyle(fontSize: 16)),
            Text('• WhatsApp: (11) 98888-8888', style: TextStyle(fontSize: 16)),
            Text('• Endereço: Rua Exemplo, 123 - São Paulo, SP',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 24),
            Text(
              'Horário de Atendimento:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.dark,
              ),
            ),
            SizedBox(height: 8),
            Text('Segunda a Sexta: 9h às 18h', style: TextStyle(fontSize: 16)),
            Text('Sábado: 9h às 13h', style: TextStyle(fontSize: 16)),
            Text('Domingo: Fechado', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}