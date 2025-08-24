import 'package:flutter/material.dart';

class ServiceProviderCard extends StatelessWidget {
  const ServiceProviderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/user_pic.png'),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Miss Zachary Will',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Beautician',
                  style: TextStyle(fontSize: 12, color: Color(0xFF827BEB)),
                ),
                Text(
                  'Doloribus saepe aut necessit qui\nnon qui.',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xFF6B6B6B),
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 6,
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
                    SizedBox(width: 4),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF827BEB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Book Now',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
