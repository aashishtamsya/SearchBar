//
//  SearchBarXibView.swift
//  GreenOrbit
//
//  Created by Aashish Tamsya on 23/01/19.
//  Copyright © 2019 Aashish Tamsya. All rights reserved.
//

import UIKit
@IBDesignable
public class SearchBarXibView: UIView {
  // MARK: - Properties
  /// Container View which will hold custom Xib Views.
  fileprivate var contentView: UIView?
  /// Name of the nib.
  fileprivate var nibName = "SearchBar"
  @IBInspectable
  var shadowRadius: CGFloat {
    get {
      return self.layer.shadowRadius
    }
    set {
      self.layer.shadowRadius = newValue
    }
  }
  
  @IBInspectable
  var shadowOffset: CGSize {
    get {
      return self.layer.shadowOffset
    }
    set {
      self.layer.shadowOffset = newValue
    }
  }
  
  @IBInspectable
  var shadowColor: UIColor? {
    get {
      return UIColor(cgColor: self.layer.shadowColor!)
    }
    set {
      self.layer.shadowColor = newValue?.cgColor
    }
  }
  
  @IBInspectable
  var shadowOpacity: Float {
    get {
      return self.layer.shadowOpacity
    }
    set {
      self.layer.shadowOpacity = newValue
    }
  }
  // MARK: - LifeCycle
  override open func awakeFromNib() {
    super.awakeFromNib()
    setup()
  }
  
  override open func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setup()
    contentView?.prepareForInterfaceBuilder()
  }
}
// MARK: - Read-Only Variables.
//extension SearchBarXibView {
//  /// Provides interface to access `SearchView`.
//  public var searchBar: SearchBar? {
//    get {
//      return contentView as? SearchBar
//    }
//  }
//}
// MARK: - Private Methods
private extension SearchBarXibView {
  /// Common initialization/setup method.
  func setup() {
    guard let view = loadViewFromNib() else { return }
    view.frame = bounds
    view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    addSubview(view)
    contentView?.bringSubviewToFront(view)
    contentView = view
  }
  /// Provides interface to load view from nib.
  ///
  /// - Returns: returns view which returned from the nib.
  func loadViewFromNib() -> UIView? {
    return UINib(nibName: nibName, bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView
//    return UINib(nibName: nibName, bundle: Bundle(for: type(of: self))).instantiate(withOwner: self, options: nil).first as? UIView
  }
}
