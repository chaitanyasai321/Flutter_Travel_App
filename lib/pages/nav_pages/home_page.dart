import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import '../../cubit/app_cubit.dart';
import '../../cubit/app_cubit_states.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var image = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling"
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: BlocBuilder<AppCubit, AppCubitStates>(
        builder: (context, state) {
          if(state is LoadedState){
            var info=state.places;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 70, left: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu,
                        color: Colors.grey.withOpacity(1),
                        size: 30,
                      ),
                      Expanded(child: Container()),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8)),
                      )
                    ],
                  )),
              SizedBox(height: 40),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: AppLargeText(text: "Discover"),
              ),
              SizedBox(height: 30),
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(text: "Places"),
                      Tab(
                        text: "Inspiration",
                      ),
                      Tab(
                        text: "Emotions",
                      ),
                    ],
                    labelPadding: EdgeInsets.only(left: 25, right: 30),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black38,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                width: double.maxFinite,
                height: 280,
                child: TabBarView(controller: _tabController, children: [
                  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: info.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return GestureDetector(
                           onTap: () {
                                BlocProvider.of<AppCubit>(context).detailPage(info[index]);
                              },
                          child: Container(
                            margin: EdgeInsets.only(right: 15, top: 15),
                            width: 200,
                            height: 280,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                //image: AssetImage("img/mountain.jpeg"),
                                image:NetworkImage("http://mark.bslmeiyu.com/uploads/"+info[index].img),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }),
                  Text("Tab 2"),
                  Text("Tab 3"),
                ]),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLargeText(
                      text: "Explore More",
                      size: 25,
                    ),
                    AppText(
                      text: "See all",
                      color: AppColors.textColor2,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 120,
                margin: EdgeInsets.only(left: 10),
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, ind) {
                      return Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'img/' + image.keys.elementAt(ind)),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            //SizedBox(height:5),
                            Container(
                              child: AppText(
                                text: image.values.elementAt(ind),
                                color: AppColors.textColor2,
                                size: 14,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          );
          }
          else 
          return Container();
        },
      ),
    );
  }
}
