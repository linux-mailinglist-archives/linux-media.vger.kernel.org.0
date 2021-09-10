Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 953C740710E
	for <lists+linux-media@lfdr.de>; Fri, 10 Sep 2021 20:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232168AbhIJSn1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Sep 2021 14:43:27 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:42477 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbhIJSn1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Sep 2021 14:43:27 -0400
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 11C7F240003;
        Fri, 10 Sep 2021 18:42:10 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Helen Koike <helen.koike@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 00/22] Allwinner A31/A83T MIPI CSI-2 Support and A31 ISP Support
Date:   Fri, 10 Sep 2021 20:41:25 +0200
Message-Id: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series introduces support for the Allwinner A31 and A83T MIPI CSI-2
controllers as well as the Allwinner A31 Image Signal Processor (ISP).
It follows v5 of the "Allwinner MIPI CSI-2 support for A31/V3s/A83T"
series, with the addition of ISP support for the V3. Since both aspect
are quite dependent due to changes to the sun6i-csi driver, they are
merged into this new series.

Aside from the ISP driver itself, the most outstanding change is a
complete rewrite of the CSI driver, for the specific reasons that are
exposed in the commit message introducing the new driver.

The commit message introducing the ISP driver should also contain useful
details regarding the implementation and outstanding specifics of the hardware.

This was tested on the V3s and A83T, using the following sensors:
- IMX219
- OV5648
- OV8856
- OV8865

v4l2-compliance seems pretty happy about the video nodes, see the detailed
reports below.

Thanks!

Changes since v5 of the MIPI CSI-2 series:
- D-PHY direction is no longer represented with a submode since this is
  not a runtime decision: no switching between the two submodes is
  possible and each instance of a controller will be dedicated to one
  direction only. Instead, a device-tree property is used.
  A separate compatible was considered, but it feels unfit since the
  direction does not describe the particular type of hardware
  implementation, but rather how it is used;
- Updated comments about channels based on latest information;
- Various cosmetic changes (and splitting) to the code;

-- Allwinner MIPI CSI-2 support for A31/V3s/A83T changelog

Changes since v4:
- Added patch to stop using v4l2_async_notifier_parse_fwnode_endpoints;
- Fixed checkpatch strict issues (parenthesis alignment);
- Fixed runtime PM call order and disable;
- Fixed fwnode_handle_put order;
- Brought back phy-names for A31 since it's mandatory according to the generic
  PHY binding and needed by the code;
- Added collected tags.

Changes since v3:
- Fixed single-item phys description in sun6i mipi csi-2 binding;
- Fixed variables names in macros using container_of;
- Fixed style issue with operators at the end of lines;
- Reworked source endpoint/subdev assignment in sun6i-csi to handle
  link_validate error case;
- Removed unrelated dt change in sun8i-a83t mipi csi-2 driver;
- Added collected tags.

Changes since v2:
- added Kconfig depend on PM since it's not optional;
- removed phy-names for A31 MIPI CSI-2 controller;
- removed v3s compatible in the A31 MIPI CSI-2 controller driver;
- removed A31 CSI controller single-port binding deprecation;
- removed empty dt port definitions;
- fixed minor checkpatch warnings;
- added collected tags;
- added media-ctl output in cover letter.

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

-- V3 media topology

Media controller API version 5.13.0

Media device information
------------------------
driver          sun6i-isp
model           Allwinner ISP Capture Device
serial          
bus info        platform:1cb8000.isp
hw revision     0x0
driver version  5.13.0

Device topology
- entity 1: sun6i-isp-proc (3 pads, 3 links)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
	pad0: Sink
		[fmt:SRGGB8_1X8/1920x1080 field:none colorspace:raw]
		<- "sun6i-csi-bridge":1 [ENABLED]
	pad1: Sink
		[fmt:SRGGB8_1X8/1920x1080 field:none colorspace:raw]
		<- "sun6i-isp-params":0 [ENABLED,IMMUTABLE]
	pad2: Source
		[fmt:SRGGB8_1X8/1920x1080 field:none colorspace:raw]
		-> "sun6i-isp-capture":0 [ENABLED,IMMUTABLE]

- entity 5: sun6i-csi-bridge (2 pads, 3 links)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev1
	pad0: Sink
		[fmt:SRGGB8_1X8/1920x1080 field:none colorspace:raw]
		<- "sun6i-mipi-csi2":1 [ENABLED]
	pad1: Source
		[fmt:SRGGB8_1X8/1920x1080 field:none colorspace:raw]
		-> "sun6i-isp-proc":0 [ENABLED]
		-> "sun6i-csi-capture":0 []

- entity 10: sun6i-mipi-csi2 (2 pads, 2 links)
             type V4L2 subdev subtype Unknown flags 0
             device node name /dev/v4l-subdev2
	pad0: Sink
		[fmt:SRGGB8_1X8/1920x1080 field:none colorspace:raw]
		<- "imx219 1-0010":0 [ENABLED,IMMUTABLE]
	pad1: Source
		[fmt:SRGGB8_1X8/1920x1080 field:none colorspace:raw]
		-> "sun6i-csi-bridge":0 [ENABLED]

- entity 13: sun6i-csi-capture (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video0
	pad0: Sink
		<- "sun6i-csi-bridge":1 []

- entity 21: sun6i-isp-capture (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video1
	pad0: Sink
		<- "sun6i-isp-proc":2 [ENABLED,IMMUTABLE]

- entity 27: sun6i-isp-params (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video2
	pad0: Source
		-> "sun6i-isp-proc":1 [ENABLED,IMMUTABLE]

- entity 33: imx219 1-0010 (1 pad, 1 link)
             type V4L2 subdev subtype Sensor flags 0
             device node name /dev/v4l-subdev3
	pad0: Source
		[fmt:SRGGB8_1X8/1920x1080 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range
		 crop.bounds:(8,8)/3280x2464
		 crop:(688,700)/1920x1080]
		-> "sun6i-mipi-csi2":0 [ENABLED,IMMUTABLE]

-- sun6i-csi-capture v4l2-compliance run

v4l2-compliance SHA: not available, 32 bits

Compliance test for sun6i-csi device /dev/video0:

Driver Info:
	Driver name      : sun6i-csi
	Card type        : sun6i-csi-capture
	Bus info         : platform:1cb0000.camera
	Driver version   : 5.13.0
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
	Driver name      : sun6i-isp
	Model            : Allwinner ISP Capture Device
	Serial           : 
	Bus info         : platform:1cb8000.isp
	Media version    : 5.13.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 5.13.0
Interface Info:
	ID               : 0x0300000f
	Type             : V4L Video
Entity Info:
	ID               : 0x0000000d (13)
	Name             : sun6i-csi-capture
	Function         : V4L2 I/O
	Pad 0x0100000e   : 0: Sink
	  Link 0x02000011: from remote pad 0x1000007 of entity 'sun6i-csi-bridge': Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
		warn: v4l2-compliance.cpp(633): media bus_info 'platform:1cb8000.isp' differs from V4L2 bus_info 'platform:1cb0000.camera'
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
		warn: v4l2-compliance.cpp(633): media bus_info 'platform:1cb8000.isp' differs from V4L2 bus_info 'platform:1cb0000.camera'
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
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 17 Private Controls: 0

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

Total for sun6i-csi device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 2

-- sun6i-isp-capture v4l2-compliance run

v4l2-compliance SHA: not available, 32 bits

Compliance test for sun6i-isp device /dev/video1:

Driver Info:
	Driver name      : sun6i-isp
	Card type        : sun6i-isp-capture
	Bus info         : platform:1cb8000.isp
	Driver version   : 5.13.0
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
	Driver name      : sun6i-isp
	Model            : Allwinner ISP Capture Device
	Serial           : 
	Bus info         : platform:1cb8000.isp
	Media version    : 5.13.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 5.13.0
Interface Info:
	ID               : 0x03000017
	Type             : V4L Video
Entity Info:
	ID               : 0x00000015 (21)
	Name             : sun6i-isp-capture
	Function         : V4L2 I/O
	Pad 0x01000016   : 0: Sink, Must Connect
	  Link 0x02000019: from remote pad 0x1000004 of entity 'sun6i-isp-proc': Data, Enabled, Immutable

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
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 17 Private Controls: 0

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

Total for sun6i-isp device /dev/video1: 45, Succeeded: 45, Failed: 0, Warnings: 0

-- sun6i-isp-params v4l2-compliance run

v4l2-compliance SHA: not available, 32 bits

Compliance test for sun6i-isp device /dev/video2:

Driver Info:
	Driver name      : sun6i-isp
	Card type        : sun6i-isp-params
	Bus info         : platform:1cb8000.isp
	Driver version   : 5.13.0
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
	Driver name      : sun6i-isp
	Model            : Allwinner ISP Capture Device
	Serial           : 
	Bus info         : platform:1cb8000.isp
	Media version    : 5.13.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 5.13.0
Interface Info:
	ID               : 0x0300001d
	Type             : V4L Video
Entity Info:
	ID               : 0x0000001b (27)
	Name             : sun6i-isp-params
	Function         : V4L2 I/O
	Pad 0x0100001c   : 0: Source, Must Connect
	  Link 0x0200001f: to remote pad 0x1000003 of entity 'sun6i-isp-proc': Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video2 open: OK
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
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 17 Private Controls: 0

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
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for sun6i-isp device /dev/video2: 45, Succeeded: 45, Failed: 0, Warnings: 0

Kévin L'hôpital (1):
  ARM: dts: sun8i: a83t: bananapi-m3: Enable MIPI CSI-2 with OV8865

Paul Kocialkowski (21):
  clk: sunxi-ng: v3s: Make the ISP PLL clock public
  ARM: dts: sun8i: v3s: Parent the CSI module clock to the ISP PLL
  dt-bindings: sun6i-a31-mipi-dphy: Add optional direction property
  phy: allwinner: phy-sun6i-mipi-dphy: Support D-PHY Rx mode for MIPI
    CSI-2
  dt-bindings: media: sun6i-a31-csi: Add MIPI CSI-2 input port
  dt-bindings: media: Add Allwinner A31 MIPI CSI-2 bindings
    documentation
  media: sunxi: Add support for the A31 MIPI CSI-2 controller
  MAINTAINERS: Add entry for the Allwinner A31 MIPI CSI-2 bridge driver
  ARM: dts: sun8i: v3s: Add nodes for MIPI CSI-2 support
  dt-bindings: media: Add Allwinner A83T MIPI CSI-2 bindings
    documentation
  media: sunxi: Add support for the A83T MIPI CSI-2 controller
  MAINTAINERS: Add entry for the Allwinner A83T MIPI CSI-2 bridge
  ARM: dts: sun8i: a83t: Add MIPI CSI-2 controller node
  media: sunxi: Remove the sun6i-csi driver implementation
  media: sunxi: Introduce a rewritten sun6i-csi driver
  dt-bindings: media: Add Allwinner A31 ISP bindings documentation
  dt-bindings: media: sun6i-a31-csi: Add ISP output port
  soc: sunxi: mbus: Add A31 ISP compatibles to the list
  staging: media: Add support for the Allwinner A31 ISP
  MAINTAINERS: Add entry for the Allwinner A31 ISP driver
  ARM: dts: sun8i: v3s: Add support for the ISP

 .../media/allwinner,sun6i-a31-csi.yaml        |   91 +-
 .../media/allwinner,sun6i-a31-isp.yaml        |  111 ++
 .../media/allwinner,sun6i-a31-mipi-csi2.yaml  |  142 +++
 .../media/allwinner,sun8i-a83t-mipi-csi2.yaml |  133 ++
 .../phy/allwinner,sun6i-a31-mipi-dphy.yaml    |   12 +
 MAINTAINERS                                   |   25 +
 arch/arm/boot/dts/sun8i-a83t-bananapi-m3.dts  |  102 ++
 arch/arm/boot/dts/sun8i-a83t.dtsi             |   26 +
 arch/arm/boot/dts/sun8i-v3s.dtsi              |  108 ++
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.h          |    1 -
 drivers/media/platform/sunxi/Kconfig          |    2 +
 drivers/media/platform/sunxi/Makefile         |    2 +
 .../media/platform/sunxi/sun6i-csi/Makefile   |    2 +-
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      | 1051 +++++-----------
 .../platform/sunxi/sun6i-csi/sun6i_csi.h      |  155 +--
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |  895 ++++++++++++++
 .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   64 +
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 1094 +++++++++++++++++
 .../sunxi/sun6i-csi/sun6i_csi_capture.h       |   73 ++
 .../platform/sunxi/sun6i-csi/sun6i_csi_reg.h  |  364 +++---
 .../platform/sunxi/sun6i-csi/sun6i_video.c    |  683 ----------
 .../platform/sunxi/sun6i-csi/sun6i_video.h    |   38 -
 .../platform/sunxi/sun6i-mipi-csi2/Kconfig    |   12 +
 .../platform/sunxi/sun6i-mipi-csi2/Makefile   |    4 +
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   |  746 +++++++++++
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   52 +
 .../sun6i-mipi-csi2/sun6i_mipi_csi2_reg.h     |   82 ++
 .../sunxi/sun8i-a83t-mipi-csi2/Kconfig        |   11 +
 .../sunxi/sun8i-a83t-mipi-csi2/Makefile       |    4 +
 .../sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c    |   72 ++
 .../sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.h    |   39 +
 .../sun8i_a83t_mipi_csi2.c                    |  812 ++++++++++++
 .../sun8i_a83t_mipi_csi2.h                    |   55 +
 .../sun8i_a83t_mipi_csi2_reg.h                |  157 +++
 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c   |  166 ++-
 drivers/soc/sunxi/sunxi_mbus.c                |    2 +
 drivers/staging/media/sunxi/Kconfig           |    1 +
 drivers/staging/media/sunxi/Makefile          |    1 +
 drivers/staging/media/sunxi/sun6i-isp/Kconfig |   13 +
 .../staging/media/sunxi/sun6i-isp/Makefile    |    4 +
 .../staging/media/sunxi/sun6i-isp/sun6i_isp.c |  577 +++++++++
 .../staging/media/sunxi/sun6i-isp/sun6i_isp.h |   86 ++
 .../media/sunxi/sun6i-isp/sun6i_isp_capture.c |  759 ++++++++++++
 .../media/sunxi/sun6i-isp/sun6i_isp_capture.h |   79 ++
 .../media/sunxi/sun6i-isp/sun6i_isp_params.c  |  571 +++++++++
 .../media/sunxi/sun6i-isp/sun6i_isp_params.h  |   53 +
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |  598 +++++++++
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.h    |   61 +
 .../media/sunxi/sun6i-isp/sun6i_isp_reg.h     |  275 +++++
 .../sunxi/sun6i-isp/uapi/sun6i-isp-config.h   |   43 +
 include/dt-bindings/clock/sun8i-v3s-ccu.h     |    1 +
 51 files changed, 8702 insertions(+), 1808 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun6i-a31-isp.yaml
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun6i-a31-mipi-csi2.yaml
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun8i-a83t-mipi-csi2.yaml
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.h
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
 create mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.h
 delete mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
 delete mode 100644 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.h
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h
 create mode 100644 drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2_reg.h
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.h
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.h
 create mode 100644 drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2_reg.h
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/Kconfig
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/Makefile
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.h
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.h
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.h
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.h
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_reg.h
 create mode 100644 drivers/staging/media/sunxi/sun6i-isp/uapi/sun6i-isp-config.h

-- 
2.32.0

