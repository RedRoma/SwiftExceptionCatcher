# SwiftExceptionCatcher

[<img src="http://brand.redroma.tech/Logos/RedRoma-Logo%402x.png
" width="300">](https://RedRoma.tech)

`SwiftExceptionCatcher` allows Swift Code to catch exceptions thrown from Objective-C code.

This is useful when using Thrift libraries, where it is perfectly normal for code to throw `NSException` types.


# Cocoapods

# API
Simply wrap the code-in-play in the `tryOp` function call.

```js
var object: SomeObjectThatThrows
...
do {
    try tryOp() { object.act() }
}
catch let ex is AromaException {
    print("Aroma Failed: \(ex")
}
catch let ex {
    print("Exception: \(ex")
}

```
