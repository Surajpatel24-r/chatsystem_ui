import 'package:chatsystem_ui/Screens/aap_managment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil instance
    ScreenUtil.init(context);

    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Container(
                    height: 130.w,
                    width: 140.w,
                    child: Image(image: AssetImage("assets/aap2.jpg")),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Text("AAP will need to verify your phone number",
                    style: TextStyle(color: Colors.black, fontSize: 17.sp)),
              ),
              SizedBox(height: 50.h),
              label("Enter Your Number"),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    textTheme: TextTheme(
                      subtitle1: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  child: IntlPhoneField(
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,
                    flagsButtonPadding: EdgeInsets.all(8.w),
                    dropdownIconPosition: IconPosition.leading,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    dropdownTextStyle: TextStyle(color: Colors.black),
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  minWidth: double.infinity,
                  maxWidth: double.infinity,
                  minHeight: 50.h,
                  maxHeight: 50.h,
                ),
                margin:
                    EdgeInsets.only(top: 300.0.h, left: 10.0.w, right: 10.0.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(20).w,
                  ),
                  onPressed: () {
                    Get.to(AppManagmentScreen());
                  },
                  child: Center(
                    child: Text(
                      "SEND OTP",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget label(String label) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 16.5.sp,
          letterSpacing: 0.1.sp,
        ),
      ),
    );
  }
}
