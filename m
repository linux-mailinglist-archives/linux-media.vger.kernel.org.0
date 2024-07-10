Return-Path: <linux-media+bounces-14857-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7089A92D2A8
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 15:22:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E78921F216FB
	for <lists+linux-media@lfdr.de>; Wed, 10 Jul 2024 13:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1E4192B71;
	Wed, 10 Jul 2024 13:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IH7b1OJD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F23218FDBE;
	Wed, 10 Jul 2024 13:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720617757; cv=none; b=R+9vx0/4nvoIXgdINsFgh37oSa4QJLk8r9IUHE4ttis0EonDXT5sm76bJNVsFivHj979mSONMG3mMq901RJkHdRtpy7dDq1MHDx9/P2Qj6TDLTsmjW6ZcIa87T3qreIL505Jp/8NZLkr7nCBZKERoxDKnsX9p7QBHEs8wu/bHHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720617757; c=relaxed/simple;
	bh=WuW4qaJx5N8vQscaVuwi6VuL61GWkKq83mP5b0fizf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KnBW6CPPS7aL6qdbhSC6SSzjz33WILX762ygtDOLI8HapQO++UWVy0rTZAvYuilVOvpdBu52/Lsv9iTeK2y0EgtssWM/nyvmFB5vXSGp3sdspOffMMPYG54I8Cv0hZWYGoCqwcl219HV1ydm7/oUMSZPCY/HWKk+ZjUgWzJsf4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IH7b1OJD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:72c3:346:a663:c82d])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D140A7F5;
	Wed, 10 Jul 2024 15:21:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720617719;
	bh=WuW4qaJx5N8vQscaVuwi6VuL61GWkKq83mP5b0fizf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IH7b1OJDc1xiRkeMssdE81kKLURSSLuTMxq6o2+dAjN2xc5NpBHzeADCLB0Y/471c
	 NdZN6Wrlqe2pJhUtcU7dEoYd2NCTCQOkaFwvMiiaYduK/kWidPq3C7N9qrF3rrVH7+
	 dwgK2XICMo01w98q9TIJyFLqrl7gduhEUjM2gXjc=
Date: Wed, 10 Jul 2024 15:22:29 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Mingjia Zhang <mingjia.zhang@mediatek.com>, 
	Jack Zhu <jack.zhu@starfivetech.com>, Keith Zhao <keith.zhao@starfivetech.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 00/14] Add ISP 3A for StarFive
Message-ID: <xk2dqqzpaah6lbx2fwa6aokm6sw3auyrntstuvuik4cevuaekw@ylgbnb43le47>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709083824.430473-1-changhuang.liang@starfivetech.com>

Hi Changhuang

I've passed the series through the media-staging CI
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1220920
Could you check the errors reported there ?


On Tue, Jul 09, 2024 at 01:38:10AM GMT, Changhuang Liang wrote:
> This series implements the ISP 3A function to the Camera Subsystem on StarFive
> JH7110 SoC. The series has been tested on the VisionFive 2 board.
>
> This series is based on top of the master branch of media_stage repository,
> which is tested with a v4l2-compliance compiled from the git repo
> (git://linuxtv.org/v4l-utils.git).
>
> changes since v4:
> - Rebase on top of the master branch of media_stage repository.
> - Insert a new PATCH 13
> - PATCH 1:
> 1. Fix spelling error:
> 	- corsstakl -> crosstalk
> 	- balck -> black
> 	- magbitude -> magnitude
> 	- FALG -> FLAG
> 2. Exchange of the values of JH7110_ISP_SC_FLAG_AE_AF and JH7110_ISP_SC_FLAG_AWB
>
> - PATCH 8:
> 1. Synchronous spelling error: FALG -> FLAG
> 2. Add:
>
> if (*num_planes)
> 	return sizes[0] < sizeof(struct jh7110_isp_sc_buffer) ? -EINVAL : 0;
>
> - PATCH 11:
> 1. Drop read hook.
> 2. Add:
>
> if (*num_planes)
> 	return sizes[0] < sizeof(struct jh7110_isp_params_buffer) ? -EINVAL : 0;
>
> - PATCH 12:
> 1. Add:
>
> ready_buf->vb.vb2_buf.timestamp = ktime_get_ns();
> ready_buf->vb.sequence = output->buffers.sequence++;
>
> to fix "v4l2-compliance -s" Failed.
>
> v4: https://lore.kernel.org/all/20240402100011.13480-1-changhuang.liang@starfivetech.com/
>
> changes since v3:
> - Rebased on top of the master branch of media_stage repository and patch [1][2].
> - Replaced "stf_get_isp_scd_type" with "stf_isp_get_scd_type" in PATCH 8.
>
> v3: https://lore.kernel.org/all/20240205090424.40302-1-changhuang.liang@starfivetech.com/
>
> changes since v2:
> - Rebased on top of the master branch of media_stage repository.
> - Added helper function "media_entity_remove_links" in PATCH 8 and PATCH 11 to cleanup links.
>
> v2: https://lore.kernel.org/all/20240111084120.16685-1-changhuang.liang@starfivetech.com/
>
> changes since v1:
> - Rebased on top of the master branch of media_stage repository.
> - Documentated ISP submodule.
> - Added new ISP parameters format and document it.
> - Added a meta output video device and link to ISP subdev.
> - Replaced control with meta output video buffer for write ISP parameters.
> - Separated buffer operation which can use for capture and output device.
> - Droped ISP frame sync event.
>
> v1: https://lore.kernel.org/all/20231214065027.28564-1-changhuang.liang@starfivetech.com/
>
> The following are the media graph for the device and the v4l2-compliance
> output.
>
> ==========================================================================================
>
> [the media graph]:
>
> digraph board {
> 	rankdir=TB
> 	n00000001 [label="{{<port0> 0 | <port1> 1} | stf_isp\n/dev/v4l-subdev0 | {<port2> 2 | <port3> 3}}", shape=Mrecord, style=filled, fillcolor=green]
> 	n00000001:port2 -> n0000000e
> 	n00000001:port3 -> n00000012 [style=dashed]
> 	n00000006 [label="output_params\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
> 	n00000006 -> n00000001:port1 [style=dashed]
> 	n0000000a [label="capture_raw\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
> 	n0000000e [label="capture_yuv\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
> 	n00000012 [label="capture_scd\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
> 	n0000001c [label="{{<port0> 0} | cdns_csi2rx.19800000.csi-bridge\n/dev/v4l-subdev1 | {<port1> 1 | <port2> 2 | <port3> 3 | <port4> 4}}", shape=Mrecord, style=filled, fillcolor=green]
> 	n0000001c:port1 -> n00000001:port0 [style=dashed]
> 	n0000001c:port1 -> n0000000a [style=dashed]
> 	n00000026 [label="{{} | imx219 6-0010\n/dev/v4l-subdev2 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> 	n00000026:port0 -> n0000001c:port0 [style=bold]
> }
>
> [v4l2-compliance test]:
>
> # ./v4l2-compliance -s -d /dev/video0
> v4l2-compliance 1.27.0-5220, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 8387e3673837 2024-07-01 11:09:32
>
> Compliance test for starfive-camss device /dev/video0:
>
> Driver Info:
>         Driver name      : starfive-camss
>         Card type        : Starfive Camera Subsystem
>         Bus info         : platform:19840000.isp
>         Driver version   : 6.10.0
>         Capabilities     : 0xac200000
>                 Metadata Output
>                 I/O MC
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x2c200000
>                 Metadata Output
>                 I/O MC
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : starfive-camss
>         Model            : Starfive Camera Subsystem
>         Serial           :
>         Bus info         : platform:19840000.isp
>         Media version    : 6.10.0
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 6.10.0
> Interface Info:
>         ID               : 0x03000008
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000006 (6)
>         Name             : output_params
>         Function         : V4L2 I/O
>         Pad 0x01000007   : 0: Source
>           Link 0x0200001a: to remote pad 0x1000003 of entity 'stf_isp' (Image Signal Processor): Data
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>         test invalid ioctls: OK
>
> Allow for multiple opens:
>         test second /dev/video0 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
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
>         test VIDIOC_G/S/ENUMOUTPUT: OK
>         test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>         Outputs: 1 Audio Outputs: 0 Modulators: 0
>
> Input/Output configuration ioctls:
>         test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>         test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>         test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>         test VIDIOC_G/S_EDID: OK (Not Supported)
>
> Control ioctls (Output 0):
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>         test VIDIOC_QUERYCTRL: OK (Not Supported)
>         test VIDIOC_G/S_CTRL: OK (Not Supported)
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>
> Format ioctls (Output 0):
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
>
> Codec ioctls (Output 0):
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls (Output 0):
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test CREATE_BUFS maximum buffers: OK
>         test VIDIOC_REMOVE_BUFS: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
>
> Test output 0:
>
> Streaming ioctls:
>         test read/write: OK (Not Supported)
>         test blocking wait: OK
>         test MMAP (no poll): OK
>         test MMAP (select): OK
>         test MMAP (epoll): OK
>         test USERPTR (no poll): OK (Not Supported)
>         test USERPTR (select): OK (Not Supported)
>         test DMABUF: Cannot test, specify --expbuf-device
>
> Total for starfive-camss device /dev/video0: 55, Succeeded: 55, Failed: 0, Warnings: 0
>
> # ./v4l2-compliance -s -d /dev/video3
> v4l2-compliance 1.27.0-5220, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 8387e3673837 2024-07-01 11:09:32
>
> Compliance test for starfive-camss device /dev/video3:
>
> Driver Info:
>         Driver name      : starfive-camss
>         Card type        : Starfive Camera Subsystem
>         Bus info         : platform:19840000.isp
>         Driver version   : 6.10.0
>         Capabilities     : 0xa4a00000
>                 Metadata Capture
>                 I/O MC
>                 Streaming
>                 Extended Pix Format
>                 Device Capabilities
>         Device Caps      : 0x24a00000
>                 Metadata Capture
>                 I/O MC
>                 Streaming
>                 Extended Pix Format
> Media Driver Info:
>         Driver name      : starfive-camss
>         Model            : Starfive Camera Subsystem
>         Serial           :
>         Bus info         : platform:19840000.isp
>         Media version    : 6.10.0
>         Hardware revision: 0x00000000 (0)
>         Driver version   : 6.10.0
> Interface Info:
>         ID               : 0x03000014
>         Type             : V4L Video
> Entity Info:
>         ID               : 0x00000012 (18)
>         Name             : capture_scd
>         Function         : V4L2 I/O
>         Pad 0x01000013   : 0: Sink
>           Link 0x02000018: from remote pad 0x1000005 of entity 'stf_isp' (Image Signal Processor): Data
>
> Required ioctls:
>         test MC information (see 'Media Driver Info' above): OK
>         test VIDIOC_QUERYCAP: OK
>         test invalid ioctls: OK
>
> Allow for multiple opens:
>         test second /dev/video3 open: OK
>         test VIDIOC_QUERYCAP: OK
>         test VIDIOC_G/S_PRIORITY: OK
>         test for unlimited opens: OK
>
> Debug ioctls:
>         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>         test VIDIOC_LOG_STATUS: OK (Not Supported)
>
> Input ioctls:
>         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>         test VIDIOC_ENUMAUDIO: OK (Not Supported)
>         test VIDIOC_G/S/ENUMINPUT: OK
>         test VIDIOC_G/S_AUDIO: OK (Not Supported)
>         Inputs: 1 Audio Inputs: 0 Tuners: 0
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
> Control ioctls (Input 0):
>         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>         test VIDIOC_QUERYCTRL: OK (Not Supported)
>         test VIDIOC_G/S_CTRL: OK (Not Supported)
>         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>         Standard Controls: 0 Private Controls: 0
>
> Format ioctls (Input 0):
>         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>         test VIDIOC_G/S_PARM: OK (Not Supported)
>         test VIDIOC_G_FBUF: OK (Not Supported)
>         test VIDIOC_G_FMT: OK
>         test VIDIOC_TRY_FMT: OK
>         test VIDIOC_S_FMT: OK
>         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>         test Cropping: OK (Not Supported)
>         test Composing: OK (Not Supported)
>         test Scaling: OK (Not Supported)
>
> Codec ioctls (Input 0):
>         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>
> Buffer ioctls (Input 0):
>         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>         test CREATE_BUFS maximum buffers: OK
>         test VIDIOC_REMOVE_BUFS: OK
>         test VIDIOC_EXPBUF: OK
>         test Requests: OK (Not Supported)
>
> Test input 0:
>
> Streaming ioctls:
>         test read/write: OK (Not Supported)
>         test blocking wait: OK
>         test MMAP (no poll): OK
>         test MMAP (select): OK
>         test MMAP (epoll): OK
>         test USERPTR (no poll): OK (Not Supported)
>         test USERPTR (select): OK (Not Supported)
>         test DMABUF: Cannot test, specify --expbuf-device
>
> Total for starfive-camss device /dev/video3: 55, Succeeded: 55, Failed: 0, Warnings: 0
>
> Changhuang Liang (14):
>   media: starfive: Add JH7110 ISP module definitions
>   media: Documentation: Add description for StarFive ISP metadata
>     formats
>   media: videodev2.h, v4l2-ioctl: Add StarFive ISP meta buffer format
>   staging: media: starfive: Add a params sink pad and a scd source pad
>     for ISP
>   staging: media: starfive: Separate buffer from ISP hardware operation
>   staging: media: starfive: Separate buffer be a common file
>   staging: media: starfive: Separate ISP hardware from capture device
>   staging: media: starfive: Add for StarFive ISP 3A SC
>   staging: media: starfive: Update ISP initialise config for 3A
>   staging: media: starfive: Add V4L2_CAP_IO_MC capability
>   staging: media: starfive: Add ISP params video device
>   staging: media: starfive: Add ISP parameters hardware configure
>   staging: media: starfive: Drop read support for video capture devices
>   admin-guide: media: Update documents for StarFive Camera Subsystem
>
>  .../admin-guide/media/starfive_camss.rst      |  11 +-
>  .../media/starfive_camss_graph.dot            |  22 +-
>  .../media/v4l/metafmt-starfive-isp.rst        |  75 ++
>  MAINTAINERS                                   |   2 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
>  drivers/staging/media/starfive/camss/Makefile |   3 +
>  .../staging/media/starfive/camss/stf-buffer.c | 166 ++++
>  .../staging/media/starfive/camss/stf-buffer.h |  53 ++
>  .../staging/media/starfive/camss/stf-camss.c  |  38 +-
>  .../staging/media/starfive/camss/stf-camss.h  |  12 +
>  .../media/starfive/camss/stf-capture.c        | 248 +-----
>  .../media/starfive/camss/stf-capture.h        |  22 -
>  .../media/starfive/camss/stf-isp-hw-ops.c     | 722 +++++++++++++++++
>  .../media/starfive/camss/stf-isp-params.c     | 240 ++++++
>  .../staging/media/starfive/camss/stf-isp.c    |  77 +-
>  .../staging/media/starfive/camss/stf-isp.h    | 188 +++++
>  .../staging/media/starfive/camss/stf-output.c |  83 ++
>  .../staging/media/starfive/camss/stf-output.h |  22 +
>  .../staging/media/starfive/camss/stf-video.c  | 147 +++-
>  .../staging/media/starfive/camss/stf-video.h  |  11 +-
>  include/uapi/linux/jh7110-isp.h               | 739 ++++++++++++++++++
>  include/uapi/linux/videodev2.h                |   4 +
>  22 files changed, 2608 insertions(+), 279 deletions(-)
>  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-starfive-isp.rst
>  create mode 100644 drivers/staging/media/starfive/camss/stf-buffer.c
>  create mode 100644 drivers/staging/media/starfive/camss/stf-buffer.h
>  create mode 100644 drivers/staging/media/starfive/camss/stf-isp-params.c
>  create mode 100644 drivers/staging/media/starfive/camss/stf-output.c
>  create mode 100644 drivers/staging/media/starfive/camss/stf-output.h
>  create mode 100644 include/uapi/linux/jh7110-isp.h
>
> --
> 2.25.1
>

