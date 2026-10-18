import SwiftUI
import UIKit

/// Searchable list of bus routes. Tapping a route opens `RouteDetailView`.
public struct RouteListView: View {
    private let routes: [BusRoute]
    @State private var searchText = ""

    public init(routes: [BusRoute] = SampleRoutes.all) {
        self.routes = routes
    }

    private var filteredRoutes: [BusRoute] {
        routes.filter { $0.matches(searchText) }
    }

    public var body: some View {
        NavigationStack {
            List(filteredRoutes) { route in
                NavigationLink(value: route) {
                    RouteRow(route: route)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Routes")
            .navigationDestination(for: BusRoute.self) { route in
                RouteDetailView(route: route)
            }
            .searchable(text: $searchText, prompt: "Search route or stop")
            .overlay {
                if filteredRoutes.isEmpty {
                    Text("No routes match \"\(searchText)\"")
                        .foregroundStyle(.secondary)
                }
            }
        }
    }
}

struct RouteRow: View {
    let route: BusRoute

    var body: some View {
        HStack(spacing: 12) {
            Text(route.number)
                .font(.headline)
                .foregroundStyle(.white)
                .frame(width: 40, height: 40)
                .background(Color.green, in: RoundedRectangle(cornerRadius: 8))

            VStack(alignment: .leading, spacing: 4) {
                Text(route.name)
                    .font(.body.weight(.semibold))
                Text("\(route.stops.count) stops · Every \(route.frequencyMinutes) min")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Text("Rs \(route.fare)")
                .font(.subheadline.weight(.medium))
        }
        .padding(.vertical, 4)
    }
}

/// Convenience for UIKit apps.
public enum SajhaRoutes {
    public static func makeViewController(routes: [BusRoute] = SampleRoutes.all) -> UIViewController {
        UIHostingController(rootView: RouteListView(routes: routes))
    }
}

#Preview {
    RouteListView()
}
