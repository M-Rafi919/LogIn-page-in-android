import 'package:flutter/material.dart';
import 'package:new_application/screens/signup.dart';

import 'curved_navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _passwordTwo = TextEditingController();
  final _formKeyTwo = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogIn Page',style: TextStyle(fontSize: 20,color: Colors.green),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKeyTwo,
            child: Column(
              children: [
                CircleAvatar(child: Image.asset('assets/images/logo.jpg')),
                const SizedBox(height: 40,),
                TextFormField(
                  validator: (value) {
                    if(value==null || value.isEmpty){
                      return'Please Enter Name required';
                    }if (value.length<4){
                      return'value length must be 4 character';
                    }
                  },
                  controller: _name,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    label: const Text('Enter Your Name')
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _passwordTwo,
                  validator: (value) {
                    if(value==null || value.isEmpty){
                      return'password required';
                    }if (value.length<4){
                      return'value length must be 4 character';
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: const Text('Enter Your Passwor')
                  ),
                ),

                const SizedBox(height: 40,),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SinupPage(),));
                }, child: const Text('SingUp'),),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    if (_formKeyTwo.currentState!.validate()) {
                      print('Validated');
                      print(_name.text);
                      print(_passwordTwo.text);
                    } else{
                      print('Not Validated');
                    }
                  },
                  child: const Text('Validated'),
                ),
                TextButton(onPressed: (){
                 // Navigator.push(context, MaterialPageRoute(builder: CurvedNav()),);
                }, child: Text('Cur')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
