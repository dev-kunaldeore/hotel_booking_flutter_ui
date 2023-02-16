import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking/inbox.dart';
import 'package:hotel_booking/main.dart';
import 'package:hotel_booking/profile.dart';
import 'package:hotel_booking/trips.dart';
import 'package:hotel_booking/widgets.dart';

import 'dashboard.dart';

void main() {
  runApp(WishList());
}

class WishList extends StatelessWidget {
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
  var arrNames = [
    "Mumbai",
    "Pune",
    "Delhi",
    "Banglore",
    "Hydrabad",
    "Mumbai",
    "Pune",
    "Delhi",
    "Banglore",
    "Hydrabad",
    "Mumbai",
    "Pune",
    "Delhi",
    "Banglore",
    "Hydrabad",
  ];
  var listImg = [
    Image.asset('assets/images/1.png'),
    Image.asset('assets/images/2.png'),
    Image.asset('assets/images/3.png'),
    Image.asset('assets/images/4.png'),
    Image.asset('assets/images/5.png'),
    Image.asset('assets/images/1.png'),
    Image.asset('assets/images/2.png'),
    Image.asset('assets/images/3.png'),
    Image.asset('assets/images/4.png'),
    Image.asset('assets/images/5.png'),
    Image.asset('assets/images/1.png'),
    Image.asset('assets/images/2.png'),
    Image.asset('assets/images/3.png'),
    Image.asset('assets/images/4.png'),
    Image.asset('assets/images/5.png'),
  ];
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
                // Within the `FirstRoute` widget
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WishList()),
                );
              }
               if (value == 2) {
                // Within the `FirstRoute` widget
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Trips()),
                );
              }
               if (value == 3) {
                // Within the `FirstRoute` widget
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
                    color: navActiveIconColor,
                  ),
                  label: 'Wshlist'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.flight,
                    color: Colors.white,
                  ),
                  label: 'Trips'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message_rounded), label: 'Inbox'),
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
                  Icon(Icons.arrow_back_ios_new, size: 20, color: Colors.white),
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
                      'Wishlists',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: listImg[index],
                        title: Text(
                          arrNames[index],
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text('Best Place to visit ',
                            style: TextStyle(color: Colors.white)),
                        trailing: Text('23:43',
                            style: TextStyle(color: Colors.white)),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 10,
                        thickness: 0.5,
                        color: Colors.white,
                      );
                    },
                    itemCount: arrNames.length),
              )
            ],
          ),
        ),
      ),
    );
  }
}
