import 'package:flutter/material.dart';



final TextEditingController usernameController = TextEditingController();
final TextEditingController nameController = TextEditingController();
final TextEditingController lastnameController = TextEditingController();
final TextEditingController dobController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class SignupScreen extends StatelessWidget{
  const SignupScreen ({super.key});

@override


  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.pink
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "Enter your Username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            SizedBox(height: 20),

            TextField(  
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Whats your name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            SizedBox(height: 20),

            TextField( 
            controller: lastnameController,
            decoration: InputDecoration(
              labelText: "Whats your last name ?",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              ),
            )
            ),
            SizedBox(height: 20),

            TextField(
              controller: dobController,
              decoration: InputDecoration(
                labelText: "Date of birth",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),


          ]
        )
      )
    
    );
    

  }
}
