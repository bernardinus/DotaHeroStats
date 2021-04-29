//
//  Networking.swift
//  DotaHeroStats
//
//  Created by Bernardinus on 29/04/21.
//

import Foundation

class Networking
{
    static let shared = Networking()
    static let baseUrl = "https://api.opendota.com"
    let apiUrl = "https://api.opendota.com/api/herostats"
    
    
    var roleArray:[String] = []
    
    init()
    {
        
    }
    
    
    
    func loadHeroes(completion:@escaping (Bool, String, [Hero]) -> Void)
    {
        if(false)
        {
            
        }
        else
        {
            loadHeroFromAPI(completion: completion)
        }
    }
    
    func loadHeroFromAPI(completion: @escaping (Bool, String, [Hero]) -> Void)
    {
        request(reqURL: URL(string: apiUrl)!,completion:
        {
            (isSuccess, errorString, data) in
            if(isSuccess)
            {
                do {
                    let decoded = try JSONDecoder().decode([Hero].self, from: data)
                    completion(isSuccess, "", decoded)
                } catch let error as NSError {
                    print("Failed to decode JSON " + error.debugDescription)
                    completion(isSuccess,error.debugDescription, [])
                }
            }
            else
            {
                completion(isSuccess, errorString, [])
            }
            
        })
    }
    
    func request(reqURL:URL, completion: @escaping (Bool, String, Data) -> Void) {
        
        
        let session = URLSession.init(configuration: .default)
        let dataTask = session.dataTask(with: URLRequest(url: reqURL))
        {
            data, response, error -> Void in
            
            let httpResponse = response as! HTTPURLResponse
            if (httpResponse.statusCode == 200)
            {
                print("status code " + String(httpResponse.statusCode))
                completion(true, "", data!)
            }
            else
            {
                completion(false, error.debugDescription, data!)
            }
        }
        dataTask.resume()
    }
    
    
    
}
