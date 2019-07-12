//
//  SearchViewDelegate.swift
//  GreenOrbit
//
//  Created by Aashish Tamsya on 24/04/19.
//  Copyright © 2019 Aashish Tamsya. All rights reserved.
//

import UIKit

/// SearchViewDelegate represents method which are related to gestures associated with `SearchView`.
protocol SearchViewGestureDelegate: class {
  /// Provides interface which delegate actions when user taps on `SearchView`.
  ///
  /// - Parameter searchView: instance of searchView
  func searchViewDidTap(_ searchView: SearchView)
}

/// SearchViewDelegate represents method which are associated with `SearchView`.
protocol SearchViewDelegate: class {
  /// Provides interface to searchField in `SearchView`.
  ///
  /// - Parameters:
  ///   - searchView: instance of searchView.
  ///   - text: text in searchField.
  func searchView(_ searchView: SearchView, searchText text: String)
  /// Provides interface to clear button of searchField in `SearchView`.
  ///
  /// - Parameter textField: instance of searchField.
  func searchView(shouldClear textField: UITextField)
}
