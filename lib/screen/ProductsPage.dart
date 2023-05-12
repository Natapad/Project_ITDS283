import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vibesshoppp/screen/CartPage.dart';
import 'package:vibesshoppp/service/api.dart';
import 'package:vibesshoppp/widget/Product_Appbar.dart';
import 'package:http/http.dart' as http;
import 'package:vibesshoppp/screen/DetailScreen.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({Key? key}) : super(key: key);

  @override
  _ApiPageState createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  late Future<List<Api>> _apiFuture;
  TextEditingController _searchController = TextEditingController();
  List<Api> _searchResult = [];

  @override
  void initState() {
    super.initState();
    _apiFuture = ApiCall().getData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    final apiList = await _apiFuture;
    apiList.forEach((api) {
      if (api.nameTshirt.toLowerCase().contains(text.toLowerCase())) {
        _searchResult.add(api);
      }
    });
    setState(() {});
  }

  void _navigateToDetailScreen(Api api) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(api: api),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          controller: _searchController,
          onChanged: _onSearchTextChanged,
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(
              color: Colors.white,
            ),
            suffixIcon: Icon(Icons.search),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return CartPage();
          }),
        ),
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_cart),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Api>>(
              future: _apiFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Api> apiList = snapshot.data!;
                  if (_searchController.text.isNotEmpty) {
                    apiList = _searchResult;
                  }
                  return ListView.builder(
                    itemCount: apiList.length,
                    itemBuilder: (context, index) {
                      Api api = apiList[index];
                      return GestureDetector(
                        onTap: () {
                          // Navigate to a new screen when the ListTile is tapped
                          _navigateToDetailScreen(api);
                        },
                        child: Card(
                          child: ListTile(
                            contentPadding: EdgeInsets.all(8.0),
                            leading: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(api.imageTshirt),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  api.nameTshirt,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  api.priceTshirt,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  // Return a blank Container widget if the snapshot does not have data
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
