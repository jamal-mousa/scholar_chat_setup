import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat_setup/constants.dart';
import 'package:scholar_chat_setup/models/message.dart';
import 'package:scholar_chat_setup/widgets/chatmessages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key });
  final CollectionReference messages = FirebaseFirestore.instance.collection('messages');
  final TextEditingController controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final String email = FirebaseAuth.instance.currentUser!.email!;
    // final String email = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>
    (
      stream: messages.orderBy("createdAt", descending: true).snapshots(),
      builder: (context, snapshot) {
        // print(snapshot.data!.docs);
        if(snapshot.hasData)
        {
          final List<Message> messageList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++)
          {
            messageList.add(Message.fromJson(snapshot.data!.docs[i].data()));
          }
          // print(snapshot.data!.docs[0]['message']);
          return Scaffold
    (
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [
            Image.asset(kimageLogo, height: 40,),
            SizedBox(width: 8,),
            Text('Chat' , style: TextStyle(fontFamily: 'Pacifico' , color: Colors.white),),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded
          (
            child: ListView.builder(itemBuilder: (context, index) {
              return ChatMessages(isSentByMe: messageList[index].sender == email ? true: false  , text: messageList[index].message,);
            },
            reverse: true,
            controller: _scrollController,
            itemCount: messageList.length,
            ),
          ),
          SizedBox(height: 8.0),
          TextField(
            controller: controller,
            
            onSubmitted: (data) 
            {
              messages.add({'message':data , "createdAt" : DateTime.now()  , 'sender': email});
              controller.clear();
              _scrollController.animateTo(
                0.0,
                duration: Duration(microseconds: 500 ),
                curve: Curves.easeIn,
              );
              
            },
            maxLines: null, // Allow dynamic line expansion
            minLines: 1, // Start with one line
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            decoration: InputDecoration(
              suffixIcon: IconButton(icon: Icon(Icons.send , color: kPrimaryColor,), onPressed: () { if (controller.text.isNotEmpty) {
                      messages.add({'message': controller.text , "createdAt" : DateTime.now() , 'sender': email});
                      controller.clear();
                    } },),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(12.0),
              ) ,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(12.0),
              ),
              hintText: 'Type your message...',
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              
            ),
          ),
          SizedBox(height: 8.0),
        ],
      ),    
      
      
    );
        }
        else {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
            ),
          );
        }
        
      },
    );
  }
}