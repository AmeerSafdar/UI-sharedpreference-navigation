// import 'package:flutter/material.dart';
// import 'package:loginpractice/views/home_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class EditScreen extends StatefulWidget {
//   const EditScreen({super.key});

//   @override
//   State<EditScreen> createState() => _EditScreenState();
// }

// class _EditScreenState extends State<EditScreen> {
//   final _form=GlobalKey<FormState>();
//    TextEditingController _nameController = new TextEditingController();
//    TextEditingController _email = new TextEditingController();
//    TextEditingController _password = new TextEditingController();

//   String pattern =
//         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    


// void savedData() async{
  
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       await  prefs.setString('name', _nameController.text).then((value) {
//         print('value is $value');
//       });
//       await prefs.setString('email', _email.text).then((value) {
//         print('value is $value');
//       });
//       await prefs.setString('password', _password.text).then((value) {
//         print('value is $value');
//       });
//       var a= prefs.getString('email');
//       var b=  prefs.getString('name',);
//        var c= prefs.getString('password',);
//         print('hellllo');

//         print("aaa $a");
        
//         print("bbbb  $b");
        
//         print("cccc $c");
//         print('saved data called');

// }
//  void _submit() async{
//     if (_form.currentState!.validate()) {
//       savedData;
//        Navigator.push(context,
//               MaterialPageRoute(builder: (context) =>  HomeScreen(emai: '', pass: '', name: '',)),
//   );
     
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     RegExp regex = RegExp(pattern);
//     return Scaffold(
//       body: Form(
//         key: _form,
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
                
//                 validator: ((value) {
//                   if (value!.isNotEmpty) {
//                     return null;
//                   }
//                   else{
//                     return 'Name must contain a value';
//                   }
//                 }),
//                 controller: _nameController,
//                 decoration: const InputDecoration(
//                   label: Text('Full name')
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),

              
//               TextFormField(
//                 controller: _email,
//                 validator: ((value) {
//                     if (!regex.hasMatch(value!))
//                       { return 'Enter Valid Email';}
//                     else
//                        {return null;}
//   }
//                 ),
//                 decoration: const InputDecoration(
//                   label: Text('email')
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 controller: _password,
//                   decoration: const InputDecoration(
//                   label: Text('password')
//                 ),
//                     validator: ((value) {
//                     if (value.toString().length<6)
//                        {return 'password must contain 6 letters';}
//                      else
//                   {return null;}
//   })),
//               const SizedBox(
//                 height: 10,
//               ),

//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
                  
//                   child: TextButton(
//                   onPressed: (){
//                     _submit;
//                   }, 
//                   child: const Text('Signup')),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }