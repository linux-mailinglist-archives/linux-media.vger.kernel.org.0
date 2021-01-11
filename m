Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E60FA2F0F85
	for <lists+linux-media@lfdr.de>; Mon, 11 Jan 2021 10:55:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728532AbhAKJyb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jan 2021 04:54:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbhAKJya (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jan 2021 04:54:30 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AA75C061794
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 01:53:50 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id c5so15672690wrp.6
        for <linux-media@vger.kernel.org>; Mon, 11 Jan 2021 01:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ToRwt1YM5YE9aiRCN8cRrswbHLLWVjQXqY4gFo0GRWY=;
        b=LWp5sdYVPxF74UG7PQ6C7hSXAfFNRVR1ax/Ct70GrDFOIw5o3XEAUlY0Ut74OMBKOL
         3M61SdqG8nLRbUkhH11xSvDsVSeZ9A9TrAjgmRGrX0DT7hO3rvE5Do8sxHrqWPKyk03a
         cTZJdF29Ay6wzmgQ7HUjc2LP8b3TJZ9ekEDyY20Whyqwrxv72Q9frAVfuMTy9tuhEnr9
         scWPKsOsMVJ1RU46qnsb28wlAJeMZXFbmMWPQ3XHd5OGjm2jRj2K58ALnBNRePjnDnyx
         emhenDRAVw5xPn4Rrbn103/WdPiv0GakXpM4OeIzI2yQC1kxhGhtQmeDWzbVuVV8XLHC
         nRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ToRwt1YM5YE9aiRCN8cRrswbHLLWVjQXqY4gFo0GRWY=;
        b=tbwsmAFP7xPhRnD11MZxh0TV8btCnJOlhEbDSo8jgNxjUYuGcXcP1xLlMCBq+8iDpK
         7uesWPkreOuZtcWVo66Kq5p5Wiw6CMEg51YXX6CauIAxnvVLhcKRYWO2/teIwIzEYWuW
         kI+qRKkJTWDC9bCgCkrorRktyhM5ONf1BAVDzhpqf4NYA+8wYqhnZp5QwApr1ZwvVBVl
         CQZkmhiloMZUGvGdkOI8g+7iFh+78Bj8FhsvNtrQZ3r2NOTzILUBotX6Bj67iENWPi2c
         Lq1GOf4ziVJ17/yLMowHr0GYS+5to2AliaunknnV6F1pfKsdr/QYFlavXfiB5O/qTTvV
         ZlXQ==
X-Gm-Message-State: AOAM532TAl8iJI9Q3NN983W9dSxd0KE2ZVVtrz75Qs0/nbiJj1IKGC07
        GVXOXstyrSLj0UbC6/FB8J0=
X-Google-Smtp-Source: ABdhPJwo1LlHgmuuzq6+yXBIZI05BZMFl8IWBUEZey/XhVerhUdH8mTT/82j+cvxdOlkEhAqVhuc0w==
X-Received: by 2002:a5d:570e:: with SMTP id a14mr15275318wrv.126.1610358828954;
        Mon, 11 Jan 2021 01:53:48 -0800 (PST)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id m11sm20797584wmi.16.2021.01.11.01.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 01:53:48 -0800 (PST)
Date:   Mon, 11 Jan 2021 09:53:46 +0000
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH 00/75] media: imx: Miscellaneous fixes and cleanups for
 i.MX7
Message-ID: <20210111095346.dsr556xqynfg433w@arch-thunder.localdomain>
References: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105152852.5733-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,
again many thanks for this series.

On Tue, Jan 05, 2021 at 05:27:37PM +0200, Laurent Pinchart wrote:
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

Only yesterday had the time to setup and test this. In general it
looks very good to me, I only catched one issue and the other was that
my sensor did not implemented the pixel rate control (will send a
follow up patch on that).

I think a lot of the changes are at capture level, so maybe others
need to go over that.

So, when you address:
  - the comments for others that I agree
  - the error path in patch 68
  - rebase the dt-bindings yaml changes, 
  - rebase on top of fabio and my patch regarding parallel setup in
    imx6ull

You can add my:
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

to the all series.

Bellow goes my use case setup and outputs with your changes:

root@imx7s-warp-mbl:~# uname -a
Linux imx7s-warp-mbl 5.11.0-rc1-00119-gf546a57674cb-dirty #109 SMP Mon Jan 11 00:28:24 WET 2021 armv7l GNU/Linux

oot@imx7s-warp-mbl:~# media-ctl --version
media-ctl 1.21.0-4690

# Setup links
media-ctl -l "'ov2680 1-0036':0 -> 'imx7-mipi-csis.0':0[1]"
media-ctl -l "'imx7-mipi-csis.0':1 -> 'csi_mux':1[1]"
media-ctl -l "'csi_mux':2 -> 'csi':0[1]"
media-ctl -l "'csi':1 -> 'csi capture':0[1]"

# Configure pads for pipeline
media-ctl -V "'ov2680 1-0036':0 [fmt:SBGGR10_1X10/1600x1200 field:none]"
media-ctl -V "'csi_mux':1 [fmt:SBGGR10_1X10/1600x1200 field:none]"
media-ctl -V "'csi_mux':2 [fmt:SBGGR10_1X10/1600x1200 field:none]"
media-ctl -V "'imx7-mipi-csis.0':0 [fmt:SBGGR10_1X10/1600x1200 field:none]"
media-ctl -V "'csi':0 [fmt:SBGGR10_1X10/1600x1200 field:none]"

root@imx7s-warp-mbl:~# media-ctl -p
Media controller API version 5.11.0

Media device information
------------------------
driver          imx7-csi
model           imx-media
serial          
bus info        
hw revision     0x0
driver version  5.11.0

Device topology
- entity 1: csi (2 pads, 2 links)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
        pad0: Sink
                [fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
                <- "csi_mux":2 [ENABLED,IMMUTABLE]
        pad1: Source
                [fmt:SBGGR10_1X10/1600x1200 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
                -> "csi capture":0 [ENABLED,IMMUTABLE]

- entity 4: csi capture (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video0
        pad0: Sink
                <- "csi":1 [ENABLED,IMMUTABLE]

- entity 10: csi_mux (3 pads, 2 links)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev1
        pad0: Sink
                [fmt:Y8_1X8/1x1 field:none]
        pad1: Sink
                [fmt:SBGGR10_1X10/1600x1200 field:none]
                <- "imx7-mipi-csis.0":1 [ENABLED]
        pad2: Source
                [fmt:SBGGR10_1X10/1600x1200 field:none]
                -> "csi":0 [ENABLED,IMMUTABLE]

- entity 16: imx7-mipi-csis.0 (2 pads, 2 links)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev2
        pad0: Sink
                [fmt:SBGGR10_1X10/1600x1200 field:none colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
                <- "ov2680 1-0036":0 [ENABLED]
        pad1: Source
                [fmt:SBGGR10_1X10/1600x1200 field:none colorspace:smpte170m xfer:709 ycbcr:601 quantization:lim-range]
                -> "csi_mux":1 [ENABLED]

- entity 21: ov2680 1-0036 (1 pad, 1 link)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev3
        pad0: Source
                [fmt:SBGGR10_1X10/1600x1200@1/30 field:none colorspace:srgb]
                -> "imx7-mipi-csis.0":0 [ENABLED]

root@imx7s-warp-mbl:~# v4l2-ctl --set-fmt-video=width=1600,height=1200,pixelformat=RG16 --stream-mmap --stream-count=1 -d /dev/video0 --stream-to=picture_
1600_1200.raw
<

------
Cheers,
     Rui

> 
> Laurent Pinchart (75):
>   media: imx: Drop dependency on I2C
>   media: imx: Move dependency on VIDEO_DEV to common Kconfig symbol
>   media: imx: Drop manual dependency on VIDEO_IMX_MEDIA
>   media: imx: Move IMX_IPUV3_CORE dependency to VIDEO_IMX_CSI
>   media: imx: Compile imx6-media-objs only for CONFIG_VIDEO_IMX_CSI
>   media: imx: Set default sizes through macros in all drivers
>   media: imx: utils: Add ability to filter pixel formats by mbus code
>   media: imx: capture: Use dev_* instead of v4l2_* to log messages
>   media: imx: capture: Use device name to construct bus_info
>   media: imx: capture: Remove forward declaration of capture_qops
>   media: imx: capture: Handle errors from v4l2_fh_open()
>   media: imx: capture: Clean up capture_priv structure
>   media: imx: capture: Remove capture_priv stop field
>   media: imx: capture: Move queue and ctrl handler init to init function
>   media: imx: capture: Initialize video_device programmatically
>   media: imx: capture: Register the video device after completing init
>   media: imx: capture: Store v4l2_pix_format in imx_media_video_dev
>   media: imx: capture: Move default format init to a separate function
>   media: imx: capture: Rename querycap handler to capture_querycap
>   media: imx: capture: Rename ioctl operations with legacy prefix
>   media: imx: capture: Add a mechanism to disable control inheritance
>   media: imx: capture: Remove unneeded variable in
>     __capture_legacy_try_fmt
>   media: imx: capture: Pass v4l2_pix_format to
>     __capture_legacy_try_fmt()
>   media: imx: capture: Return -EPIPE from __capture_legacy_try_fmt()
>   media: imx: capture: Extract format lookup from
>     __capture_legacy_try_fmt
>   media: imx: capture: Simplify capture_validate_fmt() implementation
>   media: imx: capture: Simplify __capture_legacy_try_fmt()
>   media: imx: capture: Decouple video node from source with MC-centric
>     API
>   media: imx: capture: Expose V4L2_CAP_IO_MC for the MC-centric API
>   media: imx: imx7-media-csi: Disable legacy video node API
>   media: imx: capture: Support creating immutable link to capture device
>   media: imx: imx7-media-csi: Remove control handler
>   media: imx: imx7-media-csi: Move (de)init from link setup to
>     .s_stream()
>   media: imx: imx7-media-csi: Create immutable link to capture device
>   media: imx: imx7-media-csi: Replace CSICR*_RESET_VAL with values
>   media: imx: imx7-media-csi: Tidy up register fields macros
>   media: imx: imx7-media-csi: Reorganize code in sections
>   media: imx: imx7-media-csi: Validate capture format in
>     .link_validate()
>   media: imx: imx7-media-csi: Rename imx7_csi_dma_start() to *_setup()
>   media: imx: imx7-media-csi: Split imx7_csi_dma_stop()
>   media: imx: imx7-media-csi: Move CSI configuration before source start
>   media: imx: imx7-media-csi: Merge streaming_start() with csi_enable()
>   media: imx: imx7-media-csi: Merge hw_reset() with init_interface()
>   media: imx: imx7-media-csi: Set the MIPI data type based on the bus
>     code
>   media: imx: imx7-media-csi: Don't set the buffer stride when disabling
>   media: imx: imx7-media-csi: Merge all config in imx7_csi_configure()
>   media: imx: imx7-media-csi: Clear all configurable CSICR18 fields
>   media: imx: imx7-media-csi: Set RFF burst type in imx7_csi_configure()
>   media: imx: imx7-media-csi: Simplify imx7_csi_rx_fifo_clear()
>   media: imx: imx7-media-csi: Don't double-enable the CSI
>   media: imx: imx7-media-csi: Don't double-enable the RxFIFO
>   media: imx: imx7-media-csi: Remove double reflash of DMA controller
>   media: imx: imx7-media-csi: Don't enable SOF and EOF interrupts
>   media: imx: imx7_media-csi: Add support for additional Bayer patterns
>   media: v4l2-mc: Add link flags to v4l2_create_fwnode_links_to_pad()
>   media: imx: imx7_media-csi: Create immutable link to source device
>   dt-bindings: media: Convert i.MX7 MIPI CSI-2 receiver binding to YAML
>   dt-bindings: media: fsl,imx7-mipi-csi2: Drop the reset-names property
>   dt-bindings: media: fsl,imx7-mipi-csi2: Drop fsl,csis-hs-settle
>     property
>   media: imx: imx7_mipi_csis: Acquire reset control without naming it
>   media: imx: imx7_mipi_csis: Fix input size alignment
>   media: imx: imx7_mipi_csis: Make source .s_power() optional
>   media: imx: imx7_mipi_csis: Avoid double get of wrap clock
>   media: imx: imx7_mipi_csis: Drop 10-bit YUV support
>   media: imx: imx7_mipi_csis: Fix UYVY8 media bus format
>   media: imx: imx7_mipi_csis: Inline mipi_csis_set_hsync_settle()
>   media: imx: imx7_mipi_csis: Move link setup check out of locked
>     section
>   media: imx: imx7_mipi_csis: Calculate Ths_settle from source pixel
>     rate
>   media: imx: imx7_mipi_csis: Turn register access macros into functions
>   media: imx: imx7_mipi_csis: Fully initialize MIPI_CSIS_DPHYCTRL
>     register
>   media: imx: imx7_mipi_csis: Define macros for DPHY_BCTRL_L fields
>   media: imx: imx7_mipi_csis: Make ISP registers macros take channel ID
>   media: imx: imx7_mipi_csis: Rename register macros to match datasheet
>   media: imx: imx7_mipi_csis: Use register macros in
>     mipi_csis_dump_regs()
>   media: imx: imx7_mipi_csis: Print shadow registers in
>     mipi_csis_dump_regs()
> 
>  .../bindings/media/fsl,imx7-mipi-csi2.yaml    |  194 ++++
>  .../bindings/media/imx7-mipi-csi2.txt         |   90 --
>  MAINTAINERS                                   |    2 +-
>  drivers/media/v4l2-core/v4l2-mc.c             |    6 +-
>  drivers/staging/media/imx/Kconfig             |   12 +-
>  drivers/staging/media/imx/Makefile            |    8 +-
>  drivers/staging/media/imx/TODO                |    9 +-
>  drivers/staging/media/imx/imx-ic-prp.c        |    4 +-
>  drivers/staging/media/imx/imx-ic-prpencvf.c   |   24 +-
>  drivers/staging/media/imx/imx-media-capture.c |  685 ++++++-----
>  .../staging/media/imx/imx-media-csc-scaler.c  |    2 +-
>  drivers/staging/media/imx/imx-media-csi.c     |   33 +-
>  .../staging/media/imx/imx-media-dev-common.c  |    4 +
>  drivers/staging/media/imx/imx-media-utils.c   |   23 +-
>  drivers/staging/media/imx/imx-media-vdic.c    |    7 +-
>  drivers/staging/media/imx/imx-media.h         |   12 +-
>  drivers/staging/media/imx/imx6-mipi-csi2.c    |    6 +-
>  drivers/staging/media/imx/imx7-media-csi.c    | 1016 ++++++++---------
>  drivers/staging/media/imx/imx7-mipi-csis.c    |  412 ++++---
>  include/media/v4l2-mc.h                       |    8 +-
>  20 files changed, 1422 insertions(+), 1135 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/fsl,imx7-mipi-csi2.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 
