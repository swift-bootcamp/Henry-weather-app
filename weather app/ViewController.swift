//
//  ViewController.swift
//  weather app
//
//  Created by Henry on 8/16/14.
//  Copyright (c) 2014 Henry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLConnectionDataDelegate {
    
    @IBOutlet var city: UILabel!
    @IBOutlet var country: UILabel!
    
    @IBOutlet var rainy: UIImageView!
    
    @IBOutlet var temperature: UILabel!
    
    var data: NSMutableData = NSMutableData()
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let background = UIImage(named: "weather-background.jpg")
        self.view.backgroundColor = UIColor(patternImage: background)
        //background image
        
        self.city.text = "Taipei"
        self.country.text = "Taiwan"
        
        self.rainy.image = UIImage(named: "rainy-icon")
        
        startConnection()
    }
    
        func startConnection() {
            var restAPI: String = "http://api.openweathermap.org/data/2.5/weather?q=Taipei"
            var url: NSURL = NSURL(string: restAPI)
            var request: NSURLRequest = NSURLRequest(URL: url)
            var connection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: true)
            
            println("start downloading")
        }
        //start downloading
        
        func connection(connection: NSURLConnection!, didReceiveData dataReceived: NSData!) {
            print("downloading")
            
            self.data.appendData(dataReceived)
        }
        //downloading
        
        func connectionDidFinishLoading(connection: NSURLConnection!) {
            print("download finished")
            
            var json = NSString(data: data, encoding: NSUTF8StringEncoding)
            
            println(json)
            
            var error: NSError?
            let jsonDictionary = NSJSONSerialization.JSONObjectWithData(self.data, options: NSJSONReadingOptions.MutableContainers, error: &error) as NSDictionary
            
            let temp: AnyObject? = jsonDictionary["main"]?["temp"]
            
            let weatherTempCelsius = Int(round((temp!.floatValue - 273.15)))
            let weatherTempFahrenheit = Int(round(((temp!.floatValue - 273.15) * 1.8) + 32))
            
            self.temperature.text = "\(weatherTempCelsius)℃"
        }
        //finish download
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

