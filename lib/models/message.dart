class Message 
{
  String message;
  String sender;
  Message({required this.message , required this.sender});
  factory Message.fromJson(jsonData)
  {
    return Message(
      message: jsonData['message'],
      sender: jsonData['sender'],
    );
  }
}