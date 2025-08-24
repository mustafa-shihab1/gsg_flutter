import 'package:flutter/material.dart';

import '../widgets/custom_banner.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/custom_section_title.dart';
import '../widgets/freelancer_card.dart';
import '../widgets/service_item.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final serviceAssets = [
    'assets/images/service1.png',
    'assets/images/service2.png',
    'assets/images/service3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.menu, size: 30),
        title: Image.asset('assets/images/logo.png'),

        actions: [
          IconButton(
            icon: Image.asset('assets/icons/notification-bing.png'),
            onPressed: () {},
          ),
          SizedBox(width: 10),
          Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Color(0x1E36721F),
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              icon: Image.asset('assets/icons/shopping-cart.png'),
              hoverColor: Colors.transparent,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchBar(),
              CustomBanner(),
              const SizedBox(height: 20),
              CustomSectionTitle(title: 'Top Rated Freelancers'),
              const SizedBox(height: 10),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => FreelancerCard(index: index),
                  itemCount: 4,
                ),
              ),
              const SizedBox(height: 20),
              CustomSectionTitle(title: 'Top Services'),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    ServiceItem(serviceImage: serviceAssets[index]),
                itemCount: serviceAssets.length,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
