Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 950CF2BB465
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 20:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732031AbgKTSwy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 13:52:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729296AbgKTSwx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 13:52:53 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD37C0613CF
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 10:52:51 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id q16so10555670edv.10
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 10:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google;
        h=from:message-id:subject:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=YWmGRFuNHs/yxtUY5BY7eUclhKXBL2jg9TrRJQIfFj4=;
        b=GBA5xY9xV/sXdszXmG8ZHqQousSsvIWIxPxV8wYn/3CqIBLN3Z/TU5XG8qA0rBF6iC
         225LsMyBtxiLQ/ixWagFX0ssAOnab/zpnI+uCbKRdZbymb/0URlcMaO3pUXtaGDLkwVE
         c6/6fDL7XU5CYvN4LR4vboYItJ99sxagGCY2iHn/o9Pn+qNJ22LrU8uuJYs6lZZIy9NX
         XPL4PDfmPh1/83PlreoJ3AYpPCtGG7LLKyX8jrhkm9yjRPcWnhpXAkJIhY2R1jtsaXkC
         dEEuf5xUKORbduvVRUjqySJe4gZfEDvd5es+Cdwte/bq+1RTpRtAgz7t4gFGLxUZYbQh
         HbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:message-id:subject:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=YWmGRFuNHs/yxtUY5BY7eUclhKXBL2jg9TrRJQIfFj4=;
        b=I6K7SyD/oNcDCVKhnNG2H+ONcHbJciJeyhtoNYvc5A6zOYECu6rHn2DVGQc+vPKx3i
         dfBksZbiZnzXuB9C9Ow4wqUOJ8xbyFXG/tx4yyrMG/F+KxzUVHBOLZkThEK+tzAqW8ib
         xIwcVreycDdDBocvakLRyVJ/hfOsR430I6YpxVLROzjYVpmab7gavFG7SbMJ6fP/wcSu
         MphPqqkxz7jCgor/ZhVlBj3IfZ4SNts4bZanC62VcowQ4c5Dh1+ih93a6uJ0vKJlfOOK
         FKeq7Hw8ykXsABHIwYsjCL1S9oDOIKXTzbfL6QQSrnEJSa5zkZx2oUF0QYTckH6pVM7B
         T70w==
X-Gm-Message-State: AOAM530pmygKs8DM+n+zWNoxPkUiA7CsSS5i/91+S6p+umpklYG5TEVf
        BpFXxzFlCNNF1NATMBIjwiX3Iw==
X-Google-Smtp-Source: ABdhPJwpQlG+Hy5tN0Lw+ip3j5xGVRILm1dIyebcuCMfBvP78CcJJjiGwqo0QqnOXsAn3be2SuQl0Q==
X-Received: by 2002:a50:ff05:: with SMTP id a5mr38181982edu.43.1605898370316;
        Fri, 20 Nov 2020 10:52:50 -0800 (PST)
Received: from fiftytwodotfive.bdrung.de (ip5b401b14.dynamic.kabel-deutschland.de. [91.64.27.20])
        by smtp.googlemail.com with ESMTPSA id x15sm1447345edj.91.2020.11.20.10.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 10:52:49 -0800 (PST)
From:   Benjamin Drung <benjamin.drung@cloud.ionos.com>
X-Google-Original-From: Benjamin Drung <bdrung@debian.org>
Message-ID: <5ff0fc487272a7c21f63a929bfceee1ac9b43348.camel@debian.org>
Subject: PROBLEM: Broken pixel format for Elgato Cam Link 4K
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Cc:     Adam Goode <agoode@google.com>
Date:   Fri, 20 Nov 2020 19:52:48 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I own an Elgato Cam Link 4K which is a very popular USB HDMI capture
device (number one capture card by click rates on Geizhals [1]). The
problem is that the video feed is distorted when using the /dev/videoX
device in the browser (tested on Firefox and Chromium) for video
conferencing (tested with Jitsi Meet and Google Meet). The same
distortion is present when opening `v4l2:///dev/video0` with VLC.

The Elgato Cam Link 4K reports to have three different pixel formats:

```
$ v4l2-ctl -d /dev/video0 --list-formats-ext
ioctl: VIDIOC_ENUM_FMT
        Type: Video Capture

        [0]: 'NV12' (Y/CbCr 4:2:0)
                Size: Discrete 3840x2160
                        Interval: Discrete 0.040s (25.000 fps)
        [1]: 'NV12' (Y/CbCr 4:2:0)
                Size: Discrete 3840x2160
                        Interval: Discrete 0.040s (25.000 fps)
        [2]: 'YU12' (Planar YUV 4:2:0)
                Size: Discrete 3840x2160
                        Interval: Discrete 0.040s (25.000 fps)
```

When specifying the video format 'YU12' to VLC, the video is distorted
the same way as using the default video format. When specifying 'NV12'
to VLC, the video feed is displayed correctly:

```
vlc v4l2:///dev/video0 --v4l2-chroma=NV12
```

In OBS, the video feed is always displayed correctly. All video formats
'Y/CbCr 4:2:0', 'Planar YUV 4:2:0', 'BGR3 (Emulated)', and 'YV12
(Emulated)' combined with the color ranges 'Default', 'Partial', and
'Full' produce the same correct output.

With Linux >= 5.9 this behavior in OBS changes: The video format
'Y/CbCr 4:2:0' displays the video correctly. Switching to 'Planar YUV
4:2:0', 'BGR3 (Emulated)', or 'YV12 (Emulated)' shows the video
distorted and OBS shows this error message:

```
info: v4l2-input: Pixelformat: NV12
[...]
libv4l2: error set_fmt gave us a different result than try_fmt!
info: v4l2-input: Resolution: 3840x2160
info: v4l2-input: Pixelformat: NV12
```

Changing the video format back does not have an effect until I also
change the color range (does seem to be relevant what to select there).

Workaround
----------

You can create a v4l2loopback device and use ffmpeg to stream from the
Cam Link 4K to the loopback device:

```
ffmpeg -f v4l2 -input_format yuv420p -video_size 3840x2160 \
  -i "$camlink" -codec copy -f v4l2 "$loopdev"
```

This workaround works, but is cumbersome and burns CPU cycles.

Other reports
-------------

Searching the web for "Cam Link 4K Linux" reveals many similar reports
like this. Noteworthy is blog post [3] from Mike Walters who patched
the Cam Link 4K firmware to report the correct video format. I am
willing to debug this issue and do test, but I don't want to flash the
firmware to not break the warrenty (bisides I lack the hardware for
flashing).

Environment
-----------

This problem is present in Ubuntu 20.04 with linux 5.4.0-54.60 and
Ubuntu 20.10 with linux 5.8.0-29.31. I also tested the mainline kernels
builds 5.9.8-050908.202011101634 and 5.10.0-051000rc4.202011152030 from
Ubuntu [2].

The Cam Link 4K shows follow entries in dmesg:

```
[    1.575753] usb 2-3: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
[    1.596664] usb 2-3: LPM exit latency is zeroed, disabling LPM.
[    1.598557] usb 2-3: New USB device found, idVendor=0fd9, idProduct=0066, bcdDevice= 0.00
[    1.598558] usb 2-3: New USB device strings: Mfr=1, Product=2, SerialNumber=4
[    1.598559] usb 2-3: Product: Cam Link 4K
[    1.598560] usb 2-3: Manufacturer: Elgato
```

I have another problems with 5.9.8-050908.202011101634 and 5.10.0-
051000rc4.202011152030: Chromium fail to access the video device of Cam
Link 4K and the notebook integrated webcam has a too low brightness.

[1] https://geizhals.de/?cat=vidext
[2] https://kernel.ubuntu.com/~kernel-ppa/mainline/
[3] https://assortedhackery.com/patching-cam-link-to-play-nicer-on-linux/

--
Benjamin Drung
Debian & Ubuntu Developer

