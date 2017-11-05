//
//  ViewController.swift
//  dz4
//
//  Created by Eric on 11/5/17.
//  Copyright © 2017 Piligrim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var channel: UILabel!
    @IBOutlet weak var volumeValue: UILabel!
    @IBOutlet weak var brandName: UILabel!
 
    let tv = TvSet(brand: "Samsung", sizeDisplay: 40, turnOn: false, channel: "Pixel")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        print("Power of tv was \(tv.isPowerOn ? "ON" : "OFF")")
        if !tv.isPowerOn {
            print("Switch power of tv")
            tv.turnOnOff()
            print("Now tv power is \(tv.isPowerOn ? "ON" : "OFF")")
        }
        
        print("Increase level of volume to \(tv.changeVolume(direction: VolumeDirection.higher))")
        
        channel.text = tv.channel
        brandName.text = tv.brandName
    }

    @IBAction func upVolume(_ sender: UIButton) {
        volumeValue.text = String(tv.changeVolume(direction: .higher))
    }
    
    
    @IBAction func downVolume(_ sender: UIButton) {
        volumeValue.text = String(tv.changeVolume(direction: .lower))
    }
    
}

