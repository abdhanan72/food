// import 'package:flutter/material.dart';

// class DetailScreen extends StatelessWidget {
//   DetailScreen({super.key, required this.prode});

//   var prode;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Text('Potato'),
//         automaticallyImplyLeading: false,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top:20),
//               child: Container(
//                 width: 300,
//                 height: 300,
//                 child: Image.network(
//                   prode['image'].toString(),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Text(
//               // ignore: avoid_dynamic_calls
//               prode['productName'].toString(),
//               style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               // ignore: avoid_dynamic_calls
//               prode['description'].toString(),
//               style: const TextStyle(fontWeight: FontWeight.w500),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,

//               children: [
//                 ElevatedButton.icon(
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xFFF50514),),
//                     onPressed: () {},
//                     icon: Icon(Icons.currency_rupee),
//                     label: Text(prode['price'].toString()),),

//                     ElevatedButton.icon(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xFFF50514),),
//                       onPressed: () {

//                     }, icon:Icon(Icons.shopping_bag), label: Text('ADD TO CART'))

//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

import 'dart:ui';

import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key, required this.prode});

  var prode;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red.shade400,
        body: Stack(alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Image.network(prode['image'].toString()),
            ),
            buttoArrow(context),
            scroll(),
          ],
        ),
      ),
    );
  }

  Padding buttoArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 55,
          width: 55,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
          
        ),
      ),
    );
  }

  DraggableScrollableSheet scroll() {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      // ignore: avoid_redundant_argument_values
      maxChildSize: 1,
      minChildSize: 0.6,
      builder: (context, scrollController) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal:10),
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Container(
                height: 5,
                width: 35,
                color: Colors.black,
              )],),

              

              Padding(
                padding: const EdgeInsets.only(left:10,top: 10),
                child: Text(prode['productName'].toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),

              Padding(
                padding: const EdgeInsets.only(left:10,top: 10),
                child: Text(prode['description'].toString(),style: TextStyle(fontSize: 16,fontStyle: FontStyle.italic),),

              ),
              SizedBox(height: 100,),

              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [

                  ElevatedButton.icon(
                  style:
                  
                   ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFFF50514)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(color: Colors.red)
    )
  )
),
                  onPressed: () {
                  
                }, icon:Icon(Icons.currency_rupee_sharp), label:Text(prode['price'].toString())),

       

                SizedBox(width: 40,),

                ElevatedButton.icon(
                  style:
                  
                   ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFFF50514)),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: BorderSide(color: Colors.red)
    )
  )
),
                  onPressed: () {
                  
                }, icon:Icon(Icons.shopping_bag), label:Text('Add to Cart'))
              ],)



            ],),
          ),
        );
      },
    );
  }
}
