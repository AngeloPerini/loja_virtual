import 'package:flutter/material.dart'; // Para ChangeNotifier
import 'package:loja_virtual_mind/models/product.dart';

class ProductService extends ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: 'm1',
      name: 'Blusão Mind',
      originalPrice: 120.00,
      discountedPrice: 90.00,
      category: 'Masculino',
      imageUrl: 'assets/images/blusão_mind.jpg', 
    ),
    Product(
      id: 'm2',
      name: 'Calça Jeans Escura',
      originalPrice: 150.00,
      category: 'Masculino',
      imageUrl: 'assets/images/calca_jeans_escura.jpg', 
    ),
    Product(
      id: 'm3',
      name: 'Camiseta Street Mind',
      originalPrice: 300.00,
      category: 'Masculino',
      imageUrl: 'assets/images/camiseta_stret_mind.jpg',
    ),
    Product(
      id: 'm4',
      name: 'Relógio Esportivo',
      originalPrice: 230.00,
      category: 'Masculino',
      imageUrl: 'assets/images/relogio_esportivo.jpg',
    ),
    Product(
      id: 'f1',
      name: 'Vestido Vermelho',
      originalPrice: 140.00,
      discountedPrice: 105.00,
      category: 'Feminino',
      imageUrl: 'assets/images/vestido_vermelho.jpg',
    ),
    Product(
      id: 'f2',
      name: 'Blusa Floral',
      originalPrice: 85.00,
      category: 'Feminino',
      imageUrl: 'assets/images/blusa_floral.jpg',
    ),
    Product(
      id: 'f3',
      name: 'Saia Street',
      originalPrice: 90.00,
      category: 'Feminino',
      imageUrl: 'assets/images/saia_streat.jpg',
    ),
    Product(
      id: 'f4',
      name: 'Bolsa de Couro',
      originalPrice: 250.00,
      category: 'Feminino',
      imageUrl: 'assets/images/bolsa_couro.jpg',
    ),
    Product(
      id: 'o1',
      name: 'Tênis Running',
      originalPrice: 180.00,
      discountedPrice: 135.00,
      category: 'Ofertas',
      imageUrl: 'assets/images/tenis_running.jpg',
    ),
    Product(
      id: 'o2',
      name: 'Relógio Digital',
      originalPrice: 200.00,
      discountedPrice: 150.00,
      category: 'Ofertas',
      imageUrl: 'assets/images/relogio_digital.jpg',
    ),
    Product(
      id: 'o3',
      name: 'Bone Bulls',
      originalPrice: 180.00,
      category: 'Ofertas',
      imageUrl: 'assets/images/bone_bulls.jpg',
    ),
    Product(
      id: 'o4',
      name: 'Blusa Unissex',
      originalPrice: 70.00,
      category: 'Ofertas',
      imageUrl: 'assets/images/blusa_unissex.jpg',
    ),
  ];

  List<Product> get products => [..._products]; // Retorna uma cópia para não ser modificada externamente

  List<Product> getProductsByCategory(String category) {
    return _products.where((product) => product.category == category).toList();
  }

  Product? getProductById(String id) {
    return _products.firstWhere((product) => product.id == id);
  }
}