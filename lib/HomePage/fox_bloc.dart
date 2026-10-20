import 'package:bloc/bloc.dart';
import 'package:exam1/HomePage/Repository.dart';
import 'package:meta/meta.dart';

part 'fox_event.dart';
part 'fox_state.dart';

class FoxBloc extends Bloc<FoxEvent, FoxState> {
  final PetRepository _repository = PetRepository();
  FoxBloc() : super(FoxInitial()) {
    on<GetFoxImageEvent>((event, emit) async{
      try{
        emit(LoadingFoxState());
        final String foxImage = await _repository.getRandomFoxImage();
        emit(LoadedFoxImageState(img: foxImage));
      }
      catch(error){
        emit(ErrorFoxState());
      }
    });
  }
}
