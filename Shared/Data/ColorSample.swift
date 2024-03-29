//
//  ColorSample.swift
//  AstroSwiftSampler
//
//  Created by rocketjeff on 1/13/22.
//

import Foundation
import AstroSwiftCore
import AstroSwiftFoundation
import SwiftUI

struct ColorSample:Identifiable
{
    let id: UUID = UUID()
    var name:String
    var color:Color
    var colorVariants:[ColorSample]?
}

#if os (iOS)
struct UIColorSample:Identifiable
{
    let id: UUID = UUID()
    var name:String
    var uiColor:UIColor
    var colorVariants:[UIColorSample]?
}
#endif
