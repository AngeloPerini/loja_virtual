import 'package:flutter/material.dart';
import 'package:loja_virtual_mind/models/product.dart';
import 'package:loja_virtual_mind/services/cart_service.dart';
import 'package:loja_virtual_mind/utils/app_colors.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartService = Provider.of<CartService>(context, listen: false);

    return Card(
      elevation: 0, // Remover sombra padrão do Card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(color: AppColors.productBorder), // #ccc
      ),
      color: AppColors.productBackground, // #eee
      child: InkWell(
        onTap: () {
          // Navegar para a página de detalhes do produto se houver
          // Navigator.of(context).pushNamed('/product-detail', arguments: product.id);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Clicou no produto: ${product.name}'),
              duration: const Duration(seconds: 1),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.productImagePlaceholder, // #ddd
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
                ),
                alignment: Alignment.center,
                child: product.imageUrl.startsWith('assets/')
                    ? Image.asset(
                        product.imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Text(
                          product.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.productPlaceholderText, // #aaa
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )
                    : Text(
                        product.name, // Fallback se não for uma imagem
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.productPlaceholderText, // #aaa
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.dark,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    if (product.isOnSale)
                      Text(
                        'R\$ ${product.originalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: AppColors.priceOriginal, // #999
                          fontSize: 14,
                        ),
                      ),
                    Text(
                      'R\$ ${product.isOnSale ? product.discountedPrice!.toStringAsFixed(2) : product.originalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: product.isOnSale ? AppColors.successGreen : AppColors.accent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    if (product.isOnSale)
                      Text(
                        '(${product.discountPercentage})',
                        style: const TextStyle(
                          color: AppColors.successGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    const SizedBox(height: 8),
                    ElevatedButton.icon(
                      onPressed: () {
                        cartService.addProduct(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product.name} adicionado ao carrinho!'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add_shopping_cart),
                      label: const Text('Adicionar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.light,
                        minimumSize: const Size.fromHeight(35),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}