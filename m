Return-Path: <linux-media+bounces-47657-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BCEC8034F
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 12:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 86DF634177D
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 11:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609BE2FC891;
	Mon, 24 Nov 2025 11:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qUXKBc1V"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2C224501B
	for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 11:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763983799; cv=none; b=CZFc58vTnD6lYj/Fn+SKq1cpkZjf5eJ6U/AHl/3kazfZArbGuhe6729wF8+2azp7r61tyjbpwA5iwCtT+CZcyQFMWlb1JWghB/fwfDaLdrPRH3WHtSINOLlXq5NdZDT0i2kbE1r2wLs78b8V/E3HZDq5hDRGXZnqrl+NWz6jfTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763983799; c=relaxed/simple;
	bh=ZfxbJFOCvpUd/PULkXlTFmjpjKsQPY0hd2+bDJF7gtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qL8OyfhJFwJBUv2Vrg5yV+mtvDLTvLHVM9hwhKdckvYZ0DW8Zmry9LaCB96Rglp3lZPlIlgjRZPnT4yeVsuNp1c4x0M/4k17XMn9CCxOOkPLDSsTUqhbxZSWvkwtfpaAJrALkHl+Njdeg5KJNnb8uwsZcd4f4NJ5WD32+QuRS5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qUXKBc1V; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-137-64.net.vodafone.it [5.90.137.64])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19D3429A;
	Mon, 24 Nov 2025 12:27:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763983667;
	bh=ZfxbJFOCvpUd/PULkXlTFmjpjKsQPY0hd2+bDJF7gtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qUXKBc1Vy9+DwohfLxMBk1FHn6r0F8rjZqszIUGjPN+rWVcZ/hqHsmF1msCZ89nA0
	 PrweIudi9CsxXL4TzhQuFP6OChqXEKhJvymPZR/OwbY+M7tGQacdjdFbl3Nkfv8SnX
	 olMtybglp/4UHtQ1SkUG9J40BHLk50R22Rh5q2+8=
Date: Mon, 24 Nov 2025 12:29:51 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sune Brian <briansune@gmail.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org
Subject: Re: [HELP] V4L2 kept reporting CROPCAP fail
Message-ID: <nzdpyei6act77bgfpk5osp2tfu7pdtelcr3kwe34fff4ebcjhc@37kzh2xmj3m2>
References: <CAN7C2SA34JN71qvqyefmr9h11SsmCaeGGVyc=GW408+MrC-aRg@mail.gmail.com>
 <3qt2yxwubrxhbhst5o2ig5ng4wqokzfg6uqzrtc2lfzq2cjbds@uwdb3zg2a7vi>
 <CAN7C2SC+nDhoHonOB=AkKgsunyijuV0aAYvBJ1C5iaU76Q0U5Q@mail.gmail.com>
 <57px3akwyj6usy6llbichpu4ioaj7kj2sbv3jzqt3fo4bjknvd@hnw6docub3nr>
 <CAN7C2SB1ZG+6or=WMFEYu3DW2e4DBT7QEWE0SzUGt2dn9x=9gQ@mail.gmail.com>
 <eprej6n372zpf6atrhyzzee4cqoq742lmnhwjqgi4le735oj3s@5rjycx3q7ovf>
 <CAN7C2SB4XzQfixBcXmHbVPk1=PBD+MQLH7AbvT=cTnRgQOS=OA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAN7C2SB4XzQfixBcXmHbVPk1=PBD+MQLH7AbvT=cTnRgQOS=OA@mail.gmail.com>

Hi Brian

On Mon, Nov 24, 2025 at 07:14:20PM +0800, Sune Brian wrote:
> > media-ctl -p might help
>
> > Are you setting up links and format by hand ??
>
> Yes, because no matter what you still got to control the
> crop and links setup right?

Not if you use libcamera

>
> > (inb4: should you use libcamera instead ?)
>
> I am trying to move the entire control concept from 4.19
> to 6.18 which RK itself uses gst on camera in the old days.
>

No idea what kernel support RK distributed, nor if they had any
special gstreamer pluging, sorry.

> * For what the media reports
>
> media-ctl -d /dev/media0 -p
> Media controller API version 6.18.0
>
> Media device information
> ------------------------
> driver          rkisp1
> model           rkisp1
> serial
> bus info        platform:rkisp1
> hw revision     0xa
> driver version  6.18.0
>
> Device topology
> - entity 1: rkisp1_isp (4 pads, 5 links, 0 routes)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev0
>         pad0: SINK,MUST_CONNECT
>                 [stream:0 fmt:SBGGR10_1X10/2688x1520 field:none
> colorspace:raw xfer:none ycbcr:601 quantization:full-range
>                  crop.bounds:(0,0)/2688x1520
>                  crop:(0,0)/2688x1520]
>                 <- "rkisp1_csi":1 [ENABLED]
>         pad1: SINK
>                 [stream:0 fmt:unknown/0x0 field:none]
>                 <- "rkisp1_params":0 [ENABLED,IMMUTABLE]
>         pad2: SOURCE
>                 [stream:0 fmt:YUYV8_2X8/2688x1520 field:none
> colorspace:raw xfer:none ycbcr:601 quantization:lim-range
>                  crop.bounds:(0,0)/2688x1520
>                  crop:(0,0)/2688x1520]
>                 -> "rkisp1_resizer_mainpath":0 [ENABLED]
>                 -> "rkisp1_resizer_selfpath":0 []
>         pad3: SOURCE
>                 [stream:0 fmt:unknown/0x0 field:none]
>                 -> "rkisp1_stats":0 [ENABLED,IMMUTABLE]
>
> - entity 6: rkisp1_resizer_mainpath (2 pads, 2 links, 0 routes)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev1
>         pad0: SINK,MUST_CONNECT
>                 [stream:0 fmt:YUYV8_2X8/2688x1520 field:none
> colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range
>                  crop.bounds:(0,0)/2688x1520
>                  crop:(0,0)/2688x1520]
>                 <- "rkisp1_isp":2 [ENABLED]
>         pad1: SOURCE,MUST_CONNECT
>                 [stream:0 fmt:YUYV8_2X8/2688x1520 field:none
> colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
>                 -> "rkisp1_mainpath":0 [ENABLED,IMMUTABLE]
>
> - entity 9: rkisp1_resizer_selfpath (2 pads, 2 links, 0 routes)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev2
>         pad0: SINK,MUST_CONNECT
>                 [stream:0 fmt:YUYV8_2X8/800x600 field:none
> colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range
>                  crop.bounds:(0,0)/800x600
>                  crop:(0,0)/800x600]
>                 <- "rkisp1_isp":2 []
>         pad1: SOURCE,MUST_CONNECT
>                 [stream:0 fmt:YUYV8_2X8/800x600 field:none
> colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]
>                 -> "rkisp1_selfpath":0 [ENABLED,IMMUTABLE]
>
> - entity 12: rkisp1_mainpath (1 pad, 1 link)
>              type Node subtype V4L flags 0
>              device node name /dev/video0
>         pad0: SINK
>                 <- "rkisp1_resizer_mainpath":1 [ENABLED,IMMUTABLE]
>
> - entity 16: rkisp1_selfpath (1 pad, 1 link)
>              type Node subtype V4L flags 0
>              device node name /dev/video1
>         pad0: SINK
>                 <- "rkisp1_resizer_selfpath":1 [ENABLED,IMMUTABLE]
>
> - entity 20: rkisp1_stats (1 pad, 1 link)
>              type Node subtype V4L flags 0
>              device node name /dev/video2
>         pad0: SINK
>                 <- "rkisp1_isp":3 [ENABLED,IMMUTABLE]
>
> - entity 24: rkisp1_params (1 pad, 1 link)
>              type Node subtype V4L flags 0
>              device node name /dev/video3
>         pad0: SOURCE
>                 -> "rkisp1_isp":1 [ENABLED,IMMUTABLE]
>
> - entity 28: rkisp1_csi (2 pads, 2 links, 0 routes)
>              type V4L2 subdev subtype Unknown flags 0
>              device node name /dev/v4l-subdev3
>         pad0: SINK,MUST_CONNECT
>                 [stream:0 fmt:SBGGR10_1X10/2688x1520 field:none]
>                 <- "ov4689 1-0036":0 [ENABLED]
>         pad1: SOURCE,MUST_CONNECT
>                 [stream:0 fmt:SBGGR10_1X10/2688x1520 field:none]
>                 -> "rkisp1_isp":0 [ENABLED]
>
> - entity 45: ov4689 1-0036 (1 pad, 1 link, 0 routes)
>              type V4L2 subdev subtype Sensor flags 0
>              device node name /dev/v4l-subdev4
>         pad0: SOURCE
>                 [stream:0 fmt:SBGGR10_1X10/2688x1520 field:none
>                  crop.bounds:(0,0)/2720x1536
>                  crop:(16,8)/2688x1520]
>                 -> "rkisp1_csi":0 [ENABLED]
>
>
> > Anyway, from a brief look at it, the implementation of v4l_cropcap()
> > in v4l2-ioctl.c ends up calling g_selection() on your /dev/video0
> > which I presume corresponds to the ISP main/self path.
> >
> > The capture devices on the RkISP1 ISP do not implement g_selection(),
> > as the cropping/scaling is performed on the resizers, so
> > I suspect you get a -ENOTTY there
> >
> > You can try reproduce using the --get-selection v4l2-ctl option (with
> > any target) and see that it fails on /dev/video0 but should work on
> > the resizer subdev
>
> I am not sure I am getting you right but I will try.
> I did not read all the code but from what I understand.
>
> MIPI camera itself does not support crop by its own explanation as such.

It's not that the ISP doesn't support cropping, the -driver-
implements cropping support on a different device than /dev/video0

v4l2-src only knows about /dev/video0 and tries to get the crop from
there.

libcamera knows that the RkISP1 pipeline implements crop on the
resizers and gets/sets it from there.

> * First it requires the IIC register setup from the beginning.
> * Second it changed all timing and possible hazards. Which involves
> DTS from first place.
> * Third it make no reason on such when cropping on other layer is
> more easier these days (pure my guess). But trade off my guess is
> memory and bandwidth wasted.
>

Not sure I'm following 100%.

The issue is purely about software, where the driver expects to
receive crop commands and where v4l2-src actually sends/reads them.

v4l2-src and in general the raw V4L2 APIs cannot be used (easily at
least) on complex cameras which are not solely controlled by
/dev/video0

> # My replication of the command you proposed.
>
> v4l2-ctl -d /dev/v4l-subdev4 --get-selection target=crop
> VIDIOC_G_SELECTION: failed: Inappropriate ioctl for device
>
> This is expected as above observation had explained.
>
> > -------------------------------------------------------------------------------
> > - entity 9: rkisp1_mainpath (1 pad, 1 link)
> >             type Node subtype V4L flags 0
> >             device node name /dev/video4
> >         pad0: SINK
> >                 <- "rkisp1_resizer_mainpath":1 [ENABLED,IMMUTABLE]
> >
> > ~# v4l2-ctl -d /dev/video4 --get-selection target=crop
> > VIDIOC_G_SELECTION: failed: Inappropriate ioctl for device
> > -------------------------------------------------------------------------------
>
> Yes, I think it is aligned with my case. This is allowed.
>
> v4l2-ctl -d /dev/v4l-subdev1 --get-subdev-selection pad=0,target=crop
> ioctl: VIDIOC_SUBDEV_G_SELECTION (pad=0,stream=0)
> Selection: crop, Left 0, Top 0, Width 2688, Height 1520, Flags:
>

Thanks for confirming

> > -------------------------------------------------------------------------------
> > - entity 6: rkisp1_resizer_mainpath (2 pads, 2 links, 0 routes)
> >             type V4L2 subdev subtype Unknown flags 0
> >             device node name /dev/v4l-subdev9
> >         pad0: SINK,MUST_CONNECT
> >                 [stream:0 fmt:YUYV8_2X8/1920x1080 field:none colorspace:rec709 xfer:none ycbcr:601 quantization:lim-range
> >                  crop.bounds:(0,0)/1920x1080
> >                  crop:(0,0)/1920x1080]
> >                 <- "rkisp1_isp":2 [ENABLED]
> >         pad1: SOURCE,MUST_CONNECT
> >                 [stream:0 fmt:YUYV8_1_5X8/1920x1080 field:none colorspace:rec709 xfer:none ycbcr:601 quantization:lim-range]
> >                 -> "rkisp1_mainpath":0 [ENABLED,IMMUTABLE]
> >
> > ~# v4l2-ctl -d /dev/v4l-subdev9 --get-subdev-selection pad=0,target=crop
> > ioctl: VIDIOC_SUBDEV_G_SELECTION (pad=0,stream=0)
> > Selection: crop, Left 0, Top 0, Width 1920, Height 1080, Flags:
> > -------------------------------------------------------------------------------
> >
> > I guess this is "expected"... you shouldn't try to operate a complex
> > camera system like the rkisp1 with the v4l2-src element as it expects
> > to operate on "simple" devices like USB camera where the whole
> > configuration happens on a single /dev/video0.
> >
> > For complex cameras you should rather use libcamera (through the
> > libcamerasrc plugin if you like gstreamer) which knows
> > exactly on which part of the system to apply the right commands to.
> >
> > RkISP1 is one of the best supported devices in libcamera, so it should
> > work out-of-the-box (last famous words) assuming your image sensor is
> > supported.
>
> Got to try.
> Is that warming is expected or it is s.t. messed up?

The warning is expected if you operate the ISP driver as it is not
intended to be operated, by using v4l2-src which should only be used
for USB webcams these days (ok, maybe not only for USB cameras, but
you got my point).

The way to operate complex cameras, with complex media graphs, many
/dev/v4l-subdevX and many /dev/videoX is to use libcamera (or to
write/script something on your own that does the equivalent, but you
won't get Auto WB/Auto AEGC and your images will be almost unusable).

> Still not getting it. as I don't expect all layers must support crop features.
>
> Brian

