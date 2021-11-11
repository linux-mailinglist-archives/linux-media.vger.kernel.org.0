Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA4EC44DD14
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 22:27:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234217AbhKKVaZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 16:30:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234385AbhKKVaT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 16:30:19 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B6D6C061205
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 13:27:29 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso10853716otj.1
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 13:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OzU6nAp3jQoVPwlnl5NTxIaf7B1Fs165gtKKDkFQjio=;
        b=oel89JEnd2piZqM1FizteORdoedJ5pEOCJvc8piIBKyTa3xOrrY5TPoUcTrbtkWXa1
         AziXv9nEbz6Y4IHhjDIhBvHLbrybh6zSQVBZI6TwUWImDDArLs90FY6Gphf6yuaolEwG
         NCK798Rw1jHepKL6/b0MnRUW7V8Gd7eyXyTVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OzU6nAp3jQoVPwlnl5NTxIaf7B1Fs165gtKKDkFQjio=;
        b=iE0NB2JlT44UBNIxpPyfa5ozfcQRCBmYHXiwA16otwl9OiiZlqVu+UWHoWwOwQrPXy
         t1U+dNBFS0+XUM1QG3QaLXZFPUFeGnbGmDv3f/5dKe3mTvAkDTmnApPpz3di15dpXRr/
         aPOEBzuh5tT2rbdmfKmwHoKlshkDUePZE/6a26CRPV0QsaPCuWc9qm7SYDMXBP1lHo1M
         qORMjLZwfw5gelHlVCYneHDFNSDzcpjRbyJWGR0U3vqa18AYiiFWDTymkljOXAPq0l0Z
         RAK3QFzDkPmyUGO4AbSVqoxDtqGVeaDWACFhYmjN2eGh1mSw/FJDkMB9X0x9xijy9iog
         cLPQ==
X-Gm-Message-State: AOAM532I3/oiWtu07cwsc0Pc/eevlD6/NM1qk7Jp+pyyckYyi+m4IxKz
        kHJdU3zk3I3iNL2hSjDqXOe2wq0FwwDYUw==
X-Google-Smtp-Source: ABdhPJyn8mAeUI2ohd/yb5pRvWYGn4yMo26GndaqWOp8TGNNAkHAXZM3KLLp7Po1VwCESZ2nNS6O1g==
X-Received: by 2002:a9d:1b0:: with SMTP id e45mr7888807ote.23.1636666047282;
        Thu, 11 Nov 2021 13:27:27 -0800 (PST)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id r37sm954397otv.54.2021.11.11.13.27.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 13:27:26 -0800 (PST)
Received: by mail-oi1-f173.google.com with SMTP id be32so13931927oib.11
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 13:27:26 -0800 (PST)
X-Received: by 2002:aca:be54:: with SMTP id o81mr21876295oif.64.1636666045132;
 Thu, 11 Nov 2021 13:27:25 -0800 (PST)
MIME-Version: 1.0
References: <20210909150046.57615-1-ribalda@chromium.org> <CADvTj4rB5ZThAh2oPkx2=mqUir4Bc_uFFaL6DV_YyOYNSDrXEQ@mail.gmail.com>
 <CANiDSCvpRezQMEBbmv4z9ttPt9sThHXR2xmnizzacYuMDri-KQ@mail.gmail.com> <CADvTj4pAxGYeuQEN_ktHko41z=bCWWb1UtbdngezMoUUsvsj6Q@mail.gmail.com>
In-Reply-To: <CADvTj4pAxGYeuQEN_ktHko41z=bCWWb1UtbdngezMoUUsvsj6Q@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 11 Nov 2021 22:27:12 +0100
X-Gmail-Original-Message-ID: <CANiDSCvkcr8hbdo4Ea2p3BdMPiPE2RC_HcHHmUdm9uy1XN2E4Q@mail.gmail.com>
Message-ID: <CANiDSCvkcr8hbdo4Ea2p3BdMPiPE2RC_HcHHmUdm9uy1XN2E4Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] Follow-up patches for uvc v4l2-compliance
To:     James Hilliard <james.hilliard1@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        tfiga@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi James

That series depends on this v4l2-compliance change:
https://patchwork.linuxtv.org/project/linux-media/patch/20210317143453.483470-1-ribalda@chromium.org/

Could you please apply it and retry?

Thanks!


On Thu, 11 Nov 2021 at 22:22, James Hilliard <james.hilliard1@gmail.com> wrote:
>
> On Thu, Nov 11, 2021 at 1:53 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
> >
> > Hi James
> >
> > Thanks for testing the patches. Are you using them on top of linus/master?
>
> I'm testing on 5.15.0 plus all the newer uvc patches applied from master
> (https://github.com/torvalds/linux/commits/master/drivers/media/usb/uvc) with
> this series on top of that.
>
> >
> > Could you send the output of
> >
> >
> > dmesg -c > /dev/null
> > v4l2-ctl --all -d /dev/videoX
> > strace -f v4l2-compliance -d /dev/videoX -E
> > dmesg
>
> # dmesg -c > /dev/null
> # v4l2-ctl --all -d /dev/video0
> Driver Info:
> Driver name      : uvcvideo
> Card type        : HD Webcam C525
> Bus info         : usb-0000:00:1a.0-1.4
> Driver version   : 5.15.0
> Capabilities     : 0x84a00001
> Video Capture
> Metadata Capture
> Streaming
> Extended Pix Format
> Device Capabilities
> Device Caps      : 0x04200001
> Video Capture
> Streaming
> Extended Pix Format
> Media Driver Info:
> Driver name      : uvcvideo
> Model            : HD Webcam C525
> Serial           : 28D79660
> Bus info         : usb-0000:00:1a.0-1.4
> Media version    : 5.15.0
> Hardware revision: 0x00000010 (16)
> Driver version   : 5.15.0
> Interface Info:
> ID               : 0x03000002
> Type             : V4L Video
> Entity Info:
> ID               : 0x00000001 (1)
> Name             : Video Capture 3
> Function         : V4L2 I/O
> Flags            : default
> Pad 0x01000007   : 0: Sink
>  Link 0x02000019: from remote pad 0x100000a of entity 'Extension 5'
> (Video Pixel Formatter): Data, Enabled, Immutable
> Priority: 2
> Video input : 0 (Camera 1: ok)
> Format Video Capture:
> Width/Height      : 640/480
> Pixel Format      : 'YUYV' (YUYV 4:2:2)
> Field             : None
> Bytes per Line    : 1280
> Size Image        : 614400
> Colorspace        : sRGB
> Transfer Function : Rec. 709
> YCbCr/HSV Encoding: ITU-R 601
> Quantization      : Default (maps to Limited Range)
> Flags             :
> Crop Capability Video Capture:
> Bounds      : Left 0, Top 0, Width 640, Height 480
> Default     : Left 0, Top 0, Width 640, Height 480
> Pixel Aspect: 1/1
> Selection Video Capture: crop_default, Left 0, Top 0, Width 640,
> Height 480, Flags:
> Selection Video Capture: crop_bounds, Left 0, Top 0, Width 640, Height
> 480, Flags:
> Streaming Parameters Video Capture:
> Capabilities     : timeperframe
> Frames per second: 30.000 (30/1)
> Read buffers     : 0
>
> User Controls
>
>                      brightness 0x00980900 (int)    : min=0 max=255
> step=1 default=128 value=128
>                        contrast 0x00980901 (int)    : min=0 max=255
> step=1 default=32 value=32
>                      saturation 0x00980902 (int)    : min=0 max=255
> step=1 default=32 value=32
>         white_balance_automatic 0x0098090c (bool)   : default=1 value=1
>                            gain 0x00980913 (int)    : min=0 max=255
> step=1 default=64 value=64
>            power_line_frequency 0x00980918 (menu)   : min=0 max=2
> default=2 value=2 (60 Hz)
> 0: Disabled
> 1: 50 Hz
> 2: 60 Hz
>       white_balance_temperature 0x0098091a (int)    : min=2800
> max=6500 step=1 default=5500 value=5500 flags=inactive
>                       sharpness 0x0098091b (int)    : min=0 max=255
> step=1 default=22 value=22
>          backlight_compensation 0x0098091c (int)    : min=0 max=1
> step=1 default=1 value=1
>
> Camera Controls
>
>                   auto_exposure 0x009a0901 (menu)   : min=0 max=3
> default=3 value=3 (Aperture Priority Mode)
> 1: Manual Mode
> 3: Aperture Priority Mode
>          exposure_time_absolute 0x009a0902 (int)    : min=3 max=2047
> step=1 default=166 value=166 flags=inactive
>      exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=1
>                    pan_absolute 0x009a0908 (int)    : min=-36000
> max=36000 step=3600 default=0 value=0
>                   tilt_absolute 0x009a0909 (int)    : min=-36000
> max=36000 step=3600 default=0 value=0
>                  focus_absolute 0x009a090a (int)    : min=0 max=255
> step=5 default=60 value=60 flags=inactive
>      focus_automatic_continuous 0x009a090c (bool)   : default=1 value=1
>                   zoom_absolute 0x009a090d (int)    : min=1 max=5
> step=1 default=1 value=1
> # strace -f v4l2-compliance -d /dev/video0 -E
> execve("/usr/bin/v4l2-compliance", ["v4l2-compliance", "-d",
> "/dev/video0", "-E"], 0x7ffcef2e90f0 /* 13 vars */) = 0
> brk(NULL)                               = 0x560ce183b000
> access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
> openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = -1 ENOENT
> (No such file or directory)
> openat(AT_FDCWD, "/lib64/glibc-hwcaps/x86-64-v2/libv4l2.so.0",
> O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
> newfstatat(AT_FDCWD, "/lib64/glibc-hwcaps/x86-64-v2", 0x7ffde5e56c80,
> 0) = -1 ENOENT (No such file or directory)
> openat(AT_FDCWD, "/lib64/tls/x86_64/x86_64/libv4l2.so.0",
> O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
> newfstatat(AT_FDCWD, "/lib64/tls/x86_64/x86_64", 0x7ffde5e56c80, 0) =
> -1 ENOENT (No such file or directory)
> openat(AT_FDCWD, "/lib64/tls/x86_64/libv4l2.so.0", O_RDONLY|O_CLOEXEC)
> = -1 ENOENT (No such file or directory)
> newfstatat(AT_FDCWD, "/lib64/tls/x86_64", 0x7ffde5e56c80, 0) = -1
> ENOENT (No such file or directory)
> openat(AT_FDCWD, "/lib64/tls/x86_64/libv4l2.so.0", O_RDONLY|O_CLOEXEC)
> = -1 ENOENT (No such file or directory)
> newfstatat(AT_FDCWD, "/lib64/tls/x86_64", 0x7ffde5e56c80, 0) = -1
> ENOENT (No such file or directory)
> openat(AT_FDCWD, "/lib64/tls/libv4l2.so.0", O_RDONLY|O_CLOEXEC) = -1
> ENOENT (No such file or directory)
> newfstatat(AT_FDCWD, "/lib64/tls", 0x7ffde5e56c80, 0) = -1 ENOENT (No
> such file or directory)
> openat(AT_FDCWD, "/lib64/x86_64/x86_64/libv4l2.so.0",
> O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
> newfstatat(AT_FDCWD, "/lib64/x86_64/x86_64", 0x7ffde5e56c80, 0) = -1
> ENOENT (No such file or directory)
> openat(AT_FDCWD, "/lib64/x86_64/libv4l2.so.0", O_RDONLY|O_CLOEXEC) =
> -1 ENOENT (No such file or directory)
> newfstatat(AT_FDCWD, "/lib64/x86_64", 0x7ffde5e56c80, 0) = -1 ENOENT
> (No such file or directory)
> openat(AT_FDCWD, "/lib64/x86_64/libv4l2.so.0", O_RDONLY|O_CLOEXEC) =
> -1 ENOENT (No such file or directory)
> newfstatat(AT_FDCWD, "/lib64/x86_64", 0x7ffde5e56c80, 0) = -1 ENOENT
> (No such file or directory)
> openat(AT_FDCWD, "/lib64/libv4l2.so.0", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\370\"\0\0\0\0\0\0"...,
> 832) = 832
> pread64(3, "\4\0\0\0
> \0\0\0\5\0\0\0GNU\0\1\0\1\300\4\0\0\0\t\0\0\0\0\0\0\0"..., 48, 35072)
> = 48
> newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=55392, ...}, AT_EMPTY_PATH) = 0
> mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
> 0) = 0x7fabc1168000
> mmap(NULL, 57808, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fabc1159000
> mmap(0x7fabc115b000, 20480, PROT_READ|PROT_EXEC,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0x7fabc115b000
> mmap(0x7fabc1160000, 8192, PROT_READ,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x7000) = 0x7fabc1160000
> mmap(0x7fabc1162000, 24576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8000) = 0x7fabc1162000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib64/libv4lconvert.so.0", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\250D\0\0\0\0\0\0"...,
> 832) = 832
> pread64(3, "\4\0\0\0
> \0\0\0\5\0\0\0GNU\0\1\0\1\300\4\0\0\0\t\0\0\0\0\0\0\0"..., 48, 126512)
> = 48
> newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=137440, ...},
> AT_EMPTY_PATH) = 0
> mmap(NULL, 476256, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fabc10e4000
> mprotect(0x7fabc10e8000, 114688, PROT_NONE) = 0
> mmap(0x7fabc10e8000, 73728, PROT_READ|PROT_EXEC,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) = 0x7fabc10e8000
> mmap(0x7fabc10fa000, 36864, PROT_READ,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x16000) = 0x7fabc10fa000
> mmap(0x7fabc1104000, 12288, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1f000) = 0x7fabc1104000
> mmap(0x7fabc1107000, 332896, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7fabc1107000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib64/libjpeg.so.8", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0@E\0\0\0\0\0\0"...,
> 832) = 832
> newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=493408, ...},
> AT_EMPTY_PATH) = 0
> mmap(NULL, 495648, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fabc106a000
> mmap(0x7fabc106e000, 237568, PROT_READ|PROT_EXEC,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) = 0x7fabc106e000
> mmap(0x7fabc10a8000, 237568, PROT_READ,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3e000) = 0x7fabc10a8000
> mmap(0x7fabc10e2000, 8192, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x77000) = 0x7fabc10e2000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib64/libstdc++.so.6", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\0\214\n\0\0\0\0\0"...,
> 832) = 832
> pread64(3, "\4\0\0\0
> \0\0\0\5\0\0\0GNU\0\1\0\1\300\4\0\0\0\v\0\0\0\0\0\0\0"..., 48,
> 1457064) = 48
> newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=1515608, ...},
> AT_EMPTY_PATH) = 0
> mmap(NULL, 1531392, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fabc0ef4000
> mmap(0x7fabc0f96000, 524288, PROT_READ|PROT_EXEC,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xa2000) = 0x7fabc0f96000
> mmap(0x7fabc1016000, 270336, PROT_READ,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x122000) = 0x7fabc1016000
> mmap(0x7fabc1058000, 61440, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x163000) = 0x7fabc1058000
> mmap(0x7fabc1067000, 11776, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7fabc1067000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib64/libm.so.6", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\340\321\0\0\0\0\0\0"...,
> 832) = 832
> newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=878512, ...},
> AT_EMPTY_PATH) = 0
> mmap(NULL, 880680, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fabc0e1c000
> mprotect(0x7fabc0e29000, 823296, PROT_NONE) = 0
> mmap(0x7fabc0e29000, 442368, PROT_READ|PROT_EXEC,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xd000) = 0x7fabc0e29000
> mmap(0x7fabc0e95000, 376832, PROT_READ,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x79000) = 0x7fabc0e95000
> mmap(0x7fabc0ef2000, 8192, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xd5000) = 0x7fabc0ef2000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib64/libgcc_s.so.1", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\3702\0\0\0\0\0\0"...,
> 832) = 832
> pread64(3, "\4\0\0\0
> \0\0\0\5\0\0\0GNU\0\1\0\1\300\4\0\0\0\v\0\0\0\0\0\0\0"..., 48, 71408)
> = 48
> newfstatat(3, "", {st_mode=S_IFREG|0644, st_size=76144, ...}, AT_EMPTY_PATH) = 0
> mmap(NULL, 78856, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fabc0e08000
> mmap(0x7fabc0e0b000, 49152, PROT_READ|PROT_EXEC,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3000) = 0x7fabc0e0b000
> mmap(0x7fabc0e17000, 12288, PROT_READ,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xf000) = 0x7fabc0e17000
> mmap(0x7fabc0e1a000, 8192, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x11000) = 0x7fabc0e1a000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib64/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0
> \224\2\0\0\0\0\0"..., 832) = 832
> pread64(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"...,
> 784, 64) = 784
> pread64(3, "\4\0\0\0000\0\0\0\5\0\0\0GNU\0\2\200\0\300\4\0\0\0\3\0\0\0\0\0\0\0"...,
> 64, 848) = 64
> pread64(3, "\4\0\0\0\20\0\0\0\1\0\0\0GNU\0\0\0\0\0\5\0\0\0\17\0\0\0\0\0\0\0",
> 32, 912) = 32
> newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=2023720, ...},
> AT_EMPTY_PATH) = 0
> mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
> 0) = 0x7fabc0e06000
> pread64(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"...,
> 784, 64) = 784
> mmap(NULL, 2075760, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fabc0c0b000
> mprotect(0x7fabc0c33000, 1835008, PROT_NONE) = 0
> mmap(0x7fabc0c33000, 1466368, PROT_READ|PROT_EXEC,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x28000) = 0x7fabc0c33000
> mmap(0x7fabc0d99000, 364544, PROT_READ,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x18e000) = 0x7fabc0d99000
> mmap(0x7fabc0df3000, 24576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1e7000) = 0x7fabc0df3000
> mmap(0x7fabc0df9000, 52336, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7fabc0df9000
> close(3)                                = 0
> mmap(NULL, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
> 0) = 0x7fabc0c08000
> arch_prctl(ARCH_SET_FS, 0x7fabc0c08740) = 0
> set_tid_address(0x7fabc0c08a10)         = 512
> set_robust_list(0x7fabc0c08a20, 24)     = 0
> mprotect(0x7fabc0df3000, 16384, PROT_READ) = 0
> mprotect(0x7fabc0e1a000, 4096, PROT_READ) = 0
> mprotect(0x7fabc0ef2000, 4096, PROT_READ) = 0
> mprotect(0x7fabc1058000, 45056, PROT_READ) = 0
> mprotect(0x7fabc10e2000, 4096, PROT_READ) = 0
> mprotect(0x7fabc1104000, 8192, PROT_READ) = 0
> mprotect(0x7fabc1162000, 4096, PROT_READ) = 0
> mprotect(0x560ce01b5000, 8192, PROT_READ) = 0
> mprotect(0x7fabc1199000, 8192, PROT_READ) = 0
> prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=8192*1024,
> rlim_max=RLIM64_INFINITY}) = 0
> getrandom("\x42\xad\x69\x7d\xd1\x6e\x04\x7d", 8, GRND_NONBLOCK) = 8
> brk(NULL)                               = 0x560ce183b000
> brk(0x560ce185c000)                     = 0x560ce185c000
> futex(0x7fabc1067cbc, FUTEX_WAKE_PRIVATE, 2147483647) = 0
> futex(0x7fabc1067cc8, FUTEX_WAKE_PRIVATE, 2147483647) = 0
> ioctl(1, TCGETS, {B38400 opost isig icanon echo ...}) = 0
> newfstatat(1, "", {st_mode=S_IFCHR|0620, st_rdev=makedev(0x88, 0),
> ...}, AT_EMPTY_PATH) = 0
> write(1, "v4l2-compliance 1.22.1, 64 bits,"..., 47v4l2-compliance
> 1.22.1, 64 bits, 64-bit time_t
> ) = 47
> write(1, "\n", 1
> )                       = 1
> newfstatat(AT_FDCWD, "/dev/video0", {st_mode=S_IFCHR|0660,
> st_rdev=makedev(0x51, 0), ...}, 0) = 0
> openat(AT_FDCWD, "/sys/dev/char/81:0/uevent", O_RDONLY) = 3
> read(3, "MAJOR=81\nMINOR=0\nDEVNAME=video0\n", 8191) = 32
> close(3)                                = 0
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 3
> ioctl(3, VIDIOC_QUERYCAP, {driver="uvcvideo", card="HD Webcam C525",
> bus_info="usb-0000:00:1a.0-1.4", version=KERNEL_VERSION(5, 15, 0),
> capabilities=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_META_CAPTURE|V4L2_CAP_STREAMING|V4L2_CAP_DEVICE_CAPS,
> device_caps=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_STREAMING})
> = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|0 /*
> V4L2_CID_??? */ => V4L2_CTRL_CLASS_USER+0x1,
> type=V4L2_CTRL_TYPE_CTRL_CLASS, name="User Controls", ...}) = 0
> ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_???
> */, count=0}) = 0
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CTRL_FLAG_NEXT_CTRL|0 /*
> V4L2_CID_??? */ => V4L2_CTRL_CLASS_USER+0x1,
> type=V4L2_CTRL_TYPE_CTRL_CLASS, name="User Controls", ...}) = 0
> ioctl(3, VIDIOC_G_SELECTION, 0x7ffde5e5636c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCAP, {driver="uvcvideo", card="HD Webcam C525",
> bus_info="usb-0000:00:1a.0-1.4", version=KERNEL_VERSION(5, 15, 0),
> capabilities=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_META_CAPTURE|V4L2_CAP_STREAMING|V4L2_CAP_DEVICE_CAPS,
> device_caps=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_STREAMING})
> = 0
> newfstatat(3, "", {st_mode=S_IFCHR|0660, st_rdev=makedev(0x51, 0),
> ...}, AT_EMPTY_PATH) = 0
> openat(AT_FDCWD, "/sys/dev/char/81:0/device",
> O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 4
> newfstatat(4, "", {st_mode=S_IFDIR|0755, st_size=0, ...}, AT_EMPTY_PATH) = 0
> getdents64(4, 0x560ce184d500 /* 25 entries */, 32768) = 904
> openat(AT_FDCWD, "/dev/media0", O_RDWR) = 5
> close(4)                                = 0
> ioctl(5, MEDIA_IOC_DEVICE_INFO, 0x7ffde5e55968) = 0
> write(1, "Compliance test for uvcvideo dev"..., 50Compliance test for
> uvcvideo device /dev/video0:
>
> ) = 50
> write(1, "Driver Info:\n", 13Driver Info:
> )          = 13
> write(1, "\tDriver name      : uvcvideo\n", 29 Driver name      : uvcvideo
> ) = 29
> write(1, "\tCard type        : HD Webcam C5"..., 35 Card type        :
> HD Webcam C525
> ) = 35
> write(1, "\tBus info         : usb-0000:00:"..., 41 Bus info         :
> usb-0000:00:1a.0-1.4
> ) = 41
> write(1, "\tDriver version   : 5.15.0\n", 27 Driver version   : 5.15.0
> ) = 27
> write(1, "\tCapabilities     : 0x84a00001\n", 31 Capabilities     : 0x84a00001
> ) = 31
> write(1, "\t\tVideo Capture\n\t\tMetadata Captu"..., 91 Video Capture
> Metadata Capture
> Streaming
> Extended Pix Format
> Device Capabilities
> ) = 91
> write(1, "\tDevice Caps      : 0x04200001\n", 31 Device Caps      : 0x04200001
> ) = 31
> write(1, "\t\tVideo Capture\n\t\tStreaming\n\t\tEx"..., 50 Video Capture
> Streaming
> Extended Pix Format
> ) = 50
> ioctl(5, MEDIA_IOC_DEVICE_INFO, 0x7ffde5e55568) = 0
> write(1, "Media Driver Info:\n", 19Media Driver Info:
> )    = 19
> write(1, "\tDriver name      : uvcvideo\n", 29 Driver name      : uvcvideo
> ) = 29
> write(1, "\tModel            : HD Webcam C5"..., 35 Model            :
> HD Webcam C525
> ) = 35
> write(1, "\tSerial           : 28D79660\n", 29 Serial           : 28D79660
> ) = 29
> write(1, "\tBus info         : usb-0000:00:"..., 41 Bus info         :
> usb-0000:00:1a.0-1.4
> ) = 41
> write(1, "\tMedia version    : 5.15.0\n", 27 Media version    : 5.15.0
> ) = 27
> write(1, "\tHardware revision: 0x00000010 ("..., 36 Hardware revision:
> 0x00000010 (16)
> ) = 36
> write(1, "\tDriver version   : 5.15.0\n", 27 Driver version   : 5.15.0
> ) = 27
> newfstatat(3, "", {st_mode=S_IFCHR|0660, st_rdev=makedev(0x51, 0),
> ...}, AT_EMPTY_PATH) = 0
> ioctl(5, MEDIA_IOC_G_TOPOLOGY, 0x7ffde5e55448) = 0
> ioctl(5, MEDIA_IOC_G_TOPOLOGY, 0x7ffde5e55448) = 0
> write(1, "Interface Info:\n", 16Interface Info:
> )       = 16
> write(1, "\tID               : 0x03000002\n", 31 ID               : 0x03000002
> ) = 31
> write(1, "\tType             : V4L Video\n", 30 Type             : V4L Video
> ) = 30
> write(1, "Entity Info:\n", 13Entity Info:
> )          = 13
> write(1, "\tID               : 0x00000001 ("..., 35 ID               :
> 0x00000001 (1)
> ) = 35
> write(1, "\tName             : Video Captur"..., 36 Name             :
> Video Capture 3
> ) = 36
> write(1, "\tFunction         : V4L2 I/O\n", 29 Function         : V4L2 I/O
> ) = 29
> write(1, "\tFlags            : default\n", 28 Flags            : default
> ) = 28
> write(1, "\tPad 0x01000007   : 0: Sink\n", 28 Pad 0x01000007   : 0: Sink
> ) = 28
> write(1, "\t  Link 0x02000019: from remote "..., 120  Link 0x02000019:
> from remote pad 0x100000a of entity 'Extension 5' (Video Pixel
> Formatter): Data, Enabled, Immutable
> ) = 120
> ioctl(5, MEDIA_IOC_ENUM_ENTITIES, 0x7ffde5e56740) = 0
> ioctl(5, MEDIA_IOC_ENUM_LINKS, 0x7ffde5e55968) = 0
> write(1, "\n", 1
> )                       = 1
> write(1, "Required ioctls:\n", 17Required ioctls:
> )      = 17
> write(1, "\ttest MC information (see 'Media"..., 66 test MC
> information (see 'Media Driver Info' above): OK
> ) = 66
> ioctl(3, VIDIOC_QUERYCAP, NULL)         = -1 EFAULT (Bad address)
> ioctl(3, VIDIOC_QUERYCAP, {driver="uvcvideo", card="HD Webcam C525",
> bus_info="usb-0000:00:1a.0-1.4", version=KERNEL_VERSION(5, 15, 0),
> capabilities=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_META_CAPTURE|V4L2_CAP_STREAMING|V4L2_CAP_DEVICE_CAPS,
> device_caps=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_STREAMING})
> = 0
> write(1, "\ttest VIDIOC_QUERYCAP: \33[32mOK\33["..., 35 test VIDIOC_QUERYCAP: OK
> ) = 35
> ioctl(3, _IOC(_IOC_NONE, 0x56, 0xff, 0), 0) = -1 ENOTTY (Inappropriate
> ioctl for device)
> ioctl(3, _IOC(_IOC_NONE, 0x56, 0, 0x3fff), 0) = -1 ENOTTY
> (Inappropriate ioctl for device)
> ioctl(3, _IOC(_IOC_READ, 0x56, 0, 0x3fff), 0x7ffde5e51788) = -1 ENOTTY
> (Inappropriate ioctl for device)
> ioctl(3, _IOC(_IOC_WRITE, 0x56, 0, 0x3fff), 0x7ffde5e51788) = -1
> ENOTTY (Inappropriate ioctl for device)
> ioctl(3, _IOC(_IOC_READ|_IOC_WRITE, 0x56, 0, 0x3fff), 0x7ffde5e51788)
> = -1 ENOTTY (Inappropriate ioctl for device)
> write(1, "\ttest invalid ioctls: \33[32mOK\33[0"..., 34 test invalid ioctls: OK
> ) = 34
> write(1, "\n", 1
> )                       = 1
> write(1, "Allow for multiple opens:\n", 26Allow for multiple opens:
> ) = 26
> dup(3)                                  = 4
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 6
> close(4)                                = 0
> ioctl(6, VIDIOC_QUERYCAP, {driver="uvcvideo", card="HD Webcam C525",
> bus_info="usb-0000:00:1a.0-1.4", version=KERNEL_VERSION(5, 15, 0),
> capabilities=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_META_CAPTURE|V4L2_CAP_STREAMING|V4L2_CAP_DEVICE_CAPS,
> device_caps=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_STREAMING})
> = 0
> ioctl(6, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|0 /*
> V4L2_CID_??? */ => V4L2_CTRL_CLASS_USER+0x1,
> type=V4L2_CTRL_TYPE_CTRL_CLASS, name="User Controls", ...}) = 0
> ioctl(6, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_???
> */, count=0}) = 0
> ioctl(6, VIDIOC_QUERYCTRL, {id=V4L2_CTRL_FLAG_NEXT_CTRL|0 /*
> V4L2_CID_??? */ => V4L2_CTRL_CLASS_USER+0x1,
> type=V4L2_CTRL_TYPE_CTRL_CLASS, name="User Controls", ...}) = 0
> ioctl(6, VIDIOC_G_SELECTION, 0x7ffde5e555fc) = -1 EINVAL (Invalid argument)
> write(1, "\ttest second /dev/video0 open: \33"..., 43 test second
> /dev/video0 open: OK
> ) = 43
> ioctl(6, VIDIOC_QUERYCAP, NULL)         = -1 EFAULT (Bad address)
> ioctl(6, VIDIOC_QUERYCAP, {driver="uvcvideo", card="HD Webcam C525",
> bus_info="usb-0000:00:1a.0-1.4", version=KERNEL_VERSION(5, 15, 0),
> capabilities=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_META_CAPTURE|V4L2_CAP_STREAMING|V4L2_CAP_DEVICE_CAPS,
> device_caps=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_STREAMING})
> = 0
> write(1, "\ttest VIDIOC_QUERYCAP: \33[32mOK\33["..., 35 test VIDIOC_QUERYCAP: OK
> ) = 35
> ioctl(3, VIDIOC_G_PRIORITY, 0x7ffde5e55784) = 0
> ioctl(6, VIDIOC_G_PRIORITY, 0x7ffde5e55784) = 0
> ioctl(3, VIDIOC_S_PRIORITY, 0x7ffde5e55800) = 0
> ioctl(3, VIDIOC_G_PRIORITY, 0x7ffde5e55784) = 0
> ioctl(6, VIDIOC_G_PRIORITY, 0x7ffde5e55784) = 0
> ioctl(6, VIDIOC_S_PRIORITY, 0x7ffde5e55800) = -1 EBUSY (Device or resource busy)
> ioctl(3, VIDIOC_S_PRIORITY, 0x7ffde5e55800) = 0
> ioctl(3, VIDIOC_G_PRIORITY, 0x7ffde5e55784) = 0
> ioctl(6, VIDIOC_G_PRIORITY, 0x7ffde5e55784) = 0
> write(1, "\ttest VIDIOC_G/S_PRIORITY: \33[32m"..., 39 test
> VIDIOC_G/S_PRIORITY: OK
> ) = 39
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 4
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 7
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 8
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 9
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 10
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 11
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 12
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 13
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 14
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 15
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 16
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 17
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 18
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 19
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 20
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 21
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 22
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 23
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 24
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 25
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 26
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 27
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 28
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 29
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 30
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 31
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 32
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 33
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 34
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 35
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 36
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 37
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 38
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 39
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 40
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 41
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 42
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 43
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 44
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 45
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 46
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 47
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 48
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 49
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 50
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 51
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 52
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 53
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 54
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 55
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 56
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 57
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 58
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 59
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 60
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 61
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 62
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 63
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 64
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 65
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 66
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 67
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 68
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 69
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 70
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 71
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 72
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 73
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 74
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 75
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 76
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 77
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 78
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 79
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 80
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 81
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 82
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 83
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 84
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 85
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 86
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 87
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 88
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 89
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 90
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 91
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 92
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 93
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 94
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 95
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 96
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 97
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 98
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 99
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 100
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 101
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 102
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 103
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 104
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 105
> close(105)                              = 0
> close(104)                              = 0
> close(103)                              = 0
> close(102)                              = 0
> close(101)                              = 0
> close(100)                              = 0
> close(99)                               = 0
> close(98)                               = 0
> close(97)                               = 0
> close(96)                               = 0
> close(95)                               = 0
> close(94)                               = 0
> close(93)                               = 0
> close(92)                               = 0
> close(91)                               = 0
> close(90)                               = 0
> close(89)                               = 0
> close(88)                               = 0
> close(87)                               = 0
> close(86)                               = 0
> close(85)                               = 0
> close(84)                               = 0
> close(83)                               = 0
> close(82)                               = 0
> close(81)                               = 0
> close(80)                               = 0
> close(79)                               = 0
> close(78)                               = 0
> close(77)                               = 0
> close(76)                               = 0
> close(75)                               = 0
> close(74)                               = 0
> close(73)                               = 0
> close(72)                               = 0
> close(71)                               = 0
> close(70)                               = 0
> close(69)                               = 0
> close(68)                               = 0
> close(67)                               = 0
> close(66)                               = 0
> close(65)                               = 0
> close(64)                               = 0
> close(63)                               = 0
> close(62)                               = 0
> close(61)                               = 0
> close(60)                               = 0
> close(59)                               = 0
> close(58)                               = 0
> close(57)                               = 0
> close(56)                               = 0
> close(55)                               = 0
> close(54)                               = 0
> close(53)                               = 0
> close(52)                               = 0
> close(51)                               = 0
> close(50)                               = 0
> close(49)                               = 0
> close(48)                               = 0
> close(47)                               = 0
> close(46)                               = 0
> close(45)                               = 0
> close(44)                               = 0
> close(43)                               = 0
> close(42)                               = 0
> close(41)                               = 0
> close(40)                               = 0
> close(39)                               = 0
> close(38)                               = 0
> close(37)                               = 0
> close(36)                               = 0
> close(35)                               = 0
> close(34)                               = 0
> close(33)                               = 0
> close(32)                               = 0
> close(31)                               = 0
> close(30)                               = 0
> close(29)                               = 0
> close(28)                               = 0
> close(27)                               = 0
> close(26)                               = 0
> close(25)                               = 0
> close(24)                               = 0
> close(23)                               = 0
> close(22)                               = 0
> close(21)                               = 0
> close(20)                               = 0
> close(19)                               = 0
> close(18)                               = 0
> close(17)                               = 0
> close(16)                               = 0
> close(15)                               = 0
> close(14)                               = 0
> close(13)                               = 0
> close(12)                               = 0
> close(11)                               = 0
> close(10)                               = 0
> close(9)                                = 0
> close(8)                                = 0
> close(7)                                = 0
> close(4)                                = 0
> write(1, "\ttest for unlimited opens: \33[32m"..., 39 test for
> unlimited opens: OK
> ) = 39
> write(1, "\n", 1
> )                       = 1
> ioctl(3, VIDIOC_G_INPUT, [0])           = 0
> ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
> type=V4L2_INPUT_TYPE_CAMERA}) = 0
> ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
> fmt.pix={width=640, height=480, pixelformat=v4l2_fourcc('Y', 'U', 'Y',
> 'V') /* V4L2_PIX_FMT_YUYV */, field=V4L2_FIELD_NONE,
> bytesperline=1280, sizeimage=614400,
> colorspace=V4L2_COLORSPACE_SRGB}}) = 0
> ioctl(3, VIDIOC_G_SELECTION, 0x7ffde5e5587c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_G_SELECTION, 0x7ffde5e5587c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_G_PARM, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
> parm.capture={capability=V4L2_CAP_TIMEPERFRAME, capturemode=0,
> timeperframe=1/30, extendedmode=0, readbuffers=0}}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|0 /*
> V4L2_CID_??? */ => V4L2_CTRL_CLASS_USER+0x1,
> type=V4L2_CTRL_TYPE_CTRL_CLASS, name="User Controls", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CTRL_CLASS_USER+0x1
> => V4L2_CID_BRIGHTNESS, type=V4L2_CTRL_TYPE_INTEGER,
> name="Brightness", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_BRIGHTNESS
> => V4L2_CID_CONTRAST, type=V4L2_CTRL_TYPE_INTEGER, name="Contrast",
> ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_CONTRAST
> => V4L2_CID_SATURATION, type=V4L2_CTRL_TYPE_INTEGER,
> name="Saturation", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_SATURATION
> => V4L2_CID_AUTO_WHITE_BALANCE, type=V4L2_CTRL_TYPE_BOOLEAN,
> name="White Balance, Automatic", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_AUTO_WHITE_BALANCE
> => V4L2_CID_GAIN, type=V4L2_CTRL_TYPE_INTEGER, name="Gain", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_GAIN
> => V4L2_CID_POWER_LINE_FREQUENCY, type=V4L2_CTRL_TYPE_MENU,
> name="Power Line Frequency", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_POWER_LINE_FREQUENCY
> => V4L2_CID_WHITE_BALANCE_TEMPERATURE, type=V4L2_CTRL_TYPE_INTEGER,
> name="White Balance Temperature", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_WHITE_BALANCE_TEMPERATURE
> => V4L2_CID_SHARPNESS, type=V4L2_CTRL_TYPE_INTEGER, name="Sharpness",
> ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_SHARPNESS
> => V4L2_CID_BACKLIGHT_COMPENSATION, type=V4L2_CTRL_TYPE_INTEGER,
> name="Backlight Compensation", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_BACKLIGHT_COMPENSATION
> => V4L2_CTRL_CLASS_CAMERA+0x1, type=V4L2_CTRL_TYPE_CTRL_CLASS,
> name="Camera Controls", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CTRL_CLASS_CAMERA+0x1
> => V4L2_CID_EXPOSURE_AUTO, type=V4L2_CTRL_TYPE_MENU, name="Auto
> Exposure", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_EXPOSURE_AUTO
> => V4L2_CID_EXPOSURE_ABSOLUTE, type=V4L2_CTRL_TYPE_INTEGER,
> name="Exposure Time, Absolute", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_EXPOSURE_ABSOLUTE
> => V4L2_CID_EXPOSURE_AUTO_PRIORITY, type=V4L2_CTRL_TYPE_BOOLEAN,
> name="Exposure, Dynamic Framerate", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_EXPOSURE_AUTO_PRIORITY
> => V4L2_CID_PAN_ABSOLUTE, type=V4L2_CTRL_TYPE_INTEGER, name="Pan,
> Absolute", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_PAN_ABSOLUTE
> => V4L2_CID_TILT_ABSOLUTE, type=V4L2_CTRL_TYPE_INTEGER, name="Tilt,
> Absolute", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_TILT_ABSOLUTE
> => V4L2_CID_FOCUS_ABSOLUTE, type=V4L2_CTRL_TYPE_INTEGER, name="Focus,
> Absolute", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_FOCUS_ABSOLUTE
> => V4L2_CID_FOCUS_AUTO, type=V4L2_CTRL_TYPE_BOOLEAN, name="Focus,
> Automatic Continuous", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_FOCUS_AUTO
> => V4L2_CID_ZOOM_ABSOLUTE, type=V4L2_CTRL_TYPE_INTEGER, name="Zoom,
> Absolute", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_ZOOM_ABSOLUTE})
> = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_??? */,
> count=17, controls=[{id=V4L2_CID_BRIGHTNESS, size=0, value=128,
> value64=128}, {id=V4L2_CID_CONTRAST, size=0, value=32, value64=32},
> {id=V4L2_CID_SATURATION, size=0, value=32, value64=32},
> {id=V4L2_CID_AUTO_WHITE_BALANCE, size=0, value=1, value64=1},
> {id=V4L2_CID_GAIN, size=0, value=64, value64=64},
> {id=V4L2_CID_POWER_LINE_FREQUENCY, size=0, value=2, value64=2},
> {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE, size=0, value=5500,
> value64=5500}, {id=V4L2_CID_SHARPNESS, size=0, value=22, value64=22},
> {id=V4L2_CID_BACKLIGHT_COMPENSATION, size=0, value=1, value64=1},
> {id=V4L2_CID_EXPOSURE_AUTO, size=0, value=3, value64=3},
> {id=V4L2_CID_EXPOSURE_ABSOLUTE, size=0, value=166, value64=166},
> {id=V4L2_CID_EXPOSURE_AUTO_PRIORITY, size=0, value=1, value64=1},
> {id=V4L2_CID_PAN_ABSOLUTE, size=0, value=0, value64=0},
> {id=V4L2_CID_TILT_ABSOLUTE, size=0, value=0, value64=0},
> {id=V4L2_CID_FOCUS_ABSOLUTE, size=0, value=60, value64=60},
> {id=V4L2_CID_FOCUS_AUTO, size=0, value=1, value64=1},
> {id=V4L2_CID_ZOOM_ABSOLUTE, size=0, value=1, value64=1}]}) = 0
> rt_sigaction(SIGINT, {sa_handler=0x560ce015e03e, sa_mask=[INT],
> sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7fabc0c48420},
> {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
> write(1, "Debug ioctls:\n", 14Debug ioctls:
> )         = 14
> getuid()                                = 0
> ioctl(3, VIDIOC_DBG_G_REGISTER, 0x7ffde5e55678) = -1 ENOTTY
> (Inappropriate ioctl for device)
> write(1, "\ttest VIDIOC_DBG_G/S_REGISTER: \33"..., 59 test
> VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> ) = 59
> ioctl(3, VIDIOC_LOG_STATUS, 0)          = -1 ENOTTY (Inappropriate
> ioctl for device)
> write(1, "\ttest VIDIOC_LOG_STATUS: \33[32mOK"..., 53 test
> VIDIOC_LOG_STATUS: OK (Not Supported)
> ) = 53
> write(1, "\n", 1
> )                       = 1
> write(1, "Input ioctls:\n", 14Input ioctls:
> )         = 14
> ioctl(3, VIDIOC_G_STD, 0x7ffde5e556b0)  = -1 ENOTTY (Inappropriate
> ioctl for device)
> ioctl(3, VIDIOC_G_TUNER, {index=0})     = -1 ENOTTY (Inappropriate
> ioctl for device)
> write(1, "\ttest VIDIOC_G/S_TUNER/ENUM_FREQ"..., 68 test
> VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> ) = 68
> ioctl(3, VIDIOC_G_FREQUENCY, 0x7ffde5e556a8) = -1 ENOTTY
> (Inappropriate ioctl for device)
> ioctl(3, VIDIOC_S_FREQUENCY, 0x7ffde5e556a8) = -1 ENOTTY
> (Inappropriate ioctl for device)
> write(1, "\ttest VIDIOC_G/S_FREQUENCY: \33[32"..., 56 test
> VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> ) = 56
> ioctl(3, VIDIOC_S_HW_FREQ_SEEK, 0x7ffde5e556f4) = -1 ENOTTY
> (Inappropriate ioctl for device)
> write(1, "\ttest VIDIOC_S_HW_FREQ_SEEK: \33[3"..., 57 test
> VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> ) = 57
> ioctl(3, VIDIOC_ENUMAUDIO, 0x7ffde5e55754) = -1 ENOTTY (Inappropriate
> ioctl for device)
> write(1, "\ttest VIDIOC_ENUMAUDIO: \33[32mOK\33"..., 52 test
> VIDIOC_ENUMAUDIO: OK (Not Supported)
> ) = 52
> ioctl(3, VIDIOC_G_INPUT, [0])           = 0
> ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
> type=V4L2_INPUT_TYPE_CAMERA}) = 0
> ioctl(3, VIDIOC_S_INPUT, [0])           = 0
> ioctl(3, VIDIOC_G_SELECTION, 0x7ffde5e556d8) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_ENUMINPUT, {index=1})   = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_S_INPUT, [1])           = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_S_INPUT, [0])           = 0
> write(1, "\ttest VIDIOC_G/S/ENUMINPUT: \33[32"..., 40 test
> VIDIOC_G/S/ENUMINPUT: OK
> ) = 40
> ioctl(3, VIDIOC_S_INPUT, [0])           = 0
> ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
> type=V4L2_INPUT_TYPE_CAMERA}) = 0
> ioctl(3, VIDIOC_G_AUDIO, 0x7ffde5e556e4) = -1 ENOTTY (Inappropriate
> ioctl for device)
> ioctl(3, VIDIOC_S_AUDIO, 0x7ffde5e556e4) = -1 ENOTTY (Inappropriate
> ioctl for device)
> write(1, "\ttest VIDIOC_G/S_AUDIO: \33[32mOK\33"..., 52 test
> VIDIOC_G/S_AUDIO: OK (Not Supported)
> ) = 52
> write(1, "\tInputs: 1 Audio Inputs: 0 Tuner"..., 37 Inputs: 1 Audio
> Inputs: 0 Tuners: 0
> ) = 37
> write(1, "\n", 1
> )                       = 1
> write(1, "Output ioctls:\n", 15Output ioctls:
> )        = 15
> ioctl(3, VIDIOC_G_MODULATOR, 0x7ffde5e55724) = -1 ENOTTY
> (Inappropriate ioctl for device)
> write(1, "\ttest VIDIOC_G/S_MODULATOR: \33[32"..., 56 test
> VIDIOC_G/S_MODULATOR: OK (Not Supported)
> ) = 56
> ioctl(3, VIDIOC_G_FREQUENCY, 0x7ffde5e55708) = -1 ENOTTY
> (Inappropriate ioctl for device)
> ioctl(3, VIDIOC_S_FREQUENCY, 0x7ffde5e55708) = -1 ENOTTY
> (Inappropriate ioctl for device)
> write(1, "\ttest VIDIOC_G/S_FREQUENCY: \33[32"..., 56 test
> VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> ) = 56
> ioctl(3, VIDIOC_ENUMAUDOUT, 0x7ffde5e55754) = -1 ENOTTY (Inappropriate
> ioctl for device)
> write(1, "\ttest VIDIOC_ENUMAUDOUT: \33[32mOK"..., 53 test
> VIDIOC_ENUMAUDOUT: OK (Not Supported)
> ) = 53
> ioctl(3, VIDIOC_G_OUTPUT, 0x7ffde5e556d8) = -1 ENOTTY (Inappropriate
> ioctl for device)
> ioctl(3, VIDIOC_ENUMOUTPUT, 0x7ffde5e55720) = -1 ENOTTY (Inappropriate
> ioctl for device)
> ioctl(3, VIDIOC_S_OUTPUT, 0x7ffde5e556dc) = -1 ENOTTY (Inappropriate
> ioctl for device)
> write(1, "\ttest VIDIOC_G/S/ENUMOUTPUT: \33[3"..., 57 test
> VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> ) = 57
> write(1, "\ttest VIDIOC_G/S_AUDOUT: \33[32mOK"..., 53 test
> VIDIOC_G/S_AUDOUT: OK (Not Supported)
> ) = 53
> write(1, "\tOutputs: 0 Audio Outputs: 0 Mod"..., 43 Outputs: 0 Audio
> Outputs: 0 Modulators: 0
> ) = 43
> write(1, "\n", 1
> )                       = 1
> write(1, "Input/Output configuration ioctl"..., 35Input/Output
> configuration ioctls:
> ) = 35
> ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
> type=V4L2_INPUT_TYPE_CAMERA}) = 0
> ioctl(3, VIDIOC_S_INPUT, [0])           = 0
> ioctl(3, VIDIOC_G_STD, 0x7ffde5e55638)  = -1 ENOTTY (Inappropriate
> ioctl for device)
> ioctl(3, VIDIOC_S_STD, [0])             = -1 ENOTTY (Inappropriate
> ioctl for device)
> ioctl(3, VIDIOC_S_STD, [0x3000000])     = -1 ENOTTY (Inappropriate
> ioctl for device)
> ioctl(3, VIDIOC_ENUMSTD, {index=0})     = -1 ENOTTY (Inappropriate
> ioctl for device)
> ioctl(3, VIDIOC_QUERYSTD, 0x7ffde5e55638) = -1 ENOTTY (Inappropriate
> ioctl for device)
> write(1, "\ttest VIDIOC_ENUM/G/S/QUERY_STD:"..., 61 test
> VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> ) = 61
> ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
> type=V4L2_INPUT_TYPE_CAMERA}) = 0
> ioctl(3, VIDIOC_S_INPUT, [0])           = 0
> ioctl(3, VIDIOC_G_DV_TIMINGS, 0x7ffde5e551ec) = -1 ENOTTY
> (Inappropriate ioctl for device)
> ioctl(3, VIDIOC_ENUM_DV_TIMINGS, 0x7ffde5e552f4) = -1 ENOTTY
> (Inappropriate ioctl for device)
> ioctl(3, VIDIOC_QUERY_DV_TIMINGS, 0x7ffde5e551ec) = -1 ENOTTY
> (Inappropriate ioctl for device)
> write(1, "\ttest VIDIOC_ENUM/G/S/QUERY_DV_T"..., 68 test
> VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> ) = 68
> ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
> type=V4L2_INPUT_TYPE_CAMERA}) = 0
> ioctl(3, VIDIOC_S_INPUT, [0])           = 0
> ioctl(3, VIDIOC_DV_TIMINGS_CAP, 0x7ffde5e55608) = -1 ENOTTY
> (Inappropriate ioctl for device)
> write(1, "\ttest VIDIOC_DV_TIMINGS_CAP: \33[3"..., 57 test
> VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> ) = 57
> ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
> type=V4L2_INPUT_TYPE_CAMERA}) = 0
> ioctl(3, VIDIOC_S_INPUT, [0])           = 0
> ioctl(3, VIDIOC_G_EDID, 0x7ffde5e4d660) = -1 ENOTTY (Inappropriate
> ioctl for device)
> ioctl(3, VIDIOC_S_EDID, 0x7ffde5e4d660) = -1 ENOTTY (Inappropriate
> ioctl for device)
> write(1, "\ttest VIDIOC_G/S_EDID: \33[32mOK\33["..., 51 test
> VIDIOC_G/S_EDID: OK (Not Supported)
> ) = 51
> write(1, "\n", 1
> )                       = 1
> ioctl(3, VIDIOC_S_INPUT, [0])           = 0
> ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
> type=V4L2_INPUT_TYPE_CAMERA}) = 0
> write(1, "Control ioctls (Input 0):\n", 26Control ioctls (Input 0):
> ) = 26
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|0 /*
> V4L2_CID_??? */ => V4L2_CTRL_CLASS_USER+0x1,
> type=V4L2_CTRL_TYPE_CTRL_CLASS, name="User Controls", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CTRL_CLASS_USER+0x1
> => V4L2_CID_BRIGHTNESS, type=V4L2_CTRL_TYPE_INTEGER,
> name="Brightness", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_BRIGHTNESS
> => V4L2_CID_CONTRAST, type=V4L2_CTRL_TYPE_INTEGER, name="Contrast",
> ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_CONTRAST
> => V4L2_CID_SATURATION, type=V4L2_CTRL_TYPE_INTEGER,
> name="Saturation", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_SATURATION
> => V4L2_CID_AUTO_WHITE_BALANCE, type=V4L2_CTRL_TYPE_BOOLEAN,
> name="White Balance, Automatic", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_AUTO_WHITE_BALANCE
> => V4L2_CID_GAIN, type=V4L2_CTRL_TYPE_INTEGER, name="Gain", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_GAIN
> => V4L2_CID_POWER_LINE_FREQUENCY, type=V4L2_CTRL_TYPE_MENU,
> name="Power Line Frequency", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_POWER_LINE_FREQUENCY
> => V4L2_CID_WHITE_BALANCE_TEMPERATURE, type=V4L2_CTRL_TYPE_INTEGER,
> name="White Balance Temperature", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_WHITE_BALANCE_TEMPERATURE
> => V4L2_CID_SHARPNESS, type=V4L2_CTRL_TYPE_INTEGER, name="Sharpness",
> ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_SHARPNESS
> => V4L2_CID_BACKLIGHT_COMPENSATION, type=V4L2_CTRL_TYPE_INTEGER,
> name="Backlight Compensation", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_BACKLIGHT_COMPENSATION
> => V4L2_CTRL_CLASS_CAMERA+0x1, type=V4L2_CTRL_TYPE_CTRL_CLASS,
> name="Camera Controls", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CTRL_CLASS_CAMERA+0x1
> => V4L2_CID_EXPOSURE_AUTO, type=V4L2_CTRL_TYPE_MENU, name="Auto
> Exposure", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_EXPOSURE_AUTO
> => V4L2_CID_EXPOSURE_ABSOLUTE, type=V4L2_CTRL_TYPE_INTEGER,
> name="Exposure Time, Absolute", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_EXPOSURE_ABSOLUTE
> => V4L2_CID_EXPOSURE_AUTO_PRIORITY, type=V4L2_CTRL_TYPE_BOOLEAN,
> name="Exposure, Dynamic Framerate", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_EXPOSURE_AUTO_PRIORITY
> => V4L2_CID_PAN_ABSOLUTE, type=V4L2_CTRL_TYPE_INTEGER, name="Pan,
> Absolute", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_PAN_ABSOLUTE
> => V4L2_CID_TILT_ABSOLUTE, type=V4L2_CTRL_TYPE_INTEGER, name="Tilt,
> Absolute", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_TILT_ABSOLUTE
> => V4L2_CID_FOCUS_ABSOLUTE, type=V4L2_CTRL_TYPE_INTEGER, name="Focus,
> Absolute", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_FOCUS_ABSOLUTE
> => V4L2_CID_FOCUS_AUTO, type=V4L2_CTRL_TYPE_BOOLEAN, name="Focus,
> Automatic Continuous", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_FOCUS_AUTO
> => V4L2_CID_ZOOM_ABSOLUTE, type=V4L2_CTRL_TYPE_INTEGER, name="Zoom,
> Absolute", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_ZOOM_ABSOLUTE})
> = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CTRL_FLAG_NEXT_CTRL|0 /*
> V4L2_CID_??? */ => V4L2_CTRL_CLASS_USER+0x1,
> type=V4L2_CTRL_TYPE_CTRL_CLASS, name="User Controls", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_CLASS_USER+0x1 =>
> V4L2_CID_BRIGHTNESS, type=V4L2_CTRL_TYPE_INTEGER, name="Brightness",
> ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_BRIGHTNESS => V4L2_CID_CONTRAST,
> type=V4L2_CTRL_TYPE_INTEGER, name="Contrast", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_CONTRAST => V4L2_CID_SATURATION,
> type=V4L2_CTRL_TYPE_INTEGER, name="Saturation", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_SATURATION =>
> V4L2_CID_AUTO_WHITE_BALANCE, type=V4L2_CTRL_TYPE_BOOLEAN, name="White
> Balance, Automatic", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_AUTO_WHITE_BALANCE =>
> V4L2_CID_GAIN, type=V4L2_CTRL_TYPE_INTEGER, name="Gain", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_GAIN =>
> V4L2_CID_POWER_LINE_FREQUENCY, type=V4L2_CTRL_TYPE_MENU, name="Power
> Line Frequency", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_POWER_LINE_FREQUENCY =>
> V4L2_CID_WHITE_BALANCE_TEMPERATURE, type=V4L2_CTRL_TYPE_INTEGER,
> name="White Balance Temperature", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_WHITE_BALANCE_TEMPERATURE =>
> V4L2_CID_SHARPNESS, type=V4L2_CTRL_TYPE_INTEGER, name="Sharpness",
> ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_SHARPNESS =>
> V4L2_CID_BACKLIGHT_COMPENSATION, type=V4L2_CTRL_TYPE_INTEGER,
> name="Backlight Compensation", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_BACKLIGHT_COMPENSATION =>
> V4L2_CTRL_CLASS_CAMERA+0x1, type=V4L2_CTRL_TYPE_CTRL_CLASS,
> name="Camera Controls", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_CLASS_CAMERA+0x1 =>
> V4L2_CID_EXPOSURE_AUTO, type=V4L2_CTRL_TYPE_MENU, name="Auto
> Exposure", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_EXPOSURE_AUTO =>
> V4L2_CID_EXPOSURE_ABSOLUTE, type=V4L2_CTRL_TYPE_INTEGER,
> name="Exposure Time, Absolute", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_EXPOSURE_ABSOLUTE =>
> V4L2_CID_EXPOSURE_AUTO_PRIORITY, type=V4L2_CTRL_TYPE_BOOLEAN,
> name="Exposure, Dynamic Framerate", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_EXPOSURE_AUTO_PRIORITY =>
> V4L2_CID_PAN_ABSOLUTE, type=V4L2_CTRL_TYPE_INTEGER, name="Pan,
> Absolute", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_PAN_ABSOLUTE =>
> V4L2_CID_TILT_ABSOLUTE, type=V4L2_CTRL_TYPE_INTEGER, name="Tilt,
> Absolute", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_TILT_ABSOLUTE =>
> V4L2_CID_FOCUS_ABSOLUTE, type=V4L2_CTRL_TYPE_INTEGER, name="Focus,
> Absolute", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_FOCUS_ABSOLUTE =>
> V4L2_CID_FOCUS_AUTO, type=V4L2_CTRL_TYPE_BOOLEAN, name="Focus,
> Automatic Continuous", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_FOCUS_AUTO =>
> V4L2_CID_ZOOM_ABSOLUTE, type=V4L2_CTRL_TYPE_INTEGER, name="Zoom,
> Absolute", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_ZOOM_ABSOLUTE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CTRL_FLAG_NEXT_COMPOUND|0 /*
> V4L2_CID_??? */}) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_BRIGHTNESS,
> type=V4L2_CTRL_TYPE_INTEGER, name="Brightness", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_CONTRAST,
> type=V4L2_CTRL_TYPE_INTEGER, name="Contrast", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_SATURATION,
> type=V4L2_CTRL_TYPE_INTEGER, name="Saturation", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_HUE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CTRL_CLASS_USER+0x904}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUDIO_VOLUME}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUDIO_BALANCE}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUDIO_BASS}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUDIO_TREBLE}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUDIO_MUTE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUDIO_LOUDNESS}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_BLACK_LEVEL}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE,
> type=V4L2_CTRL_TYPE_BOOLEAN, name="White Balance, Automatic", ...}) =
> 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_DO_WHITE_BALANCE}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_RED_BALANCE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_BLUE_BALANCE}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_GAMMA}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_EXPOSURE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUTOGAIN}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_GAIN,
> type=V4L2_CTRL_TYPE_INTEGER, name="Gain", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_HFLIP}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_VFLIP}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_HCENTER}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_VCENTER}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY,
> type=V4L2_CTRL_TYPE_MENU, name="Power Line Frequency", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_HUE_AUTO}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE, type=V4L2_CTRL_TYPE_INTEGER,
> name="White Balance Temperature", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_SHARPNESS,
> type=V4L2_CTRL_TYPE_INTEGER, name="Sharpness", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_BACKLIGHT_COMPENSATION,
> type=V4L2_CTRL_TYPE_INTEGER, name="Backlight Compensation", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7ffde5e555dc) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_CHROMA_AGC}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_COLOR_KILLER}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_COLORFX}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUTOBRIGHTNESS}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_BAND_STOP_FILTER}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_ROTATE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_BG_COLOR}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_CHROMA_GAIN}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_ILLUMINATORS_1}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_ILLUMINATORS_2}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_MIN_BUFFERS_FOR_CAPTURE})
> = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_MIN_BUFFERS_FOR_OUTPUT})
> = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_ALPHA_COMPONENT}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_COLORFX_CBCR}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=0x8000000 /* V4L2_CID_??? */}) =
> -1 EINVAL (Invalid argument)
> write(1, "\ttest VIDIOC_QUERY_EXT_CTRL/QUER"..., 51 test
> VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> ) = 51
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CTRL_FLAG_NEXT_CTRL|0 /*
> V4L2_CID_??? */ => V4L2_CTRL_CLASS_USER+0x1,
> type=V4L2_CTRL_TYPE_CTRL_CLASS, name="User Controls", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_CLASS_USER+0x1 =>
> V4L2_CID_BRIGHTNESS, type=V4L2_CTRL_TYPE_INTEGER, name="Brightness",
> ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_BRIGHTNESS => V4L2_CID_CONTRAST,
> type=V4L2_CTRL_TYPE_INTEGER, name="Contrast", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_CONTRAST => V4L2_CID_SATURATION,
> type=V4L2_CTRL_TYPE_INTEGER, name="Saturation", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_SATURATION =>
> V4L2_CID_AUTO_WHITE_BALANCE, type=V4L2_CTRL_TYPE_BOOLEAN, name="White
> Balance, Automatic", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_AUTO_WHITE_BALANCE =>
> V4L2_CID_GAIN, type=V4L2_CTRL_TYPE_INTEGER, name="Gain", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_GAIN
> => V4L2_CID_POWER_LINE_FREQUENCY, type=V4L2_CTRL_TYPE_MENU,
> name="Power Line Frequency", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_POWER_LINE_FREQUENCY =>
> V4L2_CID_WHITE_BALANCE_TEMPERATURE, type=V4L2_CTRL_TYPE_INTEGER,
> name="White Balance Temperature", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_WHITE_BALANCE_TEMPERATURE =>
> V4L2_CID_SHARPNESS, type=V4L2_CTRL_TYPE_INTEGER, name="Sharpness",
> ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_SHARPNESS =>
> V4L2_CID_BACKLIGHT_COMPENSATION, type=V4L2_CTRL_TYPE_INTEGER,
> name="Backlight Compensation", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_BACKLIGHT_COMPENSATION =>
> V4L2_CTRL_CLASS_CAMERA+0x1, type=V4L2_CTRL_TYPE_CTRL_CLASS,
> name="Camera Controls", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_CLASS_CAMERA+0x1 =>
> V4L2_CID_EXPOSURE_AUTO, type=V4L2_CTRL_TYPE_MENU, name="Auto
> Exposure", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_EXPOSURE_AUTO =>
> V4L2_CID_EXPOSURE_ABSOLUTE, type=V4L2_CTRL_TYPE_INTEGER,
> name="Exposure Time, Absolute", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_EXPOSURE_ABSOLUTE =>
> V4L2_CID_EXPOSURE_AUTO_PRIORITY, type=V4L2_CTRL_TYPE_BOOLEAN,
> name="Exposure, Dynamic Framerate", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_EXPOSURE_AUTO_PRIORITY =>
> V4L2_CID_PAN_ABSOLUTE, type=V4L2_CTRL_TYPE_INTEGER, name="Pan,
> Absolute", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_PAN_ABSOLUTE =>
> V4L2_CID_TILT_ABSOLUTE, type=V4L2_CTRL_TYPE_INTEGER, name="Tilt,
> Absolute", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_TILT_ABSOLUTE =>
> V4L2_CID_FOCUS_ABSOLUTE, type=V4L2_CTRL_TYPE_INTEGER, name="Focus,
> Absolute", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_FOCUS_ABSOLUTE =>
> V4L2_CID_FOCUS_AUTO, type=V4L2_CTRL_TYPE_BOOLEAN, name="Focus,
> Automatic Continuous", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_FOCUS_AUTO =>
> V4L2_CID_ZOOM_ABSOLUTE, type=V4L2_CTRL_TYPE_INTEGER, name="Zoom,
> Absolute", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_ZOOM_ABSOLUTE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CTRL_FLAG_NEXT_COMPOUND|0 /*
> V4L2_CID_??? */}) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_BRIGHTNESS,
> type=V4L2_CTRL_TYPE_INTEGER, name="Brightness", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_CONTRAST,
> type=V4L2_CTRL_TYPE_INTEGER, name="Contrast", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_SATURATION,
> type=V4L2_CTRL_TYPE_INTEGER, name="Saturation", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_HUE}) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CTRL_CLASS_USER+0x904}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUDIO_VOLUME}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUDIO_BALANCE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUDIO_BASS}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUDIO_TREBLE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUDIO_MUTE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUDIO_LOUDNESS}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_BLACK_LEVEL}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE,
> type=V4L2_CTRL_TYPE_BOOLEAN, name="White Balance, Automatic", ...}) =
> 0
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_DO_WHITE_BALANCE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_RED_BALANCE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_BLUE_BALANCE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_GAMMA}) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_EXPOSURE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUTOGAIN}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_GAIN,
> type=V4L2_CTRL_TYPE_INTEGER, name="Gain", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_HFLIP}) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_VFLIP}) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_HCENTER}) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_VCENTER}) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY,
> type=V4L2_CTRL_TYPE_MENU, name="Power Line Frequency", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_HUE_AUTO}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE,
> type=V4L2_CTRL_TYPE_INTEGER, name="White Balance Temperature", ...}) =
> 0
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_SHARPNESS,
> type=V4L2_CTRL_TYPE_INTEGER, name="Sharpness", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_BACKLIGHT_COMPENSATION,
> type=V4L2_CTRL_TYPE_INTEGER, name="Backlight Compensation", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_CHROMA_AGC}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_COLOR_KILLER}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_COLORFX}) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUTOBRIGHTNESS}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_BAND_STOP_FILTER}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_ROTATE}) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_BG_COLOR}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_CHROMA_GAIN}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_ILLUMINATORS_1}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_ILLUMINATORS_2}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_MIN_BUFFERS_FOR_CAPTURE}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_MIN_BUFFERS_FOR_OUTPUT}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_ALPHA_COMPONENT}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_COLORFX_CBCR}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=0x8000000 /* V4L2_CID_??? */}) = -1
> EINVAL (Invalid argument)
> write(1, "\ttest VIDIOC_QUERYCTRL: \33[32mOK\33"..., 36 test
> VIDIOC_QUERYCTRL: OK
> ) = 36
> ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CTRL_CLASS_USER+0x1}) = -1 EACCES
> (Permission denied)
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CTRL_CLASS_USER+0x1, value=0}) = -1
> EACCES (Permission denied)
> ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_BRIGHTNESS, value=128}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_BRIGHTNESS, value=128 => 128}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_BRIGHTNESS, value=-1 => 0}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_BRIGHTNESS, value=256 => 255}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_BRIGHTNESS, value=0 => 0}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_BRIGHTNESS, value=255 => 255}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_BRIGHTNESS, value=128 => 128}) = 0
> ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_CONTRAST, value=32}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_CONTRAST, value=32 => 32}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_CONTRAST, value=-1 => 255}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_CONTRAST, value=256 => 255}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_CONTRAST, value=0 => 0}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_CONTRAST, value=255 => 255}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_CONTRAST, value=32 => 32}) = 0
> ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_SATURATION, value=32}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_SATURATION, value=32 => 32}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_SATURATION, value=-1 => 255}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_SATURATION, value=256 => 255}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_SATURATION, value=0 => 0}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_SATURATION, value=255 => 255}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_SATURATION, value=32 => 32}) = 0
> ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=1}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=1 => 1}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=-1 => 0}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=2 => 1}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=0 => 0}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=1 => 1}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=1 => 1}) = 0
> ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_GAIN, value=64}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAIN, value=64 => 64}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAIN, value=-1 => 255}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAIN, value=256 => 255}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAIN, value=0 => 0}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAIN, value=255 => 255}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAIN, value=64 => 64}) = 0
> ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY, value=2}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY, value=2 => 2}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY, value=-1})
> = -1 ERANGE (Numerical result out of range)
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY, value=3}) =
> -1 ERANGE (Numerical result out of range)
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY, value=0 => 0}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY, value=1 => 1}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY, value=2 => 2}) = 0
> ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE, value=5500}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE,
> value=5500}) = -1 EACCES (Permission denied)
> write(1, "\t\t\33[1;31mfail\33[0m: v4l2-test-con"..., 78 fail:
> v4l2-test-controls.cpp(489): s_ctrl returned an error (13)
> ) = 78
> exit_group(1)                           = ?
> +++ exited with 1 +++
> # dmesg
> [  385.045056] usb 1-1.4: uvc_v4l2_open
> [  385.098713] usb 1-1.4: Resuming interface 2
> [  385.098730] usb 1-1.4: Resuming interface 3
> [  385.120569] usb 1-1.4: uvc_v4l2_release
> [  385.151878] usb 1-1.4: uvc_v4l2_open
> [  385.161591] usb 1-1.4: uvc_v4l2_open
> [  385.164556] usb 1-1.4: uvc_v4l2_open
> [  385.164692] usb 1-1.4: uvc_v4l2_open
> [  385.164801] usb 1-1.4: uvc_v4l2_open
> [  385.164914] usb 1-1.4: uvc_v4l2_open
> [  385.165025] usb 1-1.4: uvc_v4l2_open
> [  385.165139] usb 1-1.4: uvc_v4l2_open
> [  385.165249] usb 1-1.4: uvc_v4l2_open
> [  385.165360] usb 1-1.4: uvc_v4l2_open
> [  385.166515] usb 1-1.4: uvc_v4l2_open
> [  385.166600] usb 1-1.4: uvc_v4l2_open
> [  385.166675] usb 1-1.4: uvc_v4l2_open
> [  385.166748] usb 1-1.4: uvc_v4l2_open
> [  385.166822] usb 1-1.4: uvc_v4l2_open
> [  385.166895] usb 1-1.4: uvc_v4l2_open
> [  385.166968] usb 1-1.4: uvc_v4l2_open
> [  385.167042] usb 1-1.4: uvc_v4l2_open
> [  385.167115] usb 1-1.4: uvc_v4l2_open
> [  385.167187] usb 1-1.4: uvc_v4l2_open
> [  385.167259] usb 1-1.4: uvc_v4l2_open
> [  385.167331] usb 1-1.4: uvc_v4l2_open
> [  385.167415] usb 1-1.4: uvc_v4l2_open
> [  385.167491] usb 1-1.4: uvc_v4l2_open
> [  385.167563] usb 1-1.4: uvc_v4l2_open
> [  385.167636] usb 1-1.4: uvc_v4l2_open
> [  385.167708] usb 1-1.4: uvc_v4l2_open
> [  385.167780] usb 1-1.4: uvc_v4l2_open
> [  385.167854] usb 1-1.4: uvc_v4l2_open
> [  385.167927] usb 1-1.4: uvc_v4l2_open
> [  385.167999] usb 1-1.4: uvc_v4l2_open
> [  385.168071] usb 1-1.4: uvc_v4l2_open
> [  385.168143] usb 1-1.4: uvc_v4l2_open
> [  385.168218] usb 1-1.4: uvc_v4l2_open
> [  385.168290] usb 1-1.4: uvc_v4l2_open
> [  385.168363] usb 1-1.4: uvc_v4l2_open
> [  385.168446] usb 1-1.4: uvc_v4l2_open
> [  385.168520] usb 1-1.4: uvc_v4l2_open
> [  385.168593] usb 1-1.4: uvc_v4l2_open
> [  385.168667] usb 1-1.4: uvc_v4l2_open
> [  385.168740] usb 1-1.4: uvc_v4l2_open
> [  385.168815] usb 1-1.4: uvc_v4l2_open
> [  385.168889] usb 1-1.4: uvc_v4l2_open
> [  385.168962] usb 1-1.4: uvc_v4l2_open
> [  385.169036] usb 1-1.4: uvc_v4l2_open
> [  385.169109] usb 1-1.4: uvc_v4l2_open
> [  385.169182] usb 1-1.4: uvc_v4l2_open
> [  385.169255] usb 1-1.4: uvc_v4l2_open
> [  385.169329] usb 1-1.4: uvc_v4l2_open
> [  385.169411] usb 1-1.4: uvc_v4l2_open
> [  385.169492] usb 1-1.4: uvc_v4l2_open
> [  385.169565] usb 1-1.4: uvc_v4l2_open
> [  385.169638] usb 1-1.4: uvc_v4l2_open
> [  385.169710] usb 1-1.4: uvc_v4l2_open
> [  385.169783] usb 1-1.4: uvc_v4l2_open
> [  385.169855] usb 1-1.4: uvc_v4l2_open
> [  385.169929] usb 1-1.4: uvc_v4l2_open
> [  385.170002] usb 1-1.4: uvc_v4l2_open
> [  385.170075] usb 1-1.4: uvc_v4l2_open
> [  385.170149] usb 1-1.4: uvc_v4l2_open
> [  385.170223] usb 1-1.4: uvc_v4l2_open
> [  385.170297] usb 1-1.4: uvc_v4l2_open
> [  385.170371] usb 1-1.4: uvc_v4l2_open
> [  385.170460] usb 1-1.4: uvc_v4l2_open
> [  385.170541] usb 1-1.4: uvc_v4l2_open
> [  385.170621] usb 1-1.4: uvc_v4l2_open
> [  385.170730] usb 1-1.4: uvc_v4l2_open
> [  385.170880] usb 1-1.4: uvc_v4l2_open
> [  385.170978] usb 1-1.4: uvc_v4l2_open
> [  385.171144] usb 1-1.4: uvc_v4l2_open
> [  385.171304] usb 1-1.4: uvc_v4l2_open
> [  385.171466] usb 1-1.4: uvc_v4l2_open
> [  385.171594] usb 1-1.4: uvc_v4l2_open
> [  385.171737] usb 1-1.4: uvc_v4l2_open
> [  385.171896] usb 1-1.4: uvc_v4l2_open
> [  385.172040] usb 1-1.4: uvc_v4l2_open
> [  385.172186] usb 1-1.4: uvc_v4l2_open
> [  385.172331] usb 1-1.4: uvc_v4l2_open
> [  385.172496] usb 1-1.4: uvc_v4l2_open
> [  385.172644] usb 1-1.4: uvc_v4l2_open
> [  385.172789] usb 1-1.4: uvc_v4l2_open
> [  385.172876] usb 1-1.4: uvc_v4l2_open
> [  385.172954] usb 1-1.4: uvc_v4l2_open
> [  385.173029] usb 1-1.4: uvc_v4l2_open
> [  385.173102] usb 1-1.4: uvc_v4l2_open
> [  385.173176] usb 1-1.4: uvc_v4l2_open
> [  385.173249] usb 1-1.4: uvc_v4l2_open
> [  385.173329] usb 1-1.4: uvc_v4l2_open
> [  385.173488] usb 1-1.4: uvc_v4l2_open
> [  385.173633] usb 1-1.4: uvc_v4l2_open
> [  385.173754] usb 1-1.4: uvc_v4l2_open
> [  385.173919] usb 1-1.4: uvc_v4l2_open
> [  385.174064] usb 1-1.4: uvc_v4l2_open
> [  385.174183] usb 1-1.4: uvc_v4l2_open
> [  385.174297] usb 1-1.4: uvc_v4l2_open
> [  385.174427] usb 1-1.4: uvc_v4l2_open
> [  385.174545] usb 1-1.4: uvc_v4l2_open
> [  385.174684] usb 1-1.4: uvc_v4l2_open
> [  385.174801] usb 1-1.4: uvc_v4l2_open
> [  385.174920] usb 1-1.4: uvc_v4l2_open
> [  385.175034] usb 1-1.4: uvc_v4l2_open
> [  385.175149] usb 1-1.4: uvc_v4l2_open
> [  385.175259] usb 1-1.4: uvc_v4l2_release
> [  385.175369] usb 1-1.4: uvc_v4l2_release
> [  385.175452] usb 1-1.4: uvc_v4l2_release
> [  385.175520] usb 1-1.4: uvc_v4l2_release
> [  385.175627] usb 1-1.4: uvc_v4l2_release
> [  385.175718] usb 1-1.4: uvc_v4l2_release
> [  385.175786] usb 1-1.4: uvc_v4l2_release
> [  385.175861] usb 1-1.4: uvc_v4l2_release
> [  385.175954] usb 1-1.4: uvc_v4l2_release
> [  385.176021] usb 1-1.4: uvc_v4l2_release
> [  385.176087] usb 1-1.4: uvc_v4l2_release
> [  385.176187] usb 1-1.4: uvc_v4l2_release
> [  385.176257] usb 1-1.4: uvc_v4l2_release
> [  385.176330] usb 1-1.4: uvc_v4l2_release
> [  385.176437] usb 1-1.4: uvc_v4l2_release
> [  385.176513] usb 1-1.4: uvc_v4l2_release
> [  385.176608] usb 1-1.4: uvc_v4l2_release
> [  385.176675] usb 1-1.4: uvc_v4l2_release
> [  385.176749] usb 1-1.4: uvc_v4l2_release
> [  385.176844] usb 1-1.4: uvc_v4l2_release
> [  385.176912] usb 1-1.4: uvc_v4l2_release
> [  385.177019] usb 1-1.4: uvc_v4l2_release
> [  385.177115] usb 1-1.4: uvc_v4l2_release
> [  385.177182] usb 1-1.4: uvc_v4l2_release
> [  385.177255] usb 1-1.4: uvc_v4l2_release
> [  385.177349] usb 1-1.4: uvc_v4l2_release
> [  385.177426] usb 1-1.4: uvc_v4l2_release
> [  385.177526] usb 1-1.4: uvc_v4l2_release
> [  385.177594] usb 1-1.4: uvc_v4l2_release
> [  385.177659] usb 1-1.4: uvc_v4l2_release
> [  385.177760] usb 1-1.4: uvc_v4l2_release
> [  385.177828] usb 1-1.4: uvc_v4l2_release
> [  385.177900] usb 1-1.4: uvc_v4l2_release
> [  385.177997] usb 1-1.4: uvc_v4l2_release
> [  385.178090] usb 1-1.4: uvc_v4l2_release
> [  385.178156] usb 1-1.4: uvc_v4l2_release
> [  385.178253] usb 1-1.4: uvc_v4l2_release
> [  385.178320] usb 1-1.4: uvc_v4l2_release
> [  385.178430] usb 1-1.4: uvc_v4l2_release
> [  385.178500] usb 1-1.4: uvc_v4l2_release
> [  385.178574] usb 1-1.4: uvc_v4l2_release
> [  385.178678] usb 1-1.4: uvc_v4l2_release
> [  385.178770] usb 1-1.4: uvc_v4l2_release
> [  385.178837] usb 1-1.4: uvc_v4l2_release
> [  385.178937] usb 1-1.4: uvc_v4l2_release
> [  385.179027] usb 1-1.4: uvc_v4l2_release
> [  385.179094] usb 1-1.4: uvc_v4l2_release
> [  385.179161] usb 1-1.4: uvc_v4l2_release
> [  385.179234] usb 1-1.4: uvc_v4l2_release
> [  385.179333] usb 1-1.4: uvc_v4l2_release
> [  385.179441] usb 1-1.4: uvc_v4l2_release
> [  385.179511] usb 1-1.4: uvc_v4l2_release
> [  385.179577] usb 1-1.4: uvc_v4l2_release
> [  385.179675] usb 1-1.4: uvc_v4l2_release
> [  385.179751] usb 1-1.4: uvc_v4l2_release
> [  385.179848] usb 1-1.4: uvc_v4l2_release
> [  385.179941] usb 1-1.4: uvc_v4l2_release
> [  385.180008] usb 1-1.4: uvc_v4l2_release
> [  385.180105] usb 1-1.4: uvc_v4l2_release
> [  385.180173] usb 1-1.4: uvc_v4l2_release
> [  385.180248] usb 1-1.4: uvc_v4l2_release
> [  385.180342] usb 1-1.4: uvc_v4l2_release
> [  385.180432] usb 1-1.4: uvc_v4l2_release
> [  385.180527] usb 1-1.4: uvc_v4l2_release
> [  385.180594] usb 1-1.4: uvc_v4l2_release
> [  385.180667] usb 1-1.4: uvc_v4l2_release
> [  385.180760] usb 1-1.4: uvc_v4l2_release
> [  385.180827] usb 1-1.4: uvc_v4l2_release
> [  385.180900] usb 1-1.4: uvc_v4l2_release
> [  385.180996] usb 1-1.4: uvc_v4l2_release
> [  385.181070] usb 1-1.4: uvc_v4l2_release
> [  385.181163] usb 1-1.4: uvc_v4l2_release
> [  385.181231] usb 1-1.4: uvc_v4l2_release
> [  385.181331] usb 1-1.4: uvc_v4l2_release
> [  385.181437] usb 1-1.4: uvc_v4l2_release
> [  385.181508] usb 1-1.4: uvc_v4l2_release
> [  385.181574] usb 1-1.4: uvc_v4l2_release
> [  385.181639] usb 1-1.4: uvc_v4l2_release
> [  385.181740] usb 1-1.4: uvc_v4l2_release
> [  385.181807] usb 1-1.4: uvc_v4l2_release
> [  385.181882] usb 1-1.4: uvc_v4l2_release
> [  385.181980] usb 1-1.4: uvc_v4l2_release
> [  385.182076] usb 1-1.4: uvc_v4l2_release
> [  385.182143] usb 1-1.4: uvc_v4l2_release
> [  385.182216] usb 1-1.4: uvc_v4l2_release
> [  385.182310] usb 1-1.4: uvc_v4l2_release
> [  385.182386] usb 1-1.4: uvc_v4l2_release
> [  385.182492] usb 1-1.4: uvc_v4l2_release
> [  385.182568] usb 1-1.4: uvc_v4l2_release
> [  385.182667] usb 1-1.4: uvc_v4l2_release
> [  385.182758] usb 1-1.4: uvc_v4l2_release
> [  385.182824] usb 1-1.4: uvc_v4l2_release
> [  385.182923] usb 1-1.4: uvc_v4l2_release
> [  385.182990] usb 1-1.4: uvc_v4l2_release
> [  385.183090] usb 1-1.4: uvc_v4l2_release
> [  385.183157] usb 1-1.4: uvc_v4l2_release
> [  385.183255] usb 1-1.4: uvc_v4l2_release
> [  385.183324] usb 1-1.4: uvc_v4l2_release
> [  385.183451] usb 1-1.4: uvc_v4l2_release
> [  385.183546] usb 1-1.4: uvc_v4l2_release
> [  385.208523] usb 1-1.4: Control 0x00980001 not found
> [  385.212873] usb 1-1.4: Control 0x009a0001 not found
> [  385.221279] usb 1-1.4: Control 0x00000000 not found
> [  385.222570] usb 1-1.4: Control 0x00980903 not found
> [  385.222822] usb 1-1.4: Control 0x00980904 not found
> [  385.222999] usb 1-1.4: Control 0x00980905 not found
> [  385.223178] usb 1-1.4: Control 0x00980906 not found
> [  385.223355] usb 1-1.4: Control 0x00980907 not found
> [  385.223548] usb 1-1.4: Control 0x00980908 not found
> [  385.223727] usb 1-1.4: Control 0x00980909 not found
> [  385.223998] usb 1-1.4: Control 0x0098090a not found
> [  385.224177] usb 1-1.4: Control 0x0098090b not found
> [  385.224723] usb 1-1.4: Control 0x0098090d not found
> [  385.224969] usb 1-1.4: Control 0x0098090e not found
> [  385.225146] usb 1-1.4: Control 0x0098090f not found
> [  385.225323] usb 1-1.4: Control 0x00980910 not found
> [  385.225518] usb 1-1.4: Control 0x00980911 not found
> [  385.225697] usb 1-1.4: Control 0x00980912 not found
> [  385.226273] usb 1-1.4: Control 0x00980914 not found
> [  385.226466] usb 1-1.4: Control 0x00980915 not found
> [  385.226710] usb 1-1.4: Control 0x00980916 not found
> [  385.226888] usb 1-1.4: Control 0x00980917 not found
> [  385.227931] usb 1-1.4: Control 0x00980919 not found
> [  385.229198] usb 1-1.4: Control 0x0098091d not found
> [  385.229454] usb 1-1.4: Control 0x0098091e not found
> [  385.229629] usb 1-1.4: Control 0x0098091f not found
> [  385.229806] usb 1-1.4: Control 0x00980920 not found
> [  385.229983] usb 1-1.4: Control 0x00980921 not found
> [  385.230162] usb 1-1.4: Control 0x00980922 not found
> [  385.230343] usb 1-1.4: Control 0x00980923 not found
> [  385.230540] usb 1-1.4: Control 0x00980924 not found
> [  385.230720] usb 1-1.4: Control 0x00980925 not found
> [  385.230965] usb 1-1.4: Control 0x00980926 not found
> [  385.231141] usb 1-1.4: Control 0x00980927 not found
> [  385.231318] usb 1-1.4: Control 0x00980928 not found
> [  385.231507] usb 1-1.4: Control 0x00980929 not found
> [  385.231687] usb 1-1.4: Control 0x0098092a not found
> [  385.231938] usb 1-1.4: Control 0x08000000 not found
> [  385.236521] usb 1-1.4: Control 0x00000000 not found
> [  385.237318] usb 1-1.4: Control 0x00980903 not found
> [  385.237516] usb 1-1.4: Control 0x00980904 not found
> [  385.237763] usb 1-1.4: Control 0x00980905 not found
> [  385.237938] usb 1-1.4: Control 0x00980906 not found
> [  385.238113] usb 1-1.4: Control 0x00980907 not found
> [  385.238291] usb 1-1.4: Control 0x00980908 not found
> [  385.238551] usb 1-1.4: Control 0x00980909 not found
> [  385.238727] usb 1-1.4: Control 0x0098090a not found
> [  385.238903] usb 1-1.4: Control 0x0098090b not found
> [  385.239324] usb 1-1.4: Control 0x0098090d not found
> [  385.239512] usb 1-1.4: Control 0x0098090e not found
> [  385.239693] usb 1-1.4: Control 0x0098090f not found
> [  385.239893] usb 1-1.4: Control 0x00980910 not found
> [  385.240072] usb 1-1.4: Control 0x00980911 not found
> [  385.240313] usb 1-1.4: Control 0x00980912 not found
> [  385.240751] usb 1-1.4: Control 0x00980914 not found
> [  385.240926] usb 1-1.4: Control 0x00980915 not found
> [  385.241101] usb 1-1.4: Control 0x00980916 not found
> [  385.241281] usb 1-1.4: Control 0x00980917 not found
> [  385.241718] usb 1-1.4: Control 0x00980919 not found
> [  385.242511] usb 1-1.4: Control 0x0098091d not found
> [  385.242689] usb 1-1.4: Control 0x0098091e not found
> [  385.242868] usb 1-1.4: Control 0x0098091f not found
> [  385.243109] usb 1-1.4: Control 0x00980920 not found
> [  385.243282] usb 1-1.4: Control 0x00980921 not found
> [  385.243471] usb 1-1.4: Control 0x00980922 not found
> [  385.243651] usb 1-1.4: Control 0x00980923 not found
> [  385.243829] usb 1-1.4: Control 0x00980924 not found
> [  385.244072] usb 1-1.4: Control 0x00980925 not found
> [  385.244245] usb 1-1.4: Control 0x00980926 not found
> [  385.244435] usb 1-1.4: Control 0x00980927 not found
> [  385.244612] usb 1-1.4: Control 0x00980928 not found
> [  385.244789] usb 1-1.4: Control 0x00980929 not found
> [  385.244969] usb 1-1.4: Control 0x0098092a not found
> [  385.245218] usb 1-1.4: Control 0x08000000 not found
> [  385.325210] usb 1-1.4: uvc_v4l2_release
> [  385.325234] usb 1-1.4: uvc_v4l2_release
>
>
>
> # dmesg -c > /dev/null
> # v4l2-ctl --all -d /dev/video0
> Driver Info:
> Driver name      : uvcvideo
> Card type        : SVS RGB USB camera: SVS RGB USB
> Bus info         : usb-0000:00:14.0-2
> Driver version   : 5.15.0
> Capabilities     : 0x84a00001
> Video Capture
> Metadata Capture
> Streaming
> Extended Pix Format
> Device Capabilities
> Device Caps      : 0x04200001
> Video Capture
> Streaming
> Extended Pix Format
> Media Driver Info:
> Driver name      : uvcvideo
> Model            : SVS RGB USB camera: SVS RGB USB
> Serial           : V20210818SWS2093
> Bus info         : usb-0000:00:14.0-2
> Media version    : 5.15.0
> Hardware revision: 0x00000001 (1)
> Driver version   : 5.15.0
> Interface Info:
> ID               : 0x03000002
> Type             : V4L Video
> Entity Info:
> ID               : 0x00000001 (1)
> Name             : Video Capture 4
> Function         : V4L2 I/O
> Flags            : default
> Pad 0x01000007   : 0: Sink
>  Link 0x02000010: from remote pad 0x100000a of entity 'Extension 3'
> (Video Pixel Formatter): Data, Enabled, Immutable
> Priority: 2
> Video input : 0 (Camera 1: ok)
> Format Video Capture:
> Width/Height      : 640/480
> Pixel Format      : 'MJPG' (Motion-JPEG)
> Field             : None
> Bytes per Line    : 0
> Size Image        : 614400
> Colorspace        : Default
> Transfer Function : Default (maps to Rec. 709)
> YCbCr/HSV Encoding: Default (maps to ITU-R 601)
> Quantization      : Default (maps to Full Range)
> Flags             :
> Crop Capability Video Capture:
> Bounds      : Left 0, Top 0, Width 640, Height 480
> Default     : Left 0, Top 0, Width 640, Height 480
> Pixel Aspect: 1/1
> Selection Video Capture: crop_default, Left 0, Top 0, Width 640,
> Height 480, Flags:
> Selection Video Capture: crop_bounds, Left 0, Top 0, Width 640, Height
> 480, Flags:
> Streaming Parameters Video Capture:
> Capabilities     : timeperframe
> Frames per second: 30.000 (30/1)
> Read buffers     : 0
>
> User Controls
>
>                      brightness 0x00980900 (int)    : min=1 max=255
> step=1 default=128 value=128
>                        contrast 0x00980901 (int)    : min=1 max=255
> step=1 default=128 value=128
>                      saturation 0x00980902 (int)    : min=1 max=255
> step=1 default=128 value=128
>         white_balance_automatic 0x0098090c (bool)   : default=1 value=1
>                           gamma 0x00980910 (int)    : min=1 max=255
> step=1 default=128 value=128
>                            gain 0x00980913 (int)    : min=1 max=100
> step=1 default=50 value=50
>            power_line_frequency 0x00980918 (menu)   : min=0 max=2
> default=1 value=2 (60 Hz)
> 0: Disabled
> 1: 50 Hz
> 2: 60 Hz
>       white_balance_temperature 0x0098091a (int)    : min=2800
> max=6500 step=1 default=4650 value=4650 flags=inactive
>                       sharpness 0x0098091b (int)    : min=1 max=255
> step=1 default=128 value=128
>
> Camera Controls
>
>                   auto_exposure 0x009a0901 (menu)   : min=0 max=3
> default=0 value=2 (Shutter Priority Mode)
> 0: Auto Mode
> 2: Shutter Priority Mode
>          exposure_time_absolute 0x009a0902 (int)    : min=5 max=2500
> step=1 default=5 value=5 flags=inactive
>      exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
> # strace -f v4l2-compliance -d /dev/video0 -E
> execve("/usr/bin/v4l2-compliance", ["v4l2-compliance", "-d",
> "/dev/video0", "-E"], 0x7ffe91f04110 /* 13 vars */) = 0
> brk(NULL)                               = 0x56059779b000
> access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
> openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = -1 ENOENT
> (No such file or directory)
> openat(AT_FDCWD, "/lib64/glibc-hwcaps/x86-64-v3/libv4l2.so.0",
> O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
> newfstatat(AT_FDCWD, "/lib64/glibc-hwcaps/x86-64-v3", 0x7fff3695c240,
> 0) = -1 ENOENT (No such file or directory)
> openat(AT_FDCWD, "/lib64/glibc-hwcaps/x86-64-v2/libv4l2.so.0",
> O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
> newfstatat(AT_FDCWD, "/lib64/glibc-hwcaps/x86-64-v2", 0x7fff3695c240,
> 0) = -1 ENOENT (No such file or directory)
> openat(AT_FDCWD, "/lib64/tls/haswell/x86_64/libv4l2.so.0",
> O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
> newfstatat(AT_FDCWD, "/lib64/tls/haswell/x86_64", 0x7fff3695c240, 0) =
> -1 ENOENT (No such file or directory)
> openat(AT_FDCWD, "/lib64/tls/haswell/libv4l2.so.0",
> O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
> newfstatat(AT_FDCWD, "/lib64/tls/haswell", 0x7fff3695c240, 0) = -1
> ENOENT (No such file or directory)
> openat(AT_FDCWD, "/lib64/tls/x86_64/libv4l2.so.0", O_RDONLY|O_CLOEXEC)
> = -1 ENOENT (No such file or directory)
> newfstatat(AT_FDCWD, "/lib64/tls/x86_64", 0x7fff3695c240, 0) = -1
> ENOENT (No such file or directory)
> openat(AT_FDCWD, "/lib64/tls/libv4l2.so.0", O_RDONLY|O_CLOEXEC) = -1
> ENOENT (No such file or directory)
> newfstatat(AT_FDCWD, "/lib64/tls", 0x7fff3695c240, 0) = -1 ENOENT (No
> such file or directory)
> openat(AT_FDCWD, "/lib64/haswell/x86_64/libv4l2.so.0",
> O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
> newfstatat(AT_FDCWD, "/lib64/haswell/x86_64", 0x7fff3695c240, 0) = -1
> ENOENT (No such file or directory)
> openat(AT_FDCWD, "/lib64/haswell/libv4l2.so.0", O_RDONLY|O_CLOEXEC) =
> -1 ENOENT (No such file or directory)
> newfstatat(AT_FDCWD, "/lib64/haswell", 0x7fff3695c240, 0) = -1 ENOENT
> (No such file or directory)
> openat(AT_FDCWD, "/lib64/x86_64/libv4l2.so.0", O_RDONLY|O_CLOEXEC) =
> -1 ENOENT (No such file or directory)
> newfstatat(AT_FDCWD, "/lib64/x86_64", 0x7fff3695c240, 0) = -1 ENOENT
> (No such file or directory)
> openat(AT_FDCWD, "/lib64/libv4l2.so.0", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\370\"\0\0\0\0\0\0"...,
> 832) = 832
> pread64(3, "\4\0\0\0
> \0\0\0\5\0\0\0GNU\0\1\0\1\300\4\0\0\0\t\0\0\0\0\0\0\0"..., 48, 35072)
> = 48
> newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=55392, ...}, AT_EMPTY_PATH) = 0
> mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
> 0) = 0x7f43c64c5000
> mmap(NULL, 57808, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f43c64b6000
> mmap(0x7f43c64b8000, 20480, PROT_READ|PROT_EXEC,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0x7f43c64b8000
> mmap(0x7f43c64bd000, 8192, PROT_READ,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x7000) = 0x7f43c64bd000
> mmap(0x7f43c64bf000, 24576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8000) = 0x7f43c64bf000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib64/libv4lconvert.so.0", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\250D\0\0\0\0\0\0"...,
> 832) = 832
> pread64(3, "\4\0\0\0
> \0\0\0\5\0\0\0GNU\0\1\0\1\300\4\0\0\0\t\0\0\0\0\0\0\0"..., 48, 126512)
> = 48
> newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=137440, ...},
> AT_EMPTY_PATH) = 0
> mmap(NULL, 476256, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f43c6441000
> mprotect(0x7f43c6445000, 114688, PROT_NONE) = 0
> mmap(0x7f43c6445000, 73728, PROT_READ|PROT_EXEC,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) = 0x7f43c6445000
> mmap(0x7f43c6457000, 36864, PROT_READ,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x16000) = 0x7f43c6457000
> mmap(0x7f43c6461000, 12288, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1f000) = 0x7f43c6461000
> mmap(0x7f43c6464000, 332896, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f43c6464000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib64/libjpeg.so.8", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0@E\0\0\0\0\0\0"...,
> 832) = 832
> newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=493408, ...},
> AT_EMPTY_PATH) = 0
> mmap(NULL, 495648, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f43c63c7000
> mmap(0x7f43c63cb000, 237568, PROT_READ|PROT_EXEC,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) = 0x7f43c63cb000
> mmap(0x7f43c6405000, 237568, PROT_READ,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3e000) = 0x7f43c6405000
> mmap(0x7f43c643f000, 8192, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x77000) = 0x7f43c643f000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib64/libstdc++.so.6", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\0\214\n\0\0\0\0\0"...,
> 832) = 832
> pread64(3, "\4\0\0\0
> \0\0\0\5\0\0\0GNU\0\1\0\1\300\4\0\0\0\v\0\0\0\0\0\0\0"..., 48,
> 1457064) = 48
> newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=1515608, ...},
> AT_EMPTY_PATH) = 0
> mmap(NULL, 1531392, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f43c6251000
> mmap(0x7f43c62f3000, 524288, PROT_READ|PROT_EXEC,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xa2000) = 0x7f43c62f3000
> mmap(0x7f43c6373000, 270336, PROT_READ,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x122000) = 0x7f43c6373000
> mmap(0x7f43c63b5000, 61440, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x163000) = 0x7f43c63b5000
> mmap(0x7f43c63c4000, 11776, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f43c63c4000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib64/libm.so.6", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\340\321\0\0\0\0\0\0"...,
> 832) = 832
> newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=878512, ...},
> AT_EMPTY_PATH) = 0
> mmap(NULL, 880680, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f43c6179000
> mprotect(0x7f43c6186000, 823296, PROT_NONE) = 0
> mmap(0x7f43c6186000, 442368, PROT_READ|PROT_EXEC,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xd000) = 0x7f43c6186000
> mmap(0x7f43c61f2000, 376832, PROT_READ,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x79000) = 0x7f43c61f2000
> mmap(0x7f43c624f000, 8192, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xd5000) = 0x7f43c624f000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib64/libgcc_s.so.1", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\3702\0\0\0\0\0\0"...,
> 832) = 832
> pread64(3, "\4\0\0\0
> \0\0\0\5\0\0\0GNU\0\1\0\1\300\4\0\0\0\v\0\0\0\0\0\0\0"..., 48, 71408)
> = 48
> newfstatat(3, "", {st_mode=S_IFREG|0644, st_size=76144, ...}, AT_EMPTY_PATH) = 0
> mmap(NULL, 78856, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f43c6165000
> mmap(0x7f43c6168000, 49152, PROT_READ|PROT_EXEC,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3000) = 0x7f43c6168000
> mmap(0x7f43c6174000, 12288, PROT_READ,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xf000) = 0x7f43c6174000
> mmap(0x7f43c6177000, 8192, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x11000) = 0x7f43c6177000
> close(3)                                = 0
> openat(AT_FDCWD, "/lib64/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
> read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0
> \224\2\0\0\0\0\0"..., 832) = 832
> pread64(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"...,
> 784, 64) = 784
> pread64(3, "\4\0\0\0000\0\0\0\5\0\0\0GNU\0\2\200\0\300\4\0\0\0\3\0\0\0\0\0\0\0"...,
> 64, 848) = 64
> pread64(3, "\4\0\0\0\20\0\0\0\1\0\0\0GNU\0\0\0\0\0\5\0\0\0\17\0\0\0\0\0\0\0",
> 32, 912) = 32
> newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=2023720, ...},
> AT_EMPTY_PATH) = 0
> mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
> 0) = 0x7f43c6163000
> pread64(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"...,
> 784, 64) = 784
> mmap(NULL, 2075760, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f43c5f68000
> mprotect(0x7f43c5f90000, 1835008, PROT_NONE) = 0
> mmap(0x7f43c5f90000, 1466368, PROT_READ|PROT_EXEC,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x28000) = 0x7f43c5f90000
> mmap(0x7f43c60f6000, 364544, PROT_READ,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x18e000) = 0x7f43c60f6000
> mmap(0x7f43c6150000, 24576, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1e7000) = 0x7f43c6150000
> mmap(0x7f43c6156000, 52336, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f43c6156000
> close(3)                                = 0
> mmap(NULL, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
> 0) = 0x7f43c5f65000
> arch_prctl(ARCH_SET_FS, 0x7f43c5f65740) = 0
> set_tid_address(0x7f43c5f65a10)         = 552
> set_robust_list(0x7f43c5f65a20, 24)     = 0
> mprotect(0x7f43c6150000, 16384, PROT_READ) = 0
> mprotect(0x7f43c6177000, 4096, PROT_READ) = 0
> mprotect(0x7f43c624f000, 4096, PROT_READ) = 0
> mprotect(0x7f43c63b5000, 45056, PROT_READ) = 0
> mprotect(0x7f43c643f000, 4096, PROT_READ) = 0
> mprotect(0x7f43c6461000, 8192, PROT_READ) = 0
> mprotect(0x7f43c64bf000, 4096, PROT_READ) = 0
> mprotect(0x560595ad6000, 8192, PROT_READ) = 0
> mprotect(0x7f43c64f6000, 8192, PROT_READ) = 0
> prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=8192*1024,
> rlim_max=RLIM64_INFINITY}) = 0
> getrandom("\x82\xcd\x29\xaf\x93\x01\xca\xbb", 8, GRND_NONBLOCK) = 8
> brk(NULL)                               = 0x56059779b000
> brk(0x5605977bc000)                     = 0x5605977bc000
> futex(0x7f43c63c4cbc, FUTEX_WAKE_PRIVATE, 2147483647) = 0
> futex(0x7f43c63c4cc8, FUTEX_WAKE_PRIVATE, 2147483647) = 0
> ioctl(1, TCGETS, {B38400 opost isig icanon echo ...}) = 0
> newfstatat(1, "", {st_mode=S_IFCHR|0620, st_rdev=makedev(0x88, 0),
> ...}, AT_EMPTY_PATH) = 0
> write(1, "v4l2-compliance 1.22.1, 64 bits,"..., 47v4l2-compliance
> 1.22.1, 64 bits, 64-bit time_t
> ) = 47
> write(1, "\n", 1
> )                       = 1
> newfstatat(AT_FDCWD, "/dev/video0", {st_mode=S_IFCHR|0660,
> st_rdev=makedev(0x51, 0), ...}, 0) = 0
> openat(AT_FDCWD, "/sys/dev/char/81:0/uevent", O_RDONLY) = 3
> read(3, "MAJOR=81\nMINOR=0\nDEVNAME=video0\n", 8191) = 32
> close(3)                                = 0
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 3
> ioctl(3, VIDIOC_QUERYCAP, {driver="uvcvideo", card="SVS RGB USB
> camera: SVS RGB USB", bus_info="usb-0000:00:14.0-2",
> version=KERNEL_VERSION(5, 15, 0),
> capabilities=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_META_CAPTURE|V4L2_CAP_STREAMING|V4L2_CAP_DEVICE_CAPS,
> device_caps=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_STREAMING})
> = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|0 /*
> V4L2_CID_??? */ => V4L2_CTRL_CLASS_USER+0x1,
> type=V4L2_CTRL_TYPE_CTRL_CLASS, name="User Controls", ...}) = 0
> ioctl(3, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_???
> */, count=0}) = 0
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CTRL_FLAG_NEXT_CTRL|0 /*
> V4L2_CID_??? */ => V4L2_CTRL_CLASS_USER+0x1,
> type=V4L2_CTRL_TYPE_CTRL_CLASS, name="User Controls", ...}) = 0
> ioctl(3, VIDIOC_G_SELECTION, 0x7fff3695b92c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCAP, {driver="uvcvideo", card="SVS RGB USB
> camera: SVS RGB USB", bus_info="usb-0000:00:14.0-2",
> version=KERNEL_VERSION(5, 15, 0),
> capabilities=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_META_CAPTURE|V4L2_CAP_STREAMING|V4L2_CAP_DEVICE_CAPS,
> device_caps=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_STREAMING})
> = 0
> newfstatat(3, "", {st_mode=S_IFCHR|0660, st_rdev=makedev(0x51, 0),
> ...}, AT_EMPTY_PATH) = 0
> openat(AT_FDCWD, "/sys/dev/char/81:0/device",
> O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 4
> newfstatat(4, "", {st_mode=S_IFDIR|0755, st_size=0, ...}, AT_EMPTY_PATH) = 0
> getdents64(4, 0x5605977ad500 /* 26 entries */, 32768) = 936
> openat(AT_FDCWD, "/dev/media0", O_RDWR) = 5
> close(4)                                = 0
> ioctl(5, MEDIA_IOC_DEVICE_INFO, 0x7fff3695af28) = 0
> write(1, "Compliance test for uvcvideo dev"..., 50Compliance test for
> uvcvideo device /dev/video0:
>
> ) = 50
> write(1, "Driver Info:\n", 13Driver Info:
> )          = 13
> write(1, "\tDriver name      : uvcvideo\n", 29 Driver name      : uvcvideo
> ) = 29
> write(1, "\tCard type        : SVS RGB USB "..., 52 Card type        :
> SVS RGB USB camera: SVS RGB USB
> ) = 52
> write(1, "\tBus info         : usb-0000:00:"..., 39 Bus info         :
> usb-0000:00:14.0-2
> ) = 39
> write(1, "\tDriver version   : 5.15.0\n", 27 Driver version   : 5.15.0
> ) = 27
> write(1, "\tCapabilities     : 0x84a00001\n", 31 Capabilities     : 0x84a00001
> ) = 31
> write(1, "\t\tVideo Capture\n\t\tMetadata Captu"..., 91 Video Capture
> Metadata Capture
> Streaming
> Extended Pix Format
> Device Capabilities
> ) = 91
> write(1, "\tDevice Caps      : 0x04200001\n", 31 Device Caps      : 0x04200001
> ) = 31
> write(1, "\t\tVideo Capture\n\t\tStreaming\n\t\tEx"..., 50 Video Capture
> Streaming
> Extended Pix Format
> ) = 50
> ioctl(5, MEDIA_IOC_DEVICE_INFO, 0x7fff3695ab28) = 0
> write(1, "Media Driver Info:\n", 19Media Driver Info:
> )    = 19
> write(1, "\tDriver name      : uvcvideo\n", 29 Driver name      : uvcvideo
> ) = 29
> write(1, "\tModel            : SVS RGB USB "..., 52 Model            :
> SVS RGB USB camera: SVS RGB USB
> ) = 52
> write(1, "\tSerial           : V20210818SWS"..., 37 Serial           :
> V20210818SWS2093
> ) = 37
> write(1, "\tBus info         : usb-0000:00:"..., 39 Bus info         :
> usb-0000:00:14.0-2
> ) = 39
> write(1, "\tMedia version    : 5.15.0\n", 27 Media version    : 5.15.0
> ) = 27
> write(1, "\tHardware revision: 0x00000001 ("..., 35 Hardware revision:
> 0x00000001 (1)
> ) = 35
> write(1, "\tDriver version   : 5.15.0\n", 27 Driver version   : 5.15.0
> ) = 27
> newfstatat(3, "", {st_mode=S_IFCHR|0660, st_rdev=makedev(0x51, 0),
> ...}, AT_EMPTY_PATH) = 0
> ioctl(5, MEDIA_IOC_G_TOPOLOGY, 0x7fff3695aa08) = 0
> ioctl(5, MEDIA_IOC_G_TOPOLOGY, 0x7fff3695aa08) = 0
> write(1, "Interface Info:\n", 16Interface Info:
> )       = 16
> write(1, "\tID               : 0x03000002\n", 31 ID               : 0x03000002
> ) = 31
> write(1, "\tType             : V4L Video\n", 30 Type             : V4L Video
> ) = 30
> write(1, "Entity Info:\n", 13Entity Info:
> )          = 13
> write(1, "\tID               : 0x00000001 ("..., 35 ID               :
> 0x00000001 (1)
> ) = 35
> write(1, "\tName             : Video Captur"..., 36 Name             :
> Video Capture 4
> ) = 36
> write(1, "\tFunction         : V4L2 I/O\n", 29 Function         : V4L2 I/O
> ) = 29
> write(1, "\tFlags            : default\n", 28 Flags            : default
> ) = 28
> write(1, "\tPad 0x01000007   : 0: Sink\n", 28 Pad 0x01000007   : 0: Sink
> ) = 28
> write(1, "\t  Link 0x02000010: from remote "..., 120  Link 0x02000010:
> from remote pad 0x100000a of entity 'Extension 3' (Video Pixel
> Formatter): Data, Enabled, Immutable
> ) = 120
> ioctl(5, MEDIA_IOC_ENUM_ENTITIES, 0x7fff3695bd00) = 0
> ioctl(5, MEDIA_IOC_ENUM_LINKS, 0x7fff3695af28) = 0
> write(1, "\n", 1
> )                       = 1
> write(1, "Required ioctls:\n", 17Required ioctls:
> )      = 17
> write(1, "\ttest MC information (see 'Media"..., 66 test MC
> information (see 'Media Driver Info' above): OK
> ) = 66
> ioctl(3, VIDIOC_QUERYCAP, NULL)         = -1 EFAULT (Bad address)
> ioctl(3, VIDIOC_QUERYCAP, {driver="uvcvideo", card="SVS RGB USB
> camera: SVS RGB USB", bus_info="usb-0000:00:14.0-2",
> version=KERNEL_VERSION(5, 15, 0),
> capabilities=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_META_CAPTURE|V4L2_CAP_STREAMING|V4L2_CAP_DEVICE_CAPS,
> device_caps=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_STREAMING})
> = 0
> write(1, "\ttest VIDIOC_QUERYCAP: \33[32mOK\33["..., 35 test VIDIOC_QUERYCAP: OK
> ) = 35
> ioctl(3, _IOC(_IOC_NONE, 0x56, 0xff, 0), 0) = -1 ENOTTY (Inappropriate
> ioctl for device)
> ioctl(3, _IOC(_IOC_NONE, 0x56, 0, 0x3fff), 0) = -1 ENOTTY
> (Inappropriate ioctl for device)
> ioctl(3, _IOC(_IOC_READ, 0x56, 0, 0x3fff), 0x7fff36956d48) = -1 ENOTTY
> (Inappropriate ioctl for device)
> ioctl(3, _IOC(_IOC_WRITE, 0x56, 0, 0x3fff), 0x7fff36956d48) = -1
> ENOTTY (Inappropriate ioctl for device)
> ioctl(3, _IOC(_IOC_READ|_IOC_WRITE, 0x56, 0, 0x3fff), 0x7fff36956d48)
> = -1 ENOTTY (Inappropriate ioctl for device)
> write(1, "\ttest invalid ioctls: \33[32mOK\33[0"..., 34 test invalid ioctls: OK
> ) = 34
> write(1, "\n", 1
> )                       = 1
> write(1, "Allow for multiple opens:\n", 26Allow for multiple opens:
> ) = 26
> dup(3)                                  = 4
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 6
> close(4)                                = 0
> ioctl(6, VIDIOC_QUERYCAP, {driver="uvcvideo", card="SVS RGB USB
> camera: SVS RGB USB", bus_info="usb-0000:00:14.0-2",
> version=KERNEL_VERSION(5, 15, 0),
> capabilities=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_META_CAPTURE|V4L2_CAP_STREAMING|V4L2_CAP_DEVICE_CAPS,
> device_caps=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_STREAMING})
> = 0
> ioctl(6, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|0 /*
> V4L2_CID_??? */ => V4L2_CTRL_CLASS_USER+0x1,
> type=V4L2_CTRL_TYPE_CTRL_CLASS, name="User Controls", ...}) = 0
> ioctl(6, VIDIOC_TRY_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_???
> */, count=0}) = 0
> ioctl(6, VIDIOC_QUERYCTRL, {id=V4L2_CTRL_FLAG_NEXT_CTRL|0 /*
> V4L2_CID_??? */ => V4L2_CTRL_CLASS_USER+0x1,
> type=V4L2_CTRL_TYPE_CTRL_CLASS, name="User Controls", ...}) = 0
> ioctl(6, VIDIOC_G_SELECTION, 0x7fff3695abbc) = -1 EINVAL (Invalid argument)
> write(1, "\ttest second /dev/video0 open: \33"..., 43 test second
> /dev/video0 open: OK
> ) = 43
> ioctl(6, VIDIOC_QUERYCAP, NULL)         = -1 EFAULT (Bad address)
> ioctl(6, VIDIOC_QUERYCAP, {driver="uvcvideo", card="SVS RGB USB
> camera: SVS RGB USB", bus_info="usb-0000:00:14.0-2",
> version=KERNEL_VERSION(5, 15, 0),
> capabilities=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_META_CAPTURE|V4L2_CAP_STREAMING|V4L2_CAP_DEVICE_CAPS,
> device_caps=V4L2_CAP_VIDEO_CAPTURE|V4L2_CAP_EXT_PIX_FORMAT|V4L2_CAP_STREAMING})
> = 0
> write(1, "\ttest VIDIOC_QUERYCAP: \33[32mOK\33["..., 35 test VIDIOC_QUERYCAP: OK
> ) = 35
> ioctl(3, VIDIOC_G_PRIORITY, 0x7fff3695ad44) = 0
> ioctl(6, VIDIOC_G_PRIORITY, 0x7fff3695ad44) = 0
> ioctl(3, VIDIOC_S_PRIORITY, 0x7fff3695adc0) = 0
> ioctl(3, VIDIOC_G_PRIORITY, 0x7fff3695ad44) = 0
> ioctl(6, VIDIOC_G_PRIORITY, 0x7fff3695ad44) = 0
> ioctl(6, VIDIOC_S_PRIORITY, 0x7fff3695adc0) = -1 EBUSY (Device or resource busy)
> ioctl(3, VIDIOC_S_PRIORITY, 0x7fff3695adc0) = 0
> ioctl(3, VIDIOC_G_PRIORITY, 0x7fff3695ad44) = 0
> ioctl(6, VIDIOC_G_PRIORITY, 0x7fff3695ad44) = 0
> write(1, "\ttest VIDIOC_G/S_PRIORITY: \33[32m"..., 39 test
> VIDIOC_G/S_PRIORITY: OK
> ) = 39
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 4
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 7
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 8
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 9
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 10
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 11
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 12
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 13
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 14
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 15
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 16
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 17
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 18
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 19
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 20
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 21
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 22
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 23
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 24
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 25
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 26
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 27
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 28
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 29
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 30
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 31
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 32
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 33
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 34
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 35
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 36
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 37
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 38
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 39
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 40
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 41
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 42
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 43
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 44
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 45
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 46
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 47
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 48
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 49
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 50
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 51
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 52
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 53
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 54
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 55
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 56
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 57
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 58
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 59
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 60
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 61
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 62
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 63
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 64
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 65
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 66
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 67
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 68
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 69
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 70
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 71
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 72
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 73
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 74
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 75
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 76
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 77
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 78
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 79
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 80
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 81
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 82
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 83
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 84
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 85
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 86
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 87
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 88
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 89
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 90
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 91
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 92
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 93
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 94
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 95
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 96
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 97
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 98
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 99
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 100
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 101
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 102
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 103
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 104
> openat(AT_FDCWD, "/dev/video0", O_RDWR) = 105
> close(105)                              = 0
> close(104)                              = 0
> close(103)                              = 0
> close(102)                              = 0
> close(101)                              = 0
> close(100)                              = 0
> close(99)                               = 0
> close(98)                               = 0
> close(97)                               = 0
> close(96)                               = 0
> close(95)                               = 0
> close(94)                               = 0
> close(93)                               = 0
> close(92)                               = 0
> close(91)                               = 0
> close(90)                               = 0
> close(89)                               = 0
> close(88)                               = 0
> close(87)                               = 0
> close(86)                               = 0
> close(85)                               = 0
> close(84)                               = 0
> close(83)                               = 0
> close(82)                               = 0
> close(81)                               = 0
> close(80)                               = 0
> close(79)                               = 0
> close(78)                               = 0
> close(77)                               = 0
> close(76)                               = 0
> close(75)                               = 0
> close(74)                               = 0
> close(73)                               = 0
> close(72)                               = 0
> close(71)                               = 0
> close(70)                               = 0
> close(69)                               = 0
> close(68)                               = 0
> close(67)                               = 0
> close(66)                               = 0
> close(65)                               = 0
> close(64)                               = 0
> close(63)                               = 0
> close(62)                               = 0
> close(61)                               = 0
> close(60)                               = 0
> close(59)                               = 0
> close(58)                               = 0
> close(57)                               = 0
> close(56)                               = 0
> close(55)                               = 0
> close(54)                               = 0
> close(53)                               = 0
> close(52)                               = 0
> close(51)                               = 0
> close(50)                               = 0
> close(49)                               = 0
> close(48)                               = 0
> close(47)                               = 0
> close(46)                               = 0
> close(45)                               = 0
> close(44)                               = 0
> close(43)                               = 0
> close(42)                               = 0
> close(41)                               = 0
> close(40)                               = 0
> close(39)                               = 0
> close(38)                               = 0
> close(37)                               = 0
> close(36)                               = 0
> close(35)                               = 0
> close(34)                               = 0
> close(33)                               = 0
> close(32)                               = 0
> close(31)                               = 0
> close(30)                               = 0
> close(29)                               = 0
> close(28)                               = 0
> close(27)                               = 0
> close(26)                               = 0
> close(25)                               = 0
> close(24)                               = 0
> close(23)                               = 0
> close(22)                               = 0
> close(21)                               = 0
> close(20)                               = 0
> close(19)                               = 0
> close(18)                               = 0
> close(17)                               = 0
> close(16)                               = 0
> close(15)                               = 0
> close(14)                               = 0
> close(13)                               = 0
> close(12)                               = 0
> close(11)                               = 0
> close(10)                               = 0
> close(9)                                = 0
> close(8)                                = 0
> close(7)                                = 0
> close(4)                                = 0
> write(1, "\ttest for unlimited opens: \33[32m"..., 39 test for
> unlimited opens: OK
> ) = 39
> write(1, "\n", 1
> )                       = 1
> ioctl(3, VIDIOC_G_INPUT, [0])           = 0
> ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
> type=V4L2_INPUT_TYPE_CAMERA}) = 0
> ioctl(3, VIDIOC_G_FMT, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
> fmt.pix={width=640, height=480, pixelformat=v4l2_fourcc('M', 'J', 'P',
> 'G') /* V4L2_PIX_FMT_MJPEG */, field=V4L2_FIELD_NONE, bytesperline=0,
> sizeimage=614400, colorspace=V4L2_COLORSPACE_DEFAULT}}) = 0
> ioctl(3, VIDIOC_G_SELECTION, 0x7fff3695ae3c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_G_SELECTION, 0x7fff3695ae3c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_G_PARM, {type=V4L2_BUF_TYPE_VIDEO_CAPTURE,
> parm.capture={capability=V4L2_CAP_TIMEPERFRAME, capturemode=0,
> timeperframe=1/30, extendedmode=0, readbuffers=0}}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|0 /*
> V4L2_CID_??? */ => V4L2_CTRL_CLASS_USER+0x1,
> type=V4L2_CTRL_TYPE_CTRL_CLASS, name="User Controls", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CTRL_CLASS_USER+0x1
> => V4L2_CID_BRIGHTNESS, type=V4L2_CTRL_TYPE_INTEGER,
> name="Brightness", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_BRIGHTNESS
> => V4L2_CID_CONTRAST, type=V4L2_CTRL_TYPE_INTEGER, name="Contrast",
> ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_CONTRAST
> => V4L2_CID_SATURATION, type=V4L2_CTRL_TYPE_INTEGER,
> name="Saturation", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_SATURATION
> => V4L2_CID_AUTO_WHITE_BALANCE, type=V4L2_CTRL_TYPE_BOOLEAN,
> name="White Balance, Automatic", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_AUTO_WHITE_BALANCE
> => V4L2_CID_GAMMA, type=V4L2_CTRL_TYPE_INTEGER, name="Gamma", ...}) =
> 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_GAMMA
> => V4L2_CID_GAIN, type=V4L2_CTRL_TYPE_INTEGER, name="Gain", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_GAIN
> => V4L2_CID_POWER_LINE_FREQUENCY, type=V4L2_CTRL_TYPE_MENU,
> name="Power Line Frequency", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_POWER_LINE_FREQUENCY
> => V4L2_CID_WHITE_BALANCE_TEMPERATURE, type=V4L2_CTRL_TYPE_INTEGER,
> name="White Balance Temperature", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_WHITE_BALANCE_TEMPERATURE
> => V4L2_CID_SHARPNESS, type=V4L2_CTRL_TYPE_INTEGER, name="Sharpness",
> ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_SHARPNESS
> => V4L2_CTRL_CLASS_CAMERA+0x1, type=V4L2_CTRL_TYPE_CTRL_CLASS,
> name="Camera Controls", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CTRL_CLASS_CAMERA+0x1
> => V4L2_CID_EXPOSURE_AUTO, type=V4L2_CTRL_TYPE_MENU, name="Auto
> Exposure", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_EXPOSURE_AUTO
> => V4L2_CID_EXPOSURE_ABSOLUTE, type=V4L2_CTRL_TYPE_INTEGER,
> name="Exposure Time, Absolute", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_EXPOSURE_ABSOLUTE
> => V4L2_CID_EXPOSURE_AUTO_PRIORITY, type=V4L2_CTRL_TYPE_BOOLEAN,
> name="Exposure, Dynamic Framerate", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_EXPOSURE_AUTO_PRIORITY})
> = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_G_EXT_CTRLS, {ctrl_class=0 /* V4L2_CTRL_CLASS_??? */,
> count=12, controls=[{id=V4L2_CID_BRIGHTNESS, size=0, value=128,
> value64=128}, {id=V4L2_CID_CONTRAST, size=0, value=128, value64=128},
> {id=V4L2_CID_SATURATION, size=0, value=128, value64=128},
> {id=V4L2_CID_AUTO_WHITE_BALANCE, size=0, value=1, value64=1},
> {id=V4L2_CID_GAMMA, size=0, value=128, value64=128},
> {id=V4L2_CID_GAIN, size=0, value=50, value64=50},
> {id=V4L2_CID_POWER_LINE_FREQUENCY, size=0, value=2, value64=2},
> {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE, size=0, value=4650,
> value64=4650}, {id=V4L2_CID_SHARPNESS, size=0, value=128,
> value64=128}, {id=V4L2_CID_EXPOSURE_AUTO, size=0, value=2, value64=2},
> {id=V4L2_CID_EXPOSURE_ABSOLUTE, size=0, value=5, value64=5},
> {id=V4L2_CID_EXPOSURE_AUTO_PRIORITY, size=0, value=0, value64=0}]}) =
> 0
> rt_sigaction(SIGINT, {sa_handler=0x560595a7f03e, sa_mask=[INT],
> sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f43c5fa5420},
> {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
> write(1, "Debug ioctls:\n", 14Debug ioctls:
> )         = 14
> getuid()                                = 0
> ioctl(3, VIDIOC_DBG_G_REGISTER, 0x7fff3695ac38) = -1 ENOTTY
> (Inappropriate ioctl for device)
> write(1, "\ttest VIDIOC_DBG_G/S_REGISTER: \33"..., 59 test
> VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> ) = 59
> ioctl(3, VIDIOC_LOG_STATUS, 0)          = -1 ENOTTY (Inappropriate
> ioctl for device)
> write(1, "\ttest VIDIOC_LOG_STATUS: \33[32mOK"..., 53 test
> VIDIOC_LOG_STATUS: OK (Not Supported)
> ) = 53
> write(1, "\n", 1
> )                       = 1
> write(1, "Input ioctls:\n", 14Input ioctls:
> )         = 14
> ioctl(3, VIDIOC_G_STD, 0x7fff3695ac70)  = -1 ENOTTY (Inappropriate
> ioctl for device)
> ioctl(3, VIDIOC_G_TUNER, {index=0})     = -1 ENOTTY (Inappropriate
> ioctl for device)
> write(1, "\ttest VIDIOC_G/S_TUNER/ENUM_FREQ"..., 68 test
> VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> ) = 68
> ioctl(3, VIDIOC_G_FREQUENCY, 0x7fff3695ac68) = -1 ENOTTY
> (Inappropriate ioctl for device)
> ioctl(3, VIDIOC_S_FREQUENCY, 0x7fff3695ac68) = -1 ENOTTY
> (Inappropriate ioctl for device)
> write(1, "\ttest VIDIOC_G/S_FREQUENCY: \33[32"..., 56 test
> VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> ) = 56
> ioctl(3, VIDIOC_S_HW_FREQ_SEEK, 0x7fff3695acb4) = -1 ENOTTY
> (Inappropriate ioctl for device)
> write(1, "\ttest VIDIOC_S_HW_FREQ_SEEK: \33[3"..., 57 test
> VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> ) = 57
> ioctl(3, VIDIOC_ENUMAUDIO, 0x7fff3695ad14) = -1 ENOTTY (Inappropriate
> ioctl for device)
> write(1, "\ttest VIDIOC_ENUMAUDIO: \33[32mOK\33"..., 52 test
> VIDIOC_ENUMAUDIO: OK (Not Supported)
> ) = 52
> ioctl(3, VIDIOC_G_INPUT, [0])           = 0
> ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
> type=V4L2_INPUT_TYPE_CAMERA}) = 0
> ioctl(3, VIDIOC_S_INPUT, [0])           = 0
> ioctl(3, VIDIOC_G_SELECTION, 0x7fff3695ac98) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_ENUMINPUT, {index=1})   = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_S_INPUT, [1])           = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_S_INPUT, [0])           = 0
> write(1, "\ttest VIDIOC_G/S/ENUMINPUT: \33[32"..., 40 test
> VIDIOC_G/S/ENUMINPUT: OK
> ) = 40
> ioctl(3, VIDIOC_S_INPUT, [0])           = 0
> ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
> type=V4L2_INPUT_TYPE_CAMERA}) = 0
> ioctl(3, VIDIOC_G_AUDIO, 0x7fff3695aca4) = -1 ENOTTY (Inappropriate
> ioctl for device)
> ioctl(3, VIDIOC_S_AUDIO, 0x7fff3695aca4) = -1 ENOTTY (Inappropriate
> ioctl for device)
> write(1, "\ttest VIDIOC_G/S_AUDIO: \33[32mOK\33"..., 52 test
> VIDIOC_G/S_AUDIO: OK (Not Supported)
> ) = 52
> write(1, "\tInputs: 1 Audio Inputs: 0 Tuner"..., 37 Inputs: 1 Audio
> Inputs: 0 Tuners: 0
> ) = 37
> write(1, "\n", 1
> )                       = 1
> write(1, "Output ioctls:\n", 15Output ioctls:
> )        = 15
> ioctl(3, VIDIOC_G_MODULATOR, 0x7fff3695ace4) = -1 ENOTTY
> (Inappropriate ioctl for device)
> write(1, "\ttest VIDIOC_G/S_MODULATOR: \33[32"..., 56 test
> VIDIOC_G/S_MODULATOR: OK (Not Supported)
> ) = 56
> ioctl(3, VIDIOC_G_FREQUENCY, 0x7fff3695acc8) = -1 ENOTTY
> (Inappropriate ioctl for device)
> ioctl(3, VIDIOC_S_FREQUENCY, 0x7fff3695acc8) = -1 ENOTTY
> (Inappropriate ioctl for device)
> write(1, "\ttest VIDIOC_G/S_FREQUENCY: \33[32"..., 56 test
> VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> ) = 56
> ioctl(3, VIDIOC_ENUMAUDOUT, 0x7fff3695ad14) = -1 ENOTTY (Inappropriate
> ioctl for device)
> write(1, "\ttest VIDIOC_ENUMAUDOUT: \33[32mOK"..., 53 test
> VIDIOC_ENUMAUDOUT: OK (Not Supported)
> ) = 53
> ioctl(3, VIDIOC_G_OUTPUT, 0x7fff3695ac98) = -1 ENOTTY (Inappropriate
> ioctl for device)
> ioctl(3, VIDIOC_ENUMOUTPUT, 0x7fff3695ace0) = -1 ENOTTY (Inappropriate
> ioctl for device)
> ioctl(3, VIDIOC_S_OUTPUT, 0x7fff3695ac9c) = -1 ENOTTY (Inappropriate
> ioctl for device)
> write(1, "\ttest VIDIOC_G/S/ENUMOUTPUT: \33[3"..., 57 test
> VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> ) = 57
> write(1, "\ttest VIDIOC_G/S_AUDOUT: \33[32mOK"..., 53 test
> VIDIOC_G/S_AUDOUT: OK (Not Supported)
> ) = 53
> write(1, "\tOutputs: 0 Audio Outputs: 0 Mod"..., 43 Outputs: 0 Audio
> Outputs: 0 Modulators: 0
> ) = 43
> write(1, "\n", 1
> )                       = 1
> write(1, "Input/Output configuration ioctl"..., 35Input/Output
> configuration ioctls:
> ) = 35
> ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
> type=V4L2_INPUT_TYPE_CAMERA}) = 0
> ioctl(3, VIDIOC_S_INPUT, [0])           = 0
> ioctl(3, VIDIOC_G_STD, 0x7fff3695abf8)  = -1 ENOTTY (Inappropriate
> ioctl for device)
> ioctl(3, VIDIOC_S_STD, [0])             = -1 ENOTTY (Inappropriate
> ioctl for device)
> ioctl(3, VIDIOC_S_STD, [0x3000000])     = -1 ENOTTY (Inappropriate
> ioctl for device)
> ioctl(3, VIDIOC_ENUMSTD, {index=0})     = -1 ENOTTY (Inappropriate
> ioctl for device)
> ioctl(3, VIDIOC_QUERYSTD, 0x7fff3695abf8) = -1 ENOTTY (Inappropriate
> ioctl for device)
> write(1, "\ttest VIDIOC_ENUM/G/S/QUERY_STD:"..., 61 test
> VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> ) = 61
> ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
> type=V4L2_INPUT_TYPE_CAMERA}) = 0
> ioctl(3, VIDIOC_S_INPUT, [0])           = 0
> ioctl(3, VIDIOC_G_DV_TIMINGS, 0x7fff3695a7ac) = -1 ENOTTY
> (Inappropriate ioctl for device)
> ioctl(3, VIDIOC_ENUM_DV_TIMINGS, 0x7fff3695a8b4) = -1 ENOTTY
> (Inappropriate ioctl for device)
> ioctl(3, VIDIOC_QUERY_DV_TIMINGS, 0x7fff3695a7ac) = -1 ENOTTY
> (Inappropriate ioctl for device)
> write(1, "\ttest VIDIOC_ENUM/G/S/QUERY_DV_T"..., 68 test
> VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> ) = 68
> ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
> type=V4L2_INPUT_TYPE_CAMERA}) = 0
> ioctl(3, VIDIOC_S_INPUT, [0])           = 0
> ioctl(3, VIDIOC_DV_TIMINGS_CAP, 0x7fff3695abc8) = -1 ENOTTY
> (Inappropriate ioctl for device)
> write(1, "\ttest VIDIOC_DV_TIMINGS_CAP: \33[3"..., 57 test
> VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> ) = 57
> ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
> type=V4L2_INPUT_TYPE_CAMERA}) = 0
> ioctl(3, VIDIOC_S_INPUT, [0])           = 0
> ioctl(3, VIDIOC_G_EDID, 0x7fff36952c20) = -1 ENOTTY (Inappropriate
> ioctl for device)
> ioctl(3, VIDIOC_S_EDID, 0x7fff36952c20) = -1 ENOTTY (Inappropriate
> ioctl for device)
> write(1, "\ttest VIDIOC_G/S_EDID: \33[32mOK\33["..., 51 test
> VIDIOC_G/S_EDID: OK (Not Supported)
> ) = 51
> write(1, "\n", 1
> )                       = 1
> ioctl(3, VIDIOC_S_INPUT, [0])           = 0
> ioctl(3, VIDIOC_ENUMINPUT, {index=0, name="Camera 1",
> type=V4L2_INPUT_TYPE_CAMERA}) = 0
> write(1, "Control ioctls (Input 0):\n", 26Control ioctls (Input 0):
> ) = 26
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|0 /*
> V4L2_CID_??? */ => V4L2_CTRL_CLASS_USER+0x1,
> type=V4L2_CTRL_TYPE_CTRL_CLASS, name="User Controls", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CTRL_CLASS_USER+0x1
> => V4L2_CID_BRIGHTNESS, type=V4L2_CTRL_TYPE_INTEGER,
> name="Brightness", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_BRIGHTNESS
> => V4L2_CID_CONTRAST, type=V4L2_CTRL_TYPE_INTEGER, name="Contrast",
> ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_CONTRAST
> => V4L2_CID_SATURATION, type=V4L2_CTRL_TYPE_INTEGER,
> name="Saturation", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_SATURATION
> => V4L2_CID_AUTO_WHITE_BALANCE, type=V4L2_CTRL_TYPE_BOOLEAN,
> name="White Balance, Automatic", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_AUTO_WHITE_BALANCE
> => V4L2_CID_GAMMA, type=V4L2_CTRL_TYPE_INTEGER, name="Gamma", ...}) =
> 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_GAMMA
> => V4L2_CID_GAIN, type=V4L2_CTRL_TYPE_INTEGER, name="Gain", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_GAIN
> => V4L2_CID_POWER_LINE_FREQUENCY, type=V4L2_CTRL_TYPE_MENU,
> name="Power Line Frequency", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_POWER_LINE_FREQUENCY
> => V4L2_CID_WHITE_BALANCE_TEMPERATURE, type=V4L2_CTRL_TYPE_INTEGER,
> name="White Balance Temperature", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_WHITE_BALANCE_TEMPERATURE
> => V4L2_CID_SHARPNESS, type=V4L2_CTRL_TYPE_INTEGER, name="Sharpness",
> ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_SHARPNESS
> => V4L2_CTRL_CLASS_CAMERA+0x1, type=V4L2_CTRL_TYPE_CTRL_CLASS,
> name="Camera Controls", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CTRL_CLASS_CAMERA+0x1
> => V4L2_CID_EXPOSURE_AUTO, type=V4L2_CTRL_TYPE_MENU, name="Auto
> Exposure", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_EXPOSURE_AUTO
> => V4L2_CID_EXPOSURE_ABSOLUTE, type=V4L2_CTRL_TYPE_INTEGER,
> name="Exposure Time, Absolute", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_EXPOSURE_ABSOLUTE
> => V4L2_CID_EXPOSURE_AUTO_PRIORITY, type=V4L2_CTRL_TYPE_BOOLEAN,
> name="Exposure, Dynamic Framerate", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_FLAG_NEXT_COMPOUND|V4L2_CID_EXPOSURE_AUTO_PRIORITY})
> = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CTRL_FLAG_NEXT_CTRL|0 /*
> V4L2_CID_??? */ => V4L2_CTRL_CLASS_USER+0x1,
> type=V4L2_CTRL_TYPE_CTRL_CLASS, name="User Controls", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_CLASS_USER+0x1 =>
> V4L2_CID_BRIGHTNESS, type=V4L2_CTRL_TYPE_INTEGER, name="Brightness",
> ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_BRIGHTNESS => V4L2_CID_CONTRAST,
> type=V4L2_CTRL_TYPE_INTEGER, name="Contrast", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_CONTRAST => V4L2_CID_SATURATION,
> type=V4L2_CTRL_TYPE_INTEGER, name="Saturation", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_SATURATION =>
> V4L2_CID_AUTO_WHITE_BALANCE, type=V4L2_CTRL_TYPE_BOOLEAN, name="White
> Balance, Automatic", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_AUTO_WHITE_BALANCE =>
> V4L2_CID_GAMMA, type=V4L2_CTRL_TYPE_INTEGER, name="Gamma", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_GAMMA => V4L2_CID_GAIN,
> type=V4L2_CTRL_TYPE_INTEGER, name="Gain", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_GAIN =>
> V4L2_CID_POWER_LINE_FREQUENCY, type=V4L2_CTRL_TYPE_MENU, name="Power
> Line Frequency", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_POWER_LINE_FREQUENCY =>
> V4L2_CID_WHITE_BALANCE_TEMPERATURE, type=V4L2_CTRL_TYPE_INTEGER,
> name="White Balance Temperature", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_WHITE_BALANCE_TEMPERATURE =>
> V4L2_CID_SHARPNESS, type=V4L2_CTRL_TYPE_INTEGER, name="Sharpness",
> ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_SHARPNESS =>
> V4L2_CTRL_CLASS_CAMERA+0x1, type=V4L2_CTRL_TYPE_CTRL_CLASS,
> name="Camera Controls", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_CLASS_CAMERA+0x1 =>
> V4L2_CID_EXPOSURE_AUTO, type=V4L2_CTRL_TYPE_MENU, name="Auto
> Exposure", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_EXPOSURE_AUTO =>
> V4L2_CID_EXPOSURE_ABSOLUTE, type=V4L2_CTRL_TYPE_INTEGER,
> name="Exposure Time, Absolute", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_EXPOSURE_ABSOLUTE =>
> V4L2_CID_EXPOSURE_AUTO_PRIORITY, type=V4L2_CTRL_TYPE_BOOLEAN,
> name="Exposure, Dynamic Framerate", ...}) = 0
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_EXPOSURE_AUTO_PRIORITY}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CTRL_FLAG_NEXT_COMPOUND|0 /*
> V4L2_CID_??? */}) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_BRIGHTNESS,
> type=V4L2_CTRL_TYPE_INTEGER, name="Brightness", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_CONTRAST,
> type=V4L2_CTRL_TYPE_INTEGER, name="Contrast", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_SATURATION,
> type=V4L2_CTRL_TYPE_INTEGER, name="Saturation", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_HUE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CTRL_CLASS_USER+0x904}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUDIO_VOLUME}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUDIO_BALANCE}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUDIO_BASS}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUDIO_TREBLE}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUDIO_MUTE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUDIO_LOUDNESS}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_BLACK_LEVEL}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE,
> type=V4L2_CTRL_TYPE_BOOLEAN, name="White Balance, Automatic", ...}) =
> 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_DO_WHITE_BALANCE}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_RED_BALANCE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_BLUE_BALANCE}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_GAMMA,
> type=V4L2_CTRL_TYPE_INTEGER, name="Gamma", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_EXPOSURE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUTOGAIN}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_GAIN,
> type=V4L2_CTRL_TYPE_INTEGER, name="Gain", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_HFLIP}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_VFLIP}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_HCENTER}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_VCENTER}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY,
> type=V4L2_CTRL_TYPE_MENU, name="Power Line Frequency", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_HUE_AUTO}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL,
> {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE, type=V4L2_CTRL_TYPE_INTEGER,
> name="White Balance Temperature", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_SHARPNESS,
> type=V4L2_CTRL_TYPE_INTEGER, name="Sharpness", ...}) = 0
> ioctl(3, VIDIOC_QUERYMENU, 0x7fff3695ab9c) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_BACKLIGHT_COMPENSATION})
> = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_CHROMA_AGC}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_COLOR_KILLER}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_COLORFX}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_AUTOBRIGHTNESS}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_BAND_STOP_FILTER}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_ROTATE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_BG_COLOR}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_CHROMA_GAIN}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_ILLUMINATORS_1}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_ILLUMINATORS_2}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_MIN_BUFFERS_FOR_CAPTURE})
> = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_MIN_BUFFERS_FOR_OUTPUT})
> = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_ALPHA_COMPONENT}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=V4L2_CID_COLORFX_CBCR}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERY_EXT_CTRL, {id=0x8000000 /* V4L2_CID_??? */}) =
> -1 EINVAL (Invalid argument)
> write(1, "\ttest VIDIOC_QUERY_EXT_CTRL/QUER"..., 51 test
> VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> ) = 51
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CTRL_FLAG_NEXT_CTRL|0 /*
> V4L2_CID_??? */ => V4L2_CTRL_CLASS_USER+0x1,
> type=V4L2_CTRL_TYPE_CTRL_CLASS, name="User Controls", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_CLASS_USER+0x1 =>
> V4L2_CID_BRIGHTNESS, type=V4L2_CTRL_TYPE_INTEGER, name="Brightness",
> ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_BRIGHTNESS => V4L2_CID_CONTRAST,
> type=V4L2_CTRL_TYPE_INTEGER, name="Contrast", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_CONTRAST => V4L2_CID_SATURATION,
> type=V4L2_CTRL_TYPE_INTEGER, name="Saturation", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_SATURATION =>
> V4L2_CID_AUTO_WHITE_BALANCE, type=V4L2_CTRL_TYPE_BOOLEAN, name="White
> Balance, Automatic", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_AUTO_WHITE_BALANCE =>
> V4L2_CID_GAMMA, type=V4L2_CTRL_TYPE_INTEGER, name="Gamma", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_GAMMA
> => V4L2_CID_GAIN, type=V4L2_CTRL_TYPE_INTEGER, name="Gain", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_GAIN
> => V4L2_CID_POWER_LINE_FREQUENCY, type=V4L2_CTRL_TYPE_MENU,
> name="Power Line Frequency", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_POWER_LINE_FREQUENCY =>
> V4L2_CID_WHITE_BALANCE_TEMPERATURE, type=V4L2_CTRL_TYPE_INTEGER,
> name="White Balance Temperature", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_WHITE_BALANCE_TEMPERATURE =>
> V4L2_CID_SHARPNESS, type=V4L2_CTRL_TYPE_INTEGER, name="Sharpness",
> ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_SHARPNESS =>
> V4L2_CTRL_CLASS_CAMERA+0x1, type=V4L2_CTRL_TYPE_CTRL_CLASS,
> name="Camera Controls", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CTRL_CLASS_CAMERA+0x1 =>
> V4L2_CID_EXPOSURE_AUTO, type=V4L2_CTRL_TYPE_MENU, name="Auto
> Exposure", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_EXPOSURE_AUTO =>
> V4L2_CID_EXPOSURE_ABSOLUTE, type=V4L2_CTRL_TYPE_INTEGER,
> name="Exposure Time, Absolute", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_EXPOSURE_ABSOLUTE =>
> V4L2_CID_EXPOSURE_AUTO_PRIORITY, type=V4L2_CTRL_TYPE_BOOLEAN,
> name="Exposure, Dynamic Framerate", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL,
> {id=V4L2_CTRL_FLAG_NEXT_CTRL|V4L2_CID_EXPOSURE_AUTO_PRIORITY}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CTRL_FLAG_NEXT_COMPOUND|0 /*
> V4L2_CID_??? */}) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_BRIGHTNESS,
> type=V4L2_CTRL_TYPE_INTEGER, name="Brightness", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_CONTRAST,
> type=V4L2_CTRL_TYPE_INTEGER, name="Contrast", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_SATURATION,
> type=V4L2_CTRL_TYPE_INTEGER, name="Saturation", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_HUE}) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CTRL_CLASS_USER+0x904}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUDIO_VOLUME}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUDIO_BALANCE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUDIO_BASS}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUDIO_TREBLE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUDIO_MUTE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUDIO_LOUDNESS}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_BLACK_LEVEL}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE,
> type=V4L2_CTRL_TYPE_BOOLEAN, name="White Balance, Automatic", ...}) =
> 0
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_DO_WHITE_BALANCE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_RED_BALANCE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_BLUE_BALANCE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_GAMMA,
> type=V4L2_CTRL_TYPE_INTEGER, name="Gamma", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_EXPOSURE}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUTOGAIN}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_GAIN,
> type=V4L2_CTRL_TYPE_INTEGER, name="Gain", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_HFLIP}) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_VFLIP}) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_HCENTER}) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_VCENTER}) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY,
> type=V4L2_CTRL_TYPE_MENU, name="Power Line Frequency", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_HUE_AUTO}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE,
> type=V4L2_CTRL_TYPE_INTEGER, name="White Balance Temperature", ...}) =
> 0
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_SHARPNESS,
> type=V4L2_CTRL_TYPE_INTEGER, name="Sharpness", ...}) = 0
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_BACKLIGHT_COMPENSATION}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_CHROMA_AGC}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_COLOR_KILLER}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_COLORFX}) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_AUTOBRIGHTNESS}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_BAND_STOP_FILTER}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_ROTATE}) = -1 EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_BG_COLOR}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_CHROMA_GAIN}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_ILLUMINATORS_1}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_ILLUMINATORS_2}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_MIN_BUFFERS_FOR_CAPTURE}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_MIN_BUFFERS_FOR_OUTPUT}) = -1
> EINVAL (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_ALPHA_COMPONENT}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=V4L2_CID_COLORFX_CBCR}) = -1 EINVAL
> (Invalid argument)
> ioctl(3, VIDIOC_QUERYCTRL, {id=0x8000000 /* V4L2_CID_??? */}) = -1
> EINVAL (Invalid argument)
> write(1, "\ttest VIDIOC_QUERYCTRL: \33[32mOK\33"..., 36 test
> VIDIOC_QUERYCTRL: OK
> ) = 36
> ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CTRL_CLASS_USER+0x1}) = -1 EACCES
> (Permission denied)
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CTRL_CLASS_USER+0x1, value=0}) = -1
> EACCES (Permission denied)
> ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_BRIGHTNESS, value=128}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_BRIGHTNESS, value=128 => 128}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_BRIGHTNESS, value=0 => 1}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_BRIGHTNESS, value=256 => 255}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_BRIGHTNESS, value=1 => 1}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_BRIGHTNESS, value=255 => 255}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_BRIGHTNESS, value=128 => 128}) = 0
> ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_CONTRAST, value=128}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_CONTRAST, value=128 => 128}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_CONTRAST, value=0 => 1}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_CONTRAST, value=256 => 255}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_CONTRAST, value=1 => 1}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_CONTRAST, value=255 => 255}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_CONTRAST, value=128 => 128}) = 0
> ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_SATURATION, value=128}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_SATURATION, value=128 => 128}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_SATURATION, value=0 => 1}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_SATURATION, value=256 => 255}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_SATURATION, value=1 => 1}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_SATURATION, value=255 => 255}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_SATURATION, value=128 => 128}) = 0
> ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=1}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=1 => 1}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=-1 => 0}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=2 => 1}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=0 => 0}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=1 => 1}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_AUTO_WHITE_BALANCE, value=1 => 1}) = 0
> ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_GAMMA, value=128}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAMMA, value=128 => 128}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAMMA, value=0 => 1}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAMMA, value=256 => 255}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAMMA, value=1 => 1}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAMMA, value=255 => 255}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAMMA, value=128 => 128}) = 0
> ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_GAIN, value=50}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAIN, value=50 => 50}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAIN, value=0 => 1}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAIN, value=101 => 100}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAIN, value=1 => 1}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAIN, value=100 => 100}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_GAIN, value=50 => 50}) = 0
> ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY, value=2}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY, value=2 => 2}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY, value=-1})
> = -1 ERANGE (Numerical result out of range)
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY, value=3}) =
> -1 ERANGE (Numerical result out of range)
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY, value=0 => 0}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY, value=1 => 1}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_POWER_LINE_FREQUENCY, value=2 => 2}) = 0
> ioctl(3, VIDIOC_G_CTRL, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE, value=4650}) = 0
> ioctl(3, VIDIOC_S_CTRL, {id=V4L2_CID_WHITE_BALANCE_TEMPERATURE,
> value=4650}) = -1 EACCES (Permission denied)
> write(1, "\t\t\33[1;31mfail\33[0m: v4l2-test-con"..., 78 fail:
> v4l2-test-controls.cpp(489): s_ctrl returned an error (13)
> ) = 78
> exit_group(1)                           = ?
> +++ exited with 1 +++
> # dmesg
> [  146.319731] usb 1-2: uvc_v4l2_open
> [  146.415713] usb 1-2: Resuming interface 0
> [  146.415732] usb 1-2: Resuming interface 1
> [  146.418561] usb 1-2: uvc_v4l2_release
> [  146.446524] usb 1-2: uvc_v4l2_open
> [  146.454322] usb 1-2: uvc_v4l2_open
> [  146.455607] usb 1-2: uvc_v4l2_open
> [  146.455672] usb 1-2: uvc_v4l2_open
> [  146.455731] usb 1-2: uvc_v4l2_open
> [  146.455795] usb 1-2: uvc_v4l2_open
> [  146.455854] usb 1-2: uvc_v4l2_open
> [  146.455916] usb 1-2: uvc_v4l2_open
> [  146.455977] usb 1-2: uvc_v4l2_open
> [  146.456038] usb 1-2: uvc_v4l2_open
> [  146.456098] usb 1-2: uvc_v4l2_open
> [  146.456159] usb 1-2: uvc_v4l2_open
> [  146.456230] usb 1-2: uvc_v4l2_open
> [  146.456292] usb 1-2: uvc_v4l2_open
> [  146.456352] usb 1-2: uvc_v4l2_open
> [  146.456413] usb 1-2: uvc_v4l2_open
> [  146.456474] usb 1-2: uvc_v4l2_open
> [  146.456534] usb 1-2: uvc_v4l2_open
> [  146.456595] usb 1-2: uvc_v4l2_open
> [  146.456655] usb 1-2: uvc_v4l2_open
> [  146.456715] usb 1-2: uvc_v4l2_open
> [  146.456780] usb 1-2: uvc_v4l2_open
> [  146.456839] usb 1-2: uvc_v4l2_open
> [  146.456899] usb 1-2: uvc_v4l2_open
> [  146.456961] usb 1-2: uvc_v4l2_open
> [  146.457021] usb 1-2: uvc_v4l2_open
> [  146.457082] usb 1-2: uvc_v4l2_open
> [  146.457142] usb 1-2: uvc_v4l2_open
> [  146.457203] usb 1-2: uvc_v4l2_open
> [  146.457273] usb 1-2: uvc_v4l2_open
> [  146.457335] usb 1-2: uvc_v4l2_open
> [  146.457393] usb 1-2: uvc_v4l2_open
> [  146.457451] usb 1-2: uvc_v4l2_open
> [  146.457514] usb 1-2: uvc_v4l2_open
> [  146.457575] usb 1-2: uvc_v4l2_open
> [  146.457636] usb 1-2: uvc_v4l2_open
> [  146.457696] usb 1-2: uvc_v4l2_open
> [  146.457757] usb 1-2: uvc_v4l2_open
> [  146.457816] usb 1-2: uvc_v4l2_open
> [  146.457878] usb 1-2: uvc_v4l2_open
> [  146.457935] usb 1-2: uvc_v4l2_open
> [  146.457995] usb 1-2: uvc_v4l2_open
> [  146.458056] usb 1-2: uvc_v4l2_open
> [  146.458119] usb 1-2: uvc_v4l2_open
> [  146.458180] usb 1-2: uvc_v4l2_open
> [  146.458348] usb 1-2: uvc_v4l2_open
> [  146.458456] usb 1-2: uvc_v4l2_open
> [  146.458560] usb 1-2: uvc_v4l2_open
> [  146.458658] usb 1-2: uvc_v4l2_open
> [  146.458755] usb 1-2: uvc_v4l2_open
> [  146.458873] usb 1-2: uvc_v4l2_open
> [  146.458942] usb 1-2: uvc_v4l2_open
> [  146.459057] usb 1-2: uvc_v4l2_open
> [  146.459154] usb 1-2: uvc_v4l2_open
> [  146.459266] usb 1-2: uvc_v4l2_open
> [  146.459374] usb 1-2: uvc_v4l2_open
> [  146.459424] usb 1-2: uvc_v4l2_open
> [  146.459492] usb 1-2: uvc_v4l2_open
> [  146.459544] usb 1-2: uvc_v4l2_open
> [  146.459595] usb 1-2: uvc_v4l2_open
> [  146.459663] usb 1-2: uvc_v4l2_open
> [  146.459731] usb 1-2: uvc_v4l2_open
> [  146.459797] usb 1-2: uvc_v4l2_open
> [  146.459848] usb 1-2: uvc_v4l2_open
> [  146.459900] usb 1-2: uvc_v4l2_open
> [  146.459950] usb 1-2: uvc_v4l2_open
> [  146.460001] usb 1-2: uvc_v4l2_open
> [  146.460082] usb 1-2: uvc_v4l2_open
> [  146.460130] usb 1-2: uvc_v4l2_open
> [  146.460182] usb 1-2: uvc_v4l2_open
> [  146.460258] usb 1-2: uvc_v4l2_open
> [  146.460326] usb 1-2: uvc_v4l2_open
> [  146.460393] usb 1-2: uvc_v4l2_open
> [  146.460444] usb 1-2: uvc_v4l2_open
> [  146.460496] usb 1-2: uvc_v4l2_open
> [  146.460549] usb 1-2: uvc_v4l2_open
> [  146.460601] usb 1-2: uvc_v4l2_open
> [  146.460653] usb 1-2: uvc_v4l2_open
> [  146.460705] usb 1-2: uvc_v4l2_open
> [  146.460757] usb 1-2: uvc_v4l2_open
> [  146.460822] usb 1-2: uvc_v4l2_open
> [  146.460891] usb 1-2: uvc_v4l2_open
> [  146.460943] usb 1-2: uvc_v4l2_open
> [  146.460994] usb 1-2: uvc_v4l2_open
> [  146.461062] usb 1-2: uvc_v4l2_open
> [  146.461113] usb 1-2: uvc_v4l2_open
> [  146.461166] usb 1-2: uvc_v4l2_open
> [  146.461226] usb 1-2: uvc_v4l2_open
> [  146.461295] usb 1-2: uvc_v4l2_open
> [  146.461346] usb 1-2: uvc_v4l2_open
> [  146.461397] usb 1-2: uvc_v4l2_open
> [  146.461448] usb 1-2: uvc_v4l2_open
> [  146.461500] usb 1-2: uvc_v4l2_open
> [  146.461551] usb 1-2: uvc_v4l2_open
> [  146.461619] usb 1-2: uvc_v4l2_open
> [  146.461686] usb 1-2: uvc_v4l2_open
> [  146.461754] usb 1-2: uvc_v4l2_open
> [  146.461805] usb 1-2: uvc_v4l2_open
> [  146.461857] usb 1-2: uvc_v4l2_open
> [  146.461906] usb 1-2: uvc_v4l2_open
> [  146.461958] usb 1-2: uvc_v4l2_open
> [  146.462009] usb 1-2: uvc_v4l2_open
> [  146.462057] usb 1-2: uvc_v4l2_release
> [  146.462107] usb 1-2: uvc_v4l2_release
> [  146.462157] usb 1-2: uvc_v4l2_release
> [  146.462207] usb 1-2: uvc_v4l2_release
> [  146.462284] usb 1-2: uvc_v4l2_release
> [  146.462332] usb 1-2: uvc_v4l2_release
> [  146.462394] usb 1-2: uvc_v4l2_release
> [  146.462445] usb 1-2: uvc_v4l2_release
> [  146.462505] usb 1-2: uvc_v4l2_release
> [  146.462561] usb 1-2: uvc_v4l2_release
> [  146.462606] usb 1-2: uvc_v4l2_release
> [  146.462661] usb 1-2: uvc_v4l2_release
> [  146.462716] usb 1-2: uvc_v4l2_release
> [  146.462773] usb 1-2: uvc_v4l2_release
> [  146.462816] usb 1-2: uvc_v4l2_release
> [  146.462860] usb 1-2: uvc_v4l2_release
> [  146.462900] usb 1-2: uvc_v4l2_release
> [  146.462932] usb 1-2: uvc_v4l2_release
> [  146.462965] usb 1-2: uvc_v4l2_release
> [  146.462999] usb 1-2: uvc_v4l2_release
> [  146.463029] usb 1-2: uvc_v4l2_release
> [  146.463066] usb 1-2: uvc_v4l2_release
> [  146.463102] usb 1-2: uvc_v4l2_release
> [  146.463134] usb 1-2: uvc_v4l2_release
> [  146.463168] usb 1-2: uvc_v4l2_release
> [  146.463199] usb 1-2: uvc_v4l2_release
> [  146.463241] usb 1-2: uvc_v4l2_release
> [  146.463278] usb 1-2: uvc_v4l2_release
> [  146.463309] usb 1-2: uvc_v4l2_release
> [  146.463343] usb 1-2: uvc_v4l2_release
> [  146.463374] usb 1-2: uvc_v4l2_release
> [  146.463406] usb 1-2: uvc_v4l2_release
> [  146.463437] usb 1-2: uvc_v4l2_release
> [  146.463473] usb 1-2: uvc_v4l2_release
> [  146.463508] usb 1-2: uvc_v4l2_release
> [  146.463539] usb 1-2: uvc_v4l2_release
> [  146.463573] usb 1-2: uvc_v4l2_release
> [  146.463605] usb 1-2: uvc_v4l2_release
> [  146.463670] usb 1-2: uvc_v4l2_release
> [  146.463715] usb 1-2: uvc_v4l2_release
> [  146.463785] usb 1-2: uvc_v4l2_release
> [  146.463845] usb 1-2: uvc_v4l2_release
> [  146.463900] usb 1-2: uvc_v4l2_release
> [  146.463945] usb 1-2: uvc_v4l2_release
> [  146.463993] usb 1-2: uvc_v4l2_release
> [  146.464048] usb 1-2: uvc_v4l2_release
> [  146.464105] usb 1-2: uvc_v4l2_release
> [  146.464150] usb 1-2: uvc_v4l2_release
> [  146.464205] usb 1-2: uvc_v4l2_release
> [  146.464258] usb 1-2: uvc_v4l2_release
> [  146.464301] usb 1-2: uvc_v4l2_release
> [  146.464342] usb 1-2: uvc_v4l2_release
> [  146.464377] usb 1-2: uvc_v4l2_release
> [  146.464409] usb 1-2: uvc_v4l2_release
> [  146.464477] usb 1-2: uvc_v4l2_release
> [  146.464512] usb 1-2: uvc_v4l2_release
> [  146.464559] usb 1-2: uvc_v4l2_release
> [  146.464586] usb 1-2: uvc_v4l2_release
> [  146.464638] usb 1-2: uvc_v4l2_release
> [  146.464682] usb 1-2: uvc_v4l2_release
> [  146.464716] usb 1-2: uvc_v4l2_release
> [  146.464758] usb 1-2: uvc_v4l2_release
> [  146.464800] usb 1-2: uvc_v4l2_release
> [  146.464836] usb 1-2: uvc_v4l2_release
> [  146.464868] usb 1-2: uvc_v4l2_release
> [  146.464898] usb 1-2: uvc_v4l2_release
> [  146.464922] usb 1-2: uvc_v4l2_release
> [  146.464973] usb 1-2: uvc_v4l2_release
> [  146.465007] usb 1-2: uvc_v4l2_release
> [  146.465054] usb 1-2: uvc_v4l2_release
> [  146.465081] usb 1-2: uvc_v4l2_release
> [  146.465133] usb 1-2: uvc_v4l2_release
> [  146.465176] usb 1-2: uvc_v4l2_release
> [  146.465214] usb 1-2: uvc_v4l2_release
> [  146.465258] usb 1-2: uvc_v4l2_release
> [  146.465304] usb 1-2: uvc_v4l2_release
> [  146.465340] usb 1-2: uvc_v4l2_release
> [  146.465370] usb 1-2: uvc_v4l2_release
> [  146.465394] usb 1-2: uvc_v4l2_release
> [  146.465417] usb 1-2: uvc_v4l2_release
> [  146.465444] usb 1-2: uvc_v4l2_release
> [  146.465469] usb 1-2: uvc_v4l2_release
> [  146.465519] usb 1-2: uvc_v4l2_release
> [  146.465553] usb 1-2: uvc_v4l2_release
> [  146.465600] usb 1-2: uvc_v4l2_release
> [  146.465643] usb 1-2: uvc_v4l2_release
> [  146.465696] usb 1-2: uvc_v4l2_release
> [  146.465732] usb 1-2: uvc_v4l2_release
> [  146.465762] usb 1-2: uvc_v4l2_release
> [  146.465786] usb 1-2: uvc_v4l2_release
> [  146.465810] usb 1-2: uvc_v4l2_release
> [  146.465835] usb 1-2: uvc_v4l2_release
> [  146.465859] usb 1-2: uvc_v4l2_release
> [  146.465884] usb 1-2: uvc_v4l2_release
> [  146.465908] usb 1-2: uvc_v4l2_release
> [  146.465933] usb 1-2: uvc_v4l2_release
> [  146.465957] usb 1-2: uvc_v4l2_release
> [  146.465984] usb 1-2: uvc_v4l2_release
> [  146.466009] usb 1-2: uvc_v4l2_release
> [  146.466060] usb 1-2: uvc_v4l2_release
> [  146.470680] usb 1-2: Control 0x00980001 not found
> [  146.471649] usb 1-2: Control 0x009a0001 not found
> [  146.472731] usb 1-2: Control 0x00000000 not found
> [  146.473019] usb 1-2: Control 0x00980903 not found
> [  146.473076] usb 1-2: Control 0x00980904 not found
> [  146.473124] usb 1-2: Control 0x00980905 not found
> [  146.473170] usb 1-2: Control 0x00980906 not found
> [  146.473245] usb 1-2: Control 0x00980907 not found
> [  146.473289] usb 1-2: Control 0x00980908 not found
> [  146.473339] usb 1-2: Control 0x00980909 not found
> [  146.473384] usb 1-2: Control 0x0098090a not found
> [  146.473435] usb 1-2: Control 0x0098090b not found
> [  146.473594] usb 1-2: Control 0x0098090d not found
> [  146.473642] usb 1-2: Control 0x0098090e not found
> [  146.473686] usb 1-2: Control 0x0098090f not found
> [  146.473820] usb 1-2: Control 0x00980911 not found
> [  146.473866] usb 1-2: Control 0x00980912 not found
> [  146.474019] usb 1-2: Control 0x00980914 not found
> [  146.474067] usb 1-2: Control 0x00980915 not found
> [  146.474110] usb 1-2: Control 0x00980916 not found
> [  146.474152] usb 1-2: Control 0x00980917 not found
> [  146.474427] usb 1-2: Control 0x00980919 not found
> [  146.474627] usb 1-2: Control 0x0098091c not found
> [  146.474674] usb 1-2: Control 0x0098091d not found
> [  146.474712] usb 1-2: Control 0x0098091e not found
> [  146.474748] usb 1-2: Control 0x0098091f not found
> [  146.474782] usb 1-2: Control 0x00980920 not found
> [  146.474818] usb 1-2: Control 0x00980921 not found
> [  146.474852] usb 1-2: Control 0x00980922 not found
> [  146.474892] usb 1-2: Control 0x00980923 not found
> [  146.474928] usb 1-2: Control 0x00980924 not found
> [  146.474966] usb 1-2: Control 0x00980925 not found
> [  146.475002] usb 1-2: Control 0x00980926 not found
> [  146.475039] usb 1-2: Control 0x00980927 not found
> [  146.475075] usb 1-2: Control 0x00980928 not found
> [  146.475112] usb 1-2: Control 0x00980929 not found
> [  146.475151] usb 1-2: Control 0x0098092a not found
> [  146.475188] usb 1-2: Control 0x08000000 not found
> [  146.475743] usb 1-2: Control 0x00000000 not found
> [  146.475858] usb 1-2: Control 0x00980903 not found
> [  146.475888] usb 1-2: Control 0x00980904 not found
> [  146.475915] usb 1-2: Control 0x00980905 not found
> [  146.475944] usb 1-2: Control 0x00980906 not found
> [  146.475971] usb 1-2: Control 0x00980907 not found
> [  146.475998] usb 1-2: Control 0x00980908 not found
> [  146.476026] usb 1-2: Control 0x00980909 not found
> [  146.476053] usb 1-2: Control 0x0098090a not found
> [  146.476080] usb 1-2: Control 0x0098090b not found
> [  146.476135] usb 1-2: Control 0x0098090d not found
> [  146.476161] usb 1-2: Control 0x0098090e not found
> [  146.476188] usb 1-2: Control 0x0098090f not found
> [  146.476249] usb 1-2: Control 0x00980911 not found
> [  146.476276] usb 1-2: Control 0x00980912 not found
> [  146.476330] usb 1-2: Control 0x00980914 not found
> [  146.476362] usb 1-2: Control 0x00980915 not found
> [  146.476389] usb 1-2: Control 0x00980916 not found
> [  146.476416] usb 1-2: Control 0x00980917 not found
> [  146.476471] usb 1-2: Control 0x00980919 not found
> [  146.476551] usb 1-2: Control 0x0098091c not found
> [  146.476578] usb 1-2: Control 0x0098091d not found
> [  146.476606] usb 1-2: Control 0x0098091e not found
> [  146.476633] usb 1-2: Control 0x0098091f not found
> [  146.476660] usb 1-2: Control 0x00980920 not found
> [  146.476688] usb 1-2: Control 0x00980921 not found
> [  146.476715] usb 1-2: Control 0x00980922 not found
> [  146.476745] usb 1-2: Control 0x00980923 not found
> [  146.476787] usb 1-2: Control 0x00980924 not found
> [  146.476823] usb 1-2: Control 0x00980925 not found
> [  146.476859] usb 1-2: Control 0x00980926 not found
> [  146.476889] usb 1-2: Control 0x00980927 not found
> [  146.476913] usb 1-2: Control 0x00980928 not found
> [  146.476936] usb 1-2: Control 0x00980929 not found
> [  146.476974] usb 1-2: Control 0x0098092a not found
> [  146.477014] usb 1-2: Control 0x08000000 not found
> [  146.482753] usb 1-2: uvc_v4l2_release
> [  146.482759] usb 1-2: uvc_v4l2_release
>
>
>
> >
> >
> > Best regards
> >
> > On Thu, 11 Nov 2021 at 21:41, James Hilliard <james.hilliard1@gmail.com> wrote:
> > >
> > > I'm seeing some v4l2-compliance errors with this series from what it
> > > appears and potentially a regression:
> > >
> > > Before:
> > > v4l2-compliance 1.22.1, 64 bits, 64-bit time_t
> > >
> > > Compliance test for uvcvideo device /dev/video0:
> > >
> > > Driver Info:
> > > Driver name      : uvcvideo
> > > Card type        : HD Webcam C525
> > > Bus info         : usb-0000:00:1a.0-1.4
> > > Driver version   : 5.15.0
> > > Capabilities     : 0x84a00001
> > > Video Capture
> > > Metadata Capture
> > > Streaming
> > > Extended Pix Format
> > > Device Capabilities
> > > Device Caps      : 0x04200001
> > > Video Capture
> > > Streaming
> > > Extended Pix Format
> > > Media Driver Info:
> > > Driver name      : uvcvideo
> > > Model            : HD Webcam C525
> > > Serial           : 28D79660
> > > Bus info         : usb-0000:00:1a.0-1.4
> > > Media version    : 5.15.0
> > > Hardware revision: 0x00000010 (16)
> > > Driver version   : 5.15.0
> > > Interface Info:
> > > ID               : 0x03000002
> > > Type             : V4L Video
> > > Entity Info:
> > > ID               : 0x00000001 (1)
> > > Name             : Video Capture 3
> > > Function         : V4L2 I/O
> > > Flags            : default
> > > Pad 0x01000007   : 0: Sink
> > >  Link 0x02000019: from remote pad 0x100000a of entity 'Extension 5'
> > > (Video Pixel Formatter): Data, Enabled, Immutable
> > >
> > > Required ioctls:
> > > test MC information (see 'Media Driver Info' above): OK
> > > test VIDIOC_QUERYCAP: OK
> > > test invalid ioctls: OK
> > >
> > > Allow for multiple opens:
> > > test second /dev/video0 open: OK
> > > test VIDIOC_QUERYCAP: OK
> > > test VIDIOC_G/S_PRIORITY: OK
> > > test for unlimited opens: OK
> > >
> > > Debug ioctls:
> > > test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > > test VIDIOC_LOG_STATUS: OK (Not Supported)
> > >
> > > Input ioctls:
> > > test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > > test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > > test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > > test VIDIOC_G/S/ENUMINPUT: OK
> > > test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > > Inputs: 1 Audio Inputs: 0 Tuners: 0
> > >
> > > Output ioctls:
> > > test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > > test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > > test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > > test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > > Outputs: 0 Audio Outputs: 0 Modulators: 0
> > >
> > > Input/Output configuration ioctls:
> > > test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > > test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > > test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > > test VIDIOC_G/S_EDID: OK (Not Supported)
> > >
> > > Control ioctls (Input 0):
> > > info: checking v4l2_query_ext_ctrl of control 'User Controls' (0x00980001)
> > > info: checking v4l2_query_ext_ctrl of control 'Brightness' (0x00980900)
> > > info: checking v4l2_query_ext_ctrl of control 'Contrast' (0x00980901)
> > > info: checking v4l2_query_ext_ctrl of control 'Saturation' (0x00980902)
> > > info: checking v4l2_query_ext_ctrl of control 'White Balance,
> > > Automatic' (0x0098090c)
> > > info: checking v4l2_query_ext_ctrl of control 'Gain' (0x00980913)
> > > info: checking v4l2_query_ext_ctrl of control 'Power Line Frequency'
> > > (0x00980918)
> > > info: checking v4l2_query_ext_ctrl of control 'White Balance
> > > Temperature' (0x0098091a)
> > > info: checking v4l2_query_ext_ctrl of control 'Sharpness' (0x0098091b)
> > > info: checking v4l2_query_ext_ctrl of control 'Backlight Compensation'
> > > (0x0098091c)
> > > info: checking v4l2_query_ext_ctrl of control 'Camera Controls' (0x009a0001)
> > > info: checking v4l2_query_ext_ctrl of control 'Auto Exposure' (0x009a0901)
> > > info: checking v4l2_query_ext_ctrl of control 'Exposure Time,
> > > Absolute' (0x009a0902)
> > > info: checking v4l2_query_ext_ctrl of control 'Exposure, Dynamic
> > > Framerate' (0x009a0903)
> > > info: checking v4l2_query_ext_ctrl of control 'Pan, Absolute' (0x009a0908)
> > > info: checking v4l2_query_ext_ctrl of control 'Tilt, Absolute' (0x009a0909)
> > > info: checking v4l2_query_ext_ctrl of control 'Focus, Absolute' (0x009a090a)
> > > info: checking v4l2_query_ext_ctrl of control 'Focus, Automatic
> > > Continuous' (0x009a090c)
> > > info: checking v4l2_query_ext_ctrl of control 'Zoom, Absolute' (0x009a090d)
> > > info: checking v4l2_query_ext_ctrl of control 'Brightness' (0x00980900)
> > > info: checking v4l2_query_ext_ctrl of control 'Contrast' (0x00980901)
> > > info: checking v4l2_query_ext_ctrl of control 'Saturation' (0x00980902)
> > > info: checking v4l2_query_ext_ctrl of control 'White Balance,
> > > Automatic' (0x0098090c)
> > > info: checking v4l2_query_ext_ctrl of control 'Gain' (0x00980913)
> > > info: checking v4l2_query_ext_ctrl of control 'Power Line Frequency'
> > > (0x00980918)
> > > info: checking v4l2_query_ext_ctrl of control 'White Balance
> > > Temperature' (0x0098091a)
> > > info: checking v4l2_query_ext_ctrl of control 'Sharpness' (0x0098091b)
> > > info: checking v4l2_query_ext_ctrl of control 'Backlight Compensation'
> > > (0x0098091c)
> > > test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> > > test VIDIOC_QUERYCTRL: OK
> > > info: checking control 'User Controls' (0x00980001)
> > > info: checking control 'Brightness' (0x00980900)
> > > info: checking control 'Contrast' (0x00980901)
> > > info: checking control 'Saturation' (0x00980902)
> > > info: checking control 'White Balance, Automatic' (0x0098090c)
> > > info: checking control 'Gain' (0x00980913)
> > > info: checking control 'Power Line Frequency' (0x00980918)
> > > info: checking control 'White Balance Temperature' (0x0098091a)
> > > warn: v4l2-test-controls.cpp(483): s_ctrl returned EIO
> > > info: checking control 'Sharpness' (0x0098091b)
> > > info: checking control 'Backlight Compensation' (0x0098091c)
> > > info: checking control 'Camera Controls' (0x009a0001)
> > > info: checking control 'Auto Exposure' (0x009a0901)
> > > info: checking control 'Exposure Time, Absolute' (0x009a0902)
> > > warn: v4l2-test-controls.cpp(483): s_ctrl returned EIO
> > > info: checking control 'Exposure, Dynamic Framerate' (0x009a0903)
> > > info: checking control 'Pan, Absolute' (0x009a0908)
> > > info: checking control 'Tilt, Absolute' (0x009a0909)
> > > info: checking control 'Focus, Absolute' (0x009a090a)
> > > warn: v4l2-test-controls.cpp(486): s_ctrl returned EILSEQ
> > > info: checking control 'Focus, Automatic Continuous' (0x009a090c)
> > > info: checking control 'Zoom, Absolute' (0x009a090d)
> > > test VIDIOC_G/S_CTRL: OK
> > > info: checking extended control 'User Controls' (0x00980001)
> > > info: checking extended control 'Brightness' (0x00980900)
> > > info: checking extended control 'Contrast' (0x00980901)
> > > info: checking extended control 'Saturation' (0x00980902)
> > > info: checking extended control 'White Balance, Automatic' (0x0098090c)
> > > info: checking extended control 'Gain' (0x00980913)
> > > info: checking extended control 'Power Line Frequency' (0x00980918)
> > > info: checking extended control 'White Balance Temperature' (0x0098091a)
> > > warn: v4l2-test-controls.cpp(729): s_ext_ctrls returned EIO
> > > info: checking extended control 'Sharpness' (0x0098091b)
> > > info: checking extended control 'Backlight Compensation' (0x0098091c)
> > > info: checking extended control 'Camera Controls' (0x009a0001)
> > > info: checking extended control 'Auto Exposure' (0x009a0901)
> > > info: checking extended control 'Exposure Time, Absolute' (0x009a0902)
> > > warn: v4l2-test-controls.cpp(729): s_ext_ctrls returned EIO
> > > info: checking extended control 'Exposure, Dynamic Framerate' (0x009a0903)
> > > info: checking extended control 'Pan, Absolute' (0x009a0908)
> > > info: checking extended control 'Tilt, Absolute' (0x009a0909)
> > > info: checking extended control 'Focus, Absolute' (0x009a090a)
> > > warn: v4l2-test-controls.cpp(732): s_ext_ctrls returned EILSEQ
> > > info: checking extended control 'Focus, Automatic Continuous' (0x009a090c)
> > > info: checking extended control 'Zoom, Absolute' (0x009a090d)
> > > warn: v4l2-test-controls.cpp(805): s_ext_ctrls returned EIO
> > > test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> > > info: checking control event 'User Controls' (0x00980001)
> > > info: checking control event 'Brightness' (0x00980900)
> > > info: checking control event 'Contrast' (0x00980901)
> > > info: checking control event 'Saturation' (0x00980902)
> > > info: checking control event 'White Balance, Automatic' (0x0098090c)
> > > info: checking control event 'Gain' (0x00980913)
> > > info: checking control event 'Power Line Frequency' (0x00980918)
> > > info: checking control event 'White Balance Temperature' (0x0098091a)
> > > info: checking control event 'Sharpness' (0x0098091b)
> > > info: checking control event 'Backlight Compensation' (0x0098091c)
> > > info: checking control event 'Camera Controls' (0x009a0001)
> > > info: checking control event 'Auto Exposure' (0x009a0901)
> > > info: checking control event 'Exposure Time, Absolute' (0x009a0902)
> > > info: checking control event 'Exposure, Dynamic Framerate' (0x009a0903)
> > > info: checking control event 'Pan, Absolute' (0x009a0908)
> > > info: checking control event 'Tilt, Absolute' (0x009a0909)
> > > info: checking control event 'Focus, Absolute' (0x009a090a)
> > > info: checking control event 'Focus, Automatic Continuous' (0x009a090c)
> > > info: checking control event 'Zoom, Absolute' (0x009a090d)
> > > test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> > > test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > > Standard Controls: 19 Private Controls: 0
> > >
> > > Format ioctls (Input 0):
> > > info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 640x480
> > > info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 160x120
> > > info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 176x144
> > > info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 320x176
> > > info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 320x240
> > > info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 432x240
> > > info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 352x288
> > > info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 544x288
> > > info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 640x360
> > > info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 752x416
> > > info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 800x448
> > > info: found 6 frameintervals for pixel format 56595559 (YUYV) and size 864x480
> > > info: found 5 frameintervals for pixel format 56595559 (YUYV) and size 960x544
> > > info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 1024x576
> > > info: found 6 frameintervals for pixel format 56595559 (YUYV) and size 800x600
> > > info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 1184x656
> > > info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 960x720
> > > info: found 3 frameintervals for pixel format 56595559 (YUYV) and size 1280x720
> > > info: found 3 frameintervals for pixel format 56595559 (YUYV) and size 1392x768
> > > info: found 2 frameintervals for pixel format 56595559 (YUYV) and size 1504x832
> > > info: found 2 frameintervals for pixel format 56595559 (YUYV) and size 1600x896
> > > info: found 2 frameintervals for pixel format 56595559 (YUYV) and size 1280x960
> > > info: found 1 frameintervals for pixel format 56595559 (YUYV) and size 1712x960
> > > info: found 1 frameintervals for pixel format 56595559 (YUYV) and size 1792x1008
> > > info: found 1 frameintervals for pixel format 56595559 (YUYV) and size 1920x1080
> > > info: found 25 framesizes for pixel format 56595559 (YUYV)
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 640x480
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 160x120
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 176x144
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 320x176
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 320x240
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 432x240
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 352x288
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 544x288
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 640x360
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 752x416
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 800x448
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 864x480
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 960x544
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1024x576
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 800x600
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1184x656
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 960x720
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1280x720
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1392x768
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1504x832
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1600x896
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1280x960
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1712x960
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1792x1008
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1920x1080
> > > info: found 25 framesizes for pixel format 47504a4d (MJPG)
> > > info: found 2 formats for buftype 1
> > > test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > > test VIDIOC_G/S_PARM: OK
> > > test VIDIOC_G_FBUF: OK (Not Supported)
> > > test VIDIOC_G_FMT: OK
> > > test VIDIOC_TRY_FMT: OK
> > > warn: v4l2-test-formats.cpp(1036): Could not set fmt2
> > > test VIDIOC_S_FMT: OK
> > > test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > > test Cropping: OK (Not Supported)
> > > test Composing: OK (Not Supported)
> > > test Scaling: OK (Not Supported)
> > >
> > > Codec ioctls (Input 0):
> > > test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > > test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > > test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > >
> > > Buffer ioctls (Input 0):
> > > info: test buftype Video Capture
> > > test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > > test VIDIOC_EXPBUF: OK
> > > test Requests: OK (Not Supported)
> > >
> > > Total for uvcvideo device /dev/video0: 46, Succeeded: 46, Failed: 0, Warnings: 8
> > >
> > > After:
> > > v4l2-compliance 1.22.1, 64 bits, 64-bit time_t
> > >
> > > Compliance test for uvcvideo device /dev/video0:
> > >
> > > Driver Info:
> > > Driver name      : uvcvideo
> > > Card type        : HD Webcam C525
> > > Bus info         : usb-0000:00:1a.0-1.4
> > > Driver version   : 5.15.0
> > > Capabilities     : 0x84a00001
> > > Video Capture
> > > Metadata Capture
> > > Streaming
> > > Extended Pix Format
> > > Device Capabilities
> > > Device Caps      : 0x04200001
> > > Video Capture
> > > Streaming
> > > Extended Pix Format
> > > Media Driver Info:
> > > Driver name      : uvcvideo
> > > Model            : HD Webcam C525
> > > Serial           : 28D79660
> > > Bus info         : usb-0000:00:1a.0-1.4
> > > Media version    : 5.15.0
> > > Hardware revision: 0x00000010 (16)
> > > Driver version   : 5.15.0
> > > Interface Info:
> > > ID               : 0x03000002
> > > Type             : V4L Video
> > > Entity Info:
> > > ID               : 0x00000001 (1)
> > > Name             : Video Capture 3
> > > Function         : V4L2 I/O
> > > Flags            : default
> > > Pad 0x01000007   : 0: Sink
> > >  Link 0x02000019: from remote pad 0x100000a of entity 'Extension 5'
> > > (Video Pixel Formatter): Data, Enabled, Immutable
> > >
> > > Required ioctls:
> > > test MC information (see 'Media Driver Info' above): OK
> > > test VIDIOC_QUERYCAP: OK
> > > test invalid ioctls: OK
> > >
> > > Allow for multiple opens:
> > > test second /dev/video0 open: OK
> > > test VIDIOC_QUERYCAP: OK
> > > test VIDIOC_G/S_PRIORITY: OK
> > > test for unlimited opens: OK
> > >
> > > Debug ioctls:
> > > test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > > test VIDIOC_LOG_STATUS: OK (Not Supported)
> > >
> > > Input ioctls:
> > > test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > > test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > > test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > > test VIDIOC_G/S/ENUMINPUT: OK
> > > test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > > Inputs: 1 Audio Inputs: 0 Tuners: 0
> > >
> > > Output ioctls:
> > > test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > > test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > > test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > > test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > > Outputs: 0 Audio Outputs: 0 Modulators: 0
> > >
> > > Input/Output configuration ioctls:
> > > test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > > test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > > test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > > test VIDIOC_G/S_EDID: OK (Not Supported)
> > >
> > > Control ioctls (Input 0):
> > > info: checking v4l2_query_ext_ctrl of control 'User Controls' (0x00980001)
> > > info: checking v4l2_query_ext_ctrl of control 'Brightness' (0x00980900)
> > > info: checking v4l2_query_ext_ctrl of control 'Contrast' (0x00980901)
> > > info: checking v4l2_query_ext_ctrl of control 'Saturation' (0x00980902)
> > > info: checking v4l2_query_ext_ctrl of control 'White Balance,
> > > Automatic' (0x0098090c)
> > > info: checking v4l2_query_ext_ctrl of control 'Gain' (0x00980913)
> > > info: checking v4l2_query_ext_ctrl of control 'Power Line Frequency'
> > > (0x00980918)
> > > info: checking v4l2_query_ext_ctrl of control 'White Balance
> > > Temperature' (0x0098091a)
> > > info: checking v4l2_query_ext_ctrl of control 'Sharpness' (0x0098091b)
> > > info: checking v4l2_query_ext_ctrl of control 'Backlight Compensation'
> > > (0x0098091c)
> > > info: checking v4l2_query_ext_ctrl of control 'Camera Controls' (0x009a0001)
> > > info: checking v4l2_query_ext_ctrl of control 'Auto Exposure' (0x009a0901)
> > > info: checking v4l2_query_ext_ctrl of control 'Exposure Time,
> > > Absolute' (0x009a0902)
> > > info: checking v4l2_query_ext_ctrl of control 'Exposure, Dynamic
> > > Framerate' (0x009a0903)
> > > info: checking v4l2_query_ext_ctrl of control 'Pan, Absolute' (0x009a0908)
> > > info: checking v4l2_query_ext_ctrl of control 'Tilt, Absolute' (0x009a0909)
> > > info: checking v4l2_query_ext_ctrl of control 'Focus, Absolute' (0x009a090a)
> > > info: checking v4l2_query_ext_ctrl of control 'Focus, Automatic
> > > Continuous' (0x009a090c)
> > > info: checking v4l2_query_ext_ctrl of control 'Zoom, Absolute' (0x009a090d)
> > > info: checking v4l2_query_ext_ctrl of control 'Brightness' (0x00980900)
> > > info: checking v4l2_query_ext_ctrl of control 'Contrast' (0x00980901)
> > > info: checking v4l2_query_ext_ctrl of control 'Saturation' (0x00980902)
> > > info: checking v4l2_query_ext_ctrl of control 'White Balance,
> > > Automatic' (0x0098090c)
> > > info: checking v4l2_query_ext_ctrl of control 'Gain' (0x00980913)
> > > info: checking v4l2_query_ext_ctrl of control 'Power Line Frequency'
> > > (0x00980918)
> > > info: checking v4l2_query_ext_ctrl of control 'White Balance
> > > Temperature' (0x0098091a)
> > > info: checking v4l2_query_ext_ctrl of control 'Sharpness' (0x0098091b)
> > > info: checking v4l2_query_ext_ctrl of control 'Backlight Compensation'
> > > (0x0098091c)
> > > test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> > > test VIDIOC_QUERYCTRL: OK
> > > info: checking control 'User Controls' (0x00980001)
> > > info: checking control 'Brightness' (0x00980900)
> > > info: checking control 'Contrast' (0x00980901)
> > > info: checking control 'Saturation' (0x00980902)
> > > info: checking control 'White Balance, Automatic' (0x0098090c)
> > > info: checking control 'Gain' (0x00980913)
> > > info: checking control 'Power Line Frequency' (0x00980918)
> > > info: checking control 'White Balance Temperature' (0x0098091a)
> > > fail: v4l2-test-controls.cpp(489): s_ctrl returned an error (13)
> > > test VIDIOC_G/S_CTRL: FAIL
> > > info: checking extended control 'User Controls' (0x00980001)
> > > info: checking extended control 'Brightness' (0x00980900)
> > > info: checking extended control 'Contrast' (0x00980901)
> > > info: checking extended control 'Saturation' (0x00980902)
> > > info: checking extended control 'White Balance, Automatic' (0x0098090c)
> > > info: checking extended control 'Gain' (0x00980913)
> > > info: checking extended control 'Power Line Frequency' (0x00980918)
> > > info: checking extended control 'White Balance Temperature' (0x0098091a)
> > > fail: v4l2-test-controls.cpp(736): s_ext_ctrls returned an error (13)
> > > test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> > > info: checking control event 'User Controls' (0x00980001)
> > > info: checking control event 'Brightness' (0x00980900)
> > > info: checking control event 'Contrast' (0x00980901)
> > > info: checking control event 'Saturation' (0x00980902)
> > > info: checking control event 'White Balance, Automatic' (0x0098090c)
> > > info: checking control event 'Gain' (0x00980913)
> > > info: checking control event 'Power Line Frequency' (0x00980918)
> > > info: checking control event 'White Balance Temperature' (0x0098091a)
> > > info: checking control event 'Sharpness' (0x0098091b)
> > > info: checking control event 'Backlight Compensation' (0x0098091c)
> > > info: checking control event 'Camera Controls' (0x009a0001)
> > > info: checking control event 'Auto Exposure' (0x009a0901)
> > > info: checking control event 'Exposure Time, Absolute' (0x009a0902)
> > > info: checking control event 'Exposure, Dynamic Framerate' (0x009a0903)
> > > info: checking control event 'Pan, Absolute' (0x009a0908)
> > > info: checking control event 'Tilt, Absolute' (0x009a0909)
> > > info: checking control event 'Focus, Absolute' (0x009a090a)
> > > info: checking control event 'Focus, Automatic Continuous' (0x009a090c)
> > > info: checking control event 'Zoom, Absolute' (0x009a090d)
> > > test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> > > test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > > Standard Controls: 19 Private Controls: 0
> > >
> > > Format ioctls (Input 0):
> > > info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 640x480
> > > info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 160x120
> > > info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 176x144
> > > info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 320x176
> > > info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 320x240
> > > info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 432x240
> > > info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 352x288
> > > info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 544x288
> > > info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 640x360
> > > info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 752x416
> > > info: found 7 frameintervals for pixel format 56595559 (YUYV) and size 800x448
> > > info: found 6 frameintervals for pixel format 56595559 (YUYV) and size 864x480
> > > info: found 5 frameintervals for pixel format 56595559 (YUYV) and size 960x544
> > > info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 1024x576
> > > info: found 6 frameintervals for pixel format 56595559 (YUYV) and size 800x600
> > > info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 1184x656
> > > info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 960x720
> > > info: found 3 frameintervals for pixel format 56595559 (YUYV) and size 1280x720
> > > info: found 3 frameintervals for pixel format 56595559 (YUYV) and size 1392x768
> > > info: found 2 frameintervals for pixel format 56595559 (YUYV) and size 1504x832
> > > info: found 2 frameintervals for pixel format 56595559 (YUYV) and size 1600x896
> > > info: found 2 frameintervals for pixel format 56595559 (YUYV) and size 1280x960
> > > info: found 1 frameintervals for pixel format 56595559 (YUYV) and size 1712x960
> > > info: found 1 frameintervals for pixel format 56595559 (YUYV) and size 1792x1008
> > > info: found 1 frameintervals for pixel format 56595559 (YUYV) and size 1920x1080
> > > info: found 25 framesizes for pixel format 56595559 (YUYV)
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 640x480
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 160x120
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 176x144
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 320x176
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 320x240
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 432x240
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 352x288
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 544x288
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 640x360
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 752x416
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 800x448
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 864x480
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 960x544
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1024x576
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 800x600
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1184x656
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 960x720
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1280x720
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1392x768
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1504x832
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1600x896
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1280x960
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1712x960
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1792x1008
> > > info: found 7 frameintervals for pixel format 47504a4d (MJPG) and size 1920x1080
> > > info: found 25 framesizes for pixel format 47504a4d (MJPG)
> > > info: found 2 formats for buftype 1
> > > test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > > test VIDIOC_G/S_PARM: OK
> > > test VIDIOC_G_FBUF: OK (Not Supported)
> > > test VIDIOC_G_FMT: OK
> > > test VIDIOC_TRY_FMT: OK
> > > warn: v4l2-test-formats.cpp(1036): Could not set fmt2
> > > test VIDIOC_S_FMT: OK
> > > test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > > test Cropping: OK (Not Supported)
> > > test Composing: OK (Not Supported)
> > > test Scaling: OK (Not Supported)
> > >
> > > Codec ioctls (Input 0):
> > > test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > > test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > > test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > >
> > > Buffer ioctls (Input 0):
> > > info: test buftype Video Capture
> > > test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > > test VIDIOC_EXPBUF: OK
> > > test Requests: OK (Not Supported)
> > >
> > > Total for uvcvideo device /dev/video0: 46, Succeeded: 44, Failed: 2, Warnings: 1
> > > [  642.533598] usb 1-1.4: uvc_v4l2_open
> > > [  642.587552] usb 1-1.4: Resuming interface 2
> > > [  642.587570] usb 1-1.4: Resuming interface 3
> > > [  642.590328] usb 1-1.4: uvc_v4l2_open
> > > [  642.590453] usb 1-1.4: uvc_v4l2_open
> > > [  642.590466] usb 1-1.4: uvc_v4l2_open
> > > [  642.590478] usb 1-1.4: uvc_v4l2_open
> > > [  642.590488] usb 1-1.4: uvc_v4l2_open
> > > [  642.590497] usb 1-1.4: uvc_v4l2_open
> > > [  642.590507] usb 1-1.4: uvc_v4l2_open
> > > [  642.590517] usb 1-1.4: uvc_v4l2_open
> > > [  642.590526] usb 1-1.4: uvc_v4l2_open
> > > [  642.590535] usb 1-1.4: uvc_v4l2_open
> > > [  642.590545] usb 1-1.4: uvc_v4l2_open
> > > [  642.590554] usb 1-1.4: uvc_v4l2_open
> > > [  642.590563] usb 1-1.4: uvc_v4l2_open
> > > [  642.590573] usb 1-1.4: uvc_v4l2_open
> > > [  642.590583] usb 1-1.4: uvc_v4l2_open
> > > [  642.590592] usb 1-1.4: uvc_v4l2_open
> > > [  642.590601] usb 1-1.4: uvc_v4l2_open
> > > [  642.590610] usb 1-1.4: uvc_v4l2_open
> > > [  642.590620] usb 1-1.4: uvc_v4l2_open
> > > [  642.590629] usb 1-1.4: uvc_v4l2_open
> > > [  642.590639] usb 1-1.4: uvc_v4l2_open
> > > [  642.590648] usb 1-1.4: uvc_v4l2_open
> > > [  642.590657] usb 1-1.4: uvc_v4l2_open
> > > [  642.590666] usb 1-1.4: uvc_v4l2_open
> > > [  642.590676] usb 1-1.4: uvc_v4l2_open
> > > [  642.590685] usb 1-1.4: uvc_v4l2_open
> > > [  642.590694] usb 1-1.4: uvc_v4l2_open
> > > [  642.590703] usb 1-1.4: uvc_v4l2_open
> > > [  642.590713] usb 1-1.4: uvc_v4l2_open
> > > [  642.590722] usb 1-1.4: uvc_v4l2_open
> > > [  642.590732] usb 1-1.4: uvc_v4l2_open
> > > [  642.590741] usb 1-1.4: uvc_v4l2_open
> > > [  642.590750] usb 1-1.4: uvc_v4l2_open
> > > [  642.590759] usb 1-1.4: uvc_v4l2_open
> > > [  642.590767] usb 1-1.4: uvc_v4l2_open
> > > [  642.590776] usb 1-1.4: uvc_v4l2_open
> > > [  642.590787] usb 1-1.4: uvc_v4l2_open
> > > [  642.590797] usb 1-1.4: uvc_v4l2_open
> > > [  642.590806] usb 1-1.4: uvc_v4l2_open
> > > [  642.590815] usb 1-1.4: uvc_v4l2_open
> > > [  642.590824] usb 1-1.4: uvc_v4l2_open
> > > [  642.590834] usb 1-1.4: uvc_v4l2_open
> > > [  642.590845] usb 1-1.4: uvc_v4l2_open
> > > [  642.590854] usb 1-1.4: uvc_v4l2_open
> > > [  642.590864] usb 1-1.4: uvc_v4l2_open
> > > [  642.590874] usb 1-1.4: uvc_v4l2_open
> > > [  642.590884] usb 1-1.4: uvc_v4l2_open
> > > [  642.590893] usb 1-1.4: uvc_v4l2_open
> > > [  642.590902] usb 1-1.4: uvc_v4l2_open
> > > [  642.590911] usb 1-1.4: uvc_v4l2_open
> > > [  642.590920] usb 1-1.4: uvc_v4l2_open
> > > [  642.590929] usb 1-1.4: uvc_v4l2_open
> > > [  642.590938] usb 1-1.4: uvc_v4l2_open
> > > [  642.590947] usb 1-1.4: uvc_v4l2_open
> > > [  642.590956] usb 1-1.4: uvc_v4l2_open
> > > [  642.590965] usb 1-1.4: uvc_v4l2_open
> > > [  642.590976] usb 1-1.4: uvc_v4l2_open
> > > [  642.590985] usb 1-1.4: uvc_v4l2_open
> > > [  642.590994] usb 1-1.4: uvc_v4l2_open
> > > [  642.591007] usb 1-1.4: uvc_v4l2_open
> > > [  642.591018] usb 1-1.4: uvc_v4l2_open
> > > [  642.591027] usb 1-1.4: uvc_v4l2_open
> > > [  642.591036] usb 1-1.4: uvc_v4l2_open
> > > [  642.591045] usb 1-1.4: uvc_v4l2_open
> > > [  642.591053] usb 1-1.4: uvc_v4l2_open
> > > [  642.591062] usb 1-1.4: uvc_v4l2_open
> > > [  642.591072] usb 1-1.4: uvc_v4l2_open
> > > [  642.591083] usb 1-1.4: uvc_v4l2_open
> > > [  642.591092] usb 1-1.4: uvc_v4l2_open
> > > [  642.591102] usb 1-1.4: uvc_v4l2_open
> > > [  642.591111] usb 1-1.4: uvc_v4l2_open
> > > [  642.591120] usb 1-1.4: uvc_v4l2_open
> > > [  642.591131] usb 1-1.4: uvc_v4l2_open
> > > [  642.591140] usb 1-1.4: uvc_v4l2_open
> > > [  642.591149] usb 1-1.4: uvc_v4l2_open
> > > [  642.591159] usb 1-1.4: uvc_v4l2_open
> > > [  642.591170] usb 1-1.4: uvc_v4l2_open
> > > [  642.591180] usb 1-1.4: uvc_v4l2_open
> > > [  642.591190] usb 1-1.4: uvc_v4l2_open
> > > [  642.591201] usb 1-1.4: uvc_v4l2_open
> > > [  642.591210] usb 1-1.4: uvc_v4l2_open
> > > [  642.591220] usb 1-1.4: uvc_v4l2_open
> > > [  642.591229] usb 1-1.4: uvc_v4l2_open
> > > [  642.591238] usb 1-1.4: uvc_v4l2_open
> > > [  642.591249] usb 1-1.4: uvc_v4l2_open
> > > [  642.591260] usb 1-1.4: uvc_v4l2_open
> > > [  642.591286] usb 1-1.4: uvc_v4l2_open
> > > [  642.591297] usb 1-1.4: uvc_v4l2_open
> > > [  642.591308] usb 1-1.4: uvc_v4l2_open
> > > [  642.591318] usb 1-1.4: uvc_v4l2_open
> > > [  642.591327] usb 1-1.4: uvc_v4l2_open
> > > [  642.591337] usb 1-1.4: uvc_v4l2_open
> > > [  642.591346] usb 1-1.4: uvc_v4l2_open
> > > [  642.591355] usb 1-1.4: uvc_v4l2_open
> > > [  642.591364] usb 1-1.4: uvc_v4l2_open
> > > [  642.591373] usb 1-1.4: uvc_v4l2_open
> > > [  642.591383] usb 1-1.4: uvc_v4l2_open
> > > [  642.591393] usb 1-1.4: uvc_v4l2_open
> > > [  642.591402] usb 1-1.4: uvc_v4l2_open
> > > [  642.591411] usb 1-1.4: uvc_v4l2_open
> > > [  642.591420] usb 1-1.4: uvc_v4l2_open
> > > [  642.591477] usb 1-1.4: uvc_v4l2_release
> > > [  642.591507] usb 1-1.4: uvc_v4l2_release
> > > [  642.591531] usb 1-1.4: uvc_v4l2_release
> > > [  642.591556] usb 1-1.4: uvc_v4l2_release
> > > [  642.591579] usb 1-1.4: uvc_v4l2_release
> > > [  642.591601] usb 1-1.4: uvc_v4l2_release
> > > [  642.591624] usb 1-1.4: uvc_v4l2_release
> > > [  642.591647] usb 1-1.4: uvc_v4l2_release
> > > [  642.591670] usb 1-1.4: uvc_v4l2_release
> > > [  642.591692] usb 1-1.4: uvc_v4l2_release
> > > [  642.591715] usb 1-1.4: uvc_v4l2_release
> > > [  642.591737] usb 1-1.4: uvc_v4l2_release
> > > [  642.591760] usb 1-1.4: uvc_v4l2_release
> > > [  642.591783] usb 1-1.4: uvc_v4l2_release
> > > [  642.591805] usb 1-1.4: uvc_v4l2_release
> > > [  642.591829] usb 1-1.4: uvc_v4l2_release
> > > [  642.591853] usb 1-1.4: uvc_v4l2_release
> > > [  642.591876] usb 1-1.4: uvc_v4l2_release
> > > [  642.591899] usb 1-1.4: uvc_v4l2_release
> > > [  642.591922] usb 1-1.4: uvc_v4l2_release
> > > [  642.591944] usb 1-1.4: uvc_v4l2_release
> > > [  642.591967] usb 1-1.4: uvc_v4l2_release
> > > [  642.591990] usb 1-1.4: uvc_v4l2_release
> > > [  642.592012] usb 1-1.4: uvc_v4l2_release
> > > [  642.592035] usb 1-1.4: uvc_v4l2_release
> > > [  642.592058] usb 1-1.4: uvc_v4l2_release
> > > [  642.592081] usb 1-1.4: uvc_v4l2_release
> > > [  642.592103] usb 1-1.4: uvc_v4l2_release
> > > [  642.592126] usb 1-1.4: uvc_v4l2_release
> > > [  642.592148] usb 1-1.4: uvc_v4l2_release
> > > [  642.592170] usb 1-1.4: uvc_v4l2_release
> > > [  642.592192] usb 1-1.4: uvc_v4l2_release
> > > [  642.592214] usb 1-1.4: uvc_v4l2_release
> > > [  642.592237] usb 1-1.4: uvc_v4l2_release
> > > [  642.592259] usb 1-1.4: uvc_v4l2_release
> > > [  642.592295] usb 1-1.4: uvc_v4l2_release
> > > [  642.592319] usb 1-1.4: uvc_v4l2_release
> > > [  642.592342] usb 1-1.4: uvc_v4l2_release
> > > [  642.592364] usb 1-1.4: uvc_v4l2_release
> > > [  642.592387] usb 1-1.4: uvc_v4l2_release
> > > [  642.592410] usb 1-1.4: uvc_v4l2_release
> > > [  642.592432] usb 1-1.4: uvc_v4l2_release
> > > [  642.592455] usb 1-1.4: uvc_v4l2_release
> > > [  642.592478] usb 1-1.4: uvc_v4l2_release
> > > [  642.592500] usb 1-1.4: uvc_v4l2_release
> > > [  642.592523] usb 1-1.4: uvc_v4l2_release
> > > [  642.592546] usb 1-1.4: uvc_v4l2_release
> > > [  642.592569] usb 1-1.4: uvc_v4l2_release
> > > [  642.592592] usb 1-1.4: uvc_v4l2_release
> > > [  642.592614] usb 1-1.4: uvc_v4l2_release
> > > [  642.592637] usb 1-1.4: uvc_v4l2_release
> > > [  642.592660] usb 1-1.4: uvc_v4l2_release
> > > [  642.592683] usb 1-1.4: uvc_v4l2_release
> > > [  642.592706] usb 1-1.4: uvc_v4l2_release
> > > [  642.592728] usb 1-1.4: uvc_v4l2_release
> > > [  642.592751] usb 1-1.4: uvc_v4l2_release
> > > [  642.592773] usb 1-1.4: uvc_v4l2_release
> > > [  642.592796] usb 1-1.4: uvc_v4l2_release
> > > [  642.592819] usb 1-1.4: uvc_v4l2_release
> > > [  642.592842] usb 1-1.4: uvc_v4l2_release
> > > [  642.592865] usb 1-1.4: uvc_v4l2_release
> > > [  642.592887] usb 1-1.4: uvc_v4l2_release
> > > [  642.592910] usb 1-1.4: uvc_v4l2_release
> > > [  642.592933] usb 1-1.4: uvc_v4l2_release
> > > [  642.592955] usb 1-1.4: uvc_v4l2_release
> > > [  642.592978] usb 1-1.4: uvc_v4l2_release
> > > [  642.593001] usb 1-1.4: uvc_v4l2_release
> > > [  642.593025] usb 1-1.4: uvc_v4l2_release
> > > [  642.593048] usb 1-1.4: uvc_v4l2_release
> > > [  642.593071] usb 1-1.4: uvc_v4l2_release
> > > [  642.593094] usb 1-1.4: uvc_v4l2_release
> > > [  642.593116] usb 1-1.4: uvc_v4l2_release
> > > [  642.593139] usb 1-1.4: uvc_v4l2_release
> > > [  642.593161] usb 1-1.4: uvc_v4l2_release
> > > [  642.593184] usb 1-1.4: uvc_v4l2_release
> > > [  642.593206] usb 1-1.4: uvc_v4l2_release
> > > [  642.593229] usb 1-1.4: uvc_v4l2_release
> > > [  642.593251] usb 1-1.4: uvc_v4l2_release
> > > [  642.593287] usb 1-1.4: uvc_v4l2_release
> > > [  642.593312] usb 1-1.4: uvc_v4l2_release
> > > [  642.593335] usb 1-1.4: uvc_v4l2_release
> > > [  642.593358] usb 1-1.4: uvc_v4l2_release
> > > [  642.593381] usb 1-1.4: uvc_v4l2_release
> > > [  642.593404] usb 1-1.4: uvc_v4l2_release
> > > [  642.593427] usb 1-1.4: uvc_v4l2_release
> > > [  642.593450] usb 1-1.4: uvc_v4l2_release
> > > [  642.593473] usb 1-1.4: uvc_v4l2_release
> > > [  642.593495] usb 1-1.4: uvc_v4l2_release
> > > [  642.593518] usb 1-1.4: uvc_v4l2_release
> > > [  642.593541] usb 1-1.4: uvc_v4l2_release
> > > [  642.593565] usb 1-1.4: uvc_v4l2_release
> > > [  642.593588] usb 1-1.4: uvc_v4l2_release
> > > [  642.593611] usb 1-1.4: uvc_v4l2_release
> > > [  642.593634] usb 1-1.4: uvc_v4l2_release
> > > [  642.593656] usb 1-1.4: uvc_v4l2_release
> > > [  642.593679] usb 1-1.4: uvc_v4l2_release
> > > [  642.593701] usb 1-1.4: uvc_v4l2_release
> > > [  642.593724] usb 1-1.4: uvc_v4l2_release
> > > [  642.593747] usb 1-1.4: uvc_v4l2_release
> > > [  642.593770] usb 1-1.4: uvc_v4l2_release
> > > [  642.604856] usb 1-1.4: Control 0x00980001 not found
> > > [  642.605074] usb 1-1.4: Control 0x009a0001 not found
> > > [  642.605322] usb 1-1.4: Control 0x00000000 not found
> > > [  642.605382] usb 1-1.4: Control 0x00980903 not found
> > > [  642.605390] usb 1-1.4: Control 0x00980904 not found
> > > [  642.605397] usb 1-1.4: Control 0x00980905 not found
> > > [  642.605403] usb 1-1.4: Control 0x00980906 not found
> > > [  642.605410] usb 1-1.4: Control 0x00980907 not found
> > > [  642.605416] usb 1-1.4: Control 0x00980908 not found
> > > [  642.605423] usb 1-1.4: Control 0x00980909 not found
> > > [  642.605429] usb 1-1.4: Control 0x0098090a not found
> > > [  642.605436] usb 1-1.4: Control 0x0098090b not found
> > > [  642.605460] usb 1-1.4: Control 0x0098090d not found
> > > [  642.605468] usb 1-1.4: Control 0x0098090e not found
> > > [  642.605474] usb 1-1.4: Control 0x0098090f not found
> > > [  642.605481] usb 1-1.4: Control 0x00980910 not found
> > > [  642.605487] usb 1-1.4: Control 0x00980911 not found
> > > [  642.605494] usb 1-1.4: Control 0x00980912 not found
> > > [  642.605515] usb 1-1.4: Control 0x00980914 not found
> > > [  642.605522] usb 1-1.4: Control 0x00980915 not found
> > > [  642.605528] usb 1-1.4: Control 0x00980916 not found
> > > [  642.605535] usb 1-1.4: Control 0x00980917 not found
> > > [  642.605567] usb 1-1.4: Control 0x00980919 not found
> > > [  642.605630] usb 1-1.4: Control 0x0098091d not found
> > > [  642.605637] usb 1-1.4: Control 0x0098091e not found
> > > [  642.605644] usb 1-1.4: Control 0x0098091f not found
> > > [  642.605651] usb 1-1.4: Control 0x00980920 not found
> > > [  642.605657] usb 1-1.4: Control 0x00980921 not found
> > > [  642.605664] usb 1-1.4: Control 0x00980922 not found
> > > [  642.605670] usb 1-1.4: Control 0x00980923 not found
> > > [  642.605676] usb 1-1.4: Control 0x00980924 not found
> > > [  642.605682] usb 1-1.4: Control 0x00980925 not found
> > > [  642.605689] usb 1-1.4: Control 0x00980926 not found
> > > [  642.605695] usb 1-1.4: Control 0x00980927 not found
> > > [  642.605701] usb 1-1.4: Control 0x00980928 not found
> > > [  642.605708] usb 1-1.4: Control 0x00980929 not found
> > > [  642.605714] usb 1-1.4: Control 0x0098092a not found
> > > [  642.605720] usb 1-1.4: Control 0x08000000 not found
> > > [  642.605807] usb 1-1.4: Control 0x00000000 not found
> > > [  642.605823] usb 1-1.4: Control 0x00980903 not found
> > > [  642.605830] usb 1-1.4: Control 0x00980904 not found
> > > [  642.605836] usb 1-1.4: Control 0x00980905 not found
> > > [  642.605842] usb 1-1.4: Control 0x00980906 not found
> > > [  642.605848] usb 1-1.4: Control 0x00980907 not found
> > > [  642.605854] usb 1-1.4: Control 0x00980908 not found
> > > [  642.605860] usb 1-1.4: Control 0x00980909 not found
> > > [  642.605866] usb 1-1.4: Control 0x0098090a not found
> > > [  642.605872] usb 1-1.4: Control 0x0098090b not found
> > > [  642.605881] usb 1-1.4: Control 0x0098090d not found
> > > [  642.605887] usb 1-1.4: Control 0x0098090e not found
> > > [  642.605893] usb 1-1.4: Control 0x0098090f not found
> > > [  642.605899] usb 1-1.4: Control 0x00980910 not found
> > > [  642.605905] usb 1-1.4: Control 0x00980911 not found
> > > [  642.605911] usb 1-1.4: Control 0x00980912 not found
> > > [  642.605920] usb 1-1.4: Control 0x00980914 not found
> > > [  642.605926] usb 1-1.4: Control 0x00980915 not found
> > > [  642.605932] usb 1-1.4: Control 0x00980916 not found
> > > [  642.605938] usb 1-1.4: Control 0x00980917 not found
> > > [  642.605947] usb 1-1.4: Control 0x00980919 not found
> > > [  642.605962] usb 1-1.4: Control 0x0098091d not found
> > > [  642.605968] usb 1-1.4: Control 0x0098091e not found
> > > [  642.605974] usb 1-1.4: Control 0x0098091f not found
> > > [  642.605980] usb 1-1.4: Control 0x00980920 not found
> > > [  642.605986] usb 1-1.4: Control 0x00980921 not found
> > > [  642.605992] usb 1-1.4: Control 0x00980922 not found
> > > [  642.605999] usb 1-1.4: Control 0x00980923 not found
> > > [  642.606005] usb 1-1.4: Control 0x00980924 not found
> > > [  642.606011] usb 1-1.4: Control 0x00980925 not found
> > > [  642.606017] usb 1-1.4: Control 0x00980926 not found
> > > [  642.606023] usb 1-1.4: Control 0x00980927 not found
> > > [  642.606029] usb 1-1.4: Control 0x00980928 not found
> > > [  642.606035] usb 1-1.4: Control 0x00980929 not found
> > > [  642.606041] usb 1-1.4: Control 0x0098092a not found
> > > [  642.606047] usb 1-1.4: Control 0x08000000 not found
> > > [  642.702275] usb 1-1.4: uvc_v4l2_poll
> > > [  642.702416] usb 1-1.4: uvc_v4l2_poll
> > > [  642.702715] usb 1-1.4: uvc_v4l2_poll
> > > [  642.703002] usb 1-1.4: uvc_v4l2_poll
> > > [  642.703112] usb 1-1.4: Control 2/10 info change len 6
> > > [  642.703340] usb 1-1.4: uvc_v4l2_poll
> > > [  642.703618] usb 1-1.4: uvc_v4l2_poll
> > > [  642.705438] usb 1-1.4: uvc_v4l2_poll
> > > [  642.705831] usb 1-1.4: uvc_v4l2_poll
> > > [  642.707683] usb 1-1.4: uvc_v4l2_poll
> > > [  642.708078] usb 1-1.4: uvc_v4l2_poll
> > > [  642.708397] usb 1-1.4: uvc_v4l2_poll
> > > [  642.708681] usb 1-1.4: uvc_v4l2_poll
> > > [  642.708841] usb 1-1.4: uvc_v4l2_poll
> > > [  642.709132] usb 1-1.4: uvc_v4l2_poll
> > > [  642.711317] usb 1-1.4: uvc_v4l2_poll
> > > [  642.711761] usb 1-1.4: uvc_v4l2_poll
> > > [  642.714197] usb 1-1.4: uvc_v4l2_poll
> > > [  642.714622] usb 1-1.4: uvc_v4l2_poll
> > > [  642.716415] usb 1-1.4: uvc_v4l2_poll
> > > [  642.716806] usb 1-1.4: uvc_v4l2_poll
> > > [  642.718561] usb 1-1.4: uvc_v4l2_poll
> > > [  642.726868] usb 1-1.4: Setting frame interval to 0/0 (4294967295)
> > > [  642.747068] usb 1-1.4: Setting frame interval to 0/1 (0)
> > > [  642.767720] usb 1-1.4: Setting frame interval to 1/0 (4294967295)
> > > [  642.788421] usb 1-1.4: Trying format 0x56595559 (YUYV): 640x480
> > > [  642.788442] usb 1-1.4: Using default frame interval 33333.3 us (30.0 fps)
> > > [  642.808972] usb 1-1.4: Trying format 0xffffffff (\xff\xff\xff\xff):
> > > 4294967295x4294967295
> > > [  642.808992] usb 1-1.4: Using default frame interval 200000.0 us (5.0 fps)
> > > [  642.830204] usb 1-1.4: Trying format 0xffffffff (\xff\xff\xff\xff):
> > > 4294967295x4294967295
> > > [  642.830228] usb 1-1.4: Using default frame interval 200000.0 us (5.0 fps)
> > > [  642.850304] usb 1-1.4: Trying format 0x56595559 (YUYV): 640x480
> > > [  642.850324] usb 1-1.4: Using default frame interval 33333.3 us (30.0 fps)
> > > [  642.871324] usb 1-1.4: Trying format 0x56595559 (YUYV): 0x0
> > > [  642.871344] usb 1-1.4: Using default frame interval 33333.3 us (30.0 fps)
> > > [  642.891830] usb 1-1.4: Trying format 0x56595559 (YUYV): 640x480
> > > [  642.891850] usb 1-1.4: Using default frame interval 33333.3 us (30.0 fps)
> > > [  642.912799] usb 1-1.4: Trying format 0x56595559 (YUYV): 1x1
> > > [  642.912820] usb 1-1.4: Using default frame interval 33333.3 us (30.0 fps)
> > > [  642.933624] usb 1-1.4: Trying format 0x56595559 (YUYV): 16384x16384
> > > [  642.933645] usb 1-1.4: Using default frame interval 200000.0 us (5.0 fps)
> > > [  642.954142] usb 1-1.4: Trying format 0x56595559 (YUYV): 640x480
> > > [  642.954161] usb 1-1.4: Using default frame interval 33333.3 us (30.0 fps)
> > > [  642.975364] usb 1-1.4: uvc_v4l2_release
> > > [  642.975428] usb 1-1.4: uvc_v4l2_open
> > > [  642.977201] usb 1-1.4: uvc_v4l2_release
> > > [  642.977229] usb 1-1.4: uvc_v4l2_open
> > > [  642.977769] usb 1-1.4: Setting frame interval to 1/1000 (10000)
> > > [  642.999132] usb 1-1.4: uvc_v4l2_release
> > > [  642.999178] usb 1-1.4: uvc_v4l2_open
> > > [  642.999341] usb 1-1.4: uvc_v4l2_release
> > > [  642.999373] usb 1-1.4: uvc_v4l2_open
> > > [  642.999428] usb 1-1.4: Trying format 0x56595559 (YUYV): 640x480
> > > [  642.999442] usb 1-1.4: Using default frame interval 33333.3 us (30.0 fps)
> > > [  643.019814] usb 1-1.4: Setting frame interval to 1/30 (333333)
> > > [  643.040753] usb 1-1.4: uvc_v4l2_release
> > > [  643.040808] usb 1-1.4: uvc_v4l2_open
> > > [  643.040860] usb 1-1.4: uvc_v4l2_release
> > > [  643.040874] usb 1-1.4: uvc_v4l2_open
> > > [  643.040903] usb 1-1.4: Trying format 0x56595559 (YUYV): 640x480
> > > [  643.040912] usb 1-1.4: Using default frame interval 33333.3 us (30.0 fps)
> > > [  643.061785] usb 1-1.4: Setting frame interval to 1/30 (333333)
> > > [  643.082171] usb 1-1.4: uvc_v4l2_release
> > > [  643.082236] usb 1-1.4: uvc_v4l2_open
> > > [  643.082417] usb 1-1.4: uvc_v4l2_release
> > > [  643.082443] usb 1-1.4: uvc_v4l2_release
> > > [  645.416974] usb 1-1.4: Suspending interface 3
> > > [  645.416989] usb 1-1.4: Suspending interface 2
> > >
> > > A different camera that has not passed without errors ever:
> > > v4l2-compliance 1.22.1, 64 bits, 64-bit time_t
> > >
> > > Compliance test for uvcvideo device /dev/video0:
> > >
> > > Driver Info:
> > > Driver name      : uvcvideo
> > > Card type        : SVS RGB USB camera: SVS RGB USB
> > > Bus info         : usb-0000:00:14.0-2
> > > Driver version   : 5.15.0
> > > Capabilities     : 0x84a00001
> > > Video Capture
> > > Metadata Capture
> > > Streaming
> > > Extended Pix Format
> > > Device Capabilities
> > > Device Caps      : 0x04200001
> > > Video Capture
> > > Streaming
> > > Extended Pix Format
> > > Media Driver Info:
> > > Driver name      : uvcvideo
> > > Model            : SVS RGB USB camera: SVS RGB USB
> > > Serial           : V20210818SWS2093
> > > Bus info         : usb-0000:00:14.0-2
> > > Media version    : 5.15.0
> > > Hardware revision: 0x00000001 (1)
> > > Driver version   : 5.15.0
> > > Interface Info:
> > > ID               : 0x03000002
> > > Type             : V4L Video
> > > Entity Info:
> > > ID               : 0x00000001 (1)
> > > Name             : Video Capture 4
> > > Function         : V4L2 I/O
> > > Flags            : default
> > > Pad 0x01000007   : 0: Sink
> > >  Link 0x02000010: from remote pad 0x100000a of entity 'Extension 3'
> > > (Video Pixel Formatter): Data, Enabled, Immutable
> > >
> > > Required ioctls:
> > > test MC information (see 'Media Driver Info' above): OK
> > > test VIDIOC_QUERYCAP: OK
> > > test invalid ioctls: OK
> > >
> > > Allow for multiple opens:
> > > test second /dev/video0 open: OK
> > > test VIDIOC_QUERYCAP: OK
> > > test VIDIOC_G/S_PRIORITY: OK
> > > test for unlimited opens: OK
> > >
> > > Debug ioctls:
> > > test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > > test VIDIOC_LOG_STATUS: OK (Not Supported)
> > >
> > > Input ioctls:
> > > test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > > test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > > test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > > test VIDIOC_G/S/ENUMINPUT: OK
> > > test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > > Inputs: 1 Audio Inputs: 0 Tuners: 0
> > >
> > > Output ioctls:
> > > test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > > test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > > test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > > test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > > test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > > Outputs: 0 Audio Outputs: 0 Modulators: 0
> > >
> > > Input/Output configuration ioctls:
> > > test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > > test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > > test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > > test VIDIOC_G/S_EDID: OK (Not Supported)
> > >
> > > Control ioctls (Input 0):
> > > info: checking v4l2_query_ext_ctrl of control 'User Controls' (0x00980001)
> > > info: checking v4l2_query_ext_ctrl of control 'Brightness' (0x00980900)
> > > info: checking v4l2_query_ext_ctrl of control 'Contrast' (0x00980901)
> > > info: checking v4l2_query_ext_ctrl of control 'Saturation' (0x00980902)
> > > info: checking v4l2_query_ext_ctrl of control 'White Balance,
> > > Automatic' (0x0098090c)
> > > info: checking v4l2_query_ext_ctrl of control 'Gamma' (0x00980910)
> > > info: checking v4l2_query_ext_ctrl of control 'Gain' (0x00980913)
> > > info: checking v4l2_query_ext_ctrl of control 'Power Line Frequency'
> > > (0x00980918)
> > > info: checking v4l2_query_ext_ctrl of control 'White Balance
> > > Temperature' (0x0098091a)
> > > info: checking v4l2_query_ext_ctrl of control 'Sharpness' (0x0098091b)
> > > info: checking v4l2_query_ext_ctrl of control 'Camera Controls' (0x009a0001)
> > > info: checking v4l2_query_ext_ctrl of control 'Auto Exposure' (0x009a0901)
> > > info: checking v4l2_query_ext_ctrl of control 'Exposure Time,
> > > Absolute' (0x009a0902)
> > > info: checking v4l2_query_ext_ctrl of control 'Exposure, Dynamic
> > > Framerate' (0x009a0903)
> > > info: checking v4l2_query_ext_ctrl of control 'Brightness' (0x00980900)
> > > info: checking v4l2_query_ext_ctrl of control 'Contrast' (0x00980901)
> > > info: checking v4l2_query_ext_ctrl of control 'Saturation' (0x00980902)
> > > info: checking v4l2_query_ext_ctrl of control 'White Balance,
> > > Automatic' (0x0098090c)
> > > info: checking v4l2_query_ext_ctrl of control 'Gamma' (0x00980910)
> > > info: checking v4l2_query_ext_ctrl of control 'Gain' (0x00980913)
> > > info: checking v4l2_query_ext_ctrl of control 'Power Line Frequency'
> > > (0x00980918)
> > > info: checking v4l2_query_ext_ctrl of control 'White Balance
> > > Temperature' (0x0098091a)
> > > info: checking v4l2_query_ext_ctrl of control 'Sharpness' (0x0098091b)
> > > test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> > > test VIDIOC_QUERYCTRL: OK
> > > info: checking control 'User Controls' (0x00980001)
> > > info: checking control 'Brightness' (0x00980900)
> > > info: checking control 'Contrast' (0x00980901)
> > > info: checking control 'Saturation' (0x00980902)
> > > info: checking control 'White Balance, Automatic' (0x0098090c)
> > > info: checking control 'Gamma' (0x00980910)
> > > info: checking control 'Gain' (0x00980913)
> > > info: checking control 'Power Line Frequency' (0x00980918)
> > > info: checking control 'White Balance Temperature' (0x0098091a)
> > > fail: v4l2-test-controls.cpp(489): s_ctrl returned an error (13)
> > > test VIDIOC_G/S_CTRL: FAIL
> > > info: checking extended control 'User Controls' (0x00980001)
> > > info: checking extended control 'Brightness' (0x00980900)
> > > info: checking extended control 'Contrast' (0x00980901)
> > > info: checking extended control 'Saturation' (0x00980902)
> > > info: checking extended control 'White Balance, Automatic' (0x0098090c)
> > > info: checking extended control 'Gamma' (0x00980910)
> > > info: checking extended control 'Gain' (0x00980913)
> > > info: checking extended control 'Power Line Frequency' (0x00980918)
> > > info: checking extended control 'White Balance Temperature' (0x0098091a)
> > > fail: v4l2-test-controls.cpp(736): s_ext_ctrls returned an error (13)
> > > test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
> > > info: checking control event 'User Controls' (0x00980001)
> > > info: checking control event 'Brightness' (0x00980900)
> > > info: checking control event 'Contrast' (0x00980901)
> > > info: checking control event 'Saturation' (0x00980902)
> > > info: checking control event 'White Balance, Automatic' (0x0098090c)
> > > info: checking control event 'Gamma' (0x00980910)
> > > info: checking control event 'Gain' (0x00980913)
> > > info: checking control event 'Power Line Frequency' (0x00980918)
> > > info: checking control event 'White Balance Temperature' (0x0098091a)
> > > info: checking control event 'Sharpness' (0x0098091b)
> > > info: checking control event 'Camera Controls' (0x009a0001)
> > > info: checking control event 'Auto Exposure' (0x009a0901)
> > > info: checking control event 'Exposure Time, Absolute' (0x009a0902)
> > > info: checking control event 'Exposure, Dynamic Framerate' (0x009a0903)
> > > test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> > > test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > > Standard Controls: 14 Private Controls: 0
> > >
> > > Format ioctls (Input 0):
> > > info: found 8 frameintervals for pixel format 47504a4d (MJPG) and size 640x480
> > > info: found 4 frameintervals for pixel format 47504a4d (MJPG) and size 1920x1080
> > > info: found 4 frameintervals for pixel format 47504a4d (MJPG) and size 1280x1024
> > > info: found 4 frameintervals for pixel format 47504a4d (MJPG) and size 1280x800
> > > info: found 4 frameintervals for pixel format 47504a4d (MJPG) and size 1280x720
> > > info: found 4 frameintervals for pixel format 47504a4d (MJPG) and size 1024x768
> > > info: found 4 frameintervals for pixel format 47504a4d (MJPG) and size 800x600
> > > info: found 4 frameintervals for pixel format 47504a4d (MJPG) and size 800x500
> > > info: found 4 frameintervals for pixel format 47504a4d (MJPG) and size 640x400
> > > info: found 8 frameintervals for pixel format 47504a4d (MJPG) and size 640x480
> > > info: found 10 framesizes for pixel format 47504a4d (MJPG)
> > > info: found 8 frameintervals for pixel format 34363248 (H264) and size 640x480
> > > info: found 4 frameintervals for pixel format 34363248 (H264) and size 1920x1080
> > > info: found 4 frameintervals for pixel format 34363248 (H264) and size 1280x1024
> > > info: found 4 frameintervals for pixel format 34363248 (H264) and size 1280x800
> > > info: found 4 frameintervals for pixel format 34363248 (H264) and size 1280x720
> > > info: found 4 frameintervals for pixel format 34363248 (H264) and size 1024x768
> > > info: found 4 frameintervals for pixel format 34363248 (H264) and size 800x600
> > > info: found 4 frameintervals for pixel format 34363248 (H264) and size 800x500
> > > info: found 4 frameintervals for pixel format 34363248 (H264) and size 640x400
> > > info: found 8 frameintervals for pixel format 34363248 (H264) and size 640x480
> > > info: found 10 framesizes for pixel format 34363248 (H264)
> > > info: found 8 frameintervals for pixel format 56595559 (YUYV) and size 640x480
> > > info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 1920x1080
> > > info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 1280x1024
> > > info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 1280x800
> > > info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 1280x720
> > > info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 1024x768
> > > info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 800x600
> > > info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 800x500
> > > info: found 4 frameintervals for pixel format 56595559 (YUYV) and size 640x400
> > > info: found 8 frameintervals for pixel format 56595559 (YUYV) and size 640x480
> > > info: found 10 framesizes for pixel format 56595559 (YUYV)
> > > info: found 3 formats for buftype 1
> > > test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > > test VIDIOC_G/S_PARM: OK
> > > test VIDIOC_G_FBUF: OK (Not Supported)
> > > fail: v4l2-test-formats.cpp(358): !colorspace
> > > fail: v4l2-test-formats.cpp(465): testColorspace(!node->is_io_mc,
> > > pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pix.quantization)
> > > test VIDIOC_G_FMT: FAIL
> > > fail: v4l2-test-formats.cpp(358): !colorspace
> > > fail: v4l2-test-formats.cpp(465): testColorspace(!node->is_io_mc,
> > > pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pix.quantization)
> > > test VIDIOC_TRY_FMT: FAIL
> > > fail: v4l2-test-formats.cpp(358): !colorspace
> > > fail: v4l2-test-formats.cpp(465): testColorspace(!node->is_io_mc,
> > > pix.pixelformat, pix.colorspace, pix.ycbcr_enc, pix.quantization)
> > > test VIDIOC_S_FMT: FAIL
> > > test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > > test Cropping: OK (Not Supported)
> > > test Composing: OK (Not Supported)
> > > test Scaling: OK (Not Supported)
> > >
> > > Codec ioctls (Input 0):
> > > test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > > test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > > test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > >
> > > Buffer ioctls (Input 0):
> > > info: test buftype Video Capture
> > > test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > > test VIDIOC_EXPBUF: OK
> > > test Requests: OK (Not Supported)
> > >
> > > Total for uvcvideo device /dev/video0: 46, Succeeded: 41, Failed: 5, Warnings: 0
> > > [  124.598214] usb 1-2: uvc_v4l2_open
> > > [  124.693913] usb 1-2: Resuming interface 0
> > > [  124.693927] usb 1-2: Resuming interface 1
> > > [  124.695192] usb 1-2: uvc_v4l2_open
> > > [  124.695378] usb 1-2: uvc_v4l2_open
> > > [  124.695400] usb 1-2: uvc_v4l2_open
> > > [  124.695419] usb 1-2: uvc_v4l2_open
> > > [  124.695437] usb 1-2: uvc_v4l2_open
> > > [  124.695451] usb 1-2: uvc_v4l2_open
> > > [  124.695463] usb 1-2: uvc_v4l2_open
> > > [  124.695497] usb 1-2: uvc_v4l2_open
> > > [  124.695514] usb 1-2: uvc_v4l2_open
> > > [  124.695529] usb 1-2: uvc_v4l2_open
> > > [  124.695540] usb 1-2: uvc_v4l2_open
> > > [  124.695551] usb 1-2: uvc_v4l2_open
> > > [  124.695562] usb 1-2: uvc_v4l2_open
> > > [  124.695573] usb 1-2: uvc_v4l2_open
> > > [  124.695584] usb 1-2: uvc_v4l2_open
> > > [  124.695596] usb 1-2: uvc_v4l2_open
> > > [  124.695607] usb 1-2: uvc_v4l2_open
> > > [  124.695619] usb 1-2: uvc_v4l2_open
> > > [  124.695631] usb 1-2: uvc_v4l2_open
> > > [  124.695642] usb 1-2: uvc_v4l2_open
> > > [  124.695653] usb 1-2: uvc_v4l2_open
> > > [  124.695665] usb 1-2: uvc_v4l2_open
> > > [  124.695676] usb 1-2: uvc_v4l2_open
> > > [  124.695686] usb 1-2: uvc_v4l2_open
> > > [  124.695697] usb 1-2: uvc_v4l2_open
> > > [  124.695708] usb 1-2: uvc_v4l2_open
> > > [  124.695719] usb 1-2: uvc_v4l2_open
> > > [  124.695730] usb 1-2: uvc_v4l2_open
> > > [  124.695740] usb 1-2: uvc_v4l2_open
> > > [  124.695751] usb 1-2: uvc_v4l2_open
> > > [  124.695762] usb 1-2: uvc_v4l2_open
> > > [  124.695773] usb 1-2: uvc_v4l2_open
> > > [  124.695784] usb 1-2: uvc_v4l2_open
> > > [  124.695796] usb 1-2: uvc_v4l2_open
> > > [  124.695807] usb 1-2: uvc_v4l2_open
> > > [  124.695817] usb 1-2: uvc_v4l2_open
> > > [  124.695828] usb 1-2: uvc_v4l2_open
> > > [  124.695839] usb 1-2: uvc_v4l2_open
> > > [  124.695851] usb 1-2: uvc_v4l2_open
> > > [  124.695862] usb 1-2: uvc_v4l2_open
> > > [  124.695873] usb 1-2: uvc_v4l2_open
> > > [  124.695884] usb 1-2: uvc_v4l2_open
> > > [  124.695899] usb 1-2: uvc_v4l2_open
> > > [  124.695909] usb 1-2: uvc_v4l2_open
> > > [  124.695920] usb 1-2: uvc_v4l2_open
> > > [  124.695931] usb 1-2: uvc_v4l2_open
> > > [  124.695942] usb 1-2: uvc_v4l2_open
> > > [  124.695953] usb 1-2: uvc_v4l2_open
> > > [  124.695963] usb 1-2: uvc_v4l2_open
> > > [  124.695974] usb 1-2: uvc_v4l2_open
> > > [  124.695985] usb 1-2: uvc_v4l2_open
> > > [  124.695997] usb 1-2: uvc_v4l2_open
> > > [  124.696008] usb 1-2: uvc_v4l2_open
> > > [  124.696018] usb 1-2: uvc_v4l2_open
> > > [  124.696030] usb 1-2: uvc_v4l2_open
> > > [  124.696041] usb 1-2: uvc_v4l2_open
> > > [  124.696052] usb 1-2: uvc_v4l2_open
> > > [  124.696062] usb 1-2: uvc_v4l2_open
> > > [  124.696073] usb 1-2: uvc_v4l2_open
> > > [  124.696087] usb 1-2: uvc_v4l2_open
> > > [  124.696099] usb 1-2: uvc_v4l2_open
> > > [  124.696109] usb 1-2: uvc_v4l2_open
> > > [  124.696120] usb 1-2: uvc_v4l2_open
> > > [  124.696131] usb 1-2: uvc_v4l2_open
> > > [  124.696141] usb 1-2: uvc_v4l2_open
> > > [  124.696152] usb 1-2: uvc_v4l2_open
> > > [  124.696163] usb 1-2: uvc_v4l2_open
> > > [  124.696174] usb 1-2: uvc_v4l2_open
> > > [  124.696185] usb 1-2: uvc_v4l2_open
> > > [  124.696196] usb 1-2: uvc_v4l2_open
> > > [  124.696207] usb 1-2: uvc_v4l2_open
> > > [  124.696218] usb 1-2: uvc_v4l2_open
> > > [  124.696228] usb 1-2: uvc_v4l2_open
> > > [  124.696239] usb 1-2: uvc_v4l2_open
> > > [  124.696250] usb 1-2: uvc_v4l2_open
> > > [  124.696261] usb 1-2: uvc_v4l2_open
> > > [  124.696272] usb 1-2: uvc_v4l2_open
> > > [  124.696283] usb 1-2: uvc_v4l2_open
> > > [  124.696294] usb 1-2: uvc_v4l2_open
> > > [  124.696305] usb 1-2: uvc_v4l2_open
> > > [  124.696315] usb 1-2: uvc_v4l2_open
> > > [  124.696327] usb 1-2: uvc_v4l2_open
> > > [  124.696338] usb 1-2: uvc_v4l2_open
> > > [  124.696349] usb 1-2: uvc_v4l2_open
> > > [  124.696360] usb 1-2: uvc_v4l2_open
> > > [  124.696371] usb 1-2: uvc_v4l2_open
> > > [  124.696382] usb 1-2: uvc_v4l2_open
> > > [  124.696393] usb 1-2: uvc_v4l2_open
> > > [  124.696403] usb 1-2: uvc_v4l2_open
> > > [  124.696414] usb 1-2: uvc_v4l2_open
> > > [  124.696425] usb 1-2: uvc_v4l2_open
> > > [  124.696435] usb 1-2: uvc_v4l2_open
> > > [  124.696446] usb 1-2: uvc_v4l2_open
> > > [  124.696457] usb 1-2: uvc_v4l2_open
> > > [  124.696480] usb 1-2: uvc_v4l2_open
> > > [  124.696496] usb 1-2: uvc_v4l2_open
> > > [  124.696507] usb 1-2: uvc_v4l2_open
> > > [  124.696518] usb 1-2: uvc_v4l2_open
> > > [  124.696531] usb 1-2: uvc_v4l2_open
> > > [  124.696541] usb 1-2: uvc_v4l2_open
> > > [  124.696552] usb 1-2: uvc_v4l2_open
> > > [  124.696577] usb 1-2: uvc_v4l2_release
> > > [  124.696595] usb 1-2: uvc_v4l2_release
> > > [  124.696608] usb 1-2: uvc_v4l2_release
> > > [  124.696621] usb 1-2: uvc_v4l2_release
> > > [  124.696636] usb 1-2: uvc_v4l2_release
> > > [  124.696649] usb 1-2: uvc_v4l2_release
> > > [  124.696666] usb 1-2: uvc_v4l2_release
> > > [  124.696680] usb 1-2: uvc_v4l2_release
> > > [  124.696695] usb 1-2: uvc_v4l2_release
> > > [  124.696708] usb 1-2: uvc_v4l2_release
> > > [  124.696723] usb 1-2: uvc_v4l2_release
> > > [  124.696736] usb 1-2: uvc_v4l2_release
> > > [  124.696752] usb 1-2: uvc_v4l2_release
> > > [  124.696765] usb 1-2: uvc_v4l2_release
> > > [  124.696779] usb 1-2: uvc_v4l2_release
> > > [  124.696793] usb 1-2: uvc_v4l2_release
> > > [  124.696806] usb 1-2: uvc_v4l2_release
> > > [  124.696820] usb 1-2: uvc_v4l2_release
> > > [  124.696834] usb 1-2: uvc_v4l2_release
> > > [  124.696850] usb 1-2: uvc_v4l2_release
> > > [  124.696863] usb 1-2: uvc_v4l2_release
> > > [  124.696876] usb 1-2: uvc_v4l2_release
> > > [  124.696892] usb 1-2: uvc_v4l2_release
> > > [  124.696905] usb 1-2: uvc_v4l2_release
> > > [  124.696919] usb 1-2: uvc_v4l2_release
> > > [  124.696933] usb 1-2: uvc_v4l2_release
> > > [  124.696949] usb 1-2: uvc_v4l2_release
> > > [  124.696962] usb 1-2: uvc_v4l2_release
> > > [  124.696975] usb 1-2: uvc_v4l2_release
> > > [  124.696990] usb 1-2: uvc_v4l2_release
> > > [  124.697004] usb 1-2: uvc_v4l2_release
> > > [  124.697018] usb 1-2: uvc_v4l2_release
> > > [  124.697032] usb 1-2: uvc_v4l2_release
> > > [  124.697047] usb 1-2: uvc_v4l2_release
> > > [  124.697061] usb 1-2: uvc_v4l2_release
> > > [  124.697076] usb 1-2: uvc_v4l2_release
> > > [  124.697089] usb 1-2: uvc_v4l2_release
> > > [  124.697105] usb 1-2: uvc_v4l2_release
> > > [  124.697118] usb 1-2: uvc_v4l2_release
> > > [  124.697132] usb 1-2: uvc_v4l2_release
> > > [  124.697146] usb 1-2: uvc_v4l2_release
> > > [  124.697163] usb 1-2: uvc_v4l2_release
> > > [  124.697177] usb 1-2: uvc_v4l2_release
> > > [  124.697192] usb 1-2: uvc_v4l2_release
> > > [  124.697206] usb 1-2: uvc_v4l2_release
> > > [  124.697221] usb 1-2: uvc_v4l2_release
> > > [  124.697233] usb 1-2: uvc_v4l2_release
> > > [  124.697246] usb 1-2: uvc_v4l2_release
> > > [  124.697261] usb 1-2: uvc_v4l2_release
> > > [  124.697274] usb 1-2: uvc_v4l2_release
> > > [  124.697288] usb 1-2: uvc_v4l2_release
> > > [  124.697301] usb 1-2: uvc_v4l2_release
> > > [  124.697317] usb 1-2: uvc_v4l2_release
> > > [  124.697330] usb 1-2: uvc_v4l2_release
> > > [  124.697345] usb 1-2: uvc_v4l2_release
> > > [  124.697358] usb 1-2: uvc_v4l2_release
> > > [  124.697373] usb 1-2: uvc_v4l2_release
> > > [  124.697386] usb 1-2: uvc_v4l2_release
> > > [  124.697401] usb 1-2: uvc_v4l2_release
> > > [  124.697414] usb 1-2: uvc_v4l2_release
> > > [  124.697429] usb 1-2: uvc_v4l2_release
> > > [  124.697442] usb 1-2: uvc_v4l2_release
> > > [  124.697457] usb 1-2: uvc_v4l2_release
> > > [  124.697490] usb 1-2: uvc_v4l2_release
> > > [  124.697504] usb 1-2: uvc_v4l2_release
> > > [  124.697520] usb 1-2: uvc_v4l2_release
> > > [  124.697534] usb 1-2: uvc_v4l2_release
> > > [  124.697548] usb 1-2: uvc_v4l2_release
> > > [  124.697562] usb 1-2: uvc_v4l2_release
> > > [  124.697576] usb 1-2: uvc_v4l2_release
> > > [  124.697590] usb 1-2: uvc_v4l2_release
> > > [  124.697605] usb 1-2: uvc_v4l2_release
> > > [  124.697618] usb 1-2: uvc_v4l2_release
> > > [  124.697634] usb 1-2: uvc_v4l2_release
> > > [  124.697647] usb 1-2: uvc_v4l2_release
> > > [  124.697661] usb 1-2: uvc_v4l2_release
> > > [  124.697675] usb 1-2: uvc_v4l2_release
> > > [  124.697691] usb 1-2: uvc_v4l2_release
> > > [  124.697704] usb 1-2: uvc_v4l2_release
> > > [  124.697719] usb 1-2: uvc_v4l2_release
> > > [  124.697733] usb 1-2: uvc_v4l2_release
> > > [  124.697747] usb 1-2: uvc_v4l2_release
> > > [  124.697761] usb 1-2: uvc_v4l2_release
> > > [  124.697777] usb 1-2: uvc_v4l2_release
> > > [  124.697790] usb 1-2: uvc_v4l2_release
> > > [  124.697805] usb 1-2: uvc_v4l2_release
> > > [  124.697819] usb 1-2: uvc_v4l2_release
> > > [  124.697834] usb 1-2: uvc_v4l2_release
> > > [  124.697848] usb 1-2: uvc_v4l2_release
> > > [  124.697862] usb 1-2: uvc_v4l2_release
> > > [  124.697876] usb 1-2: uvc_v4l2_release
> > > [  124.697891] usb 1-2: uvc_v4l2_release
> > > [  124.697905] usb 1-2: uvc_v4l2_release
> > > [  124.697919] usb 1-2: uvc_v4l2_release
> > > [  124.697933] usb 1-2: uvc_v4l2_release
> > > [  124.697948] usb 1-2: uvc_v4l2_release
> > > [  124.697961] usb 1-2: uvc_v4l2_release
> > > [  124.697976] usb 1-2: uvc_v4l2_release
> > > [  124.697990] usb 1-2: uvc_v4l2_release
> > > [  124.698005] usb 1-2: uvc_v4l2_release
> > > [  124.699147] usb 1-2: Control 0x00980001 not found
> > > [  124.699486] usb 1-2: Control 0x009a0001 not found
> > > [  124.699687] usb 1-2: Control 0x00000000 not found
> > > [  124.699781] usb 1-2: Control 0x00980903 not found
> > > [  124.699791] usb 1-2: Control 0x00980904 not found
> > > [  124.699799] usb 1-2: Control 0x00980905 not found
> > > [  124.699807] usb 1-2: Control 0x00980906 not found
> > > [  124.699815] usb 1-2: Control 0x00980907 not found
> > > [  124.699823] usb 1-2: Control 0x00980908 not found
> > > [  124.699831] usb 1-2: Control 0x00980909 not found
> > > [  124.699839] usb 1-2: Control 0x0098090a not found
> > > [  124.699847] usb 1-2: Control 0x0098090b not found
> > > [  124.699883] usb 1-2: Control 0x0098090d not found
> > > [  124.699893] usb 1-2: Control 0x0098090e not found
> > > [  124.699901] usb 1-2: Control 0x0098090f not found
> > > [  124.699937] usb 1-2: Control 0x00980911 not found
> > > [  124.699946] usb 1-2: Control 0x00980912 not found
> > > [  124.699981] usb 1-2: Control 0x00980914 not found
> > > [  124.699990] usb 1-2: Control 0x00980915 not found
> > > [  124.699998] usb 1-2: Control 0x00980916 not found
> > > [  124.700006] usb 1-2: Control 0x00980917 not found
> > > [  124.700055] usb 1-2: Control 0x00980919 not found
> > > [  124.700118] usb 1-2: Control 0x0098091c not found
> > > [  124.700127] usb 1-2: Control 0x0098091d not found
> > > [  124.700135] usb 1-2: Control 0x0098091e not found
> > > [  124.700143] usb 1-2: Control 0x0098091f not found
> > > [  124.700151] usb 1-2: Control 0x00980920 not found
> > > [  124.700159] usb 1-2: Control 0x00980921 not found
> > > [  124.700167] usb 1-2: Control 0x00980922 not found
> > > [  124.700175] usb 1-2: Control 0x00980923 not found
> > > [  124.700183] usb 1-2: Control 0x00980924 not found
> > > [  124.700191] usb 1-2: Control 0x00980925 not found
> > > [  124.700199] usb 1-2: Control 0x00980926 not found
> > > [  124.700207] usb 1-2: Control 0x00980927 not found
> > > [  124.700215] usb 1-2: Control 0x00980928 not found
> > > [  124.700223] usb 1-2: Control 0x00980929 not found
> > > [  124.700231] usb 1-2: Control 0x0098092a not found
> > > [  124.700239] usb 1-2: Control 0x08000000 not found
> > > [  124.700337] usb 1-2: Control 0x00000000 not found
> > > [  124.700360] usb 1-2: Control 0x00980903 not found
> > > [  124.700368] usb 1-2: Control 0x00980904 not found
> > > [  124.700376] usb 1-2: Control 0x00980905 not found
> > > [  124.700384] usb 1-2: Control 0x00980906 not found
> > > [  124.700391] usb 1-2: Control 0x00980907 not found
> > > [  124.700400] usb 1-2: Control 0x00980908 not found
> > > [  124.700407] usb 1-2: Control 0x00980909 not found
> > > [  124.700415] usb 1-2: Control 0x0098090a not found
> > > [  124.700423] usb 1-2: Control 0x0098090b not found
> > > [  124.700435] usb 1-2: Control 0x0098090d not found
> > > [  124.700443] usb 1-2: Control 0x0098090e not found
> > > [  124.700450] usb 1-2: Control 0x0098090f not found
> > > [  124.700463] usb 1-2: Control 0x00980911 not found
> > > [  124.700486] usb 1-2: Control 0x00980912 not found
> > > [  124.700500] usb 1-2: Control 0x00980914 not found
> > > [  124.700508] usb 1-2: Control 0x00980915 not found
> > > [  124.700516] usb 1-2: Control 0x00980916 not found
> > > [  124.700523] usb 1-2: Control 0x00980917 not found
> > > [  124.700535] usb 1-2: Control 0x00980919 not found
> > > [  124.700552] usb 1-2: Control 0x0098091c not found
> > > [  124.700560] usb 1-2: Control 0x0098091d not found
> > > [  124.700568] usb 1-2: Control 0x0098091e not found
> > > [  124.700575] usb 1-2: Control 0x0098091f not found
> > > [  124.700583] usb 1-2: Control 0x00980920 not found
> > > [  124.700591] usb 1-2: Control 0x00980921 not found
> > > [  124.700599] usb 1-2: Control 0x00980922 not found
> > > [  124.700606] usb 1-2: Control 0x00980923 not found
> > > [  124.700614] usb 1-2: Control 0x00980924 not found
> > > [  124.700621] usb 1-2: Control 0x00980925 not found
> > > [  124.700629] usb 1-2: Control 0x00980926 not found
> > > [  124.700637] usb 1-2: Control 0x00980927 not found
> > > [  124.700644] usb 1-2: Control 0x00980928 not found
> > > [  124.700652] usb 1-2: Control 0x00980929 not found
> > > [  124.700659] usb 1-2: Control 0x0098092a not found
> > > [  124.700667] usb 1-2: Control 0x08000000 not found
> > > [  124.706304] usb 1-2: uvc_v4l2_poll
> > > [  124.706461] usb 1-2: uvc_v4l2_poll
> > > [  124.706526] usb 1-2: uvc_v4l2_poll
> > > [  124.706572] usb 1-2: uvc_v4l2_poll
> > > [  124.706613] usb 1-2: uvc_v4l2_poll
> > > [  124.706654] usb 1-2: uvc_v4l2_poll
> > > [  124.706694] usb 1-2: uvc_v4l2_poll
> > > [  124.706735] usb 1-2: uvc_v4l2_poll
> > > [  124.706775] usb 1-2: uvc_v4l2_poll
> > > [  124.706905] usb 1-2: uvc_v4l2_poll
> > > [  124.706947] usb 1-2: uvc_v4l2_poll
> > > [  124.706985] usb 1-2: uvc_v4l2_poll
> > > [  124.707143] usb 1-2: uvc_v4l2_poll
> > > [  124.707183] usb 1-2: uvc_v4l2_poll
> > > [  124.707309] usb 1-2: uvc_v4l2_poll
> > > [  124.707352] usb 1-2: uvc_v4l2_poll
> > > [  124.709008] usb 1-2: Setting frame interval to 0/0 (4294967295)
> > > [  124.709424] usb 1-2: Setting frame interval to 0/1 (0)
> > > [  124.709856] usb 1-2: Setting frame interval to 1/0 (4294967295)
> > > [  124.710572] usb 1-2: Trying format 0x47504a4d (MJPG): 640x480
> > > [  124.710583] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
> > > [  124.711081] usb 1-2: Trying format 0xffffffff (\xff\xff\xff\xff):
> > > 4294967295x4294967295
> > > [  124.711095] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
> > > [  124.711676] usb 1-2: Trying format 0x47504a4d (MJPG): 1x1
> > > [  124.711685] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
> > > [  124.712123] usb 1-2: Trying format 0x47504a4d (MJPG): 16384x16384
> > > [  124.712131] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
> > > [  124.712568] usb 1-2: Trying format 0x47504a4d (MJPG): 1920x1080
> > > [  124.712576] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
> > > [  124.713170] usb 1-2: uvc_v4l2_release
> > > [  124.713206] usb 1-2: uvc_v4l2_open
> > > [  124.722494] usb 1-2: uvc_v4l2_release
> > > [  124.722528] usb 1-2: uvc_v4l2_open
> > > [  124.725391] usb 1-2: Setting frame interval to 1/1000 (10000)
> > > [  124.725946] usb 1-2: uvc_v4l2_release
> > > [  124.725961] usb 1-2: uvc_v4l2_open
> > > [  124.725998] usb 1-2: uvc_v4l2_release
> > > [  124.726009] usb 1-2: uvc_v4l2_open
> > > [  124.726034] usb 1-2: Trying format 0x47504a4d (MJPG): 640x480
> > > [  124.726040] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
> > > [  124.726416] usb 1-2: Setting frame interval to 1/30 (333333)
> > > [  124.726781] usb 1-2: uvc_v4l2_release
> > > [  124.726794] usb 1-2: uvc_v4l2_open
> > > [  124.726818] usb 1-2: uvc_v4l2_release
> > > [  124.726829] usb 1-2: uvc_v4l2_open
> > > [  124.726849] usb 1-2: Trying format 0x47504a4d (MJPG): 640x480
> > > [  124.726853] usb 1-2: Using default frame interval 33333.3 us (30.0 fps)
> > > [  124.727215] usb 1-2: Setting frame interval to 1/30 (333333)
> > > [  124.727571] usb 1-2: uvc_v4l2_release
> > > [  124.727583] usb 1-2: uvc_v4l2_open
> > > [  124.727618] usb 1-2: uvc_v4l2_release
> > > [  124.727627] usb 1-2: uvc_v4l2_release
> > > [  126.780964] usb 1-2: Suspending interface 1
> > > [  126.780978] usb 1-2: Suspending interface 0
> > >
> > > On Thu, Nov 11, 2021 at 1:32 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
> > > >
> > > > This patchset contains the fixes for the comments on "v10 of Fix
> > > > v4l2-compliance errors series". In particular to the patches
> > > >
> > > > -uvcvideo: uvc_ctrl_is_accessible: check for INACTIVE
> > > > -uvcvideo: improve error handling in uvc_query_ctrl()
> > > >
> > > >
> > > > Hans Verkuil (2):
> > > >   media: uvcvideo: uvc_ctrl_is_accessible: check for INACTIVE
> > > >   media: uvcvideo: improve error logging in uvc_query_ctrl()
> > > >
> > > > Ricardo Ribalda (2):
> > > >   media: uvcvideo: Return -EACCES for Wrong state error
> > > >   media: uvcvideo: Do not return positive errors in uvc_query_ctrl()
> > > >
> > > >  drivers/media/usb/uvc/uvc_ctrl.c  | 47 ++++++++++++++++++++++++++++++-
> > > >  drivers/media/usb/uvc/uvc_v4l2.c  |  4 +--
> > > >  drivers/media/usb/uvc/uvc_video.c | 15 +++++-----
> > > >  drivers/media/usb/uvc/uvcvideo.h  |  3 +-
> > > >  4 files changed, 58 insertions(+), 11 deletions(-)
> > > >
> > > > --
> > > > 2.33.0.153.gba50c8fa24-goog
> > > >
> > > >
> >
> >
> >
> > --
> > Ricardo Ribalda



-- 
Ricardo Ribalda
