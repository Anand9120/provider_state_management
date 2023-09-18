import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
class AuthProvider with ChangeNotifier{
  bool _loading=false;
  bool get loading=>_loading;
  setValue(bool value){
    _loading=value;
    notifyListeners();
  }



void login(String email,String pass)async{
setValue(true);
  try{
    Response response=await post(Uri.parse('https://reqres.in/api/login'),
    body: {
      'email':email,
        'password':pass
        }
    );
    if(response.statusCode==200){
      print('Successful');
      setValue(false);
    }else{
      print('Failed');
      setValue(false);
    }

  }
  catch(e){
    print(e.toString());

  }


}
}
