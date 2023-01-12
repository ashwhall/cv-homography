# Classes and methods whitelist
core = {
    '': [
        'perspectiveTransform',
    ],
}

imgproc = {
    '': [
        'warpPerspective',
    ],
}

calib3d = {
    '': [
        'findHomography',
    ],
}

white_list = makeWhiteList([core, imgproc, calib3d])
