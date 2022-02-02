import 'package:flutter/material.dart';
import 'package:fruithero/detailsPage.dart';
// import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  int _selectedIndex = 0;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Add function

  //---------------
  final _saved = Set<String>();

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('food'),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              _pushSaved();
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // IconButton(
                //   icon: Icon(Icons.arrow_back_ios),
                //   color: Colors.white,
                //   onPressed: () {},
                // ),
                Container(
                    width: 130.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        // IconButton(
                        //   icon: Icon(Icons.filter_list),
                        //   color: Colors.white,
                        //   onPressed: () {},
                        // ),
                        // IconButton(
                        //   icon: Icon(Icons.search_rounded),
                        //   color: Colors.white,
                        //   onPressed: () {},
                        // )
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Food',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Menu',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0))
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height - 300.0,
                        child: ListView(children: [
                          _buildFoodItem(
                              'assets/plate1.png', 'Salmon bowl', ''),
                          _buildFoodItem(
                              'assets/plate2.png', 'Spring bowl', ''),
                          _buildFoodItem(
                              'assets/plate6.png', 'Avocado bowl', ''),
                          _buildFoodItem('assets/plate5.png', 'Berry bowl', '')
                        ]))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // Container(
                    //   height: 65.0,
                    //   width: 60.0,
                    //   decoration: BoxDecoration(
                    //     border: Border.all(
                    //         color: Colors.grey,
                    //         style: BorderStyle.solid,
                    //         width: 1.0),
                    //     borderRadius: BorderRadius.circular(10.0),
                    //   ),
                    //   child: Center(
                    //     child: Icon(Icons.search, color: Colors.black),
                    //   ),
                    // ),
                    // Container(
                    //   height: 65.0,
                    //   width: 60.0,
                    //   decoration: BoxDecoration(
                    //     border: Border.all(
                    //         color: Colors.grey,
                    //         style: BorderStyle.solid,
                    //         width: 1.0),
                    //     borderRadius: BorderRadius.circular(10.0),
                    //   ),
                    //   child: Center(
                    //     child: Icon(Icons.shopping_basket, color: Colors.black),
                    //   ),
                    // ),
                    // Container(
                    //   height: 65.0,
                    //   width: 120.0,
                    //   decoration: BoxDecoration(
                    //       border: Border.all(
                    //           color: Colors.grey,
                    //           style: BorderStyle.solid,
                    //           width: 1.0),
                    //       borderRadius: BorderRadius.circular(10.0),
                    //       color: Color(0xFF1C1428)),
                    //   child: Center(
                    //       child: Text('Checkout',
                    //           style: TextStyle(
                    //               fontFamily: 'Montserrat',
                    //               color: Colors.white,
                    //               fontSize: 15.0))),
                    // )
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Food Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorite Menu',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal[400],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildFoodItem(String imgPath, String foodName, String price) {
    final alreadySaved = _saved.contains(foodName);

    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsPage(
                    heroTag: imgPath, foodName: foodName, foodPrice: price)));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  child: Row(children: [
                Hero(
                    tag: imgPath,
                    child: Image(
                        image: AssetImage(imgPath),
                        fit: BoxFit.cover,
                        height: 75.0,
                        width: 75.0)),
                SizedBox(width: 10.0),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(foodName,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold)),
                  Text(price,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.0,
                          color: Colors.grey))
                ])
              ])),
              IconButton(
                  icon: Icon(
                      alreadySaved ? Icons.favorite : Icons.favorite_border,
                      color: alreadySaved ? Colors.red : null),
                  // onTap: () {
                  //   savedWords.add(word)
                  // }
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      if (alreadySaved) {
                        _saved.remove(foodName);
                      } else {
                        _saved.add(foodName);
                      }
                    });
                  })
            ],
          )),
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final tiles = _saved.map((String foodName) {
        return ListTile(title: Text(foodName, style: TextStyle(fontSize: 16)));
      });

      final divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return Scaffold(
          appBar: AppBar(title: Text('Saved WordPairs')),
          body: ListView(children: divided));
    }));
  }
}
