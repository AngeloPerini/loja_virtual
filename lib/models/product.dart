class Product {
  final String id;
  final String name;
  final String imageUrl;
  final double originalPrice;
  final double? discountedPrice; // Pode ser nulo se não houver desconto
  final String category; // Masculino, Feminino, Ofertas

  Product({
    required this.id,
    required this.name,
    this.imageUrl = 'assets/images/placeholder.png', // Caminho padrão para imagem
    required this.originalPrice,
    this.discountedPrice,
    required this.category,
  });

  bool get isOnSale => discountedPrice != null && discountedPrice! < originalPrice;

  String get discountPercentage {
    if (isOnSale) {
      final double discount = originalPrice - discountedPrice!;
      final double percent = (discount / originalPrice) * 100;
      return '${percent.toStringAsFixed(0)}% OFF';
    }
    return '';
  }
}