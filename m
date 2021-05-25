Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7138338FFE3
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 13:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbhEYL1A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 07:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbhEYL0z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 07:26:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D81C061574;
        Tue, 25 May 2021 04:25:24 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B3DCE880;
        Tue, 25 May 2021 13:25:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621941920;
        bh=xAVJXAPxh0BDRBM/cD6w3lzUBqxej9vAVoUedbwIVAI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YfUd10pLhM24xXvj5bXKGV0d1oYkJkgvEYur6UNzGvnfQynIi7ld6S+3Tl8+VvOQY
         ewsH10KPhVsACeF1rkw+KAtsBVSSwuwtHOFBo8uCb0tGPYZ1HtfYQHnzXb5NuqBFeW
         9XHy1gGQpHWnHOablCiJ2WGcFmQp4c7ZAvDwVN9g=
Date:   Tue, 25 May 2021 14:25:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     devicetree@vger.kernel.org, festevam@gmail.com,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, marex@denx.de, p.zabel@pengutronix.de,
        rmfrfs@gmail.com, robh@kernel.org, slongerbeam@gmail.com
Subject: Re: [PATCH 00/23] media: imx: imx7-mipi-csis: Add i.MX8MM support /
 imx8mq support
Message-ID: <YKzemx4ZPH2SJS2A@pendragon.ideasonboard.com>
References: <YKRmhSn65fiqshsp@pendragon.ideasonboard.com>
 <7f922c8b3d4396c00ba15ad99dd572699f4b69b1.camel@puri.sm>
 <YKUy8gu3Jc3VDy5i@pendragon.ideasonboard.com>
 <f1d44bbd85edf547bc2b7c758b5e822e08cc80d0.camel@puri.sm>
 <YKZX8z1Vb0PAYk+G@pendragon.ideasonboard.com>
 <eff48d63017dc4ed1111b7d87a731d587f51885d.camel@puri.sm>
 <YKeAuGJbr9CorhZR@pendragon.ideasonboard.com>
 <bd5dc783e39d750693ac2b49050681c5e3088330.camel@puri.sm>
 <YKe3aQHr+BsJ3ueY@pendragon.ideasonboard.com>
 <d5091b38da0216c581f9bcc13a1704ff09f6b310.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d5091b38da0216c581f9bcc13a1704ff09f6b310.camel@puri.sm>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Martin,

On Tue, May 25, 2021 at 09:32:54AM +0200, Martin Kepplinger wrote:
> Am Freitag, dem 21.05.2021 um 16:36 +0300 schrieb Laurent Pinchart:
> > On Fri, May 21, 2021 at 01:02:30PM +0200, Martin Kepplinger wrote:
> > > Am Freitag, dem 21.05.2021 um 12:43 +0300 schrieb Laurent Pinchart:
> > > > On Fri, May 21, 2021 at 11:25:20AM +0200, Martin Kepplinger wrote:

[snip]

> > > > > media-ctl --set-v4l2 "'csi':0 [fmt:SGBRG10/640x480 colorspace:raw]"
> > > > > media-ctl --set-v4l2 "'imx8mq-mipi-csi2.0':0 [fmt:SGBRG10/640x480 colorspace:raw]"
> > > > > media-ctl -l "'hi846 2-0020':0 -> 'imx8mq-mipi-csi2.0':0 [1]"
> > > > > 
> > > > > which gets me:
> > > > > 
> > > > > Device topology
> > > > > - entity 1: csi (2 pads, 2 links)
> > > > >             type V4L2 subdev subtype Unknown flags 0
> > > > >             device node name /dev/v4l-subdev0
> > > > >         pad0: Sink
> > > > >                 [fmt:SGBRG10_1X10/640x480 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range]
> > > > >                 <- "imx8mq-mipi-csi2.0":1 [ENABLED,IMMUTABLE]
> > > > >         pad1: Source
> > > > >                 [fmt:SGBRG10_1X10/640x480 field:none colorspace:raw xfer:none ycbcr:601 quantization:full-range]
> > > > >                 -> "csi capture":0 [ENABLED,IMMUTABLE]
> > > > > 
> > > > > - entity 4: csi capture (1 pad, 1 link)
> > > > >             type Node subtype V4L flags 0
> > > > >             device node name /dev/video0
> > > > >         pad0: Sink
> > > > >                 <- "csi":1 [ENABLED,IMMUTABLE]
> > > > > 
> > > > > - entity 10: imx8mq-mipi-csi2.0 (2 pads, 2 links)
> > > > >              type V4L2 subdev subtype Unknown flags 0
> > > > >              device node name /dev/v4l-subdev1
> > > > >         pad0: Sink
> > > > >                 [fmt:SGBRG10_1X10/640x480]
> > > > >                 <- "hi846 2-0020":0 [ENABLED]
> > > > >         pad1: Source
> > > > >                 [fmt:SGBRG10_1X10/640x480]
> > > > >                 -> "csi":0 [ENABLED,IMMUTABLE]
> > > > > 
> > > > > - entity 15: hi846 2-0020 (1 pad, 1 link)
> > > > >              type V4L2 subdev subtype Sensor flags 0
> > > > >              device node name /dev/v4l-subdev2
> > > > >         pad0: Source
> > > > >                 [fmt:SGBRG10_1X10/640x480 field:none colorspace:raw]
> > > > >                 -> "imx8mq-mipi-csi2.0":0 [ENABLED]
> > > > 
> > > > This looks better.
> > > > 
> > > > > but streaming still fails with:
> > > > > 
> > > > > [  352.255129] imx7-csi 30a90000.csi1_bridge: media bus code not
> > > > > compatible with the pixel format set on the video node: 1 != 0
> > > > 
> > > > What is the capture command line ? Can you trace this (I assume the
> > > > message is printed by capture_validate_fmt(), it's not present in
> > > > mainline so I don't know what 1 and 0 correspond to, even though I
> > > > suspect they would be IPUV3_COLORSPACE_* values) to see why it fails
> > > > ?
> > > 
> > > capture command:
> > > 
> > > v4l2-ctl -d "/dev/v4l/by-path/platform-30a90000.csi1_bridge-video-
> > > index0" --set-fmt-video=width=640,height=480 --stream-mmap
> > > --stream-to=test.raw --stream-count=1
> > > 
> > > I'll have to continue after the weekend, but let's share some logs.
> > > Yes, "1 != 0" is from capture_validate_fmt():
> > > 
> > > priv->vdev.cc->cs != cc->cs
> > > 
> > > When I print the format the imx_media_find_mbus_format() finds and
> > > do:
> > > 
> > > media-ctl --set-v4l2 "'csi':0 [fmt:SGBRG10/640x480 colorspace:raw]"
> > > 
> > > I see:
> > > 
> > > [  184.251144] mc: media_release: Media Release
> > > [  184.254397] selected specific mbus code 0 for list nr 0 (fourcc 0x59565955)
> > > [  184.264564] selected specific mbus code 0 for list nr 0 (fourcc 0x59565955)
> > > [  184.274763] selected specific mbus code 0 for list nr 21 (fourcc 0x36314247)
> > > [  184.285102] selected specific mbus code 0 for list nr 21 (fourcc 0x36314247)
> > > [  184.295383] selected specific mbus code 0 for list nr 21 (fourcc 0x36314247)
> > > [  184.305752] selected specific mbus code 0 for list nr 21 (fourcc 0x36314247)
> > > 
> > > 21 is the correct bayer format I want, but there's 0, so
> > > "MEDIA_BUS_FMT_UYVY8_2X8" found the first 2 times. That is
> > > IPUV3_COLORSPACE_YUV (1) while the correct Bayer format 21 is
> > > IPUV3_COLORSPACE_RGB (0).
> > > 
> > > so some format settings not yet correct.
> > 
> > You need to specify the capture pixel format to v4l2-ctl. The driver
> > defaults to YUYV (I think) otherwise. The CSI bridge will pad data with
> > 0's on the right, so you need SGBRG16 (if I recall correctly, try
> > SGRBG10 if it doesn't work).
> 
> right, now with:
> 
> v4l2-ctl -d "/dev/v4l/by-path/platform-30a90000.csi1_bridge-video-
> index0" --set-fmt-video=width=640,height=480,pixelformat='GB16'
> --stream-mmap --stream-to=test.raw --stream-count=1
> 
> indeed the colorspace mismatch is gone.
> 
> __media_pipeline_start returns broken pipe because of:
> link validation failed for 'hi846 2-0020':0 -> 'imx8mq-mipi-csi2.0':0, error -32:
> 
> imx7-csi 30a90000.csi1_bridge: walk: returning entity 'hi846 2-0020'
> imx7-csi 30a90000.csi1_bridge: walk: returning entity 'imx8mq-mipi-csi2.0'
> hi846 2-0020: hi846: starting hi846_get_format
> hi846 2-0020: Get format w=640 h=480 code=0x300e colorspace=0xb
> imx7-csi 30a90000.csi1_bridge: v4l2_subdev_link_validate_default: field does not match (source 1, sink 0)
> imx7-csi 30a90000.csi1_bridge: v4l2_subdev_link_validate_default: link was "hi846 2-0020":0 -> "imx8mq-mipi-csi2.0":0
> imx7-csi 30a90000.csi1_bridge: link validation failed for 'hi846 2-0020':0 -> 'imx8mq-mipi-csi2.0':0, error -32
> ...
> imx7-csi 30a90000.csi1_bridge: pipeline start failed with -32
> 
> 
> then I added the init_cfg() callback (that sets sink field to NONE) and
> I could stream frames.

Nice :-)

> So the v4l2/mc side of things looks ok, despite the one thing:
> 
> Also, now when saying "--list-formats-ext" on the video node, it lists
> all formats that the mipi driver supports (since it doesn't ask the
> sensor anymore about that). That seems to be wrong.

That's expected. You can restrict the enumerated formats to the ones
matching a given media bus code by setting the mbus_code field of struct
v4l2_fmtdesc ([1]).

[1] https://linuxtv.org/downloads/v4l-dvb-apis/userspace-api/v4l/vidioc-enum-fmt.html#c.V4L.v4l2_fmtdesc

> Also, the frames are all black, so I'll need to debug the driver side
> of things.

Indeed :-)

> But I again append the current driver in case you want to have a look.

I'm afraid I don't have time right now, but I'll try to review it when
you'll post the patches.

It'd be curious to try the libcamera simple pipeline handler based on
that code.

> thanks so much for walking through this with me :) I won't forget the
> dt properties and upstreaming - after I get correct frames.

-- 
Regards,

Laurent Pinchart
