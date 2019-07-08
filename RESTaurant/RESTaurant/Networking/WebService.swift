//
//  WebService.swift
//  RESTaurant
//
//  Created by dede.exe on 08/07/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import Foundation

class WebService {
    
    typealias Completion = (Data?, Error?) -> Void
    
    let session = URLSession(configuration: .default)
    
    func execute(request:URLRequest, completion:@escaping Completion) {
        session.dataTask(with: request) { (data, response, error) in
            if let err = error {
                completion(nil, err)
                return
            }
            
            completion(data, error)
        }.resume()
    }
}
