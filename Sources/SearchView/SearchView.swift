//
//  SearchView.swift
//  GreenOrbit
//
//  Created by Aashish Tamsya on 24/04/19.
//  Copyright © 2019 Aashish Tamsya. All rights reserved.
//

import UIKit

/// View which renders search option for Browse #Channels.
final class SearchView: UIView {
  /// StackView enlosing entire UIControl.
  @IBOutlet fileprivate weak var baseStackView: UIStackView!
  /// ImageView used to render search icon.
  @IBOutlet fileprivate weak var searchImageView: UIImageView!
  /// TextField which enables user to enter input for searching.
  @IBOutlet fileprivate weak var searchField: UITextField!
  /// Delegate which handles all actions and methods associated with `SearchView`.
  fileprivate weak var delegate: SearchViewDelegate?
  /// Delegate which handles all gesture related actions and methods with `SearchView`.
  fileprivate weak var gestureDelegate: SearchViewGestureDelegate?
  
  var themeColor: UIColor? {
    set {
      searchImageView.tintColor = newValue
    }
    get {
      return searchImageView.tintColor
    }
  }
  
  var placeholder: String? {
    set {
      searchField.placeholder = placeholder
    }
    get {
      return searchField.placeholder
    }
  }

  // MARK: - LifeCycle
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  /// Common/Initial setup method.
  ///
  /// - Parameters:
  ///   - delegate: delegate which handles all actions and methods associated with `SearchView`.
  ///   - gestureDelegate: delegate which handles all gesture related actions and methods with `SearchView`.
  func setup(delegate: SearchViewDelegate? = nil, gestureDelegate: SearchViewGestureDelegate? = nil, themeColor: UIColor? = nil, placeholder: String? = nil) {
    if let delegate = delegate {
      self.delegate        = delegate
      searchField.delegate = self
    }
    self.placeholder = placeholder
    self.themeColor = themeColor
    searchField.isUserInteractionEnabled   = gestureDelegate == nil
    baseStackView.isUserInteractionEnabled = gestureDelegate == nil
    if let gestureDelegate = gestureDelegate {
      self.gestureDelegate = gestureDelegate
      let tap = UITapGestureRecognizer(target: self, action: #selector(SearchView.handleTap))
      tap.numberOfTapsRequired = 1
      addGestureRecognizer(tap)
    }
  }
}
// MARK: - Selectors
extension SearchView {
  /// Provides interface for handling tap on SearchView xib.
  @objc func handleTap() {
    gestureDelegate?.searchViewDidTap(self)
  }
}
// MARK: - Public Methods
extension SearchView {
  /// Provides interface to remove text in searchField in `SearchView`.
  func clearSearchField() {
    searchField.text = ""
  }
}
// MARK: - UITextFieldDelegate
extension SearchView: UITextFieldDelegate {
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if let text = textField.text, let textRange = Range(range, in: text) {
      let updatedText = text.replacingCharacters(in: textRange, with: string)
      delegate?.searchView(self, searchText: updatedText)
    }
    return true
  }
  
  func textFieldShouldClear(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    delegate?.searchView(shouldClear: textField)
    return true
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.text = ""
    textField.resignFirstResponder()
    delegate?.searchView(shouldClear: textField)
    return true
  }
}
