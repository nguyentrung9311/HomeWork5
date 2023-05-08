//
//  ViewController2.swift
//  HomeWork5
//
//  Created by TrungNV (Macbook) on 07/05/2023.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var ivPreview: UIImageView!
    
    let images = ["img1.jpg", "img2.jpg", "img3.jpg", "img4.jpg", "img5.jpg", "img6.jpg", "img7.jpg", "img8.jpg", "img9.jpg", "img10.jpg"]
    var lastImageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadRandomImage()
    }

    @IBAction func onRandomImageClicked(_ sender: UIButton) {
        loadRandomImage()
    }
    
    private func loadRandomImage() {
        let imageName = randomImageName()
        lastImageName = imageName
        ivPreview.image = UIImage(named: imageName)
    }
    
    private func randomImageName() -> String {
        let imageName = images[Int.random(in: 0 ... images.count - 1)]
        if imageName == lastImageName {
            return randomImageName()
        }
        return imageName
    }
}
