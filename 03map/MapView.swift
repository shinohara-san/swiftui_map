import SwiftUI
import MapKit
import Foundation

struct MapView: UIViewRepresentable {
    
    @Binding var searchPlace: String
    
    var locationManager = CLLocationManager()
    
    func setupManager() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        //    locationManager.requestAlwaysAuthorization()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        setupManager()
        let mapView = MKMapView(frame: UIScreen.main.bounds)
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .followWithHeading
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(searchPlace) { (placemarks, error) in
            if let unwrapPlacemarks = placemarks{
                if let firstPlacemarks = unwrapPlacemarks.first{
                    if let location = firstPlacemarks.location{
                        let targetCoordinate = location.coordinate
                        let latitude = targetCoordinate.latitude
                        let longitude = targetCoordinate.longitude
                        
                        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude,longitude)
                        
                        uiView.userTrackingMode = .follow
                        
                        uiView.setCenter(location, animated: true)
                        
                        var region:MKCoordinateRegion = uiView.region
                        region.center = location
                        region.span.latitudeDelta = 0.02
                        region.span.longitudeDelta = 0.02
                        
                        uiView.setRegion(region,animated:false)
                    }}}}}}
