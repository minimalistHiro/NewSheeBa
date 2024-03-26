//
//  MapView.swift
//  SheeBa
//
//  Created by 金子広樹 on 2024/02/29.
//

import SwiftUI
import MapKit

struct MapKit: UIViewRepresentable {
    var location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 200, longitude: 200)
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.01,
                                    longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: location,
                                        span: span)
        view.setRegion(region, animated: true)
    }
}

struct PinItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    
    @State private var region = MKCoordinateRegion() // 座標領域
    @State private var userTrackingMode: MapUserTrackingMode = .none
    var coordinate: CLLocationCoordinate2D? // 表示領域の中心位置
    var latitude: Double // 緯度
    var longitude: Double // 経度
    
    var body: some View {
        Map(coordinateRegion: $region,
                    interactionModes: .all,
                    showsUserLocation: true,
                    userTrackingMode: $userTrackingMode,
                    annotationItems: [
                        PinItem(coordinate: .init(latitude: latitude, longitude: longitude))
                    ],
                    annotationContent: { item in
                        MapMarker(coordinate: item.coordinate)
                    })
    }
}


#Preview {
    MapKit()
}
