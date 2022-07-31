import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/gradient_text.dart';
import 'package:project2/screen/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ClassDetailScreen extends StatefulWidget {
  ClassDetailScreen({Key? key}) : super(key: key);
  

  @override
  State<ClassDetailScreen> createState() => _ClassDetailScreenState();
}

class _ClassDetailScreenState extends State<ClassDetailScreen> {
  bool _isChecked = false;
  late final Uri _url ;

  Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
} 

  @override
  void initState() {
    super.initState();
    _loadswitchValue();
  }

  _loadswitchValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    _isChecked = (prefs.getBool('counter10')) ?? false;
  });
}
_savenswitchValue() async {
SharedPreferences prefs = await SharedPreferences.getInstance();
setState(() {
  prefs.setBool('counter10', _isChecked);
  });
}

final List<String> items = ['State Management','Animations','Navigation','Storage','UI'];
final List<int> numb=[1,2,3,4,5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 20,right: 20),
          physics: const AlwaysScrollableScrollPhysics(),
        children: [
          const SizedBox(height: 20),
          Container(
              height: 250,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                  bottomLeft: Radius.circular(22), 
                  bottomRight: Radius.circular(22), 
                ), 
                gradient: LinearGradient(
                  begin: Alignment.topLeft, 
                  end: Alignment(1, 0.0),
                  colors: <Color>[
                    Color.fromARGB(255, 31, 191, 240),
                    Color.fromARGB(255, 2, 47, 245),
                  ],
                ),
                image: DecorationImage(alignment: Alignment.center,image: AssetImage('assets/images/flutter-logo.png')), 
              ),
            ),
            const SizedBox(height: 40), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GradientText('Flutter Course',style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 40), gradient: LinearGradient(colors: [Colors.blue.shade400,Colors.blue.shade900])),
              ], 
            ),
            const SizedBox(height: 20), 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Flutter is Google/''s modern and free SDK allowing you to write desktop, web and mobile apps with the same code-base. This course is for absolute beginners. You don/''t even have to know how to write code in any programming language to begin.', 
                    textAlign: TextAlign.center,
                    style:GoogleFonts.roboto(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 14,
                    ),),
                  ),
            const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(
                left: 20, 
                right: 20, 
                top: 22, 
              ), 
          child: ListView.builder(shrinkWrap: true,itemCount: items.length,itemBuilder: (context,index) {
            return SizedBox(
            height:120,
            child: Stack(
              alignment: Alignment.bottomLeft,
              
              children: [
                Container(
                  height: 92,
                  width: MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width * 0.13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft, 
                      end: Alignment(1, 0.0),
                      colors: <Color>[
                        Color.fromARGB(255, 31, 191, 240),
                        Color.fromARGB(255, 2, 47, 245),
                      ],
                    ),
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
                  bottom: 1,
                ),
                child: GestureDetector(
                onTap: () {
                  _url=Uri.parse('https://youtube.com/playlist?list=PL1k5oWAuBhgXdw1BbxVGxxWRmkGB1C11l');
                  launchUrl(_url);
                },
                child: Row(
                  children: [
                    Container(
                      height: 80, 
                      width: 80,
                      decoration: const BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/images/flutter_main.png'),
                      )),
                    ),
                    Padding(padding: const EdgeInsets.only(left:25,bottom:0),child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, 
                      mainAxisAlignment: MainAxisAlignment.end,                                                                   
                      children: [
                        Text(items[index],
                        style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 18,
                        ),
                        ),
                        Text('Lesson ${index+1}',
                        style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 12,
                              )),
                        Checkbox(
                          checkColor: Colors.white,
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value!;
                              _savenswitchValue();
                            });
                          },),
                            ],
                          )),
                        ],
                      ),
                      ),
                    ),
                  ],
                ),
              );
              }),
            ),   
          ],
        ),
      ),
    );
  }
}