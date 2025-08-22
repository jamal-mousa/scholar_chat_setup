import 'package:flutter/material.dart';
import 'package:scholar_chat_setup/constats.dart';
// import 'package:scholar_chat_setup/pages/register_page.dart';
import 'package:scholar_chat_setup/widgets/custom_buttom.dart';
import 'package:scholar_chat_setup/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      // backgroundColor: Colors.grey,
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column
        (
          
          crossAxisAlignment: CrossAxisAlignment.start,
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
            CustomTextField(hintText: 'Email'),
            SizedBox(height: 24,),
        
            CustomTextField(hintText: 'Password'),
            SizedBox(height: 32,),
        
            CustomButtom(nameOfButtom: 'SIGN IN'),
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
      )
    );
  }
}