//
//  book.swift
//  Blahblah
//
//  Created by Mark Lin on 3/23/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import Foundation

class book : NSObject, NSCoding {
  
  var bookname = "Name"
  var shelfLocation = "Name"
  var processed = true
  
  init(nameOfBook: String){
    bookname = nameOfBook
  }
  
  func enshelf(let targetShelf: shelf){
    targetShelf.booksOnShelf.append(self)
  }
  
  func unshelf(targetShelf: shelf) -> String {
    let array = targetShelf.booksOnShelf
//    println("array count= \(array.count)")
    let count = (array.count)-1
    var x = 0
    while (x<=count){
//      println("x= \(x)")
//      println("array count= \(count)")
      if targetShelf.booksOnShelf[x].bookname == self.bookname{
//        println("true")
        let indexNumber=x
        targetShelf.booksOnShelf[x].shelfLocation="reShelf"
        targetShelf.booksOnShelf.removeAtIndex(indexNumber)
        x=count+1
      }
      ++x
    }
  return bookname
  }
  
  required init(coder aDecoder: NSCoder) {
    self.bookname = aDecoder.decodeObjectForKey("bookname") as String
    self.shelfLocation = aDecoder.decodeObjectForKey("shelfLocation") as String
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(self.bookname, forKey: "bookname")
    aCoder.encodeObject(self.shelfLocation, forKey: "shelfLocation")
  }
}