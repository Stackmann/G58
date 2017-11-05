//
//  tvset.swift
//  dz4
//
//  Created by Eric on 11/5/17.
//  Copyright © 2017 Piligrim. All rights reserved.
//

import Foundation

class TvSet {
    private var volumeLevel : Int
    var channel : String
    var isPowerOn : Bool
    let sizeDisplay : Int
    let brandName: String
    
    init(brand: String, sizeDisplay: Int, turnOn: Bool, channel: String) {
        self.volumeLevel = 5
        self.channel = channel
        self.isPowerOn = turnOn
        self.brandName = brand
        self.sizeDisplay = sizeDisplay
    }
    
    func turnOnOff() {
        isPowerOn = !isPowerOn
    }

    private func getMaxVolumeLevel() -> Int {
        return 30
    }

    func changeVolume(direction: VolumeDirection) -> Int {
        switch direction {
        case .higher:
            volumeLevel += 1
            volumeLevel = min(volumeLevel, getMaxVolumeLevel())
        default:
            volumeLevel -= 1
            volumeLevel = max(volumeLevel, 0)
        }
        return volumeLevel
    }
    

}

enum VolumeDirection{
    case higher
    case lower
}
