import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HNG User',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(80, 120, 255, 1),
        accentColor: Color.fromRGBO(132, 209, 241, 1),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isEmpty = false;
  bool _showText = false;
  late TextEditingController _name;
  late TextEditingController _phone;
  late TextEditingController _bio;

  @override
  void initState() {
    _name = new TextEditingController();
    _phone = new TextEditingController();
    _bio = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _bio.dispose();
    super.dispose();
  }

  void showText() {
    if (!_showText) {
      Future.delayed(Duration(milliseconds: 500)).then((value) {
        setState(() {
          _showText = !_showText;
        });
      });
    } else {
      setState(() {
        _showText = !_showText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () async => launch('https://internship.zuri.team/'),
            child: Text('Visit Zuri'),
          ),
          SizedBox(width: 15),
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset(
                'assets/images/hng-logo.png',
                height: 50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListView(
              children: [
                Text(
                  "Add Personal Info",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 60, bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: _name,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Full name',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 60, bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Phone',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        controller: _phone,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Phone number',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 60, bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Personal Info',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextField(
                        minLines: 4,
                        maxLines: null,
                        controller: _bio,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Add your bio-data',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: !_isEmpty ? 60 : MediaQuery.of(context).size.width * .95,
              padding: EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.black38,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  if (_showText)
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset(
                          'assets/images/zuri.png',
                          fit: BoxFit.contain,
                          width: 150,
                        ),
                      ),
                    ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          showText();
                          setState(() {
                            _isEmpty = !_isEmpty;
                          });
                        },
                        icon: Icon(
                          _showText
                              ? Icons.arrow_forward_ios
                              : Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            if (_showText)
                              Text(
                                'User Input Detail',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            SizedBox(height: 15),
                            if (_showText)
                              if (_name.text.isNotEmpty)
                                Text(
                                  'Name:',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            if (_showText)
                              if (_name.text.isNotEmpty)
                                Text(
                                  _name.text,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                            SizedBox(height: 15),
                            if (_showText)
                              if (_phone.text.isNotEmpty)
                                Text(
                                  'Phone:',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            if (_showText)
                              if (_phone.text.isNotEmpty)
                                Text(
                                  _phone.text,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                            SizedBox(height: 15),
                            if (_showText)
                              if (_bio.text.isNotEmpty)
                                Text(
                                  'Bio-data:',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            if (_showText)
                              if (_bio.text.isNotEmpty)
                                Text(
                                  _bio.text,
                                  maxLines: null,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
