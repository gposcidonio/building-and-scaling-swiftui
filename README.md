# Companion Repo for Building, Testing, and Scaling with SwiftUI

This repo contains the full program that is discussed in the article series I wrote called "Building, Testing, and Scaling with SwiftUI". The purpose of the article series is to do a deep dive into the best ways to architect our views to make them easily previewable and testable.

# Navigating This Repo

I have made separate branches in this repo, one for each stage of the development of the demonstration app `PokemonList`. They roughly correlate to the articles I've written. If you're going to really dig into the patterns I describe, I highly recommend cloning the repo and navigating it in Xcode as being able to jump to references and definitions will help with understanding.

- [v1-non-generic-view](https://github.com/gposcidonio/building-and-scaling-swiftui/tree/v1-non-generic-view)
    - Article: [Part 1: Building Previewable Views](https://gustavo.sh/2023/07/16/building-testing-and.html)
    - This branch contains the barebones code that implements a simple list of Pokemon. No special care was taken with view architecture. This is effectively the code that we begin with at the start of the article.
- [v2-generic-view](https://github.com/gposcidonio/building-and-scaling-swiftui/tree/v2-generic-view)
    - Article: [Part 1: Building Previewable Views](https://gustavo.sh/2023/07/16/building-testing-and.html)
    - This is the code that we end up with at the end of the first article, and takes the first step toward a good view architecture: making your views generic over their view models.
- [v3-child-view-model](https://github.com/gposcidonio/building-and-scaling-swiftui/tree/v3-child-view-model)
    - Article: Link TBD
    - This code builds on top of where we ended up in Part 1 with a generic view. It explores how we might architect a situation where we want to have multiple view models in a view hierarchy, and how to preserve the gains that we achieved in Part 1 while doing so.
- V4 in progress
