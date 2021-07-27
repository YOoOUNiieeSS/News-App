import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/webview_screen/weebview_screen.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

Widget defaultFormField({
  @required TextInputType? type,
  @required TextEditingController? controller,
  bool isPassword = false,
  @required String? label,
  @required String? Function(String? x)? validate,
  void Function(String? x)? onSubmit,
  void Function(String? x)? onChanged,
  void Function()? onTap,
  @required IconData? prefix,
  IconData? suffix,
}) {
  return TextFormField(
    onTap: onTap,
    keyboardType: type,
    controller: controller,
    obscureText: isPassword,
    validator: validate,
    onFieldSubmitted: onSubmit,
    onChanged: onChanged,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(prefix),
      suffixIcon: Icon(suffix != null ? suffix : null),
      border: OutlineInputBorder(),
    ),
  );
}

Widget defaultButton({
  @required String? text,
  Color background = Colors.blue,
  double width = double.infinity,
  @required Function? function,
  bool isUpperCase = true,
  double radius = 0.0,
}) {
  return Container(
    width: width,
    decoration: BoxDecoration(
        color: background, borderRadius: BorderRadius.circular(radius)),
    child: MaterialButton(
      onPressed: () => function,
      child: Text(
        isUpperCase ? text!.toUpperCase() : text!,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
/*
Widget buildTaskItem(Map tasks, BuildContext context) {
  return Dismissible(
    key: Key(tasks['id'].toString()),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            child: Text(tasks['time']),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tasks['title'],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  tasks['date'],
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          IconButton(
            onPressed: () {
              AppCubit.get(context).updateData(status: 'done', id: tasks['id']);
            },
            icon: Icon(Icons.check_box),
            color: Colors.green,
          ),
          SizedBox(
            width: 20,
          ),
          IconButton(
            onPressed: () {
              AppCubit.get(context).updateData(status: 'archived', id: tasks['id']);
            },
            icon: Icon(Icons.archive),
            color: Colors.black45,
          ),
        ],
      ),
    ),
    onDismissed: (_){
      AppCubit.get(context).deleteData(id: tasks['id']);
    },
  );
}*/

Widget loadingItem(){
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.menu,size: 100,color: Colors.grey,),
        Text('No Tasks Yet, Please Add Some Tasks',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey),)
      ],
    ),
  );
}

Widget buildArticleItem(article,context)=> InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(article['url']));
  },
  child:   Padding(

      padding: EdgeInsets.all(20),

      child: Row(

        children: [

          Container(

            height: 120,

            width: 120,

            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10),

              image: DecorationImage(

                image: NetworkImage(article['urlToImage']==null?'https://www.pulsewednesbury.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg':article['urlToImage']),

                fit: BoxFit.cover

              )

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

                      article['title'],

                      maxLines: 3,

                      overflow: TextOverflow.ellipsis,

                      style: Theme.of(context).textTheme.bodyText1,

                    ),

                  ),

                  Text(

                    article['publishedAt'],

                    style: TextStyle(

                      color: Colors.grey,

                      fontSize: 16,

                    ),

                  ),

                ],

              ),

            ),

          )

        ],

      ),

    ),
);
Widget screenBuilder(dynamic list,{bool isSearch=false})=>BlocConsumer<NewsCubit,NewsStates>(
  builder: (context,state){
    return list.length==0?isSearch?Container():Center(child: CircularProgressIndicator()):ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (ctx,index)=>buildArticleItem(list[index],ctx),
      separatorBuilder: (ctx,index)=>Container(height: 1,color: Colors.grey,),
      itemCount: list.length,
    );
  },
  listener: (context,state){},
);

Widget myDivider()=>Container(height: 1,color: Colors.grey,);

void navigateTo(context,widget)=>Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));

