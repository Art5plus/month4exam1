import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'fox_bloc.dart';

class ImageFoxPage extends StatefulWidget {
  const ImageFoxPage({super.key});

  @override
  State<ImageFoxPage> createState() => _ImageFoxPageState();
}

class _ImageFoxPageState extends State<ImageFoxPage>{
  final FoxBloc _foxBloc = FoxBloc();

  @override
  void initState() {
    super.initState();
    _foxBloc.add(GetFoxImageEvent());
    // super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
          onPressed: (){_foxBloc.add(GetFoxImageEvent());}),
        body: Center(
            child: BlocBuilder<FoxBloc,FoxState>(
              bloc: _foxBloc,
                builder: ((context, state) {
                  if(state is LoadedFoxImageState){
                    return Image.network(state.img);
                  }
                  if(state is ErrorFoxState){
                    return Text('Ошибка загрзуки', style: TextStyle(fontSize: 50),);
                  }if(state is LoadingFoxState || state is FoxInitial){
                    return CircularProgressIndicator.adaptive();
                  }
                  return Text('Initial State');
                }
                )
            )
        )
    );
  }
}
