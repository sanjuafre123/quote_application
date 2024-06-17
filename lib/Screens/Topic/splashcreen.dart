import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quote_app/utils/global.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({super.key});

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff000000),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff000000),
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/quote');
            },
            child: Icon(
              CupertinoIcons.left_chevron,
              size: 24,
              color: Colors.white,
            )),
        title: Text(
          'Topics',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: buildtopic(height, context, width),
    );
  }

  Padding buildtopic(double height, BuildContext context, double width) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.027,
            ),
            Wrap(
              children: [
                ...List.generate(
                  topic.length,
                  (index) => InkWell(
                    onTap: () {
                      setState(() {
                        Catagory.clear();
                        for (int i = 0; i < Catlist.length; i++) {
                          if (topic[index]['topic'] == Catlist[i]['cat']) {
                            Catagory.add(Catlist[i]);
                          }
                        }
                        Navigator.of(context).pushNamed('/quote');
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      height: height * 0.126,
                      width: width * 0.4255,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage('${topic[index]['img']}'),
                            fit: BoxFit.cover),
                      ),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        '  ${topic[index]['topic']}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
