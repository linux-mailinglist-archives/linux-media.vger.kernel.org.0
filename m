Return-Path: <linux-media+bounces-19946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B245A9A575D
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 00:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EBEA281B92
	for <lists+linux-media@lfdr.de>; Sun, 20 Oct 2024 22:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B7E198A3B;
	Sun, 20 Oct 2024 22:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f+7O/O+B"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC1D440C;
	Sun, 20 Oct 2024 22:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729463972; cv=none; b=XI27FOMxjPx6cVJOYeEAHlDxBCjaCMu0U70MjdsIrp9oPcRAfenyKImTGtE45N21pvhghYRFf3L+Xrn3JF11Ea7Y6bRfiMS8UcfT+m46IC2ZtvHU7WXuFP+L2VrkMW+zvcfmwp6W0FEHGoBuTSklqzxfpVqRlZldLLr/cJPtySo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729463972; c=relaxed/simple;
	bh=B52J3Ry8R5IFVTe51jLTiTaQXxZQUXukXkVYt0r79d8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OW/Cijme7+EQqOhAseVqLUDmvbOLq73YUFnu/TT2Ka9B7C3Z7GlAmVGMfrzeEsu8xZiHP4iWxqfMEctt4xCK2zYw1u/j3L3cPwCfc4RU0hGoOoqpqLYBDLxj2UXZAFKzI78PKilGZBJRZHlwOoE+eYQR39tJ4+qOpG85skU7Ybo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f+7O/O+B; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66BE74CF;
	Mon, 21 Oct 2024 00:37:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729463863;
	bh=B52J3Ry8R5IFVTe51jLTiTaQXxZQUXukXkVYt0r79d8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f+7O/O+BpUbvW66TZHPEO/MNFUlWQfYzwgWQXyESuBkJcUtJ89NxZrAC67FEIwtGf
	 537S3Hp5x7/0ijXWtRo9J2FQXWbkT1LyfNqQH5OZXg4dBJkOdTfV8YCJnnxRGynIzz
	 MtP+OohWwqCxGI/HHy+RzD0fXbmjCEQSyuJegjrs=
Date: Mon, 21 Oct 2024 01:39:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 00/10] media: ov5645: Add support for streams
Message-ID: <20241020223923.GB14328@pendragon.ideasonboard.com>
References: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241018153230.235647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patches.

I think patch 01/10 should be dropped in favour of
https://lore.kernel.org/r/20241020164354.GG7770@pendragon.ideasonboard.com
("[PATCH v2] media: v4l2-subdev: Refactor events"). Patches 02/10 to
08/10 seem ready, should we merge them without waiting for 09/10 and
10/10 ?

On Fri, Oct 18, 2024 at 04:32:20PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Hi All,
> 
> This patch series aims to add the below features,
> - Support subdev active state
> - Support for streams
> - Support for virtual channel
> - Code cleanup
> 
> Note, these patches are dependent on below:
> 1] https://patchwork.kernel.org/project/linux-media/patch/20240416193319.778192-27-sakari.ailus@linux.intel.com/
> 2] https://patchwork.kernel.org/project/linux-media/patch/20240416193319.778192-26-sakari.ailus@linux.intel.com/
> 
> v2->v3
> - Fixed review commments from Laurent
> - Included RB tags from Laurent
> - Dropped patch "media: i2c: ov5645: Enable runtime PM after v4l2_async_register_subdev()"
> - Fixed checkpatch issues (ie used --max-line-length=80)
> 
> RFC->v2
> - Dropped setting of VC using routes
> - Defaulted the native format to MEDIA_BUS_FMT_SBGGR8_1X8
> - Fixed ov5645_enum_frame_size and ov5645_enum_mbus_code
>   for internal image pad
> 
> RFC patch,
> Link: https://lore.kernel.org/all/20240904210719.52466-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 
> Test logs:
> ====================================
> root@smarc-rzg2l:~# media-ctl -p
> ......
> - entity 4: ov5645 0-003c (2 pads, 1 link, 1 route)
>       type V4L2 subdev subtype Sensor flags 0
>       device node name /dev/v4l-subdev1
>     routes:
>         1/0 -> 0/0 [ACTIVE]
>     pad0: SOURCE
>         [stream:0 fmt:UYVY8_1X16/1280x960 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range
>         crop:(0,0)/1280x960]
>         -> "csi-10830400.csi2":0 [ENABLED,IMMUTABLE]
>     pad1: SINK,0x8
>         [stream:0 fmt:SBGGR8_1X8/2592x1944 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:lim-range
>         crop:(0,0)/1280x960]
> ......
> 
> root@smarc-rzg2l:~# v4l2-ctl --device /dev/v4l-subdev1 --list-subdev-mbus-codes pad=0
> ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=0,stream=0)
>     0x200f: MEDIA_BUS_FMT_UYVY8_1X16
> root@smarc-rzg2l:~# v4l2-ctl --device /dev/v4l-subdev1 --list-subdev-mbus-codes pad=1
> ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=1,stream=0)
>     0x3001: MEDIA_BUS_FMT_SBGGR8_1X8
> root@smarc-rzg2l:~# v4l2-ctl --device /dev/v4l-subdev1 --list-subdev-framesizes pad=1,code=0x3001
> ioctl: VIDIOC_SUBDEV_ENUM_FRAME_SIZE (pad=1,stream=0)
>     Size Range: 2592x1944 - 2592x1944
> root@smarc-rzg2l:~# v4l2-ctl --device /dev/v4l-subdev1 --list-subdev-framesizes pad=0,code=0x200f
> ioctl: VIDIOC_SUBDEV_ENUM_FRAME_SIZE (pad=0,stream=0)
>     Size Range: 1280x960 - 1280x960
>     Size Range: 1920x1080 - 1920x1080
>     Size Range: 2592x1944 - 2592x1944
> root@smarc-rzg2l:~# v4l2-compliance -u /dev/v4l-subdev1
> v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
> v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15
> 
> Compliance test for device /dev/v4l-subdev1:
> 
> Driver Info:
>     Driver version  : 6.12.0
>     Capabilities   : 0x00000002
>         Streams Support
>     Client Capabilities: 0x00000[ 2429.125325] ov5645 0-003c: ================= START STATUS =================
> 00000000003
> streams int[ 2429.134589] ov5645 0-003c: ================== END STATUS ==================
> erval-uses-which
> Required ioctls:
>     test VIDIOC_SUDBEV_QUERYCAP: OK
>     test invalid ioctls: OK
> 
> Allow for multiple opens:
>     test second /dev/v4l-subdev1 open: OK
>     test VIDIOC_SUBDEV_QUERYCAP: OK
>     test for unlimited opens: OK
> 
> Debug ioctls:
>     test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>     test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>     test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>     test VIDIOC_ENUMAUDIO: OK (Not Supported)
>     test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>     test VIDIOC_G/S_AUDIO: OK (Not Supported)
>     Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>     test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>     test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>     test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>     test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>     test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>     Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>     test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>     test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>     test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>     test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Sub-Device routing ioctls:
>     test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
>     test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
> 
> Control ioctls:
>     test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>     test VIDIOC_QUERYCTRL: OK
>     test VIDIOC_G/S_CTRL: OK
>     test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>     test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>     test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>     Standard Controls: 12 Private Controls: 0
> 
> Format ioctls:
>     test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>     test VIDIOC_G/S_PARM: OK (Not Supported)
>     test VIDIOC_G_FBUF: OK (Not Supported)
>     test VIDIOC_G_FMT: OK (Not Supported)
>     test VIDIOC_TRY_FMT: OK (Not Supported)
>     test VIDIOC_S_FMT: OK (Not Supported)
>     test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>     test Cropping: OK (Not Supported)
>     test Composing: OK (Not Supported)
>     test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>     test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>     test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>     test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>     test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>     test CREATE_BUFS maximum buffers: OK
>     test VIDIOC_REMOVE_BUFS: OK
>     test VIDIOC_EXPBUF: OK (Not Supported)
>     test Requests: OK (Not Supported)
> 
> Total for device /dev/v4l-subdev1: 47, Succeeded: 47, Failed: 0, Warnings: 0
> ------------------------------------------------------------
> 
> Lad Prabhakar (10):
>   media: i2c: ov5645: Add V4L2_SUBDEV_FL_HAS_EVENTS and subscribe hooks
>   media: i2c: ov5645: Use local `dev` pointer for subdev device
>     assignment
>   media: i2c: ov5645: Replace dev_err with dev_err_probe in probe
>     function
>   media: i2c: ov5645: Use v4l2_async_register_subdev_sensor()
>   media: i2c: ov5645: Drop `power_lock` mutex
>   media: i2c: ov5645: Use subdev active state
>   media: i2c: ov5645: Switch to {enable,disable}_streams
>   media: i2c: ov5645: Report streams using frame descriptors
>   media: i2c: ov5645: Add internal image sink pad
>   media: i2c: ov5645: Report internal routes to userspace
> 
>  drivers/media/i2c/ov5645.c | 435 +++++++++++++++++++++----------------
>  1 file changed, 246 insertions(+), 189 deletions(-)

-- 
Regards,

Laurent Pinchart

