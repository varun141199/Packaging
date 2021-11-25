import 'package:http/http.dart' as http ;
import 'products.dart';

class Services{
  static const String url = 'https://fakestoreapi.com/products';

  static Future <List<Product>> getProducts() async {
    try {
      final response = await http.get(Uri.parse(url));
      if(200 == response.statusCode){
        final List<Product> products = productsFromJson(response.body);
        return products;
      }else{
        // ignore: deprecated_member_use
        return List.empty();
      }
    }catch(e){
      // ignore: deprecated_member_use
      return List.empty();
    }
  }
}