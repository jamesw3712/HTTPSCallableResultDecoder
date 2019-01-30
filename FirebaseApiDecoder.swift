//
//  FirebaseApiDecoder.swift
//  Tidbt
//
//  Created by James Warda on 12/7/18.
//

import Foundation
import FirebaseFunctions

extension HTTPSCallableResult{
    
    func getDecodedResult<T: Decodable>(decodeTo: T.Type) -> T? {
        
        if let data = self.data as? [String: Any]{
            return self._getDecodedResult(dictionary: data, t: decodeTo)
            
        }
        return nil
    }
    
    private func _getDecodedResult<T: Decodable>(dictionary: [String: Any], t: T.Type) -> T?{
        print(dictionary)
        do {
            
            if let profileObjectJson = dictionary["data"] as? [String: Any]{
                let jsonData = try? JSONSerialization.data(withJSONObject: profileObjectJson)
                
                if let data: Data = jsonData{
                    let apiResult = try JSONDecoder().decode(t, from: data)
                    return apiResult
                }
            }
            
            else if let profileObjectJson = dictionary["data"] as? [[String: Any]]{
                let jsonData = try? JSONSerialization.data(withJSONObject: profileObjectJson)
                
                if let data: Data = jsonData{
                    let apiResult = try JSONDecoder().decode(t, from: data)
                    return apiResult
                }
            }
            
            else if let profileObjectJson = dictionary["data"] as? T{
                return profileObjectJson
            }

            return nil
        }
        catch let error{
            print("##################------------------------- error in readig data from server: " + String(describing: error))
            return nil
        }
    }
    
}
