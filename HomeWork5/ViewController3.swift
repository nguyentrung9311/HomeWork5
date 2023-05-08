//
//  ViewController3.swift
//  HomeWork5
//
//  Created by TrungNV (Macbook) on 08/05/2023.
//

import UIKit

class ViewController3: UIViewController {
    @IBOutlet weak var colorView: UIView!
    let colors = [#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), #colorLiteral(red: 0.4242848754, green: 1, blue: 1, alpha: 1)]
    var lastIndex: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        showRandomColor()
    }
    
    @IBAction func onRandomColorClicked(_ sender: Any) {
        showRandomColor()
    }
    
    private func showRandomColor() {
        let color = randomColor()
        colorView.backgroundColor = color
    }
    
    private func randomColor() -> UIColor {
        let randomIndex = Int.random(in: 0 ... colors.count - 1)
        if randomIndex == lastIndex {
            return randomColor()
        }
        lastIndex = randomIndex
        return colors[randomIndex]
    }
}
