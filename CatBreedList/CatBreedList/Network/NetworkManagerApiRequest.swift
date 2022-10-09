//
//  NetworkManagerApiRequest.swift
//  CatBreedList
//
//  Created by Akshit Sharma on 09/10/22.
//

import Foundation
import Alamofire

public protocol APIRequest {
    var baseUrl: String { get }
    var path: String { get }
    var apiKey: String { get }
    var method: HttpVerb { get }
    var headers: [String: String] { get }
    var queryParameters: [String: Any]? { get }
}

public extension APIRequest {

    func getHeaders() -> HTTPHeaders {
        return HTTPHeaders(self.headers)
    }
    
    func encoding() -> ParameterEncoding {
        return self.method == .GET ? URLEncoding.default : JSONEncoding.default
    }
}

public enum HttpVerb {
    case GET
    case POST
    case PUT
    case DELETE
    case PATCH
    case HEAD
    
    func inHttpMethod() -> HTTPMethod {
        switch self {
        case .GET: return HTTPMethod.get
        case .POST: return HTTPMethod.post
        case .PUT: return HTTPMethod.put
        case .DELETE: return HTTPMethod.delete
        case .PATCH: return HTTPMethod.patch
        case .HEAD: return HTTPMethod.head
        }
    }
}

public class DefaultAPIRequest: APIRequest {
    public var baseUrl: String
    public var path: String
    public var apiKey: String
    public var method: HttpVerb
    public var headers: [String : String]
    public var queryParameters: [String : Any]?
    
    public init(baseUrl: String, path: String, apiKey: String, method: HttpVerb, headers: [String: String], parameters: [String: Any]?) {
        self.baseUrl = baseUrl
        self.path = path
        self.apiKey = apiKey
        self.method = method
        self.headers = headers
        self.queryParameters = parameters
    }
}
