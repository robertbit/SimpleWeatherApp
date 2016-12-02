//
//  CItyDataViewController.swift
//  SimpleWeatherApp
//
//  Created by robert on 01/12/2016.
//  Copyright © 2016 robert. All rights reserved.
//

import UIKit

class CItyDataViewController: UIViewController {
    
    @IBOutlet weak var cityNameLbl: UILabel!
    
    @IBOutlet weak var weatherDescription: UILabel!
    
    @IBOutlet weak var weatherIcon: UIImageView!
    
    @IBOutlet weak var currentWeather: UILabel!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var todauMinMax: UILabel!
    
    
    @IBOutlet weak var fahrenheit: UIButton!

    @IBOutlet weak var celcius: UIButton!
    
    var currentCityName:String?
    var currentID:String?
    var currentTemp:Int?
    
    var minTemp:Int?
    var maxTemp:Int?
    
    
    @IBAction func onFahrenheit(_ sender: UIButton) {
        let feVal = CelciusFarenheitConvertor.convertTofahrenheit(celsius: Double(self.currentTemp!))
        self.currentWeather.text = getCurrentTempMessage(tempe:Int(feVal))
        self.todauMinMax.text = getMinMaxTempMesssage(min: Int(CelciusFarenheitConvertor.convertTofahrenheit(celsius: Double(self.minTemp!))), max: Int(CelciusFarenheitConvertor.convertTofahrenheit(celsius: Double(self.maxTemp!))))
        
    }
    @IBOutlet weak var buttonsView: UIView!
    
    
    @IBAction func onCelcius(_ sender: UIButton) {
        self.currentWeather.text = getCurrentTempMessage(tempe:Int(self.currentTemp!))
        self.todauMinMax.text = self.getMinMaxTempMesssage(min:(self.minTemp)! ,max:(self.maxTemp)!  )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
        self.buttonsView?.layer.borderWidth = 1
        self.buttonsView?.layer.borderColor = UIColor.black.cgColor
        
        
        // make sure none of the default values are left
        cleanData()
        
        
        reloadData()
        // Do any additional setup after loading the view.
    }
    
    func cleanData(){
        cityNameLbl.text = ""
        
        weatherDescription.text = ""
        
        currentWeather.text = ""
        
        todauMinMax.text = ""
        

    }
    
    func getCurrentTempMessage(tempe:Int)->String{
        
        return "Currently \(tempe)˚"
        
    }
    
    
    func getMinMaxTempMesssage(min:Int,max:Int)->String{
        return "Today \(min)˚ - \(max)˚"
        
    }
    func reloadData(){
        
        if currentCityName != nil && currentID != nil{
            
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
                
                // going off to a different thread, needs to be week inorder to avoid memory leaks
                weak var weakSelf = self
                
                spinner.startAnimating()
                
                appDelegate.serviceProvider?.cityWeatherService.getCityWeatherData(cityID: currentID!, onSuccess: {
                    cityData,launchedCityId in
                    
                    

                    // this if condition is checking that the currect response is filling the UI data
                    if launchedCityId == weakSelf?.currentID!{
                        
                        weakSelf?.currentTemp = Int(cityData.currentTemperature!.rounded())
                    
                        weakSelf?.minTemp = Int(cityData.todayLow!.rounded())
                        
                        weakSelf?.maxTemp = Int(cityData.todayHigh!.rounded())
                        
                        weakSelf?.cityNameLbl.text = cityData.cityName
                        weakSelf?.weatherDescription.text = cityData.weatherDescription
                        weakSelf?.weatherIcon.image = cityData.uiImage
                        weakSelf?.currentWeather.text = weakSelf?.getCurrentTempMessage(tempe: (weakSelf?.currentTemp!)!)
                        weakSelf?.todauMinMax.text = weakSelf?.getMinMaxTempMesssage(min:(weakSelf?.minTemp)! ,max:(weakSelf?.maxTemp)!  )
                        
                        
                    }else{
                        NSLog("Warning!!!! Returned result is relevent for \(cityData.cityName ) and current is \(weakSelf?.currentCityName)")
                    }
                    weakSelf?.spinner.stopAnimating()
                    
                    }, onError: {
                        error in
                        NSLog("Failed to get city Weather data, error \(error.localizedDescription)" )
                        weakSelf?.spinner.stopAnimating()
                        
                })
            }
            
            
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setCityDisplayID(id:String,cityName:String){
        currentCityName = cityName
        currentID = id
        
        
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
