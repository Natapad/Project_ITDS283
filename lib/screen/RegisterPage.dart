import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vibesshoppp/model/profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'LoginPage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool _isLoading = false;

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Initialize Firebase
      await Firebase.initializeApp();

      // Create a new user with email and password
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Update user's display name
      await FirebaseAuth.instance.currentUser!.updateDisplayName(
        _usernameController.text,
      );

      // Navigate to login page
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LoginPage();
      }));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('The password provided is too weak.')),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('The account already exists for that email.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to register. Please try again later.')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 200.0,
                width: 400,
              ),
              Text(
                'REGISTER',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 70.0),
              ),
              Container(
                margin: EdgeInsets.only(top: 80.0),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Icon(Icons.person),
                    hintText: 'USERNAME',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'PASSWORD',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    prefixIcon: Icon(Icons.email),
                    hintText: 'EMAIL',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _register,
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(300.0, 50.0),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/model/profile.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'LoginPage.dart';
// import 'package:firebase_database/firebase_database.dart';

// class RegisterScreen extends StatefulWidget {
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final CollectionReference _userCollection =
//       FirebaseFirestore.instance.collection("User");

// Future<void> _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         await _userCollection.add({
//           'Full Name': _nameController.text,
//           'Email': _emailController.text,
//           'Phone Number': _phoneController.text,
//           'Password': _passwordController.text,
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('User created successfully')),
//         );
//         _nameController.clear();
//         _emailController.clear();
//         _phoneController.clear();
//         _passwordController.clear();
//         Navigator.pushNamed(context, '/login');
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to create user')),
//         );
//       }
//     }
//   }

//   @override
//     void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _phoneController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           key: _formKey,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 200.0,
//               width: 400,
//             ),
//             Text(
//               'REGISTER',
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                   fontSize: 70.0),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 80.0),
//               child: TextFormField(

//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(30)),
//                     borderSide: BorderSide(color: Colors.transparent),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(30)),
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                   prefixIcon: Icon(Icons.person),
//                   hintText: 'USERNAME',
//                   fillColor: Colors.white,
//                   filled: true,
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 20.0),
//               child: TextFormField(
//                 obscureText: true,

//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(30)),
//                     borderSide: BorderSide(color: Colors.transparent),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(30)),
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                   prefixIcon: Icon(Icons.lock),
//                   hintText: 'PASSWORD',
//                   fillColor: Colors.white,
//                   filled: true,
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 20.0),
//               child: TextFormField(
//                 obscureText: true,

//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(30)),
//                     borderSide: BorderSide(color: Colors.transparent),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(30)),
//                     borderSide: BorderSide(color: Colors.black),
//                   ),
//                   prefixIcon: Icon(Icons.email),
//                   hintText: 'EMAIL',
//                   fillColor: Colors.white,
//                   filled: true,
//                 ),
//               ),
//             ),
//             Column(
//               children: [
//                 Padding(
//                     padding:
//                         const EdgeInsets.only(left: 100, right: 100, top: 50),
//                     child: ElevatedButton(
//                       child: const Text(
//                         'REGISTER',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 30,
//                         ),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         primary: Colors.blueGrey, // Background color
//                       ),
//                       onPressed: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) {
//                           return LoginPage();
//                         }));
//                       },
//                     )),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
