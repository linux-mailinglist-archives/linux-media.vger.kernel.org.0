Return-Path: <linux-media+bounces-7756-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4BE88A856
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 17:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08DE11C60CA1
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 16:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 795F913A246;
	Mon, 25 Mar 2024 13:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3EOWKIG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A5F3DABF7;
	Mon, 25 Mar 2024 13:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711374932; cv=none; b=h11Jzd6fHByYQSIoY3j1XOGUJvExnk0ufIXrVE3E69mDqSQhUGQQLDolkaSgC3g2jcA+enLnkVVm4tz7NvGRFEcXTKHRLnPDwkkimybW/T5xVaclFR7U+r5+gPTmls+MDH9P/ac5rsSQTQeSk+zyU/5GNZYS93jGA8CYrUoPP8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711374932; c=relaxed/simple;
	bh=MkXFxr+38wn5av7v3wRZghhYyjXiCj+5YDe2axVzFDQ=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=amqmBfqJVCkoggbPqHZ4SmeslxsFpNyPaO5jvaDr1sxc/xr4TuDl/64V9gO4vad1tdKSeDRcWdLJyIFeWbQpbRa7kSPr/1PD3v1vLVnBc3LhMsx/q8LwgyUuL/iDpgd4FR6arw+AuEFRsFLwQTMtjL5Y35XjYEMr6gT5l9EPH4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3EOWKIG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DAFFC433F1;
	Mon, 25 Mar 2024 13:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711374931;
	bh=MkXFxr+38wn5av7v3wRZghhYyjXiCj+5YDe2axVzFDQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=a3EOWKIGjVSy12sY01z0j003UgNllyXG/j4Mu3ogM2Ob7fbgsiRWjw0/5bA3OUTty
	 47amA9Tj/c4EbfJ08wECjH0TxWQtcgW54T7JDihwnDZ/mgUKgAJFoNxHFY63eZN+Eh
	 AqMjsGQG0qDQ8y9dLXiW4Sidowcf5A1E3QIMlfHWCNxUU0j2z1RqVwbxHTSiuAxMqn
	 EOwH4oqSF0cAYyryt4yrMHQKk9tPUfKwI0hND73aKEDwCuP60HNydXAOGHU+TMgeqB
	 9bkNA4Bd2d62pTBHrXvrae3HdmUakU4GCbwiz37hMguJ20sIYkl3i+fi5Lq9BfMdUu
	 COz3Atz8An1Hg==
Date: Mon, 25 Mar 2024 08:55:30 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Plowman <david.plowman@raspberrypi.com>, 
 linux-media@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Ray Jui <rjui@broadcom.com>, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, kernel-list@raspberrypi.com, 
 linux-rpi-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Naushir Patuck <naush@raspberrypi.com>
In-Reply-To: <20240324220854.15010-1-laurent.pinchart@ideasonboard.com>
References: <20240324220854.15010-1-laurent.pinchart@ideasonboard.com>
Message-Id: <171137470561.3264768.17438798530055106065.robh@kernel.org>
Subject: Re: [PATCH v7 00/15] media: Add driver for the Raspberry Pi <5
 CSI-2 receiver


On Mon, 25 Mar 2024 00:08:36 +0200, Laurent Pinchart wrote:
> Hello everybody,
> 
> This patch series adds a new driver for the BCM2835 (and derivative)
> CCP2/CSI2 camera interface named Unicam. This IP core is found in the
> VC4-based Raspberry Pi, namely the Pi Zero, Pi 3 and Pi 4.
> 
> Camera support for Raspberry Pi 4 currently relies on a downstream
> Unicam driver that live in the Raspberry Pi kernel tree ([1]). The
> driver uses the V4L2 API, but works around the lack of features in V4L2
> to properly support sensor embedded data. Since the Unicam driver
> development by Raspberry Pi, some of those features have been merged in
> the kernel (namely the V4L2 streams API) or are being developed (namely
> generic metadata formats and subdev internal pads), with patches posted
> for review on the linux-media mailing list ([2]).
> 
> This new upstream driver is based on the downstream code, extensively
> reworked to use the new V4L2 APIs.
> 
> The series is based on top of a merge of
> 
> - v8 of the generic metadata and internal pads, rebased on v6.9-rc1 ([3])
> - the downstream ISP driver ported to mainline ([4])
> 
> For convenience, it can be found in [5]. Note that the ISP driver is
> getting upstreamed separately.
> 
> The series starts with five patches that add support for streams and
> embedded data to the imx219 driver (01/15 to 05/15). Patches 06/15 to
> 09/15 then add the Unicam driver, with new V4L2 pixel formats (06/15 and
> 07/15) and DT bindings (08/15) The remaining patches cover DT
> integration (10/15 to 14/15) with a sample DT overlay for the IMX219
> camera module (15/15).
> 
> The patches have been tested on a Raspberry Pi 4 using an IMX219 camera
> module (the Raspberry Pi camera v2), with libcamera. Updates are needed
> to libcamera to use the new V4L2 APIs, patches have been posted to [6].
> For manual testing with media-ctl, corresponding API updates to
> v4l-utils are available at [7].
> 
> The changes to the imx219 driver effectively define the interface that
> raw sensors should expose to userspace. This needs to be documented
> explicitly. When posting v6, I stated that I would like the series to
> first get a review round, which will likely raise API questions. and
> then work on the documentation. As not many API questions have been
> raised yet, I'll give reviewers another chance :-)
> 
> As a summary, more work is needed, in particular documenting how to use
> the API in raw camera sensor drivers, and implementing support for the
> latest generic metadata API in media-ctl and v4l2-compliance. I'm
> however happy with the unicam implementation, and I believe we're really
> nearing completion. This series, along with the libcamera support, help
> validating the new kernel APIs. We have in my opinion reached a point
> where we can start converting other sensor drivers from the downstream
> Raspberry Pi kernel to the standard APIs for embedded data, as well as
> integrating the APIs in the Raspberry Pi 5 CFE driver.
> 
> [1] https://github.com/raspberrypi/linux/tree/rpi-6.1.y/drivers/media/platform/bcm2835
> [2] https://lore.kernel.org/linux-media/20240313072516.241106-1-sakari.ailus@linux.intel.com/
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/log/?h=rpi/v6.9/metadata/v8
> [4] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/log/?h=rpi/v6.9/isp/v2
> [5] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/log/?h=rpi/v6.9/unicam/next
> [6] https://lists.libcamera.org/pipermail/libcamera-devel/2024-March/040711.html
> [7] https://git.linuxtv.org/pinchartl/v4l-utils.git/log/?h=metadata
> 
> Here's the mandatory v4l2-compliance report. There are 5 errors, which
> are caused by v4l2-compliance not supporting the new embedded data APIs
> yet. This will be fixed and patches for v4l2-compliance will be
> submitted (alongside patches to media-ctl).
> 
> v4l2-compliance 1.27.0-5180, 64 bits, 64-bit time_t
> v4l2-compliance SHA: c14579f7e5f5 2024-03-01 20:29:24
> 
> Compliance test for unicam device /dev/media0:
> 
> Media Driver Info:
> 	Driver name      : unicam
> 	Model            : unicam
> 	Serial           :
> 	Bus info         : platform:fe801000.csi
> 	Media version    : 6.8.0
> 	Hardware revision: 0x00000000 (0)
> 	Driver version   : 6.8.0
> 
> Required ioctls:
> 	test MEDIA_IOC_DEVICE_INFO: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/media0 open: OK
> 	test MEDIA_IOC_DEVICE_INFO: OK
> 	test for unlimited opens: OK
> 
> Media Controller ioctls:
> 	test MEDIA_IOC_G_TOPOLOGY: OK
> 	Entities: 4 Interfaces: 4 Pads: 8 Links: 7
> 	test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
> 	test MEDIA_IOC_SETUP_LINK: OK
> 
> Total for unicam device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for unicam device /dev/video0:
> 
> Driver Info:
> 	Driver name      : unicam
> 	Card type        : unicam
> 	Bus info         : platform:fe801000.csi
> 	Driver version   : 6.8.0
> 	Capabilities     : 0xa4a00001
> 		Video Capture
> 		Metadata Capture
> 		I/O MC
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x24200001
> 		Video Capture
> 		I/O MC
> 		Streaming
> 		Extended Pix Format
> Media Driver Info:
> 	Driver name      : unicam
> 	Model            : unicam
> 	Serial           :
> 	Bus info         : platform:fe801000.csi
> 	Media version    : 6.8.0
> 	Hardware revision: 0x00000000 (0)
> 	Driver version   : 6.8.0
> Interface Info:
> 	ID               : 0x0300000d
> 	Type             : V4L Video
> Entity Info:
> 	ID               : 0x0000000b (11)
> 	Name             : unicam-image
> 	Function         : V4L2 I/O
> 	Flags            : default
> 	Pad 0x0100000c   : 0: Sink
> 	  Link 0x0200000f: from remote pad 0x1000003 of entity 'unicam' (Video Interface Bridge): Data, Enabled, Immutable
> 
> Required ioctls:
> 	test MC information (see 'Media Driver Info' above): OK
> 	test VIDIOC_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/video0 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 1 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls (Input 0):
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 0 Private Controls: 0
> 
> Format ioctls (Input 0):
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 	test VIDIOC_TRY_FMT: OK
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK
> 
> Codec ioctls (Input 0):
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 0):
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test CREATE_BUFS maximum buffers: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 
> Total for unicam device /dev/video0: 47, Succeeded: 47, Failed: 0, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for unicam device /dev/video1:
> 
> Driver Info:
> 	Driver name      : unicam
> 	Card type        : unicam
> 	Bus info         : platform:fe801000.csi
> 	Driver version   : 6.8.0
> 	Capabilities     : 0xa4a00001
> 		Video Capture
> 		Metadata Capture
> 		I/O MC
> 		Streaming
> 		Extended Pix Format
> 		Device Capabilities
> 	Device Caps      : 0x24a00000
> 		Metadata Capture
> 		I/O MC
> 		Streaming
> 		Extended Pix Format
> Media Driver Info:
> 	Driver name      : unicam
> 	Model            : unicam
> 	Serial           :
> 	Bus info         : platform:fe801000.csi
> 	Media version    : 6.8.0
> 	Hardware revision: 0x00000000 (0)
> 	Driver version   : 6.8.0
> Interface Info:
> 	ID               : 0x03000013
> 	Type             : V4L Video
> Entity Info:
> 	ID               : 0x00000011 (17)
> 	Name             : unicam-embedded
> 	Function         : V4L2 I/O
> 	Pad 0x01000012   : 0: Sink
> 	  Link 0x02000015: from remote pad 0x1000004 of entity 'unicam' (Video Interface Bridge): Data, Enabled, Immutable
> 
> Required ioctls:
> 	test MC information (see 'Media Driver Info' above): OK
> 	test VIDIOC_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/video1 open: OK
> 	test VIDIOC_QUERYCAP: OK
> 	test VIDIOC_G/S_PRIORITY: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> 	test VIDIOC_LOG_STATUS: OK
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 1 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Control ioctls (Input 0):
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 0 Private Controls: 0
> 
> Format ioctls (Input 0):
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK
> 		fail: v4l2-test-formats.cpp(590): dataformat 00003ff8 (x?) for buftype 13 not reported by ENUM_FMT
> 	test VIDIOC_TRY_FMT: FAIL
> 	test VIDIOC_S_FMT: OK
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls (Input 0):
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls (Input 0):
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> 	test CREATE_BUFS maximum buffers: OK
> 	test VIDIOC_EXPBUF: OK
> 	test Requests: OK (Not Supported)
> 
> Total for unicam device /dev/video1: 47, Succeeded: 46, Failed: 1, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for unicam device /dev/v4l-subdev0:
> 
> Driver Info:
> 	Driver version   : 6.8.0
> 	Capabilities     : 0x00000002
> 		Streams Support
> 	Client Capabilities: 0x0000000000000003
> streams interval-uses-which Media Driver Info:
> 	Driver name      : unicam
> 	Model            : unicam
> 	Serial           :
> 	Bus info         : platform:fe801000.csi
> 	Media version    : 6.8.0
> 	Hardware revision: 0x00000000 (0)
> 	Driver version   : 6.8.0
> Interface Info:
> 	ID               : 0x03000017
> 	Type             : V4L Sub-Device
> Entity Info:
> 	ID               : 0x00000001 (1)
> 	Name             : unicam
> 	Function         : Video Interface Bridge
> 	Pad 0x01000002   : 0: Sink
> 	  Link 0x02000009: from remote pad 0x1000006 of entity 'imx219 5-0010' (Camera Sensor): Data, Enabled, Immutable
> 	Pad 0x01000003   : 1: Source
> 	  Link 0x0200000f: to remote pad 0x100000c of entity 'unicam-image' (V4L2 I/O): Data, Enabled, Immutable
> 	Pad 0x01000004   : 2: Source
> 	  Link 0x02000015: to remote pad 0x1000012 of entity 'unicam-embedded' (V4L2 I/O): Data, Enabled, Immutable
> 
> Required ioctls:
> 	test MC information (see 'Media Driver Info' above): OK
> 	test VIDIOC_SUDBEV_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/v4l-subdev0 open: OK
> 	test VIDIOC_SUBDEV_QUERYCAP: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> 
> Input/Output configuration ioctls:
> 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> 	test VIDIOC_G/S_EDID: OK (Not Supported)
> 
> Sub-Device routing ioctls:
> 		fail: v4l2-test-subdevs.cpp(631): !(source->flags & MEDIA_PAD_FL_SOURCE)
> 	test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: FAIL
> 		fail: v4l2-test-subdevs.cpp(631): !(source->flags & MEDIA_PAD_FL_SOURCE)
> 	test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: FAIL
> 
> Sub-Device ioctls (Sink Pad 0):
> 
> Sub-Device ioctls (Source Pad 1):
> 
> Sub-Device ioctls (Source Pad 2):
> 
> Control ioctls:
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> 	Standard Controls: 0 Private Controls: 0
> 
> Format ioctls:
> 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
> 	test VIDIOC_G/S_PARM: OK (Not Supported)
> 	test VIDIOC_G_FBUF: OK (Not Supported)
> 	test VIDIOC_G_FMT: OK (Not Supported)
> 	test VIDIOC_TRY_FMT: OK (Not Supported)
> 	test VIDIOC_S_FMT: OK (Not Supported)
> 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> 	test Cropping: OK (Not Supported)
> 	test Composing: OK (Not Supported)
> 	test Scaling: OK (Not Supported)
> 
> Codec ioctls:
> 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> 
> Buffer ioctls:
> 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
> 	test CREATE_BUFS maximum buffers: OK
> 	test VIDIOC_EXPBUF: OK (Not Supported)
> 	test Requests: OK (Not Supported)
> 
> Total for unicam device /dev/v4l-subdev0: 47, Succeeded: 45, Failed: 2, Warnings: 0
> --------------------------------------------------------------------------------
> Compliance test for unicam device /dev/v4l-subdev1:
> 
> Driver Info:
> 	Driver version   : 6.8.0
> 	Capabilities     : 0x00000002
> 		Streams Support
> 	Client Capabilities: 0x0000000000000003
> streams interval-uses-which Media Driver Info:
> 	Driver name      : unicam
> 	Model            : unicam
> 	Serial           :
> 	Bus info         : platform:fe801000.csi
> 	Media version    : 6.8.0
> 	Hardware revision: 0x00000000 (0)
> 	Driver version   : 6.8.0
> Interface Info:
> 	ID               : 0x03000019
> 	Type             : V4L Sub-Device
> Entity Info:
> 	ID               : 0x00000005 (5)
> 	Name             : imx219 5-0010
> 	Function         : Camera Sensor
> 	Pad 0x01000006   : 0: Source
> 	  Link 0x02000009: to remote pad 0x1000002 of entity 'unicam' (Video Interface Bridge): Data, Enabled, Immutable
> 	Pad 0x01000007   : 1: Sink, 00000008
> 	Pad 0x01000008   : 2: Sink, 00000008
> 
> Required ioctls:
> 	test MC information (see 'Media Driver Info' above): OK
> 	test VIDIOC_SUDBEV_QUERYCAP: OK
> 	test invalid ioctls: OK
> 
> Allow for multiple opens:
> 	test second /dev/v4l-subdev1 open: OK
> 	test VIDIOC_SUBDEV_QUERYCAP: OK
> 	test for unlimited opens: OK
> 
> Debug ioctls:
> 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> 
> Input ioctls:
> 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> 
> Output ioctls:
> 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> 
> Dave Stevenson (2):
>   dt-bindings: media: Add bindings for bcm2835-unicam
>   media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface
> 
> Jean-Michel Hautbois (3):
>   media: v4l: Add V4L2-PIX-FMT-Y12P format
>   media: v4l: Add V4L2-PIX-FMT-Y14P format
>   ARM: dts: bcm2835: Add Unicam CSI nodes
> 
> Laurent Pinchart (8):
>   media: i2c: imx219: Inline imx219_update_pad_format() in its caller
>   media: i2c: imx219: Add internal image sink pad
>   media: i2c: imx219: Report internal routes to userspace
>   media: i2c: imx219: Report streams using frame descriptors
>   media: i2c: imx219: Add embedded data support
>   ARM: dts: bcm2835-rpi: Move firmware-clocks from bcm2711 to bcm2835
>   ARM: dts: bcm2711-rpi-4-b: Add CAM1 regulator
>   [DNI] arm64: dts: broadcom: Add overlay for Raspberry Pi 4B IMX219
>     camera
> 
> Uwe Kleine-König (2):
>   ARM: dts: bcm2711-rpi: Add pinctrl-based multiplexing for I2C0
>   ARM: dts: bcm2711-rpi-cm4-io: Add RTC on I2C0
> 
>  .../bindings/media/brcm,bcm2835-unicam.yaml   |  117 +
>  .../media/v4l/pixfmt-yuv-luma.rst             |   48 +
>  MAINTAINERS                                   |    7 +
>  .../arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts |    7 +
>  .../boot/dts/broadcom/bcm2711-rpi-cm4-io.dts  |    9 +
>  arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi   |   34 +-
>  arch/arm/boot/dts/broadcom/bcm2711.dtsi       |    8 +
>  arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi   |   19 +
>  arch/arm/boot/dts/broadcom/bcm283x.dtsi       |   24 +
>  arch/arm64/boot/dts/broadcom/Makefile         |    2 +
>  .../dts/broadcom/bcm2711-rpi-4-b-imx219.dtso  |   65 +
>  drivers/media/i2c/imx219.c                    |  420 ++-
>  drivers/media/platform/Kconfig                |    1 +
>  drivers/media/platform/Makefile               |    1 +
>  drivers/media/platform/broadcom/Kconfig       |   23 +
>  drivers/media/platform/broadcom/Makefile      |    3 +
>  .../platform/broadcom/bcm2835-unicam-regs.h   |  255 ++
>  .../media/platform/broadcom/bcm2835-unicam.c  | 2667 +++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
>  include/uapi/linux/videodev2.h                |    2 +
>  20 files changed, 3639 insertions(+), 75 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
>  create mode 100644 arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b-imx219.dtso
>  create mode 100644 drivers/media/platform/broadcom/Kconfig
>  create mode 100644 drivers/media/platform/broadcom/Makefile
>  create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam-regs.h
>  create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam.c
> 
> 
> base-commit: e21180b6d61e9b4ee15e2047b55b14b306465d15
> --
> Regards,
> 
> Laurent Pinchart
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y broadcom/bcm2711-rpi-4-b.dtb broadcom/bcm2711-rpi-cm4-io.dtb' for 20240324220854.15010-1-laurent.pinchart@ideasonboard.com:

arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: soc: firmware: {'compatible': ['raspberrypi,bcm2835-firmware', 'simple-mfd'], '#address-cells': [[1]], '#size-cells': [[1]], 'mboxes': [[29]], 'dma-ranges': True, 'phandle': [[30]], 'clocks': {'compatible': ['raspberrypi,firmware-clocks'], '#clock-cells': [[1]], 'phandle': [[16]]}, 'gpio': {'compatible': ['raspberrypi,firmware-gpio'], 'gpio-controller': True, '#gpio-cells': [[2]], 'status': ['okay'], 'gpio-line-names': ['BT_ON', 'WL_ON', 'PWR_LED_OFF', 'GLOBAL_RESET', 'VDD_SD_IO_SEL', 'CAM_GPIO', 'SD_PWR_ON', ''], 'phandle': [[10]]}, 'reset': {'compatible': ['raspberrypi,firmware-reset'], '#reset-cells': [[1]], 'phandle': [[39]]}} should not be valid under {'type': 'object'}
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: soc: power: {'compatible': ['raspberrypi,bcm2835-power'], 'firmware': [[30]], '#power-domain-cells': [[1]], 'phandle': [[11]]} should not be valid under {'type': 'object'}
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dtb: soc: firmware: {'compatible': ['raspberrypi,bcm2835-firmware', 'simple-mfd'], '#address-cells': [[1]], '#size-cells': [[1]], 'mboxes': [[27]], 'dma-ranges': True, 'phandle': [[28]], 'clocks': {'compatible': ['raspberrypi,firmware-clocks'], '#clock-cells': [[1]], 'phandle': [[16]]}, 'gpio': {'compatible': ['raspberrypi,firmware-gpio'], 'gpio-controller': True, '#gpio-cells': [[2]], 'status': ['okay'], 'gpio-line-names': ['BT_ON', 'WL_ON', 'PWR_LED_OFF', 'ANT1', 'VDD_SD_IO_SEL', 'CAM_GPIO', 'SD_PWR_ON', 'ANT2'], 'phandle': [[10]], 'ant1-hog': {'gpio-hog': True, 'gpios': [[3, 0]], 'output-high': True, 'line-name': ['ant1'], 'phandle': [[164]]}, 'ant2-hog': {'gpio-hog': True, 'gpios': [[7, 0]], 'output-low': True, 'line-name': ['ant2'], 'phandle': [[165]]}}, 'reset': {'compatible': ['raspberrypi,firmware-reset'], '#reset-cells': [[1]], 'phandle': [[166]]}} should not be valid under {'type': 'object'}
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dtb: soc: power: {'compatible': ['raspberrypi,bcm2835-power'], 'firmware': [[28]], '#power-domain-cells': [[1]], 'phandle': [[11]]} should not be valid under {'type': 'object'}
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: i2c0mux: $nodename:0: 'i2c0mux' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pinctrl.yaml#
arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: i2c0mux: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pinctrl.yaml#
arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dtb: i2c0mux: $nodename:0: 'i2c0mux' does not match '^(i2c-?)?mux'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pinctrl.yaml#
arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dtb: i2c0mux: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1' were unexpected)
	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux-pinctrl.yaml#






