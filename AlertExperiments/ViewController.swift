//
//  ViewController.swift
//  AlertExperiments
//
//  Created by Magaly Trevino on 8/8/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var alertButton: UIButton!
    @IBOutlet weak var actionSheetButton: UIButton!
    @IBOutlet weak var destructiveButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showAlert(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Apple Says Titles Should Be Capitalized", message: "However, messages don't need to capitalize each word.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.messageLabel.text = "Cool—thanks for the UI tip!"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            self.messageLabel.text = ""
        }
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func showActionSheet(_ sender: UIButton) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let yellowAction = UIAlertAction(title: "Turn Background Yellow", style: .default) { _ in
            self.view.backgroundColor = .yellow
            self.messageLabel.text = ""
        }
        
        let whiteAction = UIAlertAction(title: "Turn Background White", style: .default) { _ in
            self.view.backgroundColor = .white
            self.messageLabel.text = ""
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(yellowAction)
        alertController.addAction(whiteAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func showDestructiveOptions(_ sender: UIButton) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let friendlyAction = UIAlertAction(title: "Be Friendly", style: .default) { _ in
            self.messageLabel.text = "Hey there, smartie! Stay Swifty!"
        }
        
        let grumpyAction = UIAlertAction(title: "Be Grumpy", style: .default) { _ in
            self.messageLabel.text = "😡"
        }
        
        let loseAllAction = UIAlertAction(title: "Lose All Ye Buttons!", style: .destructive) { _ in
            self.messageLabel.text = "Oh Noooooo!!!"
            
            UIView.animate(withDuration: 0.5, animations: {
                self.alertButton.center.y -= self.view.bounds.height
                self.actionSheetButton.center.x -= self.view.bounds.width
                self.destructiveButton.center.x += self.view.bounds.width
            })
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(friendlyAction)
        alertController.addAction(grumpyAction)
        alertController.addAction(loseAllAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

