Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B354844EEEC
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 22:54:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233014AbhKLV5S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 16:57:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230388AbhKLV5R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 16:57:17 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7278AC061766
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 13:54:26 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id b5-20020a9d60c5000000b0055c6349ff22so15818654otk.13
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 13:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=obfUQbOHYKIoOOQ6ziFtTt0/MhozcVsfaVwKWiaZIoY=;
        b=AQTh3iXfO2oki+AUxZbr8npkX1ZeSaBfzgoEDt6HBOtj0U+ThnHOeXHq4cvkT7R1Cr
         6jad1yJZnA8WWyP+E9TeoouVAiPLQcuk3l0AAq10ySh9140FA4SCaEaNE4sd9z+ueo0U
         giDnC+d3fwzbS0FA/HX7CEh7I0CX637RIjHYl5y9iOdDpTaCFWebIdo9cak62JqS3sWO
         2LB6zU1gDtHp74BqxYwOwBPXMV3jKQ61AGcafbLp/uJtct/MnXifRBrG93mvqOZieRhq
         JJ4Nfzjtfd1gyHjPqVXkaALwD9Xszr9t+eW8icTVrNX5xDs8cBz8JG4lh2rXCqlhuhC3
         eVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=obfUQbOHYKIoOOQ6ziFtTt0/MhozcVsfaVwKWiaZIoY=;
        b=inO1C34ka1jftvt8+AztsQ7jdQCi58a4VbgB6SFt5q2XsE2CFBHLpFRLS07pYXzKV+
         wyMIN2Qnyl12ftXzTISdzQX1WSZLq39T8Y3n8DafM7RCzFWf1dl5wyTJuhjXZkYsMdri
         wU9+P3lfl9/dkuoZiaiZLdR+eX8x8LRLxn8lcjofP2pII6IUA9TKThBD2YhqiR+r9nOv
         A7MSgP6z2+1DgDp0PqnzPEwClonNDGELstPRlAVBRCemAhK6N6088pmcJjCyrXyIUFdQ
         GueMGk//dr9eyTTDJYo35j7M6w5KuqYXomP9xzO08sy/vORMtrbDR4Ab0v/J/PSw8sgH
         eOjw==
X-Gm-Message-State: AOAM532Hskhkl2IDrihR7xltQa3MIEOy26GkfPMqK3EydYSc4jNvRIz0
        gTpvOJdLyqKmob5QjKon6/Cbj6YUKcK5b02Hips=
X-Google-Smtp-Source: ABdhPJyXpnQz23p4R9B6IjprCxWD4cG/llAmVB8ivZlyNINnH0ETrDkHZ3caInkfbEcVjoJyncvvoOi7WqoSfSXOUwA=
X-Received: by 2002:a9d:2282:: with SMTP id y2mr15102855ota.151.1636754064827;
 Fri, 12 Nov 2021 13:54:24 -0800 (PST)
MIME-Version: 1.0
References: <20211112195710.286151-1-ribalda@chromium.org>
In-Reply-To: <20211112195710.286151-1-ribalda@chromium.org>
From:   James Hilliard <james.hilliard1@gmail.com>
Date:   Fri, 12 Nov 2021 14:54:13 -0700
Message-ID: <CADvTj4o9zzVJaiWOp=B24zv63jhaW+c45QawGOPc4VsNR2=hZA@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Set the colorspace as sRGB if undefined
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 12, 2021 at 12:57 PM Ricardo Ribalda <ribalda@chromium.org> wro=
te:
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
> ---
> @James: Can you try this version? Thanks!

Yeah, that looks better I think:

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
"/dev/video0", "-E"], 0x7ffe21439b40 /* 13 vars */) =3D 0
brk(NULL)                               =3D 0x55c0dee1e000
access("/etc/ld.so.preload", R_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) =3D -1 ENOENT
(No such file or directory)
openat(AT_FDCWD, "/lib64/glibc-hwcaps/x86-64-v3/libv4l2.so.0",
O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/glibc-hwcaps/x86-64-v3", 0x7fff5f34ee70,
0) =3D -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/glibc-hwcaps/x86-64-v2/libv4l2.so.0",
O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/glibc-hwcaps/x86-64-v2", 0x7fff5f34ee70,
0) =3D -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/tls/haswell/x86_64/libv4l2.so.0",
O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/tls/haswell/x86_64", 0x7fff5f34ee70, 0) =3D
-1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/tls/haswell/libv4l2.so.0",
O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/tls/haswell", 0x7fff5f34ee70, 0) =3D -1
ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/tls/x86_64/libv4l2.so.0", O_RDONLY|O_CLOEXEC)
=3D -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/tls/x86_64", 0x7fff5f34ee70, 0) =3D -1
ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/tls/libv4l2.so.0", O_RDONLY|O_CLOEXEC) =3D -1
ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/tls", 0x7fff5f34ee70, 0) =3D -1 ENOENT (No
such file or directory)
openat(AT_FDCWD, "/lib64/haswell/x86_64/libv4l2.so.0",
O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/haswell/x86_64", 0x7fff5f34ee70, 0) =3D -1
ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/haswell/libv4l2.so.0", O_RDONLY|O_CLOEXEC) =3D
-1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/haswell", 0x7fff5f34ee70, 0) =3D -1 ENOENT
(No such file or directory)
openat(AT_FDCWD, "/lib64/x86_64/libv4l2.so.0", O_RDONLY|O_CLOEXEC) =3D
-1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/x86_64", 0x7fff5f34ee70, 0) =3D -1 ENOENT
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
0) =3D 0x7fbcff9a0000
mmap(NULL, 57808, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D 0x7fbcff9=
91000
mmap(0x7fbcff993000, 20480, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) =3D 0x7fbcff993000
mmap(0x7fbcff998000, 8192, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x7000) =3D 0x7fbcff998000
mmap(0x7fbcff99a000, 24576, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8000) =3D 0x7fbcff99a000
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
mmap(NULL, 476256, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D 0x7fbcff=
91c000
mprotect(0x7fbcff920000, 114688, PROT_NONE) =3D 0
mmap(0x7fbcff920000, 73728, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) =3D 0x7fbcff920000
mmap(0x7fbcff932000, 36864, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x16000) =3D 0x7fbcff932000
mmap(0x7fbcff93c000, 12288, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1f000) =3D 0x7fbcff93c000
mmap(0x7fbcff93f000, 332896, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0x7fbcff93f000
close(3)                                =3D 0
openat(AT_FDCWD, "/lib64/libjpeg.so.8", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0@E\0\0\0\0\0\0"...,
832) =3D 832
newfstatat(3, "", {st_mode=3DS_IFREG|0755, st_size=3D493408, ...},
AT_EMPTY_PATH) =3D 0
mmap(NULL, 495648, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D 0x7fbcff=
8a2000
mmap(0x7fbcff8a6000, 237568, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) =3D 0x7fbcff8a6000
mmap(0x7fbcff8e0000, 237568, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3e000) =3D 0x7fbcff8e0000
mmap(0x7fbcff91a000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x77000) =3D 0x7fbcff91a000
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
mmap(NULL, 1531392, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D 0x7fbcf=
f72c000
mmap(0x7fbcff7ce000, 524288, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xa2000) =3D 0x7fbcff7ce000
mmap(0x7fbcff84e000, 270336, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x122000) =3D 0x7fbcff84e000
mmap(0x7fbcff890000, 61440, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x163000) =3D 0x7fbcff890000
mmap(0x7fbcff89f000, 11776, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0x7fbcff89f000
close(3)                                =3D 0
openat(AT_FDCWD, "/lib64/libm.so.6", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\340\321\0\0\0\0\0\0=
"...,
832) =3D 832
newfstatat(3, "", {st_mode=3DS_IFREG|0755, st_size=3D878512, ...},
AT_EMPTY_PATH) =3D 0
mmap(NULL, 880680, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D 0x7fbcff=
654000
mprotect(0x7fbcff661000, 823296, PROT_NONE) =3D 0
mmap(0x7fbcff661000, 442368, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xd000) =3D 0x7fbcff661000
mmap(0x7fbcff6cd000, 376832, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x79000) =3D 0x7fbcff6cd000
mmap(0x7fbcff72a000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xd5000) =3D 0x7fbcff72a000
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
mmap(NULL, 78856, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D 0x7fbcff6=
40000
mmap(0x7fbcff643000, 49152, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3000) =3D 0x7fbcff643000
mmap(0x7fbcff64f000, 12288, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xf000) =3D 0x7fbcff64f000
mmap(0x7fbcff652000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x11000) =3D 0x7fbcff652000
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
0) =3D 0x7fbcff63e000
pread64(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0".=
..,
784, 64) =3D 784
mmap(NULL, 2075760, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =3D 0x7fbcf=
f443000
mprotect(0x7fbcff46b000, 1835008, PROT_NONE) =3D 0
mmap(0x7fbcff46b000, 1466368, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x28000) =3D 0x7fbcff46b000
mmap(0x7fbcff5d1000, 364544, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x18e000) =3D 0x7fbcff5d1000
mmap(0x7fbcff62b000, 24576, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1e7000) =3D 0x7fbcff62b000
mmap(0x7fbcff631000, 52336, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0x7fbcff631000
close(3)                                =3D 0
mmap(NULL, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) =3D 0x7fbcff440000
arch_prctl(ARCH_SET_FS, 0x7fbcff440740) =3D 0
set_tid_address(0x7fbcff440a10)         =3D 521
set_robust_list(0x7fbcff440a20, 24)     =3D 0
mprotect(0x7fbcff62b000, 16384, PROT_READ) =3D 0
mprotect(0x7fbcff652000, 4096, PROT_READ) =3D 0
mprotect(0x7fbcff72a000, 4096, PROT_READ) =3D 0
mprotect(0x7fbcff890000, 45056, PROT_READ) =3D 0
mprotect(0x7fbcff91a000, 4096, PROT_READ) =3D 0
mprotect(0x7fbcff93c000, 8192, PROT_READ) =3D 0
mprotect(0x7fbcff99a000, 4096, PROT_READ) =3D 0
mprotect(0x55c0ddde6000, 8192, PROT_READ) =3D 0
mprotect(0x7fbcff9d1000, 8192, PROT_READ) =3D 0
prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=3D8192*1024,
rlim_max=3DRLIM64_INFINITY}) =3D 0
getrandom("\x8d\xf6\x56\xbc\x82\x5d\xe5\x46", 8, GRND_NONBLOCK) =3D 8
brk(NULL)                               =3D 0x55c0dee1e000
brk(0x55c0dee3f000)                     =3D 0x55c0dee3f000
futex(0x7fbcff89fcbc, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
futex(0x7fbcff89fcc8, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
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
ioctl(3, VIDIOC_G_SELECTION, 0x7fff5f34e55c) =3D -1 EINVAL (Invalid argumen=
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
getdents64(4, 0x55c0dee30500 /* 26 entries */, 32768) =3D 936
openat(AT_FDCWD, "/dev/media0", O_RDWR) =3D 5
close(4)                                =3D 0
ioctl(5, MEDIA_IOC_DEVICE_INFO, 0x7fff5f34db58) =3D 0
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
ioctl(5, MEDIA_IOC_DEVICE_INFO, 0x7fff5f34d758) =3D 0
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
ioctl(5, MEDIA_IOC_G_TOPOLOGY, 0x7fff5f34d638) =3D 0
ioctl(5, MEDIA_IOC_G_TOPOLOGY, 0x7fff5f34d638) =3D 0
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
ioctl(5, MEDIA_IOC_ENUM_ENTITIES, 0x7fff5f34e930) =3D 0
ioctl(5, MEDIA_IOC_ENUM_LINKS, 0x7fff5f34db58) =3D 0
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
ioctl(3, _IOC(_IOC_READ, 0x56, 0, 0x3fff), 0x7fff5f349978) =3D -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, _IOC(_IOC_WRITE, 0x56, 0, 0x3fff), 0x7fff5f349978) =3D -1
ENOTTY (Inappropriate ioctl for device)
ioctl(3, _IOC(_IOC_READ|_IOC_WRITE, 0x56, 0, 0x3fff), 0x7fff5f349978)
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
ioctl(6, VIDIOC_G_SELECTION, 0x7fff5f34d7ec) =3D -1 EINVAL (Invalid argumen=
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
ioctl(3, VIDIOC_G_PRIORITY, 0x7fff5f34d974) =3D 0
ioctl(6, VIDIOC_G_PRIORITY, 0x7fff5f34d974) =3D 0
ioctl(3, VIDIOC_S_PRIORITY, 0x7fff5f34d9f0) =3D 0
ioctl(3, VIDIOC_G_PRIORITY, 0x7fff5f34d974) =3D 0
ioctl(6, VIDIOC_G_PRIORITY, 0x7fff5f34d974) =3D 0
ioctl(6, VIDIOC_S_PRIORITY, 0x7fff5f34d9f0) =3D -1 EBUSY (Device or resourc=
e busy)
ioctl(3, VIDIOC_S_PRIORITY, 0x7fff5f34d9f0) =3D 0
ioctl(3, VIDIOC_G_PRIORITY, 0x7fff5f34d974) =3D 0
ioctl(6, VIDIOC_G_PRIORITY, 0x7fff5f34d974) =3D 0
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
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(3, VIDIOC_G_SELECTION, 0x7fff5f34da6c) =3D -1 EINVAL (Invalid argumen=
t)
ioctl(3, VIDIOC_G_SELECTION, 0x7fff5f34da6c) =3D -1 EINVAL (Invalid argumen=
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
rt_sigaction(SIGINT, {sa_handler=3D0x55c0ddd8ebf6, sa_mask=3D[INT],
sa_flags=3DSA_RESTORER|SA_RESTART, sa_restorer=3D0x7fbcff480420},
{sa_handler=3DSIG_DFL, sa_mask=3D[], sa_flags=3D0}, 8) =3D 0
write(1, "Debug ioctls:\n", 14Debug ioctls:
)         =3D 14
getuid()                                =3D 0
ioctl(3, VIDIOC_DBG_G_REGISTER, 0x7fff5f34d868) =3D -1 ENOTTY
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
ioctl(3, VIDIOC_G_STD, 0x7fff5f34d8a0)  =3D -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_G_TUNER, {index=3D0})     =3D -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_G/S_TUNER/ENUM_FREQ"..., 68    test
VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
) =3D 68
ioctl(3, VIDIOC_G_FREQUENCY, 0x7fff5f34d898) =3D -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_S_FREQUENCY, 0x7fff5f34d898) =3D -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_G/S_FREQUENCY: \33[32"..., 56    test
VIDIOC_G/S_FREQUENCY: OK (Not Supported)
) =3D 56
ioctl(3, VIDIOC_S_HW_FREQ_SEEK, 0x7fff5f34d8e4) =3D -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_S_HW_FREQ_SEEK: \33[3"..., 57    test
VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
) =3D 57
ioctl(3, VIDIOC_ENUMAUDIO, 0x7fff5f34d944) =3D -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_ENUMAUDIO: \33[32mOK\33"..., 52    test
VIDIOC_ENUMAUDIO: OK (Not Supported)
) =3D 52
ioctl(3, VIDIOC_G_INPUT, [0])           =3D 0
ioctl(3, VIDIOC_ENUMINPUT, {index=3D0, name=3D"Camera 1",
type=3DV4L2_INPUT_TYPE_CAMERA}) =3D 0
ioctl(3, VIDIOC_S_INPUT, [0])           =3D 0
ioctl(3, VIDIOC_G_SELECTION, 0x7fff5f34d8c8) =3D -1 EINVAL (Invalid argumen=
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
ioctl(3, VIDIOC_G_AUDIO, 0x7fff5f34d8d4) =3D -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_AUDIO, 0x7fff5f34d8d4) =3D -1 ENOTTY (Inappropriate
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
ioctl(3, VIDIOC_G_MODULATOR, 0x7fff5f34d914) =3D -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_G/S_MODULATOR: \33[32"..., 56    test
VIDIOC_G/S_MODULATOR: OK (Not Supported)
) =3D 56
ioctl(3, VIDIOC_G_FREQUENCY, 0x7fff5f34d8f8) =3D -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_S_FREQUENCY, 0x7fff5f34d8f8) =3D -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_G/S_FREQUENCY: \33[32"..., 56    test
VIDIOC_G/S_FREQUENCY: OK (Not Supported)
) =3D 56
ioctl(3, VIDIOC_ENUMAUDOUT, 0x7fff5f34d944) =3D -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_ENUMAUDOUT: \33[32mOK"..., 53    test
VIDIOC_ENUMAUDOUT: OK (Not Supported)
) =3D 53
ioctl(3, VIDIOC_G_OUTPUT, 0x7fff5f34d8c8) =3D -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_ENUMOUTPUT, 0x7fff5f34d910) =3D -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_OUTPUT, 0x7fff5f34d8cc) =3D -1 ENOTTY (Inappropriate
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
ioctl(3, VIDIOC_G_STD, 0x7fff5f34d828)  =3D -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_STD, [0])             =3D -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_STD, [0x3000000])     =3D -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_ENUMSTD, {index=3D0})     =3D -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_QUERYSTD, 0x7fff5f34d828) =3D -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_ENUM/G/S/QUERY_STD:"..., 61    test
VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
) =3D 61
ioctl(3, VIDIOC_ENUMINPUT, {index=3D0, name=3D"Camera 1",
type=3DV4L2_INPUT_TYPE_CAMERA}) =3D 0
ioctl(3, VIDIOC_S_INPUT, [0])           =3D 0
ioctl(3, VIDIOC_G_DV_TIMINGS, 0x7fff5f34d3dc) =3D -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_ENUM_DV_TIMINGS, 0x7fff5f34d4e4) =3D -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_QUERY_DV_TIMINGS, 0x7fff5f34d3dc) =3D -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_ENUM/G/S/QUERY_DV_T"..., 68    test
VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
) =3D 68
ioctl(3, VIDIOC_ENUMINPUT, {index=3D0, name=3D"Camera 1",
type=3DV4L2_INPUT_TYPE_CAMERA}) =3D 0
ioctl(3, VIDIOC_S_INPUT, [0])           =3D 0
ioctl(3, VIDIOC_DV_TIMINGS_CAP, 0x7fff5f34d7f8) =3D -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_DV_TIMINGS_CAP: \33[3"..., 57    test
VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
) =3D 57
ioctl(3, VIDIOC_ENUMINPUT, {index=3D0, name=3D"Camera 1",
type=3DV4L2_INPUT_TYPE_CAMERA}) =3D 0
ioctl(3, VIDIOC_S_INPUT, [0])           =3D 0
ioctl(3, VIDIOC_G_EDID, 0x7fff5f345850) =3D -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_EDID, 0x7fff5f345850) =3D -1 ENOTTY (Inappropriate
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
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CTRL_CLASS=
_USER+0x1
=3D> V4L2_CID_BRIGHTNESS, type=3DV4L2_CTRL_TYPE_INTEGER,
name=3D"Brightness", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_BRIGHT=
NESS
=3D> V4L2_CID_CONTRAST, type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Contrast",
...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_CONTRA=
ST
=3D> V4L2_CID_SATURATION, type=3DV4L2_CTRL_TYPE_INTEGER,
name=3D"Saturation", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_SATURA=
TION
=3D> V4L2_CID_AUTO_WHITE_BALANCE, type=3DV4L2_CTRL_TYPE_BOOLEAN,
name=3D"White Balance, Automatic", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_AUTO_W=
HITE_BALANCE
=3D> V4L2_CID_GAMMA, type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Gamma", ...}) =
=3D
0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_GAMMA
=3D> V4L2_CID_GAIN, type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Gain", ...}) =3D=
 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_GAIN
=3D> V4L2_CID_POWER_LINE_FREQUENCY, type=3DV4L2_CTRL_TYPE_MENU,
name=3D"Power Line Frequency", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_POWER_=
LINE_FREQUENCY
=3D> V4L2_CID_WHITE_BALANCE_TEMPERATURE, type=3DV4L2_CTRL_TYPE_INTEGER,
name=3D"White Balance Temperature", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_WHITE_=
BALANCE_TEMPERATURE
=3D> V4L2_CID_SHARPNESS, type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Sharpness",
...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_SHARPN=
ESS
=3D> V4L2_CTRL_CLASS_CAMERA+0x1, type=3DV4L2_CTRL_TYPE_CTRL_CLASS,
name=3D"Camera Controls", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CTRL_CLASS=
_CAMERA+0x1
=3D> V4L2_CID_EXPOSURE_AUTO, type=3DV4L2_CTRL_TYPE_MENU, name=3D"Auto
Exposure", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_EXPOSU=
RE_AUTO
=3D> V4L2_CID_EXPOSURE_ABSOLUTE, type=3DV4L2_CTRL_TYPE_INTEGER,
name=3D"Exposure Time, Absolute", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_EXPOSU=
RE_ABSOLUTE
=3D> V4L2_CID_EXPOSURE_AUTO_PRIORITY, type=3DV4L2_CTRL_TYPE_BOOLEAN,
name=3D"Exposure, Dynamic Framerate", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
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
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_CONTRAST,
type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Contrast", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_SATURATION,
type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Saturation", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
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
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_DO_WHITE_BALANCE}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_RED_BALANCE}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_BLUE_BALANCE}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_GAMMA,
type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Gamma", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_EXPOSURE}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_AUTOGAIN}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_GAIN,
type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Gain", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
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
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_HUE_AUTO}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=3DV4L2_CID_WHITE_BALANCE_TEMPERATURE, type=3DV4L2_CTRL_TYPE_INTEGER,
name=3D"White Balance Temperature", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=3DV4L2_CID_SHARPNESS,
type=3DV4L2_CTRL_TYPE_INTEGER, name=3D"Sharpness", ...}) =3D 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff5f34d7cc) =3D -1 EINVAL (Invalid argument)
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
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 0 (T=
imeout)
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 1
(except [3], left {tv_sec=3D0, tv_nsec=3D97415})
ioctl(3, VIDIOC_DQEVENT, 0x7fff5f34d8d0) =3D 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 1
(except [3], left {tv_sec=3D0, tv_nsec=3D96845})
ioctl(3, VIDIOC_DQEVENT, 0x7fff5f34d8d0) =3D 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 1
(except [3], left {tv_sec=3D0, tv_nsec=3D97391})
ioctl(3, VIDIOC_DQEVENT, 0x7fff5f34d8d0) =3D 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 1
(except [3], left {tv_sec=3D0, tv_nsec=3D97531})
ioctl(3, VIDIOC_DQEVENT, 0x7fff5f34d8d0) =3D 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 1
(except [3], left {tv_sec=3D0, tv_nsec=3D97564})
ioctl(3, VIDIOC_DQEVENT, 0x7fff5f34d8d0) =3D 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 1
(except [3], left {tv_sec=3D0, tv_nsec=3D97621})
ioctl(3, VIDIOC_DQEVENT, 0x7fff5f34d8d0) =3D 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 1
(except [3], left {tv_sec=3D0, tv_nsec=3D97585})
ioctl(3, VIDIOC_DQEVENT, 0x7fff5f34d8d0) =3D 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 1
(except [3], left {tv_sec=3D0, tv_nsec=3D97795})
ioctl(3, VIDIOC_DQEVENT, 0x7fff5f34d8d0) =3D 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 1
(except [3], left {tv_sec=3D0, tv_nsec=3D97689})
ioctl(3, VIDIOC_DQEVENT, 0x7fff5f34d8d0) =3D 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 0 (T=
imeout)
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 1
(except [3], left {tv_sec=3D0, tv_nsec=3D97918})
ioctl(3, VIDIOC_DQEVENT, 0x7fff5f34d8d0) =3D 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 1
(except [3], left {tv_sec=3D0, tv_nsec=3D97810})
ioctl(3, VIDIOC_DQEVENT, 0x7fff5f34d8d0) =3D 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
pselect6(4, NULL, NULL, [3], {tv_sec=3D0, tv_nsec=3D100000}, NULL) =3D 1
(except [3], left {tv_sec=3D0, tv_nsec=3D97958})
ioctl(3, VIDIOC_DQEVENT, 0x7fff5f34d8d0) =3D 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7fff5f34d7f0) =3D 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7fff5f34d830) =3D -1 EINVAL (Invalid arg=
ument)
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7fff5f34d830) =3D -1 EINVAL (Invalid arg=
ument)
write(1, "\ttest VIDIOC_(UN)SUBSCRIBE_EVENT"..., 54    test
VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
) =3D 54
ioctl(3, VIDIOC_G_JPEGCOMP, 0x7fff5f34d8ec) =3D -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_JPEGCOMP, 0x7fff5f34d8ec) =3D -1 ENOTTY (Inappropriate
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
ioctl(3, VIDIOC_G_FBUF, 0x7fff5f34d958) =3D -1 ENOTTY (Inappropriate
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
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_OUTPUT}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_OVERLAY}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VBI_CAPTURE}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VBI_OUTPUT}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_SLICED_VBI_CAPTURE}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_SLICED_VBI_OUTPUT}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_SDR_CAPTURE}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_SDR_OUTPUT}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_META_CAPTURE}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_META_OUTPUT}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=3D0x80 /* V4L2_BUF_TYPE_??? */}) =3D -1
EINVAL (Invalid argument)
write(1, "\ttest VIDIOC_G_FMT: \33[32mOK\33[0m\n", 32    test VIDIOC_G_FMT:=
 OK
) =3D 32
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(3, VIDIOC_TRY_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}} =3D>
{fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J',
'P', 'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE,
bytesperline=3D0, sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =
=3D
0
ioctl(3, VIDIOC_TRY_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D4294967295, height=3D4294967295,
pixelformat=3Dv4l2_fourcc('\xff', '\xff', '\xff', '\xff'),
field=3DV4L2_FIELD_ANY, bytesperline=3D4294967295, sizeimage=3D4294967295,
colorspace=3D0xffffffff /* V4L2_COLORSPACE_??? */}} =3D>
{fmt.pix=3D{width=3D1920, height=3D1080, pixelformat=3Dv4l2_fourcc('M', 'J'=
,
'P', 'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE,
bytesperline=3D0, sizeimage=3D4147200, colorspace=3DV4L2_COLORSPACE_SRGB}})
=3D 0
ioctl(3, VIDIOC_TRY_FMT, {type=3D0x80 /* V4L2_BUF_TYPE_??? */}) =3D -1
EINVAL (Invalid argument)
write(1, "\ttest VIDIOC_TRY_FMT: \33[32mOK\33[0"..., 34    test
VIDIOC_TRY_FMT: OK
) =3D 34
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(3, VIDIOC_S_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D4294967295, height=3D4294967295,
pixelformat=3Dv4l2_fourcc('\xff', '\xff', '\xff', '\xff'),
field=3DV4L2_FIELD_ANY, bytesperline=3D4294967295, sizeimage=3D4294967295,
colorspace=3D0xffffffff /* V4L2_COLORSPACE_??? */}} =3D>
{fmt.pix=3D{width=3D1920, height=3D1080, pixelformat=3Dv4l2_fourcc('M', 'J'=
,
'P', 'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE,
bytesperline=3D0, sizeimage=3D4147200, colorspace=3DV4L2_COLORSPACE_SRGB}})
=3D 0
ioctl(3, VIDIOC_S_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}} =3D>
{fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J',
'P', 'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE,
bytesperline=3D0, sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =
=3D
0
ioctl(3, VIDIOC_S_FMT, {type=3D0x80 /* V4L2_BUF_TYPE_??? */}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=3D1, type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
flags=3DV4L2_FMT_FLAG_COMPRESSED, description=3D"H.264",
pixelformat=3Dv4l2_fourcc('H', '2', '6', '4') /* V4L2_PIX_FMT_H264 */})
=3D 0
ioctl(3, VIDIOC_ENUM_FMT, {index=3D0, type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
flags=3DV4L2_FMT_FLAG_COMPRESSED, description=3D"Motion-JPEG",
pixelformat=3Dv4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */})
=3D 0
ioctl(3, VIDIOC_S_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D0, height=3D0, pixelformat=3Dv4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_ANY, bytesperline=3D0,
sizeimage=3D0, colorspace=3DV4L2_COLORSPACE_DEFAULT}} =3D>
{fmt.pix=3D{width=3D640, height=3D400, pixelformat=3Dv4l2_fourcc('M', 'J',
'P', 'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE,
bytesperline=3D0, sizeimage=3D512000, colorspace=3DV4L2_COLORSPACE_SRGB}}) =
=3D
0
ioctl(6, VIDIOC_S_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D0, height=3D0, pixelformat=3Dv4l2_fourcc('H', '2', '6',
'4') /* V4L2_PIX_FMT_H264 */, field=3DV4L2_FIELD_ANY, bytesperline=3D0,
sizeimage=3D0, colorspace=3DV4L2_COLORSPACE_DEFAULT}}) =3D -1 EBUSY (Device
or resource busy)
write(1, "\t\t\33[1mwarn\33[0m: v4l2-test-format"..., 64        warn:
v4l2-test-formats.cpp(1036): Could not set fmt2
) =3D 64
ioctl(3, VIDIOC_S_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}} =3D>
{fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J',
'P', 'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE,
bytesperline=3D0, sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =
=3D
0
write(1, "\ttest VIDIOC_S_FMT: \33[32mOK\33[0m\n", 32    test VIDIOC_S_FMT:=
 OK
) =3D 32
ioctl(3, VIDIOC_G_SLICED_VBI_CAP, 0x7fff5f34d8e4) =3D -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_G_SLICED_VBI_CAP: \33"..., 59    test
VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
) =3D 59
ioctl(3, VIDIOC_CROPCAP, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
bounds=3D{left=3D0, top=3D0, width=3D640, height=3D480}, defrect=3D{left=3D=
0, top=3D0,
width=3D640, height=3D480}, pixelaspect=3D1/1}) =3D 0
ioctl(3, VIDIOC_G_SELECTION, 0x7fff5f34d918) =3D 0
ioctl(3, VIDIOC_CROPCAP, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
bounds=3D{left=3D0, top=3D0, width=3D640, height=3D480}, defrect=3D{left=3D=
0, top=3D0,
width=3D640, height=3D480}, pixelaspect=3D1/1}) =3D 0
ioctl(3, VIDIOC_CROPCAP, {type=3D0xff /* V4L2_BUF_TYPE_??? */}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_CROP, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE}) =3D -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_SELECTION, 0x7fff5f34d918) =3D -1 EINVAL (Invalid argumen=
t)
ioctl(3, VIDIOC_G_SELECTION, 0x7fff5f34d728) =3D -1 EINVAL (Invalid argumen=
t)
ioctl(3, VIDIOC_S_SELECTION, 0x7fff5f34d728) =3D -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest Cropping: \33[32mOK\33[0m (Not"..., 44    test
Cropping: OK (Not Supported)
) =3D 44
ioctl(3, VIDIOC_G_SELECTION, 0x7fff5f34d7c8) =3D -1 EINVAL (Invalid argumen=
t)
ioctl(3, VIDIOC_S_SELECTION, 0x7fff5f34d7c8) =3D -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest Composing: \33[32mOK\33[0m (No"..., 45    test
Composing: OK (Not Supported)
) =3D 45
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(3, VIDIOC_S_SELECTION, 0x7fff5f34d428) =3D -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_S_SELECTION, 0x7fff5f34d468) =3D -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_S_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D1, height=3D1, pixelformat=3Dv4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_ANY, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}} =3D>
{fmt.pix=3D{width=3D640, height=3D400, pixelformat=3Dv4l2_fourcc('M', 'J',
'P', 'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE,
bytesperline=3D0, sizeimage=3D512000, colorspace=3DV4L2_COLORSPACE_SRGB}}) =
=3D
0
ioctl(3, VIDIOC_G_SELECTION, 0x7fff5f34d428) =3D -1 EINVAL (Invalid argumen=
t)
ioctl(3, VIDIOC_G_SELECTION, 0x7fff5f34d468) =3D -1 EINVAL (Invalid argumen=
t)
ioctl(3, VIDIOC_S_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D16384, height=3D16384, pixelformat=3Dv4l2_fourcc('M', 'J=
',
'P', 'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_ANY,
bytesperline=3D0, sizeimage=3D512000, colorspace=3DV4L2_COLORSPACE_SRGB}} =
=3D>
{fmt.pix=3D{width=3D1920, height=3D1080, pixelformat=3Dv4l2_fourcc('M', 'J'=
,
'P', 'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE,
bytesperline=3D0, sizeimage=3D4147200, colorspace=3DV4L2_COLORSPACE_SRGB}})
=3D 0
ioctl(3, VIDIOC_S_SELECTION, 0x7fff5f34d428) =3D -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_S_SELECTION, 0x7fff5f34d468) =3D -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_G_SELECTION, 0x7fff5f34d428) =3D -1 EINVAL (Invalid argumen=
t)
ioctl(3, VIDIOC_G_SELECTION, 0x7fff5f34d468) =3D -1 EINVAL (Invalid argumen=
t)
ioctl(3, VIDIOC_S_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}} =3D>
{fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J',
'P', 'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE,
bytesperline=3D0, sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =
=3D
0
write(1, "\ttest Scaling: \33[32mOK\33[0m (Not "..., 43    test
Scaling: OK (Not Supported)
) =3D 43
write(1, "\n", 1
)                       =3D 1
write(1, "Codec ioctls (Input 0):\n", 24Codec ioctls (Input 0):
) =3D 24
ioctl(3, VIDIOC_ENCODER_CMD, 0x7fff5f34d940) =3D -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_TRY_ENCODER_CMD, 0x7fff5f34d940) =3D -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_(TRY_)ENCODER_CMD: "..., 60    test
VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
) =3D 60
ioctl(3, VIDIOC_G_ENC_INDEX, 0x7fff5f34d170) =3D -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_G_ENC_INDEX: \33[32mO"..., 54    test
VIDIOC_G_ENC_INDEX: OK (Not Supported)
) =3D 54
ioctl(3, VIDIOC_DECODER_CMD, 0x7fff5f34d920) =3D -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_TRY_DECODER_CMD, 0x7fff5f34d920) =3D -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_(TRY_)DECODER_CMD: "..., 60    test
VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
) =3D 60
write(1, "\n", 1
)                       =3D 1
write(1, "Buffer ioctls (Input 0):\n", 25Buffer ioctls (Input 0):
) =3D 25
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
ioctl(3, VIDIOC_G_SELECTION, 0x7fff5f34a52c) =3D -1 EINVAL (Invalid argumen=
t)
ioctl(3, VIDIOC_REQBUFS, {type=3D0 /* V4L2_BUF_TYPE_??? */, memory=3D0 /*
V4L2_MEMORY_??? */, count=3D0}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_REQBUFS, {type=3D0 /* V4L2_BUF_TYPE_??? */, memory=3D0 /*
V4L2_MEMORY_??? */, count=3D1}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_MMAP, count=3D0 =3D> 0}) =3D 0
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_USERPTR, count=3D0 =3D> 0}) =3D 0
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D0 =3D> 0}) =3D 0
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_MMAP, count=3D1 =3D> 1}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_MMAP, m.offset=3D0, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_MMAP, count=3D1 =3D> 1}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_MMAP, m.offset=3D0, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_MMAP, m.offset=3D0, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D1})
=3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_USERPTR, count=3D1 =3D> 1}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_USERPTR, m.userptr=3DNULL, length=3D614400,
bytesused=3D0, flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTA=
MP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_USERPTR, count=3D1 =3D> 1}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_USERPTR, m.userptr=3DNULL, length=3D614400,
bytesused=3D0, flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTA=
MP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_USERPTR, m.userptr=3DNULL, length=3D614400,
bytesused=3D0, flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTA=
MP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D1})
=3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D1 =3D> 1}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_DMABUF, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D1 =3D> 1}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_DMABUF, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_DMABUF, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D1})
=3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D0 =3D> 0}) =3D 0
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D1 =3D> 1}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_DMABUF, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(6, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_MMAP, count=3D1}) =3D -1 EBUSY (Device or resource
busy)
ioctl(6, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_MMAP, count=3D0}) =3D -1 EBUSY (Device or resource
busy)
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D0 =3D> 0}) =3D 0
ioctl(6, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_MMAP, count=3D1 =3D> 1}) =3D 0
ioctl(6, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_MMAP, m.offset=3D0, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(6, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_MMAP, count=3D0 =3D> 0}) =3D 0
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_MMAP, count=3D1 =3D> 1}) =3D 0
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D0 =3D> 0}) =3D 0
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=3D0, memory=3DV4L2_MEMORY_DMABUF,
format=3D{type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix=3D{width=3D640,
height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}}) =3D 0 ({index=3D0=
,
count=3D0})
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=3D1, memory=3DV4L2_MEMORY_MMAP,
format=3D{type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix=3D{width=3D640,
height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}}) =3D 0 ({index=3D0=
,
count=3D1})
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D0 =3D> 0}) =3D 0
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=3D1, memory=3DV4L2_MEMORY_DMABUF,
format=3D{type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix=3D{width=3D640,
height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}}) =3D 0 ({index=3D0=
,
count=3D1})
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_DMABUF, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_DMABUF, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D1})
=3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=3D1, memory=3DV4L2_MEMORY_DMABUF,
format=3D{type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix=3D{width=3D640,
height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}}) =3D 0 ({index=3D1=
,
count=3D1})
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D1,
memory=3DV4L2_MEMORY_DMABUF, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_DMABUF, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D1,
memory=3DV4L2_MEMORY_DMABUF, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D2})
=3D -1 EINVAL (Invalid argument)
ioctl(6, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(6, VIDIOC_CREATE_BUFS, {count=3D1, memory=3DV4L2_MEMORY_MMAP,
format=3D{type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix=3D{width=3D640,
height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}}) =3D -1 EBUSY
(Device or resource busy)
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D0 =3D> 0}) =3D 0
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=3D1, memory=3DV4L2_MEMORY_DMABUF,
format=3D{type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix=3D{width=3D640,
height=3D240, pixelformat=3Dv4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D307200, colorspace=3DV4L2_COLORSPACE_SRGB}}}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0})
=3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=3D1, memory=3DV4L2_MEMORY_DMABUF,
format=3D{type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix=3D{width=3D640,
height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D1228800, colorspace=3DV4L2_COLORSPACE_SRGB}}}) =3D 0 ({index=3D=
0,
count=3D1})
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_DMABUF, length=3D1228800, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D1 =3D> 1}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_DMABUF, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(6, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_USERPTR, count=3D1}) =3D -1 EBUSY (Device or resource
busy)
ioctl(6, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_USERPTR, count=3D0}) =3D -1 EBUSY (Device or resource
busy)
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D0 =3D> 0}) =3D 0
ioctl(6, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_USERPTR, count=3D1 =3D> 1}) =3D 0
ioctl(6, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_USERPTR, m.userptr=3DNULL, length=3D614400,
bytesused=3D0, flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTA=
MP_SRC_SOE,
...}) =3D 0
ioctl(6, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_USERPTR, count=3D0 =3D> 0}) =3D 0
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_USERPTR, count=3D1 =3D> 1}) =3D 0
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D0 =3D> 0}) =3D 0
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=3D0, memory=3DV4L2_MEMORY_DMABUF,
format=3D{type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix=3D{width=3D640,
height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}}) =3D 0 ({index=3D0=
,
count=3D0})
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=3D1, memory=3DV4L2_MEMORY_USERPTR,
format=3D{type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix=3D{width=3D640,
height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}}) =3D 0 ({index=3D0=
,
count=3D1})
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D0 =3D> 0}) =3D 0
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=3D1, memory=3DV4L2_MEMORY_DMABUF,
format=3D{type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix=3D{width=3D640,
height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}}) =3D 0 ({index=3D0=
,
count=3D1})
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_DMABUF, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_DMABUF, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D1})
=3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=3D1, memory=3DV4L2_MEMORY_DMABUF,
format=3D{type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix=3D{width=3D640,
height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}}) =3D 0 ({index=3D1=
,
count=3D1})
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D1,
memory=3DV4L2_MEMORY_DMABUF, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_DMABUF, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D1,
memory=3DV4L2_MEMORY_DMABUF, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D2})
=3D -1 EINVAL (Invalid argument)
ioctl(6, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(6, VIDIOC_CREATE_BUFS, {count=3D1, memory=3DV4L2_MEMORY_USERPTR,
format=3D{type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix=3D{width=3D640,
height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}}) =3D -1 EBUSY
(Device or resource busy)
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D0 =3D> 0}) =3D 0
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=3D1, memory=3DV4L2_MEMORY_DMABUF,
format=3D{type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix=3D{width=3D640,
height=3D240, pixelformat=3Dv4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D307200, colorspace=3DV4L2_COLORSPACE_SRGB}}}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0})
=3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=3D1, memory=3DV4L2_MEMORY_DMABUF,
format=3D{type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix=3D{width=3D640,
height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D1228800, colorspace=3DV4L2_COLORSPACE_SRGB}}}) =3D 0 ({index=3D=
0,
count=3D1})
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_DMABUF, length=3D1228800, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D1 =3D> 1}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_DMABUF, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(6, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D1}) =3D -1 EBUSY (Device or resource
busy)
ioctl(6, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D0}) =3D -1 EBUSY (Device or resource
busy)
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D0 =3D> 0}) =3D 0
ioctl(6, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D1 =3D> 1}) =3D 0
ioctl(6, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_DMABUF, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(6, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D0 =3D> 0}) =3D 0
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D1 =3D> 1}) =3D 0
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D0 =3D> 0}) =3D 0
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=3D0, memory=3DV4L2_MEMORY_DMABUF,
format=3D{type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix=3D{width=3D640,
height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}}) =3D 0 ({index=3D0=
,
count=3D0})
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=3D1, memory=3DV4L2_MEMORY_DMABUF,
format=3D{type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix=3D{width=3D640,
height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}}) =3D 0 ({index=3D0=
,
count=3D1})
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D0 =3D> 0}) =3D 0
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=3D1, memory=3DV4L2_MEMORY_DMABUF,
format=3D{type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix=3D{width=3D640,
height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}}) =3D 0 ({index=3D0=
,
count=3D1})
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_DMABUF, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_DMABUF, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D1})
=3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=3D1, memory=3DV4L2_MEMORY_DMABUF,
format=3D{type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix=3D{width=3D640,
height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}}) =3D 0 ({index=3D1=
,
count=3D1})
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D1,
memory=3DV4L2_MEMORY_DMABUF, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_DMABUF, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D1,
memory=3DV4L2_MEMORY_DMABUF, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D2})
=3D -1 EINVAL (Invalid argument)
ioctl(6, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(6, VIDIOC_CREATE_BUFS, {count=3D1, memory=3DV4L2_MEMORY_DMABUF,
format=3D{type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix=3D{width=3D640,
height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}}) =3D -1 EBUSY
(Device or resource busy)
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D0 =3D> 0}) =3D 0
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=3D1, memory=3DV4L2_MEMORY_DMABUF,
format=3D{type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix=3D{width=3D640,
height=3D240, pixelformat=3Dv4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D307200, colorspace=3DV4L2_COLORSPACE_SRGB}}}) =3D -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0})
=3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =3D 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=3D1, memory=3DV4L2_MEMORY_DMABUF,
format=3D{type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix=3D{width=3D640,
height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D1228800, colorspace=3DV4L2_COLORSPACE_SRGB}}}) =3D 0 ({index=3D=
0,
count=3D1})
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_DMABUF, length=3D1228800, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_DMABUF, count=3D0 =3D> 0}) =3D 0
write(1, "\ttest VIDIOC_REQBUFS/CREATE_BUFS"..., 55    test
VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
) =3D 55
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
ioctl(3, VIDIOC_G_SELECTION, 0x7fff5f34d7ec) =3D -1 EINVAL (Invalid argumen=
t)
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_MMAP, count=3D2 =3D> 2}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D0,
memory=3DV4L2_MEMORY_MMAP, m.offset=3D0, length=3D614400, bytesused=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_QUERYBUF, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE, index=3D1,
memory=3DV4L2_MEMORY_MMAP, m.offset=3D0x96000, length=3D614400, bytesused=
=3D0,
flags=3DV4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) =3D 0
ioctl(3, VIDIOC_EXPBUF, 0x7fff5f34c0c8) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_EXPBUF, 0x7fff5f34c098) =3D 0
ioctl(3, VIDIOC_EXPBUF, 0x7fff5f34c098) =3D 0
close(4)                                =3D 0
close(7)                                =3D 0
ioctl(3, VIDIOC_REQBUFS, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=3DV4L2_MEMORY_MMAP, count=3D0 =3D> 0}) =3D 0
write(1, "\ttest VIDIOC_EXPBUF: \33[32mOK\33[0m"..., 33    test
VIDIOC_EXPBUF: OK
) =3D 33
ioctl(3, VIDIOC_G_PARM, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
parm.capture=3D{capability=3DV4L2_CAP_TIMEPERFRAME, capturemode=3D0,
timeperframe=3D1/30, extendedmode=3D0, readbuffers=3D0}}) =3D 0
ioctl(3, VIDIOC_S_PARM, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
parm.capture=3D{capability=3DV4L2_CAP_TIMEPERFRAME, capturemode=3D0,
timeperframe=3D1/1000, extendedmode=3D0, readbuffers=3D0}} =3D>
{parm.capture=3D{capability=3DV4L2_CAP_TIMEPERFRAME, capturemode=3D0,
timeperframe=3D1/30, extendedmode=3D0, readbuffers=3D0}}) =3D 0
newfstatat(3, "", {st_mode=3DS_IFCHR|0660, st_rdev=3Dmakedev(0x51, 0),
...}, AT_EMPTY_PATH) =3D 0
openat(AT_FDCWD, "/sys/dev/char/81:0/device",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) =3D 4
newfstatat(4, "", {st_mode=3DS_IFDIR|0755, st_size=3D0, ...}, AT_EMPTY_PATH=
) =3D 0
getdents64(4, 0x55c0dee32040 /* 26 entries */, 32768) =3D 936
openat(AT_FDCWD, "/dev/media0", O_RDWR) =3D 7
close(4)                                =3D 0
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=3D0xf010000 /*
V4L2_CTRL_CLASS_??? */, count=3D0}) =3D -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=3D0xf010000 /*
V4L2_CTRL_CLASS_??? */, count=3D0}) =3D -1 EINVAL (Invalid argument)
ioctl(7, MEDIA_IOC_REQUEST_ALLOC, 0x7fff5f349dd0) =3D -1 ENOTTY
(Inappropriate ioctl for device)
close(7)                                =3D 0
write(1, "\ttest Requests: \33[32mOK\33[0m (Not"..., 44    test
Requests: OK (Not Supported)
) =3D 44
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
ioctl(3, VIDIOC_G_SELECTION, 0x7fff5f34d7ec) =3D -1 EINVAL (Invalid argumen=
t)
write(1, "\n", 1
)                       =3D 1
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
ioctl(3, VIDIOC_G_SELECTION, 0x7fff5f34d72c) =3D -1 EINVAL (Invalid argumen=
t)
ioctl(3, VIDIOC_S_INPUT, [0])           =3D 0
ioctl(3, VIDIOC_S_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}} =3D>
{fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J',
'P', 'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE,
bytesperline=3D0, sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =
=3D
0
ioctl(3, VIDIOC_G_PARM, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
parm.capture=3D{capability=3DV4L2_CAP_TIMEPERFRAME, capturemode=3D0,
timeperframe=3D1/30, extendedmode=3D0, readbuffers=3D0}}) =3D 0
ioctl(3, VIDIOC_S_PARM, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
parm.capture=3D{capability=3DV4L2_CAP_TIMEPERFRAME, capturemode=3D0,
timeperframe=3D1/15, extendedmode=3D0, readbuffers=3D0}} =3D>
{parm.capture=3D{capability=3DV4L2_CAP_TIMEPERFRAME, capturemode=3D0,
timeperframe=3D1/15, extendedmode=3D0, readbuffers=3D0}}) =3D 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_??? */,
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
{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0, value=3D0, value64=3D0}]} =
=3D>
{controls=3D[{id=3DV4L2_CID_BRIGHTNESS, size=3D0, value=3D128, value64=3D12=
8},
{id=3DV4L2_CID_CONTRAST, size=3D0, value=3D128, value64=3D128},
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
{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0, value=3D0, value64=3D0}],
error_idx=3D12}) =3D -1 EACCES (Permission denied)
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
ioctl(3, VIDIOC_G_SELECTION, 0x7fff5f34d72c) =3D -1 EINVAL (Invalid argumen=
t)
ioctl(3, VIDIOC_S_INPUT, [0])           =3D 0
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
ioctl(3, VIDIOC_G_SELECTION, 0x7fff5f34d72c) =3D -1 EINVAL (Invalid argumen=
t)
ioctl(3, VIDIOC_S_INPUT, [0])           =3D 0
ioctl(3, VIDIOC_S_FMT, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J', '=
P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE, bytesperline=3D0,
sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}} =3D>
{fmt.pix=3D{width=3D640, height=3D480, pixelformat=3Dv4l2_fourcc('M', 'J',
'P', 'G') /* V4L2_PIX_FMT_MJPEG */, field=3DV4L2_FIELD_NONE,
bytesperline=3D0, sizeimage=3D614400, colorspace=3DV4L2_COLORSPACE_SRGB}}) =
=3D
0
ioctl(3, VIDIOC_G_PARM, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
parm.capture=3D{capability=3DV4L2_CAP_TIMEPERFRAME, capturemode=3D0,
timeperframe=3D1/30, extendedmode=3D0, readbuffers=3D0}}) =3D 0
ioctl(3, VIDIOC_S_PARM, {type=3DV4L2_BUF_TYPE_VIDEO_CAPTURE,
parm.capture=3D{capability=3DV4L2_CAP_TIMEPERFRAME, capturemode=3D0,
timeperframe=3D1/15, extendedmode=3D0, readbuffers=3D0}} =3D>
{parm.capture=3D{capability=3DV4L2_CAP_TIMEPERFRAME, capturemode=3D0,
timeperframe=3D1/15, extendedmode=3D0, readbuffers=3D0}}) =3D 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=3D0 /* V4L2_CTRL_CLASS_??? */,
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
{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0, value=3D0, value64=3D0}]} =
=3D>
{controls=3D[{id=3DV4L2_CID_BRIGHTNESS, size=3D0, value=3D128, value64=3D12=
8},
{id=3DV4L2_CID_CONTRAST, size=3D0, value=3D128, value64=3D128},
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
{id=3DV4L2_CID_EXPOSURE_AUTO_PRIORITY, size=3D0, value=3D0, value64=3D0}],
error_idx=3D12}) =3D -1 EACCES (Permission denied)
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
ioctl(3, VIDIOC_G_SELECTION, 0x7fff5f34d72c) =3D -1 EINVAL (Invalid argumen=
t)
write(1, "Total for uvcvideo device /dev/v"..., 81Total for uvcvideo
device /dev/video0: 46, Succeeded: 46, Failed: 0, Warnings: 1
) =3D 81
close(3)                                =3D 0
close(6)                                =3D 0
close(5)                                =3D 0
exit_group(0)                           =3D ?
+++ exited with 0 +++
# dmesg
[   50.203806] usb 1-2: uvc_v4l2_open
[   50.299428] usb 1-2: Resuming interface 0
[   50.299442] usb 1-2: Resuming interface 1
[   50.303496] usb 1-2: uvc_v4l2_release
[   50.343577] usb 1-2: uvc_v4l2_open
[   50.351939] usb 1-2: uvc_v4l2_open
[   50.354430] usb 1-2: uvc_v4l2_open
[   50.354536] usb 1-2: uvc_v4l2_open
[   50.354630] usb 1-2: uvc_v4l2_open
[   50.354727] usb 1-2: uvc_v4l2_open
[   50.354823] usb 1-2: uvc_v4l2_open
[   50.354917] usb 1-2: uvc_v4l2_open
[   50.355037] usb 1-2: uvc_v4l2_open
[   50.355133] usb 1-2: uvc_v4l2_open
[   50.355227] usb 1-2: uvc_v4l2_open
[   50.355318] usb 1-2: uvc_v4l2_open
[   50.355410] usb 1-2: uvc_v4l2_open
[   50.355500] usb 1-2: uvc_v4l2_open
[   50.355593] usb 1-2: uvc_v4l2_open
[   50.355684] usb 1-2: uvc_v4l2_open
[   50.355776] usb 1-2: uvc_v4l2_open
[   50.355870] usb 1-2: uvc_v4l2_open
[   50.355962] usb 1-2: uvc_v4l2_open
[   50.356091] usb 1-2: uvc_v4l2_open
[   50.356186] usb 1-2: uvc_v4l2_open
[   50.356278] usb 1-2: uvc_v4l2_open
[   50.356370] usb 1-2: uvc_v4l2_open
[   50.356462] usb 1-2: uvc_v4l2_open
[   50.356552] usb 1-2: uvc_v4l2_open
[   50.356642] usb 1-2: uvc_v4l2_open
[   50.356737] usb 1-2: uvc_v4l2_open
[   50.356832] usb 1-2: uvc_v4l2_open
[   50.356924] usb 1-2: uvc_v4l2_open
[   50.357038] usb 1-2: uvc_v4l2_open
[   50.357251] usb 1-2: uvc_v4l2_open
[   50.357414] usb 1-2: uvc_v4l2_open
[   50.357568] usb 1-2: uvc_v4l2_open
[   50.357713] usb 1-2: uvc_v4l2_open
[   50.357875] usb 1-2: uvc_v4l2_open
[   50.357966] usb 1-2: uvc_v4l2_open
[   50.358070] usb 1-2: uvc_v4l2_open
[   50.358167] usb 1-2: uvc_v4l2_open
[   50.358266] usb 1-2: uvc_v4l2_open
[   50.358340] usb 1-2: uvc_v4l2_open
[   50.358528] usb 1-2: uvc_v4l2_open
[   50.358635] usb 1-2: uvc_v4l2_open
[   50.358755] usb 1-2: uvc_v4l2_open
[   50.358850] usb 1-2: uvc_v4l2_open
[   50.358941] usb 1-2: uvc_v4l2_open
[   50.359099] usb 1-2: uvc_v4l2_open
[   50.359201] usb 1-2: uvc_v4l2_open
[   50.359307] usb 1-2: uvc_v4l2_open
[   50.359399] usb 1-2: uvc_v4l2_open
[   50.359470] usb 1-2: uvc_v4l2_open
[   50.359538] usb 1-2: uvc_v4l2_open
[   50.359598] usb 1-2: uvc_v4l2_open
[   50.359709] usb 1-2: uvc_v4l2_open
[   50.359835] usb 1-2: uvc_v4l2_open
[   50.359952] usb 1-2: uvc_v4l2_open
[   50.360088] usb 1-2: uvc_v4l2_open
[   50.360181] usb 1-2: uvc_v4l2_open
[   50.360262] usb 1-2: uvc_v4l2_open
[   50.360350] usb 1-2: uvc_v4l2_open
[   50.360440] usb 1-2: uvc_v4l2_open
[   50.360511] usb 1-2: uvc_v4l2_open
[   50.360582] usb 1-2: uvc_v4l2_open
[   50.360650] usb 1-2: uvc_v4l2_open
[   50.360716] usb 1-2: uvc_v4l2_open
[   50.360784] usb 1-2: uvc_v4l2_open
[   50.360852] usb 1-2: uvc_v4l2_open
[   50.360918] usb 1-2: uvc_v4l2_open
[   50.360987] usb 1-2: uvc_v4l2_open
[   50.361072] usb 1-2: uvc_v4l2_open
[   50.361140] usb 1-2: uvc_v4l2_open
[   50.361205] usb 1-2: uvc_v4l2_open
[   50.361274] usb 1-2: uvc_v4l2_open
[   50.361342] usb 1-2: uvc_v4l2_open
[   50.361412] usb 1-2: uvc_v4l2_open
[   50.361478] usb 1-2: uvc_v4l2_open
[   50.361566] usb 1-2: uvc_v4l2_open
[   50.361634] usb 1-2: uvc_v4l2_open
[   50.361702] usb 1-2: uvc_v4l2_open
[   50.361770] usb 1-2: uvc_v4l2_open
[   50.361837] usb 1-2: uvc_v4l2_open
[   50.361902] usb 1-2: uvc_v4l2_open
[   50.361971] usb 1-2: uvc_v4l2_open
[   50.362045] usb 1-2: uvc_v4l2_open
[   50.362113] usb 1-2: uvc_v4l2_open
[   50.362180] usb 1-2: uvc_v4l2_open
[   50.362247] usb 1-2: uvc_v4l2_open
[   50.362314] usb 1-2: uvc_v4l2_open
[   50.362380] usb 1-2: uvc_v4l2_open
[   50.362447] usb 1-2: uvc_v4l2_open
[   50.362516] usb 1-2: uvc_v4l2_open
[   50.362595] usb 1-2: uvc_v4l2_open
[   50.362643] usb 1-2: uvc_v4l2_open
[   50.362692] usb 1-2: uvc_v4l2_open
[   50.362740] usb 1-2: uvc_v4l2_open
[   50.362790] usb 1-2: uvc_v4l2_open
[   50.362839] usb 1-2: uvc_v4l2_open
[   50.362887] usb 1-2: uvc_v4l2_open
[   50.362935] usb 1-2: uvc_v4l2_open
[   50.362985] usb 1-2: uvc_v4l2_open
[   50.363042] usb 1-2: uvc_v4l2_open
[   50.363088] usb 1-2: uvc_v4l2_open
[   50.363136] usb 1-2: uvc_v4l2_open
[   50.363189] usb 1-2: uvc_v4l2_release
[   50.363259] usb 1-2: uvc_v4l2_release
[   50.363347] usb 1-2: uvc_v4l2_release
[   50.363421] usb 1-2: uvc_v4l2_release
[   50.363466] usb 1-2: uvc_v4l2_release
[   50.363514] usb 1-2: uvc_v4l2_release
[   50.363552] usb 1-2: uvc_v4l2_release
[   50.363588] usb 1-2: uvc_v4l2_release
[   50.363653] usb 1-2: uvc_v4l2_release
[   50.363697] usb 1-2: uvc_v4l2_release
[   50.363767] usb 1-2: uvc_v4l2_release
[   50.363825] usb 1-2: uvc_v4l2_release
[   50.363873] usb 1-2: uvc_v4l2_release
[   50.363939] usb 1-2: uvc_v4l2_release
[   50.364011] usb 1-2: uvc_v4l2_release
[   50.364062] usb 1-2: uvc_v4l2_release
[   50.364118] usb 1-2: uvc_v4l2_release
[   50.364177] usb 1-2: uvc_v4l2_release
[   50.364228] usb 1-2: uvc_v4l2_release
[   50.364289] usb 1-2: uvc_v4l2_release
[   50.364372] usb 1-2: uvc_v4l2_release
[   50.364420] usb 1-2: uvc_v4l2_release
[   50.364477] usb 1-2: uvc_v4l2_release
[   50.364535] usb 1-2: uvc_v4l2_release
[   50.364587] usb 1-2: uvc_v4l2_release
[   50.364632] usb 1-2: uvc_v4l2_release
[   50.364689] usb 1-2: uvc_v4l2_release
[   50.364745] usb 1-2: uvc_v4l2_release
[   50.364817] usb 1-2: uvc_v4l2_release
[   50.364863] usb 1-2: uvc_v4l2_release
[   50.364913] usb 1-2: uvc_v4l2_release
[   50.364968] usb 1-2: uvc_v4l2_release
[   50.365039] usb 1-2: uvc_v4l2_release
[   50.365095] usb 1-2: uvc_v4l2_release
[   50.365150] usb 1-2: uvc_v4l2_release
[   50.365210] usb 1-2: uvc_v4l2_release
[   50.365268] usb 1-2: uvc_v4l2_release
[   50.365315] usb 1-2: uvc_v4l2_release
[   50.365362] usb 1-2: uvc_v4l2_release
[   50.365408] usb 1-2: uvc_v4l2_release
[   50.365466] usb 1-2: uvc_v4l2_release
[   50.365535] usb 1-2: uvc_v4l2_release
[   50.365581] usb 1-2: uvc_v4l2_release
[   50.365626] usb 1-2: uvc_v4l2_release
[   50.365662] usb 1-2: uvc_v4l2_release
[   50.365706] usb 1-2: uvc_v4l2_release
[   50.365750] usb 1-2: uvc_v4l2_release
[   50.365790] usb 1-2: uvc_v4l2_release
[   50.365854] usb 1-2: uvc_v4l2_release
[   50.365900] usb 1-2: uvc_v4l2_release
[   50.365965] usb 1-2: uvc_v4l2_release
[   50.366038] usb 1-2: uvc_v4l2_release
[   50.366084] usb 1-2: uvc_v4l2_release
[   50.366150] usb 1-2: uvc_v4l2_release
[   50.366219] usb 1-2: uvc_v4l2_release
[   50.366263] usb 1-2: uvc_v4l2_release
[   50.366326] usb 1-2: uvc_v4l2_release
[   50.366369] usb 1-2: uvc_v4l2_release
[   50.366407] usb 1-2: uvc_v4l2_release
[   50.366468] usb 1-2: uvc_v4l2_release
[   50.366536] usb 1-2: uvc_v4l2_release
[   50.366579] usb 1-2: uvc_v4l2_release
[   50.366643] usb 1-2: uvc_v4l2_release
[   50.366686] usb 1-2: uvc_v4l2_release
[   50.366749] usb 1-2: uvc_v4l2_release
[   50.366817] usb 1-2: uvc_v4l2_release
[   50.366860] usb 1-2: uvc_v4l2_release
[   50.366897] usb 1-2: uvc_v4l2_release
[   50.366958] usb 1-2: uvc_v4l2_release
[   50.367032] usb 1-2: uvc_v4l2_release
[   50.367078] usb 1-2: uvc_v4l2_release
[   50.367140] usb 1-2: uvc_v4l2_release
[   50.367208] usb 1-2: uvc_v4l2_release
[   50.367251] usb 1-2: uvc_v4l2_release
[   50.367313] usb 1-2: uvc_v4l2_release
[   50.367356] usb 1-2: uvc_v4l2_release
[   50.367419] usb 1-2: uvc_v4l2_release
[   50.367485] usb 1-2: uvc_v4l2_release
[   50.367554] usb 1-2: uvc_v4l2_release
[   50.367587] usb 1-2: uvc_v4l2_release
[   50.367636] usb 1-2: uvc_v4l2_release
[   50.367669] usb 1-2: uvc_v4l2_release
[   50.367717] usb 1-2: uvc_v4l2_release
[   50.367752] usb 1-2: uvc_v4l2_release
[   50.367802] usb 1-2: uvc_v4l2_release
[   50.367852] usb 1-2: uvc_v4l2_release
[   50.367895] usb 1-2: uvc_v4l2_release
[   50.367936] usb 1-2: uvc_v4l2_release
[   50.367978] usb 1-2: uvc_v4l2_release
[   50.368027] usb 1-2: uvc_v4l2_release
[   50.368071] usb 1-2: uvc_v4l2_release
[   50.368113] usb 1-2: uvc_v4l2_release
[   50.368155] usb 1-2: uvc_v4l2_release
[   50.368198] usb 1-2: uvc_v4l2_release
[   50.368241] usb 1-2: uvc_v4l2_release
[   50.368283] usb 1-2: uvc_v4l2_release
[   50.368326] usb 1-2: uvc_v4l2_release
[   50.368369] usb 1-2: uvc_v4l2_release
[   50.368412] usb 1-2: uvc_v4l2_release
[   50.368455] usb 1-2: uvc_v4l2_release
[   50.373076] usb 1-2: Control 0x00980001 not found
[   50.374028] usb 1-2: Control 0x009a0001 not found
[   50.375157] usb 1-2: Control 0x00000000 not found
[   50.375440] usb 1-2: Control 0x00980903 not found
[   50.375484] usb 1-2: Control 0x00980904 not found
[   50.375528] usb 1-2: Control 0x00980905 not found
[   50.375572] usb 1-2: Control 0x00980906 not found
[   50.375615] usb 1-2: Control 0x00980907 not found
[   50.375658] usb 1-2: Control 0x00980908 not found
[   50.375701] usb 1-2: Control 0x00980909 not found
[   50.375744] usb 1-2: Control 0x0098090a not found
[   50.375788] usb 1-2: Control 0x0098090b not found
[   50.375911] usb 1-2: Control 0x0098090d not found
[   50.375955] usb 1-2: Control 0x0098090e not found
[   50.376003] usb 1-2: Control 0x0098090f not found
[   50.376125] usb 1-2: Control 0x00980911 not found
[   50.376169] usb 1-2: Control 0x00980912 not found
[   50.376292] usb 1-2: Control 0x00980914 not found
[   50.376334] usb 1-2: Control 0x00980915 not found
[   50.376377] usb 1-2: Control 0x00980916 not found
[   50.376421] usb 1-2: Control 0x00980917 not found
[   50.376658] usb 1-2: Control 0x00980919 not found
[   50.376862] usb 1-2: Control 0x0098091c not found
[   50.376907] usb 1-2: Control 0x0098091d not found
[   50.376950] usb 1-2: Control 0x0098091e not found
[   50.376993] usb 1-2: Control 0x0098091f not found
[   50.377046] usb 1-2: Control 0x00980920 not found
[   50.377090] usb 1-2: Control 0x00980921 not found
[   50.377134] usb 1-2: Control 0x00980922 not found
[   50.377176] usb 1-2: Control 0x00980923 not found
[   50.377221] usb 1-2: Control 0x00980924 not found
[   50.377265] usb 1-2: Control 0x00980925 not found
[   50.377308] usb 1-2: Control 0x00980926 not found
[   50.377352] usb 1-2: Control 0x00980927 not found
[   50.377395] usb 1-2: Control 0x00980928 not found
[   50.377439] usb 1-2: Control 0x00980929 not found
[   50.377484] usb 1-2: Control 0x0098092a not found
[   50.377528] usb 1-2: Control 0x08000000 not found
[   50.378178] usb 1-2: Control 0x00000000 not found
[   50.378320] usb 1-2: Control 0x00980903 not found
[   50.378357] usb 1-2: Control 0x00980904 not found
[   50.378394] usb 1-2: Control 0x00980905 not found
[   50.378430] usb 1-2: Control 0x00980906 not found
[   50.378466] usb 1-2: Control 0x00980907 not found
[   50.378502] usb 1-2: Control 0x00980908 not found
[   50.378539] usb 1-2: Control 0x00980909 not found
[   50.378576] usb 1-2: Control 0x0098090a not found
[   50.378612] usb 1-2: Control 0x0098090b not found
[   50.378683] usb 1-2: Control 0x0098090d not found
[   50.378719] usb 1-2: Control 0x0098090e not found
[   50.378756] usb 1-2: Control 0x0098090f not found
[   50.378827] usb 1-2: Control 0x00980911 not found
[   50.378863] usb 1-2: Control 0x00980912 not found
[   50.378934] usb 1-2: Control 0x00980914 not found
[   50.378970] usb 1-2: Control 0x00980915 not found
[   50.379010] usb 1-2: Control 0x00980916 not found
[   50.379046] usb 1-2: Control 0x00980917 not found
[   50.379116] usb 1-2: Control 0x00980919 not found
[   50.379224] usb 1-2: Control 0x0098091c not found
[   50.379261] usb 1-2: Control 0x0098091d not found
[   50.379298] usb 1-2: Control 0x0098091e not found
[   50.379334] usb 1-2: Control 0x0098091f not found
[   50.379370] usb 1-2: Control 0x00980920 not found
[   50.379406] usb 1-2: Control 0x00980921 not found
[   50.379443] usb 1-2: Control 0x00980922 not found
[   50.379479] usb 1-2: Control 0x00980923 not found
[   50.379515] usb 1-2: Control 0x00980924 not found
[   50.379552] usb 1-2: Control 0x00980925 not found
[   50.379588] usb 1-2: Control 0x00980926 not found
[   50.379624] usb 1-2: Control 0x00980927 not found
[   50.379661] usb 1-2: Control 0x00980928 not found
[   50.379698] usb 1-2: Control 0x00980929 not found
[   50.379735] usb 1-2: Control 0x0098092a not found
[   50.379772] usb 1-2: Control 0x08000000 not found
[   50.387154] usb 1-2: Control 0x00000000 not found
[   50.387223] usb 1-2: Control 0x00000000 not found
[   50.389670] usb 1-2: Control 0x00000000 not found
[   50.389708] usb 1-2: Control 0x00000000 not found
[   50.389759] usb 1-2: Control 0x00000000 not found
[   50.390729] usb 1-2: uvc_v4l2_poll
[   50.390881] usb 1-2: uvc_v4l2_poll
[   50.390958] usb 1-2: uvc_v4l2_poll
[   50.391079] usb 1-2: uvc_v4l2_poll
[   50.391177] usb 1-2: uvc_v4l2_poll
[   50.391283] usb 1-2: uvc_v4l2_poll
[   50.391383] usb 1-2: uvc_v4l2_poll
[   50.391484] usb 1-2: uvc_v4l2_poll
[   50.391584] usb 1-2: uvc_v4l2_poll
[   50.391755] usb 1-2: uvc_v4l2_poll
[   50.391857] usb 1-2: uvc_v4l2_poll
[   50.391969] usb 1-2: uvc_v4l2_poll
[   50.392121] usb 1-2: uvc_v4l2_poll
[   50.392233] usb 1-2: uvc_v4l2_poll
[   50.392399] usb 1-2: uvc_v4l2_poll
[   50.392507] usb 1-2: uvc_v4l2_poll
[   50.399694] usb 1-2: Setting frame interval to 0/0 (4294967295)
[   50.400055] usb 1-2: Setting frame interval to 0/1 (0)
[   50.400398] usb 1-2: Setting frame interval to 1/0 (4294967295)
[   50.401730] usb 1-2: Trying format 0x47504a4d (MJPG): 640x480
[   50.401734] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
[   50.402079] usb 1-2: Trying format 0xffffffff (\xff\xff\xff\xff):
4294967295x4294967295
[   50.402083] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
[   50.402498] usb 1-2: Trying format 0xffffffff (\xff\xff\xff\xff):
4294967295x4294967295
[   50.402501] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
[   50.402836] usb 1-2: Trying format 0x47504a4d (MJPG): 640x480
[   50.402840] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
[   50.403268] usb 1-2: Trying format 0x47504a4d (MJPG): 0x0
[   50.403272] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
[   50.403688] usb 1-2: Trying format 0x47504a4d (MJPG): 640x480
[   50.403691] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
[   50.404444] usb 1-2: Trying format 0x47504a4d (MJPG): 1x1
[   50.404447] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
[   50.404867] usb 1-2: Trying format 0x47504a4d (MJPG): 16384x16384
[   50.404870] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
[   50.405282] usb 1-2: Trying format 0x47504a4d (MJPG): 640x480
[   50.405285] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
[   50.406031] usb 1-2: uvc_v4l2_release
[   50.406065] usb 1-2: uvc_v4l2_open
[   50.409549] usb 1-2: uvc_v4l2_release
[   50.409576] usb 1-2: uvc_v4l2_open
[   50.410127] usb 1-2: Setting frame interval to 1/1000 (10000)
[   50.410733] usb 1-2: uvc_v4l2_release
[   50.410792] usb 1-2: uvc_v4l2_open
[   50.410980] usb 1-2: uvc_v4l2_release
[   50.411011] usb 1-2: uvc_v4l2_open
[   50.411204] usb 1-2: Trying format 0x47504a4d (MJPG): 640x480
[   50.411207] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
[   50.411601] usb 1-2: Setting frame interval to 1/15 (666666)
[   50.412041] usb 1-2: uvc_v4l2_release
[   50.412083] usb 1-2: uvc_v4l2_open
[   50.475712] usb 1-2: uvc_v4l2_release
[   50.475929] usb 1-2: uvc_v4l2_open
[   50.477599] usb 1-2: Trying format 0x47504a4d (MJPG): 640x480
[   50.477618] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
[   50.478424] usb 1-2: Setting frame interval to 1/15 (666666)
[   50.479445] usb 1-2: uvc_v4l2_release
[   50.479664] usb 1-2: uvc_v4l2_open
[   50.481183] usb 1-2: uvc_v4l2_release
[   50.481312] usb 1-2: uvc_v4l2_release
[   52.794273] usb 1-2: Suspending interface 1
[   52.794289] usb 1-2: Suspending interface 0

>
>  drivers/media/usb/uvc/uvc_driver.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/u=
vc_driver.c
> index 29befcb229b2..27234fe60a48 100644
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
> @@ -769,6 +769,8 @@ static int uvc_parse_format(struct uvc_device *dev,
>
>                 buflen -=3D buffer[0];
>                 buffer +=3D buffer[0];
> +       } else {
> +               format->colorspace =3D V4L2_COLORSPACE_SRGB;
>         }
>
>         return buffer - start;
> --
> 2.34.0.rc1.387.gb447b232ab-goog
>
