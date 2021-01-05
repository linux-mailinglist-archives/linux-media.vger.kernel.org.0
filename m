Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFC452EB1C3
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 18:48:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730639AbhAERqe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 12:46:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbhAERqe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 12:46:34 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0702C061793
        for <linux-media@vger.kernel.org>; Tue,  5 Jan 2021 09:45:53 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 23so303958lfg.10
        for <linux-media@vger.kernel.org>; Tue, 05 Jan 2021 09:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/Lf83+axfb7kCUXV9cHfIPxVR171WWJNXcgziWU6ZA8=;
        b=rFe8sET65g01ufLnDF3zzBVfCoqg4HoO+am/rwPSbo3cQCweRFD9eoITuIgO2Vz1WB
         nCNxjbnfQ2ATcPcFP9IKgnFFvZ8ECWkXQ6OIPpLozbk4a9VVmREPYnSdft1pUHi25Y/U
         PPsjAIfsAi3XsV6cEZxbInGPU7UWqK0cbkeED37Jplrgi7vFIZfEwueg/gaPIKnIGrQ8
         r//PfH6/ZAIYwOjAWHtAy0vhIUIDxl/m/x/gYie5qDxzvC2XA6IT8wdB+tkcAp4WjQBe
         oJL5FLIzvY3R8r6aNyuQX4+RwJ8dKDB8rkvXJAYKfuqS3bNmdgCKvROU/01wOC+Y6OHa
         5Glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Lf83+axfb7kCUXV9cHfIPxVR171WWJNXcgziWU6ZA8=;
        b=rjs2KMTFzcLLIY+x80RjOWPai/53K/HKvSmo1AIIEMQiWNa7/DREyh34XGcLntIQHj
         V2YSAIxK7S3CIMy6jQoFm4dIyhfWP7swY85oUIII1GL1bUqd32yWkVLIadxzRXMm7aol
         VI6JTkuBXdvgaSk6JaDyxFaYXEL1Tii0zXe+ak891RkJYM4LcUHPeMsyUDtNGpFX4bAU
         a7iEjq+nbj+Bfjfz+ubasPSzLarRnIwlthcn9Cep12r+O8SY+0c3g4MXmIX5kDIXhWXT
         un90e0598xeFqmJubTCDQwytdY0dmpP5bROkfr4poQJLIklvaQUsM87c0yfP585o1ItQ
         el+g==
X-Gm-Message-State: AOAM531MB82Ws6Yvuwy1poYzQFqAa7OzuE9G+pvOpHJTljy9TIWxI5Z0
        D0S5myI4Vx6NW3zfwopsrWR+2SEJmbp4jKIETGqiJlSiekBX1A==
X-Google-Smtp-Source: ABdhPJyLrbcHP7uawmNCK9LdWaFeU84fjhuSHSsXFlvLA6geoQ6PnkcqDOixsitQNR3clf/oLnwmn7NyA+QykQBUqD8=
X-Received: by 2002:a2e:8416:: with SMTP id z22mr332192ljg.347.1609868752065;
 Tue, 05 Jan 2021 09:45:52 -0800 (PST)
MIME-Version: 1.0
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 5 Jan 2021 14:45:40 -0300
Message-ID: <CAOMZO5CaWvRGV0Zc4AS6Uexh5uR5jkCG4MkEMkW-YU3NPOVg8g@mail.gmail.com>
Subject: Re: [PATCH 00/75] media: imx: Miscellaneous fixes and cleanups for i.MX7
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Tue, Jan 5, 2021 at 12:31 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> This large patch series has been sitting in my tree for way too long. I
> haven't posted it yet as I'm running into an issue on my test hardware
> that I can't prove is not a regression from this series, but the
> pressure has grown and the patches are better on the list for review.
>
> There's really not much to detail in the cover letter as there are
> "just" fixes and cleanups I developed while bringing up camera support
> for an i.MX7D platform, and later on an i.MX8MM that shares the same
> MIPI-CSI2 and CSI IP cores (with some differences).
>
> The issue I've noticed is that the CSI writes two images consecutively
> to the same buffer, overwritting memory after the end of the buffer. I
> believe this bug to already be present in mainline, but I can't prove it
> as my sensor won't work without some of the patches in this series. The
> problem could also be sensor-specific.
>
> Rui, would you be able to test this on your i.MX7 hardware to make sure
> there's no regression ?

Thanks for your series.

I tested it on a imx6ul-evk board.

There is a build error introduced by patch 74/75. I fixed it like this:

--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -193,6 +193,8 @@
 #define MIPI_CSIS_SDW_RESOL_CH(n)              (0x84 + (n) * 0x10)
 #define MIPI_CSIS_SDW_SYNC_CH(n)               (0x88 + (n) * 0x10)

+/* Debug Control register */
+#define MIPI_CSIS_DBG_CTRL                     0x20
 /* Non-image packet data buffers */
 #define MIPI_CSIS_PKTDATA_ODD                  0x2000
 #define MIPI_CSIS_PKTDATA_EVEN                 0x3000

Then I applied my patch and Rui's to fix the imx6ul regression as per
the other thread we have been discussing, but I was not able to
capture:

# gst-launch-1.0 -v  v4l2src device=/dev/video1 ! v4l2convert ! fbdevsink
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps =
video/x-raw, format=(string)BGRx, width=(int)3840, height=(int)2160,
framerate=(fraction)120/1, interlace-mode=(string)progressive,
colorimetr
y=(string)1:1:5:1
/GstPipeline:pipeline0/v4l2convert:v4l2convert0.GstPad:src: caps =
video/x-raw, format=(string)BGRx, width=(int)3840, height=(int)2160,
framerate=(fraction)120/1, interlace-mode=(string)progressive, color
imetry=(string)1:1:5:1
/GstPipeline:pipeline0/GstFBDEVSink:fbdevsink0.GstPad:sink: caps =
video/x-raw, format=(string)BGRx, width=(int)3840, height=(int)2160,
framerate=(fraction)120/1, interlace-mode=(string)progressive, color
imetry=(string)1:1:5:1
/GstPipeline:pipeline0/v4l2convert:v4l2convert0.GstPad:sink: caps =
video/x-raw, format=(string)BGRx, width=(int)3840, height=(int)2160,
framerate=(fraction)120/1, interlace-mode=(string)progressive, colo
rimetry=(string)1:1:5:1
[   32.783736] cma: cma_alloc: alloc failed, req-size: 8100 pages, ret: -12
[   32.791332] imx7-csi 21c4000.csi: dma_alloc_coherent of size 33177600 failed
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
to allocate required memory.
Additional debug info:
../sys/v4l2/gstv4l2src.c(659): gst_v4l2src_decide_allocation ():
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Buffer pool activation failed
Execution ended after 0:00:00.214658125
Setting pipeline to NULL ...
Freeing pipeline ...

As shown above the dimensions and framerate are incorrectly reported
as: width=(int)3840, height=(int)2160, framerate=(fraction)120/1

Previously it was:

# gst-launch-1.0 -v  v4l2src device=/dev/video1 ! v4l2convert ! fbdevsink
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Pipeline is PREROLLED ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps =
video/x-raw, format=(string)UYVY, width=(int)320, height=(int)240,
framerate=(fraction)30000/1001, interlace-mode=(string)progressive,
colorim
etry=(string)1:4:7:1
/GstPipeline:pipeline0/v4l2convert:v4l2convert0.GstPad:src: caps =
video/x-raw, format=(string)BGRx, width=(int)320, height=(int)240,
framerate=(fraction)30000/1001, interlace-mode=(string)progressive
/GstPipeline:pipeline0/GstFBDEVSink:fbdevsink0.GstPad:sink: caps =
video/x-raw, format=(string)BGRx, width=(int)320, height=(int)240,
framerate=(fraction)30000/1001, interlace-mode=(string)progressive
/GstPipeline:pipeline0/v4l2convert:v4l2convert0.GstPad:sink: caps =
video/x-raw, format=(string)UYVY, width=(int)320, height=(int)240,
framerate=(fraction)30000/1001, interlace-mode=(string)progressive, c
olorimetry=(string)1:4:7:1

Thanks
