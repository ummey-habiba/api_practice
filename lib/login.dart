import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
void login(String email, password){
  try{


  }catch(error){
    print(error);
  };
}
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  const Text('Login Page '),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email'
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                    hintText: 'Password'
                ),
              ),
              const SizedBox(height: 30,),
              GestureDetector(

                onTap: () {
login(emailController.text.toString(), passwordController.text.toString());
                },
                child: Container(
                  height: 50,
                  child: Center(child: const Text('Sign Up',style: TextStyle(fontSize: 20,color:  Colors.white,),)),
                  decoration: BoxDecoration(
                    color:  Colors.blue,
                    borderRadius: BorderRadius.circular(10)
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
