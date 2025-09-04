import 'package:flutter/material.dart';
import 'package:gsg_flutter/data/freelancer_model.dart';

import '../routes.dart';

class FreelancerCard extends StatelessWidget {
  final int index;
  final FreelancerModel freelancerModel;
  const FreelancerCard({
    super.key,
    required this.index,
    required this.freelancerModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        Routes.freelancerDetails,
        arguments: freelancerModel,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Stack(
          children: [
            Hero(
              tag: 'freelancerImage-${freelancerModel.name}',
              child: Container(
                clipBehavior: Clip.antiAlias,
                width: 80,
                height: 80,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(freelancerModel.image, fit: BoxFit.cover),
              ),
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
                    Text(freelancerModel.name, style: TextStyle(fontSize: 13)),
                    Text(
                      freelancerModel.jobTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
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
                            freelancerModel.rating.toString(),
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
      ),
    );
  }
}
