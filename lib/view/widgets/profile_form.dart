import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_textstyles.dart';
import 'custom_textfield.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          _textField(
            context,
            isDark,
            'Full Name',
            Icons.person_outline,
            'John Doe',
          ),
          const SizedBox(height: 16),

          _textField(
            context,
            isDark,
            'Email',
            Icons.email_outlined,
            'johndoe@gmail.com',
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),

          _textField(
            context,
            isDark,
            'Phone Number',
            Icons.phone_outlined,
            '123457890',
            textInputType: TextInputType.phone,
          ),
          const SizedBox(height: 32),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Save Changes',
                style: AppTextStyle.withColor(AppTextStyle.h3, Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textField(
    BuildContext context,
    bool isDark,
    String label,
    IconData icon,
    String initialValue, {
    TextInputType textInputType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.2)
                : Colors.grey.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: CustomTextfield(
        label: label,
        prefixIcon: icon,
        initialValue: initialValue,
        keyboardType: textInputType,
      ),
    );
  }
}
