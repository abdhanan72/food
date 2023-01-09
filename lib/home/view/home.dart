import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:food/detail/view/detail.dart';
import 'package:searchfield/searchfield.dart';

class Home extends StatelessWidget {
  Home({super.key});

  CollectionReference productData =
      FirebaseFirestore.instance.collection('Product Details');

  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<String> imageList = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0kHSCMhwDKZgtdoK40Hz88D5noLl1xupZ2g&usqp=CAU',
    'https://thumbs.dreamstime.com/z/food-delivery-service-phone-banner-free-fast-isometric-d-pizza-box-map-pointer-houses-smartphone-screen-stay-home-buy-online-178367909.jpg',
    'https://www.shopickr.com/wp-content/uploads/2015/06/dominos-pizza-buy-1-get-1-free-pizza-india-buy1get1-banner.jpg',
    'https://img.freepik.com/premium-psd/buy-1-get-1-free-delicious-pizza-instagram-post-banner-square-template_609989-737.jpg?w=2000'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                cursorColor: const Color(0xFFF50514),
                decoration: InputDecoration(
                  hintText: 'Search your favourite dishes',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFFF50514),
                  ),
                  fillColor: Colors.grey.shade300,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10)),
                width: 600,
                height: 80,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(Icons.price_change),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Offers upto 60% off',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Hot Deals,Flat Offers & more',
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade600),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade600,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: CarouselSlider(
                  items: imageList
                      .map((e) => ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.network(
                                  e,
                                  height: 200,
                                  width: 100,
                                  fit: BoxFit.fill,
                                )
                              ],
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                      autoPlay: true,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                      height: 150)),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 600,
              height: 500,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),),
                  child: Column(
                    children: [
                      ClipRRect(
                        
                        borderRadius: BorderRadius.circular(40),
                        child: Image.network(
                          'https://img.freepik.com/free-photo/flat-lay-batch-cooking-composition_23-2148765597.jpg?w=2000',
                          height: 250,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          'Fantastic Food And Where To Find Them',
                          
                          style: TextStyle(color: Color(0xFFF50514),
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.only(right:200),
              child: Text('All Dishes',style: TextStyle(color: Color(0xFFF50514),fontSize: 30,fontWeight: FontWeight.bold),),
            ),
            StreamBuilder(
              stream: productData.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data!.docs);
                  final productItems = snapshot.data!.docs;

                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
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
          ],
        ),
      ),
    );
  }
}
