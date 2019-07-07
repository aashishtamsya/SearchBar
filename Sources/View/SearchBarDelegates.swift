//
//  SearchBarDelegates.swift
//  GreenOrbit
//
//  Created by Aashish Tamsya on 24/04/19.
//  Copyright © 2019 Aashish Tamsya. All rights reserved.
//

import UIKit

/// SearchBarGestureDelegate represents method which are related to gestures associated with `SearchView`.
public protocol SearchBarGestureDelegate: class {
  /// Provides interface which delegate actions when user taps on `SearchView`.
  ///
  /// - Parameter searchView: instance of searchView
  func searchBarDidTap(_ searchView: SearchBar)
}

/// SearchBarDelegate represents method which are associated with `SearchView`.
public protocol SearchBarDelegate: class {
  /// Provides interface to searchField in `SearchView`.
  ///
  /// - Parameters:
  ///   - searchView: instance of searchView.
  ///   - text: text in searchField.
  func searchBar(_ searchView: SearchBar, searchText text: String)
  /// Provides interface to clear button of searchField in `SearchView`.
  ///
  /// - Parameter textField: instance of searchField.
  func searchBar(shouldClear textField: UITextField)
}
