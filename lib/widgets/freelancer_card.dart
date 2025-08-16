import 'package:flutter/material.dart';

class FreelancerCard extends StatelessWidget {
  final int index;
  const FreelancerCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/avatar$index.png',
            fit: BoxFit.cover,
            width: 80,
            height: 80,
          ),
          Positioned(
            bottom: 0,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              color: Colors.white,
              shadowColor: Colors.black.withOpacity(0.07),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text('Wade Warren'),
                  Text(
                    'Beautician',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(130, 241, 231, 250),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/icons/star.png'),
                        SizedBox(width: 4),
                        Text(
                          '4.9',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
