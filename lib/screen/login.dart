import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/provider/auth_provider.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider=Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),

      ),
      body:  Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email'
              ),

            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: passController,
              decoration: const InputDecoration(
                  hintText: 'Password'
              ),


            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
authProvider.login(emailController.text.toString(), passController.text.toString());


              },
              child: Container(height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,borderRadius: BorderRadius.circular(10),

                ),child: Center(child:authProvider.loading? CircularProgressIndicator(color: Colors.white,):
                Text('Login')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
