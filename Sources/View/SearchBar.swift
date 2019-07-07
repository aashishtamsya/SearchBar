//
//  SearchBar.swift
//  GreenOrbit
//
//  Created by Aashish Tamsya on 24/04/19.
//  Copyright © 2019 Aashish Tamsya. All rights reserved.
//

import UIKit

/// View which renders search option for Browse #Channels.
@IBDesignable
public class SearchBar: UIView {
  /// StackView enlosing entire UIControl.
  @IBOutlet fileprivate weak var baseStackView: UIStackView!
  /// ImageView used to render search icon.
  @IBOutlet fileprivate weak var searchImageView: UIImageView!
  /// TextField which enables user to enter input for searching.
  @IBOutlet fileprivate weak var searchField: UITextField!
  /// Delegate which handles all actions and methods associated with `SearchBar`.
  fileprivate weak var delegate: SearchBarDelegate?
  /// Delegate which handles all gesture related actions and methods with `SearchBar`.
  fileprivate weak var gestureDelegate: SearchBarGestureDelegate?
  
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
  override public init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  public func set(themeColor: UIColor) {
    self.themeColor = themeColor
  }
  
  public func set(placeholder text: String) {
    self.placeholder = text
  }

  /// Common/Initial setup method.
  ///
  /// - Parameters:
  ///   - delegate: delegate which handles all actions and methods associated with `SearchBar`.
  ///   - gestureDelegate: delegate which handles all gesture related actions and methods with `SearchBar`.
  func setup(delegate: SearchBarDelegate? = nil, gestureDelegate: SearchBarGestureDelegate? = nil) {
    if let delegate = delegate {
      self.delegate        = delegate
      searchField.delegate = self
    }
    searchField.isUserInteractionEnabled   = gestureDelegate == nil
    baseStackView.isUserInteractionEnabled = gestureDelegate == nil
    if let gestureDelegate = gestureDelegate {
      self.gestureDelegate = gestureDelegate
      let tap = UITapGestureRecognizer(target: self, action: #selector(SearchBar.handleTap))
      tap.numberOfTapsRequired = 1
      addGestureRecognizer(tap)
    }
  }
}
// MARK: - Selectors
extension SearchBar {
  /// Provides interface for handling tap on SearchBar xib.
  @objc func handleTap() {
    gestureDelegate?.searchBarDidTap(self)
  }
}
// MARK: - Public Methods
extension SearchBar {
  /// Provides interface to remove text in searchField in `SearchBar`.
  func clearSearchField() {
    searchField.text = ""
  }
}
// MARK: - UITextFieldDelegate
extension SearchBar: UITextFieldDelegate {
  public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if let text = textField.text, let textRange = Range(range, in: text) {
      let updatedText = text.replacingCharacters(in: textRange, with: string)
      delegate?.searchBar(self, searchText: updatedText)
    }
    return true
  }
  
  public func textFieldShouldClear(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    delegate?.searchBar(shouldClear: textField)
    return true
  }
  
  public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.text = ""
    textField.resignFirstResponder()
    delegate?.searchBar(shouldClear: textField)
    return true
  }
}
