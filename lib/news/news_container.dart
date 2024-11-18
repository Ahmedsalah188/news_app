import 'package:flutter/material.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/news/news_container_view_model.dart';
import 'package:news_app/news/news_item.dart';
import 'package:provider/provider.dart';

class NewsContainer extends StatefulWidget {
  Source source;

  NewsContainer({required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  NewsContainerViewModel viewModel = NewsContainerViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsContainerViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.errorMessage != null) {
            return Column(
              children: [
                Text(viewModel.errorMessage!),
                ElevatedButton(
                    onPressed: () {
                      viewModel.getNewsBySourceId(widget.source.id ?? "");
                    },
                    child: Text("Try Again"))
              ],
            );
          } else if (viewModel.newsList == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return NewsItem(news: viewModel.newsList![index]);
              },
              itemCount: viewModel.newsList!.length,
            );
          }
        },
      ),
    );
    //   FutureBuilder<NewsResponse>(
    //     future: ApiManager.getNewsBySourceId(widget.source.id??""),
    //     builder: (context,snapshot){
    //       if(snapshot.connectionState==ConnectionState.waiting){
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: Theme.of(context).primaryColor,
    //           ),
    //         );
    //       }else if(snapshot.hasError){
    //         return Column(
    //           children: [
    //             Text("Something went wrong"),
    //             ElevatedButton(onPressed: (){
    //               ApiManager.getNewsBySourceId(widget.source.id??"");
    //               setState(() {
    //
    //               });
    //             }, child: Text("Try Again"))
    //           ],
    //         );
    //       }
    //       ///response
    //       if(snapshot.data?.status !="ok"){
    //         return Column(
    //           children: [
    //             Text(snapshot.data?.message??"Something went wrong"),
    //             ElevatedButton(onPressed: (){
    //               ApiManager.getNewsBySourceId(widget.source.id??"");
    //               setState(() {
    //
    //               });
    //             }, child: Text("Try Again"))
    //           ],
    //         );
    //       }
    //       var newsList=snapshot.data?.articles??[];
    //       return ListView.builder(
    //           itemBuilder: (context,index){
    //             return NewsItem(news: newsList[index]);
    //           },
    //         itemCount: newsList.length,
    //       );
    //     }
    // );
  }
}
