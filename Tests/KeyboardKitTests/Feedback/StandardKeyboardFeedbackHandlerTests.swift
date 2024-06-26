//
//  StandardKeyboardFeedbackHandlerTests.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2019-07-04.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import KeyboardKit
import XCTest

class StandardKeyboardFeedbackHandlerTests: XCTestCase {

    var handler: StandardKeyboardFeedbackHandler!

    var audioEngine: MockAudioFeedbackEngine!
    var hapticEngine: MockHapticFeedbackEngine!

    override func setUp() {
        audioEngine = MockAudioFeedbackEngine()
        hapticEngine = MockHapticFeedbackEngine()

        handler = StandardKeyboardFeedbackHandler(settings: KeyboardFeedbackSettings())

        AudioFeedback.engine = audioEngine
        HapticFeedback.engine = hapticEngine
    }
    
    func testTriggerFeedbackTriggersAudioAndHapticFeedback() {
        handler.triggerFeedback(for: .press, on: .backspace)
        XCTAssertTrue(audioEngine.hasCalled(audioEngine.triggerRef))
        XCTAssertTrue(hapticEngine.hasCalled(hapticEngine.triggerRef))
    }

    func testTriggerAudioFeedbackTriggersAudioFeedbackOnly() {
        handler.triggerAudioFeedback(for: .press, on: .backspace)
        XCTAssertTrue(audioEngine.hasCalled(audioEngine.triggerRef))
        XCTAssertFalse(hapticEngine.hasCalled(hapticEngine.triggerRef))
    }

    func testTriggerHapticFeedbackTriggersHapticFeedbackOnly() {
        handler.triggerHapticFeedback(for: .press, on: .backspace)
        XCTAssertFalse(audioEngine.hasCalled(audioEngine.triggerRef))
        XCTAssertTrue(hapticEngine.hasCalled(hapticEngine.triggerRef))
    }
}
#endif
