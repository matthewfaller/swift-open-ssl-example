import XCTest
@testable import SwiftOpenSslExample
import OpenSSL

final class SwiftOpenSslExampleTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(SwiftOpenSslExample().text, "Hello, World!")
    }

    func testOpenSSLGroupNistp256HasCofactorOf1() {
        let group = EC_GROUP_new_by_curve_name(NID_X9_62_prime256v1)
        let bignum = BN_new()!

        let cofactorReturnCode = EC_GROUP_get_cofactor(group, bignum, nil)
        let cString = BN_bn2dec(bignum)!
        
        let cofactor = String.init(cString: cString)
        let expectedNumber = "1"
        let expectedCode: Int32 = 1
        
        XCTAssertEqual(cofactorReturnCode, expectedCode)
        XCTAssertEqual(cofactor, expectedNumber)
    }
    static var allTests = [
        ("testExample", testExample),
        ("testOpenSSLGroupNistp256HasCofactorOf1", testOpenSSLGroupNistp256HasCofactorOf1)
    ]
}
