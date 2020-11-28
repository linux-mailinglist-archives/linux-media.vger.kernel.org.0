Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E01CB2C74F9
	for <lists+linux-media@lfdr.de>; Sat, 28 Nov 2020 23:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388528AbgK1Vtk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Nov 2020 16:49:40 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:49224 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729265AbgK1SZo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Nov 2020 13:25:44 -0500
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id EAF413AD537;
        Sat, 28 Nov 2020 14:29:16 +0000 (UTC)
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 8328E40005;
        Sat, 28 Nov 2020 14:28:47 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-sunxi@googlegroups.com
Cc:     Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kevin.lhopital@hotmail.com
Subject: [PATCH v2 00/19] Allwinner MIPI CSI-2 support for A31/V3s/A83T
Date:   Sat, 28 Nov 2020 15:28:20 +0100
Message-Id: <20201128142839.517949-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series introduces support for MIPI CSI-2, with the A31 controller that is
found on most SoCs (A31, V3s and probably V5) as well as the A83T-specific
controller. While the former uses the same MIPI D-PHY that is already supported
for DSI, the latter embeds its own D-PHY.

In order to distinguish the use of the D-PHY between Rx mode (for MIPI CSI-2)
and Tx mode (for MIPI DSI), a submode is introduced for D-PHY in the PHY API.
This allows adding Rx support in the A31 D-PHY driver.

A few changes and fixes are applied to the A31 CSI controller driver, in order
to support the MIPI CSI-2 use-case.

Changes since v1:
- reworked fwnode and media graph on the CSI controller end to have one port
  per interface, which solves the bus type representation issue;
- removed unused IRQ handlers in the MIPI CSI-2 bridges;
- avoided the use of devm_regmap_init_mmio_clk;
- deasserted reset before enabling clocks;
- fixed reported return code issues (ret |=, missing checks);
- applied requested cosmetic changes (backward goto, etc);
- switched over to runtime PM for the mipi csi-2 bridge drivers;
- selected PHY_SUN6I_MIPI_DPHY in Kconfig for sun6i-mipi-csi2;
- registered nodes with mipi csi-2 bridge subdevs;
- used V4L2 format info instead of switch/case for sun6i-csi bpp;
- fixed device-tree bindings as requested (useless properties, license);
- fixed mipi bridge dt instances names;
- added PHY API documentation about mode/power on order requirement;
- fixed clock error return code in d-phy code;
- fixed D-PHY mode check in d-phy code;
- added MAINTAINERS entries for the new drivers;
- added V4L2 compliance results;
- added various comments and rework commit mesages as requested.

V4L2 compliance runs are available below:

# sun6i-csi + sun6i-mipi-csi2 + ov5648

v4l2-compliance SHA: not available, 32 bits

Compliance test for sun6i-video device /dev/video0:

Driver Info:
	Driver name      : sun6i-video
	Card type        : sun6i-csi
	Bus info         : platform:camera
	Driver version   : 5.10.0
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
	Driver name      : sun6i-csi
	Model            : Allwinner Video Capture Device
	Serial           : 
	Bus info         : platform:1cb0000.camera
	Media version    : 5.10.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 5.10.0
Interface Info:
	ID               : 0x03000004
	Type             : V4L Video
Entity Info:
	ID               : 0x00000001 (1)
	Name             : sun6i-csi
	Function         : V4L2 I/O
	Pad 0x01000002   : 0: Sink
	Pad 0x01000003   : 1: Sink
	  Link 0x0200000d: from remote pad 0x1000008 of entity 'sun6i-mipi-csi2': Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
		warn: v4l2-compliance.cpp(633): media bus_info 'platform:1cb0000.camera' differs from V4L2 bus_info 'platform:camera'
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
		warn: v4l2-compliance.cpp(633): media bus_info 'platform:1cb0000.camera' differs from V4L2 bus_info 'platform:camera'
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK

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
		warn: v4l2-test-controls.cpp(92): Exposure: (max - min) % step != 0
		warn: v4l2-test-controls.cpp(92): Gain: (max - min) % step != 0
		warn: v4l2-test-controls.cpp(92): Exposure: (max - min) % step != 0
		warn: v4l2-test-controls.cpp(92): Gain: (max - min) % step != 0
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
		warn: v4l2-test-controls.cpp(368): Gain: returned control value 44 not a multiple of step
		warn: v4l2-test-controls.cpp(368): Gain: returned control value 44 not a multiple of step
		warn: v4l2-test-controls.cpp(368): Gain: returned control value 44 not a multiple of step
		warn: v4l2-test-controls.cpp(368): Gain: returned control value 44 not a multiple of step
	test VIDIOC_G/S_CTRL: OK
		warn: v4l2-test-controls.cpp(555): Gain: returned control value 44 not a multiple of step
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 15 Private Controls: 0

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
		fail: v4l2-test-buffers.cpp(755): q.export_bufs(node, q.g_type())
	test VIDIOC_EXPBUF: FAIL
	test Requests: OK (Not Supported)

Total for sun6i-video device /dev/video0: 45, Succeeded: 44, Failed: 1, Warnings: 1

# sun6i-csi + sun8i-a83t-mipi-csi2 + ov8865

v4l2-compliance SHA: not available, 32 bits

Compliance test for sun6i-video device /dev/video0:

Driver Info:
	Driver name      : sun6i-video
	Card type        : sun6i-csi
	Bus info         : platform:camera
	Driver version   : 5.10.0
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
	Driver name      : sun6i-csi
	Model            : Allwinner Video Capture Device
	Serial           : 
	Bus info         : platform:1cb0000.camera
	Media version    : 5.10.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 5.10.0
Interface Info:
	ID               : 0x03000004
	Type             : V4L Video
Entity Info:
	ID               : 0x00000001 (1)
	Name             : sun6i-csi
	Function         : V4L2 I/O
	Pad 0x01000002   : 0: Sink
	Pad 0x01000003   : 1: Sink
	  Link 0x0200000d: from remote pad 0x1000008 of entity 'sun8i-a83t-mipi-csi2': Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
		warn: v4l2-compliance.cpp(633): media bus_info 'platform:1cb0000.camera' differs from V4L2 bus_info 'platform:camera'
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
		warn: v4l2-compliance.cpp(633): media bus_info 'platform:1cb0000.camera' differs from V4L2 bus_info 'platform:camera'
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK

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
		warn: v4l2-test-controls.cpp(92): Exposure: (max - min) % step != 0
		warn: v4l2-test-controls.cpp(92): Gain: (max - min) % step != 0
		warn: v4l2-test-controls.cpp(92): Exposure: (max - min) % step != 0
		warn: v4l2-test-controls.cpp(92): Gain: (max - min) % step != 0
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 11 Private Controls: 0

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
	test Requests: OK (Not Supported)

Total for sun6i-video device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 6

Paul Kocialkowski (19):
  docs: phy: Add a part about PHY mode and submode
  phy: Distinguish between Rx and Tx for MIPI D-PHY with submodes
  phy: allwinner: phy-sun6i-mipi-dphy: Support D-PHY Rx mode for MIPI
    CSI-2
  media: sun6i-csi: Use common V4L2 format info for storage bpp
  media: sun6i-csi: Only configure the interface data width for parallel
  dt-bindings: media: sun6i-a31-csi: Add MIPI CSI-2 input port
  media: sun6i-csi: Add support for MIPI CSI-2 bridge input
  ARM: dts: sun8i: a83t: Add CSI controller ports
  ARM: dts: sunxi: h3/h5: Add CSI controller port for parallel input
  ARM: dts: sun8i: v3s: Add CSI1 controller port for parallel input
  arm64: dts: allwinner: a64: Add CSI controller port for parallel input
  dt-bindings: media: Add A31 MIPI CSI-2 bindings documentation
  media: sunxi: Add support for the A31 MIPI CSI-2 controller
  ARM: dts: sun8i: v3s: Add nodes for MIPI CSI-2 support
  MAINTAINERS: Add entry for the Allwinner A31 MIPI CSI-2 bridge
  dt-bindings: media: Add A83T MIPI CSI-2 bindings documentation
  media: sunxi: Add support for the A83T MIPI CSI-2 controller
  ARM: dts: sun8i: a83t: Add MIPI CSI-2 controller node
  MAINTAINERS: Add entry for the Allwinner A83T MIPI CSI-2 bridge

 .../media/allwinner,sun6i-a31-csi.yaml        |  86 ++-
 .../media/allwinner,sun6i-a31-mipi-csi2.yaml  | 151 ++++
 .../media/allwinner,sun8i-a83t-mipi-csi2.yaml | 147 ++++
 Documentation/driver-api/phy/phy.rst          |  18 +
 MAINTAINERS                                   |  16 +
 arch/arm/boot/dts/sun8i-a83t.dtsi             |  38 +-
 arch/arm/boot/dts/sun8i-v3s.dtsi              |  77 ++
 arch/arm/boot/dts/sunxi-h3-h5.dtsi            |   9 +
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |   9 +
 drivers/media/platform/sunxi/Kconfig          |   2 +
 drivers/media/platform/sunxi/Makefile         |   2 +
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      | 165 +++--
 .../platform/sunxi/sun6i-csi/sun6i_csi.h      |  58 +-
 .../platform/sunxi/sun6i-csi/sun6i_video.c    |  53 +-
 .../platform/sunxi/sun6i-csi/sun6i_video.h    |   7 +-
 .../platform/sunxi/sun6i-mipi-csi2/Kconfig    |  12 +
 .../platform/sunxi/sun6i-mipi-csi2/Makefile   |   4 +
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 591 ++++++++++++++++
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   | 117 ++++
 .../sunxi/sun8i-a83t-mipi-csi2/Kconfig        |  11 +
 .../sunxi/sun8i-a83t-mipi-csi2/Makefile       |   4 +
 .../sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c    |  92 +++
 .../sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.h    |  39 ++
 .../sun8i_a83t_mipi_csi2.c                    | 657 ++++++++++++++++++
 .../sun8i_a83t_mipi_csi2.h                    | 197 ++++++
 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c   | 164 ++++-
 drivers/staging/media/rkisp1/rkisp1-isp.c     |   3 +-
 include/linux/phy/phy-mipi-dphy.h             |  13 +
 28 files changed, 2620 insertions(+), 122 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun8i-a83t-mipi-csi2.yaml
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.h
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.h

-- 
2.29.2

