//
//  WebService.swift
//  Orders
//
//  Created by Islas on 3/3/20.
//  Copyright © 2020 Catskillet. All rights reserved.
//

import Foundation

enum Result<T>{
    case success(data: T), error(error: NetworkError)
}

extension Result {
    func get() throws -> T {
        switch self {
        case .success(let value):
            return value
        case .error(let error):
            throw error
        }
    }
}

enum NetworkError: Error{
    case encodingError, demainError, urlError
}

struct Resource<T: Codable>{
    let url: URL
}

class WebService{
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T>) -> Void){
        URLSession.shared.dataTask(with: resource.url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(Result.error(error: .demainError))
                return
            }
            if let result = try? JSONDecoder().decode(T.self, from: data){
                DispatchQueue.main.async {
                    completion(Result.success(data: result))
                }
            }else{
                completion(Result.error(error: .encodingError))
            }
        }.resume()
    }
}
