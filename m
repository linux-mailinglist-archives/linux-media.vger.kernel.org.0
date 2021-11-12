Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A313D44ED49
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 20:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232340AbhKLTdJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 14:33:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232383AbhKLTdH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 14:33:07 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53F60C061766
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 11:30:16 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so7403083otj.7
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 11:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jHYo9+XXjxYKbaouV/rJFyf6zGDnTNmg8RMRXHmzT6A=;
        b=M85vWjTjC4OpWunwxZGXb7zbCnnTei6DcI8MnlAg1ESuzKk++EYhsZwIDE1g/4aCf0
         eTPajNZg0GLyGpm6SsXXjg9Qr3QCJKBG/K86YljPMXdkEe+cJz4xb8HUlaP4h5jYMP8L
         FVE5/Quq4HIeb9PEaUPRsJd8QRlOUQnmvbMWetxcjpKWYo2mWsrM9QyZiUCN/SmL15tN
         0MyfnS5ZXWEwe3e+vyQCCCS2wmDWSztYSRXNp35H6bqFSiTIdg0Bh8F5irHRQ6r0HfZt
         dKIrwmje2Y5hW0/IesC78wsmeS3AVkL56t7Gm/TvHlVCDQ/WCUkO4kr4bDKRRPwYiA2a
         izkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jHYo9+XXjxYKbaouV/rJFyf6zGDnTNmg8RMRXHmzT6A=;
        b=DysDQijmbGrUnLkepQVpdBVfNA7hLbQptjcm0xZib3DIKwBYfyj36jcMSEulsUrQxQ
         tgXhpQgy/9N7npPJjmf6Alx4dDODYDbkjxrQ4CUnK3KZA33iwjkoK0bxmiU7IT7Aw7fM
         DL6gvxC+Y+siyP4NR3J0MANKScgQshDF6J2LT6UNCR2a/lT2E2MkJFEskTWp+DuhgCaU
         DOI4MIcqDpZvhLIjvNe3zb39V69c86ssKUtf1AW1ArW66T4LSdRdtWJg3rKopjHkDoeo
         h2Utg/GBfxAauJl/nspXY6Y+ZqrH9eOsmTyB4Q1bvh279u+YrJKlwE+Q6xSk4sNp5B6g
         FASA==
X-Gm-Message-State: AOAM532VnW1qUz7KeTf2rbAW8hsZLpxqyy2ECEdvtFgfRjaM076SQXUc
        6diuXsA7wqnMMa17kp+/M5/wutY/zEHYBa5iiEM=
X-Google-Smtp-Source: ABdhPJzfUK/9hYrRvqYUtEjttkbzZxp4+Hzq96O31hfFqE8816ObCTyu1LM8vIiXNNyTK9kM4D9X4qck2lDPTJkNRBM=
X-Received: by 2002:a9d:7855:: with SMTP id c21mr14363793otm.167.1636745413054;
 Fri, 12 Nov 2021 11:30:13 -0800 (PST)
MIME-Version: 1.0
References: <20211112140302.240134-1-ribalda@chromium.org>
In-Reply-To: <20211112140302.240134-1-ribalda@chromium.org>
From:   James Hilliard <james.hilliard1@gmail.com>
Date:   Fri, 12 Nov 2021 12:30:01 -0700
Message-ID: <CADvTj4q3CQpi6Vf-Bo-aqX5CXQZ_mjAM2JMjQBZh8qEBRW4KBA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Set the colorspace as sRGB if undefined
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 12, 2021 at 7:03 AM Ricardo Ribalda <ribalda@chromium.org> wrot=
e:
>
> Never return V4L2_COLORSPACE_DEFAULT. From the standard:
>
> """
> In the absence of this descriptor, or in the case of
> =E2=80=9CUnspecified=E2=80=9D values within the descriptor, color matchin=
g
> defaults will be assumed. The color matching defaults are
> compliant with sRGB since the BT.709 transfer function and
> the sRGB transfer function are very similar.
> """
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> ---
>
> James, could you test it on your device to figure out if it solves
> your compliance issues. Thanks!

Hmm, still seems to be hitting an error:

# dmesg -c > /dev/null
# v4l2-ctl --all -d /dev/video0
Driver Info:
    Driver name      : uvcvideo
    Card type        : SVS RGB USB camera: SVS RGB USB
    Bus info         : usb-0000:00:14.0-2
    Driver version   : 5.15.0
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
    Model            : SVS RGB USB camera: SVS RGB USB
    Serial           : V20210818SWS2093
    Bus info         : usb-0000:00:14.0-2
    Media version    : 5.15.0
    Hardware revision: 0x00000001 (1)
    Driver version   : 5.15.0
Interface Info:
    ID               : 0x03000002
    Type             : V4L Video
Entity Info:
    ID               : 0x00000001 (1)
    Name             : Video Capture 4
    Function         : V4L2 I/O
    Flags            : default
    Pad 0x01000007   : 0: Sink
      Link 0x02000010: from remote pad 0x100000a of entity 'Extension
3' (Video Pixel Formatter): Data, Enabled, Immutable
Priority: 2
Video input : 0 (Camera 1: ok)
Format Video Capture:
    Width/Height      : 640/480
    Pixel Format      : 'MJPG' (Motion-JPEG)
    Field             : None
    Bytes per Line    : 0
    Size Image        : 614400
    Colorspace        : Default
    Transfer Function : Default (maps to Rec. 709)
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
    Frames per second: 15.000 (15/1)
    Read buffers     : 0

User Controls

                     brightness 0x00980900 (int)    : min=3D1 max=3D255
step=3D1 default=3D128 value=3D128
                       contrast 0x00980901 (int)    : min=3D1 max=3D255
step=3D1 default=3D128 value=3D128
                     saturation 0x00980902 (int)    : min=3D1 max=3D255
step=3D1 default=3D128 value=3D128
        white_balance_automatic 0x0098090c (bool)   : default=3D1 value=3D1
                          gamma 0x00980910 (int)    : min=3D1 max=3D255
step=3D1 default=3D128 value=3D128
                           gain 0x00980913 (int)    : min=3D1 max=3D100
step=3D1 default=3D50 value=3D50
           power_line_frequency 0x00980918 (menu)   : min=3D0 max=3D2
default=3D1 value=3D2 (60 Hz)
                0: Disabled
                1: 50 Hz
                2: 60 Hz
      white_balance_temperature 0x0098091a (int)    : min=3D2800
max=3D6500 step=3D1 default=3D4650 value=3D4650 flags=3Dinactive
                      sharpness 0x0098091b (int)    : min=3D1 max=3D255
step=3D1 default=3D128 value=3D128

Camera Controls

                  auto_exposure 0x009a0901 (menu)   : min=3D0 max=3D3
default=3D0 value=3D2 (Shutter Priority Mode)
                0: Auto Mode
                2: Shutter Priority Mode
         exposure_time_absolute 0x009a0902 (int)    : min=3D5 max=3D2500
step=3D1 default=3D5 value=3D5 flags=3Dinactive
     exposure_dynamic_framerate 0x009a0903 (bool)   : default=3D0 value=3D0
# strace -f v4l2-compliance -d /dev/video0 -E
execve("/usr/bin/v4l2-compliance", ["v4l2-compliance", "-d",
"/dev/video0", "-E"], 0x7ffffc3dbd40 /* 13 vars */) =3D 0
brk(NULL)                               =3D 0x55ce826e1000
access("/etc/ld.so.preload", R_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) =3D -1 ENOENT
(No such file or directory)
openat(AT_FDCWD, "/lib64/glibc-hwcaps/x86-64-v3/libv4l2.so.0",
O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/glibc-hwcaps/x86-64-v3", 0x7ffe668a11c0,
0) =3D -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/glibc-hwcaps/x86-64-v2/libv4l2.so.0",
O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/glibc-hwcaps/x86-64-v2", 0x7ffe668a11c0,
0) =3D -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/tls/haswell/x86_64/libv4l2.so.0",
O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/tls/haswell/x86_64", 0x7ffe668a11c0, 0) =3D
-1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/tls/haswell/libv4l2.so.0",
O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/tls/haswell", 0x7ffe668a11c0, 0) =3D -1
ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/tls/x86_64/libv4l2.so.0", O_RDONLY|O_CLOEXEC)
=3D -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/tls/x86_64", 0x7ffe668a11c0, 0) =3D -1
ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/tls/libv4l2.so.0", O_RDONLY|O_CLOEXEC) =3D -1
ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/tls", 0x7ffe668a11c0, 0) =3D -1 ENOENT (No
such file or directory)
openat(AT_FDCWD, "/lib64/haswell/x86_64/libv4l2.so.0",
O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/haswell/x86_64", 0x7ffe668a11c0, 0) =3D -1
ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/haswell/libv4l2.so.0", O_RDONLY|O_CLOEXEC) =3D
-1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/haswell", 0x7ffe668a11c0, 0) =3D -1 ENOENT
(No such file or directory)
openat(AT_FDCWD, "/lib64/x86_64/libv4l2.so.0", O_RDONLY|O_CLOEXEC) =3D
-1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/x86_64", 0x7ffe668a11c0, 0) =3D -1 ENOENT
(No such file or directory)
openat(AT_FDCWD, "/lib64/libv4l2.so.0", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\370\"\0\0\0\0\0\0".=
..,
832) =3D 832
pread64(3, "\4\0\0\0
\0\0\0\5\0\0\0GNU\0\1\0\1\300\4\0\0\0\t\0\0\0\0\0\0\0"..., 48, 35072)
=3D 48
newfstatat(3, "", {st_mode=3DS_IFREG|0755, st_size=3D55392, ...}, AT_EMPTY_=
PATH) =3D 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) =3D 0x7fdab9846000
mmap(NULL, 57808, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D 0x7fdab98=
37000
mmap(0x7fdab9839000, 20480, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) =3D 0x7fdab9839000
mmap(0x7fdab983e000, 8192, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x7000) =3D 0x7fdab983e000
mmap(0x7fdab9840000, 24576, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8000) =3D 0x7fdab9840000
close(3)                                =3D 0
openat(AT_FDCWD, "/lib64/libv4lconvert.so.0", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\250D\0\0\0\0\0\0"..=
.,
832) =3D 832
pread64(3, "\4\0\0\0
\0\0\0\5\0\0\0GNU\0\1\0\1\300\4\0\0\0\t\0\0\0\0\0\0\0"..., 48, 126512)
=3D 48
newfstatat(3, "", {st_mode=3DS_IFREG|0755, st_size=3D137440, ...},
AT_EMPTY_PATH) =3D 0
mmap(NULL, 476256, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D 0x7fdab9=
7c2000
mprotect(0x7fdab97c6000, 114688, PROT_NONE) =3D 0
mmap(0x7fdab97c6000, 73728, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) =3D 0x7fdab97c6000
mmap(0x7fdab97d8000, 36864, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x16000) =3D 0x7fdab97d8000
mmap(0x7fdab97e2000, 12288, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1f000) =3D 0x7fdab97e2000
mmap(0x7fdab97e5000, 332896, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0x7fdab97e5000
close(3)                                =3D 0
openat(AT_FDCWD, "/lib64/libjpeg.so.8", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0@E\0\0\0\0\0\0"...,
832) =3D 832
newfstatat(3, "", {st_mode=3DS_IFREG|0755, st_size=3D493408, ...},
AT_EMPTY_PATH) =3D 0
mmap(NULL, 495648, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D 0x7fdab9=
748000
mmap(0x7fdab974c000, 237568, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) =3D 0x7fdab974c000
mmap(0x7fdab9786000, 237568, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3e000) =3D 0x7fdab9786000
mmap(0x7fdab97c0000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x77000) =3D 0x7fdab97c0000
close(3)                                =3D 0
openat(AT_FDCWD, "/lib64/libstdc++.so.6", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\0\214\n\0\0\0\0\0".=
..,
832) =3D 832
pread64(3, "\4\0\0\0
\0\0\0\5\0\0\0GNU\0\1\0\1\300\4\0\0\0\v\0\0\0\0\0\0\0"..., 48,
1457064) =3D 48
newfstatat(3, "", {st_mode=3DS_IFREG|0755, st_size=3D1515608, ...},
AT_EMPTY_PATH) =3D 0
mmap(NULL, 1531392, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D 0x7fdab=
95d2000
mmap(0x7fdab9674000, 524288, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xa2000) =3D 0x7fdab9674000
mmap(0x7fdab96f4000, 270336, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x122000) =3D 0x7fdab96f4000
mmap(0x7fdab9736000, 61440, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x163000) =3D 0x7fdab9736000
mmap(0x7fdab9745000, 11776, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0x7fdab9745000
close(3)                                =3D 0
openat(AT_FDCWD, "/lib64/libm.so.6", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\340\321\0\0\0\0\0\0=
"...,
832) =3D 832
newfstatat(3, "", {st_mode=3DS_IFREG|0755, st_size=3D878512, ...},
AT_EMPTY_PATH) =3D 0
mmap(NULL, 880680, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D 0x7fdab9=
4fa000
mprotect(0x7fdab9507000, 823296, PROT_NONE) =3D 0
mmap(0x7fdab9507000, 442368, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xd000) =3D 0x7fdab9507000
mmap(0x7fdab9573000, 376832, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x79000) =3D 0x7fdab9573000
mmap(0x7fdab95d0000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xd5000) =3D 0x7fdab95d0000
close(3)                                =3D 0
openat(AT_FDCWD, "/lib64/libgcc_s.so.1", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\3702\0\0\0\0\0\0"..=
.,
832) =3D 832
pread64(3, "\4\0\0\0
\0\0\0\5\0\0\0GNU\0\1\0\1\300\4\0\0\0\v\0\0\0\0\0\0\0"..., 48, 71408)
=3D 48
newfstatat(3, "", {st_mode=3DS_IFREG|0644, st_size=3D76144, ...}, AT_EMPTY_=
PATH) =3D 0
mmap(NULL, 78856, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D 0x7fdab94=
e6000
mmap(0x7fdab94e9000, 49152, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3000) =3D 0x7fdab94e9000
mmap(0x7fdab94f5000, 12288, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xf000) =3D 0x7fdab94f5000
mmap(0x7fdab94f8000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x11000) =3D 0x7fdab94f8000
close(3)                                =3D 0
openat(AT_FDCWD, "/lib64/libc.so.6", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0
\224\2\0\0\0\0\0"..., 832) =3D 832
pread64(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0".=
..,
784, 64) =3D 784
pread64(3, "\4\0\0\0000\0\0\0\5\0\0\0GNU\0\2\200\0\300\4\0\0\0\3\0\0\0\0\0\=
0\0"...,
64, 848) =3D 64
pread64(3, "\4\0\0\0\20\0\0\0\1\0\0\0GNU\0\0\0\0\0\5\0\0\0\17\0\0\0\0\0\0\0=
",
32, 912) =3D 32
newfstatat(3, "", {st_mode=3DS_IFREG|0755, st_size=3D2023720, ...},
AT_EMPTY_PATH) =3D 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) =3D 0x7fdab94e4000
pread64(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0".=
..,
784, 64) =3D 784
mmap(NULL, 2075760, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D 0x7fdab=
92e9000
mprotect(0x7fdab9311000, 1835008, PROT_NONE) =3D 0
mmap(0x7fdab9311000, 1466368, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x28000) =3D 0x7fdab9311000
mmap(0x7fdab9477000, 364544, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x18e000) =3D 0x7fdab9477000
mmap(0x7fdab94d1000, 24576, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1e7000) =3D 0x7fdab94d1000
mmap(0x7fdab94d7000, 52336, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0x7fdab94d7000
close(3)                                =3D 0
mmap(NULL, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) =3D 0x7fdab92e6000
arch_prctl(ARCH_SET_FS, 0x7fdab92e6740) =3D 0
set_tid_address(0x7fdab92e6a10)         =3D 517
set_robust_list(0x7fdab92e6a20, 24)     =3D 0
mprotect(0x7fdab94d1000, 16384, PROT_READ) =3D 0
mprotect(0x7fdab94f8000, 4096, PROT_READ) =3D 0
mprotect(0x7fdab95d0000, 4096, PROT_READ) =3D 0
mprotect(0x7fdab9736000, 45056, PROT_READ) =3D 0
mprotect(0x7fdab97c0000, 4096, PROT_READ) =3D 0
mprotect(0x7fdab97e2000, 8192, PROT_READ) =3D 0
mprotect(0x7fdab9840000, 4096, PROT_READ) =3D 0
mprotect(0x55ce806fc000, 8192, PROT_READ) =3D 0
mprotect(0x7fdab9877000, 8192, PROT_READ) =3D 0
prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=3D8192*1024,
rlim_max=3DRLIM64_INFINITY}) =3D 0
getrandom("\x2c\x65\x3d\xf5\x77\xe8\xc1\x62", 8, GRND_NONBLOCK) =3D 8
brk(NULL)                               =3D 0x55ce826e1000
brk(0x55ce82702000)                     =3D 0x55ce82702000
futex(0x7fdab9745cbc, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
futex(0x7fdab9745cc8, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
ioctl(1, TCGETS, {B38400 opost isig icanon echo ...}) =3D 0
newfstatat(1, "", {st_mode=3DS_IFCHR|0620, st_rdev=3Dmakedev(0x88, 0),
...}, AT_EMPTY_PATH) =3D 0
write(1, "v4l2-compliance 1.22.1, 64 bits,"..., 47v4l2-compliance
1.22.1, 64 bits, 64-bit time_t
) =3D 47
write(1, "\n", 1
)                       =3D 1
newfstatat(AT_FDCWD, "/dev/video0", {st_mode=3DS_IFCHR|0660,
st_rdev=3Dmakedev(0x51, 0), ...}, 0) =3D 0
openat(AT_FDCWD, "/sys/dev/char/81:0/uevent", O_RDONLY) =3D 3
read(3, "MAJOR=3D81\nMINOR=3D0\nDEVNAME=3Dvideo0\n", 8191) =3D 32
close(3)                                =3D 0
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 3
ioctl(3, VIDIOC_QUERYCAP, {driver=3D"uvcvideo", card=3D"SVS RGB USB
camera: SVS RGB USB", bus_info=3D"usb-0000:00:14.0-2",
version=3DKERNEL_VERSION(5, 15, 0),
capabilities=3DV4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_META=
_CAPTURE|V4L2_CAP_STREAMING|V4L2_CAP_DEVICE_CAPS,
device_caps=3DV4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_STREA=
MING})
=3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|0 /*
V4L2_CID_??? */ =3D> V4L2_CTRL_CLASS_USER+0x1,
type=3DV4L2_CTRL_TYPE_CTRL_CLASS, name=3D"User Controls", ...}) =3D 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_???
*/, count=3D0}) =3D 0
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CTRL_FLAG_NEXT_CTRL|0 /*
V4L2_CID_??? */ =3D> V4L2_CTRL_CLASS_USER+0x1,
type=3DV4L2_CTRL_TYPE_CTRL_CLASS, name=3D"User Controls", ...}) =3D 0
ioctl(3, VIDIOC_G_SELECTION, 0x7ffe668a08ac) =3D -1 EINVAL (Invalid argumen=
t)
ioctl(3, VIDIOC_QUERYCAP, {driver=3D"uvcvideo", card=3D"SVS RGB USB
camera: SVS RGB USB", bus_info=3D"usb-0000:00:14.0-2",
version=3DKERNEL_VERSION(5, 15, 0),
capabilities=3DV4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_META=
_CAPTURE|V4L2_CAP_STREAMING|V4L2_CAP_DEVICE_CAPS,
device_caps=3DV4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_STREA=
MING})
=3D 0
newfstatat(3, "", {st_mode=3DS_IFCHR|0660, st_rdev=3Dmakedev(0x51, 0),
...}, AT_EMPTY_PATH) =3D 0
openat(AT_FDCWD, "/sys/dev/char/81:0/device",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) =3D 4
newfstatat(4, "", {st_mode=3DS_IFDIR|0755, st_size=3D0, ...}, AT_EMPTY_PATH=
) =3D 0
getdents64(4, 0x55ce826f3500 /* 26 entries */, 32768) =3D 936
openat(AT_FDCWD, "/dev/media0", O_RDWR) =3D 5
close(4)                                =3D 0
ioctl(5, MEDIA_IOC_DEVICE_INFO, 0x7ffe6689fea8) =3D 0
write(1, "Compliance test for uvcvideo dev"..., 50Compliance test for
uvcvideo device /dev/video0:

) =3D 50
write(1, "Driver Info:\n", 13Driver Info:
)          =3D 13
write(1, "\tDriver name      : uvcvideo\n", 29    Driver name      : uvcvid=
eo
) =3D 29
write(1, "\tCard type        : SVS RGB USB "..., 52    Card type
 : SVS RGB USB camera: SVS RGB USB
) =3D 52
write(1, "\tBus info         : usb-0000:00:"..., 39    Bus info
 : usb-0000:00:14.0-2
) =3D 39
write(1, "\tDriver version   : 5.15.0\n", 27    Driver version   : 5.15.0
) =3D 27
write(1, "\tCapabilities     : 0x84a00001\n", 31    Capabilities     :
0x84a00001
) =3D 31
write(1, "\t\tVideo Capture\n\t\tMetadata Captu"..., 91        Video Captur=
e
        Metadata Capture
        Streaming
        Extended Pix Format
        Device Capabilities
) =3D 91
write(1, "\tDevice Caps      : 0x04200001\n", 31    Device Caps      :
0x04200001
) =3D 31
write(1, "\t\tVideo Capture\n\t\tStreaming\n\t\tEx"..., 50        Video Cap=
ture
        Streaming
        Extended Pix Format
) =3D 50
ioctl(5, MEDIA_IOC_DEVICE_INFO, 0x7ffe6689faa8) =3D 0
write(1, "Media Driver Info:\n", 19Media Driver Info:
)    =3D 19
write(1, "\tDriver name      : uvcvideo\n", 29    Driver name      : uvcvid=
eo
) =3D 29
write(1, "\tModel            : SVS RGB USB "..., 52    Model
 : SVS RGB USB camera: SVS RGB USB
) =3D 52
write(1, "\tSerial           : V20210818SWS"..., 37    Serial
 : V20210818SWS2093
) =3D 37
write(1, "\tBus info         : usb-0000:00:"..., 39    Bus info
 : usb-0000:00:14.0-2
) =3D 39
write(1, "\tMedia version    : 5.15.0\n", 27    Media version    : 5.15.0
) =3D 27
write(1, "\tHardware revision: 0x00000001 ("..., 35    Hardware
revision: 0x00000001 (1)
) =3D 35
write(1, "\tDriver version   : 5.15.0\n", 27    Driver version   : 5.15.0
) =3D 27
newfstatat(3, "", {st_mode=3DS_IFCHR|0660, st_rdev=3Dmakedev(0x51, 0),
...}, AT_EMPTY_PATH) =3D 0
ioctl(5, MEDIA_IOC_G_TOPOLOGY, 0x7ffe6689f988) =3D 0
ioctl(5, MEDIA_IOC_G_TOPOLOGY, 0x7ffe6689f988) =3D 0
write(1, "Interface Info:\n", 16Interface Info:
)       =3D 16
write(1, "\tID               : 0x03000002\n", 31    ID               :
0x03000002
) =3D 31
write(1, "\tType             : V4L Video\n", 30    Type             : V4L V=
ideo
) =3D 30
write(1, "Entity Info:\n", 13Entity Info:
)          =3D 13
write(1, "\tID               : 0x00000001 ("..., 35    ID
 : 0x00000001 (1)
) =3D 35
write(1, "\tName             : Video Captur"..., 36    Name
 : Video Capture 4
) =3D 36
write(1, "\tFunction         : V4L2 I/O\n", 29    Function         : V4L2 I=
/O
) =3D 29
write(1, "\tFlags            : default\n", 28    Flags            : default
) =3D 28
write(1, "\tPad 0x01000007   : 0: Sink\n", 28    Pad 0x01000007   : 0: Sink
) =3D 28
write(1, "\t  Link 0x02000010: from remote "..., 120      Link
0x02000010: from remote pad 0x100000a of entity 'Extension 3' (Video
Pixel Formatter): Data, Enabled, Immutable
) =3D 120
ioctl(5, MEDIA_IOC_ENUM_ENTITIES, 0x7ffe668a0c80) =3D 0
ioctl(5, MEDIA_IOC_ENUM_LINKS, 0x7ffe6689fea8) =3D 0
write(1, "\n", 1
)                       =3D 1
write(1, "Required ioctls:\n", 17Required ioctls:
)      =3D 17
write(1, "\ttest MC information (see 'Media"..., 66    test MC
information (see 'Media Driver Info' above): OK
) =3D 66
ioctl(3, VIDIOC_QUERYCAP, NULL)         =3D -1 EFAULT (Bad address)
ioctl(3, VIDIOC_QUERYCAP, {driver=3D"uvcvideo", card=3D"SVS RGB USB
camera: SVS RGB USB", bus_info=3D"usb-0000:00:14.0-2",
version=3DKERNEL_VERSION(5, 15, 0),
capabilities=3DV4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_META=
_CAPTURE|V4L2_CAP_STREAMING|V4L2_CAP_DEVICE_CAPS,
device_caps=3DV4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_STREA=
MING})
=3D 0
write(1, "\ttest VIDIOC_QUERYCAP: \33[32mOK\33["..., 35    test
VIDIOC_QUERYCAP: OK
) =3D 35
ioctl(3, _IOC(_IOC_NONE, 0x56, 0xff, 0), 0) =3D -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, _IOC(_IOC_NONE, 0x56, 0, 0x3fff), 0) =3D -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, _IOC(_IOC_READ, 0x56, 0, 0x3fff), 0x7ffe6689bcc8) =3D -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, _IOC(_IOC_WRITE, 0x56, 0, 0x3fff), 0x7ffe6689bcc8) =3D -1
ENOTTY (Inappropriate ioctl for device)
ioctl(3, _IOC(_IOC_READ|_IOC_WRITE, 0x56, 0, 0x3fff), 0x7ffe6689bcc8)
=3D -1 ENOTTY (Inappropriate ioctl for device)
write(1, "\ttest invalid ioctls: \33[32mOK\33[0"..., 34    test
invalid ioctls: OK
) =3D 34
write(1, "\n", 1
)                       =3D 1
write(1, "Allow for multiple opens:\n", 26Allow for multiple opens:
) =3D 26
dup(3)                                  =3D 4
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 6
close(4)                                =3D 0
ioctl(6, VIDIOC_QUERYCAP, {driver=3D"uvcvideo", card=3D"SVS RGB USB
camera: SVS RGB USB", bus_info=3D"usb-0000:00:14.0-2",
version=3DKERNEL_VERSION(5, 15, 0),
capabilities=3DV4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_META=
_CAPTURE|V4L2_CAP_STREAMING|V4L2_CAP_DEVICE_CAPS,
device_caps=3DV4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_STREA=
MING})
=3D 0
ioctl(6, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|0 /*
V4L2_CID_??? */ =3D> V4L2_CTRL_CLASS_USER+0x1,
type=3DV4L2_CTRL_TYPE_CTRL_CLASS, name=3D"User Controls", ...}) =3D 0
ioctl(6, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_???
*/, count=3D0}) =3D 0
ioctl(6, VIDIOC_QUERYCTRL, {id=3DV4L2_CTRL_FLAG_NEXT_CTRL|0 /*
V4L2_CID_??? */ =3D> V4L2_CTRL_CLASS_USER+0x1,
type=3DV4L2_CTRL_TYPE_CTRL_CLASS, name=3D"User Controls", ...}) =3D 0
ioctl(6, VIDIOC_G_SELECTION, 0x7ffe6689fb3c) =3D -1 EINVAL (Invalid argumen=
t)
write(1, "\ttest second /dev/video0 open: \33"..., 43    test second
/dev/video0 open: OK
) =3D 43
ioctl(6, VIDIOC_QUERYCAP, NULL)         =3D -1 EFAULT (Bad address)
ioctl(6, VIDIOC_QUERYCAP, {driver=3D"uvcvideo", card=3D"SVS RGB USB
camera: SVS RGB USB", bus_info=3D"usb-0000:00:14.0-2",
version=3DKERNEL_VERSION(5, 15, 0),
capabilities=3DV4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_META=
_CAPTURE|V4L2_CAP_STREAMING|V4L2_CAP_DEVICE_CAPS,
device_caps=3DV4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_STREA=
MING})
=3D 0
write(1, "\ttest VIDIOC_QUERYCAP: \33[32mOK\33["..., 35    test
VIDIOC_QUERYCAP: OK
) =3D 35
ioctl(3, VIDIOC_G_PRIORITY, 0x7ffe6689fcc4) =3D 0
ioctl(6, VIDIOC_G_PRIORITY, 0x7ffe6689fcc4) =3D 0
ioctl(3, VIDIOC_S_PRIORITY, 0x7ffe6689fd40) =3D 0
ioctl(3, VIDIOC_G_PRIORITY, 0x7ffe6689fcc4) =3D 0
ioctl(6, VIDIOC_G_PRIORITY, 0x7ffe6689fcc4) =3D 0
ioctl(6, VIDIOC_S_PRIORITY, 0x7ffe6689fd40) =3D -1 EBUSY (Device or resourc=
e busy)
ioctl(3, VIDIOC_S_PRIORITY, 0x7ffe6689fd40) =3D 0
ioctl(3, VIDIOC_G_PRIORITY, 0x7ffe6689fcc4) =3D 0
ioctl(6, VIDIOC_G_PRIORITY, 0x7ffe6689fcc4) =3D 0
write(1, "\ttest VIDIOC_G/S_PRIORITY: \33[32m"..., 39    test
VIDIOC_G/S_PRIORITY: OK
) =3D 39
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 4
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 7
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 8
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 9
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 10
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 11
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 12
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 13
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 14
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 15
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 16
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 17
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 18
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 19
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 20
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 21
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 22
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 23
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 24
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 25
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 26
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 27
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 28
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 29
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 30
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 31
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 32
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 33
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 34
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 35
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 36
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 37
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 38
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 39
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 40
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 41
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 42
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 43
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 44
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 45
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 46
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 47
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 48
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 49
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 50
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 51
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 52
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 53
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 54
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 55
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 56
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 57
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 58
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 59
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 60
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 61
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 62
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 63
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 64
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 65
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 66
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 67
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 68
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 69
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 70
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 71
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 72
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 73
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 74
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 75
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 76
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 77
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 78
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 79
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 80
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 81
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 82
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 83
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 84
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 85
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 86
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 87
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 88
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 89
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 90
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 91
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 92
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 93
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 94
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 95
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 96
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 97
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 98
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 99
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 100
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 101
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 102
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 103
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 104
openat(AT_FDCWD, "/dev/video0", O_RDWR) =3D 105
close(105)                              =3D 0
close(104)                              =3D 0
close(103)                              =3D 0
close(102)                              =3D 0
close(101)                              =3D 0
close(100)                              =3D 0
close(99)                               =3D 0
close(98)                               =3D 0
close(97)                               =3D 0
close(96)                               =3D 0
close(95)                               =3D 0
close(94)                               =3D 0
close(93)                               =3D 0
close(92)                               =3D 0
close(91)                               =3D 0
close(90)                               =3D 0
close(89)                               =3D 0
close(88)                               =3D 0
close(87)                               =3D 0
close(86)                               =3D 0
close(85)                               =3D 0
close(84)                               =3D 0
close(83)                               =3D 0
close(82)                               =3D 0
close(81)                               =3D 0
close(80)                               =3D 0
close(79)                               =3D 0
close(78)                               =3D 0
close(77)                               =3D 0
close(76)                               =3D 0
close(75)                               =3D 0
close(74)                               =3D 0
close(73)                               =3D 0
close(72)                               =3D 0
close(71)                               =3D 0
close(70)                               =3D 0
close(69)                               =3D 0
close(68)                               =3D 0
close(67)                               =3D 0
close(66)                               =3D 0
close(65)                               =3D 0
close(64)                               =3D 0
close(63)                               =3D 0
close(62)                               =3D 0
close(61)                               =3D 0
close(60)                               =3D 0
close(59)                               =3D 0
close(58)                               =3D 0
close(57)                               =3D 0
close(56)                               =3D 0
close(55)                               =3D 0
close(54)                               =3D 0
close(53)                               =3D 0
close(52)                               =3D 0
close(51)                               =3D 0
close(50)                               =3D 0
close(49)                               =3D 0
close(48)                               =3D 0
close(47)                               =3D 0
close(46)                               =3D 0
close(45)                               =3D 0
close(44)                               =3D 0
close(43)                               =3D 0
close(42)                               =3D 0
close(41)                               =3D 0
close(40)                               =3D 0
close(39)                               =3D 0
close(38)                               =3D 0
close(37)                               =3D 0
close(36)                               =3D 0
close(35)                               =3D 0
close(34)                               =3D 0
close(33)                               =3D 0
close(32)                               =3D 0
close(31)                               =3D 0
close(30)                               =3D 0
close(29)                               =3D 0
close(28)                               =3D 0
close(27)                               =3D 0
close(26)                               =3D 0
close(25)                               =3D 0
close(24)                               =3D 0
close(23)                               =3D 0
close(22)                               =3D 0
close(21)                               =3D 0
close(20)                               =3D 0
close(19)                               =3D 0
close(18)                               =3D 0
close(17)                               =3D 0
close(16)                               =3D 0
close(15)                               =3D 0
close(14)                               =3D 0
close(13)                               =3D 0
close(12)                               =3D 0
close(11)                               =3D 0
close(10)                               =3D 0
close(9)                                =3D 0
close(8)                                =3D 0
close(7)                                =3D 0
close(4)                                =3D 0
write(1, "\ttest for unlimited opens: \33[32m"..., 39    test for
unlimited opens: OK
) =3D 39
write(1, "\n", 1
)                       =3D 1
ioctl(3, VIDIOC_G_INPUT, [0])           =3D 0
ioctl(3, VIDIOC_ENUMINPUT, {index=3D0, name=3D"Camera 1",
type=3DV4L2_INPUT_TYPE_CAMERA}) =3D 0
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_DEFAULT}}) =3D 0
ioctl(3, VIDIOC_G_SELECTION, 0x7ffe6689fdbc) =3D -1 EINVAL (Invalid argumen=
t)
ioctl(3, VIDIOC_G_SELECTION, 0x7ffe6689fdbc) =3D -1 EINVAL (Invalid argumen=
t)
ioctl(3, VIDIOC_G_PARM, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
parm.capture=3D{capability=3DV4L2_CAP_TIMEPERFRAME, capturemode=3D0,
timeperframe=3D1/15, extendedmode=3D0, readbuffers=3D0}}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|0 /*
V4L2_CID_??? */ =3D> V4L2_CTRL_CLASS_USER+0x1,
type=3DV4L2_CTRL_TYPE_CTRL_CLASS, name=3D"User Controls", ...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CTRL_CLASS=
_USER+0x1
=3D> V4L2_CID_BRIGHTNESS, type=3DV4L2_CTRL_TYPE_INTEGER,
name=3D"Brightness", ...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_BRIGHT=
NESS
=3D> V4L2_CID_CONTRAST, type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Contrast",
...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_CONTRA=
ST
=3D> V4L2_CID_SATURATION, type=3DV4L2_CTRL_TYPE_INTEGER,
name=3D"Saturation", ...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_SATURA=
TION
=3D> V4L2_CID_AUTO_WHITE_BALANCE, type=3DV4L2_CTRL_TYPE_BOOLEAN,
name=3D"White Balance, Automatic", ...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_AUTO_W=
HITE_BALANCE
=3D> V4L2_CID_GAMMA, type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Gamma", ...}) =
=3D
0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_GAMMA
=3D> V4L2_CID_GAIN, type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Gain", ...}) =3D=
 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_GAIN
=3D> V4L2_CID_POWER_LINE_FREQUENCY, type=3DV4L2_CTRL_TYPE_MENU,
name=3D"Power Line Frequency", ...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_POWER_=
LINE_FREQUENCY
=3D> V4L2_CID_WHITE_BALANCE_TEMPERATURE, type=3DV4L2_CTRL_TYPE_INTEGER,
name=3D"White Balance Temperature", ...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_WHITE_=
BALANCE_TEMPERATURE
=3D> V4L2_CID_SHARPNESS, type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Sharpness",
...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_SHARPN=
ESS
=3D> V4L2_CTRL_CLASS_CAMERA+0x1, type=3DV4L2_CTRL_TYPE_CTRL_CLASS,
name=3D"Camera Controls", ...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CTRL_CLASS=
_CAMERA+0x1
=3D> V4L2_CID_EXPOSURE_AUTO, type=3DV4L2_CTRL_TYPE_MENU, name=3D"Auto
Exposure", ...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_EXPOSU=
RE_AUTO
=3D> V4L2_CID_EXPOSURE_ABSOLUTE, type=3DV4L2_CTRL_TYPE_INTEGER,
name=3D"Exposure Time, Absolute", ...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_EXPOSU=
RE_ABSOLUTE
=3D> V4L2_CID_EXPOSURE_AUTO_PRIORITY, type=3DV4L2_CTRL_TYPE_BOOLEAN,
name=3D"Exposure, Dynamic Framerate", ...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_EXPOSU=
RE_AUTO_PRIORITY})
=3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_??? */,
count=3D12, controls=3D[{id=3DV4L2_CID_BRIGHTNESS, size=3D0, value=3D128,
value64=3D128}, {id=3DV4L2_CID_CONTRAST, size=3D0, value=3D128, value64=3D1=
28},
{id=3DV4L2_CID_SATURATION, size=3D0, value=3D128, value64=3D128},
{id=3DV4L2_CID_AUTO_WHITE_BALANCE, size=3D0, value=3D1, value64=3D1},
{id=3DV4L2_CID_GAMMA, size=3D0, value=3D128, value64=3D128},
{id=3DV4L2_CID_GAIN, size=3D0, value=3D50, value64=3D50},
{id=3DV4L2_CID_POWER_LINE_FREQUENCY, size=3D0, value=3D2, value64=3D2},
{id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE, size=3D0, value=3D4650,
value64=3D4650}, {id=3DV4L2_CID_SHARPNESS, size=3D0, value=3D128,
value64=3D128}, {id=3DV4L2_CID_EXPOSURE_AUTO, size=3D0, value=3D2, value64=
=3D2},
{id=3DV4L2_CID_EXPOSURE_ABSOLUTE, size=3D0, value=3D5, value64=3D5},
{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0, value=3D0, value64=3D0}]})=
 =3D
0
rt_sigaction(SIGINT, {sa_handler=3D0x55ce806a4bf6, sa_mask=3D[INT],
sa_flags=3DSA_RESTORER|SA_RESTART, sa_restorer=3D0x7fdab9326420},
{sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
write(1, "Debug ioctls:\n", 14Debug ioctls:
)         =3D 14
getuid()                                =3D 0
ioctl(3, VIDIOC_DBG_G_REGISTER, 0x7ffe6689fbb8) =3D -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_DBG_G/S_REGISTER: \33"..., 59    test
VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
) =3D 59
ioctl(3, VIDIOC_LOG_STATUS, 0)          =3D -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_LOG_STATUS: \33[32mOK"..., 53    test
VIDIOC_LOG_STATUS: OK (Not Supported)
) =3D 53
write(1, "\n", 1
)                       =3D 1
write(1, "Input ioctls:\n", 14Input ioctls:
)         =3D 14
ioctl(3, VIDIOC_G_STD, 0x7ffe6689fbf0)  =3D -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_G_TUNER, {index=3D0})     =3D -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_G/S_TUNER/ENUM_FREQ"..., 68    test
VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
) =3D 68
ioctl(3, VIDIOC_G_FREQUENCY, 0x7ffe6689fbe8) =3D -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_S_FREQUENCY, 0x7ffe6689fbe8) =3D -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_G/S_FREQUENCY: \33[32"..., 56    test
VIDIOC_G/S_FREQUENCY: OK (Not Supported)
) =3D 56
ioctl(3, VIDIOC_S_HW_FREQ_SEEK, 0x7ffe6689fc34) =3D -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_S_HW_FREQ_SEEK: \33[3"..., 57    test
VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
) =3D 57
ioctl(3, VIDIOC_ENUMAUDIO, 0x7ffe6689fc94) =3D -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_ENUMAUDIO: \33[32mOK\33"..., 52    test
VIDIOC_ENUMAUDIO: OK (Not Supported)
) =3D 52
ioctl(3, VIDIOC_G_INPUT, [0])           =3D 0
ioctl(3, VIDIOC_ENUMINPUT, {index=3D0, name=3D"Camera 1",
type=3DV4L2_INPUT_TYPE_CAMERA}) =3D 0
ioctl(3, VIDIOC_S_INPUT, [0])           =3D 0
ioctl(3, VIDIOC_G_SELECTION, 0x7ffe6689fc18) =3D -1 EINVAL (Invalid argumen=
t)
ioctl(3, VIDIOC_ENUMINPUT, {index=3D1})   =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_INPUT, [1])           =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_INPUT, [0])           =3D 0
write(1, "\ttest VIDIOC_G/S/ENUMINPUT: \33[32"..., 40    test
VIDIOC_G/S/ENUMINPUT: OK
) =3D 40
ioctl(3, VIDIOC_S_INPUT, [0])           =3D 0
ioctl(3, VIDIOC_ENUMINPUT, {index=3D0, name=3D"Camera 1",
type=3DV4L2_INPUT_TYPE_CAMERA}) =3D 0
ioctl(3, VIDIOC_G_AUDIO, 0x7ffe6689fc24) =3D -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_AUDIO, 0x7ffe6689fc24) =3D -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_G/S_AUDIO: \33[32mOK\33"..., 52    test
VIDIOC_G/S_AUDIO: OK (Not Supported)
) =3D 52
write(1, "\tInputs: 1 Audio Inputs: 0 Tuner"..., 37    Inputs: 1 Audio
Inputs: 0 Tuners: 0
) =3D 37
write(1, "\n", 1
)                       =3D 1
write(1, "Output ioctls:\n", 15Output ioctls:
)        =3D 15
ioctl(3, VIDIOC_G_MODULATOR, 0x7ffe6689fc64) =3D -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_G/S_MODULATOR: \33[32"..., 56    test
VIDIOC_G/S_MODULATOR: OK (Not Supported)
) =3D 56
ioctl(3, VIDIOC_G_FREQUENCY, 0x7ffe6689fc48) =3D -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_S_FREQUENCY, 0x7ffe6689fc48) =3D -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_G/S_FREQUENCY: \33[32"..., 56    test
VIDIOC_G/S_FREQUENCY: OK (Not Supported)
) =3D 56
ioctl(3, VIDIOC_ENUMAUDOUT, 0x7ffe6689fc94) =3D -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_ENUMAUDOUT: \33[32mOK"..., 53    test
VIDIOC_ENUMAUDOUT: OK (Not Supported)
) =3D 53
ioctl(3, VIDIOC_G_OUTPUT, 0x7ffe6689fc18) =3D -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_ENUMOUTPUT, 0x7ffe6689fc60) =3D -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_OUTPUT, 0x7ffe6689fc1c) =3D -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_G/S/ENUMOUTPUT: \33[3"..., 57    test
VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
) =3D 57
write(1, "\ttest VIDIOC_G/S_AUDOUT: \33[32mOK"..., 53    test
VIDIOC_G/S_AUDOUT: OK (Not Supported)
) =3D 53
write(1, "\tOutputs: 0 Audio Outputs: 0 Mod"..., 43    Outputs: 0
Audio Outputs: 0 Modulators: 0
) =3D 43
write(1, "\n", 1
)                       =3D 1
write(1, "Input/Output configuration ioctl"..., 35Input/Output
configuration ioctls:
) =3D 35
ioctl(3, VIDIOC_ENUMINPUT, {index=3D0, name=3D"Camera 1",
type=3DV4L2_INPUT_TYPE_CAMERA}) =3D 0
ioctl(3, VIDIOC_S_INPUT, [0])           =3D 0
ioctl(3, VIDIOC_G_STD, 0x7ffe6689fb78)  =3D -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_STD, [0])             =3D -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_STD, [0x3000000])     =3D -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_ENUMSTD, {index=3D0})     =3D -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_QUERYSTD, 0x7ffe6689fb78) =3D -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_ENUM/G/S/QUERY_STD:"..., 61    test
VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
) =3D 61
ioctl(3, VIDIOC_ENUMINPUT, {index=3D0, name=3D"Camera 1",
type=3DV4L2_INPUT_TYPE_CAMERA}) =3D 0
ioctl(3, VIDIOC_S_INPUT, [0])           =3D 0
ioctl(3, VIDIOC_G_DV_TIMINGS, 0x7ffe6689f72c) =3D -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_ENUM_DV_TIMINGS, 0x7ffe6689f834) =3D -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_QUERY_DV_TIMINGS, 0x7ffe6689f72c) =3D -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_ENUM/G/S/QUERY_DV_T"..., 68    test
VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
) =3D 68
ioctl(3, VIDIOC_ENUMINPUT, {index=3D0, name=3D"Camera 1",
type=3DV4L2_INPUT_TYPE_CAMERA}) =3D 0
ioctl(3, VIDIOC_S_INPUT, [0])           =3D 0
ioctl(3, VIDIOC_DV_TIMINGS_CAP, 0x7ffe6689fb48) =3D -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_DV_TIMINGS_CAP: \33[3"..., 57    test
VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
) =3D 57
ioctl(3, VIDIOC_ENUMINPUT, {index=3D0, name=3D"Camera 1",
type=3DV4L2_INPUT_TYPE_CAMERA}) =3D 0
ioctl(3, VIDIOC_S_INPUT, [0])           =3D 0
ioctl(3, VIDIOC_G_EDID, 0x7ffe66897ba0) =3D -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_EDID, 0x7ffe66897ba0) =3D -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_G/S_EDID: \33[32mOK\33["..., 51    test
VIDIOC_G/S_EDID: OK (Not Supported)
) =3D 51
write(1, "\n", 1
)                       =3D 1
ioctl(3, VIDIOC_S_INPUT, [0])           =3D 0
ioctl(3, VIDIOC_ENUMINPUT, {index=3D0, name=3D"Camera 1",
type=3DV4L2_INPUT_TYPE_CAMERA}) =3D 0
write(1, "Control ioctls (Input 0):\n", 26Control ioctls (Input 0):
) =3D 26
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|0 /*
V4L2_CID_??? */ =3D> V4L2_CTRL_CLASS_USER+0x1,
type=3DV4L2_CTRL_TYPE_CTRL_CLASS, name=3D"User Controls", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CTRL_CLASS=
_USER+0x1
=3D> V4L2_CID_BRIGHTNESS, type=3DV4L2_CTRL_TYPE_INTEGER,
name=3D"Brightness", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_BRIGHT=
NESS
=3D> V4L2_CID_CONTRAST, type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Contrast",
...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_CONTRA=
ST
=3D> V4L2_CID_SATURATION, type=3DV4L2_CTRL_TYPE_INTEGER,
name=3D"Saturation", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_SATURA=
TION
=3D> V4L2_CID_AUTO_WHITE_BALANCE, type=3DV4L2_CTRL_TYPE_BOOLEAN,
name=3D"White Balance, Automatic", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_AUTO_W=
HITE_BALANCE
=3D> V4L2_CID_GAMMA, type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Gamma", ...}) =
=3D
0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_GAMMA
=3D> V4L2_CID_GAIN, type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Gain", ...}) =3D=
 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_GAIN
=3D> V4L2_CID_POWER_LINE_FREQUENCY, type=3DV4L2_CTRL_TYPE_MENU,
name=3D"Power Line Frequency", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_POWER_=
LINE_FREQUENCY
=3D> V4L2_CID_WHITE_BALANCE_TEMPERATURE, type=3DV4L2_CTRL_TYPE_INTEGER,
name=3D"White Balance Temperature", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_WHITE_=
BALANCE_TEMPERATURE
=3D> V4L2_CID_SHARPNESS, type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Sharpness",
...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_SHARPN=
ESS
=3D> V4L2_CTRL_CLASS_CAMERA+0x1, type=3DV4L2_CTRL_TYPE_CTRL_CLASS,
name=3D"Camera Controls", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CTRL_CLASS=
_CAMERA+0x1
=3D> V4L2_CID_EXPOSURE_AUTO, type=3DV4L2_CTRL_TYPE_MENU, name=3D"Auto
Exposure", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_EXPOSU=
RE_AUTO
=3D> V4L2_CID_EXPOSURE_ABSOLUTE, type=3DV4L2_CTRL_TYPE_INTEGER,
name=3D"Exposure Time, Absolute", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_EXPOSU=
RE_ABSOLUTE
=3D> V4L2_CID_EXPOSURE_AUTO_PRIORITY, type=3DV4L2_CTRL_TYPE_BOOLEAN,
name=3D"Exposure, Dynamic Framerate", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_EXPOSU=
RE_AUTO_PRIORITY})
=3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CTRL_FLAG_NEXT_CTRL|0 /*
V4L2_CID_??? */ =3D> V4L2_CTRL_CLASS_USER+0x1,
type=3DV4L2_CTRL_TYPE_CTRL_CLASS, name=3D"User Controls", ...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_CLASS_USER+0x1 =3D>
V4L2_CID_BRIGHTNESS, type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Brightness",
...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_BRIGHTNESS =3D> V4L2_CID_CONTRAST,
type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Contrast", ...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_CONTRAST =3D> V4L2_CID_SATURATION,
type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Saturation", ...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_SATURATION =3D>
V4L2_CID_AUTO_WHITE_BALANCE, type=3DV4L2_CTRL_TYPE_BOOLEAN, name=3D"White
Balance, Automatic", ...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_AUTO_WHITE_BALANCE =3D>
V4L2_CID_GAMMA, type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Gamma", ...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_GAMMA =3D> V4L2_CID_GAIN,
type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Gain", ...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_GAIN =3D>
V4L2_CID_POWER_LINE_FREQUENCY, type=3DV4L2_CTRL_TYPE_MENU, name=3D"Power
Line Frequency", ...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_POWER_LINE_FREQUENCY =3D>
V4L2_CID_WHITE_BALANCE_TEMPERATURE, type=3DV4L2_CTRL_TYPE_INTEGER,
name=3D"White Balance Temperature", ...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_WHITE_BALANCE_TEMPERATURE =3D>
V4L2_CID_SHARPNESS, type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Sharpness",
...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_SHARPNESS =3D>
V4L2_CTRL_CLASS_CAMERA+0x1, type=3DV4L2_CTRL_TYPE_CTRL_CLASS,
name=3D"Camera Controls", ...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_CLASS_CAMERA+0x1 =3D>
V4L2_CID_EXPOSURE_AUTO, type=3DV4L2_CTRL_TYPE_MENU, name=3D"Auto
Exposure", ...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_EXPOSURE_AUTO =3D>
V4L2_CID_EXPOSURE_ABSOLUTE, type=3DV4L2_CTRL_TYPE_INTEGER,
name=3D"Exposure Time, Absolute", ...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_EXPOSURE_ABSOLUTE =3D>
V4L2_CID_EXPOSURE_AUTO_PRIORITY, type=3DV4L2_CTRL_TYPE_BOOLEAN,
name=3D"Exposure, Dynamic Framerate", ...}) =3D 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_EXPOSURE_AUTO_PRIORITY}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CTRL_FLAG_NEXT_COMPOUND|0 /*
V4L2_CID_??? */}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_BRIGHTNESS,
type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Brightness", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_CONTRAST,
type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Contrast", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_SATURATION,
type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Saturation", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_HUE}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CTRL_CLASS_USER+0x904}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_AUDIO_VOLUME}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_AUDIO_BALANCE}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_AUDIO_BASS}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_AUDIO_TREBLE}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_AUDIO_MUTE}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_AUDIO_LOUDNESS}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_BLACK_LEVEL}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_AUTO_WHITE_BALANCE,
type=3DV4L2_CTRL_TYPE_BOOLEAN, name=3D"White Balance, Automatic", ...}) =3D
0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_DO_WHITE_BALANCE}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_RED_BALANCE}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_BLUE_BALANCE}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_GAMMA,
type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Gamma", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_EXPOSURE}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_AUTOGAIN}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_GAIN,
type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Gain", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_HFLIP}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_VFLIP}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_HCENTER}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_VCENTER}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_POWER_LINE_FREQUENCY,
type=3DV4L2_CTRL_TYPE_MENU, name=3D"Power Line Frequency", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_HUE_AUTO}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE, type=3DV4L2_CTRL_TYPE_INTEGER,
name=3D"White Balance Temperature", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_SHARPNESS,
type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Sharpness", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffe6689fb1c) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_BACKLIGHT_COMPENSATION})
=3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_CHROMA_AGC}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_COLOR_KILLER}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_COLORFX}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_AUTOBRIGHTNESS}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_BAND_STOP_FILTER}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_ROTATE}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_BG_COLOR}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_CHROMA_GAIN}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_ILLUMINATORS_1}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_ILLUMINATORS_2}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_MIN_BUFFERS_FOR_CAPTURE})
=3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_MIN_BUFFERS_FOR_OUTPUT})
=3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_ALPHA_COMPONENT}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_COLORFX_CBCR}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3D0x8000000 /* V4L2_CID_??? */}) =3D
-1 EINVAL (Invalid argument)
write(1, "\ttest VIDIOC_QUERY_EXT_CTRL/QUER"..., 51    test
VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
) =3D 51
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CTRL_FLAG_NEXT_CTRL|0 /*
V4L2_CID_??? */ =3D> V4L2_CTRL_CLASS_USER+0x1,
type=3DV4L2_CTRL_TYPE_CTRL_CLASS, name=3D"User Controls", ...}) =3D 0
ioctl(3, VIDIOC_QUERYCTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_CLASS_USER+0x1 =3D>
V4L2_CID_BRIGHTNESS, type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Brightness",
...}) =3D 0
ioctl(3, VIDIOC_QUERYCTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_BRIGHTNESS =3D> V4L2_CID_CONTRAST,
type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Contrast", ...}) =3D 0
ioctl(3, VIDIOC_QUERYCTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_CONTRAST =3D> V4L2_CID_SATURATION,
type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Saturation", ...}) =3D 0
ioctl(3, VIDIOC_QUERYCTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_SATURATION =3D>
V4L2_CID_AUTO_WHITE_BALANCE, type=3DV4L2_CTRL_TYPE_BOOLEAN, name=3D"White
Balance, Automatic", ...}) =3D 0
ioctl(3, VIDIOC_QUERYCTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_AUTO_WHITE_BALANCE =3D>
V4L2_CID_GAMMA, type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Gamma", ...}) =3D 0
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_GAMMA
=3D> V4L2_CID_GAIN, type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Gain", ...}) =3D=
 0
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_GAIN
=3D> V4L2_CID_POWER_LINE_FREQUENCY, type=3DV4L2_CTRL_TYPE_MENU,
name=3D"Power Line Frequency", ...}) =3D 0
ioctl(3, VIDIOC_QUERYCTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_POWER_LINE_FREQUENCY =3D>
V4L2_CID_WHITE_BALANCE_TEMPERATURE, type=3DV4L2_CTRL_TYPE_INTEGER,
name=3D"White Balance Temperature", ...}) =3D 0
ioctl(3, VIDIOC_QUERYCTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_WHITE_BALANCE_TEMPERATURE =3D>
V4L2_CID_SHARPNESS, type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Sharpness",
...}) =3D 0
ioctl(3, VIDIOC_QUERYCTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_SHARPNESS =3D>
V4L2_CTRL_CLASS_CAMERA+0x1, type=3DV4L2_CTRL_TYPE_CTRL_CLASS,
name=3D"Camera Controls", ...}) =3D 0
ioctl(3, VIDIOC_QUERYCTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_CLASS_CAMERA+0x1 =3D>
V4L2_CID_EXPOSURE_AUTO, type=3DV4L2_CTRL_TYPE_MENU, name=3D"Auto
Exposure", ...}) =3D 0
ioctl(3, VIDIOC_QUERYCTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_EXPOSURE_AUTO =3D>
V4L2_CID_EXPOSURE_ABSOLUTE, type=3DV4L2_CTRL_TYPE_INTEGER,
name=3D"Exposure Time, Absolute", ...}) =3D 0
ioctl(3, VIDIOC_QUERYCTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_EXPOSURE_ABSOLUTE =3D>
V4L2_CID_EXPOSURE_AUTO_PRIORITY, type=3DV4L2_CTRL_TYPE_BOOLEAN,
name=3D"Exposure, Dynamic Framerate", ...}) =3D 0
ioctl(3, VIDIOC_QUERYCTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_EXPOSURE_AUTO_PRIORITY}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CTRL_FLAG_NEXT_COMPOUND|0 /*
V4L2_CID_??? */}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_BRIGHTNESS,
type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Brightness", ...}) =3D 0
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_CONTRAST,
type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Contrast", ...}) =3D 0
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_SATURATION,
type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Saturation", ...}) =3D 0
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_HUE}) =3D -1 EINVAL (Invalid argu=
ment)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CTRL_CLASS_USER+0x904}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_AUDIO_VOLUME}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_AUDIO_BALANCE}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_AUDIO_BASS}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_AUDIO_TREBLE}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_AUDIO_MUTE}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_AUDIO_LOUDNESS}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_BLACK_LEVEL}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_AUTO_WHITE_BALANCE,
type=3DV4L2_CTRL_TYPE_BOOLEAN, name=3D"White Balance, Automatic", ...}) =3D
0
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_DO_WHITE_BALANCE}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_RED_BALANCE}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_BLUE_BALANCE}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_GAMMA,
type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Gamma", ...}) =3D 0
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_EXPOSURE}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_AUTOGAIN}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_GAIN,
type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Gain", ...}) =3D 0
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_HFLIP}) =3D -1 EINVAL (Invalid ar=
gument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_VFLIP}) =3D -1 EINVAL (Invalid ar=
gument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_HCENTER}) =3D -1 EINVAL (Invalid =
argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_VCENTER}) =3D -1 EINVAL (Invalid =
argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_POWER_LINE_FREQUENCY,
type=3DV4L2_CTRL_TYPE_MENU, name=3D"Power Line Frequency", ...}) =3D 0
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_HUE_AUTO}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE,
type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"White Balance Temperature", ...}) =
=3D
0
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_SHARPNESS,
type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Sharpness", ...}) =3D 0
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_BACKLIGHT_COMPENSATION}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_CHROMA_AGC}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_COLOR_KILLER}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_COLORFX}) =3D -1 EINVAL (Invalid =
argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_AUTOBRIGHTNESS}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_BAND_STOP_FILTER}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_ROTATE}) =3D -1 EINVAL (Invalid a=
rgument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_BG_COLOR}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_CHROMA_GAIN}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_ILLUMINATORS_1}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_ILLUMINATORS_2}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_MIN_BUFFERS_FOR_CAPTURE}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_MIN_BUFFERS_FOR_OUTPUT}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_ALPHA_COMPONENT}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3DV4L2_CID_COLORFX_CBCR}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=3D0x8000000 /* V4L2_CID_??? */}) =3D -1
EINVAL (Invalid argument)
write(1, "\ttest VIDIOC_QUERYCTRL: \33[32mOK\33"..., 36    test
VIDIOC_QUERYCTRL: OK
) =3D 36
ioctl(3, VIDIOC_G_CTRL, {id=3DV4L2_CTRL_CLASS_USER+0x1}) =3D -1 EACCES
(Permission denied)
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CTRL_CLASS_USER+0x1, value=3D0}) =3D -1
EACCES (Permission denied)
ioctl(3, VIDIOC_G_CTRL, {id=3DV4L2_CID_BRIGHTNESS, value=3D128}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_BRIGHTNESS, value=3D128 =3D> 128}) =
=3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_BRIGHTNESS, value=3D0 =3D> 1}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_BRIGHTNESS, value=3D256 =3D> 255}) =
=3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_BRIGHTNESS, value=3D1 =3D> 1}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_BRIGHTNESS, value=3D255 =3D> 255}) =
=3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_BRIGHTNESS, value=3D128 =3D> 128}) =
=3D 0
ioctl(3, VIDIOC_G_CTRL, {id=3DV4L2_CID_CONTRAST, value=3D128}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_CONTRAST, value=3D128 =3D> 128}) =3D=
 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_CONTRAST, value=3D0 =3D> 1}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_CONTRAST, value=3D256 =3D> 255}) =3D=
 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_CONTRAST, value=3D1 =3D> 1}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_CONTRAST, value=3D255 =3D> 255}) =3D=
 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_CONTRAST, value=3D128 =3D> 128}) =3D=
 0
ioctl(3, VIDIOC_G_CTRL, {id=3DV4L2_CID_SATURATION, value=3D128}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_SATURATION, value=3D128 =3D> 128}) =
=3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_SATURATION, value=3D0 =3D> 1}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_SATURATION, value=3D256 =3D> 255}) =
=3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_SATURATION, value=3D1 =3D> 1}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_SATURATION, value=3D255 =3D> 255}) =
=3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_SATURATION, value=3D128 =3D> 128}) =
=3D 0
ioctl(3, VIDIOC_G_CTRL, {id=3DV4L2_CID_AUTO_WHITE_BALANCE, value=3D1}) =3D =
0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_AUTO_WHITE_BALANCE, value=3D1 =3D> 1=
}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_AUTO_WHITE_BALANCE, value=3D-1 =3D> =
0}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_AUTO_WHITE_BALANCE, value=3D2 =3D> 1=
}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_AUTO_WHITE_BALANCE, value=3D0 =3D> 0=
}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_AUTO_WHITE_BALANCE, value=3D1 =3D> 1=
}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_AUTO_WHITE_BALANCE, value=3D1 =3D> 1=
}) =3D 0
ioctl(3, VIDIOC_G_CTRL, {id=3DV4L2_CID_GAMMA, value=3D128}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_GAMMA, value=3D128 =3D> 128}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_GAMMA, value=3D0 =3D> 1}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_GAMMA, value=3D256 =3D> 255}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_GAMMA, value=3D1 =3D> 1}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_GAMMA, value=3D255 =3D> 255}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_GAMMA, value=3D128 =3D> 128}) =3D 0
ioctl(3, VIDIOC_G_CTRL, {id=3DV4L2_CID_GAIN, value=3D50}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_GAIN, value=3D50 =3D> 50}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_GAIN, value=3D0 =3D> 1}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_GAIN, value=3D101 =3D> 100}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_GAIN, value=3D1 =3D> 1}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_GAIN, value=3D100 =3D> 100}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_GAIN, value=3D50 =3D> 50}) =3D 0
ioctl(3, VIDIOC_G_CTRL, {id=3DV4L2_CID_POWER_LINE_FREQUENCY, value=3D2}) =
=3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_POWER_LINE_FREQUENCY, value=3D2 =3D>=
 2}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_POWER_LINE_FREQUENCY, value=3D-1})
=3D -1 ERANGE (Numerical result out of range)
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_POWER_LINE_FREQUENCY, value=3D3}) =
=3D
-1 ERANGE (Numerical result out of range)
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_POWER_LINE_FREQUENCY, value=3D0 =3D>=
 0}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_POWER_LINE_FREQUENCY, value=3D1 =3D>=
 1}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_POWER_LINE_FREQUENCY, value=3D2 =3D>=
 2}) =3D 0
ioctl(3, VIDIOC_G_CTRL, {id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE, value=3D4=
650}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE,
value=3D4650}) =3D -1 EACCES (Permission denied)
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE,
value=3D2799}) =3D -1 EACCES (Permission denied)
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE,
value=3D6501}) =3D -1 EACCES (Permission denied)
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE,
value=3D2800}) =3D -1 EACCES (Permission denied)
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE,
value=3D6500}) =3D -1 EACCES (Permission denied)
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE,
value=3D4650}) =3D -1 EACCES (Permission denied)
ioctl(3, VIDIOC_G_CTRL, {id=3DV4L2_CID_SHARPNESS, value=3D128}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_SHARPNESS, value=3D128 =3D> 128}) =
=3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_SHARPNESS, value=3D0 =3D> 1}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_SHARPNESS, value=3D256 =3D> 255}) =
=3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_SHARPNESS, value=3D1 =3D> 1}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_SHARPNESS, value=3D255 =3D> 255}) =
=3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_SHARPNESS, value=3D128 =3D> 128}) =
=3D 0
ioctl(3, VIDIOC_G_CTRL, {id=3DV4L2_CTRL_CLASS_CAMERA+0x1}) =3D -1 EACCES
(Permission denied)
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CTRL_CLASS_CAMERA+0x1, value=3D0}) =3D -=
1
EACCES (Permission denied)
ioctl(3, VIDIOC_G_CTRL, {id=3DV4L2_CID_EXPOSURE_AUTO, value=3D2}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_EXPOSURE_AUTO, value=3D2 =3D> 2}) =
=3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_EXPOSURE_AUTO, value=3D-1}) =3D -1
ERANGE (Numerical result out of range)
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_EXPOSURE_AUTO, value=3D4}) =3D -1
ERANGE (Numerical result out of range)
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_EXPOSURE_AUTO, value=3D0 =3D> 0}) =
=3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_EXPOSURE_AUTO, value=3D1}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_EXPOSURE_AUTO, value=3D2 =3D> 2}) =
=3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_EXPOSURE_AUTO, value=3D3}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_CTRL, {id=3DV4L2_CID_EXPOSURE_ABSOLUTE, value=3D5}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_EXPOSURE_ABSOLUTE, value=3D5}) =3D -=
1
EACCES (Permission denied)
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_EXPOSURE_ABSOLUTE, value=3D4}) =3D -=
1
EACCES (Permission denied)
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_EXPOSURE_ABSOLUTE, value=3D2501}) =
=3D
-1 EACCES (Permission denied)
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_EXPOSURE_ABSOLUTE, value=3D5}) =3D -=
1
EACCES (Permission denied)
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_EXPOSURE_ABSOLUTE, value=3D2500}) =
=3D
-1 EACCES (Permission denied)
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_EXPOSURE_ABSOLUTE, value=3D5}) =3D -=
1
EACCES (Permission denied)
ioctl(3, VIDIOC_G_CTRL, {id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, value=3D0}) =
=3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, value=3D0 =
=3D> 0}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, value=3D-1 =
=3D> 0}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, value=3D2 =
=3D> 1}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, value=3D0 =
=3D> 0}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, value=3D1 =
=3D> 1}) =3D 0
ioctl(3, VIDIOC_S_CTRL, {id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, value=3D0 =
=3D> 0}) =3D 0
ioctl(3, VIDIOC_G_CTRL, {id=3D0 /* V4L2_CID_??? */}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_S_CTRL, {id=3D0 /* V4L2_CID_??? */, value=3D0}) =3D -1
EINVAL (Invalid argument)
write(1, "\ttest VIDIOC_G/S_CTRL: \33[32mOK\33["..., 35    test
VIDIOC_G/S_CTRL: OK
) =3D 35
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_??? */,
count=3D0}) =3D 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_???
*/, count=3D0}) =3D 0
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_??? */,
count=3D1, controls=3D[{id=3D0x980001 /* V4L2_CID_??? */, size=3D0, value=
=3D0,
value64=3D0}], error_idx=3D1}) =3D -1 EACCES (Permission denied)
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_???
*/, count=3D1, controls=3D[{id=3D0x980001 /* V4L2_CID_??? */, size=3D0,
value=3D0, value64=3D0}]} =3D> {controls=3D[{id=3D0x980001 /* V4L2_CID_??? =
*/,
size=3D0, value=3D0, value64=3D0}], error_idx=3D0}) =3D -1 EACCES (Permissi=
on
denied)
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_??? */,
count=3D1, controls=3D[{id=3D0x980001 /* V4L2_CID_??? */, size=3D0, value=
=3D0,
value64=3D0}]} =3D> {controls=3D[{id=3D0x980001 /* V4L2_CID_??? */, size=3D=
0,
value=3D0, value64=3D0}], error_idx=3D1}) =3D -1 EACCES (Permission denied)
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=3DV4L2_CTRL_CLASS_USER,
count=3D1, controls=3D[{id=3DV4L2_CID_BRIGHTNESS, size=3D0, value=3D128,
value64=3D128}]}) =3D 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=3DV4L2_CTRL_CLASS_USER,
count=3D1, controls=3D[{id=3DV4L2_CID_BRIGHTNESS, size=3D0, value=3D128,
value64=3D128}]} =3D> {controls=3D[{id=3DV4L2_CID_BRIGHTNESS, size=3D0,
value=3D128, value64=3D128}]}) =3D 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=3DV4L2_CTRL_CLASS_USER,
count=3D1, controls=3D[{id=3DV4L2_CID_BRIGHTNESS, size=3D0, value=3D128,
value64=3D128}]} =3D> {controls=3D[{id=3DV4L2_CID_BRIGHTNESS, size=3D0,
value=3D128, value64=3D128}]}) =3D 0
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_??? */,
count=3D1, controls=3D[{id=3DV4L2_CID_CONTRAST, size=3D0, value=3D128,
value64=3D128}]}) =3D 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_???
*/, count=3D1, controls=3D[{id=3DV4L2_CID_CONTRAST, size=3D0, value=3D128,
value64=3D128}]} =3D> {controls=3D[{id=3DV4L2_CID_CONTRAST, size=3D0, value=
=3D128,
value64=3D128}]}) =3D 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_??? */,
count=3D1, controls=3D[{id=3DV4L2_CID_CONTRAST, size=3D0, value=3D128,
value64=3D128}]} =3D> {controls=3D[{id=3DV4L2_CID_CONTRAST, size=3D0, value=
=3D128,
value64=3D128}]}) =3D 0
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=3DV4L2_CTRL_CLASS_USER,
count=3D1, controls=3D[{id=3DV4L2_CID_SATURATION, size=3D0, value=3D128,
value64=3D128}]}) =3D 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=3DV4L2_CTRL_CLASS_USER,
count=3D1, controls=3D[{id=3DV4L2_CID_SATURATION, size=3D0, value=3D128,
value64=3D128}]} =3D> {controls=3D[{id=3DV4L2_CID_SATURATION, size=3D0,
value=3D128, value64=3D128}]}) =3D 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=3DV4L2_CTRL_CLASS_USER,
count=3D1, controls=3D[{id=3DV4L2_CID_SATURATION, size=3D0, value=3D128,
value64=3D128}]} =3D> {controls=3D[{id=3DV4L2_CID_SATURATION, size=3D0,
value=3D128, value64=3D128}]}) =3D 0
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=3DV4L2_CTRL_CLASS_USER,
count=3D1, controls=3D[{id=3DV4L2_CID_AUTO_WHITE_BALANCE, size=3D0, value=
=3D1,
value64=3D1}]}) =3D 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=3DV4L2_CTRL_CLASS_USER,
count=3D1, controls=3D[{id=3DV4L2_CID_AUTO_WHITE_BALANCE, size=3D0, value=
=3D1,
value64=3D1}]} =3D> {controls=3D[{id=3DV4L2_CID_AUTO_WHITE_BALANCE, size=3D=
0,
value=3D1, value64=3D1}]}) =3D 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=3DV4L2_CTRL_CLASS_USER,
count=3D1, controls=3D[{id=3DV4L2_CID_AUTO_WHITE_BALANCE, size=3D0, value=
=3D1,
value64=3D1}]} =3D> {controls=3D[{id=3DV4L2_CID_AUTO_WHITE_BALANCE, size=3D=
0,
value=3D1, value64=3D1}]}) =3D 0
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=3DV4L2_CTRL_CLASS_USER,
count=3D1, controls=3D[{id=3DV4L2_CID_GAMMA, size=3D0, value=3D128,
value64=3D128}]}) =3D 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=3DV4L2_CTRL_CLASS_USER,
count=3D1, controls=3D[{id=3DV4L2_CID_GAMMA, size=3D0, value=3D128,
value64=3D128}]} =3D> {controls=3D[{id=3DV4L2_CID_GAMMA, size=3D0, value=3D=
128,
value64=3D128}]}) =3D 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=3DV4L2_CTRL_CLASS_USER,
count=3D1, controls=3D[{id=3DV4L2_CID_GAMMA, size=3D0, value=3D128,
value64=3D128}]} =3D> {controls=3D[{id=3DV4L2_CID_GAMMA, size=3D0, value=3D=
128,
value64=3D128}]}) =3D 0
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_??? */,
count=3D1, controls=3D[{id=3DV4L2_CID_GAIN, size=3D0, value=3D50, value64=
=3D50}]})
=3D 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_???
*/, count=3D1, controls=3D[{id=3DV4L2_CID_GAIN, size=3D0, value=3D50,
value64=3D50}]} =3D> {controls=3D[{id=3DV4L2_CID_GAIN, size=3D0, value=3D50=
,
value64=3D50}]}) =3D 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_??? */,
count=3D1, controls=3D[{id=3DV4L2_CID_GAIN, size=3D0, value=3D50, value64=
=3D50}]}
=3D> {controls=3D[{id=3DV4L2_CID_GAIN, size=3D0, value=3D50, value64=3D50}]=
}) =3D 0
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=3DV4L2_CTRL_CLASS_USER,
count=3D1, controls=3D[{id=3DV4L2_CID_POWER_LINE_FREQUENCY, size=3D0, value=
=3D2,
value64=3D2}]}) =3D 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=3DV4L2_CTRL_CLASS_USER,
count=3D1, controls=3D[{id=3DV4L2_CID_POWER_LINE_FREQUENCY, size=3D0, value=
=3D2,
value64=3D2}]} =3D> {controls=3D[{id=3DV4L2_CID_POWER_LINE_FREQUENCY, size=
=3D0,
value=3D2, value64=3D2}]}) =3D 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=3DV4L2_CTRL_CLASS_USER,
count=3D1, controls=3D[{id=3DV4L2_CID_POWER_LINE_FREQUENCY, size=3D0, value=
=3D2,
value64=3D2}]} =3D> {controls=3D[{id=3DV4L2_CID_POWER_LINE_FREQUENCY, size=
=3D0,
value=3D2, value64=3D2}]}) =3D 0
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=3DV4L2_CTRL_CLASS_USER,
count=3D1, controls=3D[{id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE, size=3D0,
value=3D4650, value64=3D4650}]}) =3D 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=3DV4L2_CTRL_CLASS_USER,
count=3D1, controls=3D[{id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE, size=3D0,
value=3D4650, value64=3D4650}]} =3D>
{controls=3D[{id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE, size=3D0, value=3D46=
50,
value64=3D4650}]}) =3D 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=3DV4L2_CTRL_CLASS_USER,
count=3D1, controls=3D[{id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE, size=3D0,
value=3D4650, value64=3D4650}]} =3D>
{controls=3D[{id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE, size=3D0, value=3D46=
50,
value64=3D4650}], error_idx=3D1}) =3D -1 EACCES (Permission denied)
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_??? */,
count=3D1, controls=3D[{id=3DV4L2_CID_SHARPNESS, size=3D0, value=3D128,
value64=3D128}]}) =3D 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_???
*/, count=3D1, controls=3D[{id=3DV4L2_CID_SHARPNESS, size=3D0, value=3D128,
value64=3D128}]} =3D> {controls=3D[{id=3DV4L2_CID_SHARPNESS, size=3D0,
value=3D128, value64=3D128}]}) =3D 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_??? */,
count=3D1, controls=3D[{id=3DV4L2_CID_SHARPNESS, size=3D0, value=3D128,
value64=3D128}]} =3D> {controls=3D[{id=3DV4L2_CID_SHARPNESS, size=3D0,
value=3D128, value64=3D128}]}) =3D 0
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_??? */,
count=3D1, controls=3D[{id=3D0x9a0001 /* V4L2_CID_??? */, size=3D0, value=
=3D0,
value64=3D0}], error_idx=3D1}) =3D -1 EACCES (Permission denied)
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_???
*/, count=3D1, controls=3D[{id=3D0x9a0001 /* V4L2_CID_??? */, size=3D0,
value=3D0, value64=3D0}]} =3D> {controls=3D[{id=3D0x9a0001 /* V4L2_CID_??? =
*/,
size=3D0, value=3D0, value64=3D0}], error_idx=3D0}) =3D -1 EACCES (Permissi=
on
denied)
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_??? */,
count=3D1, controls=3D[{id=3D0x9a0001 /* V4L2_CID_??? */, size=3D0, value=
=3D0,
value64=3D0}]} =3D> {controls=3D[{id=3D0x9a0001 /* V4L2_CID_??? */, size=3D=
0,
value=3D0, value64=3D0}], error_idx=3D1}) =3D -1 EACCES (Permission denied)
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_??? */,
count=3D1, controls=3D[{id=3DV4L2_CID_EXPOSURE_AUTO, size=3D0, value=3D2,
value64=3D2}]}) =3D 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_???
*/, count=3D1, controls=3D[{id=3DV4L2_CID_EXPOSURE_AUTO, size=3D0, value=3D=
2,
value64=3D2}]} =3D> {controls=3D[{id=3DV4L2_CID_EXPOSURE_AUTO, size=3D0,
value=3D2, value64=3D2}]}) =3D 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_??? */,
count=3D1, controls=3D[{id=3DV4L2_CID_EXPOSURE_AUTO, size=3D0, value=3D2,
value64=3D2}]} =3D> {controls=3D[{id=3DV4L2_CID_EXPOSURE_AUTO, size=3D0,
value=3D2, value64=3D2}]}) =3D 0
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=3DV4L2_CTRL_CLASS_CAMERA,
count=3D1, controls=3D[{id=3DV4L2_CID_EXPOSURE_ABSOLUTE, size=3D0, value=3D=
5,
value64=3D5}]}) =3D 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=3DV4L2_CTRL_CLASS_CAMERA,
count=3D1, controls=3D[{id=3DV4L2_CID_EXPOSURE_ABSOLUTE, size=3D0, value=3D=
5,
value64=3D5}]} =3D> {controls=3D[{id=3DV4L2_CID_EXPOSURE_ABSOLUTE, size=3D0=
,
value=3D5, value64=3D5}]}) =3D 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=3DV4L2_CTRL_CLASS_CAMERA,
count=3D1, controls=3D[{id=3DV4L2_CID_EXPOSURE_ABSOLUTE, size=3D0, value=3D=
5,
value64=3D5}]} =3D> {controls=3D[{id=3DV4L2_CID_EXPOSURE_ABSOLUTE, size=3D0=
,
value=3D5, value64=3D5}], error_idx=3D1}) =3D -1 EACCES (Permission denied)
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_??? */,
count=3D1, controls=3D[{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0,
value=3D0, value64=3D0}]}) =3D 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_???
*/, count=3D1, controls=3D[{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0,
value=3D0, value64=3D0}]} =3D>
{controls=3D[{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0, value=3D0,
value64=3D0}]}) =3D 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_??? */,
count=3D1, controls=3D[{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0,
value=3D0, value64=3D0}]} =3D>
{controls=3D[{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0, value=3D0,
value64=3D0}]}) =3D 0
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_??? */,
count=3D1, controls=3D[{id=3D0 /* V4L2_CID_??? */, size=3D0, value=3D0,
value64=3D0}], error_idx=3D1}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_???
*/, count=3D1, controls=3D[{id=3D0 /* V4L2_CID_??? */, size=3D0, value=3D0,
value64=3D0}]} =3D> {controls=3D[{id=3D0 /* V4L2_CID_??? */, size=3D0, valu=
e=3D0,
value64=3D0}], error_idx=3D0}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_??? */,
count=3D1, controls=3D[{id=3D0 /* V4L2_CID_??? */, size=3D0, value=3D0,
value64=3D0}]} =3D> {controls=3D[{id=3D0 /* V4L2_CID_??? */, size=3D0, valu=
e=3D0,
value64=3D0}], error_idx=3D1}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_??? */,
count=3D12, controls=3D[{id=3DV4L2_CID_BRIGHTNESS, size=3D0, value=3D128,
value64=3D12884902016}, {id=3DV4L2_CID_CONTRAST, size=3D0, value=3D128,
value64=3D12884902016}, {id=3DV4L2_CID_SATURATION, size=3D0, value=3D128,
value64=3D12884902016}, {id=3DV4L2_CID_AUTO_WHITE_BALANCE, size=3D0,
value=3D1, value64=3D12884901889}, {id=3DV4L2_CID_GAMMA, size=3D0, value=3D=
128,
value64=3D12884902016}, {id=3DV4L2_CID_GAIN, size=3D0, value=3D50,
value64=3D12884901938}, {id=3DV4L2_CID_POWER_LINE_FREQUENCY, size=3D0,
value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE=
,
size=3D0, value=3D4650, value64=3D12884906538}, {id=3DV4L2_CID_SHARPNESS,
size=3D0, value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_EXPOSURE_AUTO=
,
size=3D0, value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_EXPOSURE_ABSOLU=
TE,
size=3D0, value=3D5, value64=3D12884901893},
{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0, value=3D0,
value64=3D12884901888}]}) =3D 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_???
*/, count=3D12, controls=3D[{id=3DV4L2_CID_BRIGHTNESS, size=3D0, value=3D12=
8,
value64=3D12884902016}, {id=3DV4L2_CID_CONTRAST, size=3D0, value=3D128,
value64=3D12884902016}, {id=3DV4L2_CID_SATURATION, size=3D0, value=3D128,
value64=3D12884902016}, {id=3DV4L2_CID_AUTO_WHITE_BALANCE, size=3D0,
value=3D1, value64=3D12884901889}, {id=3DV4L2_CID_GAMMA, size=3D0, value=3D=
128,
value64=3D12884902016}, {id=3DV4L2_CID_GAIN, size=3D0, value=3D50,
value64=3D12884901938}, {id=3DV4L2_CID_POWER_LINE_FREQUENCY, size=3D0,
value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE=
,
size=3D0, value=3D4650, value64=3D12884906538}, {id=3DV4L2_CID_SHARPNESS,
size=3D0, value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_EXPOSURE_AUTO=
,
size=3D0, value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_EXPOSURE_ABSOLU=
TE,
size=3D0, value=3D5, value64=3D12884901893},
{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0, value=3D0,
value64=3D12884901888}]} =3D> {controls=3D[{id=3DV4L2_CID_BRIGHTNESS, size=
=3D0,
value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_CONTRAST, size=3D0,
value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_SATURATION, size=3D0,
value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_AUTO_WHITE_BALANCE,
size=3D0, value=3D1, value64=3D12884901889}, {id=3DV4L2_CID_GAMMA, size=3D0=
,
value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_GAIN, size=3D0, value=
=3D50,
value64=3D12884901938}, {id=3DV4L2_CID_POWER_LINE_FREQUENCY, size=3D0,
value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE=
,
size=3D0, value=3D4650, value64=3D12884906538}, {id=3DV4L2_CID_SHARPNESS,
size=3D0, value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_EXPOSURE_AUTO=
,
size=3D0, value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_EXPOSURE_ABSOLU=
TE,
size=3D0, value=3D5, value64=3D12884901893},
{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0, value=3D0,
value64=3D12884901888}]}) =3D 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_??? */,
count=3D12, controls=3D[{id=3DV4L2_CID_BRIGHTNESS, size=3D0, value=3D128,
value64=3D12884902016}, {id=3DV4L2_CID_CONTRAST, size=3D0, value=3D128,
value64=3D12884902016}, {id=3DV4L2_CID_SATURATION, size=3D0, value=3D128,
value64=3D12884902016}, {id=3DV4L2_CID_AUTO_WHITE_BALANCE, size=3D0,
value=3D1, value64=3D12884901889}, {id=3DV4L2_CID_GAMMA, size=3D0, value=3D=
128,
value64=3D12884902016}, {id=3DV4L2_CID_GAIN, size=3D0, value=3D50,
value64=3D12884901938}, {id=3DV4L2_CID_POWER_LINE_FREQUENCY, size=3D0,
value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE=
,
size=3D0, value=3D4650, value64=3D12884906538}, {id=3DV4L2_CID_SHARPNESS,
size=3D0, value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_EXPOSURE_AUTO=
,
size=3D0, value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_EXPOSURE_ABSOLU=
TE,
size=3D0, value=3D5, value64=3D12884901893},
{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0, value=3D0,
value64=3D12884901888}]} =3D> {controls=3D[{id=3DV4L2_CID_BRIGHTNESS, size=
=3D0,
value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_CONTRAST, size=3D0,
value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_SATURATION, size=3D0,
value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_AUTO_WHITE_BALANCE,
size=3D0, value=3D1, value64=3D12884901889}, {id=3DV4L2_CID_GAMMA, size=3D0=
,
value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_GAIN, size=3D0, value=
=3D50,
value64=3D12884901938}, {id=3DV4L2_CID_POWER_LINE_FREQUENCY, size=3D0,
value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE=
,
size=3D0, value=3D4650, value64=3D12884906538}, {id=3DV4L2_CID_SHARPNESS,
size=3D0, value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_EXPOSURE_AUTO=
,
size=3D0, value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_EXPOSURE_ABSOLU=
TE,
size=3D0, value=3D5, value64=3D12884901893},
{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0, value=3D0,
value64=3D12884901888}], error_idx=3D12}) =3D -1 EACCES (Permission denied)
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=3DV4L2_CTRL_CLASS_USER,
count=3D12, controls=3D[{id=3DV4L2_CID_BRIGHTNESS, size=3D0, value=3D128,
value64=3D12884902016}, {id=3DV4L2_CID_CONTRAST, size=3D0, value=3D128,
value64=3D12884902016}, {id=3DV4L2_CID_SATURATION, size=3D0, value=3D128,
value64=3D12884902016}, {id=3DV4L2_CID_AUTO_WHITE_BALANCE, size=3D0,
value=3D1, value64=3D12884901889}, {id=3DV4L2_CID_GAMMA, size=3D0, value=3D=
128,
value64=3D12884902016}, {id=3DV4L2_CID_GAIN, size=3D0, value=3D50,
value64=3D12884901938}, {id=3DV4L2_CID_POWER_LINE_FREQUENCY, size=3D0,
value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE=
,
size=3D0, value=3D4650, value64=3D12884906538}, {id=3DV4L2_CID_SHARPNESS,
size=3D0, value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_EXPOSURE_AUTO=
,
size=3D0, value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_EXPOSURE_ABSOLU=
TE,
size=3D0, value=3D5, value64=3D12884901893},
{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0, value=3D0,
value64=3D12884901888}], error_idx=3D12}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=3DV4L2_CTRL_CLASS_USER,
count=3D12, controls=3D[{id=3DV4L2_CID_BRIGHTNESS, size=3D0, value=3D128,
value64=3D12884902016}, {id=3DV4L2_CID_CONTRAST, size=3D0, value=3D128,
value64=3D12884902016}, {id=3DV4L2_CID_SATURATION, size=3D0, value=3D128,
value64=3D12884902016}, {id=3DV4L2_CID_AUTO_WHITE_BALANCE, size=3D0,
value=3D1, value64=3D12884901889}, {id=3DV4L2_CID_GAMMA, size=3D0, value=3D=
128,
value64=3D12884902016}, {id=3DV4L2_CID_GAIN, size=3D0, value=3D50,
value64=3D12884901938}, {id=3DV4L2_CID_POWER_LINE_FREQUENCY, size=3D0,
value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE=
,
size=3D0, value=3D4650, value64=3D12884906538}, {id=3DV4L2_CID_SHARPNESS,
size=3D0, value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_EXPOSURE_AUTO=
,
size=3D0, value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_EXPOSURE_ABSOLU=
TE,
size=3D0, value=3D5, value64=3D12884901893},
{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0, value=3D0,
value64=3D12884901888}]} =3D> {controls=3D[{id=3DV4L2_CID_BRIGHTNESS, size=
=3D0,
value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_CONTRAST, size=3D0,
value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_SATURATION, size=3D0,
value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_AUTO_WHITE_BALANCE,
size=3D0, value=3D1, value64=3D12884901889}, {id=3DV4L2_CID_GAMMA, size=3D0=
,
value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_GAIN, size=3D0, value=
=3D50,
value64=3D12884901938}, {id=3DV4L2_CID_POWER_LINE_FREQUENCY, size=3D0,
value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE=
,
size=3D0, value=3D4650, value64=3D12884906538}, {id=3DV4L2_CID_SHARPNESS,
size=3D0, value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_EXPOSURE_AUTO=
,
size=3D0, value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_EXPOSURE_ABSOLU=
TE,
size=3D0, value=3D5, value64=3D12884901893},
{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0, value=3D0,
value64=3D12884901888}], error_idx=3D9}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=3DV4L2_CTRL_CLASS_USER,
count=3D12, controls=3D[{id=3DV4L2_CID_BRIGHTNESS, size=3D0, value=3D128,
value64=3D12884902016}, {id=3DV4L2_CID_CONTRAST, size=3D0, value=3D128,
value64=3D12884902016}, {id=3DV4L2_CID_SATURATION, size=3D0, value=3D128,
value64=3D12884902016}, {id=3DV4L2_CID_AUTO_WHITE_BALANCE, size=3D0,
value=3D1, value64=3D12884901889}, {id=3DV4L2_CID_GAMMA, size=3D0, value=3D=
128,
value64=3D12884902016}, {id=3DV4L2_CID_GAIN, size=3D0, value=3D50,
value64=3D12884901938}, {id=3DV4L2_CID_POWER_LINE_FREQUENCY, size=3D0,
value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE=
,
size=3D0, value=3D4650, value64=3D12884906538}, {id=3DV4L2_CID_SHARPNESS,
size=3D0, value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_EXPOSURE_AUTO=
,
size=3D0, value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_EXPOSURE_ABSOLU=
TE,
size=3D0, value=3D5, value64=3D12884901893},
{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0, value=3D0,
value64=3D12884901888}]} =3D> {controls=3D[{id=3DV4L2_CID_BRIGHTNESS, size=
=3D0,
value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_CONTRAST, size=3D0,
value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_SATURATION, size=3D0,
value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_AUTO_WHITE_BALANCE,
size=3D0, value=3D1, value64=3D12884901889}, {id=3DV4L2_CID_GAMMA, size=3D0=
,
value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_GAIN, size=3D0, value=
=3D50,
value64=3D12884901938}, {id=3DV4L2_CID_POWER_LINE_FREQUENCY, size=3D0,
value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE=
,
size=3D0, value=3D4650, value64=3D12884906538}, {id=3DV4L2_CID_SHARPNESS,
size=3D0, value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_EXPOSURE_AUTO=
,
size=3D0, value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_EXPOSURE_ABSOLU=
TE,
size=3D0, value=3D5, value64=3D12884901893},
{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0, value=3D0,
value64=3D12884901888}], error_idx=3D12}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=3D0xf000000 /*
V4L2_CTRL_CLASS_??? */, count=3D12, controls=3D[{id=3DV4L2_CID_BRIGHTNESS,
size=3D0, value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_CONTRAST,
size=3D0, value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_SATURATION,
size=3D0, value=3D128, value64=3D12884902016},
{id=3DV4L2_CID_AUTO_WHITE_BALANCE, size=3D0, value=3D1,
value64=3D12884901889}, {id=3DV4L2_CID_GAMMA, size=3D0, value=3D128,
value64=3D12884902016}, {id=3DV4L2_CID_GAIN, size=3D0, value=3D50,
value64=3D12884901938}, {id=3DV4L2_CID_POWER_LINE_FREQUENCY, size=3D0,
value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE=
,
size=3D0, value=3D4650, value64=3D12884906538}, {id=3DV4L2_CID_SHARPNESS,
size=3D0, value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_EXPOSURE_AUTO=
,
size=3D0, value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_EXPOSURE_ABSOLU=
TE,
size=3D0, value=3D5, value64=3D12884901893},
{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0, value=3D0,
value64=3D12884901888}]} =3D> {controls=3D[{id=3DV4L2_CID_BRIGHTNESS, size=
=3D0,
value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_CONTRAST, size=3D0,
value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_SATURATION, size=3D0,
value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_AUTO_WHITE_BALANCE,
size=3D0, value=3D1, value64=3D12884901889}, {id=3DV4L2_CID_GAMMA, size=3D0=
,
value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_GAIN, size=3D0, value=
=3D50,
value64=3D12884901938}, {id=3DV4L2_CID_POWER_LINE_FREQUENCY, size=3D0,
value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE=
,
size=3D0, value=3D4650, value64=3D12884906538}, {id=3DV4L2_CID_SHARPNESS,
size=3D0, value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_EXPOSURE_AUTO=
,
size=3D0, value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_EXPOSURE_ABSOLU=
TE,
size=3D0, value=3D5, value64=3D12884901893},
{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0, value=3D0,
value64=3D12884901888}], error_idx=3D12}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=3D0xf000000 /*
V4L2_CTRL_CLASS_??? */, count=3D12, controls=3D[{id=3DV4L2_CID_BRIGHTNESS,
size=3D0, value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_CONTRAST,
size=3D0, value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_SATURATION,
size=3D0, value=3D128, value64=3D12884902016},
{id=3DV4L2_CID_AUTO_WHITE_BALANCE, size=3D0, value=3D1,
value64=3D12884901889}, {id=3DV4L2_CID_GAMMA, size=3D0, value=3D128,
value64=3D12884902016}, {id=3DV4L2_CID_GAIN, size=3D0, value=3D50,
value64=3D12884901938}, {id=3DV4L2_CID_POWER_LINE_FREQUENCY, size=3D0,
value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE=
,
size=3D0, value=3D4650, value64=3D12884906538}, {id=3DV4L2_CID_SHARPNESS,
size=3D0, value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_EXPOSURE_AUTO=
,
size=3D0, value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_EXPOSURE_ABSOLU=
TE,
size=3D0, value=3D5, value64=3D12884901893},
{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0, value=3D0,
value64=3D12884901888}]} =3D> {controls=3D[{id=3DV4L2_CID_BRIGHTNESS, size=
=3D0,
value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_CONTRAST, size=3D0,
value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_SATURATION, size=3D0,
value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_AUTO_WHITE_BALANCE,
size=3D0, value=3D1, value64=3D12884901889}, {id=3DV4L2_CID_GAMMA, size=3D0=
,
value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_GAIN, size=3D0, value=
=3D50,
value64=3D12884901938}, {id=3DV4L2_CID_POWER_LINE_FREQUENCY, size=3D0,
value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE=
,
size=3D0, value=3D4650, value64=3D12884906538}, {id=3DV4L2_CID_SHARPNESS,
size=3D0, value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_EXPOSURE_AUTO=
,
size=3D0, value=3D2, value64=3D12884901890}, {id=3DV4L2_CID_EXPOSURE_ABSOLU=
TE,
size=3D0, value=3D5, value64=3D12884901893},
{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0, value=3D0,
value64=3D12884901888}], error_idx=3D12}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=3D0xf000000 /*
V4L2_CTRL_CLASS_??? */, count=3D12, controls=3D[{id=3DV4L2_CID_BRIGHTNESS,
size=3D0, value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_CONTRAST,
size=3D0, value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_SATURATION,
size=3D0, value=3D128, value64=3D12884902016},
{id=3DV4L2_CID_AUTO_WHITE_BALANCE, size=3D0, value=3D1,
value64=3D12884901889}, {id=3DV4L2_CID_GAMMA, size=3D0, value=3D128,
value64=3D12884902016}, {id=3DV4L2_CID_GAIN, size=3D0, value=3D50,
value64=3D12884901938}, {id=3DV4L2_CID_POWER_LINE_FREQUENCY, size=3D0,
value=3D1, value64=3D12884901889}, {id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE=
,
size=3D0, value=3D4650, value64=3D12884906538}, {id=3DV4L2_CID_SHARPNESS,
size=3D0, value=3D128, value64=3D12884902016}, {id=3DV4L2_CID_EXPOSURE_AUTO=
,
size=3D0, value=3D0, value64=3D12884901888}, {id=3DV4L2_CID_EXPOSURE_ABSOLU=
TE,
size=3D0, value=3D5, value64=3D12884901893},
{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0, value=3D0,
value64=3D12884901888}]}) =3D 0
write(1, "\ttest VIDIOC_G/S/TRY_EXT_CTRLS: "..., 44    test
VIDIOC_G/S/TRY_EXT_CTRLS: OK
) =3D 44
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 0 (T=
imeout)
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 1
(except [3], left {tv_sec=3D0, tv_nsec=3D96895})
ioctl(3, VIDIOC_DQEVENT, 0x7ffe6689fc20) =3D 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 1
(except [3], left {tv_sec=3D0, tv_nsec=3D96987})
ioctl(3, VIDIOC_DQEVENT, 0x7ffe6689fc20) =3D 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 1
(except [3], left {tv_sec=3D0, tv_nsec=3D97201})
ioctl(3, VIDIOC_DQEVENT, 0x7ffe6689fc20) =3D 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 1
(except [3], left {tv_sec=3D0, tv_nsec=3D97265})
ioctl(3, VIDIOC_DQEVENT, 0x7ffe6689fc20) =3D 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 1
(except [3], left {tv_sec=3D0, tv_nsec=3D97182})
ioctl(3, VIDIOC_DQEVENT, 0x7ffe6689fc20) =3D 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 1
(except [3], left {tv_sec=3D0, tv_nsec=3D96869})
ioctl(3, VIDIOC_DQEVENT, 0x7ffe6689fc20) =3D 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 1
(except [3], left {tv_sec=3D0, tv_nsec=3D97146})
ioctl(3, VIDIOC_DQEVENT, 0x7ffe6689fc20) =3D 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 1
(except [3], left {tv_sec=3D0, tv_nsec=3D96753})
ioctl(3, VIDIOC_DQEVENT, 0x7ffe6689fc20) =3D 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 1
(except [3], left {tv_sec=3D0, tv_nsec=3D97283})
ioctl(3, VIDIOC_DQEVENT, 0x7ffe6689fc20) =3D 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 0 (T=
imeout)
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 1
(except [3], left {tv_sec=3D0, tv_nsec=3D97365})
ioctl(3, VIDIOC_DQEVENT, 0x7ffe6689fc20) =3D 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 1
(except [3], left {tv_sec=3D0, tv_nsec=3D96880})
ioctl(3, VIDIOC_DQEVENT, 0x7ffe6689fc20) =3D 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 1
(except [3], left {tv_sec=3D0, tv_nsec=3D97037})
ioctl(3, VIDIOC_DQEVENT, 0x7ffe6689fc20) =3D 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffe6689fb40) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffe6689fb80) =3D -1 EINVAL (Invalid arg=
ument)
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffe6689fb80) =3D -1 EINVAL (Invalid arg=
ument)
write(1, "\ttest VIDIOC_(UN)SUBSCRIBE_EVENT"..., 54    test
VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
) =3D 54
ioctl(3, VIDIOC_G_JPEGCOMP, 0x7ffe6689fc3c) =3D -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_JPEGCOMP, 0x7ffe6689fc3c) =3D -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_G/S_JPEGCOMP: \33[32m"..., 55    test
VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
) =3D 55
write(1, "\tStandard Controls: 14 Private C"..., 43    Standard
Controls: 14 Private Controls: 0
) =3D 43
write(1, "\n", 1
)                       =3D 1
write(1, "Format ioctls (Input 0):\n", 25Format ioctls (Input 0):
) =3D 25
ioctl(3, VIDIOC_ENUM_FMT, {index=3D0, type=3D0 /* V4L2_BUF_TYPE_??? */}) =
=3D
-1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=3D0, type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
flags=3DV4L2_FMT_FLAG_COMPRESSED, description=3D"Motion-JPEG",
pixelformat=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */})
=3D 0
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D0,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D640, height=3D480}})=
 =3D
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D5,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D6,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D7,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D8,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D640, height=3D480}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D641, height=3D480}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D1,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D1920, height=3D1080}=
})
=3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1920, height=3D1080, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1920, height=3D1080, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1920, height=3D1080, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1920, height=3D1080, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1920, height=3D1080}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1921, height=3D1080}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D2,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D1280, height=3D1024}=
})
=3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1280, height=3D1024, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1280, height=3D1024, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1280, height=3D1024, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1280, height=3D1024, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1280, height=3D1024}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1281, height=3D1024}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D3,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D1280, height=3D800}}=
) =3D
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1280, height=3D800, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1280, height=3D800, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1280, height=3D800, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1280, height=3D800, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1280, height=3D800}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1281, height=3D800}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D4,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D1280, height=3D720}}=
) =3D
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1280, height=3D720, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1280, height=3D720, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1280, height=3D720, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1280, height=3D720, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1280, height=3D720}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1281, height=3D720}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D5,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D1024, height=3D768}}=
) =3D
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1024, height=3D768, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1024, height=3D768, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1024, height=3D768, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1024, height=3D768, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1024, height=3D768}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D1025, height=3D768}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D6,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D800, height=3D600}})=
 =3D
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D800, height=3D600, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D800, height=3D600, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D800, height=3D600, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D800, height=3D600, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D800, height=3D600}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D801, height=3D600}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D7,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D800, height=3D500}})=
 =3D
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D800, height=3D500, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D800, height=3D500, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D800, height=3D500, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D800, height=3D500, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D800, height=3D500}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D801, height=3D500}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D8,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D640, height=3D400}})=
 =3D
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D640, height=3D400, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D640, height=3D400, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D640, height=3D400, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D640, height=3D400, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D640, height=3D400}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D641, height=3D400}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D9,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D640, height=3D480}})=
 =3D
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D5,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D6,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D7,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D8,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D640, height=3D480}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=3D641, height=3D480}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D10,
pixel_format=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG
*/}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=3D1, type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
flags=3DV4L2_FMT_FLAG_COMPRESSED, description=3D"H.264",
pixelformat=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */})
=3D 0
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D0,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D640, height=3D480}})=
 =3D
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D5,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D6,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D7,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D8,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D640, height=3D480}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D641, height=3D480}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D1,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D1920, height=3D1080}=
})
=3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1920, height=3D1080, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1920, height=3D1080, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1920, height=3D1080, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1920, height=3D1080, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1920, height=3D1080}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1921, height=3D1080}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D2,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D1280, height=3D1024}=
})
=3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1280, height=3D1024, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1280, height=3D1024, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1280, height=3D1024, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1280, height=3D1024, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1280, height=3D1024}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1281, height=3D1024}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D3,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D1280, height=3D800}}=
) =3D
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1280, height=3D800, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1280, height=3D800, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1280, height=3D800, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1280, height=3D800, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1280, height=3D800}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1281, height=3D800}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D4,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D1280, height=3D720}}=
) =3D
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1280, height=3D720, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1280, height=3D720, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1280, height=3D720, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1280, height=3D720, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1280, height=3D720}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1281, height=3D720}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D5,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D1024, height=3D768}}=
) =3D
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1024, height=3D768, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1024, height=3D768, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1024, height=3D768, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1024, height=3D768, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1024, height=3D768}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D1025, height=3D768}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D6,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D800, height=3D600}})=
 =3D
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D800, height=3D600, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D800, height=3D600, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D800, height=3D600, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D800, height=3D600, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D800, height=3D600}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D801, height=3D600}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D7,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D800, height=3D500}})=
 =3D
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D800, height=3D500, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D800, height=3D500, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D800, height=3D500, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D800, height=3D500, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D800, height=3D500}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D801, height=3D500}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D8,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D640, height=3D400}})=
 =3D
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D640, height=3D400, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D640, height=3D400, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D640, height=3D400, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D640, height=3D400, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D640, height=3D400}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D641, height=3D400}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D9,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D640, height=3D480}})=
 =3D
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D5,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D6,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D7,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D8,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D640, height=3D480}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */,
width=3D641, height=3D480}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D10,
pixel_format=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */})
=3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=3D2, type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
flags=3D0, description=3D"YUYV 4:2:2", pixelformat=3Dv4l2_fourcc('Y', 'U',
'Y', 'V') /* V4L2_PIX_FMT_YUYV */}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D0,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D640, height=3D480}})=
 =3D
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D5,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D6,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D7,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D8,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D640, height=3D480}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D641, height=3D480}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D1,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D1920, height=3D1080}=
})
=3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1920, height=3D1080, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1920, height=3D1080, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1920, height=3D1080, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1920, height=3D1080, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1920, height=3D1080}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1921, height=3D1080}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D2,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D1280, height=3D1024}=
})
=3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1280, height=3D1024, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1280, height=3D1024, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1280, height=3D1024, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1280, height=3D1024, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1280, height=3D1024}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1281, height=3D1024}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D3,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D1280, height=3D800}}=
) =3D
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1280, height=3D800, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1280, height=3D800, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1280, height=3D800, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1280, height=3D800, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1280, height=3D800}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1281, height=3D800}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D4,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D1280, height=3D720}}=
) =3D
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1280, height=3D720, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1280, height=3D720, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1280, height=3D720, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1280, height=3D720, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1280, height=3D720}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1281, height=3D720}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D5,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D1024, height=3D768}}=
) =3D
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1024, height=3D768, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1024, height=3D768, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1024, height=3D768, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1024, height=3D768, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1024, height=3D768}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D1025, height=3D768}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D6,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D800, height=3D600}})=
 =3D
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D800, height=3D600, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D800, height=3D600, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D800, height=3D600, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D800, height=3D600, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D800, height=3D600}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D801, height=3D600}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D7,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D800, height=3D500}})=
 =3D
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D800, height=3D500, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D800, height=3D500, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D800, height=3D500, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D800, height=3D500, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D800, height=3D500}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D801, height=3D500}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D8,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D640, height=3D400}})=
 =3D
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D640, height=3D400, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D640, height=3D400, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D640, height=3D400, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D640, height=3D400, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D640, height=3D400}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D641, height=3D400}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D9,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
type=3DV4L2_FRMSIZE_TYPE_DISCRETE, discrete=3D{width=3D640, height=3D480}})=
 =3D
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D1,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D2,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D3,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D4,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/30}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D5,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/25}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D6,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/20}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D7,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D640, height=3D480, type=3DV4L2_FRMIVAL_TYPE_DISCRETE,
discrete=3D1/15}) =3D 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D8,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D640, height=3D480}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=3D641, height=3D480}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D10,
pixel_format=3Dv4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */})
=3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=3D3, type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE})
=3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=3D0, type=3DV4L2_BUF_TYPE_VIDEO_OUTPUT})
=3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=3D0, type=3DV4L2_BUF_TYPE_VIDEO_OVERLAY})
=3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=3D0, type=3DV4L2_BUF_TYPE_VBI_CAPTURE}) =
=3D
-1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=3D0, type=3DV4L2_BUF_TYPE_VBI_OUTPUT}) =3D
-1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=3D0,
type=3DV4L2_BUF_TYPE_SLICED_VBI_CAPTURE}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=3D0,
type=3DV4L2_BUF_TYPE_SLICED_VBI_OUTPUT}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=3D0,
type=3DV4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY}) =3D -1 EINVAL (Invalid
argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=3D0,
type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE}) =3D -1 EINVAL (Invalid
argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=3D0,
type=3DV4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE}) =3D -1 EINVAL (Invalid
argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=3D0, type=3DV4L2_BUF_TYPE_SDR_CAPTURE}) =
=3D
-1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=3D0, type=3DV4L2_BUF_TYPE_SDR_OUTPUT}) =3D
-1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=3D0, type=3DV4L2_BUF_TYPE_META_CAPTURE})
=3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=3D0, type=3DV4L2_BUF_TYPE_META_OUTPUT}) =
=3D
-1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=3D0, type=3D0x80 /* V4L2_BUF_TYPE_???
*/}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3D0, pixel_format=3Dv4l2_fourcc('
', ' ', ' ', ' ')}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=3D0,
pixel_format=3Dv4l2_fourcc(' ', ' ', ' ', ' '), width=3D640, height=3D480})
=3D -1 EINVAL (Invalid argument)
write(1, "\ttest VIDIOC_ENUM_FMT/FRAMESIZES"..., 61    test
VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
) =3D 61
ioctl(3, VIDIOC_G_PARM, {type=3D0 /* V4L2_BUF_TYPE_??? */}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_S_PARM, {type=3D0 /* V4L2_BUF_TYPE_??? */}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
parm.capture=3D{capability=3DV4L2_CAP_TIMEPERFRAME, capturemode=3D0,
timeperframe=3D1/15, extendedmode=3D0, readbuffers=3D0}}) =3D 0
ioctl(3, VIDIOC_S_PARM, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
parm.capture=3D{capability=3D0, capturemode=3D0, timeperframe=3D0/0,
extendedmode=3D0, readbuffers=3D0}} =3D>
{parm.capture=3D{capability=3DV4L2_CAP_TIMEPERFRAME, capturemode=3D0,
timeperframe=3D1/15, extendedmode=3D0, readbuffers=3D0}}) =3D 0
ioctl(3, VIDIOC_S_PARM, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
parm.capture=3D{capability=3DV4L2_CAP_TIMEPERFRAME, capturemode=3D0,
timeperframe=3D0/1, extendedmode=3D0, readbuffers=3D0}} =3D>
{parm.capture=3D{capability=3DV4L2_CAP_TIMEPERFRAME, capturemode=3D0,
timeperframe=3D1/30, extendedmode=3D0, readbuffers=3D0}}) =3D 0
ioctl(3, VIDIOC_S_PARM, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
parm.capture=3D{capability=3DV4L2_CAP_TIMEPERFRAME, capturemode=3D0,
timeperframe=3D1/0, extendedmode=3D0, readbuffers=3D0}} =3D>
{parm.capture=3D{capability=3DV4L2_CAP_TIMEPERFRAME, capturemode=3D0,
timeperframe=3D1/15, extendedmode=3D0, readbuffers=3D0}}) =3D 0
ioctl(3, VIDIOC_G_PARM, {type=3DV4L2_BUF_TYPE_VIDEO_OUTPUT}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=3DV4L2_BUF_TYPE_VIDEO_OVERLAY}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_PARM, {type=3DV4L2_BUF_TYPE_VIDEO_OVERLAY}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=3DV4L2_BUF_TYPE_VBI_CAPTURE}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_S_PARM, {type=3DV4L2_BUF_TYPE_VBI_CAPTURE}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=3DV4L2_BUF_TYPE_VBI_OUTPUT}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_S_PARM, {type=3DV4L2_BUF_TYPE_VBI_OUTPUT}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=3DV4L2_BUF_TYPE_SLICED_VBI_CAPTURE}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_PARM, {type=3DV4L2_BUF_TYPE_SLICED_VBI_CAPTURE}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=3DV4L2_BUF_TYPE_SLICED_VBI_OUTPUT}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_PARM, {type=3DV4L2_BUF_TYPE_SLICED_VBI_OUTPUT}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=3DV4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY}) =3D
-1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_PARM, {type=3DV4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY}) =3D
-1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE}) =3D
-1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=3DV4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=3DV4L2_BUF_TYPE_SDR_CAPTURE}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_S_PARM, {type=3DV4L2_BUF_TYPE_SDR_CAPTURE}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=3DV4L2_BUF_TYPE_SDR_OUTPUT}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_S_PARM, {type=3DV4L2_BUF_TYPE_SDR_OUTPUT}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=3DV4L2_BUF_TYPE_META_CAPTURE}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_S_PARM, {type=3DV4L2_BUF_TYPE_META_CAPTURE}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=3DV4L2_BUF_TYPE_META_OUTPUT}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_S_PARM, {type=3DV4L2_BUF_TYPE_META_OUTPUT}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=3D0x80 /* V4L2_BUF_TYPE_??? */}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_PARM, {type=3D0x80 /* V4L2_BUF_TYPE_??? */}) =3D -1
EINVAL (Invalid argument)
write(1, "\ttest VIDIOC_G/S_PARM: \33[32mOK\33["..., 35    test
VIDIOC_G/S_PARM: OK
) =3D 35
ioctl(3, VIDIOC_G_FBUF, 0x7ffe6689fca8) =3D -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_G_FBUF: \33[32mOK\33[0m"..., 49    test
VIDIOC_G_FBUF: OK (Not Supported)
) =3D 49
ioctl(3, VIDIOC_G_FMT, {type=3D0 /* V4L2_BUF_TYPE_??? */}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_DEFAULT}}) =3D 0
write(1, "\t\t\33[1;31mfail\33[0m: v4l2-test-for"..., 59        fail:
v4l2-test-formats.cpp(358): !colorspace
) =3D 59
exit_group(1)                           =3D ?
+++ exited with 1 +++
# dmesg
[   40.637540] usb 1-2: uvc_v4l2_open
[   40.732583] usb 1-2: Resuming interface 0
[   40.732602] usb 1-2: Resuming interface 1
[   40.736556] usb 1-2: uvc_v4l2_release
[   40.753053] usb 1-2: uvc_v4l2_open
[   40.755536] usb 1-2: uvc_v4l2_open
[   40.756525] usb 1-2: uvc_v4l2_open
[   40.756563] usb 1-2: uvc_v4l2_open
[   40.756600] usb 1-2: uvc_v4l2_open
[   40.756637] usb 1-2: uvc_v4l2_open
[   40.756673] usb 1-2: uvc_v4l2_open
[   40.756736] usb 1-2: uvc_v4l2_open
[   40.756791] usb 1-2: uvc_v4l2_open
[   40.756835] usb 1-2: uvc_v4l2_open
[   40.756877] usb 1-2: uvc_v4l2_open
[   40.756943] usb 1-2: uvc_v4l2_open
[   40.757008] usb 1-2: uvc_v4l2_open
[   40.757072] usb 1-2: uvc_v4l2_open
[   40.757135] usb 1-2: uvc_v4l2_open
[   40.757198] usb 1-2: uvc_v4l2_open
[   40.757261] usb 1-2: uvc_v4l2_open
[   40.757328] usb 1-2: uvc_v4l2_open
[   40.757391] usb 1-2: uvc_v4l2_open
[   40.757454] usb 1-2: uvc_v4l2_open
[   40.757518] usb 1-2: uvc_v4l2_open
[   40.757581] usb 1-2: uvc_v4l2_open
[   40.757645] usb 1-2: uvc_v4l2_open
[   40.757715] usb 1-2: uvc_v4l2_open
[   40.757779] usb 1-2: uvc_v4l2_open
[   40.757842] usb 1-2: uvc_v4l2_open
[   40.757906] usb 1-2: uvc_v4l2_open
[   40.757969] usb 1-2: uvc_v4l2_open
[   40.758032] usb 1-2: uvc_v4l2_open
[   40.758095] usb 1-2: uvc_v4l2_open
[   40.758157] usb 1-2: uvc_v4l2_open
[   40.758223] usb 1-2: uvc_v4l2_open
[   40.758287] usb 1-2: uvc_v4l2_open
[   40.758350] usb 1-2: uvc_v4l2_open
[   40.758414] usb 1-2: uvc_v4l2_open
[   40.758476] usb 1-2: uvc_v4l2_open
[   40.758541] usb 1-2: uvc_v4l2_open
[   40.758603] usb 1-2: uvc_v4l2_open
[   40.758675] usb 1-2: uvc_v4l2_open
[   40.758738] usb 1-2: uvc_v4l2_open
[   40.758803] usb 1-2: uvc_v4l2_open
[   40.758865] usb 1-2: uvc_v4l2_open
[   40.758929] usb 1-2: uvc_v4l2_open
[   40.758992] usb 1-2: uvc_v4l2_open
[   40.759056] usb 1-2: uvc_v4l2_open
[   40.759121] usb 1-2: uvc_v4l2_open
[   40.759184] usb 1-2: uvc_v4l2_open
[   40.759247] usb 1-2: uvc_v4l2_open
[   40.759310] usb 1-2: uvc_v4l2_open
[   40.759372] usb 1-2: uvc_v4l2_open
[   40.759435] usb 1-2: uvc_v4l2_open
[   40.759498] usb 1-2: uvc_v4l2_open
[   40.759561] usb 1-2: uvc_v4l2_open
[   40.759624] usb 1-2: uvc_v4l2_open
[   40.759693] usb 1-2: uvc_v4l2_open
[   40.759757] usb 1-2: uvc_v4l2_open
[   40.759820] usb 1-2: uvc_v4l2_open
[   40.759886] usb 1-2: uvc_v4l2_open
[   40.759949] usb 1-2: uvc_v4l2_open
[   40.760012] usb 1-2: uvc_v4l2_open
[   40.760076] usb 1-2: uvc_v4l2_open
[   40.760140] usb 1-2: uvc_v4l2_open
[   40.760202] usb 1-2: uvc_v4l2_open
[   40.760266] usb 1-2: uvc_v4l2_open
[   40.760328] usb 1-2: uvc_v4l2_open
[   40.760391] usb 1-2: uvc_v4l2_open
[   40.760453] usb 1-2: uvc_v4l2_open
[   40.760518] usb 1-2: uvc_v4l2_open
[   40.760580] usb 1-2: uvc_v4l2_open
[   40.760651] usb 1-2: uvc_v4l2_open
[   40.760715] usb 1-2: uvc_v4l2_open
[   40.760780] usb 1-2: uvc_v4l2_open
[   40.760842] usb 1-2: uvc_v4l2_open
[   40.760905] usb 1-2: uvc_v4l2_open
[   40.760967] usb 1-2: uvc_v4l2_open
[   40.761033] usb 1-2: uvc_v4l2_open
[   40.761095] usb 1-2: uvc_v4l2_open
[   40.761159] usb 1-2: uvc_v4l2_open
[   40.761222] usb 1-2: uvc_v4l2_open
[   40.761286] usb 1-2: uvc_v4l2_open
[   40.761349] usb 1-2: uvc_v4l2_open
[   40.761412] usb 1-2: uvc_v4l2_open
[   40.761474] usb 1-2: uvc_v4l2_open
[   40.761539] usb 1-2: uvc_v4l2_open
[   40.761602] usb 1-2: uvc_v4l2_open
[   40.761662] usb 1-2: uvc_v4l2_open
[   40.761726] usb 1-2: uvc_v4l2_open
[   40.761790] usb 1-2: uvc_v4l2_open
[   40.761854] usb 1-2: uvc_v4l2_open
[   40.761916] usb 1-2: uvc_v4l2_open
[   40.761980] usb 1-2: uvc_v4l2_open
[   40.762042] usb 1-2: uvc_v4l2_open
[   40.762105] usb 1-2: uvc_v4l2_open
[   40.762168] usb 1-2: uvc_v4l2_open
[   40.762232] usb 1-2: uvc_v4l2_open
[   40.762294] usb 1-2: uvc_v4l2_open
[   40.762358] usb 1-2: uvc_v4l2_open
[   40.762421] usb 1-2: uvc_v4l2_open
[   40.762487] usb 1-2: uvc_v4l2_open
[   40.762552] usb 1-2: uvc_v4l2_open
[   40.762607] usb 1-2: uvc_v4l2_open
[   40.762665] usb 1-2: uvc_v4l2_open
[   40.762729] usb 1-2: uvc_v4l2_release
[   40.762788] usb 1-2: uvc_v4l2_release
[   40.762841] usb 1-2: uvc_v4l2_release
[   40.762890] usb 1-2: uvc_v4l2_release
[   40.762938] usb 1-2: uvc_v4l2_release
[   40.762986] usb 1-2: uvc_v4l2_release
[   40.763034] usb 1-2: uvc_v4l2_release
[   40.763093] usb 1-2: uvc_v4l2_release
[   40.763144] usb 1-2: uvc_v4l2_release
[   40.763192] usb 1-2: uvc_v4l2_release
[   40.763239] usb 1-2: uvc_v4l2_release
[   40.763304] usb 1-2: uvc_v4l2_release
[   40.763355] usb 1-2: uvc_v4l2_release
[   40.763391] usb 1-2: uvc_v4l2_release
[   40.763455] usb 1-2: uvc_v4l2_release
[   40.763493] usb 1-2: uvc_v4l2_release
[   40.763557] usb 1-2: uvc_v4l2_release
[   40.763613] usb 1-2: uvc_v4l2_release
[   40.763661] usb 1-2: uvc_v4l2_release
[   40.763707] usb 1-2: uvc_v4l2_release
[   40.763766] usb 1-2: uvc_v4l2_release
[   40.763818] usb 1-2: uvc_v4l2_release
[   40.763863] usb 1-2: uvc_v4l2_release
[   40.763920] usb 1-2: uvc_v4l2_release
[   40.763973] usb 1-2: uvc_v4l2_release
[   40.764008] usb 1-2: uvc_v4l2_release
[   40.764073] usb 1-2: uvc_v4l2_release
[   40.764110] usb 1-2: uvc_v4l2_release
[   40.764174] usb 1-2: uvc_v4l2_release
[   40.764225] usb 1-2: uvc_v4l2_release
[   40.764271] usb 1-2: uvc_v4l2_release
[   40.764329] usb 1-2: uvc_v4l2_release
[   40.764380] usb 1-2: uvc_v4l2_release
[   40.764416] usb 1-2: uvc_v4l2_release
[   40.764479] usb 1-2: uvc_v4l2_release
[   40.764529] usb 1-2: uvc_v4l2_release
[   40.764581] usb 1-2: uvc_v4l2_release
[   40.764628] usb 1-2: uvc_v4l2_release
[   40.764677] usb 1-2: uvc_v4l2_release
[   40.764739] usb 1-2: uvc_v4l2_release
[   40.764789] usb 1-2: uvc_v4l2_release
[   40.764824] usb 1-2: uvc_v4l2_release
[   40.764888] usb 1-2: uvc_v4l2_release
[   40.764938] usb 1-2: uvc_v4l2_release
[   40.764996] usb 1-2: uvc_v4l2_release
[   40.765046] usb 1-2: uvc_v4l2_release
[   40.765082] usb 1-2: uvc_v4l2_release
[   40.765145] usb 1-2: uvc_v4l2_release
[   40.765344] usb 1-2: uvc_v4l2_release
[   40.765431] usb 1-2: uvc_v4l2_release
[   40.765505] usb 1-2: uvc_v4l2_release
[   40.765583] usb 1-2: uvc_v4l2_release
[   40.765658] usb 1-2: uvc_v4l2_release
[   40.765729] usb 1-2: uvc_v4l2_release
[   40.765800] usb 1-2: uvc_v4l2_release
[   40.765871] usb 1-2: uvc_v4l2_release
[   40.765940] usb 1-2: uvc_v4l2_release
[   40.766010] usb 1-2: uvc_v4l2_release
[   40.766116] usb 1-2: uvc_v4l2_release
[   40.766385] usb 1-2: uvc_v4l2_release
[   40.766465] usb 1-2: uvc_v4l2_release
[   40.766565] usb 1-2: uvc_v4l2_release
[   40.766644] usb 1-2: uvc_v4l2_release
[   40.766715] usb 1-2: uvc_v4l2_release
[   40.766807] usb 1-2: uvc_v4l2_release
[   40.766884] usb 1-2: uvc_v4l2_release
[   40.766951] usb 1-2: uvc_v4l2_release
[   40.767056] usb 1-2: uvc_v4l2_release
[   40.767139] usb 1-2: uvc_v4l2_release
[   40.767259] usb 1-2: uvc_v4l2_release
[   40.767302] usb 1-2: uvc_v4l2_release
[   40.767354] usb 1-2: uvc_v4l2_release
[   40.767421] usb 1-2: uvc_v4l2_release
[   40.767464] usb 1-2: uvc_v4l2_release
[   40.767544] usb 1-2: uvc_v4l2_release
[   40.767637] usb 1-2: uvc_v4l2_release
[   40.767711] usb 1-2: uvc_v4l2_release
[   40.767829] usb 1-2: uvc_v4l2_release
[   40.767910] usb 1-2: uvc_v4l2_release
[   40.768001] usb 1-2: uvc_v4l2_release
[   40.768072] usb 1-2: uvc_v4l2_release
[   40.768149] usb 1-2: uvc_v4l2_release
[   40.768238] usb 1-2: uvc_v4l2_release
[   40.768297] usb 1-2: uvc_v4l2_release
[   40.768358] usb 1-2: uvc_v4l2_release
[   40.768409] usb 1-2: uvc_v4l2_release
[   40.768482] usb 1-2: uvc_v4l2_release
[   40.768521] usb 1-2: uvc_v4l2_release
[   40.768554] usb 1-2: uvc_v4l2_release
[   40.768615] usb 1-2: uvc_v4l2_release
[   40.768668] usb 1-2: uvc_v4l2_release
[   40.768752] usb 1-2: uvc_v4l2_release
[   40.768827] usb 1-2: uvc_v4l2_release
[   40.768882] usb 1-2: uvc_v4l2_release
[   40.768934] usb 1-2: uvc_v4l2_release
[   40.769001] usb 1-2: uvc_v4l2_release
[   40.769054] usb 1-2: uvc_v4l2_release
[   40.769103] usb 1-2: uvc_v4l2_release
[   40.769157] usb 1-2: uvc_v4l2_release
[   40.769233] usb 1-2: uvc_v4l2_release
[   40.774783] usb 1-2: Control 0x00980001 not found
[   40.775987] usb 1-2: Control 0x009a0001 not found
[   40.777424] usb 1-2: Control 0x00000000 not found
[   40.777751] usb 1-2: Control 0x00980903 not found
[   40.777797] usb 1-2: Control 0x00980904 not found
[   40.777842] usb 1-2: Control 0x00980905 not found
[   40.777885] usb 1-2: Control 0x00980906 not found
[   40.777929] usb 1-2: Control 0x00980907 not found
[   40.777974] usb 1-2: Control 0x00980908 not found
[   40.778018] usb 1-2: Control 0x00980909 not found
[   40.778063] usb 1-2: Control 0x0098090a not found
[   40.778106] usb 1-2: Control 0x0098090b not found
[   40.778190] usb 1-2: Control 0x0098090d not found
[   40.778219] usb 1-2: Control 0x0098090e not found
[   40.778247] usb 1-2: Control 0x0098090f not found
[   40.778328] usb 1-2: Control 0x00980911 not found
[   40.778357] usb 1-2: Control 0x00980912 not found
[   40.778442] usb 1-2: Control 0x00980914 not found
[   40.778471] usb 1-2: Control 0x00980915 not found
[   40.778499] usb 1-2: Control 0x00980916 not found
[   40.778528] usb 1-2: Control 0x00980917 not found
[   40.778680] usb 1-2: Control 0x00980919 not found
[   40.778815] usb 1-2: Control 0x0098091c not found
[   40.778844] usb 1-2: Control 0x0098091d not found
[   40.778872] usb 1-2: Control 0x0098091e not found
[   40.778901] usb 1-2: Control 0x0098091f not found
[   40.778929] usb 1-2: Control 0x00980920 not found
[   40.778957] usb 1-2: Control 0x00980921 not found
[   40.778987] usb 1-2: Control 0x00980922 not found
[   40.779015] usb 1-2: Control 0x00980923 not found
[   40.779043] usb 1-2: Control 0x00980924 not found
[   40.779072] usb 1-2: Control 0x00980925 not found
[   40.779100] usb 1-2: Control 0x00980926 not found
[   40.779128] usb 1-2: Control 0x00980927 not found
[   40.779156] usb 1-2: Control 0x00980928 not found
[   40.779185] usb 1-2: Control 0x00980929 not found
[   40.779213] usb 1-2: Control 0x0098092a not found
[   40.779243] usb 1-2: Control 0x08000000 not found
[   40.779744] usb 1-2: Control 0x00000000 not found
[   40.779859] usb 1-2: Control 0x00980903 not found
[   40.779889] usb 1-2: Control 0x00980904 not found
[   40.779918] usb 1-2: Control 0x00980905 not found
[   40.779946] usb 1-2: Control 0x00980906 not found
[   40.779974] usb 1-2: Control 0x00980907 not found
[   40.780003] usb 1-2: Control 0x00980908 not found
[   40.780031] usb 1-2: Control 0x00980909 not found
[   40.780059] usb 1-2: Control 0x0098090a not found
[   40.780087] usb 1-2: Control 0x0098090b not found
[   40.780144] usb 1-2: Control 0x0098090d not found
[   40.780171] usb 1-2: Control 0x0098090e not found
[   40.780200] usb 1-2: Control 0x0098090f not found
[   40.780256] usb 1-2: Control 0x00980911 not found
[   40.780285] usb 1-2: Control 0x00980912 not found
[   40.780344] usb 1-2: Control 0x00980914 not found
[   40.780373] usb 1-2: Control 0x00980915 not found
[   40.780401] usb 1-2: Control 0x00980916 not found
[   40.780431] usb 1-2: Control 0x00980917 not found
[   40.780488] usb 1-2: Control 0x00980919 not found
[   40.780574] usb 1-2: Control 0x0098091c not found
[   40.780602] usb 1-2: Control 0x0098091d not found
[   40.780630] usb 1-2: Control 0x0098091e not found
[   40.780658] usb 1-2: Control 0x0098091f not found
[   40.780686] usb 1-2: Control 0x00980920 not found
[   40.780714] usb 1-2: Control 0x00980921 not found
[   40.780742] usb 1-2: Control 0x00980922 not found
[   40.780770] usb 1-2: Control 0x00980923 not found
[   40.780798] usb 1-2: Control 0x00980924 not found
[   40.780827] usb 1-2: Control 0x00980925 not found
[   40.780854] usb 1-2: Control 0x00980926 not found
[   40.780883] usb 1-2: Control 0x00980927 not found
[   40.780911] usb 1-2: Control 0x00980928 not found
[   40.780939] usb 1-2: Control 0x00980929 not found
[   40.780967] usb 1-2: Control 0x0098092a not found
[   40.780996] usb 1-2: Control 0x08000000 not found
[   40.787620] usb 1-2: Control 0x00000000 not found
[   40.787647] usb 1-2: Control 0x00000000 not found
[   40.789712] usb 1-2: Control 0x00000000 not found
[   40.789742] usb 1-2: Control 0x00000000 not found
[   40.789770] usb 1-2: Control 0x00000000 not found
[   40.790442] usb 1-2: uvc_v4l2_poll
[   40.790596] usb 1-2: uvc_v4l2_poll
[   40.790659] usb 1-2: uvc_v4l2_poll
[   40.790754] usb 1-2: uvc_v4l2_poll
[   40.790834] usb 1-2: uvc_v4l2_poll
[   40.790913] usb 1-2: uvc_v4l2_poll
[   40.790992] usb 1-2: uvc_v4l2_poll
[   40.791071] usb 1-2: uvc_v4l2_poll
[   40.791146] usb 1-2: uvc_v4l2_poll
[   40.791294] usb 1-2: uvc_v4l2_poll
[   40.791368] usb 1-2: uvc_v4l2_poll
[   40.791441] usb 1-2: uvc_v4l2_poll
[   40.791597] usb 1-2: uvc_v4l2_poll
[   40.791652] usb 1-2: uvc_v4l2_poll
[   40.791790] usb 1-2: uvc_v4l2_poll
[   40.791864] usb 1-2: uvc_v4l2_poll
[   40.803143] usb 1-2: Setting frame interval to 0/0 (4294967295)
[   40.803501] usb 1-2: Setting frame interval to 0/1 (0)
[   40.803869] usb 1-2: Setting frame interval to 1/0 (4294967295)
[   40.805130] usb 1-2: uvc_v4l2_release
[   40.805137] usb 1-2: uvc_v4l2_release

>
>  drivers/media/usb/uvc/uvc_driver.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/u=
vc_driver.c
> index 29befcb229b2..4bbbdfa26459 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -256,7 +256,7 @@ static struct uvc_format_desc *uvc_format_by_guid(con=
st u8 guid[16])
>  static enum v4l2_colorspace uvc_colorspace(const u8 primaries)
>  {
>         static const enum v4l2_colorspace colorprimaries[] =3D {
> -               V4L2_COLORSPACE_DEFAULT,  /* Unspecified */
> +               V4L2_COLORSPACE_SRGB,  /* Unspecified */
>                 V4L2_COLORSPACE_SRGB,
>                 V4L2_COLORSPACE_470_SYSTEM_M,
>                 V4L2_COLORSPACE_470_SYSTEM_BG,
> @@ -267,7 +267,7 @@ static enum v4l2_colorspace uvc_colorspace(const u8 p=
rimaries)
>         if (primaries < ARRAY_SIZE(colorprimaries))
>                 return colorprimaries[primaries];
>
> -       return V4L2_COLORSPACE_DEFAULT;  /* Reserved */
> +       return V4L2_COLORSPACE_SRGB;  /* Reserved */
>  }
>
>  static enum v4l2_xfer_func uvc_xfer_func(const u8 transfer_characteristi=
cs)
> --
> 2.34.0.rc1.387.gb447b232ab-goog
>
