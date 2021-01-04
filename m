Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF3A2E905A
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 07:06:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbhADGGY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 01:06:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbhADGGX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 01:06:23 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78990C061574
        for <linux-media@vger.kernel.org>; Sun,  3 Jan 2021 22:05:43 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF2BF2E0;
        Mon,  4 Jan 2021 07:05:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609740342;
        bh=FmMDEG141I5exVxr2DRp+PB0DvR+WuVjay6dtE0XoA4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B1GLgaTcb/oUoy3w/B1lG8n/yJpLaczfbaPj+hqXjtVwfFZXx+r/x0ydPFWBzWTWa
         IyVDMbFEuza1bJHHhuBammhkpYXkVxEMiwWlAl0yXvca33jvAprN9sBjk989D1LTfG
         N3VQVAXZkYMM2YNXr3LPwQabDyEm7t34app/DnTc=
Date:   Mon, 4 Jan 2021 08:05:30 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        linux-media <linux-media@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        =?utf-8?Q?S=C3=A9bastien?= Szymanski 
        <sebastien.szymanski@armadeus.com>
Subject: Re: imx6ull capture from OV5640
Message-ID: <X/KwKikMayH8AHnG@pendragon.ideasonboard.com>
References: <CAOMZO5DTW_YgVgyXqtccxQUm0A2kLLVcw_EhfsN0kZ9s2hgt7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOMZO5DTW_YgVgyXqtccxQUm0A2kLLVcw_EhfsN0kZ9s2hgt7Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On Wed, Dec 30, 2020 at 02:45:41PM -0300, Fabio Estevam wrote:
> Hi,
> 
> I am trying to capture from a parallel OV5640 on a imx6ull-evk board.
> 
> Here are the device tree changes:
> https://pastebin.com/raw/PZpJjagJ
> 
> First, I got the following warning:
> 
> [    7.788866] csi: Registered csi capture as /dev/video1
> [    7.797382] ------------[ cut here ]------------
> [    7.802141] WARNING: CPU: 0 PID: 1 at
> drivers/staging/media/imx/imx7-media-csi.c:1168
> imx7_csi_notify_bound+0x40/0x50
> [    7.813116] Modules linked in:
> [    7.816436] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> 5.10.0-next-20201223-00003-gaaee78ed150-dirty #304
> [    7.826015] Hardware name: Freescale i.MX6 Ultralite (Device Tree)
> [    7.832281] [<c0111a68>] (unwind_backtrace) from [<c010c068>]
> (show_stack+0x10/0x14)
> [    7.840151] [<c010c068>] (show_stack) from [<c0e14570>]
> (dump_stack+0xe0/0x10c)
> [    7.847570] [<c0e14570>] (dump_stack) from [<c0125a7c>] (__warn+0x104/0x118)
> [    7.854734] [<c0125a7c>] (__warn) from [<c0125b38>]
> (warn_slowpath_fmt+0xa8/0xb8)
> [    7.862326] [<c0125b38>] (warn_slowpath_fmt) from [<c0a66e0c>]
> (imx7_csi_notify_bound+0x40/0x50)
> [    7.871227] [<c0a66e0c>] (imx7_csi_notify_bound) from [<c09ae084>]
> (v4l2_async_match_notify+0x50/0x124)
> 
> To avoid the warning I did:
> 
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -1164,12 +1164,14 @@ static int imx7_csi_notify_bound(struct
> v4l2_async_notifier *notifier,
>         struct imx7_csi *csi = imx7_csi_notifier_to_dev(notifier);
>         struct media_pad *sink = &csi->sd.entity.pads[IMX7_CSI_PAD_SINK];
> 
> -       /* The bound subdev must always be the CSI mux */
> -       if (WARN_ON(sd->entity.function != MEDIA_ENT_F_VID_MUX))
> -               return -ENXIO;
> +       if (csi->is_csi2) {
> +               /* The bound subdev must always be the CSI mux */
> +               if (WARN_ON(sd->entity.function != MEDIA_ENT_F_VID_MUX))
> +                       return -ENXIO;
> 
> -       /* Mark it as such via its group id */
> -       sd->grp_id = IMX_MEDIA_GRP_ID_CSI_MUX;
> +               /* Mark it as such via its group id */
> +               sd->grp_id = IMX_MEDIA_GRP_ID_CSI_MUX;
> +       }
> 
>         return v4l2_create_fwnode_links_to_pad(sd, sink);
>  }

That's not right, csi->is_csi2 is a flag that indicates if the current
input to the CSI comes from the CSI-2 receiver.

It looks like the i.MX6ULL is missing the MIPI CSI-2 receiver and thus
also the corresponding video mux. The WARN_ON() should thus indeed by
bypassed, but only for devices that don't have the video mux. I wouldn't
be surprised if other adaptations would be needed in the code.

On a side note, the driver is a bit hard to read, mixing i.MX6 and i.MX7
support leads to quite a bit of spaghetti code (and i.MX6 is a misnommer
to start with, as shown by the i.MX6ULL that has a CSI, not an IPUv3).
We should split the driver in two, rename i.MX7 support to CSI and i.MX6
to IPUv3, but that will be a large effort.

> # media-ctl -p
> Media controller API version 5.10.0
> 
> Media device information
> ------------------------
> driver          imx7-csi
> model           imx-media
> serial
> bus info
> hw revision     0x0
> driver version  5.10.0
> 
> Device topology
> - entity 1: csi (2 pads, 2 links)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev0
>         pad0: Sink
>                 [fmt:UYVY8_2X8/800x600 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:lim-range]
>                 <- "ov5640 1-003c":0 []
>         pad1: Source
>                 [fmt:UYVY8_2X8/800x600 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:lim-range]
>                 -> "csi capture":0 []
> 
> - entity 4: csi capture (1 pad, 1 link)
>             type Node subtype V4L flags 0
>             device node name /dev/video1
>         pad0: Sink
>                 <- "csi":1 []
> 
> - entity 10: ov5640 1-003c (1 pad, 1 link)
>              type V4L2 subdev subtype Sensor flags 0
>              device node name /dev/v4l-subdev1
>         pad0: Source
>                 [fmt:UYVY8_2X8/640x480@1/30 field:none colorspace:srgb
> xfer:srgb ycbcr:601 quantization:full-range]
>                 -> "csi":0 []
> And then:
> 
> media-ctl -l "'ov5640 1-003c':0 -> 'csi':0[1]"
> media-ctl -l "'csi':1 -> 'csi capture':0[1]"
> media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY2X8/640x480]"
> media-ctl -V "'csi':0 [fmt:AYUV32/640x480]"
> 
> When trying to capture via v42-ctl:
> # v4l2-ctl --stream-mmap -d /dev/video1
> [  411.627032] csi: capture format not valid
> 
> Or with gstreamer:
> 
> # gst-launch-1.0 v4l2src device=/dev/video1 ! fakesink
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> Pipeline is PREROLLED ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> [  439.933324] csi: pipeline start failed with -19
> 
> Any suggestions?
> 
> Thanks,
> 
> Fabio Estevam

-- 
Regards,

Laurent Pinchart
