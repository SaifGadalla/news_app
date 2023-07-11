import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit.dart';
import 'package:news_app/states.dart';

class BusinessScreen extends StatelessWidget{
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) => AppCubit()..getBusiness(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context, state) { },
        builder: (BuildContext context, Object? state) {

          var cubit= AppCubit.get(context);
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) => MaterialButton(
              onPressed: () {  },
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
                          image: NetworkImage('${cubit.business[index]['urlToImage']}'),
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
                                '${cubit.business[index]['title']}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                                '${cubit.business[index]['publishedAt']}',
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
            itemCount: cubit.business.length,
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