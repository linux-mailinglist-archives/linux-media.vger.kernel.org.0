Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7602BB894
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 22:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728002AbgKTVpq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 16:45:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726426AbgKTVpq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 16:45:46 -0500
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E001BC061A04
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 13:45:45 -0800 (PST)
Received: by mail-yb1-xb41.google.com with SMTP id t33so9920371ybd.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2020 13:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MUNSzIysyOtHGRvS1Q0seQIvDGj5F7ggrvJWqiZgbhU=;
        b=s9Pxp8RRhw1tSzuuJj/cVBeN7uGSWSGSjHhU63AEzivzhHPEW73kYkn+9PcWWsSAmg
         1TW6jJP9HVNCcWJNE8LtZinCXzgItJ4SHNBoBqjFxj5Bp9kxwI+PfRk5lHGTQIImxfkv
         EkXmQ1RDTtiQ0ukLJ+LXHUsj5HhQdmH6W+7WurNyXPGSEVglOonjda0cXN1H9bL6RHNy
         HrkwN6TPr++90fDmKqrFB3NabCYvhP4L+hWdnPFD5W5HtjAyxv7xOIgKUtMwlbQtOhDi
         W5qCyyfW8o6HPElzSLhE31Zhtl5jzUBHII2E52HMnjwCWBB5nQA8YUdy/ZyjjOBlliD9
         Ijuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MUNSzIysyOtHGRvS1Q0seQIvDGj5F7ggrvJWqiZgbhU=;
        b=pgFddHiC6ZTjVa+OV62nxR9LYPoBDXU+MonTMhIPtRdartWkpKPQY8BpNhPlCjY38+
         CYHhO8biXSr1Ve0YaO5PhR+D4Xs37Q7FeMFzb3BofrvhZspmk6qHCJGYWtgN/zHlnCsZ
         M+i0Yp2pT7efwXIOJjiamx1s4w1lX+Vt7AJ4ycPS5BonLTxtzcYmOeWMz1LVBJR+HSi4
         ScLw3TGI/97OeQdfSQ1NTUJZhSfS3aVn8moT2jc/o+PP+tgixd+Cy+gmcSnCHXqmgLat
         lTlE6f1Fbd/Z2DUtemrSfG5lS9/ivTU59WOwrNBaVSisdcJ5Zn8F0pdpi8e0/u6rAsz8
         zMvA==
X-Gm-Message-State: AOAM5336TF857UE4YcVipF6BSz2lTXNiKFJ21Fq9ei5bTOV8hcyavf/y
        0OVfP7/3QAgtipuMckMwJCxR4a5E+UJexCH2LZG2WQ==
X-Google-Smtp-Source: ABdhPJz8VYL/knv6Gy5VdWHumNKk0t2Ym33EHs6QsRJif6lZk0dNntTX+KUCqACbEHQTIXy2oKg1Vqs3521JMtzguU4=
X-Received: by 2002:a25:d34a:: with SMTP id e71mr33925433ybf.229.1605908744747;
 Fri, 20 Nov 2020 13:45:44 -0800 (PST)
MIME-Version: 1.0
References: <5ff0fc487272a7c21f63a929bfceee1ac9b43348.camel@debian.org>
In-Reply-To: <5ff0fc487272a7c21f63a929bfceee1ac9b43348.camel@debian.org>
From:   Adam Goode <agoode@google.com>
Date:   Fri, 20 Nov 2020 16:45:09 -0500
Message-ID: <CAOf41N=PopZ=8_05e9WfvWkBhuN5iRq1=JJ2KqkLJE5S3-XW5A@mail.gmail.com>
Subject: Re: PROBLEM: Broken pixel format for Elgato Cam Link 4K
To:     Benjamin Drung <benjamin.drung@cloud.ionos.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 20, 2020 at 1:52 PM Benjamin Drung
<benjamin.drung@cloud.ionos.com> wrote:
>
> Hi,
>
> I own an Elgato Cam Link 4K which is a very popular USB HDMI capture
> device (number one capture card by click rates on Geizhals [1]). The
> problem is that the video feed is distorted when using the /dev/videoX
> device in the browser (tested on Firefox and Chromium) for video
> conferencing (tested with Jitsi Meet and Google Meet). The same
> distortion is present when opening `v4l2:///dev/video0` with VLC.
>
> The Elgato Cam Link 4K reports to have three different pixel formats:
>
> ```
> $ v4l2-ctl -d /dev/video0 --list-formats-ext
> ioctl: VIDIOC_ENUM_FMT
>         Type: Video Capture
>
>         [0]: 'NV12' (Y/CbCr 4:2:0)
>                 Size: Discrete 3840x2160
>                         Interval: Discrete 0.040s (25.000 fps)
>         [1]: 'NV12' (Y/CbCr 4:2:0)
>                 Size: Discrete 3840x2160
>                         Interval: Discrete 0.040s (25.000 fps)
>         [2]: 'YU12' (Planar YUV 4:2:0)
>                 Size: Discrete 3840x2160
>                         Interval: Discrete 0.040s (25.000 fps)
> ```
>
> When specifying the video format 'YU12' to VLC, the video is distorted
> the same way as using the default video format. When specifying 'NV12'
> to VLC, the video feed is displayed correctly:
>
> ```
> vlc v4l2:///dev/video0 --v4l2-chroma=NV12
> ```
>
> In OBS, the video feed is always displayed correctly. All video formats
> 'Y/CbCr 4:2:0', 'Planar YUV 4:2:0', 'BGR3 (Emulated)', and 'YV12
> (Emulated)' combined with the color ranges 'Default', 'Partial', and
> 'Full' produce the same correct output.
>
> With Linux >= 5.9 this behavior in OBS changes: The video format
> 'Y/CbCr 4:2:0' displays the video correctly. Switching to 'Planar YUV
> 4:2:0', 'BGR3 (Emulated)', or 'YV12 (Emulated)' shows the video
> distorted and OBS shows this error message:
>
> ```
> info: v4l2-input: Pixelformat: NV12
> [...]
> libv4l2: error set_fmt gave us a different result than try_fmt!
> info: v4l2-input: Resolution: 3840x2160
> info: v4l2-input: Pixelformat: NV12
> ```
>
> Changing the video format back does not have an effect until I also
> change the color range (does seem to be relevant what to select there).
>
> Workaround
> ----------
>
> You can create a v4l2loopback device and use ffmpeg to stream from the
> Cam Link 4K to the loopback device:
>
> ```
> ffmpeg -f v4l2 -input_format yuv420p -video_size 3840x2160 \
>   -i "$camlink" -codec copy -f v4l2 "$loopdev"
> ```
>
> This workaround works, but is cumbersome and burns CPU cycles.
>
> Other reports
> -------------
>
> Searching the web for "Cam Link 4K Linux" reveals many similar reports
> like this. Noteworthy is blog post [3] from Mike Walters who patched
> the Cam Link 4K firmware to report the correct video format. I am
> willing to debug this issue and do test, but I don't want to flash the
> firmware to not break the warrenty (bisides I lack the hardware for
> flashing).
>
> Environment
> -----------
>
> This problem is present in Ubuntu 20.04 with linux 5.4.0-54.60 and
> Ubuntu 20.10 with linux 5.8.0-29.31. I also tested the mainline kernels
> builds 5.9.8-050908.202011101634 and 5.10.0-051000rc4.202011152030 from
> Ubuntu [2].
>
> The Cam Link 4K shows follow entries in dmesg:
>
> ```
> [    1.575753] usb 2-3: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd
> [    1.596664] usb 2-3: LPM exit latency is zeroed, disabling LPM.
> [    1.598557] usb 2-3: New USB device found, idVendor=0fd9, idProduct=0066, bcdDevice= 0.00
> [    1.598558] usb 2-3: New USB device strings: Mfr=1, Product=2, SerialNumber=4
> [    1.598559] usb 2-3: Product: Cam Link 4K
> [    1.598560] usb 2-3: Manufacturer: Elgato
> ```
>
> I have another problems with 5.9.8-050908.202011101634 and 5.10.0-
> 051000rc4.202011152030: Chromium fail to access the video device of Cam
> Link 4K and the notebook integrated webcam has a too low brightness.
>
> [1] https://geizhals.de/?cat=vidext
> [2] https://kernel.ubuntu.com/~kernel-ppa/mainline/
> [3] https://assortedhackery.com/patching-cam-link-to-play-nicer-on-linux/
>
> --
> Benjamin Drung
> Debian & Ubuntu Developer
>


Hi,

I am running on Fedora 32 which has the fix I wrote for the buggy
elgato firmware. The bug in the firmware makes it impossible to
properly select a non-0 pixel format when following the UVC
negotiation protocol. This is because the firmware returns the pixel
format in the wrong byte of the packet. The driver was following the
UVC protocol but did not send the pixel format back to the v4l2
subsystem. It does that now.

I'm not surprised that other bugs are emerging now. Ultimately the
firmware is buggy and announces pixel formats that it then rejects. If
I flip through the settings in OBS, I do manage to wedge the
interface. But most of the programs I've seen that use v4l2 are buggy
in this way. A reliable one is the qv4l2 test program. I've also had
no problems with Chromium.

That reverse engineering is interesting! But I think it hides the real
problem, where the pixel format negotiation on the firmware writes
into the wrong byte of the packet.


Adam
