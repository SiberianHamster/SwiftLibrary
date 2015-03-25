//
//  book.swift
//  Blahblah
//
//  Created by Mark Lin on 3/23/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import Foundation

class book{
  
  var bookname = "Name"
  
  init(nameOfBook: String){
    bookname = nameOfBook
  }
  
  func enshelf(let targetShelf: shelf){
    targetShelf.booksOnShelf.append(self)
  }
  
  func unshelf(targetShelf: shelf){
    let array = targetShelf.booksOnShelf
    let count = (array.count)-1
    var x = 0
    while (x<=count){
      if targetShelf.booksOnShelf[x].bookname == self.bookname{
        let indexNumber=x
        targetShelf.booksOnShelf.removeAtIndex(indexNumber)
      }
      ++x
    }
  
}
}