//
//  BucketListItem+CoreDataProperties.swift
//  BucketList
//
//  Created by Abdulmajeed Shukayri on 16/12/2021.
//
//

import Foundation
import CoreData


extension BucketListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BucketListItem> {
        return NSFetchRequest<BucketListItem>(entityName: "BucketListItem")
    }

    @NSManaged public var text: String?

}

extension BucketListItem : Identifiable {

}
