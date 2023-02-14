import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app_project/views/quran_page.dart';
import 'package:quran_app_project/views/widget/custom_container.dart';
import 'package:quran_app_project/views/widget/last_read.dart';

import '../style/style.dart';
import 'azkar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const id = 'HomeScreen';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "myQuran",
          style: titleGreenStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Center(
                    child: Image(
                      image: const AssetImage('assets/icons/logo.png'),
                      width: 50,
                    ),
                  )),
              LastReadWidget(),
              Dashboard()
            ],
          ),
        ),
      ),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var _items = [];

  Future<void> readJson2() async {
    final String response =
        await rootBundle.loadString('assets/hafs_smart_v8.json');
    final data = await json.decode(response) as List;
    setState(() {
      _items = data;
    });
    print(_items);
  }

  void initState() {
    readJson2();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomContainer(
                    image: 'assets/icons/quran.png',
                    title: "Quran",
                    color: greenColor,
                    onpressed: () {
                      print('mmnmmsd');
                      Navigator.pushReplacementNamed(context, QuranPage.id);
                    }),
                CustomContainer(
                    image: 'assets/icons/bookmark.png',
                    title: "Bookmars",
                    color: purpleColor,
                    onpressed: () {}),
              ],
            ),
          ),
        ),
        Spacer(),
        SizedBox(
          child: Column(
            children: [
              CustomContainer(
                image: 'assets/icons/prayer.png',
                title: "Search",
                color: redColor,
                onpressed: () {
                  showSearch(
                      context: context, delegate: DataSearch(list: _items));
                },
              ),
              CustomContainer(
                  image: 'assets/icons/location.png',
                  title: "Msbaha",
                  color: blueColor,
                  onpressed: () {
                    Navigator.pushNamed(context, Azkar.id);
                  }),
            ],
          ),
        )
      ],
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  List<dynamic> list;

  DataSearch({required this.list});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, 'null');
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return PageView.builder(
      itemBuilder: (context, index) {
        return Column();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    var searchlist = query.isEmpty
        ? list
        : list.where((p) => p['aya_text_emlaey'].contains(query)).toList();

    return ListView.builder(
      itemCount: searchlist.length,
      itemBuilder: (context, i) {
        return ListTile(
          title: Text('${searchlist[i]['sura_name_ar']}'),
          subtitle: Text('${searchlist[i]['aya_text_emlaey']}'),
          onTap: () {
            query = query = searchlist[i]['sura_name_ar'] +
                searchlist[i]['aya_text_emlaey'];
            showResults(context);
          },
        );
      },
    );
  }
}
