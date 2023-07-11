import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget{
  NewsScreen({
    Key? key,
    String? image ,
    String? date,
    String? description,
    String? content}){

    image1 = image!;
    date1 = date!;
    description1 = description!;
    content1 = content!;
  }

   String image1 = '' ;
   String date1 = '' ;
   String description1 = '';
   String content1 = '';


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                ),
            ),
            Text(date1),
            Text(description1),
            Image(
              image: NetworkImage(
                  image1,
              ),
              fit: BoxFit.cover,
            ),
            Text(content1),
          ],
        ),
      ),
    );
  }

}