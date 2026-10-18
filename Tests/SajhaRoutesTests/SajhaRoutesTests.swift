import XCTest
@testable import SajhaRoutes

final class SajhaRoutesTests: XCTestCase {

    func testSampleRoutesHaveUniqueIdsAndStops() {
        let routes = SampleRoutes.all
        XCTAssertFalse(routes.isEmpty)
        XCTAssertEqual(Set(routes.map(\.id)).count, routes.count)
        for route in routes {
            XCTAssertGreaterThanOrEqual(route.stops.count, 2, route.name)
        }
    }

    func testSearchMatchesNameNumberAndStop() {
        let route = SampleRoutes.all[0]
        XCTAssertTrue(route.matches(""))
        XCTAssertTrue(route.matches("budhanil"))
        XCTAssertTrue(route.matches("1"))
        XCTAssertTrue(route.matches("Lazimpat"))
        XCTAssertFalse(route.matches("Bhaktapur"))
    }

    func testOriginAndDestination() {
        let route = SampleRoutes.all[0]
        XCTAssertEqual(route.origin, "Lagankhel")
        XCTAssertEqual(route.destination, "Budhanilkantha")
    }
}
