import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:natraj_packaging/getdata/products.dart';
import 'package:natraj_packaging/getdata/service.dart';
import 'package:natraj_packaging/screens/login.dart';
import 'package:natraj_packaging/screens/product_page.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Product>? _products;
  bool? _loading;
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void initState(){
    super.initState();
    _loading = true;
    Services.getProducts().then((products) {
      setState(() {
        _products = products;
        _loading = false;
      });
      
    });
  }

  @override
  Widget build(BuildContext context) {

    //AuthMethods authMethods = new AuthMethods();
    final _auth = FirebaseAuth.instance;

    logout() {
      _auth.signOut();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    }

    return AdvancedDrawer(
      backdropColor: Colors.redAccent.shade100,
      controller: _advancedDrawerController,
      childDecoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      
      child: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        // ignore: deprecated_member_use
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text("Natraj Packaging", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),),
        leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 225),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu, size: 35, color: Colors.white,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
      ),
      body: Container(
        child: _loading! ? Center(child: CircularProgressIndicator(),) : GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: null == _products ? 0 : _products!.length,
          itemBuilder: (context, index){
          Product product = _products![index];
          return Padding(
            padding: const EdgeInsets.only(top: 8.5, bottom: 8.5, left: 10, right: 10),
            child: BlogTile(
              imgurl:(product.image) , title:(product.title), price:(product.price!.toInt()), 
              desc: (product.description), ),
          );
        }),
      ),
    ),

  drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    width: 225.0,
                    height: 225.0,
                    margin: const EdgeInsets.only(
                      top: 24.0,
                      bottom: 64.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assests/logoplaceholder.jpg', fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                  },
                  leading: Icon(Icons.account_circle_rounded, color: Colors.white, size: 30),
                  title: Text('Profile', style: TextStyle(color: Colors.white, fontSize: 30)),
                ),
                ListTile(
                  onTap: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
                  },
                  leading: Icon(Icons.settings, color: Colors.white, size: 30),
                  title: Text('Settings', style: TextStyle(color: Colors.white, fontSize: 30),),
                ),
                ListTile(
                  onTap: () {
                    logout();
                  },
                  leading: Icon(Icons.logout, color: Colors.white, size: 30),
                  title: Text('Logout', style: TextStyle(color: Colors.white, fontSize: 30)),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}

class BlogTile extends StatelessWidget {
  final String? title, desc, imgurl;
  final int? price;
  const BlogTile(
    { Key? key, required this.imgurl, required this.title, required this.price, this.desc,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector
    ( onTap: (){
      Navigator.push(context, MaterialPageRoute(
        builder: (context)=>
        ProductPage(title: title, desc: desc, price: price, imgurl: imgurl)));
    },
      child: Container(
        height: 600,
        width: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.red.shade100),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        //margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.network(imgurl!, height: 80),
              SizedBox( height: 5), 
              Text(title!, style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.black,
              ),
              maxLines: 2, textAlign: TextAlign.center,
              ),
              SizedBox( height: 5), 
              Text("Price: \$" + price!.toString(), style: TextStyle(
                  fontSize: 17,
                  color: Colors.black),
                ),
              /*Text(desc!, style: TextStyle(
                  fontSize: 17,
                  color: Colors.black),
                ),*/
            ],
          ),
        ),
      ),
    );
  }
}