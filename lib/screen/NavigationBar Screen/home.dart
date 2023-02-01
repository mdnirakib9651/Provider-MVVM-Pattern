import 'package:auto_size_text/auto_size_text.dart';
import 'package:bandspicker/screen/detials.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Custom/gridviewcustom.dart';
import '../../Custom/images.dart';
import '../../State Management/Provider/featuredprovider.dart';
import '../../State Management/Provider/popularprovider.dart';
import '../../utils/color_resources.dart';
import '../../utils/styles.dart';
import '../populardetials.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final featuredMdl = Provider.of<FeaturedProvider>(context, listen: false);
    final popularMdl = Provider.of<PopularProvider>(context, listen: false);
    featuredMdl.getFeaturedData();
    popularMdl.getPopularData();
  }

  @override
  Widget build(BuildContext context) {
    // print("Current height"+ MediaQuery.of(context).size.height.toString());
    final featuredMdl = Provider.of<FeaturedProvider>(context);
    final popularMdl = Provider.of<PopularProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.COLOR_PRIMARY,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    height: 40,
                    width: 40,
                    child: ClipRRect(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(Images.MUSIC),
                          RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' Bands',
                                    style: LatoRegular.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurpleAccent,
                                        fontSize: 20)),
                                TextSpan(
                                    text: 'picker',
                                    style: LatoRegular.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                        fontSize: 20)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 40,
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Search",
                      hintStyle: LatoRegular.copyWith(fontSize: 18),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 30), // <-- SEE HERE
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Featured",
                  style: LatoRegular.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                Consumer<FeaturedProvider>(builder: (context, featured, child) {
                  return featured.FeaturedList != null
                      ? Container(
                          height: MediaQuery.of(context).size.width * 1.1,
                          width: MediaQuery.of(context).size.width,
                          child: GridView.builder(
                            itemCount: featured.FeaturedList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return GridViewCustoms(
                                  image: Image.asset(
                                      featured.FeaturedList[index].image,
                                      fit: BoxFit.fill),
                                  title:
                                      "${featured.FeaturedList[index].title}",
                                  onTab: () => Details(
                                      featuredModel:
                                          featured.FeaturedList[index]));
                            },
                            physics: NeverScrollableScrollPhysics(),
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                }),
                Text(
                  "Popular",
                  style: LatoRegular.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                Consumer<PopularProvider>(builder: (context, popular, child) {
                  return popular.PopularList != null
                      ? Container(
                          height: MediaQuery.of(context).size.width * 1.1,
                          width: MediaQuery.of(context).size.width,
                          child: GridView.builder(
                            itemCount: popular.PopularList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 15,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return GridViewCustoms(
                                  image: Image.asset(
                                      popular.PopularList[index].image,
                                      fit: BoxFit.fill),
                                  title: "${popular.PopularList[index].title}",
                                  onTab: () => PopularDetials(
                                        popularModel:
                                            popular.PopularList[index],
                                      ));
                            },
                            physics: NeverScrollableScrollPhysics(),
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
