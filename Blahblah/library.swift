//
//  library.swift
//  Blahblah
//
//  Created by Mark Lin on 3/23/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import Foundation

class library{

  let nameOfLibrary = "Name"
  var numberOfShelves = -1
  var listOfShelves = [shelf]()

  init (nameOfLibrary: String){
    let nameOfLibrary = nameOfLibrary
  }
  
  func listAllBooks()->String{
    let count = self.listOfShelves.count
    var x = 0
    var temparray = [listOfShelves]
    while (x<=count){
      temparray = self.listOfShelves[x].booksOnShelf
      ++x
    }
    
    
    return nameOfLibrary
  }
  

}