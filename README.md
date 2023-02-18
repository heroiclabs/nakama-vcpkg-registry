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

Update the `portfile.cmake` and `vcpkg.json` as needed.

Commit the modifications to your `portfile` and `vcpkg.json`. Then run:

`$VCPKG_ROOT/vcpkg x-add-version <port> --vcpkg-root=${PWD}`

You may discover that you made a mistake with a portfile. In these cases you can append `--overwrite-version` to your `x-add-version` commmand, so that the bad version isn't tracked by the registry.

You also may need to calculate a new SHA512 for an artifact you're pulling in. To get this value, run: `$VCPKG_ROOT/vcpkg hash <(curl <url-of-compressed-git-repo>)`.