Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42EC232CBD0
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 06:21:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234012AbhCDFU4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 00:20:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234066AbhCDFUr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 00:20:47 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A05F5C061574
        for <linux-media@vger.kernel.org>; Wed,  3 Mar 2021 21:20:06 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id p8so20601278ejb.10
        for <linux-media@vger.kernel.org>; Wed, 03 Mar 2021 21:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=0y3eTeedj5LX6SwRHpWUbyfFXUwqnSRDfDH/LouqFhk=;
        b=ctPMxNllhUXxbtvrV65k3lTJydfYl0WU5JZLEk736OL8ftRwR13KZ+QExU3Jkqc9WJ
         cL3/u3aDQEZY9H2qcV1cjiQEVKQEnVnWHMxH69ji/twSDfoI2PfzzHOinsOnE6sYQ7BQ
         4WSMDo+z3OaWmGHVADJaRMkPDA/nd8u7hcQzMqX9IR93pf/rvqk9SPfck/JSldMWip9W
         CMlwiuWJx13zcfONpuzr6BLVeyZX/veu6CcSriQ6ZtIQUQzYFZPG3CpTAk2iDd8NbcIp
         Q8xnQddvwirnNipJ3AZ9YeSVwScNn8fZjw+4ywhljc8nz0VRfikJX+WGxOJCtcbgt85Z
         k1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=0y3eTeedj5LX6SwRHpWUbyfFXUwqnSRDfDH/LouqFhk=;
        b=kjAt1FTQSKuL0mHfdGvuCaaDL+Hc4hKNTAaxSdOnn/IlqsR8q9mRBXF3UV0Fsq0ksJ
         +c9WKhB96G4JNgk4N4rKqC6XKmWNErrVBNe2xZXvJBILAy8utlYcwE66Cjmwu7ERB2pY
         XBHMYHCfS5WpNLW1Dn9lQ7bWxorq4GmOsxuSpV3IfHn3VTFdC7/arGiV2FBUGLLrHDIh
         Jg4SyG/j9lz0V9PwpQlanamKI8OIvqY5uPW1djm0wmHgN3oBQpPNyyjVjwrX7cRuEKf2
         dxvIVZufA9Vm0u5g9kSxM82oA+Vp+VFS7z2ny3bMRo1JjpQbXSwcjSsla/Vej0F/9zMa
         4pbw==
X-Gm-Message-State: AOAM530Bf/Ang9CGpxhzamzvcCUKhdG5SSAFYYANHLiI6Vd/mh9FBMgB
        JwK02n3Z+dCZuStf0141Eoz+DJ940KWZeE2zZh+aCTsluPcDSw==
X-Google-Smtp-Source: ABdhPJwOdM3CtbmgIjWFiccMf0Nr/LcrFjf4pddsV3qzK55cjEEcwSx2dojczMQvnp8hWpSoGymSYSYmjMqFSfF3REk=
X-Received: by 2002:a17:906:5797:: with SMTP id k23mr2329834ejq.515.1614835204760;
 Wed, 03 Mar 2021 21:20:04 -0800 (PST)
MIME-Version: 1.0
From:   Russell Healy <russell.healy@gmail.com>
Date:   Thu, 4 Mar 2021 18:19:54 +1300
Message-ID: <CAHpUb_QWMWDx0De2GJXEr7Dj+4_zcrW46jzCbG5+wo4Bux1c8Q@mail.gmail.com>
Subject: Flip webcam
To:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

pinchartl asked me to cc the following email to the mailing list. I
misspelled the address. Forwarding here..

---------- Forwarded message ---------
From: Russell Healy <russell.healy@gmail.com>
Date: Thu, 4 Mar 2021 at 18:07
Subject: Flip webcam
To: <laurent@perceval.ideasonboard.com>
Cc: <linux-media@vger.kernal.org>


Hi Laurent

We had a brief discussion on #v4l and you suggested I write to you.

I would like to be able to vertically flip my webcam. The reason for
this is at the end of the email.

v4l2-ctl -l does not list controls for "rotate" or "vertical_flip"

On #v4l you noted the following:

<pinchartl> rus190: there's a tool call uvcdynctrl that can add
mappings between extension units and V4L2 controls to the driver
<pinchartl> after that, h/v flip would be available as V4L2 controls
<pinchartl> and this gives me a great idea
<pinchartl> who wants to submit a patch to libcamera to support XU
controls ? :-)

uvcdynctrl has options to import dynamic controls from an XML file,
and to import from a default location. I don't know how these should
be specified.

I am able to flip using guvcview, but that change is not applied to
other applications (such as Cheese, for testing). I notice that in the
config file for guvcview (eg: ~/.config/guvcview2/video0) the video_fx
mask is set to 0x0 before flipping, and 0x2 after flipping. guvcview
has two sets of config, one is saved to the file just mentioned, and
the other is a profile that can be saved to and loaded from a
user-specified file. The former config does not seem to apply to other
applications, and the latter is applied to other applications when it
is loaded by guvcview.

The wikipedia article for guvcview mentions "webcam-maker Logitech has
provided the specifications for their UVC webcam extension controls
and as a result Logitech camera extension controls are included [in
guvcview]". I haven't been able to find the Logitech specs.

I have included output of a few v4l2-ctl and uvcdynctrl commands below.

Webcam is Logitech Brio, OS is Ubuntu 24.04.2, version of guvcview is 2.0.6

Context: I have my webcam mounted on a goose-neck mount, hanging over
the top of my monitor. I do this because my monitor is quite tall, and
if I mount the webcam on top of it, the view is of my head, rather
than my face. So I would like to be able to vertically flip the image
for use in video conferencing apps which do not provide that feature
themselves (eg: Google Meet).

Thank you very much

Russell

$ sudo v4l2-ctl --list-devices --verbose
Logitech BRIO (usb-0000:00:14.0-3.1):
    /dev/video0
    /dev/video1
    /dev/media0

VIDIOC_QUERYCAP: ok

$ sudo v4l2-ctl --all
Driver Info:
    Driver name      : uvcvideo
    Card type        : Logitech BRIO
    Bus info         : usb-0000:00:14.0-3.1
    Driver version   : 5.8.18
    Capabilities     : 0x84a00001
        Video Capture
        Metadata Capture
        Streaming
        Extended Pix Format
        Device Capabilities
    Device Caps      : 0x04200001
        Video Capture
        Streaming
        Extended Pix Format
Media Driver Info:
    Driver name      : uvcvideo
    Model            : Logitech BRIO
    Serial           : 16201378
    Bus info         : usb-0000:00:14.0-3.1
    Media version    : 5.8.18
    Hardware revision: 0x00000317 (791)
    Driver version   : 5.8.18
Interface Info:
    ID               : 0x03000002
    Type             : V4L Video
Entity Info:
    ID               : 0x00000001 (1)
    Name             : Logitech BRIO
    Function         : V4L2 I/O
    Flags         : default
    Pad 0x01000007   : 0: Sink
      Link 0x0200001f: from remote pad 0x100000a of entity 'Processing
3': Data, Enabled, Immutable
Priority: 2
Video input : 0 (Camera 1: ok)
Format Video Capture:
    Width/Height      : 640/480
    Pixel Format      : 'MJPG' (Motion-JPEG)
    Field             : None
    Bytes per Line    : 0
    Size Image        : 614400
    Colorspace        : sRGB
    Transfer Function : Default (maps to sRGB)
    YCbCr/HSV Encoding: Default (maps to ITU-R 601)
    Quantization      : Default (maps to Full Range)
    Flags             :
Crop Capability Video Capture:
    Bounds      : Left 0, Top 0, Width 640, Height 480
    Default     : Left 0, Top 0, Width 640, Height 480
    Pixel Aspect: 1/1
Selection Video Capture: crop_default, Left 0, Top 0, Width 640,
Height 480, Flags:
Selection Video Capture: crop_bounds, Left 0, Top 0, Width 640, Height
480, Flags:
Streaming Parameters Video Capture:
    Capabilities     : timeperframe
    Frames per second: 24.000 (24/1)
    Read buffers     : 0
                     brightness 0x00980900 (int)    : min=0 max=255
step=1 default=128 value=128
                       contrast 0x00980901 (int)    : min=0 max=255
step=1 default=128 value=128
                     saturation 0x00980902 (int)    : min=0 max=255
step=1 default=128 value=128
 white_balance_temperature_auto 0x0098090c (bool)   : default=1 value=1
                           gain 0x00980913 (int)    : min=0 max=255
step=1 default=0 value=0
           power_line_frequency 0x00980918 (menu)   : min=0 max=2
default=2 value=2
                0: Disabled
                1: 50 Hz
                2: 60 Hz
      white_balance_temperature 0x0098091a (int)    : min=2000
max=7500 step=10 default=4000 value=4450 flags=inactive
                      sharpness 0x0098091b (int)    : min=0 max=255
step=1 default=128 value=128
         backlight_compensation 0x0098091c (int)    : min=0 max=1
step=1 default=1 value=1
                  exposure_auto 0x009a0901 (menu)   : min=0 max=3
default=3 value=3
                1: Manual Mode
                3: Aperture Priority Mode
              exposure_absolute 0x009a0902 (int)    : min=3 max=2047
step=1 default=250 value=312 flags=inactive
         exposure_auto_priority 0x009a0903 (bool)   : default=0 value=1
                   pan_absolute 0x009a0908 (int)    : min=-36000
max=36000 step=3600 default=0 value=0
                  tilt_absolute 0x009a0909 (int)    : min=-36000
max=36000 step=3600 default=0 value=0
                 focus_absolute 0x009a090a (int)    : min=0 max=255
step=5 default=0 value=50 flags=inactive
                     focus_auto 0x009a090c (bool)   : default=1 value=1
                  zoom_absolute 0x009a090d (int)    : min=100 max=500
step=1 default=100 value=100
                      led1_mode 0x0a046d05 (menu)   : min=0 max=3
default=0 value=3
                0: Off
                1: On
                2: Blink
                3: Auto
                 led1_frequency 0x0a046d06 (int)    : min=0 max=255
step=1 default=0 value=0

$ sudo uvcdynctrl -l
Listing available devices:
  video0   Logitech BRIO
    Media controller device: /dev/media0
    Entity 1: Logitech BRIO. Type: 65537, Revision: 0, Flags: 1,
Group-id: 0, Pads: 1, Links: 0
      Device node
      Entity: 1, Pad 0, Flags: 1
  video1   Logitech BRIO
    Media controller device /dev/media1 doesn't exist
ERROR: Unable to list device entities: Invalid device or device cannot
be opened. (Code: 5)
