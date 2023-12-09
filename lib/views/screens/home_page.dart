import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newsapp/controller/theme_controller.dart';
import 'package:newsapp/helper/api_helper.dart';

import '../../models/news_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<NewsModel?> alldata;

  @override
  void initState() {
    alldata = APIHelper.apiHelper.fetchdata(NewsCategory: "");
    super.initState();
    // fetchdata();
  }
  
  // String category = 'sports';
  //
  // fetchdata()async{
  //   alldata = await APIHelper.apiHelper.fetchdata(NewsCategory: "$category");
  //   print(alldata);
  // }

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    return Scaffold(
      appBar: AppBar(
        actions: [
          GetBuilder<ThemeController>(builder: (_) {
            return Switch(
                value: themeController.themeModel.isdark,
                onChanged: (val) {
                  themeController.changeTheme(val: val);
                });
          }),
        ],
        title: Text("Homepage"),
      ),
      body: FutureBuilder(
          future: alldata,

          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              NewsModel? data = snapshot.data;
              print("data $data");
              if (data == null) {
                return Text("No available data...");
              } else {
                return ListView.builder(
                    itemCount: data.articles.length,
                    itemBuilder: (context, i) {
                    //
                     Article? article =  data.articles[i];
                    Source? source =  data.articles[i].source;
                      return ListTile(

                        title: Text(article.title!),
                        subtitle: Text(source!.name!),
                      );
                    });
              }
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
