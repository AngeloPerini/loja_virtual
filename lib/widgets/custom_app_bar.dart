import 'package:flutter/material.dart';
import 'package:loja_virtual_mind/utils/app_colors.dart';
import 'package:loja_virtual_mind/utils/app_constants.dart';
import 'package:provider/provider.dart';
import 'package:loja_virtual_mind/services/cart_service.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showMenuIcon;
  final bool showBackButton;
  final bool showCartIcon;

  const CustomAppBar({
    super.key,
    this.title = AppConstants.appName,
    this.showMenuIcon = false,
    this.showBackButton = false,
    this.showCartIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.headerBackground, // #6579D9
      foregroundColor: AppColors.light,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.primary, // #ECA80B
          fontWeight: FontWeight.w900,
          fontSize: 28, // Ajustado para ser mais proeminente como um logo
          // fontFamily: 'Gluten', // Se você tiver a fonte, adicione no pubspec.yaml
        ),
      ),
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.light),
              onPressed: () => Navigator.of(context).pop(),
            )
          : (showMenuIcon
              ? Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu, color: AppColors.light),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                )
              : null),
      actions: [
        if (showCartIcon)
          Consumer<CartService>(
            builder: (context, cart, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart, color: AppColors.light),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/cart');
                    },
                  ),
                  if (cart.itemCount > 0)
                    Positioned(
                      right: 5,
                      top: 5,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          cart.itemCount.toString(),
                          style: const TextStyle(
                            color: AppColors.light,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}