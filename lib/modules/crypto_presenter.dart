import 'package:flutter_cryptocurrency_app/data/crypto_data.dart';
import 'package:flutter_cryptocurrency_app/data/dependency_injection.dart';

abstract class CryptoListViewContract {
  void onLoadCryptoComplete( List <Crypto> items);
  void onLoadCryptoError();
}


class CryptoListPresenter {
  CryptoListViewContract _view ;
  CryptoRepository _repository ;

CryptoListPresenter(this._view){
  _repository = new Injector().cryptoRepository;

}

void loadCurrencies(){
  _repository .fetchCurrencies()
  .then((c)=> _view.onLoadCryptoComplete(c))
  .catchError((onError)=> _view.onLoadCryptoError());
}


}
