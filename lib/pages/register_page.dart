import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat_setup/constats.dart';
// import 'package:scholar_chat_setup/pages/login_page.dart';
import 'package:scholar_chat_setup/widgets/custom_buttom.dart';
import 'package:scholar_chat_setup/widgets/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
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
                  'REGISTER',
                  style: TextStyle
                  (
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 32,),
                CustomTextFormField
                (
                  hintText: 'Email',
                  onChanged: (data)
                  {
                    email = data;
                  } ,
                  ),
                SizedBox(height: 24,),
            
                CustomTextFormField
                (
                  hintText: 'Password',
                  onChanged: (data) 
                  {
                    password = data;
                  },
                  
                  ),
                SizedBox(height: 32,),
            
                CustomButtom
                (
                  nameOfButtom: 'REGISTER',
                  onTap: () async
                  {
                    // UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword
                    // (
                    //   email: email! , password: password!
                    // );
                    // print(user.user!.displayName);
            
                    if (formKey.currentState!.validate())
                    {
                      isLoading = true;
                      setState(() {});
                      try 
                      {
                        await registerUser();
                      } 
                      on FirebaseAuthException catch (e) 
                      {
                        if (e.code == 'email-already-in-use') {
                          showSnackBar(context ,  'This email is already registered.');
                        // Show a dialog or redirect user to Login page
                        } 
                        else if (e.code == 'weak-password') {
                        showSnackBar(context, 'weak password .');
                        }
                        else {
                          showSnackBar(context, e.toString());
                        }
                      }
                      catch (e) 
                      {
                        showSnackBar(context, e.toString());
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
                      'you have an acount ?',
                      style: TextStyle
                      (
                        color: Colors.white
                      ),
                      ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        
                      },
                      child: Text
                      (
                        '   SIGN IN',
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

  void showSnackBar(BuildContext context , String message) {
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }

  Future<void> registerUser() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}