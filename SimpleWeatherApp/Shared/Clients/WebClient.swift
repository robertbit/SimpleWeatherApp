//
//  WebClient.swift
//  SimpleWeatherApp
//
//  Created by robert on 30/11/2016.
//  Copyright © 2016 robert. All rights reserved.
//

import Foundation


class WebClient{
    
    
    func getCityWeatherDataByID(id:String,onSuccess:@escaping ( _ responseData:Data)->Void,onError:@escaping (_ errorReason:Error)->Void){
        
        
        
        let request = NSMutableURLRequest(url: URL(string: "http://api.openweathermap.org/data/2.5/weather?id=\(id)&units=metric&APPID=227742b225a78802d4ed5b27e9b3c6b9")!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in
            
            if let errorData = error{
                onError(errorData)
            }
            
            if let responseData = response{
                print(responseData.debugDescription)
            }
            
            if let jsonData = data {
                onSuccess(jsonData)
            } else {
                NSLog("Failed to recieve json response")
                onError(NSError())
            }
        })
        task.resume()
        //
        
    }
}
