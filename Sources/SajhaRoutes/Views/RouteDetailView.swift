import SwiftUI
import MapKit

/// Shows a route's stops on a map plus an ordered stop list.
public struct RouteDetailView: View {
    private let route: BusRoute
    @State private var region: MKCoordinateRegion

    public init(route: BusRoute) {
        self.route = route
        _region = State(initialValue: Self.region(fitting: route.stops))
    }

    public var body: some View {
        List {
            Section {
                Map(coordinateRegion: $region, annotationItems: route.stops) { stop in
                    MapMarker(coordinate: stop.coordinate, tint: .green)
                }
                .frame(height: 240)
                .listRowInsets(EdgeInsets())
            }

            Section("Info") {
                LabeledContent("Fare", value: "Rs \(route.fare)")
                LabeledContent("First bus", value: route.firstBus)
                LabeledContent("Last bus", value: route.lastBus)
                LabeledContent("Frequency", value: "Every \(route.frequencyMinutes) min")
            }

            Section("Stops") {
                ForEach(Array(route.stops.enumerated()), id: \.element.id) { index, stop in
                    Button {
                        withAnimation {
                            region = MKCoordinateRegion(
                                center: stop.coordinate,
                                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                            )
                        }
                    } label: {
                        HStack {
                            Text("\(index + 1)")
                                .font(.caption.monospacedDigit())
                                .foregroundStyle(.secondary)
                                .frame(width: 24)
                            Text(stop.name)
                                .foregroundStyle(.primary)
                        }
                    }
                }
            }
        }
        .navigationTitle(route.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    /// A region that fits every stop, with some padding.
    static func region(fitting stops: [BusStop]) -> MKCoordinateRegion {
        guard !stops.isEmpty else {
            // Kathmandu
            return MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 27.7172, longitude: 85.3240),
                span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            )
        }
        let lats = stops.map(\.latitude)
        let lons = stops.map(\.longitude)
        let center = CLLocationCoordinate2D(
            latitude: (lats.min()! + lats.max()!) / 2,
            longitude: (lons.min()! + lons.max()!) / 2
        )
        let span = MKCoordinateSpan(
            latitudeDelta: max((lats.max()! - lats.min()!) * 1.4, 0.01),
            longitudeDelta: max((lons.max()! - lons.min()!) * 1.4, 0.01)
        )
        return MKCoordinateRegion(center: center, span: span)
    }
}

#Preview {
    NavigationStack {
        RouteDetailView(route: SampleRoutes.all[0])
    }
}
