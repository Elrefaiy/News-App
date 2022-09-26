import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/layout/cubit/cubit.dart';
import 'package:newsapp/modules/web_view/web_view.dart';

Widget articleItemBuilder(article, context) => InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => WebScreen(article['url'], AppCubit.get(context).searchController.text)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                CircularProgressIndicator(
                  strokeWidth: 1.5,
                ),
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(

                      image: DecorationImage(
                        image: NetworkImage('${article['urlToImage']}'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.2),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                height: 120,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_outlined,
                          color: Colors.deepOrange,
                          size: 18,
                        ),
                        Text(
                          ' ${article['publishedAt']}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,

                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget listBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            articleItemBuilder(list[index], context),
        separatorBuilder: (context, index) => SizedBox(
          height: 20,
        ),
        itemCount: list.length,
      ),
      fallback: (context) => isSearch
          ? Container()
          : Center(
              child: CircularProgressIndicator(),
            ),
    );

Widget catItemBuilder(String label, int index, context) => InkWell(
      onTap: () {
        AppCubit.get(context).changeCatIndex(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: AppCubit.get(context).catIndex == index
            ? BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.deepOrange, width: 2)))
            : null,
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
            fontSize: 11, fontWeight: AppCubit.get(context).catIndex == index ? FontWeight.bold : FontWeight.normal),
        ),
      ),
    );
