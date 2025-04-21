Return-Path: <linux-media+bounces-30629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD63EA95367
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 17:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83E9F7A3834
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 15:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856861C84BC;
	Mon, 21 Apr 2025 15:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tj/ehv3d"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAB82905;
	Mon, 21 Apr 2025 15:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745248276; cv=none; b=OVmBUpEphdDgbcxt3U2k3fFlgHOmWbKyfThtfVaaIlG986/PZIiNt6II8iPJmzv+XxNK2I+4eRzD0LwhMgj1Vx7JRStI3hvyTIUoGsy1wRY9IBHnEoarIM74D8AVPtHkjspo7suyrWwUdvZSdZ1goeXjqROS4KTKQZE+OtyUE4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745248276; c=relaxed/simple;
	bh=8LX5J5ynuAWsp0zffSJCR061mxKzk+DFHua3ZnpbBA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbaroDuUW2/Evao6pNHs7twFnhtt5nzsxKA5Fev8tDr2dBrBkbjGROdKE5dwF/tOmpCmr4DRNj55GB9R/eKHpNcYVFG0XDTapPawYrBz75gn4EyhVeFI14AIWjhLHwcZ9js9WZqhGgqBLWwjWmaaTFeSozCxvRqLpfjCDO0m3CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tj/ehv3d; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA6926D5;
	Mon, 21 Apr 2025 17:09:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745248145;
	bh=8LX5J5ynuAWsp0zffSJCR061mxKzk+DFHua3ZnpbBA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tj/ehv3dro57MQqCYZRKjLLOB7hA98O++y4zGP43i+n/pvf7uLQ80Y2izguDS8CKT
	 +QRX+JqSbzAYeDUguRBtHwz5SROINoOg/FPefB18HdZqwMLbsZEAQue3909zDMIAba
	 wuWwwJsX8bKg73bUwm6dM+UOkd43ddhwiB6AAnKo=
Date: Mon, 21 Apr 2025 18:11:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 00/17] media: rzg2l-cru: Add support for RZ/G3E (CSI2,
 CRU)
Message-ID: <20250421151108.GB19213@pendragon.ideasonboard.com>
References: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

Thank you for the patches.

On Fri, Apr 11, 2025 at 07:05:28PM +0200, Tommaso Merciai wrote:
> Dear All,
> 
> In preparation of supporting the CRU/CSI2 IPs found into the Renesas RZ/G3E
> SoC, this series adds driver/dt-bindings support.
> This adds also some minor fixes into rzg2l-csi2 and rzg2l-core drivers.
> 
> The series was tested in an out of tree branch with the following hw pipeline:
> 
> ov5645 image sensor (Coral Camera) -> rzg3e CSI2 -> rzg3e CRU
> imx219 image sensor (Pi PiNoir Camera Module V2.1) -> rzg3e CSI2 -> rzg3e CRU
> 
> base commit: 7702d0130dc00 (tag: next-20250408)

As far as I can tell, the series has been fully reviewed. I'll collect
the patches, run them through CI, and then send a pull request.

> ------
> Some logs:
> 
> root@smarc-rzg3e:~# media-ctl -p
> Media controller API version 6.15.0
> 
> Media device information
> ------------------------
> driver          rzg2l_cru
> model           renesas,r9a09g047-cru
> serial
> bus info        platform:16000000.video
> hw revision     0x0
> driver version  6.15.0
> 
> Device topology
> - entity 1: csi-16000400.csi2 (2 pads, 2 links, 0 routes)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev0
>         pad0: Sink
>                 [stream:0 fmt:UYVY8_1X16/1280x960 field:none colorspace:srgb]
>                 <- "ov5645 0-003c":0 [ENABLED,IMMUTABLE]
>         pad1: Source
>                 [stream:0 fmt:UYVY8_1X16/1280x960 field:none colorspace:srgb]
>                 -> "cru-ip-16000000.video":0 [ENABLED,IMMUTABLE]
> 
> - entity 4: cru-ip-16000000.video (2 pads, 2 links, 0 routes)
>             type V4L2 subdev subtype Unknown flags 0
>             device node name /dev/v4l-subdev1
>         pad0: Sink
>                 [stream:0 fmt:UYVY8_1X16/1280x960 field:none]
>                 <- "csi-16000400.csi2":1 [ENABLED,IMMUTABLE]
>         pad1: Source
>                 [stream:0 fmt:UYVY8_1X16/1280x960 field:none]
>                 -> "CRU output":0 [ENABLED,IMMUTABLE]
> 
> - entity 7: ov5645 0-003c (1 pad, 1 link, 0 routes)
>             type V4L2 subdev subtype Sensor flags 0
>             device node name /dev/v4l-subdev2
>         pad0: Source
>                 [stream:0 fmt:UYVY8_1X16/1280x960 field:none colorspace:srgb
>                  crop:(0,0)/1280x960]
>                 -> "csi-16000400.csi2":0 [ENABLED,IMMUTABLE]
> 
> - entity 17: CRU output (1 pad, 1 link)
>              type Node subtype V4L flags 0
>              device node name /dev/video0
>         pad0: Sink
>                 <- "cru-ip-16000000.video":1 [ENABLED,IMMUTABLE]
> 
> root@smarc-rzg3e:~# v4l2-compliance -d /dev/v4l-subdev0

For the next submission, you can use

$ v4l2-compliance -m /dev/media0

to test all subdevs and video nodes.

> v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38
> 
> Compliance test for device /dev/v4l-subdev0:
> 
> Driver Info:
>         Driver version   : 6.15.0
>         Capabilities     : 0x00[  580.151532] csi-16000400.csi2: =================  START STATUS  =================
> 000000
> 
> Requir[  580.151532] csi-16000400.csi2: =================  START STATUS  =================
> ed ioctls:
>         tes[  580.168711] csi-16000400.csi2: ==================  END STATUS  ==================
> t VIDIOC_SUDBEV_[  580.168711] csi-16000400.csi2: ==================  END STATUS  ==================
> QUERYCAP: OK
>         test invalid ioctls: OK
> 
> Allow for multiple opens:
>         test second /dev/v4l-subdev0 open: OK
>         test VIDIOC_SUBDEV_QUERYCAP: OK
>         test for unlimited opens: OK
> 
> Debug ioctls:
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>         test VIDIOC_QUERYCTRL: OK (Not Supported)
>         test VIDIOC_G/S_CTRL: OK (Not Supported)
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
> 
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK (Not Supported)
>         test VIDIOC_TRY_FMT: OK (Not Supported)
>         test VIDIOC_S_FMT: OK (Not Supported)
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>         test CREATE_BUFS maximum buffers: OK
>         test VIDIOC_EXPBUF: OK (Not Supported)
>         test Requests: OK (Not Supported)
> 
> Total for device /dev/v4l-subdev0: 44, Succeeded: 44, Failed: 0, Warnings: 0
> 
> root@smarc-rzg3e:~# v4l2-compliance -d /dev/v4l-subdev1
> v4l2-compliance 1.26.1-5142, 64 [  592.022784] cru-ip-16000000.video: =================  START STATUS  =================
> bits, 64-bit tim[  592.022784] cru-ip-16000000.video: =================  START STATUS  =================
> e_t
> v4l2-compli[  592.040565] cru-ip-16000000.video: ==================  END STATUS  ==================
> ance SHA: 4aee01[  592.040565] cru-ip-16000000.video: ==================  END STATUS  ==================
> a02792 2023-12-12 21:40:38
> 
> Compliance test for rzg2l_cru device /dev/v4l-subdev1:
> 
> Driver Info:
>         Driver version   : 6.15.0
>         Capabilities     : 0x00000000
> Media Driver Info:
>         Driver name      : rzg2l_cru
>         Model            : renesas,r9a09g047-cru
>         Serial           :
>         Bus info         : platform:16000000.video
>         Media version    : 6.15.0
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 6.15.0
> Interface Info:
>         ID               : 0x0300000d
>         Type             : V4L Sub-Device
> Entity Info:
>         ID               : 0x00000004 (4)
>         Name             : cru-ip-16000000.video
>         Function         : Video Pixel Formatter
>         Pad 0x01000005   : 0: Sink, Must Connect
>           Link 0x02000015: from remote pad 0x1000003 of entity 'csi-16000400.csi2' (Video Interface Bridge): Data, Enabled, Immutable
>         Pad 0x01000006   : 1: Source, Must Connect
>           Link 0x02000017: to remote pad 0x1000012 of entity 'CRU output' (V4L2 I/O): Data, Enabled, Immutable
> 
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_SUDBEV_QUERYCAP: OK
>         test invalid ioctls: OK
> 
> Allow for multiple opens:
>         test second /dev/v4l-subdev1 open: OK
>         test VIDIOC_SUBDEV_QUERYCAP: OK
>         test for unlimited opens: OK
> 
> Debug ioctls:
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Sub-Device ioctls (Sink Pad 0):
>         Try Stream 0
>         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>         test Try VIDIOC_SUBDEV_G/S_FMT: OK
>         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         Active Stream 0
>         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>         test Active VIDIOC_SUBDEV_G/S_FMT: OK
>         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> 
> Sub-Device ioctls (Source Pad 1):
>         Try Stream 0
>         test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>         test Try VIDIOC_SUBDEV_G/S_FMT: OK
>         test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         Active Stream 0
>         test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
>         test Active VIDIOC_SUBDEV_G/S_FMT: OK
>         test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>         test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> 
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>         test VIDIOC_QUERYCTRL: OK (Not Supported)
>         test VIDIOC_G/S_CTRL: OK (Not Supported)
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
> 
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK (Not Supported)
>         test VIDIOC_TRY_FMT: OK (Not Supported)
>         test VIDIOC_S_FMT: OK (Not Supported)
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>         test CREATE_BUFS maximum buffers: OK
>         test VIDIOC_EXPBUF: OK (Not Supported)
>         test Requests: OK (Not Supported)
> 
> Total for rzg2l_cru device /dev/v4l-subdev1: 59, Succeeded: 59, Failed: 0, Warnings: 0
> 
> root@smarc-rzg3e:~# v4l2-compliance -d /dev/v4l-subdev2
> v4l2-compliance 1.26.1-5142, 64 [  602.158977] ov5645 0-003c: =================  START STATUS  =================
> bits, 64-bit tim[  602.158977] ov5645 0-003c: =================  START STATUS  =================
> e_t
> v4l2-compli[  602.175529] ov5645 0-003c: ==================  END STATUS  ==================
> ance SHA: 4aee01[  602.175529] ov5645 0-003c: ==================  END STATUS  ==================
> a02792 2023-12-12 21:40:38
> 
> Compliance test for device /dev/v4l-subdev2:
> 
> Driver Info:
>         Driver version   : 6.15.0
>         Capabilities     : 0x00000000
> 
> Required ioctls:
>         test VIDIOC_SUDBEV_QUERYCAP: OK
>         test invalid ioctls: OK
> 
> Allow for multiple opens:
>         test second /dev/v4l-subdev2 open: OK
>         test VIDIOC_SUBDEV_QUERYCAP: OK
>         test for unlimited opens: OK
> 
> Debug ioctls:
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
>         test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>         test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls:
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>         test VIDIOC_QUERYCTRL: OK
>         test VIDIOC_G/S_CTRL: OK
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 12 Private Controls: 0
> 
> Format ioctls:
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK (Not Supported)
>         test VIDIOC_TRY_FMT: OK (Not Supported)
>         test VIDIOC_S_FMT: OK (Not Supported)
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
> 
> Codec ioctls:
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>         test CREATE_BUFS maximum buffers: OK
>         test VIDIOC_EXPBUF: OK (Not Supported)
>         test Requests: OK (Not Supported)
> 
> Total for device /dev/v4l-subdev2: 44, Succeeded: 44, Failed: 0, Warnings: 0
> 
> Thanks & Regards,
> Tommaso
> 
> Lad Prabhakar (12):
>   media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/V2H(P) SoC
>   media: rzg2l-cru: csi2: Use local variable for struct device in
>     rzg2l_csi2_probe()
>   media: rzg2l-cru: rzg2l-core: Use local variable for struct device in
>     rzg2l_cru_probe()
>   media: rzg2l-cru: csi2: Introduce SoC-specific D-PHY handling
>   media: rzg2l-cru: csi2: Add support for RZ/V2H(P) SoC
>   media: rzg2l-cru: Add register mapping support
>   media: rzg2l-cru: Pass resolution limits via OF data
>   media: rzg2l-cru: Add image_conv offset to OF data
>   media: rzg2l-cru: Add IRQ handler to OF data
>   media: rzg2l-cru: Add function pointer to check if FIFO is empty
>   media: rzg2l-cru: Add function pointer to configure CSI
>   media: rzg2l-cru: Add support for RZ/G3E SoC
> 
> Tommaso Merciai (5):
>   media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G3E CSI-2
>     block
>   media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G3E SoC
>   media: rzg2l-cru: csi2: Use devm_pm_runtime_enable()
>   media: rzg2l-cru: rzg2l-core: Use devm_pm_runtime_enable()
>   media: rzg2l-cru: csi2: Skip system clock for RZ/V2H(P) SoC
> 
>  .../bindings/media/renesas,rzg2l-cru.yaml     |  65 +++-
>  .../bindings/media/renesas,rzg2l-csi2.yaml    |  62 +++-
>  .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 139 ++++++++-
>  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        |  91 ++++--
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  39 ++-
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 165 ++++++++--
>  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  13 +-
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 295 ++++++++++++++++--
>  8 files changed, 737 insertions(+), 132 deletions(-)

-- 
Regards,

Laurent Pinchart

