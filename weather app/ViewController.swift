//
//  ViewController.swift
//  weather app
//
//  Created by Henry on 8/16/14.
//  Copyright (c) 2014 Henry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var city: UILabel!
    @IBOutlet var country: UILabel!
    
    @IBOutlet var rainy: UIImageView!
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //background image
        let background = UIImage(named: "weather-background.jpg")
        self.view.backgroundColor = UIColor(patternImage: background)
        
        self.city.text = "Taipei"
        self.country.text = "Taiwan"
        
        self.rainy.image = UIImage(named: "rainy-icon")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

