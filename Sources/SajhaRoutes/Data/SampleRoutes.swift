import Foundation

/// Hard-coded sample routes. Names are modelled on Sajha Yatayat routes in the
/// Kathmandu Valley; coordinates, fares and timings are approximate and for demo only.
public enum SampleRoutes {

    public static let all: [BusRoute] = [
        BusRoute(
            id: "lagankhel-budhanilkantha",
            number: "1",
            name: "Lagankhel – Budhanilkantha",
            fare: 35,
            firstBus: "6:30 AM",
            lastBus: "7:30 PM",
            frequencyMinutes: 10,
            stops: [
                stop("Lagankhel", 27.6670, 85.3225),
                stop("Jawalakhel", 27.6726, 85.3140),
                stop("Pulchowk", 27.6787, 85.3166),
                stop("Thapathali", 27.6905, 85.3180),
                stop("Maitighar", 27.6947, 85.3205),
                stop("Ratnapark", 27.7056, 85.3150),
                stop("Lainchaur", 27.7165, 85.3135),
                stop("Lazimpat", 27.7230, 85.3205),
                stop("Maharajgunj", 27.7390, 85.3310),
                stop("Narayan Gopal Chowk", 27.7400, 85.3365),
                stop("Budhanilkantha", 27.7780, 85.3620),
            ]
        ),
        BusRoute(
            id: "ratnapark-airport",
            number: "2",
            name: "Ratnapark – Airport",
            fare: 25,
            firstBus: "6:00 AM",
            lastBus: "8:00 PM",
            frequencyMinutes: 15,
            stops: [
                stop("Ratnapark", 27.7056, 85.3150),
                stop("Bhadrakali", 27.6985, 85.3170),
                stop("Maitighar", 27.6947, 85.3205),
                stop("New Baneshwor", 27.6888, 85.3355),
                stop("Tinkune", 27.6857, 85.3460),
                stop("Airport", 27.6966, 85.3591),
            ]
        ),
        BusRoute(
            id: "kalanki-koteshwor",
            number: "3",
            name: "Kalanki – Koteshwor (Ring Road)",
            fare: 30,
            firstBus: "6:15 AM",
            lastBus: "7:45 PM",
            frequencyMinutes: 12,
            stops: [
                stop("Kalanki", 27.6933, 85.2815),
                stop("Balkhu", 27.6845, 85.2980),
                stop("Ekantakuna", 27.6690, 85.3050),
                stop("Satdobato", 27.6580, 85.3245),
                stop("Gwarko", 27.6665, 85.3320),
                stop("Balkumari", 27.6720, 85.3400),
                stop("Koteshwor", 27.6788, 85.3490),
            ]
        ),
        BusRoute(
            id: "ratnapark-bhaktapur",
            number: "4",
            name: "Ratnapark – Bhaktapur",
            fare: 45,
            firstBus: "6:00 AM",
            lastBus: "7:00 PM",
            frequencyMinutes: 20,
            stops: [
                stop("Ratnapark", 27.7056, 85.3150),
                stop("Maitighar", 27.6947, 85.3205),
                stop("New Baneshwor", 27.6888, 85.3355),
                stop("Koteshwor", 27.6788, 85.3490),
                stop("Thimi", 27.6780, 85.3870),
                stop("Suryabinayak", 27.6650, 85.4250),
                stop("Bhaktapur", 27.6710, 85.4298),
            ]
        ),
        BusRoute(
            id: "kalanki-chabahil",
            number: "5",
            name: "Kalanki – Chabahil (Ring Road North)",
            fare: 30,
            firstBus: "6:30 AM",
            lastBus: "7:30 PM",
            frequencyMinutes: 15,
            stops: [
                stop("Kalanki", 27.6933, 85.2815),
                stop("Swayambhu", 27.7150, 85.2830),
                stop("Balaju", 27.7270, 85.3045),
                stop("Gongabu", 27.7350, 85.3140),
                stop("Basundhara", 27.7420, 85.3320),
                stop("Chabahil", 27.7175, 85.3460),
            ]
        ),
    ]

    private static func stop(_ name: String, _ lat: Double, _ lon: Double) -> BusStop {
        BusStop(id: name.lowercased().replacingOccurrences(of: " ", with: "-"),
                name: name, latitude: lat, longitude: lon)
    }
}
