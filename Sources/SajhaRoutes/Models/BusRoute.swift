import Foundation
import CoreLocation

/// A single bus stop on a route.
public struct BusStop: Identifiable, Hashable {
    public let id: String
    public let name: String
    public let latitude: Double
    public let longitude: Double

    public init(id: String, name: String, latitude: Double, longitude: Double) {
        self.id = id
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }

    public var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

/// A bus route made of ordered stops.
public struct BusRoute: Identifiable, Hashable {
    public let id: String
    /// Short route code shown in the badge, e.g. "1".
    public let number: String
    public let name: String
    /// Fare in Nepali Rupees.
    public let fare: Int
    public let firstBus: String
    public let lastBus: String
    public let frequencyMinutes: Int
    public let stops: [BusStop]

    public init(
        id: String,
        number: String,
        name: String,
        fare: Int,
        firstBus: String,
        lastBus: String,
        frequencyMinutes: Int,
        stops: [BusStop]
    ) {
        self.id = id
        self.number = number
        self.name = name
        self.fare = fare
        self.firstBus = firstBus
        self.lastBus = lastBus
        self.frequencyMinutes = frequencyMinutes
        self.stops = stops
    }

    public var origin: String { stops.first?.name ?? "" }
    public var destination: String { stops.last?.name ?? "" }

    /// True if the query matches the route number, name, or any stop name.
    public func matches(_ query: String) -> Bool {
        let q = query.trimmingCharacters(in: .whitespaces)
        guard !q.isEmpty else { return true }
        return number.localizedCaseInsensitiveContains(q)
            || name.localizedCaseInsensitiveContains(q)
            || stops.contains { $0.name.localizedCaseInsensitiveContains(q) }
    }
}
