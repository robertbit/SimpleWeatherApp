//
//  LoadJsonUtil.swift
//  SimpleWeatherApp
//
//  Created by robert on 28/11/2016.
//  Copyright © 2016 robert. All rights reserved.
//


import XCTest
@testable import SimpleWeatherApp

import Foundation


class LoadJsonUtilTest: XCTestCase{
    
    
    func testLoadingJson(){
        let util = LoadJsonUtil()
        let bundle = Bundle(for: type(of: self))
        if let data:[AnyHashable: Any] = util.loadFileData(fileName: "citiesTest",bundle: bundle){
            print("found data \(data)")
           
        }else{
            
            // failed to load the data from file
            XCTAssertTrue(false)
        }
        
        
        
        
        
    }
}
