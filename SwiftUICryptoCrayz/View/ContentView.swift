//
//  ContentView.swift
//  SwiftUICryptoCrayz
//
//  Created by Burak Öztopuz on 5.07.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cryptoListViewModel : CryptoListViewModel
    
    init(){
        self.cryptoListViewModel = CryptoListViewModel()
    }
    
    var body: some View {
        
        NavigationView{
            
                List(cryptoListViewModel.cryptoList, id:\.id ){ crypto in
                    VStack{
                    Text(crypto.name)
                        .font(.title3)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(crypto.price)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)

                }
                }.toolbar(content: {
                    Button {
                        Task.init {
                            self.cryptoListViewModel.cryptoList = []
                           await self.cryptoListViewModel.downloadCryptosAsync(url: URL(string: "https://api.nomics.com/v1/currencies/ticker?key=fb2de3680cbcac921cdccfa5fb0d949f2ea7b5cc")!)
                        }
                    } label: {
                        Text("Refresh")
                    }

                })
                .navigationTitle(Text("Crypto Currencies"))
        }.task(){
           
              await self.cryptoListViewModel.downloadCryptosAsync(url: URL(string: "https://api.nomics.com/v1/currencies/ticker?key=fb2de3680cbcac921cdccfa5fb0d949f2ea7b5cc")!)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
