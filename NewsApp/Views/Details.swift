import SwiftUI

struct IphoneView: View {
    let iphone: Iphone

    var body: some View {
        VStack {
            ZStack {
                VStack {
                    Text(iphone.name)
                    Text("os: \(iphone.os)")
                    Text("year: \(iphone.year)")
                    Text("diagonal: \(iphone.diagonal)")
                    Text("processor: \(iphone.processor)")
                    Text("resolution: \(iphone.resolution)")
                    
                        .font(.title)
                }
                .font(.largeTitle)
                .padding()
            }
        }
        .navigationTitle("Iphone")
        .navigationBarTitleDisplayMode(.inline)
    }
}

@available(iOS 16.0, *)
struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            IphoneView(iphone: Iphone.sample[1])
        }
    }
}
