Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD8B82EC099
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 16:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbhAFPmX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 10:42:23 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:53656 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727236AbhAFPmW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 10:42:22 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D504F878;
        Wed,  6 Jan 2021 16:41:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609947700;
        bh=oq0mpB2R6Y5iueTQd24UjAY74WR0Ev34K3MZMptdZQw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pkqEbJEUpuZnJjxg5RdrLqp3EI5ct9rF14b+rL1noUBg45/HpkkwKnUYWZ9omxsLs
         2OL0VWHWW7c4B4u+sWWvD/0ZzfL6ZcLifhxGqZ4FnB4haviAS1dt38DaUGUCR/Xkms
         x+6uP+5/bHSGKmheV8GVLZCBwDl6wuNZkxHNHchM=
Date:   Wed, 6 Jan 2021 17:41:27 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH 00/75] media: imx: Miscellaneous fixes and cleanups for
 i.MX7
Message-ID: <X/XaJ0UA04ekdWpi@pendragon.ideasonboard.com>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
 <CAOMZO5CaWvRGV0Zc4AS6Uexh5uR5jkCG4MkEMkW-YU3NPOVg8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOMZO5CaWvRGV0Zc4AS6Uexh5uR5jkCG4MkEMkW-YU3NPOVg8g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On Tue, Jan 05, 2021 at 02:45:40PM -0300, Fabio Estevam wrote:
> On Tue, Jan 5, 2021 at 12:31 PM Laurent Pinchart wrote:
> >
> > Hello,
> >
> > This large patch series has been sitting in my tree for way too long. I
> > haven't posted it yet as I'm running into an issue on my test hardware
> > that I can't prove is not a regression from this series, but the
> > pressure has grown and the patches are better on the list for review.
> >
> > There's really not much to detail in the cover letter as there are
> > "just" fixes and cleanups I developed while bringing up camera support
> > for an i.MX7D platform, and later on an i.MX8MM that shares the same
> > MIPI-CSI2 and CSI IP cores (with some differences).
> >
> > The issue I've noticed is that the CSI writes two images consecutively
> > to the same buffer, overwritting memory after the end of the buffer. I
> > believe this bug to already be present in mainline, but I can't prove it
> > as my sensor won't work without some of the patches in this series. The
> > problem could also be sensor-specific.
> >
> > Rui, would you be able to test this on your i.MX7 hardware to make sure
> > there's no regression ?
> 
> Thanks for your series.
> 
> I tested it on a imx6ul-evk board.

Thank you.

> There is a build error introduced by patch 74/75. I fixed it like this:
> 
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -193,6 +193,8 @@
>  #define MIPI_CSIS_SDW_RESOL_CH(n)              (0x84 + (n) * 0x10)
>  #define MIPI_CSIS_SDW_SYNC_CH(n)               (0x88 + (n) * 0x10)
> 
> +/* Debug Control register */
> +#define MIPI_CSIS_DBG_CTRL                     0x20
>  /* Non-image packet data buffers */
>  #define MIPI_CSIS_PKTDATA_ODD                  0x2000
>  #define MIPI_CSIS_PKTDATA_EVEN                 0x3000

Oops. I have a debug patch in my branch on top of the series that adds
the macro, that's why I haven't noticed compilation broke. Sorry about
that.

> Then I applied my patch and Rui's to fix the imx6ul regression as per
> the other thread we have been discussing, but I was not able to
> capture:

Would you be able to bisect this ?

> # gst-launch-1.0 -v  v4l2src device=/dev/video1 ! v4l2convert ! fbdevsink
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> Pipeline is PREROLLED ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps =
> video/x-raw, format=(string)BGRx, width=(int)3840, height=(int)2160,
> framerate=(fraction)120/1, interlace-mode=(string)progressive,
> colorimetr
> y=(string)1:1:5:1
> /GstPipeline:pipeline0/v4l2convert:v4l2convert0.GstPad:src: caps =
> video/x-raw, format=(string)BGRx, width=(int)3840, height=(int)2160,
> framerate=(fraction)120/1, interlace-mode=(string)progressive, color
> imetry=(string)1:1:5:1
> /GstPipeline:pipeline0/GstFBDEVSink:fbdevsink0.GstPad:sink: caps =
> video/x-raw, format=(string)BGRx, width=(int)3840, height=(int)2160,
> framerate=(fraction)120/1, interlace-mode=(string)progressive, color
> imetry=(string)1:1:5:1
> /GstPipeline:pipeline0/v4l2convert:v4l2convert0.GstPad:sink: caps =
> video/x-raw, format=(string)BGRx, width=(int)3840, height=(int)2160,
> framerate=(fraction)120/1, interlace-mode=(string)progressive, colo
> rimetry=(string)1:1:5:1
> [   32.783736] cma: cma_alloc: alloc failed, req-size: 8100 pages, ret: -12
> [   32.791332] imx7-csi 21c4000.csi: dma_alloc_coherent of size 33177600 failed
> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
> to allocate required memory.
> Additional debug info:
> ../sys/v4l2/gstv4l2src.c(659): gst_v4l2src_decide_allocation ():
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> Buffer pool activation failed
> Execution ended after 0:00:00.214658125
> Setting pipeline to NULL ...
> Freeing pipeline ...
> 
> As shown above the dimensions and framerate are incorrectly reported
> as: width=(int)3840, height=(int)2160, framerate=(fraction)120/1
> 
> Previously it was:
> 
> # gst-launch-1.0 -v  v4l2src device=/dev/video1 ! v4l2convert ! fbdevsink
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> Pipeline is PREROLLED ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0.GstPad:src: caps =
> video/x-raw, format=(string)UYVY, width=(int)320, height=(int)240,
> framerate=(fraction)30000/1001, interlace-mode=(string)progressive,
> colorim
> etry=(string)1:4:7:1
> /GstPipeline:pipeline0/v4l2convert:v4l2convert0.GstPad:src: caps =
> video/x-raw, format=(string)BGRx, width=(int)320, height=(int)240,
> framerate=(fraction)30000/1001, interlace-mode=(string)progressive
> /GstPipeline:pipeline0/GstFBDEVSink:fbdevsink0.GstPad:sink: caps =
> video/x-raw, format=(string)BGRx, width=(int)320, height=(int)240,
> framerate=(fraction)30000/1001, interlace-mode=(string)progressive
> /GstPipeline:pipeline0/v4l2convert:v4l2convert0.GstPad:sink: caps =
> video/x-raw, format=(string)UYVY, width=(int)320, height=(int)240,
> framerate=(fraction)30000/1001, interlace-mode=(string)progressive, c
> olorimetry=(string)1:4:7:1

-- 
Regards,

Laurent Pinchart
