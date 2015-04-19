//
//  ViewController.swift
//  Blahblah
//
//  Created by Mark Lin on 3/23/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  var shelves = [shelf]()
  var books = [book]()
  var listOfLibrary = [library]()
  var fictionShelf = shelf(shelfName: "fiction")
  var nfictionShelf = shelf(shelfName: "nonfiction")
  var reShelf = shelf(shelfName: "reshelf")
  
  
  @IBOutlet weak var TableView: UITableView!
  

  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.listOfLibrary.count
  }
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    TableView.reloadData()
    var i = 0
    while (i<books.count){
    var booklist = books[i].processed
    if booklist == false {
      reShelf.booksOnShelf.append(books[i])
      books[i].processed = true}
    ++i
    }
    
    self.saveToArchive()
  }
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    self.TableView.delegate = self
    self.TableView.dataSource = self
    let seattlePublic = library(nOfLibrary: "SeattlePublic")
    let bellevuePublic = library(nOfLibrary: "BellevuePublic")
    
    self.listOfLibrary.append(seattlePublic)
    self.listOfLibrary.append(bellevuePublic)
  
    fictionShelf = shelf(shelfName: "fiction")
    nfictionShelf = shelf(shelfName: "nonfiction")
    reShelf = shelf(shelfName: "reshelf")
    self.shelves.append(fictionShelf)
    self.shelves.append(nfictionShelf)
    self.shelves.append(reShelf)
    
    self.loadFromArchive()
    
    
    println("Books.count \(self.books.count)")
    if self.books.isEmpty {
      println("loading from plist")
      if let filePath = NSBundle.mainBundle().pathForResource("Book", ofType: "plist") {
        if let plistArray = NSArray(contentsOfFile: filePath) {
          for bookObject in plistArray {
            if let bookDictionary = bookObject as? NSDictionary {
              let nameofbook = bookDictionary["bookname"] as String
              let shelflocation = bookDictionary["shelfLocation"] as String
              let addbook = book(nameOfBook: nameofbook)
              if (shelflocation == "fiction"){
                fictionShelf.booksOnShelf.append(addbook)
              addbook.shelfLocation = "fiction"}
              else if (shelflocation == "nfiction"){nfictionShelf.booksOnShelf.append(addbook)
              addbook.shelfLocation = "nfiction"}
              else{reShelf.booksOnShelf.append(addbook)
              addbook.shelfLocation = "reShelf"}
            
          }
        }
      }}
    saveToArchive()
    }
    
    seattlePublic.listOfShelves = shelves
    bellevuePublic.listOfShelves = shelves
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let Cell = TableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
    let library = listOfLibrary[indexPath.row].nameOfLibrary
    Cell.textLabel?.text = library
    return Cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "shelvesView"{
      var segueNorm = segue.destinationViewController as ShelfViewController
      var selectedLibrary = self.TableView.indexPathForSelectedRow()
      var Library = listOfLibrary[selectedLibrary!.row]
      segueNorm.selectedLibrary = Library
    }
  }
  
  
  func loadFromArchive() {
    println("Begin loading")
    let path = getDocumentsPath()
    let arrayFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(path + "/MyArchive") as? [book]
    if arrayFromArchive != nil {
      self.books = arrayFromArchive!
      println(books.count)
      var x = 0
      while x<(books.count) {
      var addbook = books[x]
      
        if (addbook.shelfLocation=="fiction"){
        fictionShelf.booksOnShelf.append(addbook)}
        else if (addbook.shelfLocation=="nfiction"){
        nfictionShelf.booksOnShelf.append(addbook)}
        else {reShelf.booksOnShelf.append(addbook)}
        ++x
      }
      
  }
    println("End loading")
  
  }
  
  func saveToArchive() {
    println("Begin Saving")
  
    books = nfictionShelf.booksOnShelf
    books += fictionShelf.booksOnShelf
    books += reShelf.booksOnShelf
    println("book shelf loca\(nfictionShelf.booksOnShelf[1].shelfLocation)")
    println("book shelf loca\(books[1].shelfLocation)")
    let path = self.getDocumentsPath()
    println("Books being saved \(books.count)")
    NSKeyedArchiver.archiveRootObject(self.books, toFile: path + "/MyArchive")
    println("End Saving")
  }
  
  func getDocumentsPath() -> String {
    println("Begin getting path")
    let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
    let path = paths.first as String
    println(path + " End getting path")
    return path
    
  }

}

//var i = 0
//while (i<books.count){
//  var booklist = books[i].shelfLocation
//  if booklist == "reShelf" {reShelf.booksOnShelf.append(books[i])}
//  ++i
//}

