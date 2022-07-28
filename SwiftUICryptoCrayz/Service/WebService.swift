//
//  WebService.swift
//  SwiftUICryptoCrayz
//
//  Created by Burak Öztopuz on 5.07.2022.
//

import Foundation


class WebService {
    
    func downloadCurrenciesAsync(url : URL) async throws -> [Crypto]{
        let (data, _) = try await URLSession.shared.data(from: url)
        let currencies = try? JSONDecoder().decode([Crypto].self, from: data)
        return currencies ?? []
    }
    
    /*
    func downloadData(url : URL , completion : @escaping (Result<[Crypto]?, downLoadError>) ->()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print("Error")
                completion(.failure(.networkError))
            }else{
                guard let data = data, error == nil else {
                    return completion(.failure(.dataError))
                }
                guard let currencies = try? JSONDecoder().decode([Crypto].self, from: data) else{
                    return completion(.failure(.parsingError))
                }
                completion(.success(currencies))
                
                
            }
        }.resume()
    }
     */
}

enum downLoadError : Error {
    case networkError
    case dataError
    case parsingError
}
