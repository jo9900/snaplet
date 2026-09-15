#!/usr/bin/env swift
import AppKit

// Original vector artwork, matching Resources/Icon.svg. No downloaded assets.
let root = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
let destination = root.appendingPathComponent("Resources/Assets.xcassets/AppIcon.appiconset")
try FileManager.default.createDirectory(at: destination, withIntermediateDirectories: true)

func color(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> CGColor {
    CGColor(srgbRed: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
}

func render(pixels: Int) throws -> Data {
    let context = CGContext(
        data: nil, width: pixels, height: pixels, bitsPerComponent: 8, bytesPerRow: 0,
        space: CGColorSpace(name: CGColorSpace.sRGB)!,
        bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
    )!
    let scale = CGFloat(pixels) / 1024
    context.translateBy(x: 0, y: CGFloat(pixels))
    context.scaleBy(x: scale, y: -scale)
    context.setFillColor(color(20, 47, 59))
    context.addPath(CGPath(
        roundedRect: CGRect(x: 64, y: 64, width: 896, height: 896),
        cornerWidth: 192, cornerHeight: 192, transform: nil
    ))
    context.fillPath()
    context.setLineWidth(48)
    context.setLineCap(.round)
    context.setLineJoin(.round)
    context.setStrokeColor(color(104, 224, 199))
    let corners: [[CGPoint]] = [
        [.init(x: 396, y: 286), .init(x: 286, y: 286), .init(x: 286, y: 396)],
        [.init(x: 628, y: 286), .init(x: 738, y: 286), .init(x: 738, y: 396)],
        [.init(x: 286, y: 628), .init(x: 286, y: 738), .init(x: 396, y: 738)],
        [.init(x: 738, y: 628), .init(x: 738, y: 738), .init(x: 628, y: 738)]
    ]
    for points in corners {
        context.move(to: points[0])
        points.dropFirst().forEach { context.addLine(to: $0) }
    }
    context.strokePath()
    context.setStrokeColor(color(245, 251, 250))
    context.setLineWidth(64)
    context.move(to: CGPoint(x: 414, y: 610))
    context.addLine(to: CGPoint(x: 610, y: 414))
    context.strokePath()
    let bitmap = NSBitmapImageRep(cgImage: context.makeImage()!)
    return bitmap.representation(using: .png, properties: [:])!
}

var images: [[String: String]] = []
for size in [16, 32, 128, 256, 512] {
    for scale in [1, 2] {
        let name = "icon_\(size)x\(size)@\(scale)x.png"
        let data = try render(pixels: size * scale)
        try data.write(to: destination.appendingPathComponent(name))
        images.append(["idiom": "mac", "size": "\(size)x\(size)", "scale": "\(scale)x", "filename": name])
    }
}
let catalog: [String: Any] = ["images": images, "info": ["author": "xcode", "version": 1]]
let json = try JSONSerialization.data(withJSONObject: catalog, options: [.prettyPrinted, .sortedKeys])
try json.write(to: destination.appendingPathComponent("Contents.json"))
let parent = destination.deletingLastPathComponent().appendingPathComponent("Contents.json")
try Data("{\"info\":{\"author\":\"xcode\",\"version\":1}}\n".utf8).write(to: parent)
print("Generated 10 macOS app icons in \(destination.path)")
