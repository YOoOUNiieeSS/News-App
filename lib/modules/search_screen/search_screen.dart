import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      builder: (context,state)=>Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  label: 'Search',
                  validate: (String? value){
                    if(value!.isEmpty)return 'Search Must not be Empty.';
                    return null;
                  },
                  prefix: Icons.search,
                  onChanged: (value){
                    NewsCubit.get(context).getSearch(value!);
                  }
              ),
            ),
            Expanded(child: screenBuilder(NewsCubit.get(context).search,isSearch: true)),
          ],
        ),
      ),
      listener: (context,state){},
    );
  }
}
