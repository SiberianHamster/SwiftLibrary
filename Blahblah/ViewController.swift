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
  
  
  @IBOutlet weak var TableView: UITableView!
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.listOfLibrary.count
  }
  


  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    self.TableView.delegate = self
    self.TableView.dataSource = self
    let seattlePublic = library(nOfLibrary: "SeattlePublic")
    let bellevuePublic = library(nOfLibrary: "BellevuePublic")
    
    self.listOfLibrary.append(seattlePublic)
    self.listOfLibrary.append(bellevuePublic)
  
    let fictionShelf = shelf(shelfName: "fiction")
    let nfictionShelf = shelf(shelfName: "nonfiction")
    let reShelf = shelf(shelfName: "reshelf")
    self.shelves.append(fictionShelf)
    self.shelves.append(nfictionShelf)
    self.shelves.append(reShelf)
    
    let spiderman1 = book(nameOfBook: "Spiderman 1")
    let artOfWar = book(nameOfBook: "The Art of War")
    let bookOfWar = book(nameOfBook: "Zapp Brannigan's Big Book of War")
    let spaceBook = book(nameOfBook: "Junior Color Encyclopedia of Space")
    fictionShelf.booksOnShelf.append(spiderman1)
    nfictionShelf.booksOnShelf.append(artOfWar)
    nfictionShelf.booksOnShelf.append(bookOfWar)
    nfictionShelf.booksOnShelf.append(spaceBook)

    //Library object aware of number of shelves.
    seattlePublic.numberOfShelves = self.shelves.count
    println("seattlePublic object has \(seattlePublic.numberOfShelves) shelves")
  
    //Shelf is aware of what book is on it
    var test = nfictionShelf.booksOnShelf[0].bookname
    var test2 = nfictionShelf.booksOnShelf[1].bookname
    var test3 = nfictionShelf.booksOnShelf[2].bookname
    println("nfictionShelf object knows the book \(test)")
    println("nfictionShelf object knows the book \(test2)")
    println("nfictionShelf object knows the book \(test3)")
    
    
    
//    // Testing enshelfing
//    println("Before shelfing: \(nfictionShelf.booksOnShelf.count) books")
//    spiderman1.enshelf(nfictionShelf)
//    println("After shelfing: \(nfictionShelf.booksOnShelf.count)")
//    let testenshelf = (nfictionShelf.booksOnShelf.count)-1
//    println("Book added, \(nfictionShelf.booksOnShelf[testenshelf].bookname)")
    
//    //Testing unshelfing
//    println("Before unshelfing: \(fictionShelf.booksOnShelf.count) books")
//    println("Shelf has \(fictionShelf.booksOnShelf[0].bookname)")
//    spiderman1.unshelf(fictionShelf)
//    println("After unshelfing: \(fictionShelf.booksOnShelf.count) books")
    
    
    seattlePublic.listOfShelves = shelves
    bellevuePublic.listOfShelves = shelves
    
    seattlePublic.listAllBooks()
    
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
}

