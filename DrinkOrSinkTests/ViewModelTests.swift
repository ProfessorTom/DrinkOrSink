import XCTest
@testable import DrinkOrSink

class ViewModelTests: XCTestCase {

    var sut: ViewModel!
    var mockedView: MockedView!

    override func setUp() {
        super.setUp()
        sut = ViewModel()
        mockedView = MockedView()
        sut.delegate = mockedView
    }

    override func tearDown() {
        mockedView = nil
        sut = nil
        super.tearDown()
    }

    func testStartGameSucceeds() {
        mockedView.expectation = expectation(description: "Start game should succeed")
        mockedView.expectedMethods = [.didStart]

        sut.startWave()

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testPlayGameWithDrinkActionSucceeds() {
        mockedView.expectation = expectation(description: "Play game with drink action should succeed")
        mockedView.expectedMethods = [.didPlay]

        sut.play(with: .drink)

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testPlayGameWithSinkActionSucceeds() {
        mockedView.expectation = expectation(description: "Play game with sink action should succeed")
        mockedView.expectedMethods = [.didPlay, .didFinish]

        sut.play(with: .sink)

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testFinishGameSucceeds() {
        mockedView.expectation = expectation(description: "Play game with sink action should succeed")
        mockedView.expectedMethods = [.didPlay, .didFinish]

        sut.round = sut.waves.count
        sut.play(with: .drink)

        waitForExpectations(timeout: 1.0, handler: nil)
    }

    internal enum ExpectedMethod {
        case didStart
        case didPlay
        case didFinish
    }

    internal class MockedView: ViewModelDelegate {
        var expectation: XCTestExpectation!
        var expectedMethods: [ExpectedMethod]! {
            didSet {
                self.expectation.expectedFulfillmentCount = expectedMethods.count
            }
        }

        func didStart(wave: String) {
            if expectedMethods.contains(.didStart) {
                expectation.fulfill()
            }
        }

        func didPlay(greeting: String) {
            if expectedMethods.contains(.didPlay) {
                expectation.fulfill()
            }
        }

        func didFinish() {
            if expectedMethods.contains(.didFinish) {
                expectation.fulfill()
            }
        }
    }
}
