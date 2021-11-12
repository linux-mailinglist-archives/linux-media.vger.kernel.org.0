Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8DCE44EFB2
	for <lists+linux-media@lfdr.de>; Fri, 12 Nov 2021 23:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236085AbhKLWuD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Nov 2021 17:50:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236125AbhKLWtx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Nov 2021 17:49:53 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 223C8C06120C
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 14:47:02 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id h12-20020a056830034c00b0055c8458126fso16122115ote.0
        for <linux-media@vger.kernel.org>; Fri, 12 Nov 2021 14:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S+R+AvVAxf/JZtxjDNqtWNIdVFmFsh4apKO2qphjzJI=;
        b=mGJiNxGwlnfJGo40YwfsVOtBnm4WdGgVM0ZcSLEOg//eDkqff3ZwIMjgCTezfS/4oI
         3mGDwTbN81jjhciXfo0+AsYCChRe7ddPL3OKNppkZLyy/seW9wI3HCGON9lf49M3ShnD
         g7WVOHDAUw7CBrbs0SMKKoQFh2PaT/BzqS7+KLY1L5ygIch64cV6Tk1TTL+G5rGNmURH
         k5vceqhqDuNiRir0tkuHCQ+chumBlaqV+L4Ru8FepB/cQkTEGFjY//tOVJ+d1pZwi4pX
         zuRbeeGSUL3JDbQYUNwc8HOdk4qib+5VkdG2cfQ4whgNQVMBAmm8rq3dl7NymzaZWf71
         kBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S+R+AvVAxf/JZtxjDNqtWNIdVFmFsh4apKO2qphjzJI=;
        b=kaldwnaCAeLeH/LT4mpiJW4UR2y4eoZQtZIDfQBjW/7ugLFvgNEPLrJoh/BPDlji79
         2iLkNK9D1CdPOJI3ARg2ufpYzvOP2/mVW3NlJJVzuUJeKGJ3djGne8M7oqi7/euQPpDE
         kFQmov7H5XbzkMUGQdjSjJDpcB4J82C0QT9rLBwLwpJESwVmAs5Y4Lvk517ftYc8jmXb
         UR+7eegopX+Bh5xi5OmwBzC+psaV6Z51+7mvE18375OFcs48b0v2/RR91zb4kEFMQ++i
         ZE9wqFzFm6scqYySwlfo3i7ze+I+KCnr7czFOV0McD/5RTxu7pV/LeltnCMCMWv7yxVK
         I1UA==
X-Gm-Message-State: AOAM532MkIHVgsFBmeQSkRtGK6LWoCTs47PiETYGoTMWdhLAYa4Osg7a
        0O+tRQEpEwEgRE4BBNL7fbPV2YGU32RhE5Xa9ff0fi9d4lw=
X-Google-Smtp-Source: ABdhPJwMMw7Fai4rFXOx1sCwQFbqi3v7/UQyS9jayh3IKevIGKhU/SKYNRorwS5TGeHRHlHkjbv+nDVf/T+yhH9sJY0=
X-Received: by 2002:a9d:7855:: with SMTP id c21mr15275438otm.167.1636757220522;
 Fri, 12 Nov 2021 14:47:00 -0800 (PST)
MIME-Version: 1.0
References: <20211112195710.286151-1-ribalda@chromium.org> <CADvTj4o9zzVJaiWOp=B24zv63jhaW+c45QawGOPc4VsNR2=hZA@mail.gmail.com>
 <CANiDSCsQRUPA1u=vC+7-+KxeUkOTqnpdu3OEMfpmzd8KN7OfSg@mail.gmail.com>
 <CADvTj4oSwupbndes-DMQdAhraWnAJvjkME+DZPh4Sr2TAFO8uQ@mail.gmail.com> <CANiDSCs20iMsh3O2T+jTrRAr4TMajPXeBDVH8Q1HfVBj53y8dQ@mail.gmail.com>
In-Reply-To: <CANiDSCs20iMsh3O2T+jTrRAr4TMajPXeBDVH8Q1HfVBj53y8dQ@mail.gmail.com>
From:   James Hilliard <james.hilliard1@gmail.com>
Date:   Fri, 12 Nov 2021 15:46:49 -0700
Message-ID: <CADvTj4rd5KrOT8UHLmhTQ_KR-bgpQEONfJdaQcugdN_tXKfNrw@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Set the colorspace as sRGB if undefined
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 12, 2021 at 3:24 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi James
>
> could you check if this fixes your issue:

So it's sometimes failing sometimes not failing, even when not failing
I'm seeing
error level messages in dmesg however:

Failing:
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
        white_balance_automatic 0x0098090c (bool)   : default=1 value=0
                          gamma 0x00980910 (int)    : min=100 max=300
step=1 default=103 value=100
           power_line_frequency 0x00980918 (menu)   : min=0 max=2
default=1 value=0 (Disabled)
                0: Disabled
                1: 50 Hz
                2: 60 Hz
      white_balance_temperature 0x0098091a (int)    : min=2800
max=6500 step=1 default=4600 value=4600
                      sharpness 0x0098091b (int)    : min=1 max=7
step=1 default=2 value=2
         backlight_compensation 0x0098091c (int)    : min=0 max=3
step=1 default=1 value=1
# strace -f v4l2-compliance -d /dev/video0 -E
execve("/usr/bin/v4l2-compliance", ["v4l2-compliance", "-d",
"/dev/video0", "-E"], 0x7ffe5e2da480 /* 13 vars */) = 0
brk(NULL)                               = 0x5566ddaf8000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = -1 ENOENT
(No such file or directory)
openat(AT_FDCWD, "/lib64/glibc-hwcaps/x86-64-v2/libv4l2.so.0",
O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/glibc-hwcaps/x86-64-v2", 0x7ffdd17c56e0,
0) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/tls/x86_64/x86_64/libv4l2.so.0",
O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/tls/x86_64/x86_64", 0x7ffdd17c56e0, 0) =
-1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/tls/x86_64/libv4l2.so.0", O_RDONLY|O_CLOEXEC)
= -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/tls/x86_64", 0x7ffdd17c56e0, 0) = -1
ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/tls/x86_64/libv4l2.so.0", O_RDONLY|O_CLOEXEC)
= -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/tls/x86_64", 0x7ffdd17c56e0, 0) = -1
ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/tls/libv4l2.so.0", O_RDONLY|O_CLOEXEC) = -1
ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/tls", 0x7ffdd17c56e0, 0) = -1 ENOENT (No
such file or directory)
openat(AT_FDCWD, "/lib64/x86_64/x86_64/libv4l2.so.0",
O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/x86_64/x86_64", 0x7ffdd17c56e0, 0) = -1
ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/x86_64/libv4l2.so.0", O_RDONLY|O_CLOEXEC) =
-1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/x86_64", 0x7ffdd17c56e0, 0) = -1 ENOENT
(No such file or directory)
openat(AT_FDCWD, "/lib64/x86_64/libv4l2.so.0", O_RDONLY|O_CLOEXEC) =
-1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/x86_64", 0x7ffdd17c56e0, 0) = -1 ENOENT
(No such file or directory)
openat(AT_FDCWD, "/lib64/libv4l2.so.0", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\370\"\0\0\0\0\0\0"...,
832) = 832
pread64(3, "\4\0\0\0
\0\0\0\5\0\0\0GNU\0\1\0\1\300\4\0\0\0\t\0\0\0\0\0\0\0"..., 48, 35072)
= 48
newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=55392, ...}, AT_EMPTY_PATH) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x7fbd58bc2000
mmap(NULL, 57808, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fbd58bb3000
mmap(0x7fbd58bb5000, 20480, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0x7fbd58bb5000
mmap(0x7fbd58bba000, 8192, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x7000) = 0x7fbd58bba000
mmap(0x7fbd58bbc000, 24576, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8000) = 0x7fbd58bbc000
close(3)                                = 0
openat(AT_FDCWD, "/lib64/libv4lconvert.so.0", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\250D\0\0\0\0\0\0"...,
832) = 832
pread64(3, "\4\0\0\0
\0\0\0\5\0\0\0GNU\0\1\0\1\300\4\0\0\0\t\0\0\0\0\0\0\0"..., 48, 126512)
= 48
newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=137440, ...},
AT_EMPTY_PATH) = 0
mmap(NULL, 476256, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fbd58b3e000
mprotect(0x7fbd58b42000, 114688, PROT_NONE) = 0
mmap(0x7fbd58b42000, 73728, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) = 0x7fbd58b42000
mmap(0x7fbd58b54000, 36864, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x16000) = 0x7fbd58b54000
mmap(0x7fbd58b5e000, 12288, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1f000) = 0x7fbd58b5e000
mmap(0x7fbd58b61000, 332896, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7fbd58b61000
close(3)                                = 0
openat(AT_FDCWD, "/lib64/libjpeg.so.8", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0@E\0\0\0\0\0\0"...,
832) = 832
newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=493408, ...},
AT_EMPTY_PATH) = 0
mmap(NULL, 495648, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fbd58ac4000
mmap(0x7fbd58ac8000, 237568, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) = 0x7fbd58ac8000
mmap(0x7fbd58b02000, 237568, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3e000) = 0x7fbd58b02000
mmap(0x7fbd58b3c000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x77000) = 0x7fbd58b3c000
close(3)                                = 0
openat(AT_FDCWD, "/lib64/libstdc++.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\0\214\n\0\0\0\0\0"...,
832) = 832
pread64(3, "\4\0\0\0
\0\0\0\5\0\0\0GNU\0\1\0\1\300\4\0\0\0\v\0\0\0\0\0\0\0"..., 48,
1457064) = 48
newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=1515608, ...},
AT_EMPTY_PATH) = 0
mmap(NULL, 1531392, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fbd5894e000
mmap(0x7fbd589f0000, 524288, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xa2000) = 0x7fbd589f0000
mmap(0x7fbd58a70000, 270336, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x122000) = 0x7fbd58a70000
mmap(0x7fbd58ab2000, 61440, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x163000) = 0x7fbd58ab2000
mmap(0x7fbd58ac1000, 11776, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7fbd58ac1000
close(3)                                = 0
openat(AT_FDCWD, "/lib64/libm.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\340\321\0\0\0\0\0\0"...,
832) = 832
newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=878512, ...},
AT_EMPTY_PATH) = 0
mmap(NULL, 880680, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fbd58876000
mprotect(0x7fbd58883000, 823296, PROT_NONE) = 0
mmap(0x7fbd58883000, 442368, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xd000) = 0x7fbd58883000
mmap(0x7fbd588ef000, 376832, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x79000) = 0x7fbd588ef000
mmap(0x7fbd5894c000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xd5000) = 0x7fbd5894c000
close(3)                                = 0
openat(AT_FDCWD, "/lib64/libgcc_s.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\3702\0\0\0\0\0\0"...,
832) = 832
pread64(3, "\4\0\0\0
\0\0\0\5\0\0\0GNU\0\1\0\1\300\4\0\0\0\v\0\0\0\0\0\0\0"..., 48, 71408)
= 48
newfstatat(3, "", {st_mode=S_IFREG|0644, st_size=76144, ...}, AT_EMPTY_PATH) = 0
mmap(NULL, 78856, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fbd58862000
mmap(0x7fbd58865000, 49152, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3000) = 0x7fbd58865000
mmap(0x7fbd58871000, 12288, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xf000) = 0x7fbd58871000
mmap(0x7fbd58874000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x11000) = 0x7fbd58874000
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
0) = 0x7fbd58860000
pread64(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"...,
784, 64) = 784
mmap(NULL, 2075760, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fbd58665000
mprotect(0x7fbd5868d000, 1835008, PROT_NONE) = 0
mmap(0x7fbd5868d000, 1466368, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x28000) = 0x7fbd5868d000
mmap(0x7fbd587f3000, 364544, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x18e000) = 0x7fbd587f3000
mmap(0x7fbd5884d000, 24576, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1e7000) = 0x7fbd5884d000
mmap(0x7fbd58853000, 52336, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7fbd58853000
close(3)                                = 0
mmap(NULL, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x7fbd58662000
arch_prctl(ARCH_SET_FS, 0x7fbd58662740) = 0
set_tid_address(0x7fbd58662a10)         = 522
set_robust_list(0x7fbd58662a20, 24)     = 0
mprotect(0x7fbd5884d000, 16384, PROT_READ) = 0
mprotect(0x7fbd58874000, 4096, PROT_READ) = 0
mprotect(0x7fbd5894c000, 4096, PROT_READ) = 0
mprotect(0x7fbd58ab2000, 45056, PROT_READ) = 0
mprotect(0x7fbd58b3c000, 4096, PROT_READ) = 0
mprotect(0x7fbd58b5e000, 8192, PROT_READ) = 0
mprotect(0x7fbd58bbc000, 4096, PROT_READ) = 0
mprotect(0x5566dc11d000, 8192, PROT_READ) = 0
mprotect(0x7fbd58bf3000, 8192, PROT_READ) = 0
prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=8192*1024,
rlim_max=RLIM64_INFINITY}) = 0
getrandom("\xfc\xce\xbc\x05\xbf\x4c\xd5\x0b", 8, GRND_NONBLOCK) = 8
brk(NULL)                               = 0x5566ddaf8000
brk(0x5566ddb19000)                     = 0x5566ddb19000
futex(0x7fbd58ac1cbc, FUTEX_WAKE_PRIVATE, 2147483647) = 0
futex(0x7fbd58ac1cc8, FUTEX_WAKE_PRIVATE, 2147483647) = 0
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
ioctl(3, VIDIOC_G_SELECTION, 0x7ffdd17c4dcc) = -1 EINVAL (Invalid argument)
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
getdents64(4, 0x5566ddb0a500 /* 26 entries */, 32768) = 936
openat(AT_FDCWD, "/dev/media0", O_RDWR) = 5
close(4)                                = 0
ioctl(5, MEDIA_IOC_DEVICE_INFO, 0x7ffdd17c43c8) = 0
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
ioctl(5, MEDIA_IOC_DEVICE_INFO, 0x7ffdd17c3fc8) = 0
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
ioctl(5, MEDIA_IOC_G_TOPOLOGY, 0x7ffdd17c3ea8) = 0
ioctl(5, MEDIA_IOC_G_TOPOLOGY, 0x7ffdd17c3ea8) = 0
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
ioctl(5, MEDIA_IOC_ENUM_ENTITIES, 0x7ffdd17c51a0) = 0
ioctl(5, MEDIA_IOC_ENUM_LINKS, 0x7ffdd17c43c8) = 0
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
ioctl(3, _IOC(_IOC_READ, 0x56, 0, 0x3fff), 0x7ffdd17c01e8) = -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, _IOC(_IOC_WRITE, 0x56, 0, 0x3fff), 0x7ffdd17c01e8) = -1
ENOTTY (Inappropriate ioctl for device)
ioctl(3, _IOC(_IOC_READ|_IOC_WRITE, 0x56, 0, 0x3fff), 0x7ffdd17c01e8)
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
ioctl(6, VIDIOC_G_SELECTION, 0x7ffdd17c405c) = -1 EINVAL (Invalid argument)
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
ioctl(3, VIDIOC_G_PRIORITY, 0x7ffdd17c41e4) = 0
ioctl(6, VIDIOC_G_PRIORITY, 0x7ffdd17c41e4) = 0
ioctl(3, VIDIOC_S_PRIORITY, 0x7ffdd17c4260) = 0
ioctl(3, VIDIOC_G_PRIORITY, 0x7ffdd17c41e4) = 0
ioctl(6, VIDIOC_G_PRIORITY, 0x7ffdd17c41e4) = 0
ioctl(6, VIDIOC_S_PRIORITY, 0x7ffdd17c4260) = -1 EBUSY (Device or resource busy)
ioctl(3, VIDIOC_S_PRIORITY, 0x7ffdd17c4260) = 0
ioctl(3, VIDIOC_G_PRIORITY, 0x7ffdd17c41e4) = 0
ioctl(6, VIDIOC_G_PRIORITY, 0x7ffdd17c41e4) = 0
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
ioctl(3, VIDIOC_G_SELECTION, 0x7ffdd17c42dc) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_SELECTION, 0x7ffdd17c42dc) = -1 EINVAL (Invalid argument)
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
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_POWER_LINE_FREQUENCY
=> V4L2_CID_WHITE_BALANCE_TEMPERATURE, type=V4L2_CTRL_TYPE_INTEGER,
name="White Balance Temperature", ...}) = 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_WHITE_BALANCE_TEMPERATURE
=> V4L2_CID_SHARPNESS, type=V4L2_CTRL_TYPE_INTEGER, name="Sharpness",
...}) = 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_SHARPNESS
=> V4L2_CID_BACKLIGHT_COMPENSATION, type=V4L2_CTRL_TYPE_INTEGER,
name="Backlight Compensation", ...}) = 0
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_BACKLIGHT_COMPENSATION})
= -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_??? */,
count=10, controls=[{id=V4L2_CID_BRIGHTNESS, size=0, value=0,
value64=0}, {id=V4L2_CID_CONTRAST, size=0, value=35, value64=35},
{id=V4L2_CID_SATURATION, size=0, value=62, value64=62},
{id=V4L2_CID_HUE, size=0, value=0, value64=0},
{id=V4L2_CID_AUTO_WHITE_BALANCE, size=0, value=0, value64=0},
{id=V4L2_CID_GAMMA, size=0, value=0, value64=0},
{id=V4L2_CID_POWER_LINE_FREQUENCY, size=0, value=0, value64=0},
{id=V4L2_CID_WHITE_BALANCE_TEMPERATURE, size=0, value=0, value64=0},
{id=V4L2_CID_SHARPNESS, size=0, value=0, value64=0},
{id=V4L2_CID_BACKLIGHT_COMPENSATION, size=0, value=0, value64=0}],
error_idx=3}) = -1 ETIMEDOUT (Connection timed out)
rt_sigaction(SIGINT, {sa_handler=0x5566dc0c5bf6, sa_mask=[INT],
sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7fbd586a2420},
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(1, "Debug ioctls:\n", 14Debug ioctls:
)         = 14
getuid()                                = 0
ioctl(3, VIDIOC_DBG_G_REGISTER, 0x7ffdd17c40d8) = -1 ENOTTY
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
ioctl(3, VIDIOC_G_STD, 0x7ffdd17c4110)  = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_G_TUNER, {index=0})     = -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_G/S_TUNER/ENUM_FREQ"..., 68    test
VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
) = 68
ioctl(3, VIDIOC_G_FREQUENCY, 0x7ffdd17c4108) = -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_S_FREQUENCY, 0x7ffdd17c4108) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_G/S_FREQUENCY: \33[32"..., 56    test
VIDIOC_G/S_FREQUENCY: OK (Not Supported)
) = 56
ioctl(3, VIDIOC_S_HW_FREQ_SEEK, 0x7ffdd17c4154) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_S_HW_FREQ_SEEK: \33[3"..., 57    test
VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
) = 57
ioctl(3, VIDIOC_ENUMAUDIO, 0x7ffdd17c41b4) = -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_ENUMAUDIO: \33[32mOK\33"..., 52    test
VIDIOC_ENUMAUDIO: OK (Not Supported)
) = 52
ioctl(3, VIDIOC_G_INPUT, [0])           = 0
ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
type=V4L2_INPUT_TYPE_CAMERA}) = 0
ioctl(3, VIDIOC_S_INPUT, [0])           = 0
ioctl(3, VIDIOC_G_SELECTION, 0x7ffdd17c4138) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUMINPUT, {index=1})   = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_INPUT, [1])           = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_INPUT, [0])           = 0
write(1, "\ttest VIDIOC_G/S/ENUMINPUT: \33[32"..., 40    test
VIDIOC_G/S/ENUMINPUT: OK
) = 40
ioctl(3, VIDIOC_S_INPUT, [0])           = 0
ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
type=V4L2_INPUT_TYPE_CAMERA}) = 0
ioctl(3, VIDIOC_G_AUDIO, 0x7ffdd17c4144) = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_AUDIO, 0x7ffdd17c4144) = -1 ENOTTY (Inappropriate
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
ioctl(3, VIDIOC_G_MODULATOR, 0x7ffdd17c4184) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_G/S_MODULATOR: \33[32"..., 56    test
VIDIOC_G/S_MODULATOR: OK (Not Supported)
) = 56
ioctl(3, VIDIOC_G_FREQUENCY, 0x7ffdd17c4168) = -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_S_FREQUENCY, 0x7ffdd17c4168) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_G/S_FREQUENCY: \33[32"..., 56    test
VIDIOC_G/S_FREQUENCY: OK (Not Supported)
) = 56
ioctl(3, VIDIOC_ENUMAUDOUT, 0x7ffdd17c41b4) = -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_ENUMAUDOUT: \33[32mOK"..., 53    test
VIDIOC_ENUMAUDOUT: OK (Not Supported)
) = 53
ioctl(3, VIDIOC_G_OUTPUT, 0x7ffdd17c4138) = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_ENUMOUTPUT, 0x7ffdd17c4180) = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_OUTPUT, 0x7ffdd17c413c) = -1 ENOTTY (Inappropriate
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
ioctl(3, VIDIOC_G_STD, 0x7ffdd17c4098)  = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_STD, [0])             = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_STD, [0x3000000])     = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_ENUMSTD, {index=0})     = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_QUERYSTD, 0x7ffdd17c4098) = -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_ENUM/G/S/QUERY_STD:"..., 61    test
VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
) = 61
ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
type=V4L2_INPUT_TYPE_CAMERA}) = 0
ioctl(3, VIDIOC_S_INPUT, [0])           = 0
ioctl(3, VIDIOC_G_DV_TIMINGS, 0x7ffdd17c3c4c) = -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_ENUM_DV_TIMINGS, 0x7ffdd17c3d54) = -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_QUERY_DV_TIMINGS, 0x7ffdd17c3c4c) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_ENUM/G/S/QUERY_DV_T"..., 68    test
VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
) = 68
ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
type=V4L2_INPUT_TYPE_CAMERA}) = 0
ioctl(3, VIDIOC_S_INPUT, [0])           = 0
ioctl(3, VIDIOC_DV_TIMINGS_CAP, 0x7ffdd17c4068) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_DV_TIMINGS_CAP: \33[3"..., 57    test
VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
) = 57
ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
type=V4L2_INPUT_TYPE_CAMERA}) = 0
ioctl(3, VIDIOC_S_INPUT, [0])           = 0
ioctl(3, VIDIOC_G_EDID, 0x7ffdd17bc0c0) = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_EDID, 0x7ffdd17bc0c0) = -1 ENOTTY (Inappropriate
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
ioctl(3, VIDIOC_QUERYMENU, 0x7ffdd17c403c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CTRL_CLASS_USER+0x1
=> V4L2_CID_BRIGHTNESS, type=V4L2_CTRL_TYPE_INTEGER,
name="Brightness", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffdd17c403c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_BRIGHTNESS
=> V4L2_CID_CONTRAST, type=V4L2_CTRL_TYPE_INTEGER, name="Contrast",
...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffdd17c403c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_CONTRAST
=> V4L2_CID_SATURATION, type=V4L2_CTRL_TYPE_INTEGER,
name="Saturation", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffdd17c403c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_SATURATION
=> V4L2_CID_HUE, type=V4L2_CTRL_TYPE_INTEGER, name="Hue", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffdd17c403c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_HUE
=> V4L2_CID_AUTO_WHITE_BALANCE, type=V4L2_CTRL_TYPE_BOOLEAN,
name="White Balance, Automatic", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffdd17c403c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_AUTO_WHITE_BALANCE
=> V4L2_CID_GAMMA, type=V4L2_CTRL_TYPE_INTEGER, name="Gamma", ...}) =
0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffdd17c403c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_GAMMA
=> V4L2_CID_POWER_LINE_FREQUENCY, type=V4L2_CTRL_TYPE_MENU,
name="Power Line Frequency", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffdd17c403c) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffdd17c403c) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffdd17c403c) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffdd17c403c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_POWER_LINE_FREQUENCY})
= -1 EPROTO (Protocol error)
write(1, "\t\t\33[1;31mfail\33[0m: v4l2-test-con"..., 88        fail:
v4l2-test-controls.cpp(197): invalid query_ext_ctrl return code (71)
) = 88
exit_group(1)                           = ?
+++ exited with 1 +++
# dmesg
[  113.523212] usb 3-1: uvc_v4l2_open
[  113.619854] usb 3-1: Resuming interface 0
[  113.619866] usb 3-1: Resuming interface 1
[  113.626588] usb 3-1: uvc_v4l2_release
[  113.646490] usb 3-1: uvc_v4l2_open
[  113.653382] usb 3-1: uvc_v4l2_open
[  113.656269] usb 3-1: uvc_v4l2_open
[  113.656380] usb 3-1: uvc_v4l2_open
[  113.656484] usb 3-1: uvc_v4l2_open
[  113.656584] usb 3-1: uvc_v4l2_open
[  113.656763] usb 3-1: uvc_v4l2_open
[  113.656901] usb 3-1: uvc_v4l2_open
[  113.657080] usb 3-1: uvc_v4l2_open
[  113.657246] usb 3-1: uvc_v4l2_open
[  113.657403] usb 3-1: uvc_v4l2_open
[  113.657563] usb 3-1: uvc_v4l2_open
[  113.657706] usb 3-1: uvc_v4l2_open
[  113.657837] usb 3-1: uvc_v4l2_open
[  113.657969] usb 3-1: uvc_v4l2_open
[  113.658154] usb 3-1: uvc_v4l2_open
[  113.658331] usb 3-1: uvc_v4l2_open
[  113.658512] usb 3-1: uvc_v4l2_open
[  113.658695] usb 3-1: uvc_v4l2_open
[  113.658837] usb 3-1: uvc_v4l2_open
[  113.659010] usb 3-1: uvc_v4l2_open
[  113.659195] usb 3-1: uvc_v4l2_open
[  113.659361] usb 3-1: uvc_v4l2_open
[  113.659520] usb 3-1: uvc_v4l2_open
[  113.659712] usb 3-1: uvc_v4l2_open
[  113.659869] usb 3-1: uvc_v4l2_open
[  113.660033] usb 3-1: uvc_v4l2_open
[  113.660198] usb 3-1: uvc_v4l2_open
[  113.660358] usb 3-1: uvc_v4l2_open
[  113.660518] usb 3-1: uvc_v4l2_open
[  113.660696] usb 3-1: uvc_v4l2_open
[  113.660862] usb 3-1: uvc_v4l2_open
[  113.661031] usb 3-1: uvc_v4l2_open
[  113.661192] usb 3-1: uvc_v4l2_open
[  113.661353] usb 3-1: uvc_v4l2_open
[  113.661514] usb 3-1: uvc_v4l2_open
[  113.661704] usb 3-1: uvc_v4l2_open
[  113.661874] usb 3-1: uvc_v4l2_open
[  113.662032] usb 3-1: uvc_v4l2_open
[  113.662192] usb 3-1: uvc_v4l2_open
[  113.662356] usb 3-1: uvc_v4l2_open
[  113.662509] usb 3-1: uvc_v4l2_open
[  113.662688] usb 3-1: uvc_v4l2_open
[  113.662841] usb 3-1: uvc_v4l2_open
[  113.662990] usb 3-1: uvc_v4l2_open
[  113.663120] usb 3-1: uvc_v4l2_open
[  113.663293] usb 3-1: uvc_v4l2_open
[  113.663464] usb 3-1: uvc_v4l2_open
[  113.663646] usb 3-1: uvc_v4l2_open
[  113.663812] usb 3-1: uvc_v4l2_open
[  113.663980] usb 3-1: uvc_v4l2_open
[  113.664135] usb 3-1: uvc_v4l2_open
[  113.664298] usb 3-1: uvc_v4l2_open
[  113.664463] usb 3-1: uvc_v4l2_open
[  113.664637] usb 3-1: uvc_v4l2_open
[  113.664828] usb 3-1: uvc_v4l2_open
[  113.664986] usb 3-1: uvc_v4l2_open
[  113.665145] usb 3-1: uvc_v4l2_open
[  113.665307] usb 3-1: uvc_v4l2_open
[  113.665469] usb 3-1: uvc_v4l2_open
[  113.665652] usb 3-1: uvc_v4l2_open
[  113.665815] usb 3-1: uvc_v4l2_open
[  113.665977] usb 3-1: uvc_v4l2_open
[  113.666140] usb 3-1: uvc_v4l2_open
[  113.666290] usb 3-1: uvc_v4l2_open
[  113.666464] usb 3-1: uvc_v4l2_open
[  113.666642] usb 3-1: uvc_v4l2_open
[  113.666820] usb 3-1: uvc_v4l2_open
[  113.666988] usb 3-1: uvc_v4l2_open
[  113.667157] usb 3-1: uvc_v4l2_open
[  113.667294] usb 3-1: uvc_v4l2_open
[  113.667421] usb 3-1: uvc_v4l2_open
[  113.667554] usb 3-1: uvc_v4l2_open
[  113.667695] usb 3-1: uvc_v4l2_open
[  113.667826] usb 3-1: uvc_v4l2_open
[  113.667956] usb 3-1: uvc_v4l2_open
[  113.668086] usb 3-1: uvc_v4l2_open
[  113.668217] usb 3-1: uvc_v4l2_open
[  113.668375] usb 3-1: uvc_v4l2_open
[  113.668559] usb 3-1: uvc_v4l2_open
[  113.668691] usb 3-1: uvc_v4l2_open
[  113.668827] usb 3-1: uvc_v4l2_open
[  113.668974] usb 3-1: uvc_v4l2_open
[  113.669161] usb 3-1: uvc_v4l2_open
[  113.669342] usb 3-1: uvc_v4l2_open
[  113.669506] usb 3-1: uvc_v4l2_open
[  113.669691] usb 3-1: uvc_v4l2_open
[  113.669880] usb 3-1: uvc_v4l2_open
[  113.670046] usb 3-1: uvc_v4l2_open
[  113.670207] usb 3-1: uvc_v4l2_open
[  113.670366] usb 3-1: uvc_v4l2_open
[  113.670530] usb 3-1: uvc_v4l2_open
[  113.670704] usb 3-1: uvc_v4l2_open
[  113.670866] usb 3-1: uvc_v4l2_open
[  113.671026] usb 3-1: uvc_v4l2_open
[  113.671182] usb 3-1: uvc_v4l2_open
[  113.671344] usb 3-1: uvc_v4l2_open
[  113.671498] usb 3-1: uvc_v4l2_open
[  113.671672] usb 3-1: uvc_v4l2_open
[  113.671839] usb 3-1: uvc_v4l2_open
[  113.672025] usb 3-1: uvc_v4l2_open
[  113.672192] usb 3-1: uvc_v4l2_open
[  113.672356] usb 3-1: uvc_v4l2_release
[  113.672527] usb 3-1: uvc_v4l2_release
[  113.672710] usb 3-1: uvc_v4l2_release
[  113.672870] usb 3-1: uvc_v4l2_release
[  113.673031] usb 3-1: uvc_v4l2_release
[  113.673183] usb 3-1: uvc_v4l2_release
[  113.673344] usb 3-1: uvc_v4l2_release
[  113.673510] usb 3-1: uvc_v4l2_release
[  113.673686] usb 3-1: uvc_v4l2_release
[  113.673870] usb 3-1: uvc_v4l2_release
[  113.674027] usb 3-1: uvc_v4l2_release
[  113.674180] usb 3-1: uvc_v4l2_release
[  113.674342] usb 3-1: uvc_v4l2_release
[  113.674500] usb 3-1: uvc_v4l2_release
[  113.674680] usb 3-1: uvc_v4l2_release
[  113.674840] usb 3-1: uvc_v4l2_release
[  113.675000] usb 3-1: uvc_v4l2_release
[  113.675160] usb 3-1: uvc_v4l2_release
[  113.675322] usb 3-1: uvc_v4l2_release
[  113.675479] usb 3-1: uvc_v4l2_release
[  113.675653] usb 3-1: uvc_v4l2_release
[  113.675754] usb 3-1: uvc_v4l2_release
[  113.675846] usb 3-1: uvc_v4l2_release
[  113.675940] usb 3-1: uvc_v4l2_release
[  113.676037] usb 3-1: uvc_v4l2_release
[  113.676132] usb 3-1: uvc_v4l2_release
[  113.676227] usb 3-1: uvc_v4l2_release
[  113.676325] usb 3-1: uvc_v4l2_release
[  113.676422] usb 3-1: uvc_v4l2_release
[  113.676515] usb 3-1: uvc_v4l2_release
[  113.676627] usb 3-1: uvc_v4l2_release
[  113.676725] usb 3-1: uvc_v4l2_release
[  113.676819] usb 3-1: uvc_v4l2_release
[  113.676913] usb 3-1: uvc_v4l2_release
[  113.677007] usb 3-1: uvc_v4l2_release
[  113.677100] usb 3-1: uvc_v4l2_release
[  113.677193] usb 3-1: uvc_v4l2_release
[  113.677288] usb 3-1: uvc_v4l2_release
[  113.677382] usb 3-1: uvc_v4l2_release
[  113.677475] usb 3-1: uvc_v4l2_release
[  113.677567] usb 3-1: uvc_v4l2_release
[  113.677678] usb 3-1: uvc_v4l2_release
[  113.677774] usb 3-1: uvc_v4l2_release
[  113.677869] usb 3-1: uvc_v4l2_release
[  113.677961] usb 3-1: uvc_v4l2_release
[  113.678055] usb 3-1: uvc_v4l2_release
[  113.678150] usb 3-1: uvc_v4l2_release
[  113.678241] usb 3-1: uvc_v4l2_release
[  113.678337] usb 3-1: uvc_v4l2_release
[  113.678431] usb 3-1: uvc_v4l2_release
[  113.678526] usb 3-1: uvc_v4l2_release
[  113.678632] usb 3-1: uvc_v4l2_release
[  113.678729] usb 3-1: uvc_v4l2_release
[  113.678823] usb 3-1: uvc_v4l2_release
[  113.678918] usb 3-1: uvc_v4l2_release
[  113.679010] usb 3-1: uvc_v4l2_release
[  113.679102] usb 3-1: uvc_v4l2_release
[  113.679200] usb 3-1: uvc_v4l2_release
[  113.679293] usb 3-1: uvc_v4l2_release
[  113.679387] usb 3-1: uvc_v4l2_release
[  113.679481] usb 3-1: uvc_v4l2_release
[  113.679574] usb 3-1: uvc_v4l2_release
[  113.679690] usb 3-1: uvc_v4l2_release
[  113.679865] usb 3-1: uvc_v4l2_release
[  113.680024] usb 3-1: uvc_v4l2_release
[  113.680120] usb 3-1: uvc_v4l2_release
[  113.680216] usb 3-1: uvc_v4l2_release
[  113.680310] usb 3-1: uvc_v4l2_release
[  113.680422] usb 3-1: uvc_v4l2_release
[  113.680521] usb 3-1: uvc_v4l2_release
[  113.680634] usb 3-1: uvc_v4l2_release
[  113.680733] usb 3-1: uvc_v4l2_release
[  113.680828] usb 3-1: uvc_v4l2_release
[  113.680923] usb 3-1: uvc_v4l2_release
[  113.681019] usb 3-1: uvc_v4l2_release
[  113.681117] usb 3-1: uvc_v4l2_release
[  113.681209] usb 3-1: uvc_v4l2_release
[  113.681302] usb 3-1: uvc_v4l2_release
[  113.681396] usb 3-1: uvc_v4l2_release
[  113.681492] usb 3-1: uvc_v4l2_release
[  113.681588] usb 3-1: uvc_v4l2_release
[  113.681698] usb 3-1: uvc_v4l2_release
[  113.681793] usb 3-1: uvc_v4l2_release
[  113.681886] usb 3-1: uvc_v4l2_release
[  113.681979] usb 3-1: uvc_v4l2_release
[  113.682076] usb 3-1: uvc_v4l2_release
[  113.682173] usb 3-1: uvc_v4l2_release
[  113.682265] usb 3-1: uvc_v4l2_release
[  113.682362] usb 3-1: uvc_v4l2_release
[  113.682456] usb 3-1: uvc_v4l2_release
[  113.682548] usb 3-1: uvc_v4l2_release
[  113.682658] usb 3-1: uvc_v4l2_release
[  113.682753] usb 3-1: uvc_v4l2_release
[  113.682849] usb 3-1: uvc_v4l2_release
[  113.682944] usb 3-1: uvc_v4l2_release
[  113.683038] usb 3-1: uvc_v4l2_release
[  113.683133] usb 3-1: uvc_v4l2_release
[  113.683230] usb 3-1: uvc_v4l2_release
[  113.683322] usb 3-1: uvc_v4l2_release
[  113.683419] usb 3-1: uvc_v4l2_release
[  114.189726] usb 3-1: Failed to query (GET_CUR) UVC control 6 on
unit 2: -110 (exp. 2).
[  114.199248] usb 3-1: Control 0x00980001 not found
[  114.354901] usb 3-1: Failed to query (GET_CUR) UVC control 11 on
unit 2: -71 (exp. 1).
[  114.355794] usb 3-1: uvc_v4l2_release
[  114.355819] usb 3-1: uvc_v4l2_release


Not Failing:
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
        white_balance_automatic 0x0098090c (bool)   : default=1 value=0
                          gamma 0x00980910 (int)    : min=100 max=300
step=1 default=103 value=100
           power_line_frequency 0x00980918 (menu)   : min=0 max=2
default=1 value=0 (Disabled)
                0: Disabled
                1: 50 Hz
                2: 60 Hz
      white_balance_temperature 0x0098091a (int)    : min=2800
max=6500 step=1 default=4600 value=4600
                      sharpness 0x0098091b (int)    : min=1 max=7
step=1 default=2 value=2
         backlight_compensation 0x0098091c (int)    : min=0 max=3
step=1 default=1 value=1
# strace -f v4l2-compliance -d /dev/video0 -E
execve("/usr/bin/v4l2-compliance", ["v4l2-compliance", "-d",
"/dev/video0", "-E"], 0x7fff5a4897b0 /* 13 vars */) = 0
brk(NULL)                               = 0x559f80963000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = -1 ENOENT
(No such file or directory)
openat(AT_FDCWD, "/lib64/glibc-hwcaps/x86-64-v2/libv4l2.so.0",
O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/glibc-hwcaps/x86-64-v2", 0x7ffec968e640,
0) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/tls/x86_64/x86_64/libv4l2.so.0",
O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/tls/x86_64/x86_64", 0x7ffec968e640, 0) =
-1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/tls/x86_64/libv4l2.so.0", O_RDONLY|O_CLOEXEC)
= -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/tls/x86_64", 0x7ffec968e640, 0) = -1
ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/tls/x86_64/libv4l2.so.0", O_RDONLY|O_CLOEXEC)
= -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/tls/x86_64", 0x7ffec968e640, 0) = -1
ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/tls/libv4l2.so.0", O_RDONLY|O_CLOEXEC) = -1
ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/tls", 0x7ffec968e640, 0) = -1 ENOENT (No
such file or directory)
openat(AT_FDCWD, "/lib64/x86_64/x86_64/libv4l2.so.0",
O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/x86_64/x86_64", 0x7ffec968e640, 0) = -1
ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib64/x86_64/libv4l2.so.0", O_RDONLY|O_CLOEXEC) =
-1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/x86_64", 0x7ffec968e640, 0) = -1 ENOENT
(No such file or directory)
openat(AT_FDCWD, "/lib64/x86_64/libv4l2.so.0", O_RDONLY|O_CLOEXEC) =
-1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/lib64/x86_64", 0x7ffec968e640, 0) = -1 ENOENT
(No such file or directory)
openat(AT_FDCWD, "/lib64/libv4l2.so.0", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\370\"\0\0\0\0\0\0"...,
832) = 832
pread64(3, "\4\0\0\0
\0\0\0\5\0\0\0GNU\0\1\0\1\300\4\0\0\0\t\0\0\0\0\0\0\0"..., 48, 35072)
= 48
newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=55392, ...}, AT_EMPTY_PATH) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x7f94e2695000
mmap(NULL, 57808, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f94e2686000
mmap(0x7f94e2688000, 20480, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0x7f94e2688000
mmap(0x7f94e268d000, 8192, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x7000) = 0x7f94e268d000
mmap(0x7f94e268f000, 24576, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8000) = 0x7f94e268f000
close(3)                                = 0
openat(AT_FDCWD, "/lib64/libv4lconvert.so.0", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\250D\0\0\0\0\0\0"...,
832) = 832
pread64(3, "\4\0\0\0
\0\0\0\5\0\0\0GNU\0\1\0\1\300\4\0\0\0\t\0\0\0\0\0\0\0"..., 48, 126512)
= 48
newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=137440, ...},
AT_EMPTY_PATH) = 0
mmap(NULL, 476256, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f94e2611000
mprotect(0x7f94e2615000, 114688, PROT_NONE) = 0
mmap(0x7f94e2615000, 73728, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) = 0x7f94e2615000
mmap(0x7f94e2627000, 36864, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x16000) = 0x7f94e2627000
mmap(0x7f94e2631000, 12288, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1f000) = 0x7f94e2631000
mmap(0x7f94e2634000, 332896, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f94e2634000
close(3)                                = 0
openat(AT_FDCWD, "/lib64/libjpeg.so.8", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0@E\0\0\0\0\0\0"...,
832) = 832
newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=493408, ...},
AT_EMPTY_PATH) = 0
mmap(NULL, 495648, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f94e2597000
mmap(0x7f94e259b000, 237568, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) = 0x7f94e259b000
mmap(0x7f94e25d5000, 237568, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3e000) = 0x7f94e25d5000
mmap(0x7f94e260f000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x77000) = 0x7f94e260f000
close(3)                                = 0
openat(AT_FDCWD, "/lib64/libstdc++.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\0\214\n\0\0\0\0\0"...,
832) = 832
pread64(3, "\4\0\0\0
\0\0\0\5\0\0\0GNU\0\1\0\1\300\4\0\0\0\v\0\0\0\0\0\0\0"..., 48,
1457064) = 48
newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=1515608, ...},
AT_EMPTY_PATH) = 0
mmap(NULL, 1531392, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f94e2421000
mmap(0x7f94e24c3000, 524288, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xa2000) = 0x7f94e24c3000
mmap(0x7f94e2543000, 270336, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x122000) = 0x7f94e2543000
mmap(0x7f94e2585000, 61440, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x163000) = 0x7f94e2585000
mmap(0x7f94e2594000, 11776, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f94e2594000
close(3)                                = 0
openat(AT_FDCWD, "/lib64/libm.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\340\321\0\0\0\0\0\0"...,
832) = 832
newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=878512, ...},
AT_EMPTY_PATH) = 0
mmap(NULL, 880680, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f94e2349000
mprotect(0x7f94e2356000, 823296, PROT_NONE) = 0
mmap(0x7f94e2356000, 442368, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xd000) = 0x7f94e2356000
mmap(0x7f94e23c2000, 376832, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x79000) = 0x7f94e23c2000
mmap(0x7f94e241f000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xd5000) = 0x7f94e241f000
close(3)                                = 0
openat(AT_FDCWD, "/lib64/libgcc_s.so.1", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\3702\0\0\0\0\0\0"...,
832) = 832
pread64(3, "\4\0\0\0
\0\0\0\5\0\0\0GNU\0\1\0\1\300\4\0\0\0\v\0\0\0\0\0\0\0"..., 48, 71408)
= 48
newfstatat(3, "", {st_mode=S_IFREG|0644, st_size=76144, ...}, AT_EMPTY_PATH) = 0
mmap(NULL, 78856, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f94e2335000
mmap(0x7f94e2338000, 49152, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3000) = 0x7f94e2338000
mmap(0x7f94e2344000, 12288, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xf000) = 0x7f94e2344000
mmap(0x7f94e2347000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x11000) = 0x7f94e2347000
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
0) = 0x7f94e2333000
pread64(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"...,
784, 64) = 784
mmap(NULL, 2075760, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f94e2138000
mprotect(0x7f94e2160000, 1835008, PROT_NONE) = 0
mmap(0x7f94e2160000, 1466368, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x28000) = 0x7f94e2160000
mmap(0x7f94e22c6000, 364544, PROT_READ,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x18e000) = 0x7f94e22c6000
mmap(0x7f94e2320000, 24576, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1e7000) = 0x7f94e2320000
mmap(0x7f94e2326000, 52336, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f94e2326000
close(3)                                = 0
mmap(NULL, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x7f94e2135000
arch_prctl(ARCH_SET_FS, 0x7f94e2135740) = 0
set_tid_address(0x7f94e2135a10)         = 545
set_robust_list(0x7f94e2135a20, 24)     = 0
mprotect(0x7f94e2320000, 16384, PROT_READ) = 0
mprotect(0x7f94e2347000, 4096, PROT_READ) = 0
mprotect(0x7f94e241f000, 4096, PROT_READ) = 0
mprotect(0x7f94e2585000, 45056, PROT_READ) = 0
mprotect(0x7f94e260f000, 4096, PROT_READ) = 0
mprotect(0x7f94e2631000, 8192, PROT_READ) = 0
mprotect(0x7f94e268f000, 4096, PROT_READ) = 0
mprotect(0x559f7f603000, 8192, PROT_READ) = 0
mprotect(0x7f94e26c6000, 8192, PROT_READ) = 0
prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=8192*1024,
rlim_max=RLIM64_INFINITY}) = 0
getrandom("\x83\x65\xca\xb0\x08\x0d\xcb\x53", 8, GRND_NONBLOCK) = 8
brk(NULL)                               = 0x559f80963000
brk(0x559f80984000)                     = 0x559f80984000
futex(0x7f94e2594cbc, FUTEX_WAKE_PRIVATE, 2147483647) = 0
futex(0x7f94e2594cc8, FUTEX_WAKE_PRIVATE, 2147483647) = 0
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
ioctl(3, VIDIOC_G_SELECTION, 0x7ffec968dd2c) = -1 EINVAL (Invalid argument)
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
getdents64(4, 0x559f80975500 /* 26 entries */, 32768) = 936
openat(AT_FDCWD, "/dev/media0", O_RDWR) = 5
close(4)                                = 0
ioctl(5, MEDIA_IOC_DEVICE_INFO, 0x7ffec968d328) = 0
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
ioctl(5, MEDIA_IOC_DEVICE_INFO, 0x7ffec968cf28) = 0
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
ioctl(5, MEDIA_IOC_G_TOPOLOGY, 0x7ffec968ce08) = 0
ioctl(5, MEDIA_IOC_G_TOPOLOGY, 0x7ffec968ce08) = 0
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
ioctl(5, MEDIA_IOC_ENUM_ENTITIES, 0x7ffec968e100) = 0
ioctl(5, MEDIA_IOC_ENUM_LINKS, 0x7ffec968d328) = 0
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
ioctl(3, _IOC(_IOC_READ, 0x56, 0, 0x3fff), 0x7ffec9689148) = -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, _IOC(_IOC_WRITE, 0x56, 0, 0x3fff), 0x7ffec9689148) = -1
ENOTTY (Inappropriate ioctl for device)
ioctl(3, _IOC(_IOC_READ|_IOC_WRITE, 0x56, 0, 0x3fff), 0x7ffec9689148)
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
ioctl(6, VIDIOC_G_SELECTION, 0x7ffec968cfbc) = -1 EINVAL (Invalid argument)
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
ioctl(3, VIDIOC_G_PRIORITY, 0x7ffec968d144) = 0
ioctl(6, VIDIOC_G_PRIORITY, 0x7ffec968d144) = 0
ioctl(3, VIDIOC_S_PRIORITY, 0x7ffec968d1c0) = 0
ioctl(3, VIDIOC_G_PRIORITY, 0x7ffec968d144) = 0
ioctl(6, VIDIOC_G_PRIORITY, 0x7ffec968d144) = 0
ioctl(6, VIDIOC_S_PRIORITY, 0x7ffec968d1c0) = -1 EBUSY (Device or resource busy)
ioctl(3, VIDIOC_S_PRIORITY, 0x7ffec968d1c0) = 0
ioctl(3, VIDIOC_G_PRIORITY, 0x7ffec968d144) = 0
ioctl(6, VIDIOC_G_PRIORITY, 0x7ffec968d144) = 0
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
ioctl(3, VIDIOC_G_SELECTION, 0x7ffec968d23c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_SELECTION, 0x7ffec968d23c) = -1 EINVAL (Invalid argument)
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
rt_sigaction(SIGINT, {sa_handler=0x559f7f5abbf6, sa_mask=[INT],
sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f94e2175420},
{sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
write(1, "Debug ioctls:\n", 14Debug ioctls:
)         = 14
getuid()                                = 0
ioctl(3, VIDIOC_DBG_G_REGISTER, 0x7ffec968d038) = -1 ENOTTY
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
ioctl(3, VIDIOC_G_STD, 0x7ffec968d070)  = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_G_TUNER, {index=0})     = -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_G/S_TUNER/ENUM_FREQ"..., 68    test
VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
) = 68
ioctl(3, VIDIOC_G_FREQUENCY, 0x7ffec968d068) = -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_S_FREQUENCY, 0x7ffec968d068) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_G/S_FREQUENCY: \33[32"..., 56    test
VIDIOC_G/S_FREQUENCY: OK (Not Supported)
) = 56
ioctl(3, VIDIOC_S_HW_FREQ_SEEK, 0x7ffec968d0b4) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_S_HW_FREQ_SEEK: \33[3"..., 57    test
VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
) = 57
ioctl(3, VIDIOC_ENUMAUDIO, 0x7ffec968d114) = -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_ENUMAUDIO: \33[32mOK\33"..., 52    test
VIDIOC_ENUMAUDIO: OK (Not Supported)
) = 52
ioctl(3, VIDIOC_G_INPUT, [0])           = 0
ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
type=V4L2_INPUT_TYPE_CAMERA}) = 0
ioctl(3, VIDIOC_S_INPUT, [0])           = 0
ioctl(3, VIDIOC_G_SELECTION, 0x7ffec968d098) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUMINPUT, {index=1})   = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_INPUT, [1])           = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_INPUT, [0])           = 0
write(1, "\ttest VIDIOC_G/S/ENUMINPUT: \33[32"..., 40    test
VIDIOC_G/S/ENUMINPUT: OK
) = 40
ioctl(3, VIDIOC_S_INPUT, [0])           = 0
ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
type=V4L2_INPUT_TYPE_CAMERA}) = 0
ioctl(3, VIDIOC_G_AUDIO, 0x7ffec968d0a4) = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_AUDIO, 0x7ffec968d0a4) = -1 ENOTTY (Inappropriate
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
ioctl(3, VIDIOC_G_MODULATOR, 0x7ffec968d0e4) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_G/S_MODULATOR: \33[32"..., 56    test
VIDIOC_G/S_MODULATOR: OK (Not Supported)
) = 56
ioctl(3, VIDIOC_G_FREQUENCY, 0x7ffec968d0c8) = -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_S_FREQUENCY, 0x7ffec968d0c8) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_G/S_FREQUENCY: \33[32"..., 56    test
VIDIOC_G/S_FREQUENCY: OK (Not Supported)
) = 56
ioctl(3, VIDIOC_ENUMAUDOUT, 0x7ffec968d114) = -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_ENUMAUDOUT: \33[32mOK"..., 53    test
VIDIOC_ENUMAUDOUT: OK (Not Supported)
) = 53
ioctl(3, VIDIOC_G_OUTPUT, 0x7ffec968d098) = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_ENUMOUTPUT, 0x7ffec968d0e0) = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_OUTPUT, 0x7ffec968d09c) = -1 ENOTTY (Inappropriate
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
ioctl(3, VIDIOC_G_STD, 0x7ffec968cff8)  = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_STD, [0])             = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_STD, [0x3000000])     = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_ENUMSTD, {index=0})     = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_QUERYSTD, 0x7ffec968cff8) = -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_ENUM/G/S/QUERY_STD:"..., 61    test
VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
) = 61
ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
type=V4L2_INPUT_TYPE_CAMERA}) = 0
ioctl(3, VIDIOC_S_INPUT, [0])           = 0
ioctl(3, VIDIOC_G_DV_TIMINGS, 0x7ffec968cbac) = -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_ENUM_DV_TIMINGS, 0x7ffec968ccb4) = -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_QUERY_DV_TIMINGS, 0x7ffec968cbac) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_ENUM/G/S/QUERY_DV_T"..., 68    test
VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
) = 68
ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
type=V4L2_INPUT_TYPE_CAMERA}) = 0
ioctl(3, VIDIOC_S_INPUT, [0])           = 0
ioctl(3, VIDIOC_DV_TIMINGS_CAP, 0x7ffec968cfc8) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_DV_TIMINGS_CAP: \33[3"..., 57    test
VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
) = 57
ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
type=V4L2_INPUT_TYPE_CAMERA}) = 0
ioctl(3, VIDIOC_S_INPUT, [0])           = 0
ioctl(3, VIDIOC_G_EDID, 0x7ffec9685020) = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_EDID, 0x7ffec9685020) = -1 ENOTTY (Inappropriate
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
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CTRL_CLASS_USER+0x1
=> V4L2_CID_BRIGHTNESS, type=V4L2_CTRL_TYPE_INTEGER,
name="Brightness", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_BRIGHTNESS
=> V4L2_CID_CONTRAST, type=V4L2_CTRL_TYPE_INTEGER, name="Contrast",
...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_CONTRAST
=> V4L2_CID_SATURATION, type=V4L2_CTRL_TYPE_INTEGER,
name="Saturation", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_SATURATION
=> V4L2_CID_HUE, type=V4L2_CTRL_TYPE_INTEGER, name="Hue", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_HUE
=> V4L2_CID_AUTO_WHITE_BALANCE, type=V4L2_CTRL_TYPE_BOOLEAN,
name="White Balance, Automatic", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_AUTO_WHITE_BALANCE
=> V4L2_CID_GAMMA, type=V4L2_CTRL_TYPE_INTEGER, name="Gamma", ...}) =
0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_GAMMA
=> V4L2_CID_POWER_LINE_FREQUENCY, type=V4L2_CTRL_TYPE_MENU,
name="Power Line Frequency", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_POWER_LINE_FREQUENCY
=> V4L2_CID_WHITE_BALANCE_TEMPERATURE, type=V4L2_CTRL_TYPE_INTEGER,
name="White Balance Temperature", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_WHITE_BALANCE_TEMPERATURE
=> V4L2_CID_SHARPNESS, type=V4L2_CTRL_TYPE_INTEGER, name="Sharpness",
...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_SHARPNESS
=> V4L2_CID_BACKLIGHT_COMPENSATION, type=V4L2_CTRL_TYPE_INTEGER,
name="Backlight Compensation", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = -1 EINVAL (Invalid argument)
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
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_CONTRAST,
type=V4L2_CTRL_TYPE_INTEGER, name="Contrast", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_SATURATION,
type=V4L2_CTRL_TYPE_INTEGER, name="Saturation", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_HUE,
type=V4L2_CTRL_TYPE_INTEGER, name="Hue", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = -1 EINVAL (Invalid argument)
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
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_DO_WHITE_BALANCE}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_RED_BALANCE}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_BLUE_BALANCE}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_GAMMA,
type=V4L2_CTRL_TYPE_INTEGER, name="Gamma", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = -1 EINVAL (Invalid argument)
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
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_HUE_AUTO}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL,
{id=V4L2_CID_WHITE_BALANCE_TEMPERATURE, type=V4L2_CTRL_TYPE_INTEGER,
name="White Balance Temperature", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_SHARPNESS,
type=V4L2_CTRL_TYPE_INTEGER, name="Sharpness", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_BACKLIGHT_COMPENSATION,
type=V4L2_CTRL_TYPE_INTEGER, name="Backlight Compensation", ...}) = 0
ioctl(3, VIDIOC_QUERYMENU, 0x7ffec968cf9c) = -1 EINVAL (Invalid argument)
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
ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=0}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=0 => 0}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=-1 => 0}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=2 => 1}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=0 => 0}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=1 => 1}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=1 => 1}) = 0
ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_GAMMA, value=100}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAMMA, value=100 => 100}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAMMA, value=99 => 100}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAMMA, value=301 => 300}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAMMA, value=100 => 100}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAMMA, value=300 => 300}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAMMA, value=103 => 103}) = 0
ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY, value=0}) = 0
ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY, value=0 => 0}) = 0
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
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=0xf000000 /*
V4L2_CTRL_CLASS_??? */, count=10, controls=[{id=V4L2_CID_BRIGHTNESS,
size=0, value=0, value64=8589934592}, {id=V4L2_CID_CONTRAST, size=0,
value=35, value64=8589934627}, {id=V4L2_CID_SATURATION, size=0,
value=62, value64=8589934654}, {id=V4L2_CID_HUE, size=0, value=0,
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
value64=8589934593}], error_idx=10}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=0xf000000 /*
V4L2_CTRL_CLASS_??? */, count=10, controls=[{id=V4L2_CID_BRIGHTNESS,
size=0, value=0, value64=8589934592}, {id=V4L2_CID_CONTRAST, size=0,
value=35, value64=8589934627}, {id=V4L2_CID_SATURATION, size=0,
value=62, value64=8589934654}, {id=V4L2_CID_HUE, size=0, value=0,
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
value64=8589934593}], error_idx=10}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=0xf000000 /*
V4L2_CTRL_CLASS_??? */, count=10, controls=[{id=V4L2_CID_BRIGHTNESS,
size=0, value=0, value64=8589934592}, {id=V4L2_CID_CONTRAST, size=0,
value=35, value64=8589934627}, {id=V4L2_CID_SATURATION, size=0,
value=62, value64=8589934654}, {id=V4L2_CID_HUE, size=0, value=0,
value64=8589934592}, {id=V4L2_CID_AUTO_WHITE_BALANCE, size=0, value=1,
value64=8589934593}, {id=V4L2_CID_GAMMA, size=0, value=103,
value64=8589934695}, {id=V4L2_CID_POWER_LINE_FREQUENCY, size=0,
value=1, value64=8589934593}, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE,
size=0, value=4600, value64=8589939192}, {id=V4L2_CID_SHARPNESS,
size=0, value=2, value64=8589934594},
{id=V4L2_CID_BACKLIGHT_COMPENSATION, size=0, value=1,
value64=8589934593}]}) = 0
write(1, "\ttest VIDIOC_G/S/TRY_EXT_CTRLS: "..., 44    test
VIDIOC_G/S/TRY_EXT_CTRLS: OK
) = 44
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffec968cfc0) = 0
pselect6(4, NULL, NULL, [3], {tv_sec=0, tv_nsec=100000}, NULL) = 0 (Timeout)
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffec968cfc0) = 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffec968cfc0) = 0
pselect6(4, NULL, NULL, [3], {tv_sec=0, tv_nsec=100000}, NULL) = 1
(except [3], left {tv_sec=0, tv_nsec=84997})
ioctl(3, VIDIOC_DQEVENT, 0x7ffec968d0a0) = 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffec968cfc0) = 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffec968cfc0) = 0
pselect6(4, NULL, NULL, [3], {tv_sec=0, tv_nsec=100000}, NULL) = 1
(except [3], left {tv_sec=0, tv_nsec=84736})
ioctl(3, VIDIOC_DQEVENT, 0x7ffec968d0a0) = 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffec968cfc0) = 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffec968cfc0) = 0
pselect6(4, NULL, NULL, [3], {tv_sec=0, tv_nsec=100000}, NULL) = 1
(except [3], left {tv_sec=0, tv_nsec=84375})
ioctl(3, VIDIOC_DQEVENT, 0x7ffec968d0a0) = 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffec968cfc0) = 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffec968cfc0) = 0
pselect6(4, NULL, NULL, [3], {tv_sec=0, tv_nsec=100000}, NULL) = 1
(except [3], left {tv_sec=0, tv_nsec=84355})
ioctl(3, VIDIOC_DQEVENT, 0x7ffec968d0a0) = 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffec968cfc0) = 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffec968cfc0) = 0
pselect6(4, NULL, NULL, [3], {tv_sec=0, tv_nsec=100000}, NULL) = 1
(except [3], left {tv_sec=0, tv_nsec=85929})
ioctl(3, VIDIOC_DQEVENT, 0x7ffec968d0a0) = 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffec968cfc0) = 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffec968cfc0) = 0
pselect6(4, NULL, NULL, [3], {tv_sec=0, tv_nsec=100000}, NULL) = 1
(except [3], left {tv_sec=0, tv_nsec=83594})
ioctl(3, VIDIOC_DQEVENT, 0x7ffec968d0a0) = 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffec968cfc0) = 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffec968cfc0) = 0
pselect6(4, NULL, NULL, [3], {tv_sec=0, tv_nsec=100000}, NULL) = 1
(except [3], left {tv_sec=0, tv_nsec=87622})
ioctl(3, VIDIOC_DQEVENT, 0x7ffec968d0a0) = 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffec968cfc0) = 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffec968cfc0) = 0
pselect6(4, NULL, NULL, [3], {tv_sec=0, tv_nsec=100000}, NULL) = 1
(except [3], left {tv_sec=0, tv_nsec=88880})
ioctl(3, VIDIOC_DQEVENT, 0x7ffec968d0a0) = 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffec968cfc0) = 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffec968cfc0) = 0
pselect6(4, NULL, NULL, [3], {tv_sec=0, tv_nsec=100000}, NULL) = 1
(except [3], left {tv_sec=0, tv_nsec=89447})
ioctl(3, VIDIOC_DQEVENT, 0x7ffec968d0a0) = 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffec968cfc0) = 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffec968cfc0) = 0
pselect6(4, NULL, NULL, [3], {tv_sec=0, tv_nsec=100000}, NULL) = 1
(except [3], left {tv_sec=0, tv_nsec=89707})
ioctl(3, VIDIOC_DQEVENT, 0x7ffec968d0a0) = 0
ioctl(3, VIDIOC_UNSUBSCRIBE_EVENT, 0x7ffec968cfc0) = 0
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffec968d000) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_SUBSCRIBE_EVENT, 0x7ffec968d000) = -1 EINVAL (Invalid argument)
write(1, "\ttest VIDIOC_(UN)SUBSCRIBE_EVENT"..., 54    test
VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
) = 54
ioctl(3, VIDIOC_G_JPEGCOMP, 0x7ffec968d0bc) = -1 ENOTTY (Inappropriate
ioctl for device)
ioctl(3, VIDIOC_S_JPEGCOMP, 0x7ffec968d0bc) = -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_G/S_JPEGCOMP: \33[32m"..., 55    test
VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
) = 55
write(1, "\tStandard Controls: 11 Private C"..., 43    Standard
Controls: 11 Private Controls: 0
) = 43
write(1, "\n", 1
)                       = 1
write(1, "Format ioctls (Input 0):\n", 25Format ioctls (Input 0):
) = 25
ioctl(3, VIDIOC_ENUM_FMT, {index=0, type=0 /* V4L2_BUF_TYPE_??? */}) =
-1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=0, type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
flags=V4L2_FMT_FLAG_COMPRESSED, description="Motion-JPEG",
pixelformat=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */})
= 0
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=1920, height=1080}})
= 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=1920, height=1080, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/30}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=1920, height=1080}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=1921, height=1080}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=1,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=352, height=288}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=352, height=288, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/30}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=352, height=288}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=353, height=288}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=2,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=432, height=240}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=432, height=240, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/30}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=432, height=240}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=433, height=240}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=320, height=184}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=320, height=184, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/30}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=320, height=184}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=321, height=184}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=4,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=176, height=144}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=176, height=144, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/30}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=176, height=144}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=177, height=144}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=5,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=160, height=120}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=160, height=120, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/30}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=160, height=120}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=161, height=120}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=6,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=320, height=240}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=320, height=240, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/30}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=320, height=240}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=321, height=240}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=7,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=640, height=360}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=640, height=360, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/30}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=640, height=360}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=641, height=360}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=8,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=640, height=480}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=640, height=480, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/30}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=640, height=480}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=641, height=480}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=9,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=800, height=600}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=800, height=600, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/30}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=800, height=600}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=801, height=600}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=10,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=960, height=720}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=960, height=720, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/30}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=960, height=720}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=961, height=720}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=11,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=1024, height=768}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=1024, height=768, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/30}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=1024, height=768}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=1025, height=768}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=12,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=1280, height=720}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=1280, height=720, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/30}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=1280, height=720}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=1281, height=720}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=13,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=1280, height=960}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=1280, height=960, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/30}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=1280, height=960}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */,
width=1281, height=960}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=14,
pixel_format=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG
*/}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=1, type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
flags=0, description="YUYV 4:2:2", pixelformat=v4l2_fourcc('Y', 'U',
'Y', 'V') /* V4L2_PIX_FMT_YUYV */}) = 0
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=1920, height=1080}})
= 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=1920, height=1080, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/5}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=1920, height=1080}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=1921, height=1080}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=1,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=352, height=288}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=352, height=288, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/30}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=352, height=288}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=353, height=288}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=2,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=432, height=240}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=432, height=240, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/30}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=432, height=240}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=433, height=240}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=3,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=320, height=184}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=320, height=184, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/30}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=320, height=184}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=321, height=184}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=4,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=176, height=144}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=176, height=144, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/30}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=176, height=144}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=177, height=144}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=5,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=160, height=120}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=160, height=120, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/30}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=160, height=120}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=161, height=120}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=6,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=320, height=240}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=320, height=240, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/30}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=320, height=240}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=321, height=240}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=7,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=640, height=360}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=640, height=360, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/30}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=640, height=360}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=641, height=360}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=8,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=640, height=480}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=640, height=480, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/30}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=640, height=480}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=641, height=480}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=9,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=800, height=600}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=800, height=600, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/21}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=800, height=600}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=801, height=600}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=10,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=960, height=720}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=960, height=720, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/11}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=960, height=720}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=961, height=720}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=11,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=1024, height=768}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=1024, height=768, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/13}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=1024, height=768}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=1025, height=768}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=12,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=1280, height=720}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=1280, height=720, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/9}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=1280, height=720}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=1281, height=720}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=13,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
type=V4L2_FRMSIZE_TYPE_DISCRETE, discrete={width=1280, height=960}}) =
0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=1280, height=960, type=V4L2_FRMIVAL_TYPE_DISCRETE,
discrete=1/6}) = 0
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=1,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=1280, height=960}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */,
width=1281, height=960}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=14,
pixel_format=v4l2_fourcc('Y', 'U', 'Y', 'V') /* V4L2_PIX_FMT_YUYV */})
= -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=2, type=V4L2_BUF_TYPE_VIDEO_CAPTURE})
= -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=0, type=V4L2_BUF_TYPE_VIDEO_OUTPUT})
= -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=0, type=V4L2_BUF_TYPE_VIDEO_OVERLAY})
= -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=0, type=V4L2_BUF_TYPE_VBI_CAPTURE}) =
-1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=0, type=V4L2_BUF_TYPE_VBI_OUTPUT}) =
-1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=0,
type=V4L2_BUF_TYPE_SLICED_VBI_CAPTURE}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=0,
type=V4L2_BUF_TYPE_SLICED_VBI_OUTPUT}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=0,
type=V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY}) = -1 EINVAL (Invalid
argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=0,
type=V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE}) = -1 EINVAL (Invalid
argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=0,
type=V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE}) = -1 EINVAL (Invalid
argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=0, type=V4L2_BUF_TYPE_SDR_CAPTURE}) =
-1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=0, type=V4L2_BUF_TYPE_SDR_OUTPUT}) =
-1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=0, type=V4L2_BUF_TYPE_META_CAPTURE})
= -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=0, type=V4L2_BUF_TYPE_META_OUTPUT}) =
-1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=0, type=0x80 /* V4L2_BUF_TYPE_???
*/}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMESIZES, {index=0, pixel_format=v4l2_fourcc('
', ' ', ' ', ' ')}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FRAMEINTERVALS, {index=0,
pixel_format=v4l2_fourcc(' ', ' ', ' ', ' '), width=640, height=480})
= -1 EINVAL (Invalid argument)
write(1, "\ttest VIDIOC_ENUM_FMT/FRAMESIZES"..., 61    test
VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
) = 61
ioctl(3, VIDIOC_G_PARM, {type=0 /* V4L2_BUF_TYPE_??? */}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_S_PARM, {type=0 /* V4L2_BUF_TYPE_??? */}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
parm.capture={capability=V4L2_CAP_TIMEPERFRAME, capturemode=0,
timeperframe=1/30, extendedmode=0, readbuffers=0}}) = 0
ioctl(3, VIDIOC_S_PARM, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
parm.capture={capability=0, capturemode=0, timeperframe=0/0,
extendedmode=0, readbuffers=0}} =>
{parm.capture={capability=V4L2_CAP_TIMEPERFRAME, capturemode=0,
timeperframe=1/30, extendedmode=0, readbuffers=0}}) = 0
ioctl(3, VIDIOC_S_PARM, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
parm.capture={capability=V4L2_CAP_TIMEPERFRAME, capturemode=0,
timeperframe=0/1, extendedmode=0, readbuffers=0}} =>
{parm.capture={capability=V4L2_CAP_TIMEPERFRAME, capturemode=0,
timeperframe=1/30, extendedmode=0, readbuffers=0}}) = 0
ioctl(3, VIDIOC_S_PARM, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
parm.capture={capability=V4L2_CAP_TIMEPERFRAME, capturemode=0,
timeperframe=1/0, extendedmode=0, readbuffers=0}} =>
{parm.capture={capability=V4L2_CAP_TIMEPERFRAME, capturemode=0,
timeperframe=1/30, extendedmode=0, readbuffers=0}}) = 0
ioctl(3, VIDIOC_G_PARM, {type=V4L2_BUF_TYPE_VIDEO_OUTPUT}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=V4L2_BUF_TYPE_VIDEO_OVERLAY}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_PARM, {type=V4L2_BUF_TYPE_VIDEO_OVERLAY}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=V4L2_BUF_TYPE_VBI_CAPTURE}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_S_PARM, {type=V4L2_BUF_TYPE_VBI_CAPTURE}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=V4L2_BUF_TYPE_VBI_OUTPUT}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_S_PARM, {type=V4L2_BUF_TYPE_VBI_OUTPUT}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=V4L2_BUF_TYPE_SLICED_VBI_CAPTURE}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_PARM, {type=V4L2_BUF_TYPE_SLICED_VBI_CAPTURE}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=V4L2_BUF_TYPE_SLICED_VBI_OUTPUT}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_PARM, {type=V4L2_BUF_TYPE_SLICED_VBI_OUTPUT}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY}) =
-1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_PARM, {type=V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY}) =
-1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE}) =
-1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=V4L2_BUF_TYPE_SDR_CAPTURE}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_S_PARM, {type=V4L2_BUF_TYPE_SDR_CAPTURE}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=V4L2_BUF_TYPE_SDR_OUTPUT}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_S_PARM, {type=V4L2_BUF_TYPE_SDR_OUTPUT}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=V4L2_BUF_TYPE_META_CAPTURE}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_S_PARM, {type=V4L2_BUF_TYPE_META_CAPTURE}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=V4L2_BUF_TYPE_META_OUTPUT}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_S_PARM, {type=V4L2_BUF_TYPE_META_OUTPUT}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_PARM, {type=0x80 /* V4L2_BUF_TYPE_??? */}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_PARM, {type=0x80 /* V4L2_BUF_TYPE_??? */}) = -1
EINVAL (Invalid argument)
write(1, "\ttest VIDIOC_G/S_PARM: \33[32mOK\33["..., 35    test
VIDIOC_G/S_PARM: OK
) = 35
ioctl(3, VIDIOC_G_FBUF, 0x7ffec968d128) = -1 ENOTTY (Inappropriate
ioctl for device)
write(1, "\ttest VIDIOC_G_FBUF: \33[32mOK\33[0m"..., 49    test
VIDIOC_G_FBUF: OK (Not Supported)
) = 49
ioctl(3, VIDIOC_G_FMT, {type=0 /* V4L2_BUF_TYPE_??? */}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_OUTPUT}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_OVERLAY}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VBI_CAPTURE}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VBI_OUTPUT}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_SLICED_VBI_CAPTURE}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_SLICED_VBI_OUTPUT}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_OUTPUT_OVERLAY}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_SDR_CAPTURE}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_SDR_OUTPUT}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_META_CAPTURE}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_META_OUTPUT}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=0x80 /* V4L2_BUF_TYPE_??? */}) = -1
EINVAL (Invalid argument)
write(1, "\ttest VIDIOC_G_FMT: \33[32mOK\33[0m\n", 32    test VIDIOC_G_FMT: OK
) = 32
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(3, VIDIOC_TRY_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}} =>
{fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J',
'P', 'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE,
bytesperline=0, sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) =
0
ioctl(3, VIDIOC_TRY_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=4294967295, height=4294967295,
pixelformat=v4l2_fourcc('\xff', '\xff', '\xff', '\xff'),
field=V4L2_FIELD_ANY, bytesperline=4294967295, sizeimage=4294967295,
colorspace=0xffffffff /* V4L2_COLORSPACE_??? */}} =>
{fmt.pix={width=1920, height=1080, pixelformat=v4l2_fourcc('M', 'J',
'P', 'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE,
bytesperline=0, sizeimage=4147789, colorspace=V4L2_COLORSPACE_SRGB}})
= 0
ioctl(3, VIDIOC_TRY_FMT, {type=0x80 /* V4L2_BUF_TYPE_??? */}) = -1
EINVAL (Invalid argument)
write(1, "\ttest VIDIOC_TRY_FMT: \33[32mOK\33[0"..., 34    test
VIDIOC_TRY_FMT: OK
) = 34
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(3, VIDIOC_S_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=4294967295, height=4294967295,
pixelformat=v4l2_fourcc('\xff', '\xff', '\xff', '\xff'),
field=V4L2_FIELD_ANY, bytesperline=4294967295, sizeimage=4294967295,
colorspace=0xffffffff /* V4L2_COLORSPACE_??? */}} =>
{fmt.pix={width=1920, height=1080, pixelformat=v4l2_fourcc('M', 'J',
'P', 'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE,
bytesperline=0, sizeimage=4147789, colorspace=V4L2_COLORSPACE_SRGB}})
= 0
ioctl(3, VIDIOC_S_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}} =>
{fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J',
'P', 'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE,
bytesperline=0, sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) =
0
ioctl(3, VIDIOC_S_FMT, {type=0x80 /* V4L2_BUF_TYPE_??? */}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_ENUM_FMT, {index=1, type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
flags=0, description="YUYV 4:2:2", pixelformat=v4l2_fourcc('Y', 'U',
'Y', 'V') /* V4L2_PIX_FMT_YUYV */}) = 0
ioctl(3, VIDIOC_ENUM_FMT, {index=0, type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
flags=V4L2_FMT_FLAG_COMPRESSED, description="Motion-JPEG",
pixelformat=v4l2_fourcc('M', 'J', 'P', 'G') /* V4L2_PIX_FMT_MJPEG */})
= 0
ioctl(3, VIDIOC_S_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=0, height=0, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_ANY, bytesperline=0,
sizeimage=0, colorspace=V4L2_COLORSPACE_DEFAULT}} =>
{fmt.pix={width=160, height=120, pixelformat=v4l2_fourcc('M', 'J',
'P', 'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE,
bytesperline=0, sizeimage=38989, colorspace=V4L2_COLORSPACE_SRGB}}) =
0
ioctl(6, VIDIOC_S_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=0, height=0, pixelformat=v4l2_fourcc('Y', 'U', 'Y',
'V') /* V4L2_PIX_FMT_YUYV */, field=V4L2_FIELD_ANY, bytesperline=0,
sizeimage=0, colorspace=V4L2_COLORSPACE_DEFAULT}}) = -1 EBUSY (Device
or resource busy)
write(1, "\t\t\33[1mwarn\33[0m: v4l2-test-format"..., 64        warn:
v4l2-test-formats.cpp(1036): Could not set fmt2
) = 64
ioctl(3, VIDIOC_S_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}} =>
{fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J',
'P', 'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE,
bytesperline=0, sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) =
0
write(1, "\ttest VIDIOC_S_FMT: \33[32mOK\33[0m\n", 32    test VIDIOC_S_FMT: OK
) = 32
ioctl(3, VIDIOC_G_SLICED_VBI_CAP, 0x7ffec968d0b4) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_G_SLICED_VBI_CAP: \33"..., 59    test
VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
) = 59
ioctl(3, VIDIOC_CROPCAP, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
bounds={left=0, top=0, width=352, height=288}, defrect={left=0, top=0,
width=352, height=288}, pixelaspect=1/1}) = 0
ioctl(3, VIDIOC_G_SELECTION, 0x7ffec968d0e8) = 0
ioctl(3, VIDIOC_CROPCAP, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
bounds={left=0, top=0, width=352, height=288}, defrect={left=0, top=0,
width=352, height=288}, pixelaspect=1/1}) = 0
ioctl(3, VIDIOC_CROPCAP, {type=0xff /* V4L2_BUF_TYPE_??? */}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_CROP, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE}) = -1
EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_SELECTION, 0x7ffec968d0e8) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_SELECTION, 0x7ffec968cef8) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_SELECTION, 0x7ffec968cef8) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest Cropping: \33[32mOK\33[0m (Not"..., 44    test
Cropping: OK (Not Supported)
) = 44
ioctl(3, VIDIOC_G_SELECTION, 0x7ffec968cf98) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_SELECTION, 0x7ffec968cf98) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest Composing: \33[32mOK\33[0m (No"..., 45    test
Composing: OK (Not Supported)
) = 45
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(3, VIDIOC_S_SELECTION, 0x7ffec968cbf8) = -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_S_SELECTION, 0x7ffec968cc38) = -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_S_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=1, height=1, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_ANY, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}} =>
{fmt.pix={width=160, height=120, pixelformat=v4l2_fourcc('M', 'J',
'P', 'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE,
bytesperline=0, sizeimage=38989, colorspace=V4L2_COLORSPACE_SRGB}}) =
0
ioctl(3, VIDIOC_G_SELECTION, 0x7ffec968cbf8) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_SELECTION, 0x7ffec968cc38) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=16384, height=16384, pixelformat=v4l2_fourcc('M', 'J',
'P', 'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_ANY,
bytesperline=0, sizeimage=38989, colorspace=V4L2_COLORSPACE_SRGB}} =>
{fmt.pix={width=1920, height=1080, pixelformat=v4l2_fourcc('M', 'J',
'P', 'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE,
bytesperline=0, sizeimage=4147789, colorspace=V4L2_COLORSPACE_SRGB}})
= 0
ioctl(3, VIDIOC_S_SELECTION, 0x7ffec968cbf8) = -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_S_SELECTION, 0x7ffec968cc38) = -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_G_SELECTION, 0x7ffec968cbf8) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_SELECTION, 0x7ffec968cc38) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}} =>
{fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J',
'P', 'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE,
bytesperline=0, sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) =
0
write(1, "\ttest Scaling: \33[32mOK\33[0m (Not "..., 43    test
Scaling: OK (Not Supported)
) = 43
write(1, "\n", 1
)                       = 1
write(1, "Codec ioctls (Input 0):\n", 24Codec ioctls (Input 0):
) = 24
ioctl(3, VIDIOC_ENCODER_CMD, 0x7ffec968d110) = -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_TRY_ENCODER_CMD, 0x7ffec968d110) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_(TRY_)ENCODER_CMD: "..., 60    test
VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
) = 60
ioctl(3, VIDIOC_G_ENC_INDEX, 0x7ffec968c940) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_G_ENC_INDEX: \33[32mO"..., 54    test
VIDIOC_G_ENC_INDEX: OK (Not Supported)
) = 54
ioctl(3, VIDIOC_DECODER_CMD, 0x7ffec968d0f0) = -1 ENOTTY
(Inappropriate ioctl for device)
ioctl(3, VIDIOC_TRY_DECODER_CMD, 0x7ffec968d0f0) = -1 ENOTTY
(Inappropriate ioctl for device)
write(1, "\ttest VIDIOC_(TRY_)DECODER_CMD: "..., 60    test
VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
) = 60
write(1, "\n", 1
)                       = 1
write(1, "Buffer ioctls (Input 0):\n", 25Buffer ioctls (Input 0):
) = 25
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
ioctl(3, VIDIOC_G_SELECTION, 0x7ffec9689cfc) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_REQBUFS, {type=0 /* V4L2_BUF_TYPE_??? */, memory=0 /*
V4L2_MEMORY_??? */, count=0}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_REQBUFS, {type=0 /* V4L2_BUF_TYPE_??? */, memory=0 /*
V4L2_MEMORY_??? */, count=1}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_MMAP, count=0 => 0}) = 0
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_USERPTR, count=0 => 0}) = 0
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=0 => 0}) = 0
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_MMAP, count=1 => 1}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_MMAP, m.offset=0, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_MMAP, count=1 => 1}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_MMAP, m.offset=0, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_MMAP, m.offset=0, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=1})
= -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_USERPTR, count=1 => 1}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_USERPTR, m.userptr=NULL, length=203341,
bytesused=0, flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_USERPTR, count=1 => 1}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_USERPTR, m.userptr=NULL, length=203341,
bytesused=0, flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_USERPTR, m.userptr=NULL, length=203341,
bytesused=0, flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=1})
= -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=1 => 1}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_DMABUF, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=1 => 1}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_DMABUF, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_DMABUF, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=1})
= -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=0 => 0}) = 0
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=1 => 1}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_DMABUF, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(6, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_MMAP, count=1}) = -1 EBUSY (Device or resource
busy)
ioctl(6, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_MMAP, count=0}) = -1 EBUSY (Device or resource
busy)
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=0 => 0}) = 0
ioctl(6, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_MMAP, count=1 => 1}) = 0
ioctl(6, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_MMAP, m.offset=0, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(6, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_MMAP, count=0 => 0}) = 0
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_MMAP, count=1 => 1}) = 0
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=0 => 0}) = 0
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=0, memory=V4L2_MEMORY_DMABUF,
format={type=V4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix={width=352,
height=288, pixelformat=v4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}}) = 0 ({index=0,
count=0})
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=1, memory=V4L2_MEMORY_MMAP,
format={type=V4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix={width=352,
height=288, pixelformat=v4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}}) = 0 ({index=0,
count=1})
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=0 => 0}) = 0
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=1, memory=V4L2_MEMORY_DMABUF,
format={type=V4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix={width=352,
height=288, pixelformat=v4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}}) = 0 ({index=0,
count=1})
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_DMABUF, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_DMABUF, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=1})
= -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=1, memory=V4L2_MEMORY_DMABUF,
format={type=V4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix={width=352,
height=288, pixelformat=v4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}}) = 0 ({index=1,
count=1})
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=1,
memory=V4L2_MEMORY_DMABUF, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_DMABUF, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=1,
memory=V4L2_MEMORY_DMABUF, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=2})
= -1 EINVAL (Invalid argument)
ioctl(6, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(6, VIDIOC_CREATE_BUFS, {count=1, memory=V4L2_MEMORY_MMAP,
format={type=V4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix={width=352,
height=288, pixelformat=v4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}}) = -1 EBUSY
(Device or resource busy)
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=0 => 0}) = 0
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=1, memory=V4L2_MEMORY_DMABUF,
format={type=V4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix={width=352,
height=144, pixelformat=v4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=101670, colorspace=V4L2_COLORSPACE_SRGB}}}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0})
= -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=1, memory=V4L2_MEMORY_DMABUF,
format={type=V4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix={width=352,
height=288, pixelformat=v4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=406682, colorspace=V4L2_COLORSPACE_SRGB}}}) = 0 ({index=0,
count=1})
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_DMABUF, length=406682, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=1 => 1}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_DMABUF, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(6, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_USERPTR, count=1}) = -1 EBUSY (Device or resource
busy)
ioctl(6, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_USERPTR, count=0}) = -1 EBUSY (Device or resource
busy)
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=0 => 0}) = 0
ioctl(6, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_USERPTR, count=1 => 1}) = 0
ioctl(6, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_USERPTR, m.userptr=NULL, length=203341,
bytesused=0, flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(6, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_USERPTR, count=0 => 0}) = 0
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_USERPTR, count=1 => 1}) = 0
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=0 => 0}) = 0
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=0, memory=V4L2_MEMORY_DMABUF,
format={type=V4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix={width=352,
height=288, pixelformat=v4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}}) = 0 ({index=0,
count=0})
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=1, memory=V4L2_MEMORY_USERPTR,
format={type=V4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix={width=352,
height=288, pixelformat=v4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}}) = 0 ({index=0,
count=1})
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=0 => 0}) = 0
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=1, memory=V4L2_MEMORY_DMABUF,
format={type=V4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix={width=352,
height=288, pixelformat=v4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}}) = 0 ({index=0,
count=1})
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_DMABUF, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_DMABUF, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=1})
= -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=1, memory=V4L2_MEMORY_DMABUF,
format={type=V4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix={width=352,
height=288, pixelformat=v4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}}) = 0 ({index=1,
count=1})
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=1,
memory=V4L2_MEMORY_DMABUF, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_DMABUF, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=1,
memory=V4L2_MEMORY_DMABUF, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=2})
= -1 EINVAL (Invalid argument)
ioctl(6, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(6, VIDIOC_CREATE_BUFS, {count=1, memory=V4L2_MEMORY_USERPTR,
format={type=V4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix={width=352,
height=288, pixelformat=v4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}}) = -1 EBUSY
(Device or resource busy)
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=0 => 0}) = 0
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=1, memory=V4L2_MEMORY_DMABUF,
format={type=V4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix={width=352,
height=144, pixelformat=v4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=101670, colorspace=V4L2_COLORSPACE_SRGB}}}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0})
= -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=1, memory=V4L2_MEMORY_DMABUF,
format={type=V4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix={width=352,
height=288, pixelformat=v4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=406682, colorspace=V4L2_COLORSPACE_SRGB}}}) = 0 ({index=0,
count=1})
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_DMABUF, length=406682, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=1 => 1}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_DMABUF, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(6, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=1}) = -1 EBUSY (Device or resource
busy)
ioctl(6, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=0}) = -1 EBUSY (Device or resource
busy)
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=0 => 0}) = 0
ioctl(6, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=1 => 1}) = 0
ioctl(6, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_DMABUF, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(6, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=0 => 0}) = 0
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=1 => 1}) = 0
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=0 => 0}) = 0
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=0, memory=V4L2_MEMORY_DMABUF,
format={type=V4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix={width=352,
height=288, pixelformat=v4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}}) = 0 ({index=0,
count=0})
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=1, memory=V4L2_MEMORY_DMABUF,
format={type=V4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix={width=352,
height=288, pixelformat=v4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}}) = 0 ({index=0,
count=1})
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=0 => 0}) = 0
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=1, memory=V4L2_MEMORY_DMABUF,
format={type=V4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix={width=352,
height=288, pixelformat=v4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}}) = 0 ({index=0,
count=1})
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_DMABUF, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_DMABUF, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=1})
= -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=1, memory=V4L2_MEMORY_DMABUF,
format={type=V4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix={width=352,
height=288, pixelformat=v4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}}) = 0 ({index=1,
count=1})
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=1,
memory=V4L2_MEMORY_DMABUF, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_DMABUF, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=1,
memory=V4L2_MEMORY_DMABUF, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=2})
= -1 EINVAL (Invalid argument)
ioctl(6, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(6, VIDIOC_CREATE_BUFS, {count=1, memory=V4L2_MEMORY_DMABUF,
format={type=V4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix={width=352,
height=288, pixelformat=v4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}}) = -1 EBUSY
(Device or resource busy)
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=0 => 0}) = 0
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=1, memory=V4L2_MEMORY_DMABUF,
format={type=V4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix={width=352,
height=144, pixelformat=v4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=101670, colorspace=V4L2_COLORSPACE_SRGB}}}) = -1 EINVAL
(Invalid argument)
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0})
= -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) = 0
ioctl(3, VIDIOC_CREATE_BUFS, {count=1, memory=V4L2_MEMORY_DMABUF,
format={type=V4L2_BUF_TYPE_VIDEO_CAPTURE, fmt.pix={width=352,
height=288, pixelformat=v4l2_fourcc('M', 'J', 'P', 'G') /*
V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=406682, colorspace=V4L2_COLORSPACE_SRGB}}}) = 0 ({index=0,
count=1})
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_DMABUF, length=406682, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_DMABUF, count=0 => 0}) = 0
write(1, "\ttest VIDIOC_REQBUFS/CREATE_BUFS"..., 55    test
VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
) = 55
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
ioctl(3, VIDIOC_G_SELECTION, 0x7ffec968cfbc) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_MMAP, count=2 => 2}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=0,
memory=V4L2_MEMORY_MMAP, m.offset=0, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_QUERYBUF, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE, index=1,
memory=V4L2_MEMORY_MMAP, m.offset=0x32000, length=203341, bytesused=0,
flags=V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC|V4L2_BUF_FLAG_TSTAMP_SRC_SOE,
...}) = 0
ioctl(3, VIDIOC_EXPBUF, 0x7ffec968b898) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_EXPBUF, 0x7ffec968b868) = 0
ioctl(3, VIDIOC_EXPBUF, 0x7ffec968b868) = 0
close(4)                                = 0
close(7)                                = 0
ioctl(3, VIDIOC_REQBUFS, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
memory=V4L2_MEMORY_MMAP, count=0 => 0}) = 0
write(1, "\ttest VIDIOC_EXPBUF: \33[32mOK\33[0m"..., 33    test
VIDIOC_EXPBUF: OK
) = 33
ioctl(3, VIDIOC_G_PARM, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
parm.capture={capability=V4L2_CAP_TIMEPERFRAME, capturemode=0,
timeperframe=1/30, extendedmode=0, readbuffers=0}}) = 0
ioctl(3, VIDIOC_S_PARM, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
parm.capture={capability=V4L2_CAP_TIMEPERFRAME, capturemode=0,
timeperframe=1/1000, extendedmode=0, readbuffers=0}} =>
{parm.capture={capability=V4L2_CAP_TIMEPERFRAME, capturemode=0,
timeperframe=1/30, extendedmode=0, readbuffers=0}}) = 0
newfstatat(3, "", {st_mode=S_IFCHR|0660, st_rdev=makedev(0x51, 0),
...}, AT_EMPTY_PATH) = 0
openat(AT_FDCWD, "/sys/dev/char/81:0/device",
O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 4
newfstatat(4, "", {st_mode=S_IFDIR|0755, st_size=0, ...}, AT_EMPTY_PATH) = 0
getdents64(4, 0x559f80976c10 /* 26 entries */, 32768) = 936
openat(AT_FDCWD, "/dev/media0", O_RDWR) = 7
close(4)                                = 0
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=0xf010000 /*
V4L2_CTRL_CLASS_??? */, count=0}) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=0xf010000 /*
V4L2_CTRL_CLASS_??? */, count=0}) = -1 EINVAL (Invalid argument)
ioctl(7, MEDIA_IOC_REQUEST_ALLOC, 0x7ffec96895a0) = -1 ENOTTY
(Inappropriate ioctl for device)
close(7)                                = 0
write(1, "\ttest Requests: \33[32mOK\33[0m (Not"..., 44    test
Requests: OK (Not Supported)
) = 44
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
ioctl(3, VIDIOC_G_SELECTION, 0x7ffec968cfbc) = -1 EINVAL (Invalid argument)
write(1, "\n", 1
)                       = 1
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
ioctl(3, VIDIOC_G_SELECTION, 0x7ffec968cefc) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_INPUT, [0])           = 0
ioctl(3, VIDIOC_S_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}} =>
{fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J',
'P', 'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE,
bytesperline=0, sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) =
0
ioctl(3, VIDIOC_G_PARM, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
parm.capture={capability=V4L2_CAP_TIMEPERFRAME, capturemode=0,
timeperframe=1/30, extendedmode=0, readbuffers=0}}) = 0
ioctl(3, VIDIOC_S_PARM, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
parm.capture={capability=V4L2_CAP_TIMEPERFRAME, capturemode=0,
timeperframe=1/30, extendedmode=0, readbuffers=0}} =>
{parm.capture={capability=V4L2_CAP_TIMEPERFRAME, capturemode=0,
timeperframe=1/30, extendedmode=0, readbuffers=0}}) = 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_??? */,
count=7, controls=[{id=V4L2_CID_BRIGHTNESS, size=0, value=0,
value64=0}, {id=V4L2_CID_CONTRAST, size=0, value=35, value64=35},
{id=V4L2_CID_SATURATION, size=0, value=62, value64=62},
{id=V4L2_CID_HUE, size=0, value=0, value64=0},
{id=V4L2_CID_AUTO_WHITE_BALANCE, size=0, value=0, value64=0},
{id=V4L2_CID_GAMMA, size=0, value=0, value64=0},
{id=V4L2_CID_POWER_LINE_FREQUENCY, size=0, value=0, value64=0}]} =>
{controls=[{id=V4L2_CID_BRIGHTNESS, size=0, value=0, value64=0},
{id=V4L2_CID_CONTRAST, size=0, value=35, value64=35},
{id=V4L2_CID_SATURATION, size=0, value=62, value64=62},
{id=V4L2_CID_HUE, size=0, value=0, value64=0},
{id=V4L2_CID_AUTO_WHITE_BALANCE, size=0, value=0, value64=0},
{id=V4L2_CID_GAMMA, size=0, value=100, value64=100},
{id=V4L2_CID_POWER_LINE_FREQUENCY, size=0, value=0, value64=0}]}) = 0
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
ioctl(3, VIDIOC_G_SELECTION, 0x7ffec968cefc) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_INPUT, [0])           = 0
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
ioctl(3, VIDIOC_G_SELECTION, 0x7ffec968cefc) = -1 EINVAL (Invalid argument)
ioctl(3, VIDIOC_S_INPUT, [0])           = 0
ioctl(3, VIDIOC_S_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J', 'P',
'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}} =>
{fmt.pix={width=352, height=288, pixelformat=v4l2_fourcc('M', 'J',
'P', 'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE,
bytesperline=0, sizeimage=203341, colorspace=V4L2_COLORSPACE_SRGB}}) =
0
ioctl(3, VIDIOC_G_PARM, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
parm.capture={capability=V4L2_CAP_TIMEPERFRAME, capturemode=0,
timeperframe=1/30, extendedmode=0, readbuffers=0}}) = 0
ioctl(3, VIDIOC_S_PARM, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
parm.capture={capability=V4L2_CAP_TIMEPERFRAME, capturemode=0,
timeperframe=1/30, extendedmode=0, readbuffers=0}} =>
{parm.capture={capability=V4L2_CAP_TIMEPERFRAME, capturemode=0,
timeperframe=1/30, extendedmode=0, readbuffers=0}}) = 0
ioctl(3, VIDIOC_S_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_??? */,
count=7, controls=[{id=V4L2_CID_BRIGHTNESS, size=0, value=0,
value64=0}, {id=V4L2_CID_CONTRAST, size=0, value=35, value64=35},
{id=V4L2_CID_SATURATION, size=0, value=62, value64=62},
{id=V4L2_CID_HUE, size=0, value=0, value64=0},
{id=V4L2_CID_AUTO_WHITE_BALANCE, size=0, value=0, value64=0},
{id=V4L2_CID_GAMMA, size=0, value=100, value64=100},
{id=V4L2_CID_POWER_LINE_FREQUENCY, size=0, value=0, value64=0}]} =>
{controls=[{id=V4L2_CID_BRIGHTNESS, size=0, value=0, value64=0},
{id=V4L2_CID_CONTRAST, size=0, value=35, value64=35},
{id=V4L2_CID_SATURATION, size=0, value=62, value64=62},
{id=V4L2_CID_HUE, size=0, value=0, value64=0},
{id=V4L2_CID_AUTO_WHITE_BALANCE, size=0, value=0, value64=0},
{id=V4L2_CID_GAMMA, size=0, value=100, value64=100},
{id=V4L2_CID_POWER_LINE_FREQUENCY, size=0, value=0, value64=0}]}) = 0
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
ioctl(3, VIDIOC_G_SELECTION, 0x7ffec968cefc) = -1 EINVAL (Invalid argument)
write(1, "Total for uvcvideo device /dev/v"..., 81Total for uvcvideo
device /dev/video0: 46, Succeeded: 46, Failed: 0, Warnings: 1
) = 81
close(3)                                = 0
close(6)                                = 0
close(5)                                = 0
exit_group(0)                           = ?
+++ exited with 0 +++
# dmesg
[  197.517910] usb 3-1: uvc_v4l2_open
[  197.615304] usb 3-1: Resuming interface 0
[  197.615316] usb 3-1: Resuming interface 1
[  197.621646] usb 3-1: uvc_v4l2_release
[  197.641150] usb 3-1: uvc_v4l2_open
[  197.648560] usb 3-1: uvc_v4l2_open
[  197.651898] usb 3-1: uvc_v4l2_open
[  197.652014] usb 3-1: uvc_v4l2_open
[  197.652124] usb 3-1: uvc_v4l2_open
[  197.652230] usb 3-1: uvc_v4l2_open
[  197.652338] usb 3-1: uvc_v4l2_open
[  197.652445] usb 3-1: uvc_v4l2_open
[  197.652554] usb 3-1: uvc_v4l2_open
[  197.652662] usb 3-1: uvc_v4l2_open
[  197.652800] usb 3-1: uvc_v4l2_open
[  197.652948] usb 3-1: uvc_v4l2_open
[  197.653165] usb 3-1: uvc_v4l2_open
[  197.653333] usb 3-1: uvc_v4l2_open
[  197.653464] usb 3-1: uvc_v4l2_open
[  197.653593] usb 3-1: uvc_v4l2_open
[  197.653713] usb 3-1: uvc_v4l2_open
[  197.653894] usb 3-1: uvc_v4l2_open
[  197.654014] usb 3-1: uvc_v4l2_open
[  197.654144] usb 3-1: uvc_v4l2_open
[  197.654293] usb 3-1: uvc_v4l2_open
[  197.654441] usb 3-1: uvc_v4l2_open
[  197.654589] usb 3-1: uvc_v4l2_open
[  197.654735] usb 3-1: uvc_v4l2_open
[  197.654907] usb 3-1: uvc_v4l2_open
[  197.655057] usb 3-1: uvc_v4l2_open
[  197.655200] usb 3-1: uvc_v4l2_open
[  197.655344] usb 3-1: uvc_v4l2_open
[  197.655490] usb 3-1: uvc_v4l2_open
[  197.655633] usb 3-1: uvc_v4l2_open
[  197.655793] usb 3-1: uvc_v4l2_open
[  197.655943] usb 3-1: uvc_v4l2_open
[  197.656082] usb 3-1: uvc_v4l2_open
[  197.656225] usb 3-1: uvc_v4l2_open
[  197.656369] usb 3-1: uvc_v4l2_open
[  197.656511] usb 3-1: uvc_v4l2_open
[  197.656652] usb 3-1: uvc_v4l2_open
[  197.656815] usb 3-1: uvc_v4l2_open
[  197.656963] usb 3-1: uvc_v4l2_open
[  197.657106] usb 3-1: uvc_v4l2_open
[  197.657249] usb 3-1: uvc_v4l2_open
[  197.657390] usb 3-1: uvc_v4l2_open
[  197.657533] usb 3-1: uvc_v4l2_open
[  197.657672] usb 3-1: uvc_v4l2_open
[  197.657837] usb 3-1: uvc_v4l2_open
[  197.657987] usb 3-1: uvc_v4l2_open
[  197.658129] usb 3-1: uvc_v4l2_open
[  197.658271] usb 3-1: uvc_v4l2_open
[  197.658416] usb 3-1: uvc_v4l2_open
[  197.658551] usb 3-1: uvc_v4l2_open
[  197.658691] usb 3-1: uvc_v4l2_open
[  197.658893] usb 3-1: uvc_v4l2_open
[  197.659178] usb 3-1: uvc_v4l2_open
[  197.659635] usb 3-1: uvc_v4l2_open
[  197.659876] usb 3-1: uvc_v4l2_open
[  197.660080] usb 3-1: uvc_v4l2_open
[  197.660284] usb 3-1: uvc_v4l2_open
[  197.660481] usb 3-1: uvc_v4l2_open
[  197.660684] usb 3-1: uvc_v4l2_open
[  197.661057] usb 3-1: uvc_v4l2_open
[  197.661283] usb 3-1: uvc_v4l2_open
[  197.661493] usb 3-1: uvc_v4l2_open
[  197.661702] usb 3-1: uvc_v4l2_open
[  197.661931] usb 3-1: uvc_v4l2_open
[  197.662142] usb 3-1: uvc_v4l2_open
[  197.662356] usb 3-1: uvc_v4l2_open
[  197.662559] usb 3-1: uvc_v4l2_open
[  197.662786] usb 3-1: uvc_v4l2_open
[  197.663009] usb 3-1: uvc_v4l2_open
[  197.663222] usb 3-1: uvc_v4l2_open
[  197.663435] usb 3-1: uvc_v4l2_open
[  197.663644] usb 3-1: uvc_v4l2_open
[  197.663864] usb 3-1: uvc_v4l2_open
[  197.664056] usb 3-1: uvc_v4l2_open
[  197.664260] usb 3-1: uvc_v4l2_open
[  197.664458] usb 3-1: uvc_v4l2_open
[  197.664830] usb 3-1: uvc_v4l2_open
[  197.665185] usb 3-1: uvc_v4l2_open
[  197.665397] usb 3-1: uvc_v4l2_open
[  197.665610] usb 3-1: uvc_v4l2_open
[  197.665828] usb 3-1: uvc_v4l2_open
[  197.666040] usb 3-1: uvc_v4l2_open
[  197.666243] usb 3-1: uvc_v4l2_open
[  197.666452] usb 3-1: uvc_v4l2_open
[  197.666666] usb 3-1: uvc_v4l2_open
[  197.666887] usb 3-1: uvc_v4l2_open
[  197.667101] usb 3-1: uvc_v4l2_open
[  197.667316] usb 3-1: uvc_v4l2_open
[  197.667522] usb 3-1: uvc_v4l2_open
[  197.667736] usb 3-1: uvc_v4l2_open
[  197.668002] usb 3-1: uvc_v4l2_open
[  197.668216] usb 3-1: uvc_v4l2_open
[  197.668427] usb 3-1: uvc_v4l2_open
[  197.668642] usb 3-1: uvc_v4l2_open
[  197.668874] usb 3-1: uvc_v4l2_open
[  197.669075] usb 3-1: uvc_v4l2_open
[  197.669273] usb 3-1: uvc_v4l2_open
[  197.669588] usb 3-1: uvc_v4l2_open
[  197.669845] usb 3-1: uvc_v4l2_open
[  197.670061] usb 3-1: uvc_v4l2_open
[  197.670267] usb 3-1: uvc_v4l2_open
[  197.670465] usb 3-1: uvc_v4l2_open
[  197.670653] usb 3-1: uvc_v4l2_release
[  197.670851] usb 3-1: uvc_v4l2_release
[  197.671034] usb 3-1: uvc_v4l2_release
[  197.671226] usb 3-1: uvc_v4l2_release
[  197.671419] usb 3-1: uvc_v4l2_release
[  197.671608] usb 3-1: uvc_v4l2_release
[  197.671813] usb 3-1: uvc_v4l2_release
[  197.672005] usb 3-1: uvc_v4l2_release
[  197.672195] usb 3-1: uvc_v4l2_release
[  197.672383] usb 3-1: uvc_v4l2_release
[  197.672575] usb 3-1: uvc_v4l2_release
[  197.672774] usb 3-1: uvc_v4l2_release
[  197.672933] usb 3-1: uvc_v4l2_release
[  197.673089] usb 3-1: uvc_v4l2_release
[  197.673232] usb 3-1: uvc_v4l2_release
[  197.673404] usb 3-1: uvc_v4l2_release
[  197.673549] usb 3-1: uvc_v4l2_release
[  197.673699] usb 3-1: uvc_v4l2_release
[  197.673874] usb 3-1: uvc_v4l2_release
[  197.674025] usb 3-1: uvc_v4l2_release
[  197.674162] usb 3-1: uvc_v4l2_release
[  197.674296] usb 3-1: uvc_v4l2_release
[  197.674435] usb 3-1: uvc_v4l2_release
[  197.674588] usb 3-1: uvc_v4l2_release
[  197.674735] usb 3-1: uvc_v4l2_release
[  197.674890] usb 3-1: uvc_v4l2_release
[  197.675028] usb 3-1: uvc_v4l2_release
[  197.675164] usb 3-1: uvc_v4l2_release
[  197.675299] usb 3-1: uvc_v4l2_release
[  197.675436] usb 3-1: uvc_v4l2_release
[  197.675570] usb 3-1: uvc_v4l2_release
[  197.675704] usb 3-1: uvc_v4l2_release
[  197.675855] usb 3-1: uvc_v4l2_release
[  197.675976] usb 3-1: uvc_v4l2_release
[  197.676113] usb 3-1: uvc_v4l2_release
[  197.676250] usb 3-1: uvc_v4l2_release
[  197.676404] usb 3-1: uvc_v4l2_release
[  197.676549] usb 3-1: uvc_v4l2_release
[  197.676686] usb 3-1: uvc_v4l2_release
[  197.676848] usb 3-1: uvc_v4l2_release
[  197.676985] usb 3-1: uvc_v4l2_release
[  197.677120] usb 3-1: uvc_v4l2_release
[  197.677256] usb 3-1: uvc_v4l2_release
[  197.677392] usb 3-1: uvc_v4l2_release
[  197.677554] usb 3-1: uvc_v4l2_release
[  197.677697] usb 3-1: uvc_v4l2_release
[  197.677867] usb 3-1: uvc_v4l2_release
[  197.678027] usb 3-1: uvc_v4l2_release
[  197.678171] usb 3-1: uvc_v4l2_release
[  197.678318] usb 3-1: uvc_v4l2_release
[  197.678435] usb 3-1: uvc_v4l2_release
[  197.678588] usb 3-1: uvc_v4l2_release
[  197.678719] usb 3-1: uvc_v4l2_release
[  197.678885] usb 3-1: uvc_v4l2_release
[  197.679025] usb 3-1: uvc_v4l2_release
[  197.679240] usb 3-1: uvc_v4l2_release
[  197.679374] usb 3-1: uvc_v4l2_release
[  197.679513] usb 3-1: uvc_v4l2_release
[  197.679649] usb 3-1: uvc_v4l2_release
[  197.679798] usb 3-1: uvc_v4l2_release
[  197.679941] usb 3-1: uvc_v4l2_release
[  197.680076] usb 3-1: uvc_v4l2_release
[  197.680207] usb 3-1: uvc_v4l2_release
[  197.680342] usb 3-1: uvc_v4l2_release
[  197.680477] usb 3-1: uvc_v4l2_release
[  197.680608] usb 3-1: uvc_v4l2_release
[  197.680743] usb 3-1: uvc_v4l2_release
[  197.680901] usb 3-1: uvc_v4l2_release
[  197.681070] usb 3-1: uvc_v4l2_release
[  197.681418] usb 3-1: uvc_v4l2_release
[  197.681662] usb 3-1: uvc_v4l2_release
[  197.681851] usb 3-1: uvc_v4l2_release
[  197.682066] usb 3-1: uvc_v4l2_release
[  197.682231] usb 3-1: uvc_v4l2_release
[  197.682433] usb 3-1: uvc_v4l2_release
[  197.682564] usb 3-1: uvc_v4l2_release
[  197.682770] usb 3-1: uvc_v4l2_release
[  197.682932] usb 3-1: uvc_v4l2_release
[  197.683124] usb 3-1: uvc_v4l2_release
[  197.683251] usb 3-1: uvc_v4l2_release
[  197.683444] usb 3-1: uvc_v4l2_release
[  197.683609] usb 3-1: uvc_v4l2_release
[  197.683826] usb 3-1: uvc_v4l2_release
[  197.683968] usb 3-1: uvc_v4l2_release
[  197.684080] usb 3-1: uvc_v4l2_release
[  197.684234] usb 3-1: uvc_v4l2_release
[  197.684371] usb 3-1: uvc_v4l2_release
[  197.684469] usb 3-1: uvc_v4l2_release
[  197.684563] usb 3-1: uvc_v4l2_release
[  197.684739] usb 3-1: uvc_v4l2_release
[  197.684933] usb 3-1: uvc_v4l2_release
[  197.685102] usb 3-1: uvc_v4l2_release
[  197.685262] usb 3-1: uvc_v4l2_release
[  197.685421] usb 3-1: uvc_v4l2_release
[  197.685585] usb 3-1: uvc_v4l2_release
[  197.685739] usb 3-1: uvc_v4l2_release
[  197.685915] usb 3-1: uvc_v4l2_release
[  197.686079] usb 3-1: uvc_v4l2_release
[  197.686236] usb 3-1: uvc_v4l2_release
[  197.686398] usb 3-1: uvc_v4l2_release
[  198.194867] usb 3-1: Failed to query (GET_CUR) UVC control 11 on
unit 2: -110 (exp. 1).
[  198.342219] usb 3-1: Control error 0
[  198.349625] usb 3-1: Control 0x00980001 not found
[  198.354191] usb 3-1: Control 0x00000000 not found
[  198.355178] usb 3-1: Control 0x00980904 not found
[  198.355348] usb 3-1: Control 0x00980905 not found
[  198.355503] usb 3-1: Control 0x00980906 not found
[  198.355665] usb 3-1: Control 0x00980907 not found
[  198.355850] usb 3-1: Control 0x00980908 not found
[  198.356045] usb 3-1: Control 0x00980909 not found
[  198.356236] usb 3-1: Control 0x0098090a not found
[  198.356394] usb 3-1: Control 0x0098090b not found
[  198.356891] usb 3-1: Control 0x0098090d not found
[  198.357085] usb 3-1: Control 0x0098090e not found
[  198.357246] usb 3-1: Control 0x0098090f not found
[  198.357727] usb 3-1: Control 0x00980911 not found
[  198.357930] usb 3-1: Control 0x00980912 not found
[  198.358084] usb 3-1: Control 0x00980913 not found
[  198.358241] usb 3-1: Control 0x00980914 not found
[  198.358402] usb 3-1: Control 0x00980915 not found
[  198.358560] usb 3-1: Control 0x00980916 not found
[  198.358717] usb 3-1: Control 0x00980917 not found
[  198.359608] usb 3-1: Control 0x00980919 not found
[  198.360777] usb 3-1: Control 0x0098091d not found
[  198.360997] usb 3-1: Control 0x0098091e not found
[  198.361172] usb 3-1: Control 0x0098091f not found
[  198.361342] usb 3-1: Control 0x00980920 not found
[  198.361501] usb 3-1: Control 0x00980921 not found
[  198.361668] usb 3-1: Control 0x00980922 not found
[  198.361850] usb 3-1: Control 0x00980923 not found
[  198.362048] usb 3-1: Control 0x00980924 not found
[  198.362216] usb 3-1: Control 0x00980925 not found
[  198.362383] usb 3-1: Control 0x00980926 not found
[  198.362555] usb 3-1: Control 0x00980927 not found
[  198.362720] usb 3-1: Control 0x00980928 not found
[  198.362937] usb 3-1: Control 0x00980929 not found
[  198.363112] usb 3-1: Control 0x0098092a not found
[  198.363288] usb 3-1: Control 0x08000000 not found
[  198.365193] usb 3-1: Control 0x00000000 not found
[  198.365707] usb 3-1: Control 0x00980904 not found
[  198.365827] usb 3-1: Control 0x00980905 not found
[  198.365932] usb 3-1: Control 0x00980906 not found
[  198.366034] usb 3-1: Control 0x00980907 not found
[  198.366137] usb 3-1: Control 0x00980908 not found
[  198.366238] usb 3-1: Control 0x00980909 not found
[  198.366338] usb 3-1: Control 0x0098090a not found
[  198.366442] usb 3-1: Control 0x0098090b not found
[  198.366645] usb 3-1: Control 0x0098090d not found
[  198.366750] usb 3-1: Control 0x0098090e not found
[  198.366862] usb 3-1: Control 0x0098090f not found
[  198.367064] usb 3-1: Control 0x00980911 not found
[  198.367168] usb 3-1: Control 0x00980912 not found
[  198.367267] usb 3-1: Control 0x00980913 not found
[  198.367373] usb 3-1: Control 0x00980914 not found
[  198.367474] usb 3-1: Control 0x00980915 not found
[  198.367576] usb 3-1: Control 0x00980916 not found
[  198.367682] usb 3-1: Control 0x00980917 not found
[  198.367901] usb 3-1: Control 0x00980919 not found
[  198.368312] usb 3-1: Control 0x0098091d not found
[  198.368417] usb 3-1: Control 0x0098091e not found
[  198.368521] usb 3-1: Control 0x0098091f not found
[  198.368625] usb 3-1: Control 0x00980920 not found
[  198.368731] usb 3-1: Control 0x00980921 not found
[  198.368847] usb 3-1: Control 0x00980922 not found
[  198.368950] usb 3-1: Control 0x00980923 not found
[  198.369052] usb 3-1: Control 0x00980924 not found
[  198.369152] usb 3-1: Control 0x00980925 not found
[  198.369253] usb 3-1: Control 0x00980926 not found
[  198.369355] usb 3-1: Control 0x00980927 not found
[  198.369457] usb 3-1: Control 0x00980928 not found
[  198.369557] usb 3-1: Control 0x00980929 not found
[  198.369659] usb 3-1: Control 0x0098092a not found
[  198.369766] usb 3-1: Control 0x08000000 not found
[  198.562079] usb 3-1: Control 2/10 info change len 6
[  198.578049] usb 3-1: Control 2/10 info change len 6
[  198.590060] usb 3-1: Control 2/10 info change len 6
[  198.915639] usb 3-1: Control 0x00000000 not found
[  198.915846] usb 3-1: Control 0x00000000 not found
[  199.003400] usb 3-1: Control 0x00000000 not found
[  199.003617] usb 3-1: Control 0x00000000 not found
[  199.003797] usb 3-1: Control 0x00000000 not found
[  199.014452] usb 3-1: uvc_v4l2_poll
[  199.014605] usb 3-1: uvc_v4l2_poll
[  199.014939] usb 3-1: uvc_v4l2_poll
[  199.015260] usb 3-1: uvc_v4l2_poll
[  199.015566] usb 3-1: uvc_v4l2_poll
[  199.016620] usb 3-1: uvc_v4l2_poll
[  199.017310] usb 3-1: uvc_v4l2_poll
[  199.017878] usb 3-1: uvc_v4l2_poll
[  199.018434] usb 3-1: uvc_v4l2_poll
[  199.019630] usb 3-1: uvc_v4l2_poll
[  199.020191] usb 3-1: uvc_v4l2_poll
[  199.020718] usb 3-1: uvc_v4l2_poll
[  199.036978] usb 3-1: Setting frame interval to 0/0 (4294967295)
[  199.087753] usb 3-1: Setting frame interval to 0/1 (0)
[  199.138629] usb 3-1: Setting frame interval to 1/0 (4294967295)
[  199.194967] usb 3-1: Trying format 0x47504a4d (MJPG): 352x288
[  199.194987] usb 3-1: Using default frame interval 33333.3 us (30.0 fps)
[  199.246121] usb 3-1: Trying format 0xffffffff (\xff\xff\xff\xff):
4294967295x4294967295
[  199.246138] usb 3-1: Using default frame interval 33333.3 us (30.0 fps)
[  199.302243] usb 3-1: Trying format 0xffffffff (\xff\xff\xff\xff):
4294967295x4294967295
[  199.302265] usb 3-1: Using default frame interval 33333.3 us (30.0 fps)
[  199.358199] usb 3-1: Trying format 0x47504a4d (MJPG): 352x288
[  199.358219] usb 3-1: Using default frame interval 33333.3 us (30.0 fps)
[  199.409614] usb 3-1: Trying format 0x47504a4d (MJPG): 0x0
[  199.409632] usb 3-1: Using default frame interval 33333.3 us (30.0 fps)
[  199.463438] usb 3-1: Trying format 0x47504a4d (MJPG): 352x288
[  199.463454] usb 3-1: Using default frame interval 33333.3 us (30.0 fps)
[  199.517546] usb 3-1: Trying format 0x47504a4d (MJPG): 1x1
[  199.517565] usb 3-1: Using default frame interval 33333.3 us (30.0 fps)
[  199.571217] usb 3-1: Trying format 0x47504a4d (MJPG): 16384x16384
[  199.571232] usb 3-1: Using default frame interval 33333.3 us (30.0 fps)
[  199.627351] usb 3-1: Trying format 0x47504a4d (MJPG): 352x288
[  199.627366] usb 3-1: Using default frame interval 33333.3 us (30.0 fps)
[  199.680594] usb 3-1: uvc_v4l2_release
[  199.680744] usb 3-1: uvc_v4l2_open
[  199.696173] usb 3-1: uvc_v4l2_release
[  199.696290] usb 3-1: uvc_v4l2_open
[  199.699261] usb 3-1: Setting frame interval to 1/1000 (10000)
[  199.751851] usb 3-1: uvc_v4l2_release
[  199.752043] usb 3-1: uvc_v4l2_open
[  199.752968] usb 3-1: uvc_v4l2_release
[  199.753232] usb 3-1: uvc_v4l2_open
[  199.754759] usb 3-1: Trying format 0x47504a4d (MJPG): 352x288
[  199.754780] usb 3-1: Using default frame interval 33333.3 us (30.0 fps)
[  199.806005] usb 3-1: Setting frame interval to 1/30 (333333)
[  199.955492] usb 3-1: uvc_v4l2_release
[  199.955702] usb 3-1: uvc_v4l2_open
[  199.956884] usb 3-1: uvc_v4l2_release
[  199.957079] usb 3-1: uvc_v4l2_open
[  199.958030] usb 3-1: Control 2/10 info change len 6
[  199.958195] usb 3-1: Trying format 0x47504a4d (MJPG): 352x288
[  199.958211] usb 3-1: Using default frame interval 33333.3 us (30.0 fps)
[  200.009550] usb 3-1: Setting frame interval to 1/30 (333333)
[  200.119591] usb 3-1: uvc_v4l2_release
[  200.119793] usb 3-1: uvc_v4l2_open
[  200.121250] usb 3-1: uvc_v4l2_release
[  200.121496] usb 3-1: uvc_v4l2_release

>
> diff --git a/utils/v4l2-compliance/v4l2-test-controls.cpp
> b/utils/v4l2-compliance/v4l2-test-controls.cpp
> index a303baef560e..8731c9eb635e 100644
> --- a/utils/v4l2-compliance/v4l2-test-controls.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-controls.cpp
> @@ -851,7 +851,7 @@ int testExtendedControls(struct node *node)
>                 warn("s_ext_ctrls returned EILSEQ\n");
>                 ret = 0;
>         }
> -       if (ret && !multiple_classes)
> +       if (ret && !(ret == EACCES && is_uvcvideo) && !multiple_classes)
>                 return fail("could not set all controls of a specific class\n");
>         if (ret != EINVAL && multiple_classes)
>                 return fail("should get EINVAL when setting
> mixed-class controls\n");
>
> If so  I will prepare v4 of
> https://patchwork.linuxtv.org/project/linux-media/patch/20210317143453.483470-1-ribalda@chromium.org/
>
> Thanks!
