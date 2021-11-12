Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 663D144EF14
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 23:07:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235808AbhKLWKh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 17:10:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232139AbhKLWKf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 17:10:35 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A68AC061766
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 14:07:44 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso15907143ots.6
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 14:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G404L4WPuN1lZyTd1iW+xDZxZgaS/GnowdgmkvnfEzg=;
        b=MeW7h5lXnUW0tdo2MYTrIylRWqRkRalj2EWGvpBWXemTghgnOtSXwBLb6Ahd8T38+U
         fUo6zhnjuEvA5DxcaH1qgbpAC8Zv9eKB7D5olz0sGWMddBQOc3sMCxbqVx7l5fIwwPJG
         n8s/aM8h3qhiuYSJbjFmmDuTh0lWIOjxCUgDFpH8RZ8OhOnadTVU+ye4h2LZ3biPI1kr
         dW82lVbPMtrSAmz9JB+4Ks+Cb26/He7X4OP8widsa771M7fz1N+bFzTWoUOvg1JiWe9/
         UA+SsPcXdrLGBzQRYQDUt2WLSqjuJZme588HT9z2ntzGaih3LAdjBO2QSDqqoZmXDk/5
         iLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G404L4WPuN1lZyTd1iW+xDZxZgaS/GnowdgmkvnfEzg=;
        b=0ufbExA3I4k7SMhAiFbk9etDIwz33yNU1nAxMGVok8fUK/VP8JZZ1kxr7rW7ww7q88
         +FebXvcd9cazi+RLNT+iy2C0CdLTaF22KWICP6RSR+CjaB0YIgH/sn/Qbm/yMuaofdWW
         AiliEhunloSwghjyL+KthJAviugukJ/Hfp+MOz0ywuKDqyyRgVZum7bQekdKBhUvmCn8
         Iyakej66JTurIIZfOx49xZ4Y2rnsG+PKJoMNaj2RLla4PJsX3ajhegFkai494K5j/yAg
         JMSsdHRNo3DsiTCHW5cMy5R7PW0veR8NYWNZd4dXbbAFYlOK849AVVJqa37gZ/JW1MSd
         8t9w==
X-Gm-Message-State: AOAM533zBJ3ji6hy1DH5B19CckB+2NxrNi6f5mWMDe/J2qyW/x1R31UJ
        kjt2zEypcmDxFQb/w1UmPFu55KRv9OwZ5GQxB+g=
X-Google-Smtp-Source: ABdhPJwlSPN0lWmSCj1QvHOChCBCxBlHIpn+wxodVEiq313hn/EjD8MogTp6bMJ7+7npgnaEwbFrMYvqGxViW/+1Iw4=
X-Received: by 2002:a9d:2282:: with SMTP id y2mr15163762ota.151.1636754863195;
 Fri, 12 Nov 2021 14:07:43 -0800 (PST)
MIME-Version: 1.0
References: <20211112195710.286151-1-ribalda@chromium.org> <CADvTj4o9zzVJaiWOp=B24zv63jhaW+c45QawGOPc4VsNR2=hZA@mail.gmail.com>
 <CANiDSCsQRUPA1u=vC+7-+KxeUkOTqnpdu3OEMfpmzd8KN7OfSg@mail.gmail.com>
In-Reply-To: <CANiDSCsQRUPA1u=vC+7-+KxeUkOTqnpdu3OEMfpmzd8KN7OfSg@mail.gmail.com>
From:   James Hilliard <james.hilliard1@gmail.com>
Date:   Fri, 12 Nov 2021 15:07:32 -0700
Message-ID: <CADvTj4oSwupbndes-DMQdAhraWnAJvjkME+DZPh4Sr2TAFO8uQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Set the colorspace as sRGB if undefined
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

So it fixed the failure on that one camera, I tested on a few other
systems/cameras I have access to and found another(different I think)
failure:

# dmesg -c > /dev/null
# v4l2-ctl --all -d /dev/video0
Driver Info:
    Driver name      : uvcvideo
    Card type        : USB 2.0 Camera: USB Camera
    Bus info         : usb-0000:00:14.0-1
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
    Model            : USB 2.0 Camera: USB Camera
    Serial           :
    Bus info         : usb-0000:00:14.0-1
    Media version    : 5.15.0
    Hardware revision: 0x00002702 (9986)
    Driver version   : 5.15.0
Interface Info:
    ID               : 0x03000002
    Type             : V4L Video
Entity Info:
    ID               : 0x00000001 (1)
    Name             : Video Capture 5
    Function         : V4L2 I/O
    Flags            : default
    Pad 0x01000007   : 0: Sink
      Link 0x02000010: from remote pad 0x100000a of entity 'Extension
3' (Video Pixel Formatter): Data, Enabled, Immutable
Priority: 2
Video input : 0 (Camera 1: ok)
Format Video Capture:
    Width/Height      : 352/288
    Pixel Format      : 'MJPG' (Motion-JPEG)
    Field             : None
    Bytes per Line    : 0
    Size Image        : 203341
    Colorspace        : sRGB
    Transfer Function : Rec. 709
    YCbCr/HSV Encoding: ITU-R 601
    Quantization      : Default (maps to Full Range)
    Flags             :
Crop Capability Video Capture:
    Bounds      : Left 0, Top 0, Width 352, Height 288
    Default     : Left 0, Top 0, Width 352, Height 288
    Pixel Aspect: 1/1
Selection Video Capture: crop_default, Left 0, Top 0, Width 352,
Height 288, Flags:
Selection Video Capture: crop_bounds, Left 0, Top 0, Width 352, Height
288, Flags:
Streaming Parameters Video Capture:
    Capabilities     : timeperframe
    Frames per second: 30.000 (30/1)
    Read buffers     : 0

User Controls

                     brightness 0x00980900 (int)    : min=-64 max=64
step=1 default=0 value=0
                       contrast 0x00980901 (int)    : min=0 max=95
step=1 default=35 value=35
                     saturation 0x00980902 (int)    : min=0 max=128
step=1 default=62 value=62
                            hue 0x00980903 (int)    : min=-2000
max=2000 step=1 default=0 value=0
        white_balance_automatic 0x0098090c (bool)   : default=1 value=1
                          gamma 0x00980910 (int)    : min=100 max=300
step=1 default=103 value=103
           power_line_frequency 0x00980918 (menu)   : min=0 max=2
default=1 value=1 (50 Hz)
                0: Disabled
                1: 50 Hz
                2: 60 Hz
      white_balance_temperature 0x0098091a (int)    : min=2800
max=6500 step=1 default=4600 value=4600 flags=inactive
                      sharpness 0x0098091b (int)    : min=1 max=7
step=1 default=2 value=2
         backlight_compensation 0x0098091c (int)    : min=0 max=3
step=1 default=1 value=1
# strace -f v4l2-compliance -d /dev/video0 -E
execve("/usr/bin/v4l2-compliance", ["v4l2-compliance", "-d",
"/dev/video0", "-E"], 0x7ffeed521100 /* 13 vars */) = 0
brk(NULL)                               = 0x558d9ac62000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = -1 ENOENT
(No such file or directory)
openat(AT_FDCWD, "/lib64/glibc-hwcaps/x86-64-v2/libv4l2.so.0",
O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/glibc-hwcaps/x86-64-v2", 0x7fff4f0db420,
0) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/tls/x86_64/x86_64/libv4l2.so.0",
O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/tls/x86_64/x86_64", 0x7fff4f0db420, 0) =
-1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/tls/x86_64/libv4l2.so.0", O_RDONLY|O_CLOEXEC)
= -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/tls/x86_64", 0x7fff4f0db420, 0) = -1
ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/tls/x86_64/libv4l2.so.0", O_RDONLY|O_CLOEXEC)
= -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/tls/x86_64", 0x7fff4f0db420, 0) = -1
ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/tls/libv4l2.so.0", O_RDONLY|O_CLOEXEC) = -1
ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/tls", 0x7fff4f0db420, 0) = -1 ENOENT (No
such file or directory)
openat(AT_FDCWD, "/lib64/x86_64/x86_64/libv4l2.so.0",
O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/x86_64/x86_64", 0x7fff4f0db420, 0) = -1
ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/x86_64/libv4l2.so.0", O_RDONLY|O_CLOEXEC) =
-1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/x86_64", 0x7fff4f0db420, 0) = -1 ENOENT
(No such file or directory)
openat(AT_FDCWD, "/lib64/x86_64/libv4l2.so.0", O_RDONLY|O_CLOEXEC) =
-1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/x86_64", 0x7fff4f0db420, 0) = -1 ENOENT
(No such file or directory)
openat(AT_FDCWD, "/lib64/libv4l2.so.0", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\370\"\0\0\0\0\0\0"...,
832) = 832
pread64(3, "\4\0\0\0
\0\0\0\5\0\0\0GNU\0\1\0\1\300\4\0\0\0\t\0\0\0\0\0\0\0"..., 48, 35072)
= 48
newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=55392, ...}, AT_EMPTY_PATH) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x7f5f092f2000
mmap(NULL, 57808, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f5f092e3000
mmap(0x7f5f092e5000, 20480, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0x7f5f092e5000
mmap(0x7f5f092ea000, 8192, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x7000) = 0x7f5f092ea000
mmap(0x7f5f092ec000, 24576, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8000) = 0x7f5f092ec000
close(3)                                = 0
openat(AT_FDCWD, "/lib64/libv4lconvert.so.0", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\250D\0\0\0\0\0\0"...,
832) = 832
pread64(3, "\4\0\0\0
\0\0\0\5\0\0\0GNU\0\1\0\1\300\4\0\0\0\t\0\0\0\0\0\0\0"..., 48, 126512)
= 48
newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=137440, ...},
AT_EMPTY_PATH) = 0
mmap(NULL, 476256, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f5f0926e000
mprotect(0x7f5f09272000, 114688, PROT_NONE) = 0
mmap(0x7f5f09272000, 73728, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) = 0x7f5f09272000
mmap(0x7f5f09284000, 36864, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x16000) = 0x7f5f09284000
mmap(0x7f5f0928e000, 12288, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1f000) = 0x7f5f0928e000
mmap(0x7f5f09291000, 332896, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f5f09291000
close(3)                                = 0
openat(AT_FDCWD, "/lib64/libjpeg.so.8", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0@E\0\0\0\0\0\0"...,
832) = 832
newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=493408, ...},
AT_EMPTY_PATH) = 0
mmap(NULL, 495648, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f5f091f4000
mmap(0x7f5f091f8000, 237568, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) = 0x7f5f091f8000
mmap(0x7f5f09232000, 237568, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3e000) = 0x7f5f09232000
mmap(0x7f5f0926c000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x77000) = 0x7f5f0926c000
close(3)                                = 0
openat(AT_FDCWD, "/lib64/libstdc++.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\0\214\n\0\0\0\0\0"...,
832) = 832
pread64(3, "\4\0\0\0
\0\0\0\5\0\0\0GNU\0\1\0\1\300\4\0\0\0\v\0\0\0\0\0\0\0"..., 48,
1457064) = 48
newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=1515608, ...},
AT_EMPTY_PATH) = 0
mmap(NULL, 1531392, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f5f0907e000
mmap(0x7f5f09120000, 524288, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xa2000) = 0x7f5f09120000
mmap(0x7f5f091a0000, 270336, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x122000) = 0x7f5f091a0000
mmap(0x7f5f091e2000, 61440, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x163000) = 0x7f5f091e2000
mmap(0x7f5f091f1000, 11776, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f5f091f1000
close(3)                                = 0
openat(AT_FDCWD, "/lib64/libm.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\340\321\0\0\0\0\0\0"...,
832) = 832
newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=878512, ...},
AT_EMPTY_PATH) = 0
mmap(NULL, 880680, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f5f08fa6000
mprotect(0x7f5f08fb3000, 823296, PROT_NONE) = 0
mmap(0x7f5f08fb3000, 442368, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xd000) = 0x7f5f08fb3000
mmap(0x7f5f0901f000, 376832, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x79000) = 0x7f5f0901f000
mmap(0x7f5f0907c000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xd5000) = 0x7f5f0907c000
close(3)                                = 0
openat(AT_FDCWD, "/lib64/libgcc_s.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\3702\0\0\0\0\0\0"...,
832) = 832
pread64(3, "\4\0\0\0
\0\0\0\5\0\0\0GNU\0\1\0\1\300\4\0\0\0\v\0\0\0\0\0\0\0"..., 48, 71408)
= 48
newfstatat(3, "", {st_mode=S_IFREG|0644, st_size=76144, ...}, AT_EMPTY_PATH) = 0
mmap(NULL, 78856, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f5f08f92000
mmap(0x7f5f08f95000, 49152, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3000) = 0x7f5f08f95000
mmap(0x7f5f08fa1000, 12288, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xf000) = 0x7f5f08fa1000
mmap(0x7f5f08fa4000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x11000) = 0x7f5f08fa4000
close(3)                                = 0
openat(AT_FDCWD, "/lib64/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0
\224\2\0\0\0\0\0"..., 832) = 832
pread64(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"...,
784, 64) = 784
pread64(3, "\4\0\0\0000\0\0\0\5\0\0\0GNU\0\2\200\0\300\4\0\0\0\3\0\0\0\0\0\0\0"...,
64, 848) = 64
pread64(3, "\4\0\0\0\20\0\0\0\1\0\0\0GNU\0\0\0\0\0\5\0\0\0\17\0\0\0\0\0\0\0",
32, 912) = 32
newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=2023720, ...},
AT_EMPTY_PATH) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x7f5f08f90000
pread64(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"...,
784, 64) = 784
mmap(NULL, 2075760, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f5f08d95000
mprotect(0x7f5f08dbd000, 1835008, PROT_NONE) = 0
mmap(0x7f5f08dbd000, 1466368, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x28000) = 0x7f5f08dbd000
mmap(0x7f5f08f23000, 364544, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x18e000) = 0x7f5f08f23000
mmap(0x7f5f08f7d000, 24576, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1e7000) = 0x7f5f08f7d000
mmap(0x7f5f08f83000, 52336, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f5f08f83000
close(3)                                = 0
mmap(NULL, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x7f5f08d92000
arch_prctl(ARCH_SET_FS, 0x7f5f08d92740) = 0
set_tid_address(0x7f5f08d92a10)         = 497
set_robust_list(0x7f5f08d92a20, 24)     = 0
mprotect(0x7f5f08f7d000, 16384, PROT_READ) = 0
mprotect(0x7f5f08fa4000, 4096, PROT_READ) = 0
mprotect(0x7f5f0907c000, 4096, PROT_READ) = 0
mprotect(0x7f5f091e2000, 45056, PROT_READ) = 0
mprotect(0x7f5f0926c000, 4096, PROT_READ) = 0
mprotect(0x7f5f0928e000, 8192, PROT_READ) = 0
mprotect(0x7f5f092ec000, 4096, PROT_READ) = 0
mprotect(0x558d99302000, 8192, PROT_READ) = 0
mprotect(0x7f5f09323000, 8192, PROT_READ) = 0
prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=8192*1024,
rlim_max=RLIM64_INFINITY}) = 0
getrandom("\xc4\x8a\x72\x39\x1e\x7c\xba\x93", 8, GRND_NONBLOCK) = 8
brk(NULL)                               = 0x558d9ac62000
brk(0x558d9ac83000)                     = 0x558d9ac83000
futex(0x7f5f091f1cbc, FUTEX_WAKE_PRIVATE, 2147483647) = 0
futex(0x7f5f091f1cc8, FUTEX_WAKE_PRIVATE, 2147483647) = 0
ioctl(1, TCGETS, {B38400 opost isig icanon echo ...}) = 0
newfstatat(1, "", {st_mode=S_IFCHR|0620, st_rdev=makedev(0x88, 0),
...}, AT_EMPTY_PATH) = 0
write(1, "v4l2-compliance 1.22.1, 64 bits,"..., 47v4l2-compliance
1.22.1, 64 bits, 64-bit time_t
) = 47
write(1, "\n", 1
)                       = 1
newfstatat(AT_FDCWD, "/dev/video0", {st_mode=S_IFCHR|0660,
st_rdev=makedev(0x51, 0), ...}, 0) = 0
openat(AT_FDCWD, "/sys/dev/char/81:0/uevent", O_RDONLY) = 3
read(3, "MAJOR=81\nMINOR=0\nDEVNAME=video0\n", 8191) = 32
close(3)                                = 0
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 3
ioctl(3, VIDIOC_QUERYCAP, {driver="uvcvideo", card="USB 2.0 Camera:
USB Camera", bus_info="usb-0000:00:14.0-1", version=KERNEL_VERSION(5,
15, 0), capabilities=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_META_CAPTURE|V4L2_CAP_STREAMING|V4L2_CAP_DEVICE_CAPS,
device_caps=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_STREAMING})
= 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|0 /*
V4L2_CID_??? */ => V4L2_CTRL_CLASS_USER+0x1,
type=V4L2_CTRL_TYPE_CTRL_CLASS, name="User Controls", ...}) = 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_???
*/, count=0}) = 0
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CTRL_FLAG_NEXT_CTRL|0 /*
V4L2_CID_??? */ => V4L2_CTRL_CLASS_USER+0x1,
type=V4L2_CTRL_TYPE_CTRL_CLASS, name="User Controls", ...}) = 0
ioctl(3, VIDIOC_G_SELECTION, 0x7fff4f0dab0c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERYCAP, {driver="uvcvideo", card="USB 2.0 Camera:
USB Camera", bus_info="usb-0000:00:14.0-1", version=KERNEL_VERSION(5,
15, 0), capabilities=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_META_CAPTURE|V4L2_CAP_STREAMING|V4L2_CAP_DEVICE_CAPS,
device_caps=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_STREAMING})
= 0
newfstatat(3, "", {st_mode=S_IFCHR|0660, st_rdev=makedev(0x51, 0),
...}, AT_EMPTY_PATH) = 0
openat(AT_FDCWD, "/sys/dev/char/81:0/device",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 4
newfstatat(4, "", {st_mode=S_IFDIR|0755, st_size=0, ...}, AT_EMPTY_PATH) = 0
getdents64(4, 0x558d9ac74500 /* 26 entries */, 32768) = 936
openat(AT_FDCWD, "/dev/media0", O_RDWR) = 5
close(4)                                = 0
ioctl(5, MEDIA_IOC_DEVICE_INFO, 0x7fff4f0da108) = 0
write(1, "Compliance test for uvcvideo dev"..., 50Compliance test for
uvcvideo device /dev/video0:

) = 50
write(1, "Driver Info:\n", 13Driver Info:
)          = 13
write(1, "\tDriver name      : uvcvideo\n", 29    Driver name      : uvcvideo
) = 29
write(1, "\tCard type        : USB 2.0 Came"..., 47    Card type
 : USB 2.0 Camera: USB Camera
) = 47
write(1, "\tBus info         : usb-0000:00:"..., 39    Bus info
 : usb-0000:00:14.0-1
) = 39
write(1, "\tDriver version   : 5.15.0\n", 27    Driver version   : 5.15.0
) = 27
write(1, "\tCapabilities     : 0x84a00001\n", 31    Capabilities     :
0x84a00001
) = 31
write(1, "\t\tVideo Capture\n\t\tMetadata Captu"..., 91        Video Capture
        Metadata Capture
        Streaming
        Extended Pix Format
        Device Capabilities
) = 91
write(1, "\tDevice Caps      : 0x04200001\n", 31    Device Caps      :
0x04200001
) = 31
write(1, "\t\tVideo Capture\n\t\tStreaming\n\t\tEx"..., 50        Video Capture
        Streaming
        Extended Pix Format
) = 50
ioctl(5, MEDIA_IOC_DEVICE_INFO, 0x7fff4f0d9d08) = 0
write(1, "Media Driver Info:\n", 19Media Driver Info:
)    = 19
write(1, "\tDriver name      : uvcvideo\n", 29    Driver name      : uvcvideo
) = 29
write(1, "\tModel            : USB 2.0 Came"..., 47    Model
 : USB 2.0 Camera: USB Camera
) = 47
write(1, "\tSerial           : \n", 21    Serial           :
) = 21
write(1, "\tBus info         : usb-0000:00:"..., 39    Bus info
 : usb-0000:00:14.0-1
) = 39
write(1, "\tMedia version    : 5.15.0\n", 27    Media version    : 5.15.0
) = 27
write(1, "\tHardware revision: 0x00002702 ("..., 38    Hardware
revision: 0x00002702 (9986)
) = 38
write(1, "\tDriver version   : 5.15.0\n", 27    Driver version   : 5.15.0
) = 27
newfstatat(3, "", {st_mode=S_IFCHR|0660, st_rdev=makedev(0x51, 0),
...}, AT_EMPTY_PATH) = 0
ioctl(5, MEDIA_IOC_G_TOPOLOGY, 0x7fff4f0d9be8) = 0
ioctl(5, MEDIA_IOC_G_TOPOLOGY, 0x7fff4f0d9be8) = 0
write(1, "Interface Info:\n", 16Interface Info:
)       = 16
write(1, "\tID               : 0x03000002\n", 31    ID               :
0x03000002
) = 31
write(1, "\tType             : V4L Video\n", 30    Type             : V4L Video
) = 30
write(1, "Entity Info:\n", 13Entity Info:
)          = 13
write(1, "\tID               : 0x00000001 ("..., 35    ID
 : 0x00000001 (1)
) = 35
write(1, "\tName             : Video Captur"..., 36    Name
 : Video Capture 5
) = 36
write(1, "\tFunction         : V4L2 I/O\n", 29    Function         : V4L2 I/O
) = 29
write(1, "\tFlags            : default\n", 28    Flags            : default
) = 28
write(1, "\tPad 0x01000007   : 0: Sink\n", 28    Pad 0x01000007   : 0: Sink
) = 28
write(1, "\t  Link 0x02000010: from remote "..., 120      Link
0x02000010: from remote pad 0x100000a of entity 'Extension 3' (Video
Pixel Formatter): Data, Enabled, Immutable
) = 120
ioctl(5, MEDIA_IOC_ENUM_ENTITIES, 0x7fff4f0daee0) = 0
ioctl(5, MEDIA_IOC_ENUM_LINKS, 0x7fff4f0da108) = 0
write(1, "\n", 1
)                       = 1
write(1, "Required ioctls:\n", 17Required ioctls:
)      = 17
write(1, "\ttest MC information (see 'Media"..., 66    test MC
information (see 'Media Driver Info' above): OK
) = 66
ioctl(3, VIDIOC_QUERYCAP, NULL)         = -1 EFAULT (Bad address)
ioctl(3, VIDIOC_QUERYCAP, {driver="uvcvideo", card="USB 2.0 Camera:
USB Camera", bus_info="usb-0000:00:14.0-1", version=KERNEL_VERSION(5,
15, 0), capabilities=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_META_CAPTURE|V4L2_CAP_STREAMING|V4L2_CAP_DEVICE_CAPS,
device_caps=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_STREAMING})
= 0
write(1, "\ttest VIDIOC_QUERYCAP: \33[32mOK\33["..., 35    test
VIDIOC_QUERYCAP: OK
) = 35
ioctl(3, _IOC(_IOC_NONE, 0x56, 0xff, 0), 0) = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, _IOC(_IOC_NONE, 0x56, 0, 0x3fff), 0) = -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, _IOC(_IOC_READ, 0x56, 0, 0x3fff), 0x7fff4f0d5f28) = -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, _IOC(_IOC_WRITE, 0x56, 0, 0x3fff), 0x7fff4f0d5f28) = -1
ENOTTY (Inappropriate ioctl for device)
ioctl(3, _IOC(_IOC_READ|_IOC_WRITE, 0x56, 0, 0x3fff), 0x7fff4f0d5f28)
= -1 ENOTTY (Inappropriate ioctl for device)
write(1, "\ttest invalid ioctls: \33[32mOK\33[0"..., 34    test
invalid ioctls: OK
) = 34
write(1, "\n", 1
)                       = 1
write(1, "Allow for multiple opens:\n", 26Allow for multiple opens:
) = 26
dup(3)                                  = 4
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 6
close(4)                                = 0
ioctl(6, VIDIOC_QUERYCAP, {driver="uvcvideo", card="USB 2.0 Camera:
USB Camera", bus_info="usb-0000:00:14.0-1", version=KERNEL_VERSION(5,
15, 0), capabilities=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_META_CAPTURE|V4L2_CAP_STREAMING|V4L2_CAP_DEVICE_CAPS,
device_caps=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_STREAMING})
= 0
ioctl(6, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|0 /*
V4L2_CID_??? */ => V4L2_CTRL_CLASS_USER+0x1,
type=V4L2_CTRL_TYPE_CTRL_CLASS, name="User Controls", ...}) = 0
ioctl(6, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_???
*/, count=0}) = 0
ioctl(6, VIDIOC_QUERYCTRL, {id=V4L2_CTRL_FLAG_NEXT_CTRL|0 /*
V4L2_CID_??? */ => V4L2_CTRL_CLASS_USER+0x1,
type=V4L2_CTRL_TYPE_CTRL_CLASS, name="User Controls", ...}) = 0
ioctl(6, VIDIOC_G_SELECTION, 0x7fff4f0d9d9c) = -1 EINVAL (Invalid argument)
write(1, "\ttest second /dev/video0 open: \33"..., 43    test second
/dev/video0 open: OK
) = 43
ioctl(6, VIDIOC_QUERYCAP, NULL)         = -1 EFAULT (Bad address)
ioctl(6, VIDIOC_QUERYCAP, {driver="uvcvideo", card="USB 2.0 Camera:
USB Camera", bus_info="usb-0000:00:14.0-1", version=KERNEL_VERSION(5,
15, 0), capabilities=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_META_CAPTURE|V4L2_CAP_STREAMING|V4L2_CAP_DEVICE_CAPS,
device_caps=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_STREAMING})
= 0
write(1, "\ttest VIDIOC_QUERYCAP: \33[32mOK\33["..., 35    test
VIDIOC_QUERYCAP: OK
) = 35
ioctl(3, VIDIOC_G_PRIORITY, 0x7fff4f0d9f24) = 0
ioctl(6, VIDIOC_G_PRIORITY, 0x7fff4f0d9f24) = 0
ioctl(3, VIDIOC_S_PRIORITY, 0x7fff4f0d9fa0) = 0
ioctl(3, VIDIOC_G_PRIORITY, 0x7fff4f0d9f24) = 0
ioctl(6, VIDIOC_G_PRIORITY, 0x7fff4f0d9f24) = 0
ioctl(6, VIDIOC_S_PRIORITY, 0x7fff4f0d9fa0) = -1 EBUSY (Device or resource busy)
ioctl(3, VIDIOC_S_PRIORITY, 0x7fff4f0d9fa0) = 0
ioctl(3, VIDIOC_G_PRIORITY, 0x7fff4f0d9f24) = 0
ioctl(6, VIDIOC_G_PRIORITY, 0x7fff4f0d9f24) = 0
write(1, "\ttest VIDIOC_G/S_PRIORITY: \33[32m"..., 39    test
VIDIOC_G/S_PRIORITY: OK
) = 39
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 4
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 7
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 8
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 9
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 10
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 11
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 12
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 13
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 14
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 15
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 16
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 17
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 18
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 19
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 20
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 21
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 22
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 23
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 24
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 25
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 26
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 27
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 28
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 29
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 30
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 31
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 32
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 33
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 34
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 35
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 36
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 37
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 38
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 39
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 40
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 41
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 42
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 43
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 44
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 45
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 46
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 47
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 48
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 49
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 50
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 51
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 52
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 53
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 54
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 55
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 56
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 57
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 58
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 59
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 60
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 61
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 62
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 63
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 64
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 65
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 66
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 67
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 68
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 69
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 70
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 71
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 72
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 73
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 74
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 75
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 76
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 77
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 78
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 79
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 80
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 81
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 82
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 83
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 84
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 85
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 86
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 87
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 88
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 89
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 90
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 91
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 92
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 93
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 94
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 95
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 96
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 97
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 98
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 99
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 100
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 101
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 102
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 103
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 104
openat(AT_FDCWD, "/dev/video0", O_RDWR) = 105
close(105)                              = 0
close(104)                              = 0
close(103)                              = 0
close(102)                              = 0
close(101)                              = 0
close(100)                              = 0
close(99)                               = 0
close(98)                               = 0
close(97)                               = 0
close(96)                               = 0
close(95)                               = 0
close(94)                               = 0
close(93)                               = 0
close(92)                               = 0
close(91)                               = 0
close(90)                               = 0
close(89)                               = 0
close(88)                               = 0
close(87)                               = 0
close(86)                               = 0
close(85)                               = 0
close(84)                               = 0
close(83)                               = 0
close(82)                               = 0
close(81)                               = 0
close(80)                               = 0
close(79)                               = 0
close(78)                               = 0
close(77)                               = 0
close(76)                               = 0
close(75)                               = 0
close(74)                               = 0
close(73)                               = 0
close(72)                               = 0
close(71)                               = 0
close(70)                               = 0
close(69)                               = 0
close(68)                               = 0
close(67)                               = 0
close(66)                               = 0
close(65)                               = 0
close(64)                               = 0
close(63)                               = 0
close(62)                               = 0
close(61)                               = 0
close(60)                               = 0
close(59)                               = 0
close(58)                               = 0
close(57)                               = 0
close(56)                               = 0
close(55)                               = 0
close(54)                               = 0
close(53)                               = 0
close(52)                               = 0
close(51)                               = 0
close(50)                               = 0
close(49)                               = 0
close(48)                               = 0
close(47)                               = 0
close(46)                               = 0
close(45)                               = 0
close(44)                               = 0
close(43)                               = 0
close(42)                               = 0
close(41)                               = 0
close(40)                               = 0
close(39)                               = 0
close(38)                               = 0
close(37)                               = 0
close(36)                               = 0
close(35)                               = 0
close(34)                               = 0
close(33)                               = 0
close(32)                               = 0
close(31)                               = 0
close(30)                               = 0
close(29)                               = 0
close(28)                               = 0
close(27)                               = 0
close(26)                               = 0
close(25)                               = 0
close(24)                               = 0
close(23)                               = 0
close(22)                               = 0
close(21)                               = 0
close(20)                               = 0
close(19)                               = 0
close(18)                               = 0
close(17)                               = 0
close(16)                               = 0
close(15)                               = 0
close(14)                               = 0
close(13)                               = 0
close(12)                               = 0
close(11)                               = 0
close(10)                               = 0
close(9)                                = 0
close(8)                                = 0
close(7)                                = 0
close(4)                                = 0
write(1, "\ttest for unlimited opens: \33[32m"..., 39    test for
unlimited opens: OK
) = 39
write(1, "\n", 1
)                       = 1
ioctl(3, VIDIOC_G_INPUT, [0])           = 0
ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
type=V4L2_INPUT_TYPE_CAMERA}) = 0
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(3, VIDIOC_G_SELECTION, 0x7fff4f0da01c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_SELECTION, 0x7fff4f0da01c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
parm.capture={capability=V4L2_CAP_TIMEPERFRAME, capturemode=0,
timeperframe=1/30, extendedmode=0, readbuffers=0}}) = 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|0 /*
V4L2_CID_??? */ => V4L2_CTRL_CLASS_USER+0x1,
type=V4L2_CTRL_TYPE_CTRL_CLASS, name="User Controls", ...}) = 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CTRL_CLASS_USER+0x1
=> V4L2_CID_BRIGHTNESS, type=V4L2_CTRL_TYPE_INTEGER,
name="Brightness", ...}) = 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_BRIGHTNESS
=> V4L2_CID_CONTRAST, type=V4L2_CTRL_TYPE_INTEGER, name="Contrast",
...}) = 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_CONTRAST
=> V4L2_CID_SATURATION, type=V4L2_CTRL_TYPE_INTEGER,
name="Saturation", ...}) = 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_SATURATION
=> V4L2_CID_HUE, type=V4L2_CTRL_TYPE_INTEGER, name="Hue", ...}) = 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_HUE
=> V4L2_CID_AUTO_WHITE_BALANCE, type=V4L2_CTRL_TYPE_BOOLEAN,
name="White Balance, Automatic", ...}) = 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_AUTO_WHITE_BALANCE
=> V4L2_CID_GAMMA, type=V4L2_CTRL_TYPE_INTEGER, name="Gamma", ...}) =
0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_GAMMA
=> V4L2_CID_POWER_LINE_FREQUENCY, type=V4L2_CTRL_TYPE_MENU,
name="Power Line Frequency", ...}) = 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_POWER_LINE_FREQUENCY})
= -1 ETIMEDOUT (Connection timed out)
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_??? */,
count=7, controls=[{id=V4L2_CID_BRIGHTNESS, size=0, value=0,
value64=0}, {id=V4L2_CID_CONTRAST, size=0, value=35, value64=35},
{id=V4L2_CID_SATURATION, size=0, value=62, value64=62},
{id=V4L2_CID_HUE, size=0, value=0, value64=0},
{id=V4L2_CID_AUTO_WHITE_BALANCE, size=0, value=0, value64=0},
{id=V4L2_CID_GAMMA, size=0, value=0, value64=0},
{id=V4L2_CID_POWER_LINE_FREQUENCY, size=0, value=0, value64=0}],
error_idx=3}) = -1 EPIPE (Broken pipe)
rt_sigaction(SIGINT, {sa_handler=0x558d992aabf6, sa_mask=[INT],
sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f5f08dd2420},
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(1, "Debug ioctls:\n", 14Debug ioctls:
)         = 14
getuid()                                = 0
ioctl(3, VIDIOC_DBG_G_REGISTER, 0x7fff4f0d9e18) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_DBG_G/S_REGISTER: \33"..., 59    test
VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
) = 59
ioctl(3, VIDIOC_LOG_STATUS, 0)          = -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_LOG_STATUS: \33[32mOK"..., 53    test
VIDIOC_LOG_STATUS: OK (Not Supported)
) = 53
write(1, "\n", 1
)                       = 1
write(1, "Input ioctls:\n", 14Input ioctls:
)         = 14
ioctl(3, VIDIOC_G_STD, 0x7fff4f0d9e50)  = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_G_TUNER, {index=0})     = -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_G/S_TUNER/ENUM_FREQ"..., 68    test
VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
) = 68
ioctl(3, VIDIOC_G_FREQUENCY, 0x7fff4f0d9e48) = -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_S_FREQUENCY, 0x7fff4f0d9e48) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_G/S_FREQUENCY: \33[32"..., 56    test
VIDIOC_G/S_FREQUENCY: OK (Not Supported)
) = 56
ioctl(3, VIDIOC_S_HW_FREQ_SEEK, 0x7fff4f0d9e94) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_S_HW_FREQ_SEEK: \33[3"..., 57    test
VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
) = 57
ioctl(3, VIDIOC_ENUMAUDIO, 0x7fff4f0d9ef4) = -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_ENUMAUDIO: \33[32mOK\33"..., 52    test
VIDIOC_ENUMAUDIO: OK (Not Supported)
) = 52
ioctl(3, VIDIOC_G_INPUT, [0])           = 0
ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
type=V4L2_INPUT_TYPE_CAMERA}) = 0
ioctl(3, VIDIOC_S_INPUT, [0])           = 0
ioctl(3, VIDIOC_G_SELECTION, 0x7fff4f0d9e78) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUMINPUT, {index=1})   = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_INPUT, [1])           = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_INPUT, [0])           = 0
write(1, "\ttest VIDIOC_G/S/ENUMINPUT: \33[32"..., 40    test
VIDIOC_G/S/ENUMINPUT: OK
) = 40
ioctl(3, VIDIOC_S_INPUT, [0])           = 0
ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
type=V4L2_INPUT_TYPE_CAMERA}) = 0
ioctl(3, VIDIOC_G_AUDIO, 0x7fff4f0d9e84) = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_AUDIO, 0x7fff4f0d9e84) = -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_G/S_AUDIO: \33[32mOK\33"..., 52    test
VIDIOC_G/S_AUDIO: OK (Not Supported)
) = 52
write(1, "\tInputs: 1 Audio Inputs: 0 Tuner"..., 37    Inputs: 1 Audio
Inputs: 0 Tuners: 0
) = 37
write(1, "\n", 1
)                       = 1
write(1, "Output ioctls:\n", 15Output ioctls:
)        = 15
ioctl(3, VIDIOC_G_MODULATOR, 0x7fff4f0d9ec4) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_G/S_MODULATOR: \33[32"..., 56    test
VIDIOC_G/S_MODULATOR: OK (Not Supported)
) = 56
ioctl(3, VIDIOC_G_FREQUENCY, 0x7fff4f0d9ea8) = -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_S_FREQUENCY, 0x7fff4f0d9ea8) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_G/S_FREQUENCY: \33[32"..., 56    test
VIDIOC_G/S_FREQUENCY: OK (Not Supported)
) = 56
ioctl(3, VIDIOC_ENUMAUDOUT, 0x7fff4f0d9ef4) = -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_ENUMAUDOUT: \33[32mOK"..., 53    test
VIDIOC_ENUMAUDOUT: OK (Not Supported)
) = 53
ioctl(3, VIDIOC_G_OUTPUT, 0x7fff4f0d9e78) = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_ENUMOUTPUT, 0x7fff4f0d9ec0) = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_OUTPUT, 0x7fff4f0d9e7c) = -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_G/S/ENUMOUTPUT: \33[3"..., 57    test
VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
) = 57
write(1, "\ttest VIDIOC_G/S_AUDOUT: \33[32mOK"..., 53    test
VIDIOC_G/S_AUDOUT: OK (Not Supported)
) = 53
write(1, "\tOutputs: 0 Audio Outputs: 0 Mod"..., 43    Outputs: 0
Audio Outputs: 0 Modulators: 0
) = 43
write(1, "\n", 1
)                       = 1
write(1, "Input/Output configuration ioctl"..., 35Input/Output
configuration ioctls:
) = 35
ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
type=V4L2_INPUT_TYPE_CAMERA}) = 0
ioctl(3, VIDIOC_S_INPUT, [0])           = 0
ioctl(3, VIDIOC_G_STD, 0x7fff4f0d9dd8)  = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_STD, [0])             = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_STD, [0x3000000])     = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_ENUMSTD, {index=0})     = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_QUERYSTD, 0x7fff4f0d9dd8) = -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_ENUM/G/S/QUERY_STD:"..., 61    test
VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
) = 61
ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
type=V4L2_INPUT_TYPE_CAMERA}) = 0
ioctl(3, VIDIOC_S_INPUT, [0])           = 0
ioctl(3, VIDIOC_G_DV_TIMINGS, 0x7fff4f0d998c) = -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_ENUM_DV_TIMINGS, 0x7fff4f0d9a94) = -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_QUERY_DV_TIMINGS, 0x7fff4f0d998c) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_ENUM/G/S/QUERY_DV_T"..., 68    test
VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
) = 68
ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
type=V4L2_INPUT_TYPE_CAMERA}) = 0
ioctl(3, VIDIOC_S_INPUT, [0])           = 0
ioctl(3, VIDIOC_DV_TIMINGS_CAP, 0x7fff4f0d9da8) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_DV_TIMINGS_CAP: \33[3"..., 57    test
VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
) = 57
ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
type=V4L2_INPUT_TYPE_CAMERA}) = 0
ioctl(3, VIDIOC_S_INPUT, [0])           = 0
ioctl(3, VIDIOC_G_EDID, 0x7fff4f0d1e00) = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_EDID, 0x7fff4f0d1e00) = -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_G/S_EDID: \33[32mOK\33["..., 51    test
VIDIOC_G/S_EDID: OK (Not Supported)
) = 51
write(1, "\n", 1
)                       = 1
ioctl(3, VIDIOC_S_INPUT, [0])           = 0
ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
type=V4L2_INPUT_TYPE_CAMERA}) = 0
write(1, "Control ioctls (Input 0):\n", 26Control ioctls (Input 0):
) = 26
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|0 /*
V4L2_CID_??? */ => V4L2_CTRL_CLASS_USER+0x1,
type=V4L2_CTRL_TYPE_CTRL_CLASS, name="User Controls", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CTRL_CLASS_USER+0x1
=> V4L2_CID_BRIGHTNESS, type=V4L2_CTRL_TYPE_INTEGER,
name="Brightness", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_BRIGHTNESS
=> V4L2_CID_CONTRAST, type=V4L2_CTRL_TYPE_INTEGER, name="Contrast",
...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_CONTRAST
=> V4L2_CID_SATURATION, type=V4L2_CTRL_TYPE_INTEGER,
name="Saturation", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_SATURATION
=> V4L2_CID_HUE, type=V4L2_CTRL_TYPE_INTEGER, name="Hue", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_HUE
=> V4L2_CID_AUTO_WHITE_BALANCE, type=V4L2_CTRL_TYPE_BOOLEAN,
name="White Balance, Automatic", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_AUTO_WHITE_BALANCE
=> V4L2_CID_GAMMA, type=V4L2_CTRL_TYPE_INTEGER, name="Gamma", ...}) =
0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_GAMMA
=> V4L2_CID_POWER_LINE_FREQUENCY, type=V4L2_CTRL_TYPE_MENU,
name="Power Line Frequency", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_POWER_LINE_FREQUENCY
=> V4L2_CID_WHITE_BALANCE_TEMPERATURE, type=V4L2_CTRL_TYPE_INTEGER,
name="White Balance Temperature", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_WHITE_BALANCE_TEMPERATURE
=> V4L2_CID_SHARPNESS, type=V4L2_CTRL_TYPE_INTEGER, name="Sharpness",
...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_SHARPNESS
=> V4L2_CID_BACKLIGHT_COMPENSATION, type=V4L2_CTRL_TYPE_INTEGER,
name="Backlight Compensation", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_BACKLIGHT_COMPENSATION})
= -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CTRL_FLAG_NEXT_CTRL|0 /*
V4L2_CID_??? */ => V4L2_CTRL_CLASS_USER+0x1,
type=V4L2_CTRL_TYPE_CTRL_CLASS, name="User Controls", ...}) = 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_CLASS_USER+0x1 =>
V4L2_CID_BRIGHTNESS, type=V4L2_CTRL_TYPE_INTEGER, name="Brightness",
...}) = 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_BRIGHTNESS => V4L2_CID_CONTRAST,
type=V4L2_CTRL_TYPE_INTEGER, name="Contrast", ...}) = 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_CONTRAST => V4L2_CID_SATURATION,
type=V4L2_CTRL_TYPE_INTEGER, name="Saturation", ...}) = 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_SATURATION => V4L2_CID_HUE,
type=V4L2_CTRL_TYPE_INTEGER, name="Hue", ...}) = 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_HUE =>
V4L2_CID_AUTO_WHITE_BALANCE, type=V4L2_CTRL_TYPE_BOOLEAN, name="White
Balance, Automatic", ...}) = 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_AUTO_WHITE_BALANCE =>
V4L2_CID_GAMMA, type=V4L2_CTRL_TYPE_INTEGER, name="Gamma", ...}) = 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_GAMMA =>
V4L2_CID_POWER_LINE_FREQUENCY, type=V4L2_CTRL_TYPE_MENU, name="Power
Line Frequency", ...}) = 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_POWER_LINE_FREQUENCY =>
V4L2_CID_WHITE_BALANCE_TEMPERATURE, type=V4L2_CTRL_TYPE_INTEGER,
name="White Balance Temperature", ...}) = 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_WHITE_BALANCE_TEMPERATURE =>
V4L2_CID_SHARPNESS, type=V4L2_CTRL_TYPE_INTEGER, name="Sharpness",
...}) = 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_SHARPNESS =>
V4L2_CID_BACKLIGHT_COMPENSATION, type=V4L2_CTRL_TYPE_INTEGER,
name="Backlight Compensation", ...}) = 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_BACKLIGHT_COMPENSATION}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CTRL_FLAG_NEXT_COMPOUND|0 /*
V4L2_CID_??? */}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_BRIGHTNESS,
type=V4L2_CTRL_TYPE_INTEGER, name="Brightness", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_CONTRAST,
type=V4L2_CTRL_TYPE_INTEGER, name="Contrast", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_SATURATION,
type=V4L2_CTRL_TYPE_INTEGER, name="Saturation", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_HUE,
type=V4L2_CTRL_TYPE_INTEGER, name="Hue", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CTRL_CLASS_USER+0x904}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUDIO_VOLUME}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUDIO_BALANCE}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUDIO_BASS}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUDIO_TREBLE}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUDIO_MUTE}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUDIO_LOUDNESS}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_BLACK_LEVEL}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE,
type=V4L2_CTRL_TYPE_BOOLEAN, name="White Balance, Automatic", ...}) =
0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_DO_WHITE_BALANCE}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_RED_BALANCE}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_BLUE_BALANCE}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_GAMMA,
type=V4L2_CTRL_TYPE_INTEGER, name="Gamma", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_EXPOSURE}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUTOGAIN}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_GAIN}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_HFLIP}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_VFLIP}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_HCENTER}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_VCENTER}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY,
type=V4L2_CTRL_TYPE_MENU, name="Power Line Frequency", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_HUE_AUTO}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CID_WHITE_BALANCE_TEMPERATURE, type=V4L2_CTRL_TYPE_INTEGER,
name="White Balance Temperature", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_SHARPNESS,
type=V4L2_CTRL_TYPE_INTEGER, name="Sharpness", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_BACKLIGHT_COMPENSATION,
type=V4L2_CTRL_TYPE_INTEGER, name="Backlight Compensation", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7fff4f0d9d7c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_CHROMA_AGC}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_COLOR_KILLER}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_COLORFX}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUTOBRIGHTNESS}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_BAND_STOP_FILTER}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_ROTATE}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_BG_COLOR}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_CHROMA_GAIN}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_ILLUMINATORS_1}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_ILLUMINATORS_2}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_MIN_BUFFERS_FOR_CAPTURE})
= -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_MIN_BUFFERS_FOR_OUTPUT})
= -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_ALPHA_COMPONENT}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_COLORFX_CBCR}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=0x8000000 /* V4L2_CID_??? */}) =
-1 EINVAL (Invalid argument)
write(1, "\ttest VIDIOC_QUERY_EXT_CTRL/QUER"..., 51    test
VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
) = 51
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CTRL_FLAG_NEXT_CTRL|0 /*
V4L2_CID_??? */ => V4L2_CTRL_CLASS_USER+0x1,
type=V4L2_CTRL_TYPE_CTRL_CLASS, name="User Controls", ...}) = 0
ioctl(3, VIDIOC_QUERYCTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_CLASS_USER+0x1 =>
V4L2_CID_BRIGHTNESS, type=V4L2_CTRL_TYPE_INTEGER, name="Brightness",
...}) = 0
ioctl(3, VIDIOC_QUERYCTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_BRIGHTNESS => V4L2_CID_CONTRAST,
type=V4L2_CTRL_TYPE_INTEGER, name="Contrast", ...}) = 0
ioctl(3, VIDIOC_QUERYCTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_CONTRAST => V4L2_CID_SATURATION,
type=V4L2_CTRL_TYPE_INTEGER, name="Saturation", ...}) = 0
ioctl(3, VIDIOC_QUERYCTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_SATURATION => V4L2_CID_HUE,
type=V4L2_CTRL_TYPE_INTEGER, name="Hue", ...}) = 0
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_HUE
=> V4L2_CID_AUTO_WHITE_BALANCE, type=V4L2_CTRL_TYPE_BOOLEAN,
name="White Balance, Automatic", ...}) = 0
ioctl(3, VIDIOC_QUERYCTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_AUTO_WHITE_BALANCE =>
V4L2_CID_GAMMA, type=V4L2_CTRL_TYPE_INTEGER, name="Gamma", ...}) = 0
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_GAMMA
=> V4L2_CID_POWER_LINE_FREQUENCY, type=V4L2_CTRL_TYPE_MENU,
name="Power Line Frequency", ...}) = 0
ioctl(3, VIDIOC_QUERYCTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_POWER_LINE_FREQUENCY =>
V4L2_CID_WHITE_BALANCE_TEMPERATURE, type=V4L2_CTRL_TYPE_INTEGER,
name="White Balance Temperature", ...}) = 0
ioctl(3, VIDIOC_QUERYCTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_WHITE_BALANCE_TEMPERATURE =>
V4L2_CID_SHARPNESS, type=V4L2_CTRL_TYPE_INTEGER, name="Sharpness",
...}) = 0
ioctl(3, VIDIOC_QUERYCTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_SHARPNESS =>
V4L2_CID_BACKLIGHT_COMPENSATION, type=V4L2_CTRL_TYPE_INTEGER,
name="Backlight Compensation", ...}) = 0
ioctl(3, VIDIOC_QUERYCTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_BACKLIGHT_COMPENSATION}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CTRL_FLAG_NEXT_COMPOUND|0 /*
V4L2_CID_??? */}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_BRIGHTNESS,
type=V4L2_CTRL_TYPE_INTEGER, name="Brightness", ...}) = 0
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_CONTRAST,
type=V4L2_CTRL_TYPE_INTEGER, name="Contrast", ...}) = 0
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_SATURATION,
type=V4L2_CTRL_TYPE_INTEGER, name="Saturation", ...}) = 0
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_HUE,
type=V4L2_CTRL_TYPE_INTEGER, name="Hue", ...}) = 0
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CTRL_CLASS_USER+0x904}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUDIO_VOLUME}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUDIO_BALANCE}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUDIO_BASS}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUDIO_TREBLE}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUDIO_MUTE}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUDIO_LOUDNESS}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_BLACK_LEVEL}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE,
type=V4L2_CTRL_TYPE_BOOLEAN, name="White Balance, Automatic", ...}) =
0
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_DO_WHITE_BALANCE}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_RED_BALANCE}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_BLUE_BALANCE}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_GAMMA,
type=V4L2_CTRL_TYPE_INTEGER, name="Gamma", ...}) = 0
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_EXPOSURE}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUTOGAIN}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_GAIN}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_HFLIP}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_VFLIP}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_HCENTER}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_VCENTER}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY,
type=V4L2_CTRL_TYPE_MENU, name="Power Line Frequency", ...}) = 0
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_HUE_AUTO}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE,
type=V4L2_CTRL_TYPE_INTEGER, name="White Balance Temperature", ...}) =
0
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_SHARPNESS,
type=V4L2_CTRL_TYPE_INTEGER, name="Sharpness", ...}) = 0
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_BACKLIGHT_COMPENSATION,
type=V4L2_CTRL_TYPE_INTEGER, name="Backlight Compensation", ...}) = 0
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_CHROMA_AGC}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_COLOR_KILLER}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_COLORFX}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUTOBRIGHTNESS}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_BAND_STOP_FILTER}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_ROTATE}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_BG_COLOR}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_CHROMA_GAIN}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_ILLUMINATORS_1}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_ILLUMINATORS_2}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_MIN_BUFFERS_FOR_CAPTURE}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_MIN_BUFFERS_FOR_OUTPUT}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_ALPHA_COMPONENT}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_COLORFX_CBCR}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYCTRL, {id=0x8000000 /* V4L2_CID_??? */}) = -1
EINVAL (Invalid argument)
write(1, "\ttest VIDIOC_QUERYCTRL: \33[32mOK\33"..., 36    test
VIDIOC_QUERYCTRL: OK
) = 36
ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CTRL_CLASS_USER+0x1}) = -1 EACCES
(Permission denied)
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CTRL_CLASS_USER+0x1, value=0}) = -1
EACCES (Permission denied)
ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_BRIGHTNESS, value=0}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_BRIGHTNESS, value=0 => 0}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_BRIGHTNESS, value=-65 => -64}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_BRIGHTNESS, value=65 => 64}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_BRIGHTNESS, value=-64 => -64}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_BRIGHTNESS, value=64 => 64}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_BRIGHTNESS, value=0 => 0}) = 0
ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_CONTRAST, value=35}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_CONTRAST, value=35 => 35}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_CONTRAST, value=-1 => 95}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_CONTRAST, value=96 => 95}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_CONTRAST, value=0 => 0}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_CONTRAST, value=95 => 95}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_CONTRAST, value=35 => 35}) = 0
ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_SATURATION, value=62}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_SATURATION, value=62 => 62}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_SATURATION, value=-1 => 128}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_SATURATION, value=129 => 128}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_SATURATION, value=0 => 0}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_SATURATION, value=128 => 128}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_SATURATION, value=62 => 62}) = 0
ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_HUE, value=0}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_HUE, value=0 => 0}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_HUE, value=-2001 => -2000}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_HUE, value=2001 => 2000}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_HUE, value=-2000 => -2000}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_HUE, value=2000 => 2000}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_HUE, value=0 => 0}) = 0
ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=1}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=1 => 1}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=-1 => 0}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=2 => 1}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=0 => 0}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=1 => 1}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=1 => 1}) = 0
ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_GAMMA, value=103}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAMMA, value=103 => 103}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAMMA, value=99 => 100}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAMMA, value=301 => 300}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAMMA, value=100 => 100}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAMMA, value=300 => 300}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAMMA, value=103 => 103}) = 0
ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY, value=1}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY, value=1 => 1}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY, value=-1})
= -1 ERANGE (Numerical result out of range)
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY, value=3}) =
-1 ERANGE (Numerical result out of range)
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY, value=0 => 0}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY, value=1 => 1}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY, value=2 => 2}) = 0
ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE, value=4600}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE,
value=4600}) = -1 EACCES (Permission denied)
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE,
value=2799}) = -1 EACCES (Permission denied)
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE,
value=6501}) = -1 EACCES (Permission denied)
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE,
value=2800}) = -1 EACCES (Permission denied)
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE,
value=6500}) = -1 EACCES (Permission denied)
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE,
value=4600}) = -1 EACCES (Permission denied)
ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_SHARPNESS, value=2}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_SHARPNESS, value=2 => 2}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_SHARPNESS, value=0 => 1}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_SHARPNESS, value=8 => 7}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_SHARPNESS, value=1 => 1}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_SHARPNESS, value=7 => 7}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_SHARPNESS, value=2 => 2}) = 0
ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_BACKLIGHT_COMPENSATION, value=1}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_BACKLIGHT_COMPENSATION, value=1 => 1}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_BACKLIGHT_COMPENSATION, value=-1 => 3}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_BACKLIGHT_COMPENSATION, value=4 => 3}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_BACKLIGHT_COMPENSATION, value=0 => 0}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_BACKLIGHT_COMPENSATION, value=3 => 3}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_BACKLIGHT_COMPENSATION, value=1 => 1}) = 0
ioctl(3, VIDIOC_G_CTRL, {id=0 /* V4L2_CID_??? */}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_S_CTRL, {id=0 /* V4L2_CID_??? */, value=0}) = -1
EINVAL (Invalid argument)
write(1, "\ttest VIDIOC_G/S_CTRL: \33[32mOK\33["..., 35    test
VIDIOC_G/S_CTRL: OK
) = 35
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_??? */,
count=0}) = 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_???
*/, count=0}) = 0
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_??? */,
count=1, controls=[{id=0x980001 /* V4L2_CID_??? */, size=0, value=0,
value64=0}], error_idx=1}) = -1 EACCES (Permission denied)
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_???
*/, count=1, controls=[{id=0x980001 /* V4L2_CID_??? */, size=0,
value=0, value64=0}]} => {controls=[{id=0x980001 /* V4L2_CID_??? */,
size=0, value=0, value64=0}], error_idx=0}) = -1 EACCES (Permission
denied)
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_??? */,
count=1, controls=[{id=0x980001 /* V4L2_CID_??? */, size=0, value=0,
value64=0}]} => {controls=[{id=0x980001 /* V4L2_CID_??? */, size=0,
value=0, value64=0}], error_idx=1}) = -1 EACCES (Permission denied)
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=V4L2_CTRL_CLASS_USER,
count=1, controls=[{id=V4L2_CID_BRIGHTNESS, size=0, value=0,
value64=0}]}) = 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=V4L2_CTRL_CLASS_USER,
count=1, controls=[{id=V4L2_CID_BRIGHTNESS, size=0, value=0,
value64=0}]} => {controls=[{id=V4L2_CID_BRIGHTNESS, size=0, value=0,
value64=0}]}) = 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=V4L2_CTRL_CLASS_USER,
count=1, controls=[{id=V4L2_CID_BRIGHTNESS, size=0, value=0,
value64=0}]} => {controls=[{id=V4L2_CID_BRIGHTNESS, size=0, value=0,
value64=0}]}) = 0
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_??? */,
count=1, controls=[{id=V4L2_CID_CONTRAST, size=0, value=35,
value64=35}]}) = 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_???
*/, count=1, controls=[{id=V4L2_CID_CONTRAST, size=0, value=35,
value64=35}]} => {controls=[{id=V4L2_CID_CONTRAST, size=0, value=35,
value64=35}]}) = 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_??? */,
count=1, controls=[{id=V4L2_CID_CONTRAST, size=0, value=35,
value64=35}]} => {controls=[{id=V4L2_CID_CONTRAST, size=0, value=35,
value64=35}]}) = 0
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=V4L2_CTRL_CLASS_USER,
count=1, controls=[{id=V4L2_CID_SATURATION, size=0, value=62,
value64=62}]}) = 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=V4L2_CTRL_CLASS_USER,
count=1, controls=[{id=V4L2_CID_SATURATION, size=0, value=62,
value64=62}]} => {controls=[{id=V4L2_CID_SATURATION, size=0, value=62,
value64=62}]}) = 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=V4L2_CTRL_CLASS_USER,
count=1, controls=[{id=V4L2_CID_SATURATION, size=0, value=62,
value64=62}]} => {controls=[{id=V4L2_CID_SATURATION, size=0, value=62,
value64=62}]}) = 0
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_??? */,
count=1, controls=[{id=V4L2_CID_HUE, size=0, value=0, value64=0}]}) =
0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_???
*/, count=1, controls=[{id=V4L2_CID_HUE, size=0, value=0, value64=0}]}
=> {controls=[{id=V4L2_CID_HUE, size=0, value=0, value64=0}]}) = 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_??? */,
count=1, controls=[{id=V4L2_CID_HUE, size=0, value=0, value64=0}]} =>
{controls=[{id=V4L2_CID_HUE, size=0, value=0, value64=0}]}) = 0
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=V4L2_CTRL_CLASS_USER,
count=1, controls=[{id=V4L2_CID_AUTO_WHITE_BALANCE, size=0, value=1,
value64=1}]}) = 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=V4L2_CTRL_CLASS_USER,
count=1, controls=[{id=V4L2_CID_AUTO_WHITE_BALANCE, size=0, value=1,
value64=1}]} => {controls=[{id=V4L2_CID_AUTO_WHITE_BALANCE, size=0,
value=1, value64=1}]}) = 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=V4L2_CTRL_CLASS_USER,
count=1, controls=[{id=V4L2_CID_AUTO_WHITE_BALANCE, size=0, value=1,
value64=1}]} => {controls=[{id=V4L2_CID_AUTO_WHITE_BALANCE, size=0,
value=1, value64=1}]}) = 0
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=V4L2_CTRL_CLASS_USER,
count=1, controls=[{id=V4L2_CID_GAMMA, size=0, value=103,
value64=103}]}) = 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=V4L2_CTRL_CLASS_USER,
count=1, controls=[{id=V4L2_CID_GAMMA, size=0, value=103,
value64=103}]} => {controls=[{id=V4L2_CID_GAMMA, size=0, value=103,
value64=103}]}) = 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=V4L2_CTRL_CLASS_USER,
count=1, controls=[{id=V4L2_CID_GAMMA, size=0, value=103,
value64=103}]} => {controls=[{id=V4L2_CID_GAMMA, size=0, value=103,
value64=103}]}) = 0
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=V4L2_CTRL_CLASS_USER,
count=1, controls=[{id=V4L2_CID_POWER_LINE_FREQUENCY, size=0, value=2,
value64=2}]}) = 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=V4L2_CTRL_CLASS_USER,
count=1, controls=[{id=V4L2_CID_POWER_LINE_FREQUENCY, size=0, value=2,
value64=2}]} => {controls=[{id=V4L2_CID_POWER_LINE_FREQUENCY, size=0,
value=2, value64=2}]}) = 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=V4L2_CTRL_CLASS_USER,
count=1, controls=[{id=V4L2_CID_POWER_LINE_FREQUENCY, size=0, value=2,
value64=2}]} => {controls=[{id=V4L2_CID_POWER_LINE_FREQUENCY, size=0,
value=2, value64=2}]}) = 0
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=V4L2_CTRL_CLASS_USER,
count=1, controls=[{id=V4L2_CID_WHITE_BALANCE_TEMPERATURE, size=0,
value=4600, value64=4600}]}) = 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=V4L2_CTRL_CLASS_USER,
count=1, controls=[{id=V4L2_CID_WHITE_BALANCE_TEMPERATURE, size=0,
value=4600, value64=4600}]} =>
{controls=[{id=V4L2_CID_WHITE_BALANCE_TEMPERATURE, size=0, value=4600,
value64=4600}]}) = 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=V4L2_CTRL_CLASS_USER,
count=1, controls=[{id=V4L2_CID_WHITE_BALANCE_TEMPERATURE, size=0,
value=4600, value64=4600}]} =>
{controls=[{id=V4L2_CID_WHITE_BALANCE_TEMPERATURE, size=0, value=4600,
value64=4600}], error_idx=1}) = -1 EACCES (Permission denied)
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_??? */,
count=1, controls=[{id=V4L2_CID_SHARPNESS, size=0, value=2,
value64=2}]}) = 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_???
*/, count=1, controls=[{id=V4L2_CID_SHARPNESS, size=0, value=2,
value64=2}]} => {controls=[{id=V4L2_CID_SHARPNESS, size=0, value=2,
value64=2}]}) = 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_??? */,
count=1, controls=[{id=V4L2_CID_SHARPNESS, size=0, value=2,
value64=2}]} => {controls=[{id=V4L2_CID_SHARPNESS, size=0, value=2,
value64=2}]}) = 0
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=V4L2_CTRL_CLASS_USER,
count=1, controls=[{id=V4L2_CID_BACKLIGHT_COMPENSATION, size=0,
value=1, value64=1}]}) = 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=V4L2_CTRL_CLASS_USER,
count=1, controls=[{id=V4L2_CID_BACKLIGHT_COMPENSATION, size=0,
value=1, value64=1}]} =>
{controls=[{id=V4L2_CID_BACKLIGHT_COMPENSATION, size=0, value=1,
value64=1}]}) = 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=V4L2_CTRL_CLASS_USER,
count=1, controls=[{id=V4L2_CID_BACKLIGHT_COMPENSATION, size=0,
value=1, value64=1}]} =>
{controls=[{id=V4L2_CID_BACKLIGHT_COMPENSATION, size=0, value=1,
value64=1}]}) = 0
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_??? */,
count=1, controls=[{id=0 /* V4L2_CID_??? */, size=0, value=0,
value64=0}], error_idx=1}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_???
*/, count=1, controls=[{id=0 /* V4L2_CID_??? */, size=0, value=0,
value64=0}]} => {controls=[{id=0 /* V4L2_CID_??? */, size=0, value=0,
value64=0}], error_idx=0}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_??? */,
count=1, controls=[{id=0 /* V4L2_CID_??? */, size=0, value=0,
value64=0}]} => {controls=[{id=0 /* V4L2_CID_??? */, size=0, value=0,
value64=0}], error_idx=1}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_??? */,
count=10, controls=[{id=V4L2_CID_BRIGHTNESS, size=0, value=0,
value64=8589934592}, {id=V4L2_CID_CONTRAST, size=0, value=35,
value64=8589934627}, {id=V4L2_CID_SATURATION, size=0, value=62,
value64=8589934654}, {id=V4L2_CID_HUE, size=0, value=0,
value64=8589934592}, {id=V4L2_CID_AUTO_WHITE_BALANCE, size=0, value=1,
value64=8589934593}, {id=V4L2_CID_GAMMA, size=0, value=103,
value64=8589934695}, {id=V4L2_CID_POWER_LINE_FREQUENCY, size=0,
value=2, value64=8589934594}, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE,
size=0, value=4600, value64=8589939192}, {id=V4L2_CID_SHARPNESS,
size=0, value=2, value64=8589934594},
{id=V4L2_CID_BACKLIGHT_COMPENSATION, size=0, value=1,
value64=8589934593}]}) = 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_???
*/, count=10, controls=[{id=V4L2_CID_BRIGHTNESS, size=0, value=0,
value64=8589934592}, {id=V4L2_CID_CONTRAST, size=0, value=35,
value64=8589934627}, {id=V4L2_CID_SATURATION, size=0, value=62,
value64=8589934654}, {id=V4L2_CID_HUE, size=0, value=0,
value64=8589934592}, {id=V4L2_CID_AUTO_WHITE_BALANCE, size=0, value=1,
value64=8589934593}, {id=V4L2_CID_GAMMA, size=0, value=103,
value64=8589934695}, {id=V4L2_CID_POWER_LINE_FREQUENCY, size=0,
value=2, value64=8589934594}, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE,
size=0, value=4600, value64=8589939192}, {id=V4L2_CID_SHARPNESS,
size=0, value=2, value64=8589934594},
{id=V4L2_CID_BACKLIGHT_COMPENSATION, size=0, value=1,
value64=8589934593}]} => {controls=[{id=V4L2_CID_BRIGHTNESS, size=0,
value=0, value64=8589934592}, {id=V4L2_CID_CONTRAST, size=0, value=35,
value64=8589934627}, {id=V4L2_CID_SATURATION, size=0, value=62,
value64=8589934654}, {id=V4L2_CID_HUE, size=0, value=0,
value64=8589934592}, {id=V4L2_CID_AUTO_WHITE_BALANCE, size=0, value=1,
value64=8589934593}, {id=V4L2_CID_GAMMA, size=0, value=103,
value64=8589934695}, {id=V4L2_CID_POWER_LINE_FREQUENCY, size=0,
value=2, value64=8589934594}, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE,
size=0, value=4600, value64=8589939192}, {id=V4L2_CID_SHARPNESS,
size=0, value=2, value64=8589934594},
{id=V4L2_CID_BACKLIGHT_COMPENSATION, size=0, value=1,
value64=8589934593}]}) = 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_??? */,
count=10, controls=[{id=V4L2_CID_BRIGHTNESS, size=0, value=0,
value64=8589934592}, {id=V4L2_CID_CONTRAST, size=0, value=35,
value64=8589934627}, {id=V4L2_CID_SATURATION, size=0, value=62,
value64=8589934654}, {id=V4L2_CID_HUE, size=0, value=0,
value64=8589934592}, {id=V4L2_CID_AUTO_WHITE_BALANCE, size=0, value=1,
value64=8589934593}, {id=V4L2_CID_GAMMA, size=0, value=103,
value64=8589934695}, {id=V4L2_CID_POWER_LINE_FREQUENCY, size=0,
value=2, value64=8589934594}, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE,
size=0, value=4600, value64=8589939192}, {id=V4L2_CID_SHARPNESS,
size=0, value=2, value64=8589934594},
{id=V4L2_CID_BACKLIGHT_COMPENSATION, size=0, value=1,
value64=8589934593}]} => {controls=[{id=V4L2_CID_BRIGHTNESS, size=0,
value=0, value64=8589934592}, {id=V4L2_CID_CONTRAST, size=0, value=35,
value64=8589934627}, {id=V4L2_CID_SATURATION, size=0, value=62,
value64=8589934654}, {id=V4L2_CID_HUE, size=0, value=0,
value64=8589934592}, {id=V4L2_CID_AUTO_WHITE_BALANCE, size=0, value=1,
value64=8589934593}, {id=V4L2_CID_GAMMA, size=0, value=103,
value64=8589934695}, {id=V4L2_CID_POWER_LINE_FREQUENCY, size=0,
value=2, value64=8589934594}, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE,
size=0, value=4600, value64=8589939192}, {id=V4L2_CID_SHARPNESS,
size=0, value=2, value64=8589934594},
{id=V4L2_CID_BACKLIGHT_COMPENSATION, size=0, value=1,
value64=8589934593}], error_idx=10}) = -1 EACCES (Permission denied)
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=V4L2_CTRL_CLASS_USER,
count=10, controls=[{id=V4L2_CID_BRIGHTNESS, size=0, value=0,
value64=8589934592}, {id=V4L2_CID_CONTRAST, size=0, value=35,
value64=8589934627}, {id=V4L2_CID_SATURATION, size=0, value=62,
value64=8589934654}, {id=V4L2_CID_HUE, size=0, value=0,
value64=8589934592}, {id=V4L2_CID_AUTO_WHITE_BALANCE, size=0, value=1,
value64=8589934593}, {id=V4L2_CID_GAMMA, size=0, value=103,
value64=8589934695}, {id=V4L2_CID_POWER_LINE_FREQUENCY, size=0,
value=2, value64=8589934594}, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE,
size=0, value=4600, value64=8589939192}, {id=V4L2_CID_SHARPNESS,
size=0, value=2, value64=8589934594},
{id=V4L2_CID_BACKLIGHT_COMPENSATION, size=0, value=1,
value64=8589934593}]}) = 0
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=V4L2_CTRL_CLASS_USER,
count=10, controls=[{id=V4L2_CID_BRIGHTNESS, size=0, value=0,
value64=8589934592}, {id=V4L2_CID_CONTRAST, size=0, value=35,
value64=8589934627}, {id=V4L2_CID_SATURATION, size=0, value=62,
value64=8589934654}, {id=V4L2_CID_HUE, size=0, value=0,
value64=8589934592}, {id=V4L2_CID_AUTO_WHITE_BALANCE, size=0, value=1,
value64=8589934593}, {id=V4L2_CID_GAMMA, size=0, value=103,
value64=8589934695}, {id=V4L2_CID_POWER_LINE_FREQUENCY, size=0,
value=2, value64=8589934594}, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE,
size=0, value=4600, value64=8589939192}, {id=V4L2_CID_SHARPNESS,
size=0, value=2, value64=8589934594},
{id=V4L2_CID_BACKLIGHT_COMPENSATION, size=0, value=1,
value64=8589934593}]} => {controls=[{id=V4L2_CID_BRIGHTNESS, size=0,
value=0, value64=8589934592}, {id=V4L2_CID_CONTRAST, size=0, value=35,
value64=8589934627}, {id=V4L2_CID_SATURATION, size=0, value=62,
value64=8589934654}, {id=V4L2_CID_HUE, size=0, value=0,
value64=8589934592}, {id=V4L2_CID_AUTO_WHITE_BALANCE, size=0, value=1,
value64=8589934593}, {id=V4L2_CID_GAMMA, size=0, value=103,
value64=8589934695}, {id=V4L2_CID_POWER_LINE_FREQUENCY, size=0,
value=2, value64=8589934594}, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE,
size=0, value=4600, value64=8589939192}, {id=V4L2_CID_SHARPNESS,
size=0, value=2, value64=8589934594},
{id=V4L2_CID_BACKLIGHT_COMPENSATION, size=0, value=1,
value64=8589934593}]}) = 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=V4L2_CTRL_CLASS_USER,
count=10, controls=[{id=V4L2_CID_BRIGHTNESS, size=0, value=0,
value64=8589934592}, {id=V4L2_CID_CONTRAST, size=0, value=35,
value64=8589934627}, {id=V4L2_CID_SATURATION, size=0, value=62,
value64=8589934654}, {id=V4L2_CID_HUE, size=0, value=0,
value64=8589934592}, {id=V4L2_CID_AUTO_WHITE_BALANCE, size=0, value=1,
value64=8589934593}, {id=V4L2_CID_GAMMA, size=0, value=103,
value64=8589934695}, {id=V4L2_CID_POWER_LINE_FREQUENCY, size=0,
value=2, value64=8589934594}, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE,
size=0, value=4600, value64=8589939192}, {id=V4L2_CID_SHARPNESS,
size=0, value=2, value64=8589934594},
{id=V4L2_CID_BACKLIGHT_COMPENSATION, size=0, value=1,
value64=8589934593}]} => {controls=[{id=V4L2_CID_BRIGHTNESS, size=0,
value=0, value64=8589934592}, {id=V4L2_CID_CONTRAST, size=0, value=35,
value64=8589934627}, {id=V4L2_CID_SATURATION, size=0, value=62,
value64=8589934654}, {id=V4L2_CID_HUE, size=0, value=0,
value64=8589934592}, {id=V4L2_CID_AUTO_WHITE_BALANCE, size=0, value=1,
value64=8589934593}, {id=V4L2_CID_GAMMA, size=0, value=103,
value64=8589934695}, {id=V4L2_CID_POWER_LINE_FREQUENCY, size=0,
value=2, value64=8589934594}, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE,
size=0, value=4600, value64=8589939192}, {id=V4L2_CID_SHARPNESS,
size=0, value=2, value64=8589934594},
{id=V4L2_CID_BACKLIGHT_COMPENSATION, size=0, value=1,
value64=8589934593}], error_idx=10}) = -1 EACCES (Permission denied)
write(1, "\t\t\33[1;31mfail\33[0m: v4l2-test-con"..., 95        fail:
v4l2-test-controls.cpp(855): could not set all controls of a specific
class
) = 95
exit_group(1)                           = ?
+++ exited with 1 +++
# dmesg
[   60.410341] usb 3-1: uvc_v4l2_open
[   60.507480] usb 3-1: Resuming interface 0
[   60.507490] usb 3-1: Resuming interface 1
[   60.520935] usb 3-1: uvc_v4l2_release
[   60.597856] usb 3-1: uvc_v4l2_open
[   60.605302] usb 3-1: uvc_v4l2_open
[   60.607569] usb 3-1: uvc_v4l2_open
[   60.607682] usb 3-1: uvc_v4l2_open
[   60.607791] usb 3-1: uvc_v4l2_open
[   60.607901] usb 3-1: uvc_v4l2_open
[   60.608009] usb 3-1: uvc_v4l2_open
[   60.608167] usb 3-1: uvc_v4l2_open
[   60.608331] usb 3-1: uvc_v4l2_open
[   60.608513] usb 3-1: uvc_v4l2_open
[   60.608679] usb 3-1: uvc_v4l2_open
[   60.608832] usb 3-1: uvc_v4l2_open
[   60.608992] usb 3-1: uvc_v4l2_open
[   60.609180] usb 3-1: uvc_v4l2_open
[   60.609295] usb 3-1: uvc_v4l2_open
[   60.609452] usb 3-1: uvc_v4l2_open
[   60.609615] usb 3-1: uvc_v4l2_open
[   60.609779] usb 3-1: uvc_v4l2_open
[   60.609944] usb 3-1: uvc_v4l2_open
[   60.610117] usb 3-1: uvc_v4l2_open
[   60.610307] usb 3-1: uvc_v4l2_open
[   60.610468] usb 3-1: uvc_v4l2_open
[   60.610626] usb 3-1: uvc_v4l2_open
[   60.610790] usb 3-1: uvc_v4l2_open
[   60.610932] usb 3-1: uvc_v4l2_open
[   60.611082] usb 3-1: uvc_v4l2_open
[   60.611244] usb 3-1: uvc_v4l2_open
[   60.611403] usb 3-1: uvc_v4l2_open
[   60.611568] usb 3-1: uvc_v4l2_open
[   60.611732] usb 3-1: uvc_v4l2_open
[   60.611891] usb 3-1: uvc_v4l2_open
[   60.612073] usb 3-1: uvc_v4l2_open
[   60.612239] usb 3-1: uvc_v4l2_open
[   60.612409] usb 3-1: uvc_v4l2_open
[   60.612574] usb 3-1: uvc_v4l2_open
[   60.612716] usb 3-1: uvc_v4l2_open
[   60.612889] usb 3-1: uvc_v4l2_open
[   60.613025] usb 3-1: uvc_v4l2_open
[   60.613194] usb 3-1: uvc_v4l2_open
[   60.613363] usb 3-1: uvc_v4l2_open
[   60.613531] usb 3-1: uvc_v4l2_open
[   60.613689] usb 3-1: uvc_v4l2_open
[   60.613856] usb 3-1: uvc_v4l2_open
[   60.614035] usb 3-1: uvc_v4l2_open
[   60.614230] usb 3-1: uvc_v4l2_open
[   60.614562] usb 3-1: uvc_v4l2_open
[   60.614968] usb 3-1: uvc_v4l2_open
[   60.615177] usb 3-1: uvc_v4l2_open
[   60.615392] usb 3-1: uvc_v4l2_open
[   60.615533] usb 3-1: uvc_v4l2_open
[   60.615719] usb 3-1: uvc_v4l2_open
[   60.615851] usb 3-1: uvc_v4l2_open
[   60.616096] usb 3-1: uvc_v4l2_open
[   60.616333] usb 3-1: uvc_v4l2_open
[   60.616479] usb 3-1: uvc_v4l2_open
[   60.616617] usb 3-1: uvc_v4l2_open
[   60.616784] usb 3-1: uvc_v4l2_open
[   60.616916] usb 3-1: uvc_v4l2_open
[   60.617070] usb 3-1: uvc_v4l2_open
[   60.617288] usb 3-1: uvc_v4l2_open
[   60.617579] usb 3-1: uvc_v4l2_open
[   60.617835] usb 3-1: uvc_v4l2_open
[   60.617985] usb 3-1: uvc_v4l2_open
[   60.618141] usb 3-1: uvc_v4l2_open
[   60.618277] usb 3-1: uvc_v4l2_open
[   60.618410] usb 3-1: uvc_v4l2_open
[   60.618539] usb 3-1: uvc_v4l2_open
[   60.618664] usb 3-1: uvc_v4l2_open
[   60.618785] usb 3-1: uvc_v4l2_open
[   60.618902] usb 3-1: uvc_v4l2_open
[   60.619037] usb 3-1: uvc_v4l2_open
[   60.619157] usb 3-1: uvc_v4l2_open
[   60.619272] usb 3-1: uvc_v4l2_open
[   60.619390] usb 3-1: uvc_v4l2_open
[   60.619504] usb 3-1: uvc_v4l2_open
[   60.619619] usb 3-1: uvc_v4l2_open
[   60.619735] usb 3-1: uvc_v4l2_open
[   60.619849] usb 3-1: uvc_v4l2_open
[   60.619962] usb 3-1: uvc_v4l2_open
[   60.620102] usb 3-1: uvc_v4l2_open
[   60.620218] usb 3-1: uvc_v4l2_open
[   60.620330] usb 3-1: uvc_v4l2_open
[   60.620443] usb 3-1: uvc_v4l2_open
[   60.620559] usb 3-1: uvc_v4l2_open
[   60.620669] usb 3-1: uvc_v4l2_open
[   60.620780] usb 3-1: uvc_v4l2_open
[   60.620896] usb 3-1: uvc_v4l2_open
[   60.621025] usb 3-1: uvc_v4l2_open
[   60.621393] usb 3-1: uvc_v4l2_open
[   60.621586] usb 3-1: uvc_v4l2_open
[   60.621775] usb 3-1: uvc_v4l2_open
[   60.621964] usb 3-1: uvc_v4l2_open
[   60.622189] usb 3-1: uvc_v4l2_open
[   60.622378] usb 3-1: uvc_v4l2_open
[   60.622566] usb 3-1: uvc_v4l2_open
[   60.622753] usb 3-1: uvc_v4l2_open
[   60.622936] usb 3-1: uvc_v4l2_open
[   60.623141] usb 3-1: uvc_v4l2_open
[   60.623330] usb 3-1: uvc_v4l2_open
[   60.623517] usb 3-1: uvc_v4l2_open
[   60.623706] usb 3-1: uvc_v4l2_open
[   60.623893] usb 3-1: uvc_v4l2_open
[   60.624086] usb 3-1: uvc_v4l2_release
[   60.624301] usb 3-1: uvc_v4l2_release
[   60.624473] usb 3-1: uvc_v4l2_release
[   60.624657] usb 3-1: uvc_v4l2_release
[   60.624839] usb 3-1: uvc_v4l2_release
[   60.625055] usb 3-1: uvc_v4l2_release
[   60.625185] usb 3-1: uvc_v4l2_release
[   60.625352] usb 3-1: uvc_v4l2_release
[   60.625562] usb 3-1: uvc_v4l2_release
[   60.625746] usb 3-1: uvc_v4l2_release
[   60.625911] usb 3-1: uvc_v4l2_release
[   60.626090] usb 3-1: uvc_v4l2_release
[   60.626271] usb 3-1: uvc_v4l2_release
[   60.626440] usb 3-1: uvc_v4l2_release
[   60.626597] usb 3-1: uvc_v4l2_release
[   60.626756] usb 3-1: uvc_v4l2_release
[   60.626912] usb 3-1: uvc_v4l2_release
[   60.627094] usb 3-1: uvc_v4l2_release
[   60.627220] usb 3-1: uvc_v4l2_release
[   60.627384] usb 3-1: uvc_v4l2_release
[   60.627539] usb 3-1: uvc_v4l2_release
[   60.627685] usb 3-1: uvc_v4l2_release
[   60.627827] usb 3-1: uvc_v4l2_release
[   60.627966] usb 3-1: uvc_v4l2_release
[   60.628123] usb 3-1: uvc_v4l2_release
[   60.628261] usb 3-1: uvc_v4l2_release
[   60.628397] usb 3-1: uvc_v4l2_release
[   60.628531] usb 3-1: uvc_v4l2_release
[   60.628666] usb 3-1: uvc_v4l2_release
[   60.628802] usb 3-1: uvc_v4l2_release
[   60.628937] usb 3-1: uvc_v4l2_release
[   60.629086] usb 3-1: uvc_v4l2_release
[   60.629222] usb 3-1: uvc_v4l2_release
[   60.629360] usb 3-1: uvc_v4l2_release
[   60.629496] usb 3-1: uvc_v4l2_release
[   60.629629] usb 3-1: uvc_v4l2_release
[   60.629763] usb 3-1: uvc_v4l2_release
[   60.629899] usb 3-1: uvc_v4l2_release
[   60.630050] usb 3-1: uvc_v4l2_release
[   60.630165] usb 3-1: uvc_v4l2_release
[   60.630303] usb 3-1: uvc_v4l2_release
[   60.630437] usb 3-1: uvc_v4l2_release
[   60.630573] usb 3-1: uvc_v4l2_release
[   60.630707] usb 3-1: uvc_v4l2_release
[   60.630842] usb 3-1: uvc_v4l2_release
[   60.630978] usb 3-1: uvc_v4l2_release
[   60.631137] usb 3-1: uvc_v4l2_release
[   60.631273] usb 3-1: uvc_v4l2_release
[   60.631412] usb 3-1: uvc_v4l2_release
[   60.631545] usb 3-1: uvc_v4l2_release
[   60.631680] usb 3-1: uvc_v4l2_release
[   60.631814] usb 3-1: uvc_v4l2_release
[   60.631946] usb 3-1: uvc_v4l2_release
[   60.632097] usb 3-1: uvc_v4l2_release
[   60.632230] usb 3-1: uvc_v4l2_release
[   60.632365] usb 3-1: uvc_v4l2_release
[   60.632496] usb 3-1: uvc_v4l2_release
[   60.632631] usb 3-1: uvc_v4l2_release
[   60.632765] usb 3-1: uvc_v4l2_release
[   60.632900] usb 3-1: uvc_v4l2_release
[   60.633057] usb 3-1: uvc_v4l2_release
[   60.633178] usb 3-1: uvc_v4l2_release
[   60.633330] usb 3-1: uvc_v4l2_release
[   60.633497] usb 3-1: uvc_v4l2_release
[   60.633639] usb 3-1: uvc_v4l2_release
[   60.633788] usb 3-1: uvc_v4l2_release
[   60.633927] usb 3-1: uvc_v4l2_release
[   60.634097] usb 3-1: uvc_v4l2_release
[   60.634245] usb 3-1: uvc_v4l2_release
[   60.634384] usb 3-1: uvc_v4l2_release
[   60.634536] usb 3-1: uvc_v4l2_release
[   60.634685] usb 3-1: uvc_v4l2_release
[   60.634836] usb 3-1: uvc_v4l2_release
[   60.634980] usb 3-1: uvc_v4l2_release
[   60.635141] usb 3-1: uvc_v4l2_release
[   60.635288] usb 3-1: uvc_v4l2_release
[   60.635440] usb 3-1: uvc_v4l2_release
[   60.635603] usb 3-1: uvc_v4l2_release
[   60.635744] usb 3-1: uvc_v4l2_release
[   60.635891] usb 3-1: uvc_v4l2_release
[   60.636065] usb 3-1: uvc_v4l2_release
[   60.636221] usb 3-1: uvc_v4l2_release
[   60.636353] usb 3-1: uvc_v4l2_release
[   60.636526] usb 3-1: uvc_v4l2_release
[   60.636748] usb 3-1: uvc_v4l2_release
[   60.636867] usb 3-1: uvc_v4l2_release
[   60.637055] usb 3-1: uvc_v4l2_release
[   60.637163] usb 3-1: uvc_v4l2_release
[   60.637267] usb 3-1: uvc_v4l2_release
[   60.637441] usb 3-1: uvc_v4l2_release
[   60.637612] usb 3-1: uvc_v4l2_release
[   60.637775] usb 3-1: uvc_v4l2_release
[   60.637941] usb 3-1: uvc_v4l2_release
[   60.638113] usb 3-1: uvc_v4l2_release
[   60.638275] usb 3-1: uvc_v4l2_release
[   60.638435] usb 3-1: uvc_v4l2_release
[   60.638590] usb 3-1: uvc_v4l2_release
[   60.638752] usb 3-1: uvc_v4l2_release
[   60.638914] usb 3-1: uvc_v4l2_release
[   60.639104] usb 3-1: uvc_v4l2_release
[   61.147132] usb 3-1: Failed to query (GET_CUR) UVC control 11 on
unit 2: -110 (exp. 1).
[   61.234277] usb 3-1: Control error 0
[   61.243305] usb 3-1: Control 0x00980001 not found
[   61.248299] usb 3-1: Control 0x00000000 not found
[   61.249406] usb 3-1: Control 0x00980904 not found
[   61.249573] usb 3-1: Control 0x00980905 not found
[   61.249717] usb 3-1: Control 0x00980906 not found
[   61.249844] usb 3-1: Control 0x00980907 not found
[   61.249995] usb 3-1: Control 0x00980908 not found
[   61.250172] usb 3-1: Control 0x00980909 not found
[   61.250295] usb 3-1: Control 0x0098090a not found
[   61.250441] usb 3-1: Control 0x0098090b not found
[   61.250783] usb 3-1: Control 0x0098090d not found
[   61.250905] usb 3-1: Control 0x0098090e not found
[   61.251034] usb 3-1: Control 0x0098090f not found
[   61.251418] usb 3-1: Control 0x00980911 not found
[   61.251562] usb 3-1: Control 0x00980912 not found
[   61.251682] usb 3-1: Control 0x00980913 not found
[   61.251800] usb 3-1: Control 0x00980914 not found
[   61.251917] usb 3-1: Control 0x00980915 not found
[   61.252049] usb 3-1: Control 0x00980916 not found
[   61.252173] usb 3-1: Control 0x00980917 not found
[   61.252926] usb 3-1: Control 0x00980919 not found
[   61.253831] usb 3-1: Control 0x0098091d not found
[   61.253948] usb 3-1: Control 0x0098091e not found
[   61.254107] usb 3-1: Control 0x0098091f not found
[   61.254225] usb 3-1: Control 0x00980920 not found
[   61.254339] usb 3-1: Control 0x00980921 not found
[   61.254456] usb 3-1: Control 0x00980922 not found
[   61.254574] usb 3-1: Control 0x00980923 not found
[   61.254692] usb 3-1: Control 0x00980924 not found
[   61.254810] usb 3-1: Control 0x00980925 not found
[   61.254932] usb 3-1: Control 0x00980926 not found
[   61.255094] usb 3-1: Control 0x00980927 not found
[   61.255243] usb 3-1: Control 0x00980928 not found
[   61.255365] usb 3-1: Control 0x00980929 not found
[   61.255481] usb 3-1: Control 0x0098092a not found
[   61.255613] usb 3-1: Control 0x08000000 not found
[   61.257455] usb 3-1: Control 0x00000000 not found
[   61.258122] usb 3-1: Control 0x00980904 not found
[   61.258243] usb 3-1: Control 0x00980905 not found
[   61.258358] usb 3-1: Control 0x00980906 not found
[   61.258495] usb 3-1: Control 0x00980907 not found
[   61.258612] usb 3-1: Control 0x00980908 not found
[   61.258733] usb 3-1: Control 0x00980909 not found
[   61.258849] usb 3-1: Control 0x0098090a not found
[   61.258963] usb 3-1: Control 0x0098090b not found
[   61.259258] usb 3-1: Control 0x0098090d not found
[   61.259395] usb 3-1: Control 0x0098090e not found
[   61.259574] usb 3-1: Control 0x0098090f not found
[   61.259799] usb 3-1: Control 0x00980911 not found
[   61.259903] usb 3-1: Control 0x00980912 not found
[   61.260010] usb 3-1: Control 0x00980913 not found
[   61.260133] usb 3-1: Control 0x00980914 not found
[   61.260235] usb 3-1: Control 0x00980915 not found
[   61.260339] usb 3-1: Control 0x00980916 not found
[   61.260441] usb 3-1: Control 0x00980917 not found
[   61.260644] usb 3-1: Control 0x00980919 not found
[   61.261066] usb 3-1: Control 0x0098091d not found
[   61.261174] usb 3-1: Control 0x0098091e not found
[   61.261274] usb 3-1: Control 0x0098091f not found
[   61.261375] usb 3-1: Control 0x00980920 not found
[   61.261479] usb 3-1: Control 0x00980921 not found
[   61.261581] usb 3-1: Control 0x00980922 not found
[   61.261680] usb 3-1: Control 0x00980923 not found
[   61.261783] usb 3-1: Control 0x00980924 not found
[   61.261888] usb 3-1: Control 0x00980925 not found
[   61.261987] usb 3-1: Control 0x00980926 not found
[   61.262114] usb 3-1: Control 0x00980927 not found
[   61.262215] usb 3-1: Control 0x00980928 not found
[   61.262318] usb 3-1: Control 0x00980929 not found
[   61.262420] usb 3-1: Control 0x0098092a not found
[   61.262527] usb 3-1: Control 0x08000000 not found
[   61.455809] usb 3-1: Control 2/10 info change len 6
[   61.467786] usb 3-1: Control 2/10 info change len 6
[   61.483773] usb 3-1: Control 2/10 info change len 6
[   61.495788] usb 3-1: Control 2/10 info change len 6
[   61.847218] usb 3-1: Control 0x00000000 not found
[   61.847400] usb 3-1: Control 0x00000000 not found
[   61.934099] usb 3-1: Control 0x00000000 not found
[   61.934274] usb 3-1: Control 0x00000000 not found
[   61.934553] usb 3-1: Control 0x00000000 not found
[   61.943783] usb 3-1: uvc_v4l2_release
[   61.943803] usb 3-1: uvc_v4l2_release

On Fri, Nov 12, 2021 at 2:58 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi James
> On Fri, 12 Nov 2021 at 22:54, James Hilliard <james.hilliard1@gmail.com> wrote:
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > > @James: Can you try this version? Thanks!
> >
> > Yeah, that looks better I think:
>
> Great!, mind replying with a Tested-by: tag?
>
> Thanks!
