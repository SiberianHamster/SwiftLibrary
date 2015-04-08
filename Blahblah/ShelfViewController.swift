//
//  ShelfViewController.swift
//  Blahblah
//
//  Created by Mark Lin on 3/27/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import UIKit

class ShelfViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var TableView: UITableView!
  
  var selectedLibrary = library(nOfLibrary: "FakeTemp")
  var selectedShelf = shelf(shelfName: "FakeTemp")
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return selectedLibrary.listOfShelves.count
  }

  
  override func viewDidLoad() {
    super.viewDidLoad()
  self.TableView.delegate = self
  self.TableView.dataSource = self
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let Cell = TableView.dequeueReusableCellWithIdentifier("shelfCell", forIndexPath: indexPath) as UITableViewCell
    let shelf = selectedLibrary.listOfShelves[indexPath.row].nameOfShelf
    Cell.textLabel?.text = shelf
    return Cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "bookSeg" {
  var segueNorm = segue.destinationViewController as
      BookViewController
  var selectedBook = self.TableView.indexPathForSelectedRow()
  var Shelf = selectedLibrary.listOfShelves[selectedBook!.row]
  segueNorm.selectShelf = Shelf
    }}
}
