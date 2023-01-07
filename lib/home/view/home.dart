import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:food/detail/view/detail.dart';

class Home extends StatelessWidget {
  Home({super.key});

  CollectionReference productData =
      FirebaseFirestore.instance.collection('Product Details');

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: productData.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data!.docs);
            final productItems = snapshot.data!.docs;

            return Padding(
              padding: const EdgeInsets.all(8),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 250,
                ),
                itemCount: productItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(prode: productItems[index]),
                        )),
                    child: Card(
                      shadowColor: Color(0xFFF50514),
                      elevation: 10,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Image.network(
                            productItems[index]['image'].toString(),
                            height: 150,
                            width: 150,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            productItems[index]['productName'].toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                productItems[index]['price'].toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const Icon(Icons.currency_rupee_sharp),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(color: Colors.red),
            );
          }
        },
      ),
    );
  }
}
