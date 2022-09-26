import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/cubit.dart';
import 'package:newsapp/layout/cubit/states.dart';
import 'package:newsapp/modules/web_view/web_view.dart';
import 'package:newsapp/shared/components/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) => () {},
      builder: (context, state) {
        var list ;
        switch(AppCubit.get(context).catIndex){
          case 0 :
            list = AppCubit.get(context).allNews;
            break;
          case 1 :
            list = AppCubit.get(context).business;
            break;
          case 2 :
          list = AppCubit.get(context).sports;
          break;
          case 3 :
            list = AppCubit.get(context).science;
            break;
          case 4 :
            list = AppCubit.get(context).technology;
            break;
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    catItemBuilder('All News', 0, context),
                    SizedBox(width: 20,),
                    catItemBuilder('Business', 1,context),
                    SizedBox(width: 20,),
                    catItemBuilder('Sports', 2,context),
                    SizedBox(width: 20,),
                    catItemBuilder('Science', 3,context),
                    SizedBox(width: 20,),
                    catItemBuilder('Technology', 4,context),
                  ],
                ),
              ),
            ),
            if(AppCubit.get(context).catIndex == 0)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CarouselSlider(
                  items: AppCubit.get(context).allNews.map((e) => InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                          MaterialPageRoute(builder: (context) => WebScreen('${e['url']}', AppCubit.get(context).searchController.text))
                      );
                    },
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 190,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('${e['urlToImage']}'),
                                fit: BoxFit.cover,
                              ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.3),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Text(
                            '${e['title']}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Raleway',
                            ),
                          ),
                        )
                      ],
                    ),
                  )).toList(),
                  options: CarouselOptions(
                    height: 190,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    reverse: false,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 500),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason){
                      AppCubit.get(context).changeIndicatorIndex(index);
                    }
                  ),
            ),
              ),
            if(AppCubit.get(context).catIndex == 0 && AppCubit.get(context).allNews.length > 0)
              AnimatedSmoothIndicator(
              activeIndex: AppCubit.get(context).activeIndex,
              count: 20,
              effect: ScrollingDotsEffect(
                maxVisibleDots: 7,
                dotWidth: 6,
                dotHeight: 6,
                dotColor: Colors.grey,
                activeDotColor: Colors.deepOrange,
                activeStrokeWidth: 1,
                activeDotScale: 2,
                fixedCenter: true,
              ),
            ),
            SizedBox(height: 10,),
            Expanded(child: listBuilder(list, context)),
          ],
        );
      },
    );
  }
}
