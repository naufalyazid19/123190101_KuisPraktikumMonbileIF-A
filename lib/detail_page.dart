import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailPage extends StatelessWidget {
  final String image;
  final String name;
  final String desc;
  final int price;
  final double ratings;
  final int reviewer;
  final int sold;

  const DetailPage({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.desc,
    required this.ratings,
    required this.reviewer,
    required this.sold,
    //this.price = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Menu'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(40),
        child: Center(
          child: Column(
            children: [
              Image.network(image),
              SizedBox(height: 16,),
              Text(name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16,),
              Text(desc,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 16,),
              Text("Harga : ${price}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16,),
              Text("Ratings : ${ratings}"),
              Text("Reviewer : ${reviewer}"),
              Text("Sold : ${sold}"),
            ],
          ),
        ),
      ),
    );
  }
}
