import XCTest
import Capstone

final class CapstoneTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let version = Capstone.version
        print("Capstone version \(version)")
    }
    
    func testArm() throws {
        try Tests.armTests.run(address: 0x80001000)
    }

    func testArm64() throws {
        try Tests.arm64Tests.run(address: 0x2c)
    }
    
    func testPpc() throws {
        try Tests.ppcTests.run(address: 0x1000)
    }
    
    func testX86() throws {
        try Tests.x86Tests.run(address: 0x1000)
    }
    
    func testM68k() throws {
        try Tests.m68kTests.run(address: 0x1000)
    }
    
    func testSparc() throws {
        try Tests.sparcTests.run(address: 0x1000)
    }
    
    func testEvm() throws {
        try Tests.evmTests.run(address: 0x80001000)
    }
    
    func testMips() throws {
        try Tests.mipsTests.run(address: 0x1000)
    }
    
    func testM680x() throws {
        let options = PlatformTest.Options(
            separator: "********************",
            uppercaseHex: true,
            printEndAddress: false)
        try Tests.m680xTests.forEach({ try $0.run(address: 0x1000, options: options)})
    }

    func testSysz() throws {
        try Tests.syszTests.run(address: 0x1000)
    }
    
    func testXcore() throws {
        try Tests.xcoreTests.run(address: 0x1000)
    }
    
    func testTms320c64x() throws {
        try Tests.tms320c64xTests.run(address: 0x1000)
    }
    
    static var allTests = [
        ("testArm", testArm),
        ("testArm64", testArm64),
        ("testPpc", testPpc),
        ("testX86", testX86),
        ("testM68k", testM68k),
        ("testSparc", testSparc),
        ("testEvm", testEvm),
        ("testMips", testMips),
        ("testM680x", testM680x),
        ("testSysz", testSysz),
        ("testXcore", testXcore),
        ("testTms320c64x", testTms320c64x)
    ]
}

extension Array where Element == PlatformTest {
    func run(address: UInt64) throws {
        try forEach({ try $0.run(address: address )})
    }
}
