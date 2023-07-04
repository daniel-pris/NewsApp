import SwiftUI

struct CountryTableView: View {
    @State private var sampleCities = Iphone.sample.sorted(using: KeyPathComparator(\.name))
    @State private var sortOrder = [KeyPathComparator(\Iphone.name)]
    @State private var selection: Iphone.ID?
    @State private var path = [Iphone]()
    @Environment(\.horizontalSizeClass) var sizeClass
    @State private var ascend = true
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack(path: $path) {
                VStack(alignment: .leading){
                    Text("Iphones")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top)
                    if sizeClass == .compact {
                        Button {
                            ascend.toggle()
                            if ascend {
                                sampleCities.sort {$0.name < $1.name}
                            } else {
                                sampleCities.sort {$0.name > $1.name}
                            }
                        } label: {
                            Text(ascend ? "Sort \(Image(systemName: "arrowtriangle.down"))" : "Sort \(Image(systemName: "arrowtriangle.up"))")
                        }
                        .buttonStyle(.bordered)
                    }
                    Table(sampleCities, selection: $selection, sortOrder: $sortOrder) {
                        TableColumn("Name", value: \.name) { iphone in
                            HStack{
                                Text("\(iphone.name)")
                                Spacer()
                                if sizeClass == .compact {
                                    Text(iphone.name)
                                        .font(.caption2)
                                        .textCase(.uppercase)
                                }
                            }
                        }
                        TableColumn("Processor", value: \.year) { iphone in
                            HStack {
                                Spacer()
                                Text("\(iphone.processor)")
                                Spacer()
                            }
                        }
                        .width(60)
                        TableColumn("IPHONe", value: \.name)
                        TableColumn("year", value: \.year) { iphone in
                            Text("\(iphone.year)")
                        }
                    }
                }
                .padding()
                .navigationDestination(for: Iphone.self) { iphone in
                    IphoneView(iphone: iphone)
                }
                .onAppear {
                    selection = nil
                }
            }
            .onChange(of: sortOrder) { newOrder in
                sampleCities.sort(using: newOrder)
            }
            .onChange(of: selection) { selection in
                if let selection = selection,
                   let iphone = sampleCities.first(where: {$0.id == selection}) {
                    path.append(iphone)
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct CountryTableView_Previews: PreviewProvider {
    static var previews: some View {
        CountryTableView()
    }
}


