import 'package:flutter/material.dart';
import 'login_page.dart';
import 'detail_page.dart';

import 'model/menu.dart';

class HomePage extends StatefulWidget{
  final String username;
  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Menu Makanan"),
        actions: <Widget>[

          IconButton(icon: new Icon(Icons.logout, color: Colors.white), onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) {
                return LoginPage();
              }), (route) => false,
            );
          },),

        ],
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: _createListCard(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'KERANJANG',
        child: const Icon(Icons.add_shopping_cart),
      ),
    );



  }

  Widget _createListCard() {
    var dataMovie = getAllMenu();

    return ListView.separated(
      itemBuilder: (context, index) {
        return _createCard(dataMovie[index], context);
      },
      itemCount: dataMovie.length,
      separatorBuilder: (context, index) {
        return Container(
          color: Colors.white,
          height: 1,
          margin: EdgeInsets.symmetric(vertical: 4),
        );
      },
    );
  }

  Widget _createCard(Menu data, BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailPage(image: data.image, name: data.name, desc: data.desc, price: data.price, ratings: data.ratings,
            reviewer: data.reviewer, sold: data.sold,);
          }));
        },
        child: Container(
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Image.network(data.image),
              ),
              Expanded(
                flex: 3,
                child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Text(data.name)),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                    height: 50,
                    child: Image.network("https://cdn-icons-png.flaticon.com/512/1965/1965706.png")
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}