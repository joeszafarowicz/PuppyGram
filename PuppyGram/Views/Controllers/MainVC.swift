//
//  ViewController.swift
//  PuppyGram
//
//  Created by Joseph Szafarowicz on 11/9/22.
//

import UIKit

class MainVC: UITableViewController {
    
    let dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPhotos() { (photos) in
            itemsArray = photos.items
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        let item = itemsArray[indexPath.row]
        
        cell.titleLabel.text = item.title
        cell.photoImageView.layer.cornerRadius = 10
        cell.photoImageView.downloaded(from: item.media.m)
        
        //dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let dateObj = dateFormatter.date(from: item.published)
        dateFormatter.dateStyle = .short
        //dateFormatter.dateFormat = "M/d/yyyy"
        cell.dateLabel.text = dateFormatter.string(from: dateObj!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedRow = indexPath.row
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}

