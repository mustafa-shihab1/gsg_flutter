import 'package:flutter/material.dart';
import 'package:gsg_flutter/data/freelancer_model.dart';

import '../routes.dart';
import '../widgets/custom_banner.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/custom_section_title.dart';
import '../widgets/freelancer_card.dart';
import '../widgets/service_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final serviceAssets = [
    'assets/images/service1.png',
    'assets/images/service2.png',
    'assets/images/service3.png',
  ];
  final List<FreelancerModel> freelancers = [
    FreelancerModel(
      name: 'Mustafa Sh',
      image: 'assets/images/avatar0.png',
      jobTitle: 'Software Eng.',
      rating: 4.8,
    ),
    FreelancerModel(
      name: 'Khulod Sa',
      image: 'assets/images/avatar1.png',
      jobTitle: 'Doctor',
      rating: 4.3,
    ),
    FreelancerModel(
      name: 'Khaked Rz',
      image: 'assets/images/avatar2.png',
      jobTitle: 'Programmer',
      rating: 3.5,
    ),
    FreelancerModel(
      name: 'Waleed Jr',
      image: 'assets/images/avatar3.png',
      jobTitle: 'Ux/Ui Designer',
      rating: 3.9,
    ),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    final String? username =
        ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.login);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
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
              Text('Hello $username'),
              CustomSearchBar(),
              CustomBanner(),
              const SizedBox(height: 20),
              CustomSectionTitle(title: 'Top Rated Freelancers'),
              const SizedBox(height: 10),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => FreelancerCard(
                    index: index,
                    freelancerModel: freelancers[index],
                  ),
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: index,
        selectedItemColor: Colors.deepPurpleAccent,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
