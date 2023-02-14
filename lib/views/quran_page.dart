import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:number_to_word_arabic/number_to_word_arabic.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({Key? key}) : super(key: key);
  static const id = 'QuranPage';
  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  List _items = [];
  late PageController controller;

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/hafs_smart_v8.json');
    final data = await json.decode(response);
    setState(() {
      _items = data;
    });
  }

  void initState() {
    readJson();

    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var myGroup = AutoSizeGroup();

    print('quran page');
    return Scaffold(
      body: PageView.builder(
        reverse: true,
        itemBuilder: (context, index) {
          String ayaLine = '';
          String SurahName = '';
          String basmalah = '';
          int jozz = 0;
          String ayaLine2 = '';
          if (_items.isNotEmpty) {
            for (Map quran in _items) {
              if (quran['page'] == index + 1) {
                ayaLine = ayaLine + ' ' + quran['aya_text'];
                ayaLine2 = ayaLine2 + ' ' + quran['aya_text_emlaey'];
              }
            }
            for (Map quran in _items) {
              if (quran['page'] == index + 1) {
                jozz = quran['jozz'];
              }
            }
            for (Map quran in _items) {
              if (quran['page'] == index + 1) {
                SurahName = quran['sura_name_ar'];
              }
            }

            for (Map quran in _items) {
              if (quran['page'] == index + 1) {
                if (quran['sura_name_ar'] != 'الفَاتِحة' &&
                    quran['sura_name_ar'] != 'التوبَة' &&
                    quran['aya_no'] == 1) {
                  basmalah = "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏";
                }
              }
            }
          }
          print(ayaLine.length);
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: ayaLine.length < 360
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'الجزء $jozz',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(fontFamily: 'Questv', fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        SurahName,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(fontFamily: 'Questv', fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      basmalah,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: ayaLine.length < 360 ? 25 : 18,
                        fontFamily: 'HafsSmart',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Stack(
                    children: [
                      Text(
                        ayaLine2,
                        style: TextStyle(color: Colors.transparent),
                      ),
                      Align(
                        // alignment: Alignment.center,

                        child: Text(
                          ayaLine,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: ayaLine.length < 360 ? 25 : 18,
                            fontFamily: 'HafsSmart',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text('${index + 1}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
