import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class Item {
  final String url;
  final String title;
  Item(this.url, this.title);
}

final List<Item> imgList = [
  Item('https://pbs.twimg.com/media/EE_Wq0mXUAA18EM?format=jpg&name=large',
      "مجمع الملك سلمان للصناعات البحرية"),
  Item('https://pbs.twimg.com/media/EE0dhw8XsAARsj7?format=jpg&name=small',
      "مشاريع البحر الأحمر"),
  Item('https://pbs.twimg.com/media/EEqB7SjXkAA-Uh7?format=jpg&name=small',
      "زيادة إنتاج الذهب والمعادن"),
  Item("https://pbs.twimg.com/media/EEvNV3oXUAIh1zX?format=jpg&name=small",
      "زيادة نسبة الاستثمار الأجنبي"),
  Item("https://pbs.twimg.com/media/EEp2VeNWkAAUYST?format=jpg&name=small",
      "مشاريع تدوير النفايات"),
  Item("https://pbs.twimg.com/media/EEkkvoaX4AEvwIP?format=jpg&name=small",
      "الاعتماد على الطاقات المستدامة"),
  Item("https://pbs.twimg.com/media/EEgc0upWwAE3MvN?format=jpg&name=large",
      "تحسين قطاع السياحة"),
  Item("https://pbs.twimg.com/media/EEPwE26XsAAc5e4?format=jpg&name=large",
      "مزارع لإنتاج وتربية الأسماك"),
  Item("https://pbs.twimg.com/media/EEPlNlRXYAA3QZF?format=jpg&name=900x900",
      "تطوير القطاع الترفيهي"),
  Item("https://pbs.twimg.com/media/EEBJ4dZWwAA1QJG?format=jpg&name=900x900",
      "تخصيب اليورانيوم"),
  Item("https://pbs.twimg.com/media/EDi_1oVXYAEUcxk?format=jpg&name=large",
      "تمكين الشباب في المهن التقنية"),
  Item("https://pbs.twimg.com/media/ECzjVE4WwAAe6gy?format=jpg&name=small",
      "مدينة جدة الاقتصادية"),
  Item("https://pbs.twimg.com/media/ED3DHlcWsAEy-9L?format=jpg&name=medium",
      "متحف معالم المسجد الحرام"),
  Item("https://pbs.twimg.com/media/EC5yTX1WkAEuY-j?format=jpg&name=medium",
      "مدينة القدية"),
  Item("https://pbs.twimg.com/media/EBTHKJlXYAEv5_2?format=jpg&name=large",
      "مصفأة جازان العملاقة"),
];

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

final List child = map<Widget>(
  imgList,
  (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          Image.network(
            i.url,
            fit: BoxFit.cover,
            width: 1300.0,
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Center(
                child: Text(
                  i.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  },
).toList();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final CarouselSlider manualCarouselDemo = CarouselSlider(
      items: child,
      autoPlay: true,
      enlargeCenterPage: true,
      viewportFraction: 0.9,
      aspectRatio: 1.5,
      autoPlayInterval: Duration(seconds: 5),
      autoPlayAnimationDuration: Duration(milliseconds: 1000),
    );

    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      builder: (BuildContext context, Widget child) {
        return Directionality(
          child: Scaffold(
            appBar: AppBar(
              title: Text("العيد الوطني 89 #همة_حتى_القمة"),
              bottom: PreferredSize(
                preferredSize: Size(20, 50),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text("العيد الوطني 89 #همة_حتى_القمة",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          Row(
                            children: <Widget>[
                              Text("EmadKaizen@",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              SizedBox(
                                width: 10,
                              ),
                              Image.network(
                                "https://www.iconsdb.com/icons/preview/green/twitter-xxl.png",
                                width: 32,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/Flag_map_of_Saudi_Arabia.svg/501px-Flag_map_of_Saudi_Arabia.svg.png",
                        height: 90,
                      ),
                    ],
                  ),
                ),
              ),
              centerTitle: true,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                manualCarouselDemo,
                SizedBox(
                  height: 20,
                ),
                Image.network(
                    "https://pbs.twimg.com/media/EFIt-7oXoAAnJrH?format=jpg&name=900x900"),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Center(
                    child: Text(
                      "بيانات المشاريع من حساب @SaudiProject",
                      style: TextStyle(fontSize: 8),
                    ),
                  ),
                )
              ],
            ),
          ),
          textDirection: TextDirection.rtl,
        );
      },
    );
  }
}
