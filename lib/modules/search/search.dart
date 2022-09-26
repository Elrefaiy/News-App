import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/cubit/cubit.dart';
import 'package:newsapp/layout/cubit/states.dart';
import 'package:newsapp/shared/components/components.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var search = AppCubit.get(context).search;

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state){},
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 14),
                controller: AppCubit.get(context).searchController ,
                onFieldSubmitted: (value){
                  AppCubit.get(context).getSearch(AppCubit.get(context).searchController.text);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search, color: Colors.deepOrange, size: 22,),
                    onPressed: (){
                      AppCubit.get(context).getSearch(AppCubit.get(context).searchController.text);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Expanded(child: listBuilder(search, context, isSearch: true)),
          ],
        );
      },
    );
  }
}
