import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>  {
  AnimationController controller;


  BorderRadiusGeometry _bR = BorderRadius.circular(8);
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }
  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text("No Mundo das Luas - Fotos Salvas"),
                  leading: GestureDetector(
                      onTap: () {

                      },
                      child: Icon(
                        Icons.arrow_back, size: 30,  // add custom icons also
                      )),
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Color(0xFF000000),
                              Color(0XFF000000),
                            ])
                    ),
                  ),
                  bottom: TabBar(
                    indicatorColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(icon: Icon(Icons.show_chart, color: Colors.white,size: 40.0)),
                      Tab(icon: Icon(Icons.group,color: Colors.white, size: 40.0))
                    ],
                  ),

                ),

                body: TabBarView(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row()
                      ),
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Em Breve")
                      )
                    ]
                )
            )
        )
    );

    //
    //


  }}
class ListPage extends StatefulWidget {

  ListPage();
  @override
  _ListPageState createState() => _ListPageState();
}
//
//
//
class _ListPageState extends State<ListPage> {
  //
  Future getPosts() async {
    /*
    FirebaseFirestore db = FirebaseFirestore.instance;
    QuerySnapshot qn = await
    db.collection("usuarios")
        .get();
    return qn.docs;
         */
    CollectionReference usuarios = FirebaseFirestore.instance.collection('usuarios');
    QuerySnapshot qn = await
        usuarios.get();
        return qn.docs;

  }


  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner: false;

    return Container(
        child: FutureBuilder(
            future: getPosts(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text("Loadding ......"),
                );
              }
              else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      return Container(
                          padding: EdgeInsets.all(20),
                          width: 200,
                          height: 100,
                          color: Colors.black,

                          child: ListTile(
                              leading:
                              Icon(FontAwesomeIcons.user,color: Colors.deepOrange),
                              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white,),
                              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                              title:
                             Text(snapshot.data[index].id,

                                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                              subtitle: Text(" "),
                              onTap: () {

                                }

                          )
                      );

                    }

                );
              }
            }
        )
    );
  }
}
//
class DetailPage extends StatefulWidget {

  final DocumentSnapshot post;
  DetailPage({this.post});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          title: Text("codVenda"),
          subtitle: Text("email"),

        ),
      ),
    );
  }
}
