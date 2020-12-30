Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6856E2E7BAC
	for <lists+linux-media@lfdr.de>; Wed, 30 Dec 2020 18:46:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgL3Rqf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Dec 2020 12:46:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbgL3Rqf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Dec 2020 12:46:35 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E6DC061573
        for <linux-media@vger.kernel.org>; Wed, 30 Dec 2020 09:45:54 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id b26so39200122lff.9
        for <linux-media@vger.kernel.org>; Wed, 30 Dec 2020 09:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=lsMpuSlk+JgQDEfP7dT55M3ksvKCeDlSL4FBnQFCTII=;
        b=SFODHa+kqT5pT7AZ1XwvAxbkLMaU9B6jTqqO4n1va86iIEVz3sH6eSl/idrc/RBT3E
         gTNbX9jviWbd/QmP9QocOsTwu6shvkrO0Bo5/C+MzZVb+SABSuJ98r1GVnA8nY+pHzLp
         Im0CKsuemb7FM2T4IiyR0uCXnHqU7fH67tvp7PpHVFqpLLBVCiq5WVg/CbqHecRtc/6G
         2vUJyuC5wqn6CwHRJKL3mKbcdcW+YnCxmZWaZVCgJmWkYzUYrFHYCBNJ79GhgcO2fsG4
         OaPUqnL7j4omyAvJpAL/H0juG5R05psu2uCXgPAlSkv0HjpqpXgntvEJ5dUvLmDvypSW
         IuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=lsMpuSlk+JgQDEfP7dT55M3ksvKCeDlSL4FBnQFCTII=;
        b=gwxI9Fvlsxlm+bti0kqHwVn6DDHTjoKtjMiuSmDRBJaLTMMFgDBzt8uOsrlkUVOyk/
         pvqmFtSQ1qPOEHvgY3cVmhPInooq59l+dyxxsE7XKdiZl/Za8XydcsOaMFX65HcDLiiX
         0Hnq9ehVVWFqjH7g0hVN2KyDMA6WgldSbRNJXVUEeYdOCicqzPFRM3ayCAt8xhCRLA2I
         F+J0VFLhCIZMqlwzo+FjgJaL+APP+GbO1PPhFfW4fsbtc2WDKJOmn1GcB29OQunKlTGF
         HGAqJvn5QOUl6GU5IhuYdfAvt3dv/7vO1kx6dzcp3FQdacIFCiTQgVMxwg32U/Xqgu1A
         TDeA==
X-Gm-Message-State: AOAM532tCKxr6NcCREN0zzwPevVOtgDyPQWZrh/weAmfS89Kf53D1WU2
        1d3PAFTLLS4aL6v61jNYJBMMKsfDsFOhSiJkhkM=
X-Google-Smtp-Source: ABdhPJyZZR67fNYTA9g44/Or8IA78R4K3penA1chr55HBoF/W1EQeQob0M9rwd72aLKctfz4O0bWdw5fVnmC281sswo=
X-Received: by 2002:a2e:b80c:: with SMTP id u12mr25777529ljo.490.1609350352853;
 Wed, 30 Dec 2020 09:45:52 -0800 (PST)
MIME-Version: 1.0
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 30 Dec 2020 14:45:41 -0300
Message-ID: <CAOMZO5DTW_YgVgyXqtccxQUm0A2kLLVcw_EhfsN0kZ9s2hgt7Q@mail.gmail.com>
Subject: imx6ull capture from OV5640
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        =?UTF-8?Q?S=C3=A9bastien_Szymanski?= 
        <sebastien.szymanski@armadeus.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I am trying to capture from a parallel OV5640 on a imx6ull-evk board.

Here are the device tree changes:
https://pastebin.com/raw/PZpJjagJ

First, I got the following warning:

[    7.788866] csi: Registered csi capture as /dev/video1
[    7.797382] ------------[ cut here ]------------
[    7.802141] WARNING: CPU: 0 PID: 1 at
drivers/staging/media/imx/imx7-media-csi.c:1168
imx7_csi_notify_bound+0x40/0x50
[    7.813116] Modules linked in:
[    7.816436] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
5.10.0-next-20201223-00003-gaaee78ed150-dirty #304
[    7.826015] Hardware name: Freescale i.MX6 Ultralite (Device Tree)
[    7.832281] [<c0111a68>] (unwind_backtrace) from [<c010c068>]
(show_stack+0x10/0x14)
[    7.840151] [<c010c068>] (show_stack) from [<c0e14570>]
(dump_stack+0xe0/0x10c)
[    7.847570] [<c0e14570>] (dump_stack) from [<c0125a7c>] (__warn+0x104/0x118)
[    7.854734] [<c0125a7c>] (__warn) from [<c0125b38>]
(warn_slowpath_fmt+0xa8/0xb8)
[    7.862326] [<c0125b38>] (warn_slowpath_fmt) from [<c0a66e0c>]
(imx7_csi_notify_bound+0x40/0x50)
[    7.871227] [<c0a66e0c>] (imx7_csi_notify_bound) from [<c09ae084>]
(v4l2_async_match_notify+0x50/0x124)

To avoid the warning I did:

--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1164,12 +1164,14 @@ static int imx7_csi_notify_bound(struct
v4l2_async_notifier *notifier,
        struct imx7_csi *csi = imx7_csi_notifier_to_dev(notifier);
        struct media_pad *sink = &csi->sd.entity.pads[IMX7_CSI_PAD_SINK];

-       /* The bound subdev must always be the CSI mux */
-       if (WARN_ON(sd->entity.function != MEDIA_ENT_F_VID_MUX))
-               return -ENXIO;
+       if (csi->is_csi2) {
+               /* The bound subdev must always be the CSI mux */
+               if (WARN_ON(sd->entity.function != MEDIA_ENT_F_VID_MUX))
+                       return -ENXIO;

-       /* Mark it as such via its group id */
-       sd->grp_id = IMX_MEDIA_GRP_ID_CSI_MUX;
+               /* Mark it as such via its group id */
+               sd->grp_id = IMX_MEDIA_GRP_ID_CSI_MUX;
+       }

        return v4l2_create_fwnode_links_to_pad(sd, sink);
 }

# media-ctl -p
Media controller API version 5.10.0

Media device information
------------------------
driver          imx7-csi
model           imx-media
serial
bus info
hw revision     0x0
driver version  5.10.0

Device topology
- entity 1: csi (2 pads, 2 links)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
        pad0: Sink
                [fmt:UYVY8_2X8/800x600 field:none colorspace:srgb
xfer:srgb ycbcr:601 quantization:lim-range]
                <- "ov5640 1-003c":0 []
        pad1: Source
                [fmt:UYVY8_2X8/800x600 field:none colorspace:srgb
xfer:srgb ycbcr:601 quantization:lim-range]
                -> "csi capture":0 []

- entity 4: csi capture (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video1
        pad0: Sink
                <- "csi":1 []

- entity 10: ov5640 1-003c (1 pad, 1 link)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev1
        pad0: Source
                [fmt:UYVY8_2X8/640x480@1/30 field:none colorspace:srgb
xfer:srgb ycbcr:601 quantization:full-range]
                -> "csi":0 []
And then:

media-ctl -l "'ov5640 1-003c':0 -> 'csi':0[1]"
media-ctl -l "'csi':1 -> 'csi capture':0[1]"
media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY2X8/640x480]"
media-ctl -V "'csi':0 [fmt:AYUV32/640x480]"

When trying to capture via v42-ctl:
# v4l2-ctl --stream-mmap -d /dev/video1
[  411.627032] csi: capture format not valid

Or with gstreamer:

# gst-launch-1.0 v4l2src device=/dev/video1 ! fakesink
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
[  439.933324] csi: pipeline start failed with -19

Any suggestions?

Thanks,

Fabio Estevam
