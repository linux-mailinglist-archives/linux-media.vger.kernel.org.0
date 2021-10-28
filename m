Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA4543D832
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 02:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbhJ1AmV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Oct 2021 20:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbhJ1AmV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Oct 2021 20:42:21 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B79ACC061570;
        Wed, 27 Oct 2021 17:39:54 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id s1so17591973edd.3;
        Wed, 27 Oct 2021 17:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=25jHkIsapODDQ6Lx9Rj+b3D+u+fqBMSr8fzk3vcCGkw=;
        b=E5wKN04rEhNs8VVDiU5HdKxmqkxcoMTL08WYRxNo5O6ryc4jRAQBS4vnMqRUZOeDgM
         qgjb+VDhcMX3dUL6qp0Z6eWOgPqs6DM9J3gkTk706GPTiKRGMvLepuCqMrRvqmaTIyKM
         E4Z8eRT2uaXPYP3DbER8AZ+8lVnJ2DMYeEkg7qF5wwyf9oqjE+XTc/YpHeqy76EZZx8F
         9x6Ia3WiM93QozsvHBzE0LsHHodkpLUEu9JDyjFkqxLIylwR9kH+mIPPEHXLmhSJnJLG
         6qZyp4wM3SwVG3b3CaJ03FFWdyMVD2BSxeHY1edjpOIPO7PHHYMtmZW7fPgyuxdGYyT0
         7xLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=25jHkIsapODDQ6Lx9Rj+b3D+u+fqBMSr8fzk3vcCGkw=;
        b=VH7Agqo95Hxh6q9+SZsc29JOA2h1XqBTx+/ocb+xzqjeb3xRD8hbIu5Zz1v1WoPrjq
         neheOu3SO75hrGO4yLPJL4vggzTGZGsKMHttbclczyHXG5gYcTpzkDf9rkZ1mNkgXWwO
         Kv2uGnlpiT4qauDoETZ/yDkYw1PW83+nA7Ymu75uE4k+iwfqjK8/BM52a8S7Cj/QZp0B
         tDeyRrAMvJ4gq1PQDCo90HWUGKhew+WgUPulyJKTfwsWikhblhCg50mnpsqw/SvzymA0
         Dh7ubSrIdXf2eqSr8pedSN17aF9nGCr04gdTMUnA6AruZFo7kFCR2IB+JYQoZ4TDXqbZ
         HOYA==
X-Gm-Message-State: AOAM531x9i8hE4gKIDyBzRPd3rY7lTgm8EBLF0OchEiTJFy+afAkN1ew
        axEbKSVmI49/8GlE0mXnAjY1ZnG1YQnNA7mNEHjMrVpISo0=
X-Google-Smtp-Source: ABdhPJzTyN/vjFagE2OetIbN0pccHIJf8bN3evrrO3l16CAHD/60CbhTxVTf+FVUyeuXaBSl/ULIVv54QF9Cu/9RdYw=
X-Received: by 2002:a05:6402:3590:: with SMTP id y16mr1555352edc.249.1635381593021;
 Wed, 27 Oct 2021 17:39:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211023203457.1217821-1-aford173@gmail.com> <CAOMZO5BwPTWBhqzHgbzbC_UyzOX7LMGxX83H0FaJ-05ddOpqYQ@mail.gmail.com>
In-Reply-To: <CAOMZO5BwPTWBhqzHgbzbC_UyzOX7LMGxX83H0FaJ-05ddOpqYQ@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 27 Oct 2021 19:39:40 -0500
Message-ID: <CAHCN7x+Bj==zd8_VRquv51RYiG9t_CRrB6=3fugaHvQS8PVS+g@mail.gmail.com>
Subject: Re: [RFC V2 0/5] arm64: dts: imx8mm: Enable CSI and OV5640 Camera
To:     Fabio Estevam <festevam@gmail.com>
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

On Sun, Oct 24, 2021 at 7:16 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Adam,
>
> [Adding Frieder on Cc]
>
> On Sat, Oct 23, 2021 at 5:35 PM Adam Ford <aford173@gmail.com> wrote:
> >
> > The imx8mm appears to have both a CSI bridge and mipi-csi-2 drivers.  With
> > those enabled, both the imx8mm-evk and imx8mm-beacon boards should be able
> > use an OV5640 camera.
> >
> > The mipi-csi2 driver sets the clock frequency to 333MHz, so the clock parent
> > of the CSI1 must be reparented to a faster clock.  On the custom NXP kernel,
> > they use IMX8MM_SYS_PLL2_1000M, so that is done in the device tree to match.
> >
> > With the CSI and mipi_csi2 drivers pointing to an OV5640 camera, the media
> > pipeline can be configured with the following:
> >
> >     media-ctl --links "'ov5640 1-003c':0->'imx7-mipi-csis.0':0[1]"
> >
> > The camera and various nodes in the pipeline can be configured for UYVY:
> >     media-ctl -v -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/640x480 field:none]"
> >     media-ctl -v -V "'csi':0 [fmt:UYVY8_1X16/640x480 field:none]"
> >
> > With that, the media pipeline looks like:
> >
> >
> > Media controller API version 5.15.0
> >
> > Media device information
> > ------------------------
> > driver          imx7-csi
> > model           imx-media
> > serial
> > bus info        platform:32e20000.csi
> > hw revision     0x0
> > driver version  5.15.0
> >
> > Device topology
> > - entity 1: csi (2 pads, 2 links)
> >             type V4L2 subdev subtype Unknown flags 0
> >             device node name /dev/v4l-subdev0
> >         pad0: Sink
> >                 [fmt:UYVY8_1X16/640x480 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
> >                 <- "imx7-mipi-csis.0":1 [ENABLED,IMMUTABLE]
> >         pad1: Source
> >                 [fmt:UYVY8_1X16/640x480 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
> >                 -> "csi capture":0 [ENABLED,IMMUTABLE]
> >
> > - entity 4: csi capture (1 pad, 1 link)
> >             type Node subtype V4L flags 0
> >             device node name /dev/video0
> >         pad0: Sink
> >                 <- "csi":1 [ENABLED,IMMUTABLE]
> >
> > - entity 10: imx7-mipi-csis.0 (2 pads, 2 links)
> >              type V4L2 subdev subtype Unknown flags 0
> >              device node name /dev/v4l-subdev1
> >         pad0: Sink
> >                 [fmt:UYVY8_1X16/640x480 field:none colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
> >                 <- "ov5640 1-003c":0 [ENABLED]
> >         pad1: Source
> >                 [fmt:UYVY8_1X16/640x480 field:none colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
> >                 -> "csi":0 [ENABLED,IMMUTABLE]
> >
> > - entity 15: ov5640 1-003c (1 pad, 1 link)
> >              type V4L2 subdev subtype Sensor flags 0
> >              device node name /dev/v4l-subdev2
> >         pad0: Source
> >                 [fmt:UYVY8_1X16/640x480@1/30 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
> >                 -> "imx7-mipi-csis.0":0 [ENABLED]
> >
> > When configured, gstreamer can be used to capture 1 frame and store it to a file.
> >
> > gst-launch-1.0 -v v4l2src num-buffers=1 ! video/x-raw,format=UYVY,width=640,height=480,framerate=60/1 ! filesink location=test
> >
> > Unfortunately, the video capture never appears to happen.  No errors occur, not
> > interrupts are recorded and no errors are recorded.
> >
> > gst-launch-1.0 -v v4l2src num-buffers=1 ! video/x-raw,format=UYVY,width=640,height=480,framerate=60/1 ! filesink location=test
> > Setting pipeline to PAUSED ...
> > Pipeline is live and does not need PREROLL ...
> > Pipeline is PREROLLED ...
> > Setting pipeline to [  114.819632] v4l2_get_link_freq: Link frequency estimated using pixel rate: result might be inaccurate
> > PLAYING ...
> > New clock: GstSystem[  114.829203] v4l2_get_link_freq: Consider implementing support for V4L2_CID_LINK_FREQ in the transmitter driver
> > Clock
> > /GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps = video/x-raw, format=(string)UYVY, width=(int)640, height=(int)480, framerate=(fraction)60/1, interlace-mode=(string)progressive, colorimetry=(string)bt709
> > /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:src: caps = video/x-raw, format=(string)UYVY, width=(int)640, height=(int)480, framerate=(fraction)60/1, interlace-mode=(string)progressive, colorimetry=(string)bt709
> > /GstPipeline:pipeline0/GstFileSink:filesink0.GstPad:sink: caps = video/x-raw, format=(string)UYVY, width=(int)640, height=(int)480, framerate=(fraction)60/1, interlace-mode=(string)progressive, colorimetry=(string)bt709
> > /GstPipeline:pipeline0/GstCapsFilter:capsfilter0.GstPad:sink: caps = video/x-raw, format=(string)UYVY, width=(int)640, height=(int)480, framerate=(fraction)60/1, interlace-mode=(string)progressive, colorimetry=(string)bt709
> >
> >
> > If anyone has any insight as to what might be wrong, I'd like feedback.
> > I posted a device tree that I beleive goes with the newer imx8mm-evk, but
> > I do not have this hardware, so I cannot test it.
>
> It seems that Frieder on Cc managed to get camera capture to work on
> i.MX8MM here:
> https://git.kontron-electronics.de/sw/misc/linux/-/commits/v5.10-mx8mm-csi
>
> Hopefully, this can help to figure out what is missing in mainline to
> get camera capture to work on i.MX8M.
>
> I don't have access to an OV5640 camera to connect to the imx8mm-evk
> board to try your series.

Fabio,

Thanks for the heads up on that repo.  I was able to use that repo and
get still images to capture on an OV5640, but I noticed a fair amount
of differences between that repo and what's found in linux-next.

Laurent,

I haven't exhausted the patch differences, but I found at least a few
that appear to be missiing upstream, and I am curious to know if/what
your opinion is on whether or not they're needed, since the patches on
Frieder's repo appear to come from you.
[1] - media: imx: imx7-media-csi: Add i.MX8MM identification
[2] - media: imx: imx7_mipi_csis: Don't set reserved CLK_CTRL field on i.MX8MM
[3] - media: imx: imx7_mipi_csis: Set dual pixel mode for RAW formats

media: imx: imx7_mipi_csis: Set dual pixel mode for RAW formats

Maybe these don't need to be applied, but they are 'some' of the
differences that I see between this 5.10 branch and linux-next .  I
know there are more, but


[1] - https://git.kontron-electronics.de/sw/misc/linux/-/commit/8ac7ec6db0c260a871038721886dbdb6660ed84c
[2] - https://git.kontron-electronics.de/sw/misc/linux/-/commit/0b5727c8eba8c370f7db5eace0243f78992a4dbb
[3] - https://git.kontron-electronics.de/sw/misc/linux/-/commit/14befa6bc146b10092a6ac5d0ed4d42c87c6cf27

Frieder et al,

Have you (or anyone) tried CSI cameras on anything newer than 5.10?  I
am curious to see if a regression popped in somewhere, but git bisect
will make this difficult since there is a fair amount of variation
between this custom repo and the upstream.

adam
>
> Regards,
>
> Fabio Estevam
