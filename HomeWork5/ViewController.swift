//
//  ViewController.swift
//  HomeWork5
//
//  Created by TrungNV (Macbook) on 07/05/2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var lbAlert: UILabel!
    @IBOutlet weak var btnResetGame: UIButton!
    @IBOutlet weak var tfInput: UITextField!

    var randomNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomNumber = Int.random(in: 1...100)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.playSound()
        }
    }

    @IBAction func onResetGame(_ sender: Any) {
        lbAlert.text = ""
        tfInput.text = ""
        btnResetGame.isHidden = true
        randomNumber = Int.random(in: 1...100)
    }
    
    @IBAction func onTryItClicked(_ sender: Any) {
        handlerInput()
    }
    
    private func handlerInput() {
        let inputNumber = Int(tfInput.text ?? "1") ?? 0
        
        if inputNumber == randomNumber {
            lbAlert.text = "Chúc mừng bạn đã đoán đúng"
            btnResetGame.isHidden = false
        } else if(inputNumber > randomNumber) {
            lbAlert.text = "Số bạn đoán lớn hơn số ngẫu nhiên"
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [self] in
                lbAlert.text = ""
            }
        } else {
            lbAlert.text = "Số bạn đoán nhỏ hơn số ngẫu nhiên"
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [self] in
                lbAlert.text = ""
            }
        }
    }
    
    private func playSound() {
        if let url = Bundle.main.url(forResource: "de_vuong", withExtension: "mp3") {
            print("Url: \(url)")
            do {
                let audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer.play()
                print("Audio playing")
            } catch let error {
                print("Error: \(error)")
            }
        } else {
            print("Url error")
        }
    }
}

