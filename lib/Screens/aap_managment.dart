import 'package:chatsystem_ui/Screens/chat_screen.dart';
import 'package:chatsystem_ui/Screens/number_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';

import '../Conttroller/landingpage.dart';

class AppManagmentScreen extends StatelessWidget {
  AppManagmentScreen({super.key});

  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(
      () => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.blue,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.message,
                    size: 22.0.sp,
                  ),
                ),
                label: 'Chats',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.watch_later_rounded,
                    size: 22.0.sp,
                  ),
                ),
                label: 'Tasks',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.speaker_phone_rounded,
                    size: 22.0.sp,
                  ),
                ),
                label: 'Announcement',
                backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(375, 812));
    final LandingPageController landingPageController =
        Get.put(LandingPageController(), permanent: false);
    return DefaultTabController(
      length: 2,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text("AAP Managment"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  Get.to(PhoneNumberScreen());
                },
                icon: Icon(Icons.more_vert)),
          ],
          bottom: TabBar(
            labelColor: Colors.black,
            indicatorPadding: EdgeInsets.all(5.0.w),
            unselectedLabelColor: Colors.white,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10), // Creates border
                color: Colors.white),
            tabs: [
              Tab(
                text: "Volunteer",
              ),
              Tab(
                text: "Party Group",
              ),
            ],
          ),
        ),
        bottomNavigationBar:
            buildBottomNavigationMenu(context, landingPageController),
        floatingActionButton: Container(
          height: 50.w,
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.message, size: 22.w),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: custom_ListTile(),
      )),
    );
  }

  Widget custom_ListTile() {
    return Column(
      children: [
        InkWell(
          onTap: () => Get.to(ChatScreen()),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30.sp,
              backgroundImage: AssetImage("assets/aap.jpg"),
            ),
            title: Text(
              'Suraj Patel',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: [
                Icon(
                  Icons.done_all,
                  size: 15.sp,
                ),
                SizedBox(width: 4.w),
                Text(
                  "Hello Bro",
                  style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                ),
              ],
            ),
            trailing: Text(
              DateFormat("hh:mm a").format(DateTime.now()),
              style: TextStyle(
                  color: Color.fromARGB(236, 26, 222, 137),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        ListTile(
          leading: CircleAvatar(
            radius: 30.sp,
            backgroundImage: AssetImage("assets/elon.jpg"),
          ),
          title: Text(
            'Elon Musk',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: [
              Icon(
                Icons.done_all,
                size: 15.sp,
                color: Colors.blue,
              ),
              SizedBox(width: 4.w),
              Text(
                "Hello Bro",
                style: TextStyle(fontSize: 13.sp, color: Colors.grey),
              ),
            ],
          ),
          trailing: Text(
            DateFormat("hh:mm a").format(DateTime.now()),
            style: TextStyle(
                color: Color.fromARGB(236, 26, 222, 137),
                fontSize: 13.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
        ListTile(
          leading: CircleAvatar(
            radius: 30.sp,
            backgroundImage: AssetImage("assets/aap.jpg"),
          ),
          title: Text(
            'Suraj Patel',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: [
              Icon(
                Icons.done_all,
                size: 15.sp,
                color: Colors.blue,
              ),
              SizedBox(width: 4.w),
              Text(
                "Hello Bro",
                style: TextStyle(fontSize: 13.sp, color: Colors.grey),
              ),
            ],
          ),
          trailing: Text(
            DateFormat("hh:mm a").format(DateTime.now()),
            style: TextStyle(
                color: Color.fromARGB(236, 26, 222, 137),
                fontSize: 13.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
        // Obx(() => IndexedStack(
        //       index: landingPageController.tabIndex.value,
        //       children: [],
        //     )),
      ],
    );
  }
}
