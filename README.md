# SajhaRoutes

A SwiftUI Swift Package (iOS 16+) that shows a searchable list of bus routes,
modelled on Sajha Yatayat. Uses hard-coded sample data — no networking.

## Add to an app
Xcode → File → Add Package Dependencies… → Add Local… → select this folder.

## Use
SwiftUI:
```swift
import SajhaRoutes

RouteListView()                    // sample data
RouteListView(routes: myRoutes)    // your own [BusRoute]
```

UIKit:
```swift
let vc = SajhaRoutes.makeViewController()
navigationController?.present(vc, animated: true)
```

## Edit the data
`Sources/SajhaRoutes/Data/SampleRoutes.swift` — coordinates, fares and timings are approximate.

## Example app
Open `Example/SajhaRoutesExample.xcodeproj`, pick an iPhone simulator, and press Run (⌘R).
It links this package locally, so edits to `Sources/` show up on the next run.
