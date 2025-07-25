import 'package:flutter/material.dart';

import '../../utils/app_textstyles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        style: AppTextStyle.withColor(
          AppTextStyle.buttonMedium,
          Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
        ),
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: AppTextStyle.withColor(
            AppTextStyle.buttonMedium,
            isDark ? Colors.grey.shade400 : Colors.grey.shade600,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
          ),
          suffixIcon: Icon(
            Icons.tune,
            color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
          ),
          filled: true,
          fillColor: isDark ? Colors.grey.shade800 : Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
