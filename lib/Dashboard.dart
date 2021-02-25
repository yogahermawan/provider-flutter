import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/AboutPage.dart';

// import 'package:provider/GalleryWisata.dart';
// import 'package:provider/LokasiWisata.dart';
// import 'package:provider/PortalBerita.dart';
// import 'package:provider/VideoWisata.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Dashboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Image list
  static final List imgList = [
    NetworkImage(
        "https://www.pikniek.com/wp-content/uploads/2017/10/000015-00_wisata-candi-prambanan_kompleks-candi_800x450_cc0-min.jpg"),
    NetworkImage(
        "http://spotunik.com/assets/images/spots/tugu-jogja-20160620160402.jpg"),
    NetworkImage(
        "http://cdn-2.tstatic.net/tribunnews/foto/bank/images/pemandangan-candi-ijo2_20150519_174558.jpg"),
    NetworkImage(
        "https://www.yogyes.com/en/yogyakarta-tourism-object/candi/ijo/1.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: _mediaQueryData.size.width,
              height: 250,
              child: Carousel(
                images: imgList,
                dotBgColor: Colors.transparent,
                dotPosition: DotPosition.bottomLeft,
                boxFit: BoxFit.cover,
                showIndicator: true,
                dotSize: 5,
                autoplay: true,
                autoplayDuration: Duration(milliseconds: 3000),
                onImageTap: (index) {
                  print(imgList[index]);
                },
              ),
            ),
            Container(
              padding: EdgeInsetsDirectional.only(top: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          child: Column(
                            children: <Widget>[
                              SvgPicture.asset(
                                "graphics/home.svg",
                                width: 64,
                                height: 64,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Dashboard",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          onTap: () {
                            print("Dashboard");
                          },
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: Column(
                            children: <Widget>[
                              SvgPicture.asset(
                                "graphics/rss.svg",
                                height: 64,
                                width: 64,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Portal Wisata",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AboutPage(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          child: Column(
                            children: <Widget>[
                              SvgPicture.asset(
                                "graphics/map.svg",
                                height: 64,
                                width: 64,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Lokasi Wisata",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutPage()));
                          },
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: Column(
                            children: <Widget>[
                              SvgPicture.asset(
                                "graphics/video-player.svg",
                                height: 64,
                                width: 64,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Video Wisata",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutPage()));
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          child: Column(
                            children: <Widget>[
                              SvgPicture.asset(
                                "graphics/gallery.svg",
                                height: 64,
                                width: 64,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Galeri Wisata",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutPage()));
                          },
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: Column(
                            children: <Widget>[
                              SvgPicture.asset(
                                "graphics/complain.svg",
                                height: 64,
                                width: 64,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "About Us",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("graphics/bg.jpg"), fit: BoxFit.fill),
                ),
                currentAccountPicture: CircleAvatar(
                  child: Text("A"),
                  backgroundColor: Colors.white,
                ),
                accountName: Text("Admin"),
                accountEmail: Text("admin@example.com")),
            Container(
              padding: EdgeInsetsDirectional.only(start: 20.0, top: 10.0),
              child: Text("Menu Utama"),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text("Dashboard"),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.web),
              title: Text("Profile"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutPage()));
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.map),
            //   title: Text("Lokasi Wisata"),
            //   onTap: () {
            //     Navigator.of(context).pop();
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => AboutPage()));
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.videocam),
            //   title: Text("Video Wisata"),
            //   onTap: () {
            //     Navigator.of(context).pop();
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => AboutPage()));
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.photo_library),
            //   title: Text("Galeri Wisata"),
            //   onTap: () {
            //     Navigator.of(context).pop();
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => AboutPage()));
            //   },
            // ),
            // Divider(
            //   color: Colors.grey,
            //   height: 1,
            // ),
            // Container(
            //   padding: EdgeInsetsDirectional.only(start: 20.0, top: 10.0),
            //   child: Text("Lain-Lain"),
            // ),
            // ListTile(
            //   leading: Icon(Icons.person),
            //   title: Text("Tentang Pengembang"),
            //   onTap: null,
            // ),
            // ListTile(
            //   leading: Icon(Icons.power_settings_new),
            //   title: Text("Keluar"),
            //   onTap: () {
            //     SystemNavigator.pop();
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
