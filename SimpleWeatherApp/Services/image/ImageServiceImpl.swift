//
//  ImageServiceImpl.swift
//  SimpleWeatherApp
//
//  Created by robert on 01/12/2016.
//  Copyright © 2016 robert. All rights reserved.
//

import Foundation
import UIKit


class ImageServiceImpl:ImageService{
    
    //this method returns the image from URL,
    //its happening on same thread that its being called from so no main thread calls
    func getSyncImageByID(id:String)->UIImage?{
        
        let nsUrl:NSURL? = NSURL(string:"http://openweathermap.org/img/w/\(id).png")
        
        do{
            let data:NSData = try NSData(contentsOf:nsUrl! as URL)
            let uiImage = UIImage(data:data as Data)
            NSLog("got image data from network for image ID \(id)")
            return uiImage!
            
            
        }catch let error {
            
            NSLog("ERROR!!! failed to get image data from network for image ID \(id), error \(error.localizedDescription)")
        }
        return nil
        
        
        
    }
}
