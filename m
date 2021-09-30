Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D173741DB85
	for <lists+linux-media@lfdr.de>; Thu, 30 Sep 2021 15:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350969AbhI3Nyx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Sep 2021 09:54:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349986AbhI3Nyx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Sep 2021 09:54:53 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01CF1C06176A
        for <linux-media@vger.kernel.org>; Thu, 30 Sep 2021 06:53:09 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id s17so22155005edd.8
        for <linux-media@vger.kernel.org>; Thu, 30 Sep 2021 06:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=DpNatpzmZdPp3trvDvY8M9RRfZbScUxFDz7vEBQ/aw8=;
        b=O1x1AOK2Pxu6HAI8HdYMPjwVhqCgxBfekSuxuNUgLHTkDqYWvhcg1B8SAdAkjQLrrw
         HX33pKkXxh/nK52y9k0pe1IKDyGm+9ZNVkeEbaBxlI1vpf1xQf0JlapS2i/rDbp52sdM
         zl9ciibbm1mws7DubXsQj7b1LWpZCSfIJGmqfJfb62v52/96o9Jxo7YToGehKzmp9wAw
         NHUYXM0c4WJmb72HIX2R/U6fH/1yepWswyrBut6tywyUqibQ56ddPR8d1/+VO3zviNr8
         ZBVnmTu900ZbhFSuOMu2weFMKLFS0qDr/ZbVtZT/sFuXqdxet6T+qFPPWgPC5/4qdv2a
         Xk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=DpNatpzmZdPp3trvDvY8M9RRfZbScUxFDz7vEBQ/aw8=;
        b=WqRhP6UPnEwbtnK4uaMeI2VtHL7p0TRnk91vRYvgSzGLpkc5kQONucWVT/uMu7JuD2
         /6urlT8PIGfUu0/9KApbnb9WCVq0KpHo/wPFg1nERnh/6OJhz/EbX7xVVtO1FxRdmndf
         NcKPpvWCwSDkEnqYAQDa1LUPlqbEmyEr/XmMPVGzMhYCA4X9+TcbY+8tYiUw8PflQqnJ
         xz1kEv1LF/F1evQeH21RdXrx7ZyH1y1l6dK/QMZIC/H23YfUtEmrRgFmS+sO5VcOKTv/
         jQL4MBz9FLxf4FBuTWpRsewowVgMCGj94xAtJN0OSGwSBBpArE3HfBb7ELotrSSsr70r
         TnCA==
X-Gm-Message-State: AOAM531OGFcXquX14TbSjzpDsTXyQPxDZ7TZKxujHghVHfdX3Xor26x1
        C1zR08VR63JJLKWFjAU3NTegClbNdfLAHA==
X-Google-Smtp-Source: ABdhPJxBm+DdwwLy47ASdRGA2zkdw/QVBULTdVKT2YKAtftEcZX6aq8vQKcTrzkpFlYGtSb22h6u8Q==
X-Received: by 2002:a17:906:4892:: with SMTP id v18mr6923121ejq.145.1633009944415;
        Thu, 30 Sep 2021 06:52:24 -0700 (PDT)
Received: from toninux ([91.86.65.165])
        by smtp.gmail.com with ESMTPSA id y3sm1890880eda.9.2021.09.30.06.52.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 06:52:24 -0700 (PDT)
Date:   Thu, 30 Sep 2021 15:51:22 +0200
From:   Debucquoy Anthony <d.tonitch@gmail.com>
To:     linux-media@vger.kernel.org
Subject: Grabster AV 350 no audio
Message-ID: <YVXA2vZtsdzJD5Vs@toninux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

I have currently have a (Grabster AV 350)
[https://www.terratec.de/details.php?artnr=10599&lang=en]
(and 300 that work even less but I will do another thread for it I think) 

I can easily get video output out of it with /dev/video0 but the problem
is that I can't get audio by any way

I looked a lot on internet and some peoples have the same problem...
some of them has sucessfully fixed their issue by setting modprobe
card=67 instead of the default 68. witch doesn't work for me!

I do have the card that shows on alsa and pulseaudio but there is no
sound (it's not muted, I checked) this really looks like a kernel issue
(even tho i'm not an experienced linux dev) but I really don't know kind
of info I can give you to help! I asked IRC tho

> 14:08 < tonitch> Hello, I want to request a device to be patched in the
> kernel... i'm not a programmer and don't know how to do it myself... on
> the linux-media wiki they say that I can send a mail to the
> linux-media mailing list... do you know what kind of
> info I can get from my device to help ?

> 15:06 < ndufresne> tonitch: If you do avoid "device" ,
> it too vague, if you it is a camera, call it a camera,
> if its acquisition, call it acquisition, explain the
> problem and errors you are getting with the
> details you understand, folks over
> the ML will ask you for more details
> when they start to understand what
> you are dealing with

At least, here is the dmesg when I plus it then unplug it

```
[ 7275.000357 ] em28xx 1-8:1.0: New device  Grabster AV 350 @ 480 Mbps
(0ccd:0084, interface 0, class 0)
[ 7275.000361 ] em28xx 1-8:1.0: Video interface 0 found: isoc
[ 7275.064334 ] em28xx 1-8:1.0: chip ID is em2860
[ 7275.284387 ] em28xx 1-8:1.0: EEPROM ID = 1a eb 67 95, EEPROM hash =
0x618085a2
[ 7275.284394 ] em28xx 1-8:1.0: EEPROM info:
[ 7275.284395 ] em28xx 1-8:1.0:  AC97 audio (5 sample rates)
[ 7275.284397 ] em28xx 1-8:1.0:  500mA max power
[ 7275.284398 ] em28xx 1-8:1.0:  Table at offset 0x04, strings=0x226a,
0x0000, 0x0000
[ 7275.368159 ] em28xx 1-8:1.0: Identified as Terratec AV350 (card=68)
[ 7275.368163 ] em28xx 1-8:1.0: analog set to isoc mode.
[ 7275.368192 ] em28xx 1-8:1.0: Registering V4L2 extension
[ 7275.497387 ] tvp5150 9-005c: tvp5150 (4.0) chip found @ 0xb8 (1-8:1.0)
[ 7275.497396 ] tvp5150 9-005c: tvp5150am1 detected.
[ 7278.429769 ] em28xx 1-8:1.0: Config register raw data: 0x50
[ 7278.470775 ] em28xx 1-8:1.0: AC97 vendor ID = 0x83847666
[ 7278.490776 ] em28xx 1-8:1.0: AC97 features = 0x6a90
[ 7278.490782 ] em28xx 1-8:1.0: Sigmatel audio processor detected (stac
9766)
[ 7284.285398 ] em28xx 1-8:1.0: V4L2 video device registered as video0
[ 7284.285404 ] em28xx 1-8:1.0: V4L2 VBI device registered as vbi0
[ 7284.285410 ] em28xx 1-8:1.0: V4L2 extension successfully initialized


[ 7287.548339 ] usb 1-8: USB disconnect, device number 5
[ 7287.548414 ] em28xx 1-8:1.0: Disconnecting em28xx
[ 7287.548419 ] em28xx 1-8:1.0: Closing video extension
[ 7287.555578 ] em28xx 1-8:1.0: cannot change alternate number to 0
(error=-71)
[ 7287.555603 ] em28xx 1-8:1.0: V4L2 device vbi0 deregistered
[ 7287.555675 ] em28xx 1-8:1.0: V4L2 device video0 deregistered
[ 7287.555896 ] em28xx 1-8:1.0: Freeing device

```

Hope for the best!

Debucquoy Anthony (tonitch)
