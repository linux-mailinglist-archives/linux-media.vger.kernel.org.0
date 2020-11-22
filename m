Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6D1B2BC8C2
	for <lists+linux-media@lfdr.de>; Sun, 22 Nov 2020 20:35:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbgKVTeb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Nov 2020 14:34:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727307AbgKVTe2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Nov 2020 14:34:28 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 515E8C0613CF
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2020 11:34:27 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id n12so10453416otk.0
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2020 11:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google;
        h=from:message-id:subject:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=I2PfFj17Ov/GEX7G4flBd22N5tZmj0BtXl931kRWchk=;
        b=XFtI2hIRMZx7SfwacBzH2vYRgSPHdjFPqm1FL1uGwjW4VJ/A2xakRqC3G6vvwrMbIE
         MXnP3FsFLiTDkBxcyF+xC1B2egPjNsx6XUTZQ0ak1aZ55FOORaHm4b6tr2GEleCmDVOg
         8ntlWeRKUZ0IF9SC0xtd7qvxRWPceM9+MHZ/hziuDVjo/Mq6fAFXhBOxoDfpEYFsFL2N
         7BpPQkPZU2YW6Cg/RvtaNMJ6qsL6NHQ0XHYnFJgWNYtMej2UhYQHeyEVxMEUTTRSWi6w
         2Q6Ykdx/AJ1TGy3TeERIs+NouOkvHr2KtCFaNPgh7ZTo3Tqel3y7va+cRXHlYQd34FIr
         6VWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=I2PfFj17Ov/GEX7G4flBd22N5tZmj0BtXl931kRWchk=;
        b=KcSH/1UJfv+UFtv4ghpEFk4WvSEuI3FGMX1Bu7vIoi46swWGRaGlEv1gN+PeAOKrkz
         1Myd2U1q0oQris9MxrwIOlYxJ5zj14QWnamqKdSTzQ8nmbwgCl/fK98P/2l60LYshKKM
         5LMt+zWT7MWo0EANW0P62ZeSjq43uqX8Mrr1cV2Aq0Vaw38q86jFFIcdQOAMSxjdLLYh
         X2Oj6xVB4pokrq3zEo0Dqv0VbeQ8+Ff2VdADOuxy36fgHPnNtNHZrzxxHAv/YTHKz+j8
         RCxTWFcsV2dixyBuf1EmhUp+OM0+ZK3wSySqFHh0QqZcohvK7n0pPRN6OXmBrpfjKqiO
         zxJw==
X-Gm-Message-State: AOAM530Q8OoONGOeWnR7IzavS0EgCNdpWDyl2SPdsJNXkrPKjvMzxtn9
        6HXvFVl4YBYhIh35OgiaqRLrdA==
X-Google-Smtp-Source: ABdhPJxHDOjP4pzspt3ZVc76pkTdShzEI6DISP/OuRXxhK5wzlLEikydfZSpD65MaltEmClY87Cc9A==
X-Received: by 2002:a9d:5186:: with SMTP id y6mr4128833otg.193.1606073665569;
        Sun, 22 Nov 2020 11:34:25 -0800 (PST)
Received: from fiftytwodotfive.bdrung.de (ip5b401b14.dynamic.kabel-deutschland.de. [91.64.27.20])
        by smtp.googlemail.com with ESMTPSA id o63sm6123070ooa.10.2020.11.22.11.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 11:34:24 -0800 (PST)
From:   Benjamin Drung <benjamin.drung@cloud.ionos.com>
X-Google-Original-From: Benjamin Drung <bdrung@debian.org>
Message-ID: <a443a3e8633b9be921b365764147f296d0f16f76.camel@debian.org>
Subject: Re: PROBLEM: Broken pixel format for Elgato Cam Link 4K
To:     Adam Goode <agoode@google.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Date:   Sun, 22 Nov 2020 20:34:21 +0100
In-Reply-To: <CAOf41N=PopZ=8_05e9WfvWkBhuN5iRq1=JJ2KqkLJE5S3-XW5A@mail.gmail.com>
References: <5ff0fc487272a7c21f63a929bfceee1ac9b43348.camel@debian.org>
         <CAOf41N=PopZ=8_05e9WfvWkBhuN5iRq1=JJ2KqkLJE5S3-XW5A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Freitag, den 20.11.2020, 16:45 -0500 schrieb Adam Goode:
> On Fri, Nov 20, 2020 at 1:52 PM Benjamin Drung
> <benjamin.drung@cloud.ionos.com> wrote:
> > 
> > Hi,
> > 
> > I own an Elgato Cam Link 4K which is a very popular USB HDMI
> > capture
> > device (number one capture card by click rates on Geizhals [1]).
> > The
> > problem is that the video feed is distorted when using the
> > /dev/videoX
> > device in the browser (tested on Firefox and Chromium) for video
> > conferencing (tested with Jitsi Meet and Google Meet). The same
> > distortion is present when opening `v4l2:///dev/video0` with VLC.
> > 
> > The Elgato Cam Link 4K reports to have three different pixel
> > formats:
> > 
> > ```
> > $ v4l2-ctl -d /dev/video0 --list-formats-ext
> > ioctl: VIDIOC_ENUM_FMT
> >         Type: Video Capture
> > 
> >         [0]: 'NV12' (Y/CbCr 4:2:0)
> >                 Size: Discrete 3840x2160
> >                         Interval: Discrete 0.040s (25.000 fps)
> >         [1]: 'NV12' (Y/CbCr 4:2:0)
> >                 Size: Discrete 3840x2160
> >                         Interval: Discrete 0.040s (25.000 fps)
> >         [2]: 'YU12' (Planar YUV 4:2:0)
> >                 Size: Discrete 3840x2160
> >                         Interval: Discrete 0.040s (25.000 fps)
> > ```
> > 
> > When specifying the video format 'YU12' to VLC, the video is
> > distorted
> > the same way as using the default video format. When specifying
> > 'NV12'
> > to VLC, the video feed is displayed correctly:
> > 
> > ```
> > vlc v4l2:///dev/video0 --v4l2-chroma=NV12
> > ```
> > 
> > In OBS, the video feed is always displayed correctly. All video
> > formats
> > 'Y/CbCr 4:2:0', 'Planar YUV 4:2:0', 'BGR3 (Emulated)', and 'YV12
> > (Emulated)' combined with the color ranges 'Default', 'Partial',
> > and
> > 'Full' produce the same correct output.
> > 
> > With Linux >= 5.9 this behavior in OBS changes: The video format
> > 'Y/CbCr 4:2:0' displays the video correctly. Switching to 'Planar
> > YUV
> > 4:2:0', 'BGR3 (Emulated)', or 'YV12 (Emulated)' shows the video
> > distorted and OBS shows this error message:
> > 
> > ```
> > info: v4l2-input: Pixelformat: NV12
> > [...]
> > libv4l2: error set_fmt gave us a different result than try_fmt!
> > info: v4l2-input: Resolution: 3840x2160
> > info: v4l2-input: Pixelformat: NV12
> > ```
> > 
> > Changing the video format back does not have an effect until I also
> > change the color range (does seem to be relevant what to select
> > there).
> > 
> > Workaround
> > ----------
> > 
> > You can create a v4l2loopback device and use ffmpeg to stream from
> > the
> > Cam Link 4K to the loopback device:
> > 
> > ```
> > ffmpeg -f v4l2 -input_format yuv420p -video_size 3840x2160 \
> >   -i "$camlink" -codec copy -f v4l2 "$loopdev"
> > ```
> > 
> > This workaround works, but is cumbersome and burns CPU cycles.
> > 
> > Other reports
> > -------------
> > 
> > Searching the web for "Cam Link 4K Linux" reveals many similar
> > reports
> > like this. Noteworthy is blog post [3] from Mike Walters who
> > patched
> > the Cam Link 4K firmware to report the correct video format. I am
> > willing to debug this issue and do test, but I don't want to flash
> > the
> > firmware to not break the warrenty (bisides I lack the hardware for
> > flashing).
> > 
> > Environment
> > -----------
> > 
> > This problem is present in Ubuntu 20.04 with linux 5.4.0-54.60 and
> > Ubuntu 20.10 with linux 5.8.0-29.31. I also tested the mainline
> > kernels
> > builds 5.9.8-050908.202011101634 and 5.10.0-051000rc4.202011152030
> > from
> > Ubuntu [2].
> > 
> > The Cam Link 4K shows follow entries in dmesg:
> > 
> > ```
> > [    1.575753] usb 2-3: new SuperSpeed Gen 1 USB device number 2
> > using xhci_hcd
> > [    1.596664] usb 2-3: LPM exit latency is zeroed, disabling LPM.
> > [    1.598557] usb 2-3: New USB device found, idVendor=0fd9,
> > idProduct=0066, bcdDevice= 0.00
> > [    1.598558] usb 2-3: New USB device strings: Mfr=1, Product=2,
> > SerialNumber=4
> > [    1.598559] usb 2-3: Product: Cam Link 4K
> > [    1.598560] usb 2-3: Manufacturer: Elgato
> > ```
> > 
> > I have another problems with 5.9.8-050908.202011101634 and 5.10.0-
> > 051000rc4.202011152030: Chromium fail to access the video device of
> > Cam
> > Link 4K and the notebook integrated webcam has a too low
> > brightness.
> > 
> > [1] https://geizhals.de/?cat=vidext
> > [2] https://kernel.ubuntu.com/~kernel-ppa/mainline/
> > [3] 
> > https://assortedhackery.com/patching-cam-link-to-play-nicer-on-linux/
> > 
> > --
> > Benjamin Drung
> > Debian & Ubuntu Developer
> > 
> 
> 
> Hi,
> 
> I am running on Fedora 32 which has the fix I wrote for the buggy
> elgato firmware. The bug in the firmware makes it impossible to
> properly select a non-0 pixel format when following the UVC
> negotiation protocol. This is because the firmware returns the pixel
> format in the wrong byte of the packet. The driver was following the
> UVC protocol but did not send the pixel format back to the v4l2
> subsystem. It does that now.
> 
> I'm not surprised that other bugs are emerging now. Ultimately the
> firmware is buggy and announces pixel formats that it then rejects.
> If
> I flip through the settings in OBS, I do manage to wedge the
> interface. But most of the programs I've seen that use v4l2 are buggy
> in this way. A reliable one is the qv4l2 test program. I've also had
> no problems with Chromium.
> 
> That reverse engineering is interesting! But I think it hides the
> real
> problem, where the pixel format negotiation on the firmware writes
> into the wrong byte of the packet.

Hi Adam,

you are talking about commit ec2c23f628802317f73fab5255cc62a776bc7930
and 8a652a17e3c005dcdae31b6c8fdf14382a29cbbe that are part of
v5.10-rc1?

What do you suggest to fix the issue? Should I contact Elgato
requesting a firmware update? Can the kernel ship a quirk for the Cam
Link 4K to workaround the firmware bug? I would be happy to try out
patches.

I tested the qv4l2 with Linux 5.10.0-051000rc4.202011152030. When using
the default settings, it displays the video correctly, but with a
vertical green one-pixel-wide line. The terminal prints "error" four
times. Sadly there is no debug mode to figure out where that error
comes from.

Selecting "YU12 (Planar YUV 4:2:0)" print the following error message
and switches back to the previous format:

libv4l2: error set_fmt gave us a different result than try_fmt!

--
Benjamin Drung
Debian & Ubuntu Developer

