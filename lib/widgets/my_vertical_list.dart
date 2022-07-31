import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/screen/screen.dart';

import '../screen/course_detail_screen.dart';

class MyVerticalList extends StatelessWidget {
  MyVerticalList({Key? key,
  required this.courseImage,
  required this.courseTitle,
  required this.courseDuration,
  required this.courseRating,
  }) : super(key: key);


final String courseImage, courseTitle, courseDuration;
final double courseRating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: SizedBox(
        height:134,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              height: 92,
              width: MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width * 0.13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF3E3A6D),
                boxShadow: [
                  BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 0,
                  blurRadius: 13,
                  offset: const Offset(0,4),
                ),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.only(
              left: 26,
              bottom: 19,
            ),
            child: Row(
              children: [
                Container(
                  height: 115, 
                  width: 115,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(courseImage),
                  )),
                ),
                Padding(padding: const EdgeInsets.only(left:10),child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  mainAxisAlignment: MainAxisAlignment.end,                                                                   
                  children: [
                    Text(courseTitle,
                    style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 18,
                    ),
                    ),
                    Text(courseDuration,
                    style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 12,
                    )),
                    RatingBar.builder(
                      initialRating: courseRating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 18,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1) ,
                      itemBuilder: (context, _)=> const Icon(Icons.star, 
                    color:Color(0xFFF4C465)), 
                    onRatingUpdate: (rating){
                      print(rating);
                    })
                  ],
                )),
              ],
            ),
            ),
            Positioned(
              bottom: 34,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.width * 0.06,
                width: MediaQuery.of(context).size.width * 0.06,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,color:Color(0xFFEB53A2),
                ),
                child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ClassDetailScreen()));
                },
                child: const Icon(Icons.play_arrow, color: Colors.white,),
                ),
              ),
              ), 
          ]
        ),
      ),
    );
  }
}
