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

