//
//  CryptoViewModel.swift
//  SwiftUICryptoCrayz
//
//  Created by Burak Öztopuz on 6.07.2022.
//

import Foundation


class CryptoListViewModel : ObservableObject {
    @Published var cryptoList = [CryptoViewModel]()
    let webservice = WebService()
    
    func downloadCryptosAsync(url : URL) async {
        do{
            let cryptos = try await webservice.downloadCurrenciesAsync(url: url)
            DispatchQueue.main.async {
                self.cryptoList = cryptos.map(CryptoViewModel.init)
            }
        }catch{
            print(error)
        }
    }
    
    /*func downloadCryptos(url : URL){
        webservice.downloadData(url: url) { result in
            switch result {
            case .failure(let error) :
                print(error.localizedDescription)
            case .success(let cryptos) :
                if let cryptos = cryptos {
                    DispatchQueue.main.async {
                        self.cryptoList = cryptos.map(CryptoViewModel.init)
                    }
                }
            }
        }
    }*/
    
    
}


struct CryptoViewModel {
    
    let cryptoViewModel : Crypto
    
    var id : UUID? {
        cryptoViewModel.id
    }
    
    var name : String {
        cryptoViewModel.currency
    }
    
    var price : String {
        cryptoViewModel.price
    }
}
