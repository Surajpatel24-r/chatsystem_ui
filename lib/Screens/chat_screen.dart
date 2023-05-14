import 'package:chatsystem_ui/Screens/number_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import '../messages.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [
    Message(
        text: "Hello",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        text: "How are you?",
        date: DateTime.now().subtract(Duration(minutes: 3)),
        isSentByMe: true),
    Message(
        text: "I am fine",
        date: DateTime.now().subtract(Duration(minutes: 5)),
        isSentByMe: false),
    Message(
        text: "What about you",
        date: DateTime.now().subtract(Duration(minutes: 6)),
        isSentByMe: true)
  ].reversed.toList();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812));

    return Scaffold(
      // backgroundColor: Colors.grey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GroupedListView<Message, DateTime>(
              padding: EdgeInsets.all(8.w),
              reverse: true,
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: true,
              floatingHeader: true,
              elements: messages,
              groupBy: (message) => DateTime(
                message.date.year,
                message.date.month,
                message.date.day,
              ),
              groupHeaderBuilder: (Message message) => SizedBox(
                height: 40.h,
                child: Center(
                  child: Card(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Text(
                        DateFormat.yMMMd().format(message.date),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              itemBuilder: (context, Message message) => Row(
                mainAxisAlignment: message.isSentByMe
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  if (!message.isSentByMe)
                    CircleAvatar(
                        radius: 15.sp,
                        backgroundImage: AssetImage("assets/aap.jpg")),
                  Card(
                    elevation: 8,
                    child: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Text(
                        message.text,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  if (message.isSentByMe)
                    CircleAvatar(
                      radius: 15.sp,
                      backgroundImage: AssetImage(
                        'assets/aap.jpg',
                      ),
                    ),
                ],
              ),
            ),
          ),
          Container(
            height: 70.h,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.add),
                  Icon(
                    Icons.camera_alt_sharp,
                    color: Colors.green,
                  ),
                  Container(
                    width: 245.w,
                    child: Card(
                      margin:
                          EdgeInsets.only(left: 2.w, right: 2.w, bottom: 8.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        minLines: 1,
                        decoration: InputDecoration(
                          hintText: "Type a message",
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(bottom: 15.h, left: 12.w),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.sp,
                          ),
                        ),
                        // onSubmitted: (text) {
                        //   final message = Message(
                        //     text: text,
                        //     textColor: Colors.black,
                        //     date: DateTime.now(),
                        //     isSentByMe: true,
                        //   );
                        //   setState(() {
                        //     messages.add(message);
                        //   });
                        // },
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.send,
                      size: 30.sp,
                    ),
                    color: Colors.blue,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
