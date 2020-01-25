//
//  SoundManager.swift
//  Match
//
//  Created by Mohamed Mostafa Fawzi on 11/24/19.
//  Copyright © 2019 MohamedMostafaFawzi. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    
   static var audioPlayer:AVAudioPlayer?
    
    enum SoundEffect {
        
        case flip
        case shuffle
        case match
        case nomatch
        
    }
    
   static func playSound(_ effect:SoundEffect) {
        
        // Determine which sound effect we want to play
        // And set the appropriate file name
        var soundFileName = ""
        
        switch effect {
            
        case .flip:
            soundFileName = "cardflip"
            
        case .shuffle:
            soundFileName = "shuffle"
            
        case .match:
            soundFileName = "dingcorrect"
            
        case .nomatch:
            soundFileName = "dingwrong"

        }
        
        let bundlePath = Bundle.main.path(forResource: soundFileName, ofType: "wav")
        
        guard bundlePath != nil else {
            print("Couldn't find sound file name \(soundFileName) in the bundle")
            return
        }
        
        // Create a URL object from this string path
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        do {
            
            // Create audio player object
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            
            // Play the sound
            audioPlayer?.play()
        }
        catch  {
            // Couldn't create the audio player object, log the error
            print("Couldn't create the audio player object for sound file \(soundFileName)")

        }
       
        
        
        
    }
    
}

