# cv-homography

_Note: This version (4.7.2) has been unpinned from the opencv version to gain quicker access to shrunk bundle sizes. Use 4.7.1 to retain version pinning._

A subset of opencv.js pertaining to perspective transformations

[![View on npm](https://img.shields.io/npm/v/cv-homography)](https://www.npmjs.org/package/cv-homography)
![npm bundle size](https://img.shields.io/bundlephobia/minzip/cv-homography)
![npm downloads per week](https://img.shields.io/npm/dw/cv-homography)

![example workflow](https://github.com/ashwhall/cv-homography/actions/workflows/build-and-publish.yml/badge.svg)

For a list of the included functions, see [opencv_js.config.py](opencv_js.config.py).

---

Uses Github Actions to build and deploy to npm, but you can run `build_with_docker.sh` to build the package locally to `./dist`.

The major and minor version of this package should match the version of opencv.js that it is built against, with the patch version reserved for any changes to this repo.
