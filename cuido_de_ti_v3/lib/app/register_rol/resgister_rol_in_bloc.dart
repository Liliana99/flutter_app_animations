import 'dart:async';


class RegisterRolInBloc {

  final StreamController<bool> _isLoadingController = StreamController<bool>();
  Stream<bool> get isLoadingStream=>_isLoadingController.stream;
 
  void dispose() {
    _isLoadingController.close();
  }
  void setIsLoading(bool isLoading)=> _isLoadingController.add(isLoading);
  

  
}