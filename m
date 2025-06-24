Return-Path: <linux-media+bounces-35741-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FDFAE6228
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 12:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57279192329D
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 10:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B176328469C;
	Tue, 24 Jun 2025 10:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LFkR2BnG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1392227F4D0;
	Tue, 24 Jun 2025 10:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760497; cv=none; b=jxtbEWjZ1I1m1uaega7WkZzG0zb4VoyhX5Qz1jGTHz0m9tirg95KC9F4fc7F5GMoBn8EMQGYyjMCkCW8eXXXEmuEHIUFvvlJf0bO2tsx2B/MWmhIT3e0bVq1tVo9CmWeyHK5G/+2vLE2h5ix4GD9GrnXYSlc6D2IPtg18YpMgLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760497; c=relaxed/simple;
	bh=aSEnhtL4czUKZiu/CoyL9En3V1wnr8M+PHdTPs1XwlM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a7xbhkhd6UbMy2yyiBnpgDzWrhX0fzv9DY1oktGnLEzhJqzwEIZWNEPgxUUmZvsYOY536LtNqx6W9IvTbAXTvWF8tLvl1tBVOYKLZm/o2QIV89QMy4Ou+BG0N3XHoTS1ZnpUtrilU+uvh1BOj2RQsGyc2LIcdOI46slqwo/nxjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LFkR2BnG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE719741;
	Tue, 24 Jun 2025 12:21:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750760474;
	bh=aSEnhtL4czUKZiu/CoyL9En3V1wnr8M+PHdTPs1XwlM=;
	h=From:Subject:Date:To:Cc:From;
	b=LFkR2BnGDTuiBkA3vw14ka6bbHgc/qdv6W12pXV26/r2kO7iOPim8Ela0D4vRKs1y
	 8dTKCqZvuNO8Y+JpPI0izMYZPe6GdXwIW3JljEAOz2xO8di3H9xraoKtGEdDpEbbgD
	 jwm7ziTFDh6VM36V6cwFcaYxWdI8bilRkbx81bmw=
From: Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v10 00/17] Add Arm Mali-C55 Image Signal Processor Driver
Date: Tue, 24 Jun 2025 11:21:13 +0100
Message-Id: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABl8WmgC/02PzW7CMBCEXyXyuY78T5wT71FxWHvXxRWJwU5RK
 8S71ypI9Dgzu59mbqxRzdTYPNxYpWtuuaxdSPE2sHiE9YN4xm4wJZQVThkereVBR+2CIolTZP3
 yXCnl7z/M+6HrVMvCt2MleP1a6aXRRvjRWCmF4JIjrGOLcDr97DMStLKGAhXHWJYntdLlq3faH
 mgWoBHv6ZK33tGrnQp6B2DSpCNYFTD5KB1anGRAlNoa4w37P2UenkM0Xwgz8M8SGndJJ++dFk7
 H+arY4X7/BbNE/uEaAQAA
X-Change-ID: 20250624-c55-b3c36b2e1d8c
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com, 
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=42659;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=aSEnhtL4czUKZiu/CoyL9En3V1wnr8M+PHdTPs1XwlM=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoWnwmxMrhePFZ+OPpRLzXpkWHqyqCfh3S8LF5z
 HdJ4SHNidWJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaFp8JgAKCRDISVd6bEV1
 MqGzD/9bVMokLnl2Zw3+W80mE8T4yndxQYHByIGiD7yLAa/lG1fnU9SZNvzZ5VLWZ+yqiCbF9yz
 xWxG2IK9zxp8B4JEIQoZBpRE3oC1KQDj4NV5QN+pmEBuyuCrKYQE9QwZzH6ubczClv67CW9z7ic
 prnke3jd3iX6n3slmTMPNEH0fuicaK2tYhzp2JPm8lEMNdszuti5gnJPGNUUmowB7JpfPmX3I7N
 WWy2sD0PLVmjRbPF/XSd1xiffrqjTh2386m2IZr0YB9RiQ+J79sq4h1GTHdojpnGQEtq7e21e4J
 Y583qslGuZf5LPfHPqDzTpw0Uk92r1iE4Y3OPgt2m8CnUiPYPtOiFwe4SLOsAY+7/m7ABdxdgKR
 a4et9EVoavfpXA47t/Ya4BqnwIAwBx1A0mT+01gjgT6tTyfC2S/UaDjdWp3d1UKkk9NGtwEqRns
 DQJuCiYrjP4quj7e1Me3IJmfPr9Ze6autpY6f8lHPAyn6EVEHLrSLivzFGolJIxjQcX+Z1cGN6s
 +G4NSN8L0xVAMnMTM5mfRj18DLz/whmfcQ1oaDu1OW0KkZmbwj51AHmJB0SfP6TyKyIbQ1kPJ/S
 ju7lT0DI+k/Em8gu5+nK6+FT4XvzdrcC7Bd0rBUWPFWz0aIwShRDG8mwMTe5XXtx1uIHBkAhpta
 NSs4eKcHmo0ECcA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Hello all

Quick note at the top: the driver now uses the media jobs framework that was
recently posted [1] and so this series is based on top of that one.

This patchset introduces a driver for Arm's Mali-C55 Image Signal Processor.
The driver uses the V4L2 / media controller API and implements both of the ISP's
capture pipelines allowing a range of output formats plus downscaling and
cropping. The capture pipelines are named "Full resolution" and "Downscale" and
so abbreviated FR and DS throughout the driver.

The driver exposes 4 V4L2 subdevices:

- mali-c55 isp: input data formatting
- mali-c55 tpg: test pattern generator (modeled as a camera sensor entity)
- mali-c55 resizer fr: downscale / crop and format setting for the FR pipe
- mali-c55 resizer ds: downscale / crop and format setting for the DS pipe

Along with 4 V4L2 Video devices:

- mali-c55 fr: Capture device for the full resolution pipe
- mali-c55 ds: Capture device for the downscale pipe
- mali-c55 3a stats: Capture device for statistics to support 3A algorithms
- mali-c55 3a params: Output device for parameter buffers to configure the ISP

Support is implemented in the parameters video device code for many of the ISP'S
hardware blocks, but not yet all of them. The buffer format is (as far as I am
aware anyway) a novel design that we intend to be extensible so that support for
the C55's remaining hardware blocks can be added later.

Patches 1, 4, 5, 6 and 7 have already had versions 1-4 on the mailing list...I
decided to post the additional work on the driver as extra patches rather than
merge them all into the existing series as it's already a lot of code to review
and I hoped that that might make it a little easier...if I'm wrong and that's
not liked I can just squash them into a much smaller series.

Previous versions:

v9: https://lore.kernel.org/linux-media/20250519143409.451100-1-dan.scally@ideasonboard.com/#t
v8: https://lore.kernel.org/linux-media/20241106100534.768400-1-dan.scally@ideasonboard.com/
v7: https://lore.kernel.org/linux-media/20240906153406.650105-1-dan.scally@ideasonboard.com/
v6: https://lore.kernel.org/linux-media/20240709132906.3198927-1-dan.scally@ideasonboard.com/
v5: https://lore.kernel.org/linux-media/20240529152858.183799-1-dan.scally@ideasonboard.com/
v4: https://lore.kernel.org/linux-media/20240418090825.624747-1-dan.scally@ideasonboard.com/
v3: https://lore.kernel.org/linux-media/20240305164832.2055437-1-dan.scally@ideasonboard.com/
v2: https://lore.kernel.org/linux-media/20240214141906.245685-1-dan.scally@ideasonboard.com/
v1: https://lore.kernel.org/linux-media/20240131164709.810587-1-dan.scally@ideasonboard.com/

The rest of this message comprises the v4l2-compliance report for the driver.
The tool reports 4 failures, which are because height and width are set to 0 for
MEDIA_BUS_FMT_METADATA_FIXED in the ISP subdev, but this is as directed by the
documentation [2] so I suspect that v4l2-compliance needs amending.

[1] https://lore.kernel.org/linux-media/20250624-media-jobs-v2-0-8e649b069a96@ideasonboard.com/T/#t
[2] Documentation/userspace-api/media/v4l-subdev-formats.rst

v4l2-compliance 1.29.0-5246, 64 bits, 64-bit time_t
v4l2-compliance SHA: 201ccf743cde 2024-09-06 07:16:29

Compliance test for mali-c55 device /dev/media0:

Media Driver Info:
	Driver name      : mali-c55
	Model            : ARM Mali-C55 ISP
	Serial           :
	Bus info         : platform:16080000.isp
	Media version    : 6.14.0
	Hardware revision: 0x01d982d6 (31032022)
	Driver version   : 6.14.0

Required ioctls:
	test MEDIA_IOC_DEVICE_INFO: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/media0 open: OK
	test MEDIA_IOC_DEVICE_INFO: OK
	test for unlimited opens: OK

Media Controller ioctls:
	test MEDIA_IOC_G_TOPOLOGY: OK
	Entities: 8 Interfaces: 8 Pads: 15 Links: 16
	test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
	test MEDIA_IOC_SETUP_LINK: OK

Total for mali-c55 device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mali-c55 device /dev/video0:

Driver Info:
	Driver name      : mali-c55
	Card type        : ARM Mali-C55 ISP
	Bus info         : platform:16080000.isp
	Driver version   : 6.14.0
	Capabilities     : 0xa4201000
		Video Capture Multiplanar
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x24201000
		Video Capture Multiplanar
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mali-c55
	Model            : ARM Mali-C55 ISP
	Serial           :
	Bus info         : platform:16080000.isp
	Media version    : 6.14.0
	Hardware revision: 0x01d982d6 (31032022)
	Driver version   : 6.14.0
Interface Info:
	ID               : 0x0300000f
	Type             : V4L Video
Entity Info:
	ID               : 0x0000000d (13)
	Name             : mali-c55 fr
	Function         : V4L2 I/O
	Pad 0x0100000e   : 0: Sink
	  Link 0x0200001f: from remote pad 0x100000b of entity 'mali-c55 resizer fr' (Video Scaler): Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Total for mali-c55 device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mali-c55 device /dev/video1:

Driver Info:
	Driver name      : mali-c55
	Card type        : ARM Mali-C55 ISP
	Bus info         : platform:16080000.isp
	Driver version   : 6.14.0
	Capabilities     : 0xac200000
		Metadata Output
		I/O MC
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x2c200000
		Metadata Output
		I/O MC
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mali-c55
	Model            : ARM Mali-C55 ISP
	Serial           :
	Bus info         : platform:16080000.isp
	Media version    : 6.14.0
	Hardware revision: 0x01d982d6 (31032022)
	Driver version   : 6.14.0
Interface Info:
	ID               : 0x03000013
	Type             : V4L Video
Entity Info:
	ID               : 0x00000011 (17)
	Name             : mali-c55 3a params
	Function         : V4L2 I/O
	Pad 0x01000012   : 0: Source
	  Link 0x02000023: to remote pad 0x1000008 of entity 'mali-c55 isp' (Image Signal Processor): Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video1 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 1 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Output 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls (Output 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Output 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Output 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Total for mali-c55 device /dev/video1: 49, Succeeded: 49, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mali-c55 device /dev/video2:

Driver Info:
	Driver name      : mali-c55
	Card type        : ARM Mali-C55 ISP
	Bus info         : platform:16080000.isp
	Driver version   : 6.14.0
	Capabilities     : 0x84a00000
		Metadata Capture
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04a00000
		Metadata Capture
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mali-c55
	Model            : ARM Mali-C55 ISP
	Serial           :
	Bus info         : platform:16080000.isp
	Media version    : 6.14.0
	Hardware revision: 0x01d982d6 (31032022)
	Driver version   : 6.14.0
Interface Info:
	ID               : 0x03000017
	Type             : V4L Video
Entity Info:
	ID               : 0x00000015 (21)
	Name             : mali-c55 3a stats
	Function         : V4L2 I/O
	Pad 0x01000016   : 0: Sink
	  Link 0x02000021: from remote pad 0x1000007 of entity 'mali-c55 isp' (Image Signal Processor): Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video2 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Total for mali-c55 device /dev/video2: 49, Succeeded: 49, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for rzv2h-ivc device /dev/video3:

Driver Info:
	Driver name      : rzv2h-ivc
	Card type        : Renesas Input Video Control
	Bus info         : platform:16080000.isp
	Driver version   : 6.14.0
	Capabilities     : 0x84200002
		Video Output
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04200002
		Video Output
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : mali-c55
	Model            : ARM Mali-C55 ISP
	Serial           :
	Bus info         : platform:16080000.isp
	Media version    : 6.14.0
	Hardware revision: 0x01d982d6 (31032022)
	Driver version   : 6.14.0
Interface Info:
	ID               : 0x0300002a
	Type             : V4L Video
Entity Info:
	ID               : 0x00000028 (40)
	Name             : rzv2h-ivc
	Function         : V4L2 I/O
	Pad 0x01000029   : 0: Source
	  Link 0x02000036: to remote pad 0x1000026 of entity 'rzv2h ivc block' (V4L2 I/O): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video3 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test blocking wait: OK

Total for rzv2h-ivc device /dev/video3: 49, Succeeded: 49, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mali-c55 device /dev/v4l-subdev0:

Driver Info:
	Driver version   : 6.14.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000003
streams interval-uses-which Media Driver Info:
	Driver name      : mali-c55
	Model            : ARM Mali-C55 ISP
	Serial           :
	Bus info         : platform:16080000.isp
	Media version    : 6.14.0
	Hardware revision: 0x01d982d6 (31032022)
	Driver version   : 6.14.0
Interface Info:
	ID               : 0x0300002e
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000001 (1)
	Name             : mali-c55 tpg
	Function         : Camera Sensor
	Pad 0x01000002   : 0: Source
	  Link 0x02000019: to remote pad 0x1000004 of entity 'mali-c55 isp' (Image Signal Processor): Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev0 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device ioctls (Source Pad 0):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 6 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK (Not Supported)

Total for mali-c55 device /dev/v4l-subdev0: 54, Succeeded: 54, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mali-c55 device /dev/v4l-subdev1:

Driver Info:
	Driver version   : 6.14.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000003
streams interval-uses-which Media Driver Info:
	Driver name      : mali-c55
	Model            : ARM Mali-C55 ISP
	Serial           :
	Bus info         : platform:16080000.isp
	Media version    : 6.14.0
	Hardware revision: 0x01d982d6 (31032022)
	Driver version   : 6.14.0
Interface Info:
	ID               : 0x03000030
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000003 (3)
	Name             : mali-c55 isp
	Function         : Image Signal Processor
	Pad 0x01000004   : 0: Sink, Must Connect
	  Link 0x02000019: from remote pad 0x1000002 of entity 'mali-c55 tpg' (Camera Sensor): Data
	  Link 0x0200002c: from remote pad 0x1000027 of entity 'rzv2h ivc block' (V4L2 I/O): Data, Enabled
	Pad 0x01000005   : 1: Source
	  Link 0x0200001b: to remote pad 0x100000a of entity 'mali-c55 resizer fr' (Video Scaler): Data, Enabled, Immutable
	Pad 0x01000006   : 2: Source
	  Link 0x0200001d: to remote pad 0x100000c of entity 'mali-c55 resizer fr' (Video Scaler): Data, Enabled, Immutable
	Pad 0x01000007   : 3: Source
	  Link 0x02000021: to remote pad 0x1000016 of entity 'mali-c55 3a stats' (V4L2 I/O): Data, Enabled
	Pad 0x01000008   : 4: Sink
	  Link 0x02000023: from remote pad 0x1000012 of entity 'mali-c55 3a params' (V4L2 I/O): Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev1 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device ioctls (Sink Pad 0):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 1):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 2):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 3):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
		fail: ../utils/v4l2-compliance/v4l2-test-subdevs.cpp(369): fmt.width == 0 || fmt.width > 65536
		fail: ../utils/v4l2-compliance/v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
		fail: ../utils/v4l2-compliance/v4l2-test-subdevs.cpp(369): fmt.width == 0 || fmt.width > 65536
		fail: ../utils/v4l2-compliance/v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 4):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
		fail: ../utils/v4l2-compliance/v4l2-test-subdevs.cpp(369): fmt.width == 0 || fmt.width > 65536
		fail: ../utils/v4l2-compliance/v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
		fail: ../utils/v4l2-compliance/v4l2-test-subdevs.cpp(369): fmt.width == 0 || fmt.width > 65536
		fail: ../utils/v4l2-compliance/v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 1 Private Controls: 1

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK (Not Supported)

Total for mali-c55 device /dev/v4l-subdev1: 82, Succeeded: 78, Failed: 4, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mali-c55 device /dev/v4l-subdev2:

Driver Info:
	Driver version   : 6.14.0
	Capabilities     : 0x00000002
		Streams Support
	Client Capabilities: 0x0000000000000003
streams interval-uses-which Media Driver Info:
	Driver name      : mali-c55
	Model            : ARM Mali-C55 ISP
	Serial           :
	Bus info         : platform:16080000.isp
	Media version    : 6.14.0
	Hardware revision: 0x01d982d6 (31032022)
	Driver version   : 6.14.0
Interface Info:
	ID               : 0x03000032
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000009 (9)
	Name             : mali-c55 resizer fr
	Function         : Video Scaler
	Pad 0x0100000a   : 0: Sink
	  Link 0x0200001b: from remote pad 0x1000005 of entity 'mali-c55 isp' (Image Signal Processor): Data, Enabled, Immutable
	Pad 0x0100000b   : 1: Source
	  Link 0x0200001f: to remote pad 0x100000e of entity 'mali-c55 fr' (V4L2 I/O): Data, Enabled
	Pad 0x0100000c   : 2: Sink
	  Link 0x0200001d: from remote pad 0x1000006 of entity 'mali-c55 isp' (Image Signal Processor): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev2 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device routing ioctls:
	test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
	test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK

Sub-Device ioctls (Sink Pad 0):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 1):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 2):

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK (Not Supported)

Total for mali-c55 device /dev/v4l-subdev2: 63, Succeeded: 63, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for mali-c55 device /dev/v4l-subdev3:

Driver Info:
	Driver version   : 6.14.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000003
streams interval-uses-which Media Driver Info:
	Driver name      : mali-c55
	Model            : ARM Mali-C55 ISP
	Serial           :
	Bus info         : platform:16080000.isp
	Media version    : 6.14.0
	Hardware revision: 0x01d982d6 (31032022)
	Driver version   : 6.14.0
Interface Info:
	ID               : 0x03000034
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000025 (37)
	Name             : rzv2h ivc block
	Function         : V4L2 I/O
	Pad 0x01000026   : 0: Sink
	  Link 0x02000036: from remote pad 0x1000029 of entity 'rzv2h-ivc' (V4L2 I/O): Data, Enabled, Immutable
	Pad 0x01000027   : 1: Source
	  Link 0x0200002c: to remote pad 0x1000004 of entity 'mali-c55 isp' (Image Signal Processor): Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev3 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device ioctls (Sink Pad 0):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 1):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK (Not Supported)

Total for mali-c55 device /dev/v4l-subdev3: 61, Succeeded: 61, Failed: 0, Warnings: 0

Grand Total for mali-c55 device /dev/media0: 464, Succeeded: 460, Failed: 4, Warnings: 0

---
Daniel Scally (16):
      media: uapi: Add MEDIA_BUS_FMT_RGB202020_1X60 format code
      media: uapi: Add 20-bit bayer formats
      media: v4l2-common: Add RAW16 format info
      media: v4l2-common: Add RAW14 format info
      dt-bindings: media: Add bindings for ARM mali-c55
      media: uapi: Add controls for Mali-C55 ISP
      media: mali-c55: Add Mali-C55 ISP driver
      media: Documentation: Add Mali-C55 ISP Documentation
      MAINTAINERS: Add entry for mali-c55 driver
      media: Add MALI_C55_3A_STATS meta format
      media: uapi: Add 3a stats buffer for mali-c55
      media: platform: Add mali-c55 3a stats devnode
      Documentation: mali-c55: Add Statistics documentation
      media: uapi: Add parameters structs to mali-c55-config.h
      media: platform: Add mali-c55 parameters video node
      Documentation: mali-c55: Document the mali-c55 parameter setting

Jacopo Mondi (1):
      media: mali-c55: Add image formats for Mali-C55 parameters buffer

 Documentation/admin-guide/media/mali-c55-graph.dot |   19 +
 Documentation/admin-guide/media/mali-c55.rst       |  413 +++++++
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 .../devicetree/bindings/media/arm,mali-c55.yaml    |   89 ++
 .../userspace-api/media/drivers/index.rst          |    1 +
 .../userspace-api/media/drivers/mali-c55.rst       |   55 +
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../media/v4l/metafmt-arm-mali-c55.rst             |   89 ++
 .../userspace-api/media/v4l/subdev-formats.rst     |  420 ++++++-
 MAINTAINERS                                        |   14 +
 drivers/media/platform/Kconfig                     |    1 +
 drivers/media/platform/Makefile                    |    1 +
 drivers/media/platform/arm/Kconfig                 |    5 +
 drivers/media/platform/arm/Makefile                |    2 +
 drivers/media/platform/arm/mali-c55/Kconfig        |   17 +
 drivers/media/platform/arm/mali-c55/Makefile       |   11 +
 .../media/platform/arm/mali-c55/mali-c55-capture.c | 1051 ++++++++++++++++++
 .../media/platform/arm/mali-c55/mali-c55-common.h  |  316 ++++++
 .../media/platform/arm/mali-c55/mali-c55-core.c    | 1119 +++++++++++++++++++
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c |  688 ++++++++++++
 .../media/platform/arm/mali-c55/mali-c55-params.c  |  918 ++++++++++++++++
 .../platform/arm/mali-c55/mali-c55-registers.h     |  449 ++++++++
 .../media/platform/arm/mali-c55/mali-c55-resizer.c | 1156 ++++++++++++++++++++
 .../media/platform/arm/mali-c55/mali-c55-stats.c   |  528 +++++++++
 drivers/media/platform/arm/mali-c55/mali-c55-tpg.c |  438 ++++++++
 drivers/media/v4l2-core/v4l2-common.c              |    8 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 include/uapi/linux/media-bus-format.h              |    9 +-
 include/uapi/linux/media/arm/mali-c55-config.h     |  923 ++++++++++++++++
 include/uapi/linux/v4l2-controls.h                 |    6 +
 include/uapi/linux/videodev2.h                     |    4 +
 31 files changed, 8750 insertions(+), 4 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250624-c55-b3c36b2e1d8c
prerequisite-change-id: 20250623-media-jobs-6f3f9963063c:v2
prerequisite-patch-id: 0852507344c44fcf4fa3d2a831c01ab23b9dcffb
prerequisite-patch-id: 039d718b90b570bc4c2766b9da20db9e6bdb5c9b
prerequisite-patch-id: 78e666f180a0650b8ddcdaad933c886d095c8a4c

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>


