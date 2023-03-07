import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:loginpractice/views/signup_screen.dart';
import 'package:loginpractice/views/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomeScreen extends StatefulWidget {
  String name,pass,emai;
   HomeScreen({super.key, required this.emai, required this.pass,required this.name});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  final _form=GlobalKey<FormState>();
   TextEditingController _nameController = new TextEditingController();
   TextEditingController _email = new TextEditingController();
   TextEditingController _password = new TextEditingController();
   var emai,name,pass;
   bool read_only =true;
   @override
  void initState() {
    // getData();
    super.initState();
    
  }
  void savedData(String email , String password, String name1) async{
  
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', name1);
      await prefs.setString('email', email);
      await prefs.setString('password', password);
      var a= prefs.getString('email');
      var b=  prefs.getString('name',);
      var c= prefs.getString('password',);
     

}

  void _submit(String email , String password, String name1) async{
    if (_form.currentState!.validate()) {
      savedData(email, password,name1);
      SharedPreferences prefs = await SharedPreferences.getInstance();
         var a= prefs.getString('email');
         var b=  prefs.getString('name',);
         var c= prefs.getString('password',);
         print('c');
         print('a');
         print('b');
          non_editableTextField();
         // ignore: use_build_context_synchronously
        //  Navigator.push(context,
        //       MaterialPageRoute(builder: (context) =>  HomeScreen(emai: a!, pass: c!, name: b!,)),
  // );
     
    }
  }

  editableTextField() {
    setState(() {
      read_only=false;
    });

  }
   non_editableTextField() {
    setState(() {
      read_only=true;
    });

  }
  String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  Widget build(BuildContext context) {
    // getData();
  RegExp regex = RegExp(pattern);
  emai=widget.emai; name=widget.name; pass=widget.pass;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
               showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Logout"),
                  content: const Text("Are you sure to want you to logout?"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () async{
                        // Navigator.of(ctx).pop();
                        SharedPreferences preferences = await SharedPreferences.getInstance();
                        await preferences.clear();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                      },
                      child: Container(
                        color: Colors.red,
                        padding: const EdgeInsets.all(14),
                        child: const Text("Yes"),
                      ),
                    ),
                     TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(14),
                        child: const Text("No"),
                      ),
                    ),
                  ],
                ),
              );
          }, icon: Icon(
            Icons.logout
          ))
        ],
      ),
      body: Form(
        key: _form,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                readOnly: read_only,
                initialValue: name,
                onChanged: ((value) {
                  setState(() {
                    name=value;
                  });
                }),
                validator: ((value) {
                  if (value!.isNotEmpty) 
                    return null;
                  else
                    return 'Name must contain a value';
                  
                }),
                // controller: _nameController..text=user_email,
                // decoration: const InputDecoration(
                //   label: Text('Full name')
                // ),
              ),
              const SizedBox(
                height: 10,
              ),

              
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    emai=value;
                  });
                },
                readOnly: read_only,
                initialValue: emai,
                // controller: _email,
                validator: ((value) {
                    if (!regex.hasMatch(value!))
                       return 'Enter Valid Email';
                    else
                       return null;
  }
                ),
                // decoration: const InputDecoration(
                //   label: Text('email')
                // ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onChanged: ((value) {
                  pass=pass;
                }),
                readOnly: read_only,
                initialValue: pass,
                // controller: _password,
                //   decoration: const InputDecoration(
                //   label: Text('password')
                // ),
                    validator: ((value) {
                    if (value.toString().length<6)
                      return 'password must contain 6 letters';
                     else
                      return null;
  })),
              const SizedBox(
                height: 10,
              ),

              Visibility(
                visible: read_only,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    
                    child: TextButton(
                    onPressed: (){
                      editableTextField();
                    }, 
                    child: const Text('Edit')),
                  ),
                ),
              ),

                const SizedBox(
                height: 10,
              ),

              Visibility(
                visible: !read_only,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    
                    child: TextButton(
                    onPressed: (){
                      _submit(emai, pass, name);
                    }, 
                    child: const Text('Done')),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}