//
//  AddDelegate.swift
//  BucketList
//
//  Created by Abdulmajeed Shukayri on 16/12/2021.
//

import Foundation
import UIKit

protocol AddItemDelegate : class {
    func savedItem(by controller:ViewController, with text:String, at indexPath: IndexPath?)
    func cancelButtonPressed(by controller:ViewController)
}

