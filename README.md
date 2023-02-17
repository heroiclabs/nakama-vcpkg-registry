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


### Updating ports

Update the `portfile.cmake` and `vcpkg.json` as needed. You'll likely need to calculate a new SHA512 for the repository you're pulling in. To get this value, run: `$VCPKG_ROOT/vcpkg hash <(curl <url-of-compressed-git-repo>)`.

Commit the modifications to your `portfile` and `vcpkg.json`. Then run:

`$VCPKG_ROOT/vcpkg x-add-version <port> --vcpkg-root=${PWD}`
