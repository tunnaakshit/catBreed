//
//  NetworkManager.swift
//  CatBreedList
//
//  Created by Akshit Sharma on 06/10/22.
//

import Foundation
import Alamofire

var urlString = "https://api.thecatapi.com/v1/breeds"

class NetworkManager {
    
    static let sharedInstance = NetworkManager()
    
    private init() {
        
    }
    
    
    
    public func executeNetworkRequest<T: Codable>(url: String, method: HTTPMethod, params: [String: String]?, completion: @escaping (Result<T, Error>) -> Void) {
        
//        guard reachability.isReachable else {
//            let err = NSError(domain: NetworkClientErrorDomain, code: NetworkClientErrorCode.network_rechability_error, userInfo: NetworkClientUtility.getUserInfo(value: NetworkClientConstants.networkRechabilityErroMessage) as? [String : Any])
//            completion(.failure(err))
//            return
//        }
        
//        let url = getURL(baseURL: baseUrl, endPoint: endPoint)
        
        if let url = URL(string: url) {
            
            AF.request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: nil).responseData(completionHandler: { response in
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
    
//    private func getURL(baseURL: String, endPoint: String) -> URL {
//        var components = URLComponents()
//        components.scheme = "https"
//        components.host = baseURL
//        components.path = endPoint
//        if let url = components.url
//
//        return url
//    }
    
}



