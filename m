Return-Path: <linux-media+bounces-10069-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA6D8B0FDE
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 18:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 767DD1C20F9E
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 16:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D07116ABC7;
	Wed, 24 Apr 2024 16:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="imy+I9c+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADB61598EA;
	Wed, 24 Apr 2024 16:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713976429; cv=none; b=ooQ7MYZKkc6xeWrlQZpzWFQGmMg5WO0sPyn4D5c5MK10b5YAgw4Dmk1ioirNUrA5ksFhnGRHUCaQDjBqf/8DfuJERTZkqQvnSQ+CkvJX7h14z7DDr4v6KcUZ0OXTLv+RX9dp1Ur9x2zqhO81epftek+cqYsRLqAC/jXGfHlxmC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713976429; c=relaxed/simple;
	bh=j2BrUMQhQyyhStkaXRElQQeERYWDj7D9obKB82jfC9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQN00iNot+GWz95SnaptslyJMsquzk/MdNsZVjIywPFh5dLw1Q5Ub+7t5iLbkvAVmfJl+yZkRWFvjBPfYccpdI3X6Z+74kPjyxxN1TlK1RPWRN7V60fYSKFJFNcpSuPTYPyW26SEeBLEu77ZA4ugtB0m0tTS7T2z6dASd3pFZF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=imy+I9c+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03096674;
	Wed, 24 Apr 2024 18:32:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713976373;
	bh=j2BrUMQhQyyhStkaXRElQQeERYWDj7D9obKB82jfC9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=imy+I9c+CwdI5PXgjumIX+BLk64Nf3yTDHaj4MwX/AYzPQx7Yh0K0BxHx0Ssldr7h
	 e0xDnnnpfC5IMcgFTFz8DDxoi3xx9+0aULobDRtJhv+DRJF88Muj5WGKFQHlCQ4OyW
	 UKeQvgauLE9Jseoocja6Z1s7h+tA7A+ZxSLgFido=
Date: Wed, 24 Apr 2024 19:33:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com, linux-rpi-kernel@lists.infradead.org,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v11 0/5] media: Add driver for the Raspberry Pi <5 CSI-2
 receiver
Message-ID: <20240424163338.GE32190@pendragon.ideasonboard.com>
References: <20240424153542.32503-1-laurent.pinchart@ideasonboard.com>
 <396eaa7c-4e7b-43cf-aec4-c1611a405ef7@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <396eaa7c-4e7b-43cf-aec4-c1611a405ef7@broadcom.com>

Hi Florian,

On Wed, Apr 24, 2024 at 09:28:36AM -0700, Florian Fainelli wrote:
> On 4/24/24 08:35, Laurent Pinchart wrote:
> > Hello everybody,
> > 
> > This patch series adds a new driver for the BCM2835 (and derivative)
> > CCP2/CSI2 camera interface named Unicam. This IP core is found in the
> > VC4-based Raspberry Pi, namely the Pi Zero, Pi 3 and Pi 4.
> > 
> > Camera support for Raspberry Pi 4 currently relies on a downstream
> > Unicam driver that lives in the Raspberry Pi kernel tree ([1]). The
> > driver uses the V4L2 API, but works around the lack of features in V4L2
> > to properly support sensor embedded data. Since the Unicam driver
> > development by Raspberry Pi, some of those features have been merged in
> > the kernel (namely the V4L2 streams API) or are being developed (namely
> > generic metadata formats and subdev internal pads), with patches posted
> > for review on the linux-media mailing list ([2], [3]).
> > 
> > This new upstream driver is based on the downstream code, extensively
> > reworked to use the new V4L2 APIs.
> > 
> > The series is based on the generic metadata ([2]) and internal pads
> > ([3], v9) APIs. It can be found in my tree in [4]. Testing it requires
> > extra branches, which are also pushed to the same tree, and organized as
> > follows:
> > 
> > - rpi/v6.9/base: The mainline tag that all the work is based on
> >    (currently v6.9-rc2)
> > - rpi/v6.9/backports: DT integration fixes for bcm238x, backported from
> >    linux-next
> > - rpi/v6.9/isp/v2: The ISP driver, which is getting upstreamed
> >    separately
> > - rpi/v6.9/metadata/v10/base: The V4L2 embedded data patches
> > - rpi/v6.9/metadata/v10/sensors: The V4L2 internal pads patches
> > - rpi/v6.9/unicam/next: The Unicam driver, based on the
> >    rpi/v6.9/metadata/v10/base branch that it depends on
> > - rpi/v6.9/imx219: Embedded data support for the imx219 driver, based on
> >    the rpi/v6.9/metadata/v10/sensors branch that it depends on
> > - rpi/v6.9/merge: A merge of the backports, isp/v2, unicam/next and
> >    imx219 branches
> > - rpi/v6.9/overlays: A sample overlay for the imx219 camera sensor
> >    connected to a Raspberry Pi 4
> > 
> > The series starts with two patches that add new V4L2 pixel formats (1/5
> > and 2/5), followed by the Unicam DT bindings (3/5) and driver (4/5).
> > Finally, it ends with DT integration for the Unicam devices (5/5).
> > 
> > Compared to v10, I have rebased the patches on top of the latest version
> > of the generic metadata series ([2]), to prepare for a merge in
> > (hopefully) v6.10.
> > 
> > The patches have been tested on a Raspberry Pi 4 using an IMX219 camera
> > module (the Raspberry Pi camera v2), with libcamera. Updates are needed
> > to libcamera to use the new V4L2 APIs, patches have been posted to [5].
> > For manual testing with media-ctl, corresponding API updates to
> > v4l-utils have been posted to the linux-media mailing list ([6]) and
> > pushed to [7].
> > 
> > With this version I believe we are ready to merge the driver upstream.
> > Sensor driver changes, which require more work, with their corresponding
> > V4L2 API extensions, have been split out. The Unicam driver now depends
> > only on the core part of the embedded data API extensions, which I
> > believe is ready. Corresponding updates for v4l-utils have been
> > developed and submitted. This series, along with the libcamera support,
> > helps validating the new kernel APIs.
> > 
> > Sakari, please feel free to apply this on top of your generic metadata
> > branch and include it in your pull request for v6.10.
> 
> To miminize conflicts, I believe I should be taking patch #5 via the ARM 
> SoC pull request since I already have merged patches there that are 
> pre-requisites for patch #5 to apply. Let me know if that does not work.

That works for me. Sakari, please don't take patch 5/5 in your branch.

> > Below you will find the mandatory v4l2-compliance reports. It requires
> > the v4l-utils updates from [7]. There is a total of 4 warnings, all
> > related to the imx219 driver. They will be addressed separately, as part
> > of the effort to add embedded data support to the imx219 driver.
> > 
> > [1] https://github.com/raspberrypi/linux/tree/rpi-6.1.y/drivers/media/platform/bcm2835
> > [3] https://lore.kernel.org/linux-media/20240424122237.875000-1-sakari.ailus@linux.intel.com/
> > [4] https://lore.kernel.org/linux-media/20240416193319.778192-1-sakari.ailus@linux.intel.com/
> > [4] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/log/?h=rpi/v6.9/unicam/next
> > [5] https://lists.libcamera.org/pipermail/libcamera-devel/2024-March/040711.html
> > [6] https://lore.kernel.org/linux-media/20240424152230.31923-1-laurent.pinchart@ideasonboard.com/
> > [7] https://git.linuxtv.org/pinchartl/v4l-utils.git/log/?h=metadata
> > 
> > v4l2-compliance 1.27.0-5195, 64 bits, 64-bit time_t
> > v4l2-compliance SHA: 9356d44374db 2024-04-24 11:58:36
> > 
> > Compliance test for unicam device /dev/media0:
> > 
> > Media Driver Info:
> > 	Driver name      : unicam
> > 	Model            : unicam
> > 	Serial           :
> > 	Bus info         : platform:fe801000.csi
> > 	Media version    : 6.9.0
> > 	Hardware revision: 0x00000000 (0)
> > 	Driver version   : 6.9.0
> > 
> > Required ioctls:
> > 	test MEDIA_IOC_DEVICE_INFO: OK
> > 	test invalid ioctls: OK
> > 
> > Allow for multiple opens:
> > 	test second /dev/media0 open: OK
> > 	test MEDIA_IOC_DEVICE_INFO: OK
> > 	test for unlimited opens: OK
> > 
> > Media Controller ioctls:
> > 	test MEDIA_IOC_G_TOPOLOGY: OK
> > 	Entities: 4 Interfaces: 4 Pads: 8 Links: 7
> > 	test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
> > 	test MEDIA_IOC_SETUP_LINK: OK
> > 
> > Total for unicam device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0
> > --------------------------------------------------------------------------------
> > Compliance test for unicam device /dev/video0:
> > 
> > Driver Info:
> > 	Driver name      : unicam
> > 	Card type        : unicam
> > 	Bus info         : platform:fe801000.csi
> > 	Driver version   : 6.9.0
> > 	Capabilities     : 0xa4a00001
> > 		Video Capture
> > 		Metadata Capture
> > 		I/O MC
> > 		Streaming
> > 		Extended Pix Format
> > 		Device Capabilities
> > 	Device Caps      : 0x24200001
> > 		Video Capture
> > 		I/O MC
> > 		Streaming
> > 		Extended Pix Format
> > Media Driver Info:
> > 	Driver name      : unicam
> > 	Model            : unicam
> > 	Serial           :
> > 	Bus info         : platform:fe801000.csi
> > 	Media version    : 6.9.0
> > 	Hardware revision: 0x00000000 (0)
> > 	Driver version   : 6.9.0
> > Interface Info:
> > 	ID               : 0x0300000d
> > 	Type             : V4L Video
> > Entity Info:
> > 	ID               : 0x0000000b (11)
> > 	Name             : unicam-image
> > 	Function         : V4L2 I/O
> > 	Flags            : default
> > 	Pad 0x0100000c   : 0: Sink
> > 	  Link 0x0200000f: from remote pad 0x1000003 of entity 'unicam' (Video Interface Bridge): Data, Enabled, Immutable
> > 
> > Required ioctls:
> > 	test MC information (see 'Media Driver Info' above): OK
> > 	test VIDIOC_QUERYCAP: OK
> > 	test invalid ioctls: OK
> > 
> > Allow for multiple opens:
> > 	test second /dev/video0 open: OK
> > 	test VIDIOC_QUERYCAP: OK
> > 	test VIDIOC_G/S_PRIORITY: OK
> > 	test for unlimited opens: OK
> > 
> > Debug ioctls:
> > 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > 	test VIDIOC_LOG_STATUS: OK
> > 
> > Input ioctls:
> > 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMINPUT: OK
> > 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > 	Inputs: 1 Audio Inputs: 0 Tuners: 0
> > 
> > Output ioctls:
> > 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> > 
> > Input/Output configuration ioctls:
> > 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > 	test VIDIOC_G/S_EDID: OK (Not Supported)
> > 
> > Control ioctls (Input 0):
> > 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> > 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> > 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > 	Standard Controls: 0 Private Controls: 0
> > 
> > Format ioctls (Input 0):
> > 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > 	test VIDIOC_G/S_PARM: OK (Not Supported)
> > 	test VIDIOC_G_FBUF: OK (Not Supported)
> > 	test VIDIOC_G_FMT: OK
> > 	test VIDIOC_TRY_FMT: OK
> > 	test VIDIOC_S_FMT: OK
> > 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > 	test Cropping: OK (Not Supported)
> > 	test Composing: OK (Not Supported)
> > 	test Scaling: OK
> > 
> > Codec ioctls (Input 0):
> > 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > 
> > Buffer ioctls (Input 0):
> > 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > 	test CREATE_BUFS maximum buffers: OK
> > 	test VIDIOC_REMOVE_BUFS: OK
> > 	test VIDIOC_EXPBUF: OK
> > 	test Requests: OK (Not Supported)
> > 
> > Total for unicam device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0
> > --------------------------------------------------------------------------------
> > Compliance test for unicam device /dev/video1:
> > 
> > Driver Info:
> > 	Driver name      : unicam
> > 	Card type        : unicam
> > 	Bus info         : platform:fe801000.csi
> > 	Driver version   : 6.9.0
> > 	Capabilities     : 0xa4a00001
> > 		Video Capture
> > 		Metadata Capture
> > 		I/O MC
> > 		Streaming
> > 		Extended Pix Format
> > 		Device Capabilities
> > 	Device Caps      : 0x24a00000
> > 		Metadata Capture
> > 		I/O MC
> > 		Streaming
> > 		Extended Pix Format
> > Media Driver Info:
> > 	Driver name      : unicam
> > 	Model            : unicam
> > 	Serial           :
> > 	Bus info         : platform:fe801000.csi
> > 	Media version    : 6.9.0
> > 	Hardware revision: 0x00000000 (0)
> > 	Driver version   : 6.9.0
> > Interface Info:
> > 	ID               : 0x03000013
> > 	Type             : V4L Video
> > Entity Info:
> > 	ID               : 0x00000011 (17)
> > 	Name             : unicam-embedded
> > 	Function         : V4L2 I/O
> > 	Pad 0x01000012   : 0: Sink
> > 	  Link 0x02000015: from remote pad 0x1000004 of entity 'unicam' (Video Interface Bridge): Data, Enabled, Immutable
> > 
> > Required ioctls:
> > 	test MC information (see 'Media Driver Info' above): OK
> > 	test VIDIOC_QUERYCAP: OK
> > 	test invalid ioctls: OK
> > 
> > Allow for multiple opens:
> > 	test second /dev/video1 open: OK
> > 	test VIDIOC_QUERYCAP: OK
> > 	test VIDIOC_G/S_PRIORITY: OK
> > 	test for unlimited opens: OK
> > 
> > Debug ioctls:
> > 	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
> > 	test VIDIOC_LOG_STATUS: OK
> > 
> > Input ioctls:
> > 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMINPUT: OK
> > 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > 	Inputs: 1 Audio Inputs: 0 Tuners: 0
> > 
> > Output ioctls:
> > 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> > 
> > Input/Output configuration ioctls:
> > 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > 	test VIDIOC_G/S_EDID: OK (Not Supported)
> > 
> > Control ioctls (Input 0):
> > 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> > 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> > 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > 	Standard Controls: 0 Private Controls: 0
> > 
> > Format ioctls (Input 0):
> > 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
> > 	test VIDIOC_G/S_PARM: OK (Not Supported)
> > 	test VIDIOC_G_FBUF: OK (Not Supported)
> > 	test VIDIOC_G_FMT: OK
> > 	test VIDIOC_TRY_FMT: OK
> > 	test VIDIOC_S_FMT: OK
> > 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > 	test Cropping: OK (Not Supported)
> > 	test Composing: OK (Not Supported)
> > 	test Scaling: OK (Not Supported)
> > 
> > Codec ioctls (Input 0):
> > 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > 
> > Buffer ioctls (Input 0):
> > 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
> > 	test CREATE_BUFS maximum buffers: OK
> > 	test VIDIOC_REMOVE_BUFS: OK
> > 	test VIDIOC_EXPBUF: OK
> > 	test Requests: OK (Not Supported)
> > 
> > Total for unicam device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0
> > --------------------------------------------------------------------------------
> > Compliance test for unicam device /dev/v4l-subdev0:
> > 
> > Driver Info:
> > 	Driver version   : 6.9.0
> > 	Capabilities     : 0x00000002
> > 		Streams Support
> > 	Client Capabilities: 0x0000000000000003
> > streams interval-uses-which Media Driver Info:
> > 	Driver name      : unicam
> > 	Model            : unicam
> > 	Serial           :
> > 	Bus info         : platform:fe801000.csi
> > 	Media version    : 6.9.0
> > 	Hardware revision: 0x00000000 (0)
> > 	Driver version   : 6.9.0
> > Interface Info:
> > 	ID               : 0x03000017
> > 	Type             : V4L Sub-Device
> > Entity Info:
> > 	ID               : 0x00000001 (1)
> > 	Name             : unicam
> > 	Function         : Video Interface Bridge
> > 	Pad 0x01000002   : 0: Sink
> > 	  Link 0x02000009: from remote pad 0x1000006 of entity 'imx219 5-0010' (Camera Sensor): Data, Enabled, Immutable
> > 	Pad 0x01000003   : 1: Source
> > 	  Link 0x0200000f: to remote pad 0x100000c of entity 'unicam-image' (V4L2 I/O): Data, Enabled, Immutable
> > 	Pad 0x01000004   : 2: Source
> > 	  Link 0x02000015: to remote pad 0x1000012 of entity 'unicam-embedded' (V4L2 I/O): Data, Enabled, Immutable
> > 
> > Required ioctls:
> > 	test MC information (see 'Media Driver Info' above): OK
> > 	test VIDIOC_SUDBEV_QUERYCAP: OK
> > 	test invalid ioctls: OK
> > 
> > Allow for multiple opens:
> > 	test second /dev/v4l-subdev0 open: OK
> > 	test VIDIOC_SUBDEV_QUERYCAP: OK
> > 	test for unlimited opens: OK
> > 
> > Debug ioctls:
> > 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> > 
> > Input ioctls:
> > 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> > 
> > Output ioctls:
> > 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> > 
> > Input/Output configuration ioctls:
> > 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > 	test VIDIOC_G/S_EDID: OK (Not Supported)
> > 
> > Sub-Device routing ioctls:
> > 	test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
> > 	test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
> > 
> > Sub-Device ioctls (Sink Pad 0):
> > 	Try Stream 0
> > 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> > 	test Try VIDIOC_SUBDEV_G/S_FMT: OK
> > 	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > 	Active Stream 0
> > 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> > 	test Active VIDIOC_SUBDEV_G/S_FMT: OK
> > 	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > 	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > 
> > Sub-Device ioctls (Source Pad 1):
> > 	Try Stream 0
> > 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> > 	test Try VIDIOC_SUBDEV_G/S_FMT: OK
> > 	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > 	Active Stream 0
> > 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> > 	test Active VIDIOC_SUBDEV_G/S_FMT: OK
> > 	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > 	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > 
> > Sub-Device ioctls (Source Pad 2):
> > 
> > Control ioctls:
> > 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
> > 	test VIDIOC_QUERYCTRL: OK (Not Supported)
> > 	test VIDIOC_G/S_CTRL: OK (Not Supported)
> > 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
> > 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
> > 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > 	Standard Controls: 0 Private Controls: 0
> > 
> > Format ioctls:
> > 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
> > 	test VIDIOC_G/S_PARM: OK (Not Supported)
> > 	test VIDIOC_G_FBUF: OK (Not Supported)
> > 	test VIDIOC_G_FMT: OK (Not Supported)
> > 	test VIDIOC_TRY_FMT: OK (Not Supported)
> > 	test VIDIOC_S_FMT: OK (Not Supported)
> > 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > 	test Cropping: OK (Not Supported)
> > 	test Composing: OK (Not Supported)
> > 	test Scaling: OK (Not Supported)
> > 
> > Codec ioctls:
> > 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > 
> > Buffer ioctls:
> > 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
> > 	test CREATE_BUFS maximum buffers: OK
> > 	test VIDIOC_REMOVE_BUFS: OK
> > 	test VIDIOC_EXPBUF: OK (Not Supported)
> > 	test Requests: OK (Not Supported)
> > 
> > Total for unicam device /dev/v4l-subdev0: 62, Succeeded: 62, Failed: 0, Warnings: 0
> > --------------------------------------------------------------------------------
> > Compliance test for unicam device /dev/v4l-subdev1:
> > 
> > Driver Info:
> > 	Driver version   : 6.9.0
> > 	Capabilities     : 0x00000002
> > 		Streams Support
> > 	Client Capabilities: 0x0000000000000003
> > streams interval-uses-which Media Driver Info:
> > 	Driver name      : unicam
> > 	Model            : unicam
> > 	Serial           :
> > 	Bus info         : platform:fe801000.csi
> > 	Media version    : 6.9.0
> > 	Hardware revision: 0x00000000 (0)
> > 	Driver version   : 6.9.0
> > Interface Info:
> > 	ID               : 0x03000019
> > 	Type             : V4L Sub-Device
> > Entity Info:
> > 	ID               : 0x00000005 (5)
> > 	Name             : imx219 5-0010
> > 	Function         : Camera Sensor
> > 	Pad 0x01000006   : 0: Source
> > 	  Link 0x02000009: to remote pad 0x1000002 of entity 'unicam' (Video Interface Bridge): Data, Enabled, Immutable
> > 	Pad 0x01000007   : 1: Sink, 00000008
> > 	Pad 0x01000008   : 2: Sink, 00000008
> > 
> > Required ioctls:
> > 	test MC information (see 'Media Driver Info' above): OK
> > 	test VIDIOC_SUDBEV_QUERYCAP: OK
> > 	test invalid ioctls: OK
> > 
> > Allow for multiple opens:
> > 	test second /dev/v4l-subdev1 open: OK
> > 	test VIDIOC_SUBDEV_QUERYCAP: OK
> > 	test for unlimited opens: OK
> > 
> > Debug ioctls:
> > 	test VIDIOC_LOG_STATUS: OK (Not Supported)
> > 
> > Input ioctls:
> > 	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDIO: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDIO: OK (Not Supported)
> > 	Inputs: 0 Audio Inputs: 0 Tuners: 0
> > 
> > Output ioctls:
> > 	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
> > 	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
> > 	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
> > 	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
> > 	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
> > 	Outputs: 0 Audio Outputs: 0 Modulators: 0
> > 
> > Input/Output configuration ioctls:
> > 	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
> > 	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
> > 	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
> > 	test VIDIOC_G/S_EDID: OK (Not Supported)
> > 
> > Sub-Device routing ioctls:
> > 	test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
> > 	test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
> > 
> > Sub-Device ioctls (Source Pad 0):
> > 	Try Stream 0
> > 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> > 	test Try VIDIOC_SUBDEV_G/S_FMT: OK
> > 		warn: v4l2-test-subdevs.cpp(566): VIDIOC_SUBDEV_G_SELECTION is supported for target 0 but not VIDIOC_SUBDEV_S_SELECTION
> > 	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
> > 	Try Stream 1
> > 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> > 	test Try VIDIOC_SUBDEV_G/S_FMT: OK
> > 	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > 	Active Stream 0
> > 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> > 	test Active VIDIOC_SUBDEV_G/S_FMT: OK
> > 		warn: v4l2-test-subdevs.cpp(566): VIDIOC_SUBDEV_G_SELECTION is supported for target 0 but not VIDIOC_SUBDEV_S_SELECTION
> > 	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
> > 	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > 	Active Stream 1
> > 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> > 	test Active VIDIOC_SUBDEV_G/S_FMT: OK
> > 	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > 	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > 
> > Sub-Device ioctls (Sink Pad 1):
> > 	Try Stream 0
> > 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> > 	test Try VIDIOC_SUBDEV_G/S_FMT: OK
> > 		warn: v4l2-test-subdevs.cpp(566): VIDIOC_SUBDEV_G_SELECTION is supported for target 0 but not VIDIOC_SUBDEV_S_SELECTION
> > 	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
> > 	Active Stream 0
> > 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> > 	test Active VIDIOC_SUBDEV_G/S_FMT: OK
> > 		warn: v4l2-test-subdevs.cpp(566): VIDIOC_SUBDEV_G_SELECTION is supported for target 0 but not VIDIOC_SUBDEV_S_SELECTION
> > 	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
> > 	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > 
> > Sub-Device ioctls (Sink Pad 2):
> > 	Try Stream 0
> > 	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> > 	test Try VIDIOC_SUBDEV_G/S_FMT: OK
> > 	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > 	Active Stream 0
> > 	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
> > 	test Active VIDIOC_SUBDEV_G/S_FMT: OK
> > 	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
> > 	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
> > 
> > Control ioctls:
> > 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
> > 	test VIDIOC_QUERYCTRL: OK
> > 	test VIDIOC_G/S_CTRL: OK
> > 	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
> > 	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
> > 	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
> > 	Standard Controls: 20 Private Controls: 0
> > 
> > Format ioctls:
> > 	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
> > 	test VIDIOC_G/S_PARM: OK (Not Supported)
> > 	test VIDIOC_G_FBUF: OK (Not Supported)
> > 	test VIDIOC_G_FMT: OK (Not Supported)
> > 	test VIDIOC_TRY_FMT: OK (Not Supported)
> > 	test VIDIOC_S_FMT: OK (Not Supported)
> > 	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
> > 	test Cropping: OK (Not Supported)
> > 	test Composing: OK (Not Supported)
> > 	test Scaling: OK (Not Supported)
> > 
> > Codec ioctls:
> > 	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
> > 	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
> > 	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
> > 
> > Buffer ioctls:
> > 	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
> > 	test CREATE_BUFS maximum buffers: OK
> > 	test VIDIOC_REMOVE_BUFS: OK
> > 	test VIDIOC_EXPBUF: OK (Not Supported)
> > 	test Requests: OK (Not Supported)
> > 
> > Total for unicam device /dev/v4l-subdev1: 76, Succeeded: 76, Failed: 0, Warnings: 4
> > 
> > Grand Total for unicam device /dev/media0: 242, Succeeded: 242, Failed: 0, Warnings: 4
> > 
> > 
> > Dave Stevenson (2):
> >    dt-bindings: media: Add bindings for bcm2835-unicam
> >    media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface
> > 
> > Jean-Michel Hautbois (3):
> >    media: v4l: Add V4L2-PIX-FMT-Y12P format
> >    media: v4l: Add V4L2-PIX-FMT-Y14P format
> >    ARM: dts: bcm2835: Add Unicam CSI nodes
> > 
> >   .../bindings/media/brcm,bcm2835-unicam.yaml   |  127 +
> >   .../media/v4l/pixfmt-yuv-luma.rst             |   48 +
> >   MAINTAINERS                                   |    7 +
> >   arch/arm/boot/dts/broadcom/bcm2711.dtsi       |    8 +
> >   arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi   |   14 +
> >   arch/arm/boot/dts/broadcom/bcm283x.dtsi       |   24 +
> >   drivers/media/platform/Kconfig                |    1 +
> >   drivers/media/platform/Makefile               |    1 +
> >   drivers/media/platform/broadcom/Kconfig       |   23 +
> >   drivers/media/platform/broadcom/Makefile      |    3 +
> >   .../platform/broadcom/bcm2835-unicam-regs.h   |  246 ++
> >   .../media/platform/broadcom/bcm2835-unicam.c  | 2741 +++++++++++++++++
> >   drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
> >   include/uapi/linux/videodev2.h                |    2 +
> >   14 files changed, 3247 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
> >   create mode 100644 drivers/media/platform/broadcom/Kconfig
> >   create mode 100644 drivers/media/platform/broadcom/Makefile
> >   create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam-regs.h
> >   create mode 100644 drivers/media/platform/broadcom/bcm2835-unicam.c
> > 
> > 
> > base-commit: 47120f3da814440058a9823bf9ac3a660b2ce9c0

-- 
Regards,

Laurent Pinchart

