//
//  CityWeatherServiceImpl.swift
//  SimpleWeatherApp
//
//  Created by robert on 30/11/2016.
//  Copyright © 2016 robert. All rights reserved.
//

import Foundation
import UIKit


class CityWeatherServiceImpl:CityWeatherService{
    var webClient:WebClient
    
    init(){
        webClient = WebClient()
    }
    
    func getCityWeatherData(cityID:String,onSuccess:@escaping(_ responseData:CityWeatherData,_ cityID:String)->Void,onError:@escaping (Error)->Void){
        webClient.getCityWeatherDataByID(id:cityID,onSuccess: {data in
        
            let cityData:CityWeatherData = CityWeatherData()
            do {
                let map = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
                cityData.fillModel(data: map!)
                
                // get the image icon
                if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
                    if let uiImage = appDelegate.serviceProvider?.imageService.getSyncImageByID(id: cityData.currentWeatherIconID!){
                        cityData.uiImage = uiImage
                    }
                      
                }
                
                
                NSLog("Recieved json response succesfuly, giving it to the main queue")
                OperationQueue.main.addOperation({


                    onSuccess(cityData,cityID)
                })
            } catch let error {
                NSLog("Failed to convert Data to json with error \(error.localizedDescription)")
                OperationQueue.main.addOperation({
                    
                    // handeling the error on the main queue
                    onError(error)
                })
                
                
            }
            
            },onError:{error in
                NSLog("Failed to get data response, no error thrown")
                OperationQueue.main.addOperation({
                    
                    // handeling the error on the main queue
                    onError(error)
                })

        })
        
            
        
    }
}
