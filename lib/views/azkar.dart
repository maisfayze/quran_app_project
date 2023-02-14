import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Azkar extends StatefulWidget {
  const Azkar({Key? key}) : super(key: key);
  static const id = 'Azkar';
  @override
  State<Azkar> createState() => _AzkarState();
}

class _AzkarState extends State<Azkar> {
  int _counter = 0;
  String _content = 'استغفر الله';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'مسبحة الاذكار',
          style: GoogleFonts.almarai(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
              onSelected: (String value) {
                if (_content != value) {
                  setState(() {
                    _content = value;
                    _counter = 0;
                  });
                }
              },
              offset: Offset(10, 40),
              color: Colors.black,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    height: 25,
                    child: Text(
                      'استغفر الله',
                      style: GoogleFonts.almarai(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: 'استغفر الله',
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem(
                    height: 25,
                    child: Text(
                      'الحمد لله',
                      style: GoogleFonts.almarai(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: 'الحمد لله',
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem(
                    height: 25,
                    child: Text(
                      'سبحان الله',
                      style: GoogleFonts.almarai(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    value: 'سبحان الله',
                  ),
                ];
              }),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
          colors: [
            Color(0xffbaebf8),
            Color(0xffeeaad9),
          ],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/4264/4264500.png'),
                  ),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFCC704B),
                      blurRadius: 6,
                      offset: Offset(0, 0.6),
                    )
                  ]),
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFD798C3),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _content,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.almarai(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 70,
                    alignment: Alignment.center,
                    color: Color(0xff4ba2b6),
                    child: Text(
                      _counter.toString(),
                      style: GoogleFonts.almarai(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffd17db8),
                      ),
                      onPressed: () {
                        setState(() {
                          ++_counter;
                        });
                      },
                      child: Text(
                        'تسبيح',
                        style: GoogleFonts.almarai(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff72cfe5),
                      ),
                      onPressed: () {
                        setState(() {
                          _counter = 0;
                        });
                      },
                      child: Text(
                        'إعادة',
                        style: GoogleFonts.almarai(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
