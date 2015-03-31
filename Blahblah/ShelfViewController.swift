//
//  ShelfViewController.swift
//  Blahblah
//
//  Created by Mark Lin on 3/27/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import UIKit

class ShelfViewController: UIViewController {

  var selectedLibrary = library(nOfLibrary: "FakeTemp")
  var selectedShelf = shelf(shelfName: "FakeTemp")

  
  override func viewDidLoad() {
    super.viewDidLoad()
  println(selectedLibrary.nameOfLibrary)
//    self.title = self.selectedUser.firstName
//    FirstNameLabel.text = self.selectedUser.firstName
//    LastNameLabel.text = self.selectedUser.lastName
//    FirstNameLabel.delegate = self
//    LastNameLabel.delegate = self
//    BioField.delegate = self
//    ImagePlace.image = selectedUser.pictureOfPerson
//    BioField.text = self.selectedUser.bioOfPerson
  }

}
