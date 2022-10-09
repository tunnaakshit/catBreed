//
//  NetworkManager.swift
//  CatBreedList
//
//  Created by Akshit Sharma on 06/10/22.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let sharedInstance = NetworkManager()
    
    private init() {
        
    }
    
    public func executeNetworkRequest<T: Codable>(_ api: APIRequest, completion: @escaping (Result<T, Error>) -> Void) {
        
        var components = URLComponents()
        components.scheme = CatBreedListConstants.urlScheme
        components.host = api.baseUrl
        components.path = api.path
        components.queryItems = [
            URLQueryItem(name: "api_key", value: api.apiKey)
        ]
        let url = components.url
        
        if let url = url {
            AF.request(url, method: api.method.inHttpMethod(), parameters: api.queryParameters, encoding: api.encoding(), headers: api.getHeaders()).responseData(completionHandler: { response in
                switch response.result{
                case .success(let res):
                    if let code = response.response?.statusCode{
                        switch code {
                        case 200...299:
                            do {
                                completion(.success(try JSONDecoder().decode(T.self, from: res)))
                            } catch let error {
                                print(String(data: res, encoding: .utf8) ?? "Nothing received")
                                completion(.failure(error))
                            }
                        default:
                            let error = NSError(domain: response.debugDescription, code: code, userInfo: response.response?.allHeaderFields as? [String: Any])
                            completion(.failure(error))
                        }
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            })
        }
    }
}



