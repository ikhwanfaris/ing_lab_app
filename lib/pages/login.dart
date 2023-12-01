import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ing_lab_app/pages/contact.dart';
import 'package:ing_lab_app/pages/custom_widget.dart';
import 'package:ing_lab_app/utils/constant.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = '';
  String _password = '';
  bool _isVisible = false;
  final _formKey = GlobalKey<FormState>();
  var dataMap = <String, double>{
    "Hot": 35,
    "Warm": 35,
    "Cold": 90,
  };

  var colorList = [
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  @override
  void initState() {
    super.initState();
    initApp();
  }

  initApp() {
    var totalData = dataMap.values;
    var result = totalData.reduce((sum, element) => sum + element);
    if (kDebugMode) {
      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0, 0.4, 1],
            colors: [
              Colors.white,
              Color.fromRGBO(217, 245, 255, 1),
              Colors.white,
              // Color.fromRGBO(217, 245, 255, 1),
              // Colors.white,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // CustomWidget(
                //   title: "Prospect by Status",
                //   innerTitle: "Total Prospects",
                //   mapData: dataMap,
                //   listColor: colorList,
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(217, 245, 255, 1),
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 50, horizontal: 110),
                        child: Image.asset(
                          'assets/flutter.png',
                          width: 50,
                          height: 10,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome To Flutter",
                  style: styles.heading1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Please enter your details to continue",
                  style: styles.heading2,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: "User Name",
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'This field cannot be left blank';
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      _username = val;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'This field cannot be left blank';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.done,
                  obscureText: !_isVisible,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVisible = !_isVisible;
                        });
                      },
                      icon: _isVisible
                          ? const Icon(
                              Icons.lock_open,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                    ),
                    enabled: true,
                  ),
                  onChanged: (val) {
                    setState(() {
                      _password = val;
                    });
                  },
                ),
                GestureDetector(
                  onTap: () {},
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Forgot Password ?",
                        style: styles.heading3,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 4,
                    backgroundColor: const Color.fromRGBO(72, 216, 255, 1),
                    padding: const EdgeInsets.all(20.0),
                    textStyle: const TextStyle(fontSize: 20),
                    maximumSize: const Size(double.infinity, 70),
                  ),
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    var homeRoute =
                        MaterialPageRoute(builder: (_) => const ContactPage());
                    // Navigator.of(context)
                    //     .pushAndRemoveUntil(homeRoute, (route) => false);
                    Navigator.of(context).push(homeRoute);
                    // _formKey.currentState!.reset();
                    // }
                  },
                  child: Center(
                    child: Text(
                      'Login',
                      style: styles.heading4,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
