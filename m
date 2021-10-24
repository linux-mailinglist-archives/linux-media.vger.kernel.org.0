Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1634388CE
	for <lists+linux-media@lfdr.de>; Sun, 24 Oct 2021 14:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbhJXMS3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Oct 2021 08:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbhJXMS2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Oct 2021 08:18:28 -0400
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC00C061764;
        Sun, 24 Oct 2021 05:16:07 -0700 (PDT)
Received: by mail-ua1-x933.google.com with SMTP id o26so2713223uab.5;
        Sun, 24 Oct 2021 05:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FofuzBqLkd+T2rtEHLFNj2gffZMOmW0ei7V/aClPYto=;
        b=bT/fmGgzF7gCQYUPGrIXzPx6RVnnJTYOUTe1x/Q/sUVw6bUjD3IipzvcgCo9+Yka05
         l7/wqIF/aJkK/NRRFSqvIq5XfbaMRkDhbN1ChkHuif6vuHN1Ul+dre3bMaBpDqOQ5kNu
         WblR469cmG3OrtCzuhBQ5ApbfjpvNOFxGqc/D03Tcojg9njvp3dGIOouNFjO00Jv+sWp
         Bfg0dtNm/DD8k7D5OeyGgE4vQMQNa6cHzveNZngEFypcqY6/CxeUV4h/rvGzefYoAznz
         BofMWD0SaS07tYi+NFKHHHXUnUGEglyPO8RrShm9OtgSfOr8PhvYsbyzcCc0Shbu4eEO
         Su9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FofuzBqLkd+T2rtEHLFNj2gffZMOmW0ei7V/aClPYto=;
        b=Ywy80NSWgsavnIMFS9vAlY8Y4sbHoRFIWKGinHh6xpSpOCt4IBvotpTi3iMfvADOCJ
         Y0atcNAoKz9MzsJ7/Bam4+hH3eMAgVMiMGzhSQlWDsuzqEmFrM2cvtEv/JgXGRTdtwog
         BrL7TVRgFWLG6PXqImRg+BsTh/QZQ9C3l61rgZaguQsFb/VKkc+OoXrMirKLUln2FuWM
         hnfkmDAvoPhQGrHiZSzvasxhS7FjIWU8WbRzuJww/QRmZiD9z+Z37AKoP+JDG8+tjy15
         0ThSa/VeO48ezB4YeHC0ZeKEEISMl92srlqEVrczfDAucwhXuE4uYmnVcSRu+S2Bg265
         aEsQ==
X-Gm-Message-State: AOAM531edcMbqtGs1iDE8iH933gwg7+Ca0Bsk/nbC0pXmSnzunHwbv6L
        kQFASwkzYpAKdYXM0N3SV/9Eds/nDzkaQrr/woM=
X-Google-Smtp-Source: ABdhPJwUKJCH/L2H4gU/gJAcL3L40AVxczebvSVd9hfAB9YXnSnSIYwzs1SpFOqHxNzXLJKiQcxOf1jEx9WaIo31olw=
X-Received: by 2002:a05:6102:374e:: with SMTP id u14mr10331762vst.47.1635077766411;
 Sun, 24 Oct 2021 05:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211023203457.1217821-1-aford173@gmail.com>
In-Reply-To: <20211023203457.1217821-1-aford173@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sun, 24 Oct 2021 09:15:55 -0300
Message-ID: <CAOMZO5BwPTWBhqzHgbzbC_UyzOX7LMGxX83H0FaJ-05ddOpqYQ@mail.gmail.com>
Subject: Re: [RFC V2 0/5] arm64: dts: imx8mm: Enable CSI and OV5640 Camera
To:     Adam Ford <aford173@gmail.com>
Cc:     "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-media <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        cstevens@beaconembedded.com,
        Adam Ford-BE <aford@beaconembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Schrempf Frieder <frieder.schrempf@kontron.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Adam,

[Adding Frieder on Cc]

On Sat, Oct 23, 2021 at 5:35 PM Adam Ford <aford173@gmail.com> wrote:
>
> The imx8mm appears to have both a CSI bridge and mipi-csi-2 drivers.  With
> those enabled, both the imx8mm-evk and imx8mm-beacon boards should be able
> use an OV5640 camera.
>
> The mipi-csi2 driver sets the clock frequency to 333MHz, so the clock parent
> of the CSI1 must be reparented to a faster clock.  On the custom NXP kernel,
> they use IMX8MM_SYS_PLL2_1000M, so that is done in the device tree to match.
>
> With the CSI and mipi_csi2 drivers pointing to an OV5640 camera, the media
> pipeline can be configured with the following:
>
>     media-ctl --links "'ov5640 1-003c':0->'imx7-mipi-csis.0':0[1]"
>
> The camera and various nodes in the pipeline can be configured for UYVY:
>     media-ctl -v -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/640x480 field:none]"
>     media-ctl -v -V "'csi':0 [fmt:UYVY8_1X16/640x480 field:none]"
>
> With that, the media pipeline looks like:
>
>
> Media controller API version 5.15.0
>
> Media device information
> ------------------------
> driver          imx7-csi
> model           imx-media
> serial
> bus info        platform:32e20000.csi
> hw revision     0x0
> driver version  5.15.0
>
> Device topology
> - entity 1: csi (2 pads, 2 links)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev0
>         pad0: Sink
>                 [fmt:UYVY8_1X16/640x480 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
>                 <- "imx7-mipi-csis.0":1 [ENABLED,IMMUTABLE]
>         pad1: Source
>                 [fmt:UYVY8_1X16/640x480 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
>                 -> "csi capture":0 [ENABLED,IMMUTABLE]
>
> - entity 4: csi capture (1 pad, 1 link)
>             type Node subtype V4L flags 0
>             device node name /dev/video0
>         pad0: Sink
>                 <- "csi":1 [ENABLED,IMMUTABLE]
>
> - entity 10: imx7-mipi-csis.0 (2 pads, 2 links)
>              type V4L2 subdev subtype Unknown flags 0
>              device node name /dev/v4l-subdev1
>         pad0: Sink
>                 [fmt:UYVY8_1X16/640x480 field:none colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
>                 <- "ov5640 1-003c":0 [ENABLED]
>         pad1: Source
>                 [fmt:UYVY8_1X16/640x480 field:none colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
>                 -> "csi":0 [ENABLED,IMMUTABLE]
>
> - entity 15: ov5640 1-003c (1 pad, 1 link)
>              type V4L2 subdev subtype Sensor flags 0
>              device node name /dev/v4l-subdev2
>         pad0: Source
>                 [fmt:UYVY8_1X16/640x480@1/30 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
>                 -> "imx7-mipi-csis.0":0 [ENABLED]
>
> When configured, gstreamer can be used to capture 1 frame and store it to a file.
>
> gst-launch-1.0 -v v4l2src num-buffers=1 ! video/x-raw,format=UYVY,width=640,height=480,framerate=60/1 ! filesink location=test
>
> Unfortunately, the video capture never appears to happen.  No errors occur, not
> interrupts are recorded and no errors are recorded.
>
> gst-launch-1.0 -v v4l2src num-buffers=1 ! video/x-raw,format=UYVY,width=640,height=480,framerate=60/1 ! filesink location=test
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> Pipeline is PREROLLED ...
> Setting pipeline to [  114.819632] v4l2_get_link_freq: Link frequency estimated using pixel rate: result might be inaccurate
> PLAYING ...
> New clock: GstSystem[  114.829203] v4l2_get_link_freq: Consider implementing support for V4L2_CID_LINK_FREQ in the transmitter driver
> Clock
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps = video/x-raw, format=(string)UYVY, width=(int)640, height=(int)480, framerate=(fraction)60/1, interlace-mode=(string)progressive, colorimetry=(string)bt709
> /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src: caps = video/x-raw, format=(string)UYVY, width=(int)640, height=(int)480, framerate=(fraction)60/1, interlace-mode=(string)progressive, colorimetry=(string)bt709
> /GstPipeline:pipeline0/GstFileSink:filesink0.GstPad:sink: caps = video/x-raw, format=(string)UYVY, width=(int)640, height=(int)480, framerate=(fraction)60/1, interlace-mode=(string)progressive, colorimetry=(string)bt709
> /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sink: caps = video/x-raw, format=(string)UYVY, width=(int)640, height=(int)480, framerate=(fraction)60/1, interlace-mode=(string)progressive, colorimetry=(string)bt709
>
>
> If anyone has any insight as to what might be wrong, I'd like feedback.
> I posted a device tree that I beleive goes with the newer imx8mm-evk, but
> I do not have this hardware, so I cannot test it.

It seems that Frieder on Cc managed to get camera capture to work on
i.MX8MM here:
https://git.kontron-electronics.de/sw/misc/linux/-/commits/v5.10-mx8mm-csi

Hopefully, this can help to figure out what is missing in mainline to
get camera capture to work on i.MX8M.

I don't have access to an OV5640 camera to connect to the imx8mm-evk
board to try your series.

Regards,

Fabio Estevam
