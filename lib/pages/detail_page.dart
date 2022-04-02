import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit_states.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app_button.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:flutter_cubit/widgets/responsive_button.dart';
import '../cubit/app_cubit.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppCubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        return Scaffold(
            body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:NetworkImage("http://mark.bslmeiyu.com/uploads/"+detail.place.img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 70,
                left: 20,
                child: IconButton(
                  onPressed: () {
                    BlocProvider.of<AppCubit>(context).goHome();
                  },
                  icon: Icon(
                    Icons.menu,
                  ),
                  color: Colors.white,
                  iconSize: 30,
                ),
              ),
              Positioned(
                top: 70,
                right: 20,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_left,
                  ),
                  color: Colors.white,
                  iconSize: 30,
                ),
              ),
              Positioned(
                top: 260,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height - 250,
                  height: 620,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 25, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                text: detail.place.name,
                                color: Colors.black.withOpacity(0.8),
                              ),
                              AppLargeText(
                                text: "\$ "+detail.place.price.toString(),
                                size: 30,
                                color: AppColors.mainColor,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColors.mainColor,
                                size: 17,
                              ),
                              SizedBox(width: 6),
                              AppText(
                                text: detail.place.location,
                                color: AppColors.mainColor,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Wrap(
                              children: List.generate(5, (inde) {
                                return Icon(Icons.star,
                                    color: inde < detail.place.stars
                                        ? AppColors.starColor
                                        : AppColors.textColor2);
                              }),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            AppText(
                              text: "(${detail.place.stars.toString()}.0)",
                              color: AppColors.textColor2,
                              size: 14,
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        AppLargeText(
                          text: "People",
                          color: Colors.black.withOpacity(0.8),
                        ),
                        SizedBox(height: 5),
                        AppText(
                          text: "Number of people in your group",
                          color: AppColors.textColor2,
                          size: 15,
                        ),
                        SizedBox(height: 10),
                        Wrap(
                          children: List.generate(5, (boxIndex) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = boxIndex;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 5),
                                child: AppButton(
                                  color: selectedIndex == boxIndex
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: selectedIndex == boxIndex
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  borderColor: selectedIndex == boxIndex
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  size: 50,
                                  text: (boxIndex + 1).toString(),
                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: 20),
                        AppLargeText(
                          text: "Description",
                          size: 30,
                          color: AppColors.mainColor.withOpacity(0.8),
                        ),
                        SizedBox(height: 10),
                        AppText(
                          text:
                              detail.place.description,
                          color: AppColors.textColor2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 30,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButton(
                          color: AppColors.textColor2,
                          backgroundColor: Colors.white,
                          borderColor: AppColors.textColor2,
                          size: 60,
                          isIcon: true,
                          icon: Icons.favorite_outline),
                      SizedBox(
                        width: 10,
                      ),
                      ResponsiveButton(
                        isResponsive: true,
                      )
                    ],
                  ))
            ],
          ),
        ));
      },
    );
  }
}
