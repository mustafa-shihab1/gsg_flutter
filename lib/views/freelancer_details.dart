import 'package:flutter/material.dart';
import 'package:gsg_flutter/data/freelancer_model.dart';

import '../widgets/custom_arrow_back.dart';

class FreelancerDetails extends StatelessWidget {
  const FreelancerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final FreelancerModel freelancerModel =
        ModalRoute.of(context)!.settings.arguments as FreelancerModel;
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: 'freelancerImage-${freelancerModel.name}',
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.asset(freelancerModel.image, fit: BoxFit.cover),
            ),
          ),
          CustomArrowBack(),
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            maxChildSize: 1.0,
            minChildSize: 0.6,
            builder: (context, scrollController) {
              return Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 25),
                        child: Center(
                          child: Container(
                            height: 5,
                            width: 35,
                            color: Colors.black12,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            freelancerModel.name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                freelancerModel.rating.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 4),

                              Icon(Icons.star, color: Colors.deepPurpleAccent),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        freelancerModel.jobTitle,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          height: 1.8,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
