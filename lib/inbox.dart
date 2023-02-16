import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking/main.dart';
import 'package:hotel_booking/profile.dart';
import 'package:hotel_booking/trips.dart';
import 'package:hotel_booking/widgets.dart';
import 'package:hotel_booking/wishlist.dart';

import 'dashboard.dart';

void main() {
  runApp(Inbox());
}

class Inbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        title: 'Hello',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.nunitoTextTheme(
              Theme.of(context).textTheme,
            )),
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
      designSize: const Size(360, 640),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//define colors
  final backgroundColor = Color(0xff191A32);
  final navTextColor = Color(0xffFFFFFF);
  final navActiveIconColor = Color(0xff33B0F6);
  // final navActiveLinkColor = Color(0xff33B0F6);
  final navBackgroundColor = Color(0xff1F213B);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: navBackgroundColor,
        ),
        child: BottomNavigationBar(
            onTap: (value) {
              if (value == 0) {
                // Within the `FirstRoute` widget
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              }
              if (value == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WishList()),
                );
              }
              if (value == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Trips()),
                );
              }
              if (value == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Inbox()),
                );
              }
                if (value == 4) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              }
            },
            backgroundColor: navBackgroundColor,
            // selectedItemColor: Colors.blueAccent,
            unselectedLabelStyle: TextStyle(color: Colors.white),
            unselectedItemColor: Colors.white,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  label: 'Explore'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.white,
                  ),
                  label: 'Wshlist'),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.flight,
                  color: Colors.white,
                ),
                label: 'Trips',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.message_rounded,
                    color: navActiveIconColor,
                  ),
                  label: 'Inbox'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
            ]),
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  Wrap(
                    children: [
                      Icon(Icons.arrow_back_ios_new,
                          size: 20, color: Colors.white),
                      SizedBox(
                        width: 10.w,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                          print('Press Back');
                        },
                        child: Text(
                          'Inbox',
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Wrap(
                children: [
                  Text(
                    'Messages',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'Notifications',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
              ),
              Text(
                'You have no unread messages',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              ),
              Wrap(
                children: [
                  Text(
                    "When you contact a host or send a reservation request, you’ll see your messages here.",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
