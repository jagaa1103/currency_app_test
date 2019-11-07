//
//  CacheManager.swift
//  Currency
//
//  Created by Enkhjargal Gansukh on 2019/11/07.
//  Copyright © 2019 Enkhjargal Gansukh. All rights reserved.
//

import Foundation

let urlString = "http://www.apilayer.net/api/live?access_key=71173edc3f850058ab4ddbfcd143d250&format=1"

class CacheManager {
    private let diskSize = 100 * 1024 * 1024
    private lazy var cache: URLCache = {
        return URLCache(memoryCapacity: 0, diskCapacity: diskSize, diskPath: "currencyCache")
    }()
    
    typealias DownloadComplete = (Result<Data,Error>) -> ()

    private func prepareSession() -> URLSession {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.requestCachePolicy = .returnCacheDataElseLoad
        sessionConfiguration.urlCache = cache
        return URLSession(configuration: sessionConfiguration)
    }

    func download(completion: @escaping DownloadComplete) {
        guard let downloadUrl = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: downloadUrl)
        if let cached = getCache(url: urlRequest) {
            print("cached data")
            completion(.success(cached))
        }else{
            getFromServer(request: urlRequest, completion: { result in
                print("server data")
                completion(result)
            })
        }
    }
    
    func getFromServer(request: URLRequest, completion: @escaping DownloadComplete){
        let session = prepareSession()
        session.dataTask(with: request) { (data, response, error)  in
            if let err = error {
                completion(.failure(err))
            } else {
                self.setCache(request: request, data: data!, response: response!)
                completion(.success(data!))
            }
        }.resume()
    }
    
    func getCache(url: URLRequest)->Data? {
        if let cached = self.cache.cachedResponse(for: url), let requestDate = cached.userInfo?["cachedDate"] as? Date {
            if checkExpiration(cachedDate: requestDate) {
                return nil
            }
            return cached.data
        }
        return nil
    }
    
    func checkExpiration(cachedDate: Date) -> Bool {
        let now = Date().timeIntervalSince1970
        let requested = cachedDate.timeIntervalSince1970
        let diff = now - requested
        print("diff", diff)
        return diff > 1800
    }
    
    func setCache(request: URLRequest, data: Data, response: URLResponse){
        var info = [String: Date]()
        info["cachedDate"] = Date()
        let cachedResponse = CachedURLResponse(response: response, data: data, userInfo: info, storagePolicy: .allowed)
        self.cache.storeCachedResponse(cachedResponse, for: request)
    }
}
