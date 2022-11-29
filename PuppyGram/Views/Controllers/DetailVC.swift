//
//  DetailVC.swift
//  PuppyGram
//
//  Created by Joseph Szafarowicz on 11/9/22.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImageView.layer.cornerRadius = 10
        photoImageView.downloaded(from: itemsArray[selectedRow].media.m)
        titleLabel.text = itemsArray[selectedRow].title
        authorLabel.text = itemsArray[selectedRow].author
        
        let dateFormatter = DateFormatter()
        let dateObj = dateFormatter.date(from: itemsArray[selectedRow].published)
        dateFormatter.dateStyle = .short
        dateLabel.text = dateFormatter.string(from: dateObj!)
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "MainVC") as! MainVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
}
