//

import Foundation

public class BundleFinder {}


// Это копия автосгенерированого SPM расширения, есть 2 отличия
public extension Bundle {

    // Отличие №1, другое название, чтобы не было конфликтов
    public static var resourceBundle: Bundle = {

        let bundleName = "Resources_Resources"
        let candidates = [
            Bundle.main.resourceURL,
            Bundle(for: BundleFinder.self).resourceURL,
            Bundle.main.bundleURL,
            // Отличие №2, еще один путь где может лежать бандл с ресурсами
            Bundle(for: BundleFinder.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent(),
        ]
        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        fatalError("unable to find bundle named \(bundleName)")
    }()

}