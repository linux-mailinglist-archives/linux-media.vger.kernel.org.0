Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1316298D75
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 10:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732234AbfHVIVX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 04:21:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:59858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731236AbfHVIVW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 04:21:22 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A090C2377B;
        Thu, 22 Aug 2019 08:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566462081;
        bh=uHTam0mEKXYX+BhUiU7Xe8OkKxjtuZsU/rHuDwdI1Ok=;
        h=From:To:Cc:Subject:Date:From;
        b=IVTXiigCUOV9b0dxxET8p6KebC9E8xKygWJBGkkjqEiu2dOSIaaY8gKJjSqz4qlfs
         rpzzh28or9X7sML1YaNcVMNRrTnjvVIOU5YzBt0MfAcxWmfC6xJO0zBhlo4Edmx5uT
         +i1lPDjRh0M+GcebNJwoKCRpItJl64lY3myGSlD0=
From:   Maxime Ripard <mripard@kernel.org>
To:     Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>
Subject: [PATCH v8 0/5] media: Allwinner A10 CSI support
Date:   Thu, 22 Aug 2019 10:21:11 +0200
Message-Id: <cover.85d78dd1a3b44fe4cde1b65a9b1eb3b95daea7cc.1566462064.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maxime Ripard <maxime.ripard@bootlin.com>

Hi,

Here is a series introducing the support for the A10 (and SoCs of the same
generation) CMOS Sensor Interface (called CSI, not to be confused with
MIPI-CSI, which isn't support by that IP).

That interface is pretty straightforward, but the driver has a few issues
that I wanted to bring up:

  * The only board I've been testing this with has an ov5640 sensor
    attached, which doesn't work with the upstream driver. Copying the
    Allwinner init sequence works though, and this is how it has been
    tested. Testing with a second sensor would allow to see if it's an
    issue on the CSI side or the sensor side.
  * We don't have support for the ISP at the moment, but this can be added
    eventually.

Here is the v4l2-compliance output (commit f61132e81d79 of v4l-utils)
v4l2-compliance SHA: not available, 32 bits

Compliance test for device /dev/video1:

Driver Info:
	Driver name      : sun4i_csi
	Card type        : sun4i-csi
	Bus info         : platform:1c09000.csi
	Driver version   : 5.3.0
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
	Driver name      : sun4i-csi
	Model            : Allwinner Video Capture Device
	Serial           :
	Bus info         :
	Media version    : 5.3.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 5.3.0
Interface Info:
	ID               : 0x03000008
	Type             : V4L Video
Entity Info:
	ID               : 0x00000006 (6)
	Name             : sun4i_csi
	Function         : V4L2 I/O
	Pad 0x01000007   : 0: Sink, Must Connect
	  Link 0x0200000a: from remote pad 0x1000005 of entity 'sun4i-csi-0': Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

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
	test VIDIOC_EXPBUF: OK

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test blocking wait: OK
	test MMAP: OK
	test USERPTR: OK (Not Supported)
	test DMABUF: OK (Not Supported)

Total: 49, Succeeded: 49, Failed: 0, Warnings: 0

media-ctl -p -d /dev/media1 output after boot:
Media controller API version 5.3.0

Media device information
------------------------
driver          sun4i-csi
model           Allwinner Video Capture Device
serial
bus info
hw revision     0x0
driver version  5.3.0

Device topology
- entity 1: ov5640 1-0021 (1 pad, 1 link)
            type V4L2 subdev subtype Sensor flags 0
            device node name /dev/v4l-subdev0
	pad0: Source
		[fmt:YUYV8_2X8/640x480@1/30 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range]
		-> "sun4i-csi-0":0 [ENABLED,IMMUTABLE]

- entity 3: sun4i-csi-0 (2 pads, 2 links)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev1
	pad0: Sink
		[fmt:YUYV8_2X8/640x480 field:none colorspace:raw]
		<- "ov5640 1-0021":0 [ENABLED,IMMUTABLE]
	pad1: Source
		[fmt:YUYV8_2X8/640x480 field:none colorspace:raw]
		-> "sun4i_csi":0 [ENABLED,IMMUTABLE]

- entity 6: sun4i_csi (1 pad, 1 link)
            type Node subtype V4L flags 0
            device node name /dev/video1
	pad0: Sink
		<- "sun4i-csi-0":1 [ENABLED,IMMUTABLE]

Let me know what you think,
Maxime

Changes from v7:
  - Add a comment refering to video-interfaces.txt to the binding
  - Rework the error path of registration
  - Fix 80 chars issue on a function
  - Add the 16bits width option to the dt binding
  - Remove out label in the interrupt handler and just return
  - Just compute the next buffer in buffer_flip, instead of going through
    the current buffer.
  - Fix indentation
  - Convert to v4l2_fwnode_endpoint_parse /
    v4l2_async_notifier_add_fwnode_remote_subdev

Changes from v6:
  - Add init_cfg callback on the pads
  - Use v4l2_subdev_link_validate instead of hand-rolled link validate
  - Make sun4i_csi_qops const
  - Add MODULE_DESCRIPTION, MODULE_AUTHOR and MODULE_LICENSE
  - Remove the mod clock handling from the CSI driver
  - Remove the A10 compatible fallback
  - Rework the CSI pinctrl groups
  - Add an example to the binding

Changes from v5:
  - Add link_validate/get_fmt/set_fmt/enum_mbus_code to the subdevice
  - Create a device file for the subdevice
  - Add link_validate to the video device
  - Remove the storage of both the v4l2_pix_format_mplane structure and the
    sun4i_csi_format structure, since the latter can be retrieved easily
    from the former, and this is actually needed in a single place.
  - Fix the copyright year notice

Changes from v4:
  - Created an intermediate sub-device

Changes from v3:
  - Rebased on v5.1-rc
  - Fixed the YAML binding according to Rob's review

Changes from v2:
  - Address a few minors comments on the error path, the return type of
    some functions, the type of some variables
  - Disable the device if the subdev call fails in start_streaming
  - Use __maybe_unused and SET_RUNTIME_PM_OPS for the runtime PM hooks
  - Call media_device_cleanup in the remove function
  - Add a dependency on the subdev API and the common clock framework
  - Fix the MAINTAINERS entry to point to the yaml file
  - Add the of graph bindings to the YAML schemas
  - Rebase on next

Changes from v1:
  - Make sure it's compliant with a much newer v4l2-compliance
  - Conversion of the DT bindings to a JSON schema
  - Drop the vendor properties and use a separate compatible instead
  - Fix an issue on the last frame where we would not have any buffer
    queued and would report an error by using a scratch buffer
  - Fix the warnings reported by v4l2-compliance
  - Rebase on top of 5.0-rc1
  - Added a MAINTAINERS entry
  - Switched to strscpy
  - Fixed SPDX header

Maxime Ripard (5):
  dt-bindings: media: Add Allwinner A10 CSI binding
  media: sunxi: Refactor the Makefile and Kconfig
  media: sunxi: Add A10 CSI driver
  ARM: dts: sun7i: Add CSI0 controller
  DO NOT MERGE: ARM: dts: bananapi: Add Camera support

 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml | 107 +++++++++++++++++-
 MAINTAINERS                                                          |   8 +-
 arch/arm/boot/dts/sun7i-a20-bananapi.dts                             |  87 ++++++++++++++-
 arch/arm/boot/dts/sun7i-a20.dtsi                                     |  25 ++++-
 drivers/media/platform/Kconfig                                       |   2 +-
 drivers/media/platform/Makefile                                      |   2 +-
 drivers/media/platform/sunxi/Kconfig                                 |   2 +-
 drivers/media/platform/sunxi/Makefile                                |   2 +-
 drivers/media/platform/sunxi/sun4i-csi/Kconfig                       |  11 ++-
 drivers/media/platform/sunxi/sun4i-csi/Makefile                      |   5 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c                   | 312 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h                   | 160 +++++++++++++++++++++++++-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c                   | 453 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c                  | 385 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 14 files changed, 1559 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
 create mode 100644 drivers/media/platform/sunxi/Kconfig
 create mode 100644 drivers/media/platform/sunxi/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun4i-csi/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun4i-csi/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
 create mode 100644 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
 create mode 100644 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
 create mode 100644 drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c

base-commit: 85b8819be27eab140d280bbee4f01385beb11e7d
-- 
git-series 0.9.1
