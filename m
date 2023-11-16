Return-Path: <linux-media+bounces-433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC46C7EDF18
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 12:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E8141F23F07
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 11:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A8E2D7A9;
	Thu, 16 Nov 2023 11:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WP+Dwy7/"
X-Original-To: linux-media@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8137185;
	Thu, 16 Nov 2023 03:04:45 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41DAE240003;
	Thu, 16 Nov 2023 11:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700132684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wRYDFN7LQPSgDuJub9iN8vSh9Owhba100B3Esv1HkRY=;
	b=WP+Dwy7/01e6/1st6HlcpzS2jlUpo2z+Q1ikCC5iFBv2ISVtPt7I1Ia6w1N0xIWpeNaacg
	u9nFmy3cQ6qee/EsJ5snVnRPA0Bys6absVyYJEM0TSQR/NPfkpoPE0YdYsfvxT6lbnJ91y
	H+X/LMjQTwgvYs9ko6CVqwxFPMW04HRQP32kFDYz3P/8BwqMatGj4zbQ/p3d80mYqBUeNK
	x8YPhGA7r9dhqVrBrYf3VDniAU5uqklTFP4nQR3LgX3wUQv1F3eAhlxDExMuy/V0BUN7Gu
	XuRIsXMKVReBM++Mq13CxkBn0D1Or4qNg2c7GilsXBp1ka/vkmorX0juFBCGvQ==
From: Mehdi Djait <mehdi.djait@bootlin.com>
To: mchehab@kernel.org,
	heiko@sntech.de,
	hverkuil-cisco@xs4all.nl,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	alexandre.belloni@bootlin.com,
	maxime.chevallier@bootlin.com,
	paul.kocialkowski@bootlin.com,
	michael.riesch@wolfvision.net,
	Mehdi Djait <mehdi.djait@bootlin.com>
Subject: [PATCH v11 0/3] media: rockchip: Add a driver for Rockchip's camera interface
Date: Thu, 16 Nov 2023 12:04:37 +0100
Message-ID: <cover.1700132457.git.mehdi.djait@bootlin.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: mehdi.djait@bootlin.com

Hello everyone,

V11 for basic support of the Camera Interface found on the Rockchip PX30 SoC

Most of this driver was written following the BSP driver from rockchip,
removing the parts that either didn't fit correctly the guidelines, or
that couldn't be tested.

In the BSP, this driver is known as the "cif" driver, but this
controller was renamed to "vip" in the datasheet.

This version of the driver supports ONLY the parallel interface BT656
and was tested/implemented using an SDTV video decoder.

media_tree, base-commit: 3e238417254bfdcc23fe207780b59cbb08656762

V10 => V11:
cif/capture.c cif/dev.c cif/common.h cif/capture.h:
- removed the csi_fmt_val and all the CSI reg defines
- removed the setting of buffer numbers in the queue_setup vb2_ops
  callback
- changed the v4l2_fwnode_endpoint declaration to V4L2_MBUS_UNKNOWN:
  letting the device tree decide which bus is being used
- split dev.h into common.h and capture.h

rockchip,px30-vip.yaml:
- renamed rockchip,rk3066-cif.yaml back to rockchip,px30-vip.yaml as
  suggested by Conor
- added the description of the port's endpoint bus-type property
- extended the example to include the definition of the corresponding
  video-decoder

V9 => V10:
cif/capture.c cif/dev.c cif/dev.h:
as suggested by Paul:
- ensured that the lock is still being held when accessing
  stream->buffs[0,1]
- adjusted the comment explaining why the spinlock is used

as suggested by Michael:
- made the IRQ requested SHARED: the cif shares the IRQ with the io_mmu

rockchip,rk3066-cif.yaml:
- dropped the rk3066-cif compatible but kept the name and added the
  reason for this in the commit msg: the name of the file rk3066 is the first
  Rockchip SoC generation that uses cif instead of the px30 which is just one
  of the many iterations of the unit.

V8 => V9:
cif/capture.c cif/dev.c cif/dev.h:
as suggested by Paul:
- changed the name from "vip" back to "cif"
- removed the scratch buffer and added frame dropping
- removed mplane, only single plane formats are supported anyway
- adjusted the Kconfig
- added the match_data to the stream struct
- some cosmetics, and error return codes changes

as suggested by Michael:
- changed the writel and readl helpers to be inline functions and
  changed the name
- fixed typos in the commit message
- changed the cif_device struct element "sensor" to "remote"

rockchip,rk3066-cif.yaml:
- changed the compatible rockchip,px30-vip to rockchip,rk3066-cif:
  rk3066 is the earliest Rockchip SoC that uses cif and it is the
  first model starting the RK30 lineup.
- changed the node name to video-capture
- adjusted the description

V7 => V8:
vip/capture.c:
- fixed a warning: unused variable reported by the kernel test robot

V6 => V7:
vip/capture.c vip/dev.c vip/dev.h
- renamed all struct rk_vip_dev dev => struct rk_vip_dev vip_dev
- added some error when rk_vip_get_buffer() returns NULL
- removed a WARN_ON
- made the irq NOT shared
- dropped of_match_ptr
- added the rk_vip_get_resource() function

rockchip,px30-vip.yaml:
- changed filename to match the compatible
- dropped the mention of the other rockchip SoC in the dt-binding
  description and added a more detailed description of VIP
- removed unused labels in the example

V5[1] => V6:
vip/capture.c vip/dev.c vip/dev.h
- added a video g_input_status subdev call, V4L2_IN_CAP_STD and the
  supported stds in rk_vip_enum_input callback
- added rk_vip_g_std, rk_vip_s_std and rk_vip_querystd callbacks
- added the supported video_device->tvnorms
- s_std will now update the format as this depends on the standard
  NTSC/PAL (as suggested by Hans in [1])
- removed STD_ATSC
- moved the colorimetry information to come from the subdev
- removed the core s_power subdev calls
- dropped cropping in rk_vip_stream struct

rockchip-vip.yaml:
- fixed a mistake in the name of third clock plckin -> plck
- changed the reg maxItems 2 -> 1

[1] https://lore.kernel.org/linux-media/20201229161724.511102-1-maxime.chevallier@bootlin.com/

I used v4l-utils with HEAD: commit 3d6682746de535d1f7aa71b43a30af40d52a539c

# v4l2-compliance 
v4l2-compliance 1.25.0, 64 bits, 64-bit time_t

Compliance test for rockchip-cif device /dev/video0:

Driver Info:
        Driver name      : rockchip-cif
        Card type        : rockchip-cif
        Bus info         : platform:ff490000.video-capture
        Driver version   : 6.6.0
        Capabilities     : 0x84200001
                Video Capture
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04200001
                Video Capture
                Streaming
                Extended Pix Format
Media Driver Info:
        Driver name      : rockchip-cif
        Model            : cif
        Serial           : 
        Bus info         : platform:ff490000.video-capture
        Media version    : 6.6.0
        Hardware revision: 0x00000000 (0)
        Driver version   : 6.6.0
Interface Info:
        ID               : 0x03000003
        Type             : V4L Video
Entity Info:
        ID               : 0x00000001 (1)
        Name             : rockchip_cif
        Function         : V4L2 I/O
        Pad 0x01000002   : 0: Sink
          Link 0x02000009: from remote pad 0x1000006 of entity 'tw9900 2-0044' (Digital Video Decoder): Data, Enabled

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
        test VIDIOC_ENUM/G/S/QUERY_STD: OK
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
        test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Total for rockchip-cif device /dev/video0: 46, Succeeded: 46, Failed: 0, Warnings: 0

Mehdi Djait (3):
  media: dt-bindings: media: add bindings for Rockchip CIF
  media: rockchip: Add a driver for Rockchip's camera interface
  arm64: dts: rockchip: Add the camera interface

 .../bindings/media/rockchip,px30-vip.yaml     |  173 +++
 MAINTAINERS                                   |    7 +
 arch/arm64/boot/dts/rockchip/px30.dtsi        |   12 +
 drivers/media/platform/rockchip/Kconfig       |    1 +
 drivers/media/platform/rockchip/Makefile      |    1 +
 drivers/media/platform/rockchip/cif/Kconfig   |   13 +
 drivers/media/platform/rockchip/cif/Makefile  |    3 +
 drivers/media/platform/rockchip/cif/capture.c | 1120 +++++++++++++++++
 drivers/media/platform/rockchip/cif/capture.h |   21 +
 drivers/media/platform/rockchip/cif/common.h  |  129 ++
 drivers/media/platform/rockchip/cif/dev.c     |  302 +++++
 drivers/media/platform/rockchip/cif/regs.h    |  127 ++
 12 files changed, 1909 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
 create mode 100644 drivers/media/platform/rockchip/cif/Kconfig
 create mode 100644 drivers/media/platform/rockchip/cif/Makefile
 create mode 100644 drivers/media/platform/rockchip/cif/capture.c
 create mode 100644 drivers/media/platform/rockchip/cif/capture.h
 create mode 100644 drivers/media/platform/rockchip/cif/common.h
 create mode 100644 drivers/media/platform/rockchip/cif/dev.c
 create mode 100644 drivers/media/platform/rockchip/cif/regs.h

-- 
2.41.0


