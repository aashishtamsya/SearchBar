//
//  SearchBarDelegates.swift
//  GreenOrbit
//
//  Created by Aashish Tamsya on 24/04/19.
//  Copyright © 2019 Aashish Tamsya. All rights reserved.
//

import UIKit

/// SearchBarGestureDelegate represents method which are related to gestures associated with `SearchBar`.
public protocol SearchBarGestureDelegate: class {
  /// Provides interface which delegate actions when user taps on `SearchBar`.
  ///
  /// - Parameter searchBar: instance of searchBar.
  func searchBarDidTap(_ searchBar: SearchBar)
}

/// SearchBarDelegate represents method which are associated with `SearchBar`.
public protocol SearchBarDelegate: class {
  /// Provides interface to searchField in `SearchBar`.
  ///
  /// - Parameters:
  ///   - searchBar: instance of searchBar.
  ///   - text: text in searchField.
  func searchBar(_ searchBar: SearchBar, searchText text: String)
  /// Provides interface to clear button of searchField in `SearchBar`.
  ///
  /// - Parameter textField: instance of searchField.
  func searchBar(shouldClear textField: UITextField)
}
