//
//  HapticFeedbackTests.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-04-01.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import KeyboardKit
import XCTest

class HapticFeedbackTests: XCTestCase {

    var engine: MockHapticFeedbackEngine!

    override func setUp() {
        engine = MockHapticFeedbackEngine()
        HapticFeedback.engine = engine
    }

    func testPreparingFeedbackUsesSharedAudioEngine() {
        HapticFeedback.success.prepare()
        HapticFeedback.warning.prepare()
        let calls = engine.calls(to: engine.prepareRef)
        XCTAssertEqual(calls.count, 2)
        XCTAssertEqual(calls[0].arguments, .success)
        XCTAssertEqual(calls[1].arguments, .warning)
    }

    func testTriggeringFeedbackUsesSharedAudioEngine() {
        HapticFeedback.success.trigger()
        HapticFeedback.warning.trigger()
        let calls = engine.calls(to: engine.triggerRef)
        XCTAssertEqual(calls.count, 2)
        XCTAssertEqual(calls[0].arguments, .success)
        XCTAssertEqual(calls[1].arguments, .warning)
    }
}
#endif
