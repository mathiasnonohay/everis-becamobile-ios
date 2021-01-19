# Unused Declaration

Declarations should be referenced at least once within all files linted.

* **Identifier:** unused_declaration
* **Enabled by default:** Disabled
* **Supports autocorrection:** No
* **Kind:** lint
* **Analyzer rule:** Yes
* **Minimum Swift compiler version:** 3.0.0
* **Default configuration:** severity: error, include_public_and_open: false

## Non Triggering Examples

```swift
let kConstant = 0
_ = kConstant
```

```swift
enum Change<T> {
  case insert(T)
  case delete(T)
}

extension Sequence {
  func deletes<T>() -> [T] where Element == Change<T> {
    return compactMap { operation in
      if case .delete(let value) = operation {
        return value
      } else {
        return nil
      }
    }
  }
}

let changes = [Change.insert(0), .delete(0)]
changes.deletes()
```

```swift
struct Item {}
struct ResponseModel: Codable {
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case items = "ResponseItems"
    }
}

_ = ResponseModel(items: [Item()]).items
```

```swift
class ResponseModel {
    @objc func foo() {
    }
}
_ = ResponseModel()
```

```swift
public func foo() {}
```

```swift
protocol Foo {}

extension Foo {
    func bar() {}
}

struct MyStruct: Foo {}
MyStruct().bar()
```

```swift
import XCTest
class MyTests: XCTestCase {
    func testExample() {}
}
```

```swift
import XCTest
open class BestTestCase: XCTestCase {}
class MyTests: BestTestCase {
    func testExample() {}
}
```

```swift
import Cocoa

@NSApplicationMain
final class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationWillFinishLaunching(_ notification: Notification) {}
    func applicationWillBecomeActive(_ notification: Notification) {}
}
```

```swift
import Foundation

public final class Foo: NSObject {
    @IBAction private func foo() {}
}
```

```swift
import Foundation

public final class Foo: NSObject {
    @objc func foo() {}
}
```

```swift
import Foundation

public final class Foo: NSObject {
    @IBInspectable private var innerPaddingWidth: Int {
        set { self.backgroundView.innerPaddingWidth = newValue }
        get { return self.backgroundView.innerPaddingWidth }
    }
}
```

```swift
import Foundation

public final class Foo: NSObject {
    @IBOutlet private var bar: NSObject! {
        set { fatalError() }
        get { fatalError() }
    }

    @IBOutlet private var baz: NSObject! {
        willSet { print("willSet") }
    }

    @IBOutlet private var buzz: NSObject! {
        didSet { print("didSet") }
    }
}
```

## Triggering Examples

```swift
let ↓kConstant = 0
```

```swift
struct Item {}
struct ↓ResponseModel: Codable {
    let ↓items: [Item]

    enum ↓CodingKeys: String {
        case items = "ResponseItems"
    }
}
```

```swift
class ↓ResponseModel {
    func ↓foo() {
    }
}
```

```swift
public func ↓foo() {}
```

```swift
protocol Foo {
    func ↓bar1()
}

extension Foo {
    func bar1() {}
    func ↓bar2() {}
}

struct MyStruct: Foo {}
_ = MyStruct()
```

```swift
import XCTest
class ↓MyTests: NSObject {
    func ↓testExample() {}
}
```

```swift
import Cocoa

@NSApplicationMain
final class AppDelegate: NSObject, NSApplicationDelegate {
    func ↓appWillFinishLaunching(_ notification: Notification) {}
    func applicationWillBecomeActive(_ notification: Notification) {}
}
```

```swift
import Cocoa

final class ↓AppDelegate: NSObject, NSApplicationDelegate {
    func applicationWillFinishLaunching(_ notification: Notification) {}
    func applicationWillBecomeActive(_ notification: Notification) {}
}
```

```swift
import Foundation

public final class Foo: NSObject {
    @IBOutlet var ↓bar: NSObject!
}
```

```swift
import Foundation

public final class Foo: NSObject {
    @IBInspectable var ↓bar: String!
}
```