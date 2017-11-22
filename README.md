# Use Swift dynamic library without swiftmodule file

This repository demonstrates a technique that you can use to create a `.swiftmodule` file for a `.dylib` without having
access to the original `.swift` file.

Steps:

1. Analyze the `.dylib` using `nm -gU libModule.dylib`
2. Use `xcrun swift-demangle` to reconstruct the structure of the library
3. Create a mock implementation of the Swift module (see `Module.swift`)
4. Use the mock implementation to generate the `.swiftdoc` and `.swiftmodule` files
5. Compile your program (`main.swift`) using the mock `.swiftmodule` and link it against the real dylib
   (`libModule.dylib`)

Acknowledgements:

- Thanks to [Michael Gianarakis](https://twitter.com/mgianarakis) for sharing the slides from his [Reverse Engineering Swift Apps](https://www.slideshare.net/eightbit/rootcon-x-reverse-engineering-swift-applications) talk that introduced me to `swift-demangle`
