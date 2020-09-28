//
//  NetworkService.swift
//  anonymTestApp
//
//  Created by Malygin Georgii on 23.09.2020.
//

import Foundation

protocol NetworkDataProtocol {
    func getItems(first: String, orderBy: String, completion: @escaping(Result<JSONFile?, Error>) -> Void)
    func getNewItems(first: String, after: String, orderBy: String, completion: @escaping (Result<JSONFile?, Error>) -> Void)
}

class NetworkData: NetworkDataProtocol {
    func getItems(first: String, orderBy: String, completion: @escaping (Result<JSONFile?, Error>) -> Void) {
        let parameters = ["first" : first,
                          "orderBy" : orderBy
        ]
        self.fetchJSON(parameters: parameters, response: completion)
    }
    
    func getNewItems(first: String, after: String, orderBy: String, completion: @escaping (Result<JSONFile?, Error>) -> Void) {
        var parameters = ["orderBy": orderBy, "after": after, "first": first
        ]
        self.fetchJSON(parameters: parameters, response: completion)
    }
    
    static let networkData = NetworkData()
    let requestNetwork = RequestNetwork()
    
    private func fetchJSON<T : Decodable>(parameters: [String : String], response: @escaping(Result<T?, Error>) -> Void) {
        requestNetwork.request(parameters: parameters) { (result) in
            switch result {
            case .success(let data):
                let decodedData = self.decodeJSON(type: T.self, from: data)
                response(.success(decodedData))
            case .failure(let error):
                response(.failure(error))
            }
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from data: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = data, let response = try? decoder.decode(type.self, from: data) else {
            return nil }
        
        return response
    }
}

