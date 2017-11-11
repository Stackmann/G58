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
    private let channels = ["Discovery","Pixel","CNN","Animal Planet","FoxKids","1+1"]
    var channel : String
    var isPowerOn : Bool
    let sizeDisplay : Int
    let brandName: String
    private let maxVolumeLevel = 30
    
    init(brand: String, sizeDisplay: Int, turnOn: Bool, channel: String) {
        self.volumeLevel = 5
        if channels.contains(channel) {
            self.channel = channel
        } else {
            self.channel = channels[0]
        }
        self.isPowerOn = turnOn
        self.brandName = brand
        self.sizeDisplay = sizeDisplay
    }
    
    func turnOnOff() {
        isPowerOn = !isPowerOn
    }

    func changeChannelUp() {
        if var indexChannel = channels.index(of: channel) {
            indexChannel = indexChannel + 1
            if indexChannel == channels.endIndex { indexChannel = channels.startIndex}
            channel = channels[indexChannel]
        } else {
            channel = channels[channels.startIndex]
        }
    }

    func changeChannelDown() {
        if var indexChannel = channels.index(of: channel) {
            if indexChannel == channels.startIndex {
                indexChannel = channels.endIndex - 1
            } else {
                indexChannel = indexChannel - 1
            }
            channel = channels[indexChannel]
        }
    }

    func changeVolume(direction: VolumeDirection) -> Int {
        switch direction {
        case .higher:
            volumeLevel += 1
            volumeLevel = min(volumeLevel, maxVolumeLevel)
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
