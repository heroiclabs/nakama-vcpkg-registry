# Overview

This is a federated package registry for dependencies across the `nakama-cpp` family of SDKs.

To integrate it with your vcpkg consumer, add the following to a `vcpkg-configuration.json` in the root of your repository:

```
[
    {
        "kind": "git",
        "repository": "https://github.com/heroiclabs/nakama-vcpkg-registry",
        "baseline": "<commit>",
        "reference": "master",
        "packages": ["nakama-sdk", "wslay"]
    }
]
```

# Contributing

If you need to make a change to a port, commit your change and then run the following from the vcpkg repo:

./vcpkg x-add-version <port>

This will ensure the various other parts of the registry (e.g., baseline and version files) are up-to-date. It essentially
"lints" your change to make sure it is valid.