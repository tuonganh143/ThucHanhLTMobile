import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<String> products = [
    'SamSung A80',
    'Sony 1 mark 5',
    'Iphone x',
  ];
  final List<String> Linkproducts = [
    'https://cdn2.cellphones.com.vn/x/media/catalog/product/6/3/636907526460907165_samsung-galaxy-a80-den-1_1_1_1_2.jpg',
    'https://cdn.mobilecity.vn/mobilecity-vn/images/2023/06/w300/sony-xperia-1-v-trang.jpg.webp',
    'https://cdn.tgdd.vn/Products/Images/42/114115/iphone-x-64gb-hh-600x600.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách sản phẩm'),
      ),
      body:

      ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.network(Linkproducts[index],
              width: 200,
              height: 150,),
            title: Text(products[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: products[index], linkImage: Linkproducts[index], ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final String product;
  final String linkImage;
  ProductDetailScreen({required this.product, required this.linkImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết sản phẩm'),
      ),
      body: Center(
        child: Container(
            alignment: Alignment.center,
            width: 390,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  '$linkImage',
                  width: 400,
                  height: 400,
                ),
                SizedBox(
                  height: 20,
                ),
                Text('$product'),
              ],
            )),


      ),
    );
  }
}