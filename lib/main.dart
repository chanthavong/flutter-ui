import 'package:flutter/material.dart';
import 'package:flutter_application_test/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Config.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: Config.appName),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget titleText = const Text(
    'It\'s as Easy as 1, 2, 3!',
    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  );

  Widget profileImage = ClipRRect(
    borderRadius: BorderRadius.circular(12.0),
    child: Image.network('https://randomuser.me/api/portraits/women/49.jpg',
        width: 40, height: 40),
  );

  Widget boxSearch = const TextField(
    decoration: InputDecoration(
      hintText: 'Search',
      prefixIcon: Icon(Icons.search),
      fillColor: Color.fromARGB(221, 243, 241, 238),
      filled: true,
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        borderSide: BorderSide.none,
      ),
    ),
  );

  Widget tapItem({String title = 'Item', bool isActive = false}) => Container(
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: isActive
                ? Colors.black
                : const Color.fromARGB(255, 168, 168, 168),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: isActive
            ? const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Config.secondaryColor,
                    width: 2,
                  ),
                ),
              )
            : null,
      );

  Widget listItem(
          {String title = 'Title',
          String subTitle = '',
          bool isActive = false}) =>
      (Container(
        margin: isActive ? const EdgeInsets.all(10) : null,
        padding: isActive
            ? const EdgeInsets.symmetric(vertical: 20, horizontal: 0)
            : null,
        decoration: isActive
            ? BoxDecoration(
                color: Config.primaryColor,
                borderRadius: BorderRadius.circular(14.0),
              )
            : null,
        child: ListTile(
          contentPadding: isActive
              ? const EdgeInsets.symmetric(vertical: 0, horizontal: 10)
              : null,
          textColor: isActive ? Colors.white : Colors.black,
          title: Text(title),
          subtitle: Text(
            subTitle,
            style: const TextStyle(color: Color.fromARGB(255, 194, 194, 194)),
          ),
          trailing: !isActive
              ? RotatedBox(
                  quarterTurns: 0,
                  child: Icon(Icons.keyboard_arrow_down,
                      color: isActive ? Colors.white : Colors.black),
                )
              : null,
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(14.0),
            child: Container(
              width: 60.0,
              height: 60.0,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color.fromARGB(141, 237, 156, 250),
                  Color.fromARGB(255, 200, 21, 220),
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 1.0),
              )),
            ),
          ),
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      titleText,
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Stack(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: profileImage,
                          ),
                          const Positioned(
                            child: CircleAvatar(
                              radius: 7,
                              backgroundColor: Colors.red,
                            ),
                          )
                        ]),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  boxSearch,
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      tapItem(title: 'Features', isActive: true),
                      const SizedBox(width: 20),
                      tapItem(title: 'Payment'),
                    ],
                  )
                ],
              ),
            ),
            listItem(title: 'Create Your Accout'),
            listItem(
                title: 'Link Your Cards',
                subTitle: 'Hello world',
                isActive: true)
          ],
        ),
      ),
    );
  }
}
