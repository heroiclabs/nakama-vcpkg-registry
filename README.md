# Overview

This is a federated package registry for dependencies across the `nakama-cpp` family of SDKs.

To integrate it with your vcpkg consumer, add the following to a `vcpkg-configuration.json` in the root of your repository.

[
    {
        "kind": "git",
        "repository": "https://github.com/heroiclabs/nakama-vcpkg-registry",
        "baseline": "<commit>",
        "reference": "main",
        "packages": ["nakama-sdk", "wslay"]
    }
]

# Contributing

If you need to make a change to the portfile, vcpkg has a very particular process for exposing that change to port consumers:

(1) Make the desired change to the portfile. Commit.
(2) Get the git-tree hash of the portfile directory: `git rev-parse HEAD:./cmake/vcpkg-ports/nakama-sdk`.
(3) Update the `git-tree` key to contain the value of this hash in `versions\n-\nakama-sdk.json`. Commit.
(4) Consumers will need to update to the new commit as the `baseline` value in their `vcpkg-configuration.json`.
