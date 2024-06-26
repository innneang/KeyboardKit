//
//  CustomKeyboardLayoutProvider.swift
//  KeyboardCustom
//
//  Created by Daniel Saidi on 2022-09-02.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import Foundation
import KeyboardKit

/**
 This class inherits ``DemoKeyboardLayoutProvider`` and adds
 a custom size to the "i" in the second row's "kit".

 ``KeyboardViewController`` registers it to show how you can
 register and use a custom keyboard layout provider. 
 */
class CustomKeyboardLayoutProvider: DemoKeyboardLayoutProvider {

    override func keyboardLayout(for context: KeyboardContext) -> KeyboardLayout {
        let layout = super.keyboardLayout(for: context)
        let widerItem = KeyboardLayoutItem(
            action: .character("I"),
            size: KeyboardLayoutItemSize(
                width: .inputPercentage(2),
                height: layout.idealItemHeight),
            insets: layout.idealItemInsets)
        layout.itemRows.replace(.character("I"), with: widerItem)
        return layout
    }
}
