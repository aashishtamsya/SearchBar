//
//  ViewController.swift
//  SearchBarExample
//
//  Created by Aashish Tamsya on 12/07/19.
//  Copyright © 2019 Aashish Tamsya. All rights reserved.
//

import UIKit
import SearchBar

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    let searchView = SearchView(frame: CGRect(x: 20, y: 64, width: view.frame.width - 40, height: 57))
    view.addSubview(searchView)
    
    searchView.layoutIfNeeded()
  }


}

