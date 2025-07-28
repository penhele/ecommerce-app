import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/order.dart';
import '../../data/repositories/order_repository.dart';
import '../../utils/app_textstyles.dart';
import '../widgets/order_card.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});

  final OrderRepository _repository = OrderRepository();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          title: Text(
            'My Orders',
            style: AppTextStyle.withColor(
              AppTextStyle.h3,
              isDark ? Colors.white : Colors.black,
            ),
          ),
          bottom: TabBar(
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: isDark
                ? Colors.grey.shade400
                : Colors.grey.shade600,
            indicatorColor: Theme.of(context).primaryColor,
            tabs: [
              const Tab(text: 'Active'),
              const Tab(text: 'Completed'),
              const Tab(text: 'Cancelled'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildOrderList(context, OrderStatus.active),
            _buildOrderList(context, OrderStatus.completed),
            _buildOrderList(context, OrderStatus.cancelled),
          ],
        ),
      ),
    );
  }

  _buildOrderList(BuildContext context, OrderStatus status) {
    final orders = _repository.getOrdersByStatus(status);

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) =>
          OrderCard(order: orders[index], onViewDetails: () {}),
    );
  }
}
