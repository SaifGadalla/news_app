import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news_screen.dart';
import 'package:news_app/states.dart';

import 'cubit.dart';

class ScienceScreen extends StatelessWidget{
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) => AppCubit()..getScience(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context, state) { },
        builder: (BuildContext context, Object? state) {

          var cubit= AppCubit.get(context);

          return ListView.separated(
            itemBuilder: (BuildContext context, int index) => MaterialButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsScreen(
                  image: cubit.science[index]['urlToImage'],
                  date: cubit.science[index]['publishedAt'],
                  description: cubit.science[index]['description'],
                  content: cubit.science[index]['content'],
                )),);
                },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10,),
                        image: DecorationImage(
                          image: NetworkImage('${cubit.science[index]['urlToImage']}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                        height: 120,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                '${cubit.science[index]['title']}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              '${cubit.science[index]['publishedAt']}',
                              style: TextStyle(
                                  color: Colors.grey
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            itemCount: cubit.science.length,
            separatorBuilder: (BuildContext context, int index) => Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}