import 'package:flutter/material.dart';

import 'service_provider_card.dart';

class ServiceItem extends StatelessWidget {
  final String serviceImage;
  const ServiceItem({super.key, required this.serviceImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 160,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              image: DecorationImage(
                image: AssetImage(serviceImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(left: 140, child: ServiceProviderCard()),
        ],
      ),
    );
  }
}
