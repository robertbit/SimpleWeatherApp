//
//  ImageService.swift
//  SimpleWeatherApp
//
//  Created by robert on 01/12/2016.
//  Copyright © 2016 robert. All rights reserved.
//

import Foundation
import UIKit



protocol ImageService{
    
     func getSyncImageByID(id:String)->UIImage?
    
}
