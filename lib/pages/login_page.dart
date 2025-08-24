import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat_setup/constats.dart';
// import 'package:scholar_chat_setup/pages/register_page.dart';
import 'package:scholar_chat_setup/widgets/custom_buttom.dart';
import 'package:scholar_chat_setup/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey(); 
  String? email;
  String? password;
  bool isLoading = false;
 

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold
      (
        // backgroundColor: Colors.grey,
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: ListView
            (
              
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: 
              [
                Spacer(flex: 2,),
                Center(child: Image.asset('lib/assets/images/scholar.png', )),
                SizedBox(height: 32,),
                Center(
                  child: Text
                  (
                    'SCHOLAR CHAT',
                    style: TextStyle
                    (
                      fontSize: 32,
                      color: Colors.white,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                  
                ),
                SizedBox(height: 64,),
                Text
                (
                  'LOG IN',
                  style: TextStyle
                  (
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 32,),
                CustomTextFormField(hintText: 'Email' , onChanged: (data){email = data;},),
                SizedBox(height: 24,),
            
                CustomTextFormField(hintText: 'Password' , onChanged: (data){password = data;},),
                SizedBox(height: 32,),
            
                CustomButtom
                (
                  nameOfButtom: 'SIGN IN' ,
                  onTap: () async{
                    if (formKey.currentState!.validate())
                    {
                      isLoading = true;
                      setState(() {});
                      try 
                      {
                        await loginUser();
                        showSnackBar(context ,  'success.');

                      } 
                      on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(context ,  'No user found for that email..');
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context ,  'Wrong password provided for that user..');

                        }
                      }
                      catch (error) 
                      {
                        showSnackBar(context ,  error.toString());
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },   
                ),
                SizedBox(height: 16,),
                  
                Row
                (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: 
                  [
                    Text
                    (
                      'don\'t have an acount ?',
                      style: TextStyle
                      (
                        color: Colors.white
                      ),
                      ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'RegisterPage');
                      },
                      child: Text
                      (
                        '   Register',
                        style: TextStyle
                        (
                          color: Colors.white
                        ),
                        ),
                    )
                  
                  ],
                ),
                Spacer(flex: 3,),
                
              ],
            ),
          ),
        )
      ),
    );
  }
    Future<void> loginUser() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  } 

  void showSnackBar(BuildContext context , String message) {
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }
}