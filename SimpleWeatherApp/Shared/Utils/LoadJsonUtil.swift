//
//  LoadJsonUtil.swift
//  SimpleWeatherApp
//
//  Created by robert on 28/11/2016.
//  Copyright © 2016 robert. All rights reserved.
//

import Foundation

class LoadJsonUtil:NSObject{
    
    func loadFileData(fileName:String,bundle:Bundle)-> [AnyHashable: Any]?{
        let path = bundle.path(forResource: fileName, ofType: "json")!
        let jsonData = NSData(contentsOfFile: path)
        
        if let dataString = String(data: jsonData as! Data, encoding: .utf8){
            if let jsonMap = convertStringToDictionary(text: dataString){
                return jsonMap
            }else{
                NSLog("Failed to create json map frim file \(fileName)")
            }
            
            
           
        }
        NSLog("Could not convert json from file \(fileName).json")
        return nil;
        
        
    }
    
    
     public func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.data(using: String.Encoding.utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }

    
}
