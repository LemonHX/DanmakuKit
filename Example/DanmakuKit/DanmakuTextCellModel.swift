//
//  DanmakuTextCellModel.swift
//  DanmakuKit_Example
//
//  Created by Q YiZhong on 2020/8/29.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import DanmakuKit
import SwiftyJSON

class DanmakuTextCellModel: DanmakuCellModel, Equatable {
    
    var id = ""
    
    var text = ""
    
    var font = UIFont.systemFont(ofSize: 15)
    
    var offsetTime: TimeInterval = 0
    
    var cellClass: DanmakuCell.Type {
        return DanmakuTextCell.self
    }
    
    var nameSpace: String?
    
    var size: CGSize = .zero
    
    var track: UInt?
    
    var displayTime: Double = 8
    
    var type: DanmakuCellType = .floating
    
    func calculateSize() {
        size = NSString(string: text).boundingRect(with: CGSize(width: CGFloat(Float.infinity
            ), height: 20), options: [.usesFontLeading, .usesLineFragmentOrigin], attributes: [.font: font], context: nil).size
    }
    
    static func == (lhs: DanmakuTextCellModel, rhs: DanmakuTextCellModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    init(json: JSON?) {
        guard let json = json else { return }
        text = json["text"].stringValue
        switch json["type"].intValue {
        case 0:
            type = .floating
        case 1:
            type = .top
        case 2:
            type = .bottom
        default:
            type = .floating
        }
        offsetTime = json["offset_time"].doubleValue
    }
    
}
