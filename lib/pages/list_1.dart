import 'package:flutter/material.dart';

class Homie extends StatelessWidget {
  Homie({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product List")),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(3.0, 12.0, 3.0, 12.0),
        children: <Widget>[
          ProductBox(
              name: "iPhone",
              description: "iPhone is the top branded phone ever",
              price: 55000,
              image: "tokugawa.png"),
          ProductBox(
              name: "Android",
              description: "Android is a very stylish phone",
              price: 10000,
              image: "tokugawa.png"),
          ProductBox(
              name: "Tablet",
              description: "Tablet is a popular device for official meetings",
              price: 25000,
              image: "tokugawa.png"),
          ProductBox(
              name: "Laptop",
              description: "Laptop is most famous electronic device",
              price: 35000,
              image: "tokugawa.png"),
          ProductBox(
              name: "Desktop",
              description: "Desktop is most popular for regular use",
              price: 10000,
              image: "tokugawa.png"),
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox(
      {Key? key,
      required this.name,
      required this.description,
      required this.price,
      required this.image})
      : super(key: key);
  late final String name;
  late final String description;
  late final int price;
  late final String image;

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 110,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("assets/" + image),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(this.name,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(this.description),
                    Text("Price: " + this.price.toString()),
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
