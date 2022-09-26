import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newsapp/layout/cubit/cubit.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                AppCubit.get(context).changeMode();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.brightness_4_outlined,
                      size: 24,
                      color: Colors.grey[600],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Theme Mode',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Spacer(),
                    Text(
                      AppCubit.get(context).isDark ? 'Dark Mode' : 'Light Mode',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Divider(color: Colors.grey,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.language,
                    size: 24,
                    color: Colors.grey[600],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Language',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Spacer(),
                  Text(
                    'English (US)',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    size: 24,
                    color: Colors.grey[600],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Ask for Help',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey,),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: AppCubit.get(context).isDark
                        ? Colors.blueGrey[900]
                        : Colors.white,
                    title: Text(
                      'Are you sure ?',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18),
                    ),
                    content: Text(
                      'You want to exit News application',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 12, fontWeight: FontWeight.normal),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            exit(0);
                          },
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'No',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ))
                    ],
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.exit_to_app_rounded,
                      size: 24,
                      color: Colors.grey[600],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Exit',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
