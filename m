Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED432C4950
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 21:48:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730941AbgKYUsD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 15:48:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730677AbgKYUsD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 15:48:03 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D297C0613D4
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 12:48:03 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id a9so5030019lfh.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2020 12:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Bf4FOjqmsHgAg1Qq/EvXB2Yo4B0pTpDSZVrOLHiTksI=;
        b=lOSSkGUQ/zeddX4wWB8IyKaU9XwrWkw47U9om5Ic3FhPZ4N860ecMnJs0J+TtBpQ0x
         a+p40MDGzpcHh/0Ka86Rtmd8XMakQH8CPErs5De9jUKt3GhUNJ3kdH6KfjIFROF+84tL
         pNP6D3XPh3kjsHJxQgqWG6MUQayaQwGd9qHxAc6paBl3vsED5bJcxbijABW1LMnoct+6
         GVVFMffo6W0azCXqxC08YM/I7Q23ZMYj7PZYQZi1g0bRY8nR2lhyXsG/QBKq9dkIG/0y
         wzZf5xtRkKXr+ucvf/JaoUhibWxCIiHb1X0LmC2GSnrAk6lEBaFJO1DOXEhMfqtxCaAx
         aulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Bf4FOjqmsHgAg1Qq/EvXB2Yo4B0pTpDSZVrOLHiTksI=;
        b=A8UgCmnMxIy0vDY8ByUfNCK3T0LVCQhenu6KC6zDtd1OXHjO4JFJ2Wq7px/6pLwt1w
         rT2okpLn9bgsB2L86qlgxGG/sZ0Smg/wbHr3bP1+SREs37r5N5OHa7cwY+tbwYS73GUU
         jTcfR79pa//C4bGVRYQtvez24gkvxIVfi82HU6nym1LpLYcavdoofrRNcMGw8f69N716
         G9pZWAAq047VUHscK/bmqXY/uXKgjih0721CJSKN+r8+SrUqrHWntn1X15ZBEFqkKNsb
         WQp6xJWRHjCYsKhgF8dRksu1XzEihaB3tu3GCBjc82Bo5XbNCwHPF/UgfIyYyhRR5ahe
         pb5w==
X-Gm-Message-State: AOAM533DUpj1wzK1mceF+eb/XXynnuAaB/2K4zDvoqhKF3WXSFJv4hSc
        wTwMMYSdaY0hBgtP3w8Thq70XSDd5QzHzMKeR7E=
X-Google-Smtp-Source: ABdhPJxYwIQTYS55uAJjvDX1Cvgn9dBsJTnE35u/tO+CyWEgHU5qqPoy8ujc9ZiE7Phh28B5km2ngvqI4cu7CiC3TsE=
X-Received: by 2002:a19:8353:: with SMTP id f80mr6105lfd.348.1606337281667;
 Wed, 25 Nov 2020 12:48:01 -0800 (PST)
MIME-Version: 1.0
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 25 Nov 2020 17:47:50 -0300
Message-ID: <CAOMZO5BQbED4-P-R8xsh1_c02E4DUxQdc+P=46rt=L+mYFsrRA@mail.gmail.com>
Subject: imx6 capture via ADV7280
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media <linux-media@vger.kernel.org>,
        Discussion of the development of and with GStreamer 
        <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I am running 5.10.0-rc5-next-20201125 (same behavior is seen on
5.4.76) on a imx6dl board with an ADV7280:

# media-ctl -l "'adv7180 0-0020':0 -> 'ipu1_csi1_mux':4[1]";
# media-ctl -l "'ipu1_csi1_mux':5 -> 'ipu1_csi1':0[1]"
# media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
# media-ctl -V "'adv7180 0-0020':0 [fmt:UYVY2X8/720x480 field:seq-bt]"
# media-ctl -V "'ipu1_csi1_mux':5 [fmt:UYVY2X8/720x480]"
# media-ctl -V "'ipu1_csi1':2 [fmt:AYUV32/720x480]"
# v4l2-ctl -d3 --set-fmt-video=field=interlaced_bt

Then I start the stream:
v4l2-ctl --stream-mmap -d /dev/video3
[   22.792049] ipu1_csi1: EOF timeout
VIDIOC_DQBUF: failed: Input/output error

It always fails for the first time.

Then I try to start the stream once again:

# v4l2-ctl --stream-mmap -d /dev/video3
[   28.430420] ipu1_csi1: NFB4EOF
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.75 fps
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.77 fps
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.78 fps
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.77 fps
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.78 fps
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 30.77 fps
....

Does anyone have an idea as to why it fails when trying to stream for
the first time?

Next, I would like to run the following Gstreamer pipeline (GStreamer 1.18.1):

# gst-launch-1.0 v4l2src device=/dev/video3 ! kmssink
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Device
'/dev/video3' does not support progressive interlacing
Additional debug info:
../sys/v4l2/gstv4l2object.c(4012): gst_v4l2_object_set_format_full ():
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Device wants interleaved interlacing
Execution ended after 0:00:00.014920000
Setting pipeline to NULL ...
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Internal data stream error.
Additional debug info:
../libs/gst/base/gstbasesrc.c(3127): gst_base_src_loop ():
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
streaming stopped, reason not-negotiated (-4)
Freeing pipeline ...

Any ideas on how to display the video captured to the display?

Thanks,

Fabio Estevam
