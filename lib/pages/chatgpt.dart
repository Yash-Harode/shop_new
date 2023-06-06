import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/models/product.dart';
import 'package:shop/pages/LoginPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> products = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  void getProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedProducts = prefs.getStringList('products') ?? [];
    setState(() {
      products = savedProducts
          .map((product) => Product.fromMap(jsonDecode(product)))
          .toList();
    });
  }

  void saveProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> productList =
        products.map((product) => product.toMap()).cast<String>().toList();
    await prefs.setStringList('products', productList);
  }

  void addProduct(Product product) {
    setState(() {
      products.add(product);
      saveProducts();
    });
  }

  void deleteProduct(Product product) {
    setState(() {
      products.remove(product);
      saveProducts();
    });
  }

  List<Product> searchProducts(String query) {
    return products
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      color: const Color.fromARGB(255, 135, 128, 128),
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                    ),
                  ),
                  // const SizedBox(
                  //   width: 260,
                  // ),
                  // Container(
                  //   alignment: Alignment.topRight,
                  //   child: IconButton(
                  //     color: const Color.fromARGB(255, 135, 128, 128),
                  //     icon: const Icon(Icons.search),
                  //     onPressed: () {},
                  //   ),
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: const InputDecoration(
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: const Text(
                "Hi-Fi Shop & Service",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Audio shop on Rustaveli Ave 57",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "This shop offers both product and services",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 0.5,
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 10,
              ),
              child: Row(
                children: [
                  Container(
                    child: const Text(
                      "Products",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 200,
                  ),
                  Container(
                    child: const Text(
                      "Show All",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        alignment: Alignment.topLeft,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            scale: 10.0,
                            image: AssetImage("assets/image/headphone1.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text("Sony\n\$1000"),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        alignment: Alignment.topLeft,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            scale: 10.0,
                            image: AssetImage("assets/image/headphone2.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text("Zebronics\n    \$1800"),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 10,
              ),
              child: Row(
                children: [
                  Container(
                    child: const Text(
                      "Accessories",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 172,
                  ),
                  Container(
                    child: const Text(
                      "Show All",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        alignment: Alignment.topLeft,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            scale: 10.0,
                            image: AssetImage("assets/image/apple.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text("Lightning Cable\n\$100"),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        alignment: Alignment.topLeft,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            scale: 10.0,
                            image: AssetImage("assets/image/jaba.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text("Double Audio Jack\n    \$180"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
              width: 500,
              child: Expanded(
                child: ListView.builder(
                  itemCount: searchController.text.isNotEmpty
                      ? searchProducts(searchController.text).length
                      : products.length,
                  itemBuilder: (context, index) {
                    Product product = searchController.text.isNotEmpty
                        ? searchProducts(searchController.text)[index]
                        : products[index];
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text(
                        'Price: \$${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => deleteProduct(product),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddProductPage(addProduct),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddProductPage extends StatefulWidget {
  final Function(Product) addProduct;

  AddProductPage(this.addProduct);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: imageController,
              decoration: const InputDecoration(labelText: 'Image'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                double price = double.parse(priceController.text);
                String image = imageController.text;

                if (name.isNotEmpty && price > 0) {
                  widget.addProduct(Product(name, price, image));
                  Navigator.pop(context);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Invalid Input'),
                      content: const Text(
                          'Please enter a valid product name and price.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
