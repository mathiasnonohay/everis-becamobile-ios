# Comment Spacing

Prefer at least one space after slashes for comments.

* **Identifier:** comment_spacing
* **Enabled by default:** Enabled
* **Supports autocorrection:** Yes
* **Kind:** lint
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 3.0.0
* **Default configuration:** warning

## Non Triggering Examples

```swift
// This is a comment
```

```swift
/// Triple slash comment
```

```swift
// Multiline double-slash
// comment
```

```swift
/// Multiline triple-slash
/// comment
```

```swift
/// Multiline triple-slash
///   - This is indented
```

```swift
// - MARK: Mark comment
```

```swift
/* Asterisk comment */
```

```swift
/*
    Multiline asterisk comment
*/
```

## Triggering Examples

```swift
//↓Something
```

```swift
//↓MARK
```

```swift
//↓👨‍👨‍👦‍👦Something
```

```swift
func a() {
    //↓This needs refactoring
    print("Something")
}
//↓We should improve above function
```

```swift
///↓This is a comment
```

```swift
/// Multiline triple-slash
///↓This line is incorrect, though
```

```swift
//↓- MARK: Mark comment
```