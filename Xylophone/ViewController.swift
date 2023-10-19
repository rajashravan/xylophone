//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    
    func playKey(key: String) {
        guard let path = Bundle.main.path(forResource: key, ofType:"wav") else {
            return }
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("start")
    }
    
    
    @IBAction func keyPressed(_ sender: UIButton) {
        sender.layer.opacity /= 2
        let title: String = sender.currentTitle!
        
        playKey(key: title)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            sender.layer.opacity *= 2
        }
    }
    
    
}

