//
//  SelectedBookViewController.swift
//  Blahblah
//
//  Created by Mark Lin on 4/12/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import UIKit

class SelectedBookViewController: UIViewController {

  @IBOutlet weak var BookLabel: UILabel!
  
  @IBAction func Unshelf(sender: UIButton) {selectedBook.unshelf(shelfLocation)
  }
  
  var shelfLocation = shelf(shelfName: "TestShelf")
  var selectedBook = book(nameOfBook: "TestBook")
  var selectedBookName = "tempbook"
  
    override func viewDidLoad() {
        super.viewDidLoad()
      BookLabel.text = selectedBookName
    }

}
