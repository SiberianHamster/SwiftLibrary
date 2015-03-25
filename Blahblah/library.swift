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
  
  func listAllBooks(){
    println("The following is a complete list of books: ")
    let count = self.listOfShelves.count
    var x = 0
    var i = 0
    var temparray = self.listOfShelves
    while (x<count){
      let innercount = temparray[x].booksOnShelf.count
      while (i<innercount){
        println(temparray[x].booksOnShelf[i].bookname)
      ++i}
      ++x
    }
  }
  

}