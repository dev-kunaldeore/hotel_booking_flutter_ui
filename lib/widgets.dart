import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget searchBar() {
  return TextField(
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: Colors.black, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: Colors.grey, width: 0),
      ),
      prefixIcon: Icon(
        Icons.search,
        color: Colors.black,
      ),
      suffixIcon: Icon(
        Icons.settings,
        color: Colors.black,
      ),
      hintText: 'Where to?',
      hintStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget iconBar() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(
              Icons.surfing,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Surfing',
              style: TextStyle(fontSize: 10.sp, color: Colors.white),
            ),
          ],
        ),
        SizedBox(
          width: 20.w,
        ),
        Column(
          children: [
            Icon(
              Icons.flight_land_rounded,
              color: Colors.grey,
              size: 30,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Flight',
              style: TextStyle(fontSize: 10.sp, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(
          width: 20.w,
        ),
        Column(
          children: [
            Icon(
              Icons.hotel_class,
              color: Colors.grey,
              size: 30,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Rest',
              style: TextStyle(fontSize: 10.sp, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(
          width: 20.w,
        ),
        Column(
          children: [
            Icon(
              Icons.train,
              color: Colors.grey,
              size: 30,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Train',
              style: TextStyle(fontSize: 10.sp, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(
          width: 20.w,
        ),
        Column(
          children: [
            Icon(
              Icons.location_city,
              color: Colors.grey,
              size: 30,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'City',
              style: TextStyle(fontSize: 10.sp, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(
          width: 20.w,
        ),
        Column(
          children: [
            Icon(
              Icons.bus_alert_outlined,
              color: Colors.grey,
              size: 30,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Bus',
              style: TextStyle(fontSize: 10.sp, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(
          width: 20.w,
        ),
        Column(
          children: [
            Icon(
              Icons.dining_rounded,
              color: Colors.grey,
              size: 30,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Food',
              style: TextStyle(fontSize: 10.sp, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(
          width: 20.w,
        ),
        Column(
          children: [
            Icon(
              Icons.sunny_snowing,
              color: Colors.grey,
              size: 30,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Winter',
              style: TextStyle(fontSize: 10.sp, color: Colors.grey),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget makePost() {
  return Container(
    height: 350,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20), // Image border
            child: SizedBox.fromSize(
              // Image radius
              child: Image.asset('assets/images/1.png', fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20), // Image border
            child: SizedBox.fromSize(
              // Image radius
              child: Image.asset('assets/images/2.png', fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20), // Image border
            child: SizedBox.fromSize(
              // Image radius
              child: Image.asset('assets/images/3.png', fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20), // Image border
            child: SizedBox.fromSize(
              // Image radius
              child: Image.asset('assets/images/4.png', fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20), // Image border
            child: SizedBox.fromSize(
              // Image radius
              child: Image.asset('assets/images/5.png', fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    ),
  );
}

//post descriptoin
Widget postDescription() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'La Parguera, Puerto Rico',
        style: TextStyle(fontSize: 18.sp, color: Colors.white),
      ),
      Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.white,
          ),
          Text(
            '4.94',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ],
  );
}

//post data
Widget postData() {
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '3.550 kilometers away',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey),
          ),
          Text(
            'Jan 2 - 8',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey),
          ),
          Wrap(
            children: [
              Text(
                "USD 234",
                style: TextStyle(fontSize: 18.sp, color: Colors.white),
              ),
              Text(
                ' night',
                style: TextStyle(fontSize: 16.sp, color: Colors.grey),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Icon(
            Icons.favorite_outlined,
            color: Colors.white,
          ),
        ],
      ),
    ],
  );
}
