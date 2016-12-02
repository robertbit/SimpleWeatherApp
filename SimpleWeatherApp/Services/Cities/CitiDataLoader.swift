//
//  CitiDataLoader.swift
//  SimpleWeatherApp
//
//  Created by robert on 29/11/2016.
//  Copyright © 2016 robert. All rights reserved.
//

import Foundation


class CitiDataLoader{
    
    private let ROOT_KEY = "cities"
    private let CITY_KEY = "city"
    private let ID_KEY = "id"
    
    private let util:LoadJsonUtil
    
    init() {
         util = LoadJsonUtil()
    }
    
    func loadCitiData()->Array<Citi>?{
        
          // load the cities json from the file system
        let bundle = Bundle(for: type(of: self))
        if let jsonCitiesMap:[AnyHashable: Any] = util.loadFileData(fileName:"cities",bundle: bundle){
            let cities = getCitiesFronJsonMap(jsonMap:jsonCitiesMap)
            return cities
        }else{
            NSLog("Error: Failed to load cities from files system")
            return nil
        }
    }
    
    func getCitiesFronJsonMap(jsonMap:[AnyHashable: Any])->Array<Citi>?{
        
        var res = Array<Citi>()
        guard let jsonArr = jsonMap[ROOT_KEY] as? [Any]
            else {
                NSLog("The root is not as expected ")
                return nil
        }
        
        for citiDetails in jsonArr {
            
            guard let detailsMap = citiDetails as? [AnyHashable: Any]
                else {
                    continue
            }
            let citiName:String = detailsMap[CITY_KEY] as! String
            let id:String = detailsMap[ID_KEY] as! String
            
            res.append(Citi(id:id ,name:citiName))
            
            
        }
        
        return res
        
    }
    
    

}
