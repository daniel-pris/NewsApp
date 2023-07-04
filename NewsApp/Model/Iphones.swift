import Foundation

struct Iphone: Identifiable, Hashable {
    var os: String
    var year: Int
    var name: String
    var diagonal: Double
    var processor: String
    var resolution: String

    var id: String {
        name
    }
    
    static var sample: [Iphone] {
        [
            Iphone(
                os: "iOS 15",
                year: 2021,
                name: "iPhone 13",
                diagonal: 6.1,
                processor: "Apple A15 Bionic",
                resolution: "2532×1170"
            ),
            Iphone(
                os: "iOS 15",
                year: 2021,
                name: "iPhone 13 mini",
                diagonal: 5.4,
                processor: "Apple A15 Bionic",
                resolution: "2340×1080"
            ),
            Iphone(
                os: "iOS 15",
                year: 2021,
                name: "iPhone 13 Pro",
                diagonal: 6.1,
                processor: "Apple A15 Bionic",
                resolution: "2532×1170"
            ),
            Iphone(
                os: "iOS 15",
                year: 2021,
                name: "iPhone 13 Pro Max",
                diagonal: 6.7,
                processor: "Apple A15 Bionic",
                resolution: "2778 × 1284"
            ),
            Iphone(
                os: "iOS 14",
                year: 2020,
                name: "iPhone 12",
                diagonal: 6.1,
                processor: "Apple A14 Bionic",
                resolution: "2532×1170"
            ),
            Iphone(
                os: "iOS 14",
                year: 2020,
                name: "iPhone 12 mini",
                diagonal: 5.4,
                processor: "Apple A14 Bionic",
                resolution: "2340×1080"
            ),
            Iphone(
                os: "iOS 14",
                year: 2020,
                name: "iPhone 12 Pro",
                diagonal: 6.1,
                processor: "Apple A14 Bionic",
                resolution: "2532×1170"
            ),
            Iphone(
                os: "iOS 14",
                year: 2020,
                name: "iPhone 12 Pro Max",
                diagonal: 6.7,
                processor: "Apple A14 Bionic",
                resolution: "2778×1284"
            ),
            Iphone(
                os: "iOS 13",
                year: 2019,
                name: "iPhone SE-2",
                diagonal: 4.7,
                processor: "Apple A13 Bionic",
                resolution: "1334x750"
            ),
            Iphone(
                os: "iOS 13",
                year: 2019,
                name: "iPhone 11",
                diagonal: 6.06,
                processor: "Apple A13 Bionic",
                resolution: "1792×828"
            ),
            Iphone(
                os: "iOS 13",
                year: 2019,
                name: "iPhone 11 Pro Max",
                diagonal: 6.5,
                processor: "Apple A13 Bionic",
                resolution: "2688×1242"
            ),
            Iphone(
                os: "iOS 13",
                year: 2019,
                name: "iPhone 11 Pro",
                diagonal: 5.8,
                processor: "Apple A13 Bionic",
                resolution: "2436×1125"
            ),
            Iphone(
                os: "iOS 12",
                year: 2018,
                name: "iPhone Xs",
                diagonal: 5.8,
                processor: "Apple A12 Bionic",
                resolution: "2436x1125"
            ), Iphone(
                os: "iOS 12",
                year: 2018,
                name: "iPhone Xs Max",
                diagonal: 6.5,
                processor: "Apple A12 Bionic",
                resolution: "2688×1242"
            ), Iphone(
                os: "iOS 12",
                year: 2018,
                name: "iPhone XR",
                diagonal: 6.1,
                processor: "Apple A11 Bionic",
                resolution: "1792х828"
            ), Iphone(
                os: "iOS 11",
                year: 2017,
                name: "iPhone X",
                diagonal: 5.8,
                processor: "Apple A11 Bionic",
                resolution: "2436×1125"
            ), Iphone(
                os: "iOS 11 - iOS 16.1.1",
                year: 2017,
                name: "iPhone 8",
                diagonal: 4.7,
                processor: "Apple A11 Bionic",
                resolution: "1334х750"
            ), Iphone(
                os: "iOS 11 - iOS 16.1.1",
                year: 2017,
                name: "iPhone 8 Plus",
                diagonal: 5.5,
                processor: "Apple A11 Bionic",
                resolution: "1920x1080"
            ), Iphone(
                os: "iOS 10 - iOS 15.7.1",
                year: 2016,
                name: "iPhone 7",
                diagonal: 4.7,
                processor: "Apple A10 Fusion",
                resolution: "1334х750"
            ), Iphone(
                os: "iOS 10 - iOS 15.7.1",
                year: 2016,
                name: "iPhone 7 Plus",
                diagonal: 5.5,
                processor: "Apple A10 Fusion",
                resolution: "1920x1080"
            ), Iphone(
                os: "iOS 9.3 - iOS 15.7.1",
                year: 2016,
                name: "iPhone SE",
                diagonal: 4.0,
                processor: "Apple A9", resolution: "1136x640"
            ), Iphone(
                os: "iOS 9 - iOS15",
                year: 2015,
                name: "iPhone 6s",
                diagonal: 4.7,
                processor: "Apple A9", resolution: "1334×750"
            ), Iphone(
                os: "iOS 9 - iOS 15",
                year: 2015,
                name: "iPhone 6s Plus",
                diagonal: 5.5,
                processor: "Apple A9", resolution: "1920×1080"
            ), Iphone(
                os: "iOS 8 - iO2 12",
                year: 2014,
                name: "iPhone 6",
                diagonal: 4.7,
                processor: "Apple A8", resolution: "1334×750"
            ), Iphone(
                os: "iOS 8 - iO2 12",
                year: 2014,
                name: "iPhone 6 Plus",
                diagonal: 5.5,
                processor: "Apple A8", resolution: "1920×1080"
            ), Iphone(
                os: "iOS 7 - iOS 12.5.6",
                year: 2013,
                name: "iPhone 5s",
                diagonal: 4.0,
                processor: "Apple A7", resolution: "640x1136"
            ), Iphone(
                os: "iOS 7 - iOS 12.5.6",
                year: 2013,
                name: "iPhone 5c",
                diagonal: 4.0,
                processor: "Apple A7", resolution: "640x1136"
            ), Iphone(
                os: "iOS 6.0 - 10.3.4",
                year: 2012,
                name: "iPhone 5",
                diagonal: 4.0,
                processor: "Apple A6", resolution: "640x1136"
            ), Iphone(
                os: "iOS 5.0 - 9.3.6",
                year: 2011,
                name: "iPhone 4s",
                diagonal: 3.5,
                processor: "Apple A5", resolution: "640 × 960"
            ), Iphone(
                os: "iOS 4 - 7.1.2",
                year: 2010,
                name: "iPhone 4",
                diagonal: 3.5,
                processor: "Apple A4", resolution: "640×960"
            ), Iphone(
                os: "iOS 6.1.6",
                year: 2009,
                name: "iPhone 3GS",
                diagonal: 3.5,
                processor: "Samsung S5PC100 ARM",
                resolution: "320x480"
            ),
            Iphone(
                os: "iOS 4.2.1",
                year: 2008,
                name: "iPhone 3G",
                diagonal: 3.5,
                processor: "Samsung 32-bit RISC ARM",
                resolution: "320x480"
            )
        ]
    }
    
    static var iphones: [String] {
        return Array(Set(sample.map{$0.name})).sorted(by: <)
    }
}

