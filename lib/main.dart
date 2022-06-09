import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex=0;
  List<Widget> _widgetOptions= <Widget> [
    MarketPage(title: ''),
    PortFolioPage(title: '')

  ];
  void onindexTap (int index) {
    setState(() {
      _currentIndex= index;
    });
  }

  bool isLoading= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Center(child: Text('Stockzo'))),
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        fixedColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              label: "Market",
              backgroundColor: Colors.blueGrey, icon: Icon(Icons.point_of_sale_sharp)
          ),
          BottomNavigationBarItem(

              label: 'Portfolio',
              backgroundColor: Colors.blueGrey, icon: Icon(Icons.point_of_sale)
          ),
        ],
        currentIndex: _currentIndex,
        onTap: onindexTap,
      ),
    );
  }
}

class MarketPage extends StatefulWidget {
  MarketPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Column(
        children: [
          Container(
            color: Colors.blueGrey,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Stocks', style: TextStyle(color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Mutual Funds', style: TextStyle(color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'ETFs', style: TextStyle(color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'F&O', style: TextStyle(color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),

                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            color: Colors.blueGrey,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Tata Power', style: TextStyle(color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Rs.250', style: TextStyle(color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'quantity', style: TextStyle(color: Colors.white),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),

                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                          child: GestureDetector(
                            onTap: () {
                              quantity>0?
                              setState(() {
                                quantity= quantity-1;
                              })
                                  : ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text('False Request')));
                            } ,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '-', style: TextStyle(color: Colors.white),
                                ),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                ),

                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                quantity.toString(), style: TextStyle(color: Colors.white),
                              ),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),

                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                quantity= quantity+1;
                              });
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '+', style: TextStyle(color: Colors.white),
                                ),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                ),

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                        child: GestureDetector(
                          onTap: () async {
                            await FirebaseFirestore.instance.collection("Stocks")
                                .add({
                              'Stock': 'Tata Power',
                              'Quantity': quantity,
                              'price': (250 * quantity).toString()
                            });
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text('Stock Purchased quantity ' + quantity.toString()+ ' at price '+ (quantity * 250).toString())));
                            setState(() {
                              quantity= 0;
                            });
                            },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'BUY', style: TextStyle(color: Colors.white),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              border: Border.all(
                                color: Colors.white,
                              ),

                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class PortFolioPage extends StatefulWidget {
  PortFolioPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _PortFolioPageState createState() => _PortFolioPageState();
}

class _PortFolioPageState extends State<PortFolioPage> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Column(
        children: [

          SizedBox(
            height: 30,
          ),
          StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Stocks')

        .snapshots(),
    builder:
    (context, snapshot) {
    if (snapshot.hasError) {
    return Text('Something went wrong');
    }

    if (snapshot.connectionState == ConnectionState.waiting) {
    return Center(child: CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlue[800]!)));
    }
    return ListView(
        shrinkWrap: true,

      children: snapshot.data!.docs.map((doc)
      {
    return Container(
    color: Colors.blueGrey,
    child: Row(
    children: [
    Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
    child: Container(
    child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Text(
    doc['Stock'], style: TextStyle(color: Colors.white),
    ),
    ),
    decoration: BoxDecoration(
    border: Border.all(
    color: Colors.white,
    ),

    ),
    ),
    ),
    Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
    child: Container(
    child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Text(
    'Quantity', style: TextStyle(color: Colors.white),
    ),
    ),
    decoration: BoxDecoration(
    border: Border.all(
    color: Colors.white,
    ),

    ),
    ),
    ),
    Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
    child: Container(
    child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Text(
    doc['Quantity'].toString(), style: TextStyle(color: Colors.white),
    ),
    ),
    decoration: BoxDecoration(
    border: Border.all(
    color: Colors.white,
    ),

    ),
    ),
    ),
    Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
    child: Container(
    child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Text(
    doc['price'].toString(), style: TextStyle(color: Colors.white),
    ),
    ),
    decoration: BoxDecoration(
    border: Border.all(
    color: Colors.white,
    ),

    ),
    ),
    ),

    Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10,),
    child: GestureDetector(
    onTap: () async {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(
    'Stock Sold quantity ' + doc['Quantity'].toString() +
    ' at price ' + doc['price'].toString())));

      await FirebaseFirestore.instance.collection("Stocks")
          .doc(doc.id).delete();
    },
    child: Container(
    child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Text(
    'SELL', style: TextStyle(color: Colors.white),
    ),
    ),
    decoration: BoxDecoration(
    color: Colors.redAccent,
    border: Border.all(
    color: Colors.white,
    ),

    ),
    ),
    ),
    ),
    ],
    ),
    );
    }).toList(),
    );
    }),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
