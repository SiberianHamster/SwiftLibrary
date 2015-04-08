//
//  BookViewController.swift
//  Blahblah
//
//  Created by Mark Lin on 4/4/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import UIKit

class BookViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var TableView: UITableView!
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return selectShelf.booksOnShelf.count
  }
  
  var selectShelf = shelf(shelfName: "TestShelf")
  var selectBook = book(nameOfBook: "TestBook")

    override func viewDidLoad() {
      super.viewDidLoad()
      self.TableView.delegate = self
      self.TableView.dataSource = self
    }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let Cell = TableView.dequeueReusableCellWithIdentifier("bookCell", forIndexPath: indexPath) as UITableViewCell
    var booklist = selectShelf.booksOnShelf[indexPath.row].bookname
    Cell.textLabel?.text = booklist
    return Cell
  }
  

}
