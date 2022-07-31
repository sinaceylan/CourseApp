import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/screen/course_detail_screen.dart';
import 'package:project2/widgets/my_horizantal_list.dart';
import 'package:project2/widgets/my_vertical_list.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 20,right: 20),
          physics: const BouncingScrollPhysics(),
          children: [
            Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20), 
              Text(
                'Online',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 36,
                ),
              ),
                Text(
                  'Master Class',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 36,
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 22,
          ),
          GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CourseDetailScreen()));
                },
          child: SizedBox(
            height: 349,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index){
                return const MyHorizontalList(
                  courseHeadline: 'Recommended', 
                  courseImage: 'assets/images/img_saly10.png', 
                  courseTitle: 'UI/UX DESIGNER\nBEGINNER', 
                  endColor: 0xFF534EA7, 
                  startColor: 0xFF9288E4,
                );
              }),
          ),
          ),
          SizedBox(height: 34),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Free Online Class',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              Text(
                'Master Class',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF9C9A9A),
                  fontSize: 14,
                ),
              )
            ],
          ),
          ListView.builder(shrinkWrap: true,itemCount: 5,itemBuilder: (context,index) {
            return MyVerticalList(courseDuration: '8 Hours', courseImage: 'assets/images/img_saly24.png', courseRating: 3.0, courseTitle: 'Flutter Developer',);
          })
          ]
        ),
      )
    );
  }
}