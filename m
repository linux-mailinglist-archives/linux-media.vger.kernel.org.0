Return-Path: <linux-media+bounces-30095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2799DA87901
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 09:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B0EF18928E1
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 07:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC57266EE0;
	Mon, 14 Apr 2025 07:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMDWSYTW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A60259C9D;
	Mon, 14 Apr 2025 07:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744616125; cv=none; b=p6go2ejqnRzzu57SC4tZNky+yu/6b04i8vU7OVKiH+qQxAyO9vH+CPo5OgoKfXvMXyCUwjMSqcmnfzDbI9RTI1/CJiAghkTHj8szOE90uG9Pkox47zifS6+lu4dpijv386qgWkk4OzuAemCxD+Og0zXSN2xkr/d5pARBqEa6Vgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744616125; c=relaxed/simple;
	bh=O3+qjuiJ/bfsRK6lxIRWYab2j5nJ0WuHF5nNahIGchk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=otVxJ278YqfcMySudh+lDOGxYuCaK239D5JNY7npnTibtm/yx8GOCmW4i8r3Zb+KsdV1pQBmtMM5Nm80Lki6vrRtz1345wwwinYPSnCdJyRo04J/EJk03npBHyKd0mBsMcUSqgdwoLkbQcim1rgjRoYnETi4kc2A+tCWgKbRJsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMDWSYTW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45294C4CEE2;
	Mon, 14 Apr 2025 07:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744616124;
	bh=O3+qjuiJ/bfsRK6lxIRWYab2j5nJ0WuHF5nNahIGchk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=lMDWSYTWy+BN+xPxJR3rsCKS9e9L9ltoWLhrWe7H35w0JBaCcRI236ICm1xxmpX09
	 cp+FigSzNDvku/eeBY3m2rWZM8HiDzod9YjfhZ19IJzoJ1RTH82JKgLOb25lFVxKAn
	 DyRyL661YtKCAxWjd9CCGO1xb6N1AoBvHEIFVM8hTRHtEV2IPqXpguMWno7a0M/kMD
	 XlRgGKCNGcX1jPSDoWFO1p3gqSl+PrmJMB2qf/ST5iMeqxzDDgx6Sk5gejjqmP9OLB
	 B53J5xZ1yWwjMe7fWMHL+ojnaO8Ldjk+N4WGbZf3eRfd2oBO21LCKRYRU1mNTE0QWO
	 jbcsprfQErEYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30330C369AE;
	Mon, 14 Apr 2025 07:35:24 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Subject: [PATCH v8 00/10] Amlogic C3 ISP support
Date: Mon, 14 Apr 2025 15:35:13 +0800
Message-Id: <20250414-c3isp-v8-0-9f89e537494e@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALG6/GcC/23OTWrDMBAF4KsEresyo3911XuULmRplAiaOFjFJ
 ATfvbJBrYm7Ek/M92YerNCYqbC3w4ONNOWSh0sN9uXAwslfjtTlWDPjwCU4EF0QuVw7ExIZ6Hu
 urGB19jpSyre15+Oz5lMu38N4X2snXH6fGybsoLM+AcUQUAT77s9fwzGH1zCc2dIx8a1zzfHq6
 rjWHgN5pfdObBza5kR1yRjphSNd372Tvw45qOZkdaFHq21PgKD2Tm0cN82pxRnkkozmKf1zp25
 Owcbp9U5O6MDKCHHvzJ8TiM2ZZZ9QCnuKDp7vnOf5BySKEensAQAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 jacopo.mondi@ideasonboard.com, Keke Li <keke.li@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744616122; l=61098;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=O3+qjuiJ/bfsRK6lxIRWYab2j5nJ0WuHF5nNahIGchk=;
 b=yO9RBTLtDLoydqw5ArZV8+MfKIz1Sj8D5uLJtg1g6yxjI+XRgDljp8MP43ctub+S1aBrCC45G
 YbjS0l7B5j3CT0dJCfkoiY8ZcoPgkoHQz960pSlEG7exI/jvKHe39/S
X-Developer-Key: i=keke.li@amlogic.com; a=ed25519;
 pk=XxNPTsQ0YqMJLLekV456eoKV5gbSlxnViB1k1DhfRmU=
X-Endpoint-Received: by B4 Relay for keke.li@amlogic.com/20240902 with
 auth_id=204
X-Original-From: Keke Li <keke.li@amlogic.com>
Reply-To: keke.li@amlogic.com

The Amlogic C3 platform integrates an ISP capable of supporting
multi-camera, multi-exposure high dynamic range (HDR) imaging with up to
14-bit raw RGB Bayer data.

Capturing images on the C3 involves operating the CSI2 receiver and PHY,
an adapter layer that integrates the inline processing from the PHY to
the ISP, and the ISP driver itself.

This implementation consists of several distinct module drivers and
is expected to support different platforms in the future.

---
Changes in v8:
- Improve the commit message of the C3 ISP driver.
- Update the v4l2-compliance report.
- Link to v7: https://lore.kernel.org/r/20250311-c3isp-v7-0-c3551bed9005@amlogic.com

Changes in v7:
- Modify the issue of an initialization field being overwritten in
  c3-isp-capture.c
- Link to v6: https://lore.kernel.org/r/20250227-c3isp-v6-0-f72e19084d0d@amlogic.com

Changes in v6:
- Drop assigned-clocks and assigned-clock-rates in amlogic,c3-mipi-csi2.yaml
  and remove the Review-by tag.
- Drop assigned-clocks and assigned-clock-rates in amlogic,c3-mipi-adapter.yaml
  and remove the Review-by tag.
- Drop assigned-clocks and assigned-clock-rates in amlogic,c3-isp.yaml
  and remove the Review-by tag.
- Add the reset configuration in c3-mipi-adap.c.
- Support RAW format output in ISP driver.
- Link to v5: https://lore.kernel.org/r/20241227-c3isp-v5-0-c7124e762ff6@amlogic.com

Changes in v5:
- Add assigned-clocks and assigned-clock-rates in amlogic,c3-mipi-csi2.yaml,
  amlogic,c3-mipi-adapter.yaml and amlogic,c3-isp.yaml.
- Remove clock rate configuration in c3-mipi-csi2.c, c3-mipi-adap.c and
  c3-isp-dev.c.
- Indenting with Tab in register macro definitions for all drivers.
- Support V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE in c3-isp-capture.c
- Enable and check frame start interruption in c3-isp-dev.c.
- Align struct c3_isp_params_xxx to 8 bytes in c3-isp-config.h
- Remove c3_mipi_csi_cfg_routing() and c3_mipi_csi_init_routing() in c3-mipi-csi2.c.
- Remove c3_mipi_adap_cfg_routing() and c3_mipi_adap_init_routing() in c3-mipi-adap.c.
- Remove c3_isp_core_cfg_routing() and c3_isp_core_init_routing() in c3-isp-core.c.
- Link to v4: https://lore.kernel.org/r/20241205-c3isp-v4-0-cb1868be0105@amlogic.com

Changes in v4:
- Create c3 directory in drivers/media/platform/amlogic/
- Move isp, mipi-adapter and mipi-csi2 drivers to c3 directory.
- Create amlogic directory in include/uapi/linux/media/
- Move c3-isp-config.h to include/uapi/linux/media/amlogic
- Add .enable_streams() and .disable_streams() interface
  in c3-isp-resizer.c.
- Remove .set_routing() interface in c3-isp-core.c,
  c3-mipi-adap.c and c3-mipi-csi2.c.
- Update the parameter comments in c3-isp-config.h
- Update the bit macros of register in c3-isp-regs.h, c3-mipi-adap.c
  and c3-mipi-csi2.c.
- Move parameters validation to .buf_prepare() in c3-isp-params.c.
- Add c3_isp_core_queue_eof() in c3-isp-core.c
- Improve the c3 ISP documentation in c3-isp.rst
- Update the v4l2-compliance report.
- Link to v3: https://lore.kernel.org/r/20240918-c3isp-v3-0-f774a39e6774@amlogic.com

Changes in v3:
- Moved change log here.
- Use "port" instead of "ports" in amogic,c3-isp.yaml.
- Reworked c3_xxx_vb2_queue_setup() to meet the request for larger size.
- Reworked c3_mipi_csi_write(), c3_mipi_csi_update_bits() and
  c3_mipi_csi_update_bits() to return void.
- Reworked c3_mipi_xxx_set_fmt() to return v4l2_subdev_get_fmt()
  in second "if" segment and delete the first "if" segment.
- Switched back to .remove() in struct platform_driver c3_xxx_driver.
- Adjusted from three lines to two lines in some places
  where registers are changed.
- Rename the title of the drivers in MAINTAINERS file.
- Update the v4l2-compliance report.
- Link to v2: https://lore.kernel.org/r/20240909-c3isp-v2-0-3c866a1cea56@amlogic.com

Changes in v2:
- Drop "minItems" and some blank lines in amlogic,c3-xxx.yaml.
- Rename items of the reg-names in amlogic,c3-mipi-csi2.yaml and
  amlogic,c3-mipi-adapter.yaml.
- Replace dev_err and return with dev_err_probe in probe function.
- Change clock[] to clocks[] in struct c3_xxx_info.
- Change clock_rate[] to clock_rates[] in struct c3_xxx_info.
- Change clock[] to clks[] in struct xxx_device.
- Link to v1: https://lore.kernel.org/r/20240903-c3isp-v1-0-8af0edcc13c8@amlogic.com

The rest of this message is the v4l2-compliance report for the driver.
The v4l2-compliance reports 4 failures and 2 warnings. The 2 warnings
are from imx290 driver(drivers/media/i2c/imx290.c). The 4 failures are
because height and width are set to 0 for MEDIA_BUS_FMT_METADATA_FIXED
in isp-core subdev, but this is a document requiement.

v4l2-compliance 1.29.0-5246, 64 bits, 64-bit time_t
v4l2-compliance SHA: 201ccf743cde 2024-09-06 07:16:29

Compliance test for c3-isp device /dev/media0:

Media Driver Info:
	Driver name      : c3-isp
	Model            : c3-isp
	Serial           : 
	Bus info         : platform:ff000000.isp
	Media version    : 6.15.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 6.15.0

Required ioctls:
	test MEDIA_IOC_DEVICE_INFO: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/media0 open: OK
	test MEDIA_IOC_DEVICE_INFO: OK
	test for unlimited opens: OK

Media Controller ioctls:
	test MEDIA_IOC_G_TOPOLOGY: OK
	Entities: 12 Interfaces: 12 Pads: 22 Links: 23
	test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
	test MEDIA_IOC_SETUP_LINK: OK

Total for c3-isp device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for c3-isp device /dev/video0:

Driver Info:
	Driver name      : c3-isp
	Card type        : AML C3 ISP
	Bus info         : platform:ff000000.isp
	Driver version   : 6.15.0
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : c3-isp
	Model            : c3-isp
	Serial           : 
	Bus info         : platform:ff000000.isp
	Media version    : 6.15.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 6.15.0
Interface Info:
	ID               : 0x0300001d
	Type             : V4L Video
Entity Info:
	ID               : 0x0000001b (27)
	Name             : c3-isp-cap0
	Function         : V4L2 I/O
	Pad 0x0100001c   : 0: Sink
	  Link 0x0200002f: from remote pad 0x100000a of entity 'c3-isp-resizer0' (Video Scaler): Data, Enabled, Immutable

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

Total for c3-isp device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for c3-isp device /dev/video1:

Driver Info:
	Driver name      : c3-isp
	Card type        : AML C3 ISP
	Bus info         : platform:ff000000.isp
	Driver version   : 6.15.0
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : c3-isp
	Model            : c3-isp
	Serial           : 
	Bus info         : platform:ff000000.isp
	Media version    : 6.15.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 6.15.0
Interface Info:
	ID               : 0x03000021
	Type             : V4L Video
Entity Info:
	ID               : 0x0000001f (31)
	Name             : c3-isp-cap1
	Function         : V4L2 I/O
	Pad 0x01000020   : 0: Sink
	  Link 0x02000033: from remote pad 0x100000d of entity 'c3-isp-resizer1' (Video Scaler): Data, Enabled, Immutable

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

Total for c3-isp device /dev/video1: 49, Succeeded: 49, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for c3-isp device /dev/video2:

Driver Info:
	Driver name      : c3-isp
	Card type        : AML C3 ISP
	Bus info         : platform:ff000000.isp
	Driver version   : 6.15.0
	Capabilities     : 0x84201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : c3-isp
	Model            : c3-isp
	Serial           : 
	Bus info         : platform:ff000000.isp
	Media version    : 6.15.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 6.15.0
Interface Info:
	ID               : 0x03000025
	Type             : V4L Video
Entity Info:
	ID               : 0x00000023 (35)
	Name             : c3-isp-cap2
	Function         : V4L2 I/O
	Pad 0x01000024   : 0: Sink
	  Link 0x02000037: from remote pad 0x1000010 of entity 'c3-isp-resizer2' (Video Scaler): Data, Enabled, Immutable

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

Total for c3-isp device /dev/video2: 49, Succeeded: 49, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for c3-isp device /dev/video3:

Driver Info:
	Driver name      : c3-isp
	Card type        : AML C3 ISP
	Bus info         : platform:ff000000.isp
	Driver version   : 6.15.0
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
	Driver name      : c3-isp
	Model            : c3-isp
	Serial           : 
	Bus info         : platform:ff000000.isp
	Media version    : 6.15.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 6.15.0
Interface Info:
	ID               : 0x03000029
	Type             : V4L Video
Entity Info:
	ID               : 0x00000027 (39)
	Name             : c3-isp-stats
	Function         : V4L2 I/O
	Pad 0x01000028   : 0: Sink
	  Link 0x0200003b: from remote pad 0x1000004 of entity 'c3-isp-core' (Video Pixel Formatter): Data, Enabled

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

Total for c3-isp device /dev/video3: 49, Succeeded: 49, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for c3-isp device /dev/video4:

Driver Info:
	Driver name      : c3-isp
	Card type        : AML C3 ISP
	Bus info         : platform:ff000000.isp
	Driver version   : 6.15.0
	Capabilities     : 0x8c200000
		Metadata Output
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x0c200000
		Metadata Output
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : c3-isp
	Model            : c3-isp
	Serial           : 
	Bus info         : platform:ff000000.isp
	Media version    : 6.15.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 6.15.0
Interface Info:
	ID               : 0x0300002d
	Type             : V4L Video
Entity Info:
	ID               : 0x0000002b (43)
	Name             : c3-isp-params
	Function         : V4L2 I/O
	Pad 0x0100002c   : 0: Source
	  Link 0x0200003d: to remote pad 0x1000003 of entity 'c3-isp-core' (Video Pixel Formatter): Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video4 open: OK
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

Total for c3-isp device /dev/video4: 49, Succeeded: 49, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for c3-isp device /dev/v4l-subdev0:

Driver Info:
	Driver version   : 6.15.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which Media Driver Info:
	Driver name      : c3-isp
	Model            : c3-isp
	Serial           : 
	Bus info         : platform:ff000000.isp
	Media version    : 6.15.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 6.15.0
Interface Info:
	ID               : 0x03000043
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000001 (1)
	Name             : c3-isp-core
	Function         : Video Pixel Formatter
	Pad 0x01000002   : 0: Sink
	  Link 0x02000014: from remote pad 0x1000013 of entity 'c3-mipi-adapter' (Video Interface Bridge): Data, Enabled, Immutable
	Pad 0x01000003   : 1: Sink
	  Link 0x0200003d: from remote pad 0x100002c of entity 'c3-isp-params' (V4L2 I/O): Data, Enabled
	Pad 0x01000004   : 2: Source
	  Link 0x0200003b: to remote pad 0x1000028 of entity 'c3-isp-stats' (V4L2 I/O): Data, Enabled
	Pad 0x01000005   : 3: Source
	  Link 0x02000031: to remote pad 0x1000009 of entity 'c3-isp-resizer0' (Video Scaler): Data, Enabled
	Pad 0x01000006   : 4: Source
	  Link 0x02000035: to remote pad 0x100000c of entity 'c3-isp-resizer1' (Video Scaler): Data, Enabled
	Pad 0x01000007   : 5: Source
	  Link 0x02000039: to remote pad 0x100000f of entity 'c3-isp-resizer2' (Video Scaler): Data, Enabled

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

Sub-Device ioctls (Sink Pad 1):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
		fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || fmt.width > 65536
		fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
		fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || fmt.width > 65536
		fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 2):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
		fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || fmt.width > 65536
		fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
	test Try VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
		fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || fmt.width > 65536
		fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)
	test Active VIDIOC_SUBDEV_G/S_FMT: FAIL
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 3):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 4):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Try VIDIOC_SUBDEV_G/S_FMT: OK
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 5):
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

Total for c3-isp device /dev/v4l-subdev0: 89, Succeeded: 85, Failed: 4, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for c3-isp device /dev/v4l-subdev1:

Driver Info:
	Driver version   : 6.15.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which Media Driver Info:
	Driver name      : c3-isp
	Model            : c3-isp
	Serial           : 
	Bus info         : platform:ff000000.isp
	Media version    : 6.15.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 6.15.0
Interface Info:
	ID               : 0x03000045
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000008 (8)
	Name             : c3-isp-resizer0
	Function         : Video Scaler
	Pad 0x01000009   : 0: Sink
	  Link 0x02000031: from remote pad 0x1000005 of entity 'c3-isp-core' (Video Pixel Formatter): Data, Enabled
	Pad 0x0100000a   : 1: Source
	  Link 0x0200002f: to remote pad 0x100001c of entity 'c3-isp-cap0' (V4L2 I/O): Data, Enabled, Immutable

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

Total for c3-isp device /dev/v4l-subdev1: 61, Succeeded: 61, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for c3-isp device /dev/v4l-subdev2:

Driver Info:
	Driver version   : 6.15.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which Media Driver Info:
	Driver name      : c3-isp
	Model            : c3-isp
	Serial           : 
	Bus info         : platform:ff000000.isp
	Media version    : 6.15.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 6.15.0
Interface Info:
	ID               : 0x03000047
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x0000000b (11)
	Name             : c3-isp-resizer1
	Function         : Video Scaler
	Pad 0x0100000c   : 0: Sink
	  Link 0x02000035: from remote pad 0x1000006 of entity 'c3-isp-core' (Video Pixel Formatter): Data, Enabled
	Pad 0x0100000d   : 1: Source
	  Link 0x02000033: to remote pad 0x1000020 of entity 'c3-isp-cap1' (V4L2 I/O): Data, Enabled, Immutable

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

Total for c3-isp device /dev/v4l-subdev2: 61, Succeeded: 61, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for c3-isp device /dev/v4l-subdev3:

Driver Info:
	Driver version   : 6.15.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which Media Driver Info:
	Driver name      : c3-isp
	Model            : c3-isp
	Serial           : 
	Bus info         : platform:ff000000.isp
	Media version    : 6.15.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 6.15.0
Interface Info:
	ID               : 0x03000049
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x0000000e (14)
	Name             : c3-isp-resizer2
	Function         : Video Scaler
	Pad 0x0100000f   : 0: Sink
	  Link 0x02000039: from remote pad 0x1000007 of entity 'c3-isp-core' (Video Pixel Formatter): Data, Enabled
	Pad 0x01000010   : 1: Source
	  Link 0x02000037: to remote pad 0x1000024 of entity 'c3-isp-cap2' (V4L2 I/O): Data, Enabled, Immutable

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

Total for c3-isp device /dev/v4l-subdev3: 61, Succeeded: 61, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for c3-isp device /dev/v4l-subdev4:

Driver Info:
	Driver version   : 6.15.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which Media Driver Info:
	Driver name      : c3-isp
	Model            : c3-isp
	Serial           : 
	Bus info         : platform:ff000000.isp
	Media version    : 6.15.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 6.15.0
Interface Info:
	ID               : 0x0300004b
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000011 (17)
	Name             : c3-mipi-adapter
	Function         : Video Interface Bridge
	Pad 0x01000012   : 0: Sink
	  Link 0x02000019: from remote pad 0x1000018 of entity 'c3-mipi-csi2' (Video Interface Bridge): Data, Enabled, Immutable
	Pad 0x01000013   : 1: Source
	  Link 0x02000014: to remote pad 0x1000002 of entity 'c3-isp-core' (Video Pixel Formatter): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev4 open: OK
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

Total for c3-isp device /dev/v4l-subdev4: 61, Succeeded: 61, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for c3-isp device /dev/v4l-subdev5:

Driver Info:
	Driver version   : 6.15.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which Media Driver Info:
	Driver name      : c3-isp
	Model            : c3-isp
	Serial           : 
	Bus info         : platform:ff000000.isp
	Media version    : 6.15.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 6.15.0
Interface Info:
	ID               : 0x0300004d
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000016 (22)
	Name             : c3-mipi-csi2
	Function         : Video Interface Bridge
	Pad 0x01000017   : 0: Sink
	  Link 0x02000041: from remote pad 0x1000040 of entity 'imx290 2-001a' (Camera Sensor): Data, Enabled, Immutable
	Pad 0x01000018   : 1: Source
	  Link 0x02000019: to remote pad 0x1000012 of entity 'c3-mipi-adapter' (Video Interface Bridge): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev5 open: OK
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

Total for c3-isp device /dev/v4l-subdev5: 61, Succeeded: 61, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for c3-isp device /dev/v4l-subdev6:

Driver Info:
	Driver version   : 6.15.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which Media Driver Info:
	Driver name      : c3-isp
	Model            : c3-isp
	Serial           : 
	Bus info         : platform:ff000000.isp
	Media version    : 6.15.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 6.15.0
Interface Info:
	ID               : 0x0300004f
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x0000003f (63)
	Name             : imx290 2-001a
	Function         : Camera Sensor
	Pad 0x01000040   : 0: Source
	  Link 0x02000041: to remote pad 0x1000017 of entity 'c3-mipi-csi2' (Video Interface Bridge): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev6 open: OK
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
		warn: v4l2-test-subdevs.cpp(566): VIDIOC_SUBDEV_G_SELECTION is supported for target 0 but not VIDIOC_SUBDEV_S_SELECTION
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
	test Active VIDIOC_SUBDEV_G/S_FMT: OK
		warn: v4l2-test-subdevs.cpp(566): VIDIOC_SUBDEV_G_SELECTION is supported for target 0 but not VIDIOC_SUBDEV_S_SELECTION
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 12 Private Controls: 0

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

Total for c3-isp device /dev/v4l-subdev6: 54, Succeeded: 54, Failed: 0, Warnings: 2

Grand Total for c3-isp device /dev/media0: 701, Succeeded: 697, Failed: 4, Warnings: 2

To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: kieran.bingham@ideasonboard.com
Cc: laurent.pinchart@ideasonboard.com
Cc: dan.scally@ideasonboard.com
Cc: jacopo.mondi@ideasonboard.com
Signed-off-by: Keke Li <keke.li@amlogic.com>

---
Keke Li (10):
      dt-bindings: media: Add amlogic,c3-mipi-csi2.yaml
      media: platform: Add C3 MIPI CSI-2 driver
      dt-bindings: media: Add amlogic,c3-mipi-adapter.yaml
      media: platform: Add C3 MIPI adapter driver
      dt-bindings: media: Add amlogic,c3-isp.yaml
      media: Add C3ISP_PARAMS and C3ISP_STATS meta formats
      media: uapi: Add stats info and parameters buffer for C3 ISP
      media: platform: Add C3 ISP driver
      Documentation: media: add documentation file metafmt-c3-isp.rst
      Documentation: media: add documentation file c3-isp.rst

 Documentation/admin-guide/media/c3-isp.dot         |   26 +
 Documentation/admin-guide/media/c3-isp.rst         |  109 +++
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 .../devicetree/bindings/media/amlogic,c3-isp.yaml  |   88 ++
 .../bindings/media/amlogic,c3-mipi-adapter.yaml    |  111 +++
 .../bindings/media/amlogic,c3-mipi-csi2.yaml       |  127 +++
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../userspace-api/media/v4l/metafmt-c3-isp.rst     |   86 ++
 MAINTAINERS                                        |   25 +
 drivers/media/platform/amlogic/Kconfig             |    1 +
 drivers/media/platform/amlogic/Makefile            |    2 +
 drivers/media/platform/amlogic/c3/Kconfig          |    5 +
 drivers/media/platform/amlogic/c3/Makefile         |    5 +
 drivers/media/platform/amlogic/c3/isp/Kconfig      |   18 +
 drivers/media/platform/amlogic/c3/isp/Makefile     |   10 +
 .../media/platform/amlogic/c3/isp/c3-isp-capture.c |  806 ++++++++++++++++
 .../media/platform/amlogic/c3/isp/c3-isp-common.h  |  340 +++++++
 .../media/platform/amlogic/c3/isp/c3-isp-core.c    |  641 +++++++++++++
 drivers/media/platform/amlogic/c3/isp/c3-isp-dev.c |  421 ++++++++
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 1010 ++++++++++++++++++++
 .../media/platform/amlogic/c3/isp/c3-isp-regs.h    |  618 ++++++++++++
 .../media/platform/amlogic/c3/isp/c3-isp-resizer.c |  892 +++++++++++++++++
 .../media/platform/amlogic/c3/isp/c3-isp-stats.c   |  328 +++++++
 .../media/platform/amlogic/c3/mipi-adapter/Kconfig |   16 +
 .../platform/amlogic/c3/mipi-adapter/Makefile      |    3 +
 .../amlogic/c3/mipi-adapter/c3-mipi-adap.c         |  842 ++++++++++++++++
 .../media/platform/amlogic/c3/mipi-csi2/Kconfig    |   16 +
 .../media/platform/amlogic/c3/mipi-csi2/Makefile   |    3 +
 .../platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c   |  827 ++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 include/uapi/linux/media/amlogic/c3-isp-config.h   |  564 +++++++++++
 include/uapi/linux/videodev2.h                     |    4 +
 32 files changed, 7948 insertions(+)
---
base-commit: 01c6df60d5d4ae00cd5c1648818744838bba7763
change-id: 20240903-c3isp-7cfe70bb2583

Best regards,
-- 
Keke Li <keke.li@amlogic.com>



