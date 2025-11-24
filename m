Return-Path: <linux-media+bounces-47653-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FFDC7FF25
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 11:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7B0884E4C6B
	for <lists+linux-media@lfdr.de>; Mon, 24 Nov 2025 10:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9134921A449;
	Mon, 24 Nov 2025 10:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PpBaKES6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AB32749C7
	for <linux-media@vger.kernel.org>; Mon, 24 Nov 2025 10:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763980793; cv=none; b=heEZLXkAkM6moQnoQy3fhiqXfPCZra951TkdCXSUoy/6gRYRKH9SifQoWGq+btTSrgnoTd6/xYsRxGhUEuYFV+VjSLDO8t1tEmLcB6EN1G/pSsM6dvZ5Ps/SmeiagdQsmhDSD8wgzhAGO2TfKpk9/xGcLLWUYiLCnnYfXIjlrTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763980793; c=relaxed/simple;
	bh=u2AsNNB7UzMT+Yqs3IvF/uTWdWePUjdsEDN39oPaGQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MRI9ucQV+Spbm+3yr8OKeLuVr5XroNwoY9BzrP2iqC9XBwOD3hhBb8romIVZ5L+JlCZhydzmJ9tcKNYiE4a4MiUbU12INRn9HxF9oOMpAF8MmBzzK82WuB72me53B0Ex6AsUG8LlEcrWkfib6V0j/+l8ZNU6ixETURvno7pMdrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PpBaKES6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-137-64.net.vodafone.it [5.90.137.64])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 900031774;
	Mon, 24 Nov 2025 11:37:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763980660;
	bh=u2AsNNB7UzMT+Yqs3IvF/uTWdWePUjdsEDN39oPaGQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PpBaKES6BqKiwEnCbuHjRNI4IP9BRJ69zFrEeKyi4F0BvYqBUjaOKK7/qeV0vOZv9
	 Hz8gpd5GaDk9v71mIjowNapF2ejGIOovq4Kb0hd3EaqAWh2XtGRa49Isybg9hkpm/E
	 W0FyGFJr2VHOm4YuqLdz/2zkSt+LNAlrI827vx+A=
Date: Mon, 24 Nov 2025 11:39:42 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sune Brian <briansune@gmail.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org
Subject: Re: [HELP] V4L2 kept reporting CROPCAP fail
Message-ID: <eprej6n372zpf6atrhyzzee4cqoq742lmnhwjqgi4le735oj3s@5rjycx3q7ovf>
References: <CAN7C2SA34JN71qvqyefmr9h11SsmCaeGGVyc=GW408+MrC-aRg@mail.gmail.com>
 <3qt2yxwubrxhbhst5o2ig5ng4wqokzfg6uqzrtc2lfzq2cjbds@uwdb3zg2a7vi>
 <CAN7C2SC+nDhoHonOB=AkKgsunyijuV0aAYvBJ1C5iaU76Q0U5Q@mail.gmail.com>
 <57px3akwyj6usy6llbichpu4ioaj7kj2sbv3jzqt3fo4bjknvd@hnw6docub3nr>
 <CAN7C2SB1ZG+6or=WMFEYu3DW2e4DBT7QEWE0SzUGt2dn9x=9gQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAN7C2SB1ZG+6or=WMFEYu3DW2e4DBT7QEWE0SzUGt2dn9x=9gQ@mail.gmail.com>

Hello

On Mon, Nov 24, 2025 at 05:10:12PM +0800, Sune Brian wrote:
> > Through which app ? which gstreamer version ? which camera input ?
> > (I'm trying to identify where I should suggest you to enable debug on,
> > without details, it's hard to guess).
> >
> > > The camera driver w/o any modification works but again
> > > that message is so puzzling and I cannot understand why.
> > >
> > > For kernel 6.12 that is even more trouble but I think if 6.18
> > > works why use old kernel when new kernel have its benefit.
> > > Yet, still worth to point out the issue a bit.
>
> Sure, I am going to enclose a very long log and brace yourself !!!

Not that long, don't worry

> Brian
>
> uname -a
> Linux nanopi 6.18.0-rc6-00277-gd13f3ac64efb-dirty
>
> v4l2-ctl --version
> v4l2-ctl 1.33.0-5422
> * system compiled replaced distro default install.
> gst-launch-1.0 --version
> gst-launch-1.0 version 1.26.0
> GStreamer 1.26.0
> * distro default
> distro - Ubuntu 25.04
>
> * PRINT the ISP links

media-ctl -p might help

>
> CAMERA
>                 [stream:0 fmt:SBGGR10_1X10/2688x1520 field:none
>                  crop.bounds:(0,0)/2720x1536
>                  crop:(16,8)/2688x1520]
> CSI
>                 [stream:0 fmt:SBGGR10_1X10/2688x1520 field:none]
> ISP 0
>                 [stream:0 fmt:SBGGR10_1X10/2688x1520 field:none
> colorspace:raw xfer:none ycbcr:601 quantization:full-range
>                  crop.bounds:(0,0)/2688x1520
>                  crop:(0,0)/2688x1520]
> ISP 2
>                 [stream:0 fmt:YUYV8_2X8/2688x1520 field:none
> colorspace:raw xfer:none ycbcr:601 quantization:lim-range
>                  crop.bounds:(0,0)/2688x1520
>                  crop:(0,0)/2688x1520]
> MAINPATH 0
>                 [stream:0 fmt:YUYV8_2X8/2688x1520 field:none
> colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range
>                  crop.bounds:(0,0)/2688x1520
>                  crop:(0,0)/2688x1520]
> MAINPATH 1
>                 [stream:0 fmt:YUYV8_2X8/2688x1520 field:none
> colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range]

Are you setting up links and format by hand ??
(inb4: should you use libcamera instead ?)

> vIDEO 0
> Format Video Capture Multiplanar:
>         Width/Height      : 2688/1520
>         Pixel Format      : 'YUYV' (YUYV 4:2:2)
>         Field             : None
>         Number of planes  : 1
>         Flags             :
>         Colorspace        : Default
>         Transfer Function : Default
>         YCbCr/HSV Encoding: Default
>         Quantization      : Default
>         Plane 0           :
>            Bytes per Line : 5376
>            Size Image     : 8171520
>
> * debug set to
> GST_DEBUG=3
>
> gst-launch-1.0 -e v4l2src device=/dev/video0 io-mode=4 num-buffers=1 ! \
> video/x-raw,width=2688,height=1520,format=YUY2 ! \
> videoconvert ! \
> video/x-raw,format=RGB ! \
> pngenc ! filesink location=frame.png
>
> * Image capture
>
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> 0:00:00.189451347  1586 0xffffb8000b70 WARN                    v4l2
> gstv4l2object.c:5032:gst_v4l2_object_get_crop_rect:<v4l2src0:src>
> VIDIOC_CROPCAP failed
> Pipeline is PREROLLED ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> 0:00:00.201199128  1586 0xffffb8000b70 WARN                    v4l2
> gstv4l2object.c:5032:gst_v4l2_object_get_crop_rect:<v4l2src0:src>
> VIDIOC_CROPCAP failed

Not a whole lot of debug from gst...

Anyway, from a brief look at it, the implementation of v4l_cropcap()
in v4l2-ioctl.c ends up calling g_selection() on your /dev/video0
which I presume corresponds to the ISP main/self path.

The capture devices on the RkISP1 ISP do not implement g_selection(),
as the cropping/scaling is performed on the resizers, so
I suspect you get a -ENOTTY there

You can try reproduce using the --get-selection v4l2-ctl option (with
any target) and see that it fails on /dev/video0 but should work on
the resizer subdev

-------------------------------------------------------------------------------
- entity 9: rkisp1_mainpath (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video4
	pad0: SINK
		<- "rkisp1_resizer_mainpath":1 [ENABLED,IMMUTABLE]

~# v4l2-ctl -d /dev/video4 --get-selection target=crop
VIDIOC_G_SELECTION: failed: Inappropriate ioctl for device
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
- entity 6: rkisp1_resizer_mainpath (2 pads, 2 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev9
	pad0: SINK,MUST_CONNECT
		[stream:0 fmt:YUYV8_2X8/1920x1080 field:none colorspace:rec709 xfer:none ycbcr:601 quantization:lim-range
		 crop.bounds:(0,0)/1920x1080
		 crop:(0,0)/1920x1080]
		<- "rkisp1_isp":2 [ENABLED]
	pad1: SOURCE,MUST_CONNECT
		[stream:0 fmt:YUYV8_1_5X8/1920x1080 field:none colorspace:rec709 xfer:none ycbcr:601 quantization:lim-range]
		-> "rkisp1_mainpath":0 [ENABLED,IMMUTABLE]

~# v4l2-ctl -d /dev/v4l-subdev9 --get-subdev-selection pad=0,target=crop
ioctl: VIDIOC_SUBDEV_G_SELECTION (pad=0,stream=0)
Selection: crop, Left 0, Top 0, Width 1920, Height 1080, Flags:
-------------------------------------------------------------------------------

I guess this is "expected"... you shouldn't try to operate a complex
camera system like the rkisp1 with the v4l2-src element as it expects
to operate on "simple" devices like USB camera where the whole
configuration happens on a single /dev/video0.

For complex cameras you should rather use libcamera (through the
libcamerasrc plugin if you like gstreamer) which knows
exactly on which part of the system to apply the right commands to.

RkISP1 is one of the best supported devices in libcamera, so it should
work out-of-the-box (last famous words) assuming your image sensor is
supported.


> Redistribute latency...
> Got EOS from element "pipeline0".
> EOS received - stopping pipeline...
> Execution ended after 0:00:02.288976246
> Setting pipeline to NULL ...
> Freeing pipeline ...
>
> * Image do successfully capture and normal
>
> Thanks
> Brian

