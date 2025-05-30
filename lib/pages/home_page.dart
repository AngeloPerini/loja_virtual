import 'package:flutter/material.dart';
import 'package:loja_virtual_mind/services/auth_service.dart';
import 'package:loja_virtual_mind/services/product_service.dart';
import 'package:loja_virtual_mind/utils/app_colors.dart';
import 'package:loja_virtual_mind/utils/app_constants.dart';
import 'package:loja_virtual_mind/widgets/app_drawer.dart';
import 'package:loja_virtual_mind/widgets/custom_app_bar.dart';
import 'package:loja_virtual_mind/widgets/product_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ['Masculino', 'Feminino', 'Ofertas', 'Contato'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final productService = Provider.of<ProductService>(context);

    return Scaffold(
      backgroundColor: AppColors.light,
      appBar: const CustomAppBar(
        showMenuIcon: true,
        showCartIcon: true,
      ),
      drawer: const AppDrawer(), // O menu lateral
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: Row(
              children: [
                const Text(
                  'Olá, ',
                  style: TextStyle(
                    fontSize: 18, // 1.2rem
                    fontWeight: FontWeight.w600,
                    color: AppColors.dark,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/perfil');
                  },
                  child: Text(
                    authService.loggedInUser ?? 'Visitante',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const Text(
                  '! Seja bem-vindo(a)!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.dark,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: AppColors.navBackground, // #F9B233
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TabBar(
              controller: _tabController,
              isScrollable: true, // Para permitir rolagem se muitas abas
              labelColor: AppColors.light, // Cor do texto da aba ativa
              unselectedLabelColor: AppColors.dark, // Cor do texto da aba inativa
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: AppColors.primary, // Cor do fundo da aba ativa
              ),
              labelPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              tabs: _tabs.map((tabName) => Tab(text: tabName)).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildProductGrid(productService.getProductsByCategory('Masculino')),
                _buildProductGrid(productService.getProductsByCategory('Feminino')),
                _buildProductGrid(productService.getProductsByCategory('Ofertas')),
                _buildContactInfo(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductGrid(List products) {
    if (products.isEmpty) {
      return const Center(child: Text('Nenhum produto disponível nesta categoria.'));
    }
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 colunas em telas maiores, ajusta via media query ou responsive builder
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.7, // Ajuste para o tamanho do card
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }

  Widget _buildContactInfo() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Contato',
            style: TextStyle(
              fontSize: 24, // 1.5rem
              fontWeight: FontWeight.bold, // 700
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 16),
          Text('Fale conosco através dos canais abaixo:', style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
          Text('• Email: suporte@lojamind.com', style: TextStyle(fontSize: 16)),
          Text('• Telefone: (11) 99999-9999', style: TextStyle(fontSize: 16)),
          Text('• WhatsApp: (11) 98888-8888', style: TextStyle(fontSize: 16)),
          Text('• Endereço: Rua Exemplo, 123 - São Paulo, SP', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}