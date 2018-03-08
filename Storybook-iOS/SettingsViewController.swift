//
//  SettingsViewController.swift
//  Storybook-iOS
//
//  Created by Cody Li on 3/6/18.
//  Copyright © 2018 Cody Li. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class SettingsViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    var recordButton:     UIButton!
    var recordingSession: AVAudioSession!
    var audioRecorder:    AVAudioRecorder!
    
    override func viewDidLoad() {
        recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission(){ [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        self.loadRecordingUI()
                    }
                    else {
                        //failed to record!
                    }
                }
            }
        }
        catch {
            //failed to record
        }
    }
    
    func loadRecordingUI(){
        recordButton = UIButton(frame: CGRect(x: 64, y: 64, width: 128, height: 64))
        recordButton.setTitle("Tap to Record", for: .normal)
    }
    
}
