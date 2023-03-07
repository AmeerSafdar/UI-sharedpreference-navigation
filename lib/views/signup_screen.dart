import 'package:flutter/material.dart';
import 'package:loginpractice/views/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _form=GlobalKey<FormState>();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  // String? email;
  // String? name ;
  // String?password;
  String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    


void savedData() async{
  
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', _nameController.text);
      await prefs.setString('email', _email.text);
      await prefs.setString('password', _password.text);
      //  var a= prefs.getString('email');
      //  var b=  prefs.getString('name',);
      //  var c= prefs.getString('password',);
     

}
 void _submit() async{
    if (_form.currentState!.validate()) {
      savedData();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var email= prefs.getString('email');
      var name=  prefs.getString('name')!;
      var  password= prefs.getString('password');
         print('pass $password');
         print('email $email');
         print('email $name');
         // ignore: use_build_context_synchronously
         Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  HomeScreen(emai: email.toString(), pass: password.toString(), name: name.toString(),)),
  );
     
    }
  }
  @override
  Widget build(BuildContext context) {
    RegExp regex = RegExp(pattern);
    return Scaffold(
      body: Form(
        key: _form,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                
                validator: ((value) {
                  if (value!.isNotEmpty) {
                    return null;
                  }
                  else{
                    return 'Name must contain a value';
                  }
                }),
                controller: _nameController,
                decoration: InputDecoration(
                  label: Text('Full name')
                ),
              ),
              SizedBox(
                height: 10,
              ),

              
              TextFormField(
                controller: _email,
                validator: ((value) {
                    if (!regex.hasMatch(value!))
      return 'Enter Valid Email';
    else
      return null;
  }
                ),
                decoration: InputDecoration(
                  label: Text('email')
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _password,
                  decoration: InputDecoration(
                  label: Text('password')
                ),
                    validator: ((value) {
                    if (value.toString().length<6)
      return 'password must contain 6 letters';
    else
      return null;
  })),
              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  
                  child: TextButton(
                  onPressed: (){
                    _submit();
                  }, 
                  child: Text('Signup')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}