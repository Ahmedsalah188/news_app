import 'package:flutter/material.dart';
import 'package:news_app/api_manger.dart';
import 'package:news_app/category/category_details_view_model.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/tabs/tab_container.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  Category category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourceByCategory(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryDetailsViewModel>(
          child: Text("Header"),
          builder: (context, viewModel, child) {
            if (viewModel.errorMessage != null) {
              return Column(
                children: [
                  Text(viewModel.errorMessage!),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.getSourceByCategory(widget.category.id);
                      },
                      child: Text("Try Again"))
                ],
              );
            } else if (viewModel.sourceList == null) {
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            } else {
              return Column(
                children: [
                  child!,
                  Expanded(
                      child: TabContainer(sourcesList: viewModel.sourceList!)),
                ],
              );
            }
          }),
    );
    //FutureBuilder<SourceResponse>(
    //future: ApiManager.getSources(widget.category.id);
    // builder: (context,snapshot) {
    // if (snapshot.connectionState == ConnectionState.waiting) {
    //  return Center(
    //   child: CircularProgressIndicator(
    //    color: Theme.of(context).primaryColor,
    // ),
    // );
    //} else if (snapshot.hasError) {
    //  return Column(
    //  children: [
    //   Text("something went wrong"),
    //  ElevatedButton(onPressed: () {
    //    ApiManager.getSources(widget.category.id);
    //    setState(() {

    //   });
    //   }, child: Text("Try Again"))
    //  ],
    //   );
    //   }

    ///response
    // if (snapshot.data?.status != "ok") {
    /// code , message
    // return Column(
    // children: [
    //  Text(snapshot.data?.message ?? ""),
    // ElevatedButton(onPressed: () {
    //  ApiManager.getSources(widget.category.id);
    //   setState(() {

    //   });
    //  }, child: Text("Try Again"))
    //   ],
    //  );
    //}
    // var sourcesList = snapshot.data?.sources ?? [];
    //   return TabContainer(sourcesList: sourcesList)
    //  }
    //);
  }
}
