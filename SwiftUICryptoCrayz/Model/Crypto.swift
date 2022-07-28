//
//  Crypto.swift
//  SwiftUICryptoCrayz
//
//  Created by Burak Öztopuz on 5.07.2022.
//

import Foundation


struct Crypto : Hashable, Decodable, Identifiable {
    
    let id = UUID()
    let currency : String
    let price : String
    
    private enum CodingKeys : String, CodingKey {
        case currency = "currency"
        case price = "price"
    }
}
