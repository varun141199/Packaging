import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ProductPage extends StatefulWidget {
  const ProductPage(
    { Key? key, required this.title, required this.desc, required this.imgurl, required this.price }) : super(key: key);

  final String? title, desc, imgurl;
  final int? price;

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        backgroundColor: Colors.red,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 40),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.network(widget.imgurl!, height: 300,),
                  ),
                    
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Container(
                      child: Text(widget.title!, style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      width: 340,
                      child: Text("Price: \$" + widget.price!.toString(), textAlign: TextAlign.left, style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),),
                    ),
                  ),
                    
                  
                    
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                    child: Column(
                      children: [
                        Container(
                          width: 340,
                          child: Text("Product Description", style: TextStyle(fontSize: 22.5, fontWeight: FontWeight.w700), textAlign: TextAlign.left,)),
                          SizedBox(height: 10,),
                        Text(widget.desc!, style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}

