Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6A0B2A306C
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 17:53:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbgKBQxU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 11:53:20 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:49301 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727225AbgKBQxT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Nov 2020 11:53:19 -0500
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id EF585200002;
        Mon,  2 Nov 2020 16:53:13 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, naush@raspberrypi.com,
        dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, niklas.soderlund@ragnatech.se,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, nsaenzjulienne@suse.de,
        mchehab+huawei@kernel.org
Subject: [PATCH v3 0/5] media: staging: Add bcm2835-unicam driver
Date:   Mon,  2 Nov 2020 17:52:53 +0100
Message-Id: <20201102165258.408049-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello, this v3 breaks out the support for bcm2835-unicam driver from:
"[PATCH v2 00/34] Drivers for the BCM283x CSI-2/CCP2 receiver and ISP"
https://lwn.net/Articles/819425/

The major changes can be summarized as:
- Rebase on most recent media master
- Move to staging
  The unicam driver links to sensor drivers with 2 pads to transport the
  sensor embedded data to a dedicated video device node. It also handles
  communications with the sub-device and format negotiation by using the kAPI
  provided by v4l2-subdev, but at the same exposes a media controller node.
  There's a lenghty discussion involving Sakari, Laurent and Dave, and not to
  block the driver upstreaming I've decided moving it to staging would make
  the current implementation acceptable.
- Bump driver version to the current rpi-5.9.y branch
- Address comments from Hans and Sakari
  - Use the dev_ logging infrastructure and replace custom printouts
  - Rework endpoint parsing and registration
  - Remove pm function wrappers
  - Add V4L2_DEVICE_CAPS to capabilities in querycap()
  - Remove some minor development leftovers and beautify debug messages
- Fix DTS warning on CSI-2 nodes:
../arch/arm/boot/dts/bcm2711.dtsi:297.22-317.5: Warning (avoid_unnecessary_addr_size): /soc/csi@7e800000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
../arch/arm/boot/dts/bcm2711.dtsi:319.22-339.5: Warning (avoid_unnecessary_addr_size): /soc/csi@7e801000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Note:

In the patches upported from the 5.9.y branch the following is included
"media: bcm2835: unicam: Set VPU min clock freq to 250Mhz."
Which requires adding a second clock provider to the csi2 nodes in the DTS.

Test:

Tested with ov5647 (Pi Camera v1) capturing 10-bit SBGGR formats.
Capturing 8-bit SBGGR seems broken. Dave/Naush did am I mistaken or was this
a known issue on sensor side ?

The usual v4l2-compliance log is below provided.
1 test fails. The reson is reported in this comment block but I can't get
what the intended behaviour should be:

/*
 * If either CROPCAP or G_CROP works, then G_SELECTION should
 * work as well.
 * If neither CROPCAP nor G_CROP work, then G_SELECTION shouldn't
 * work either.
 */

--------------------------------------------------------------------------------
v4l2-compliance 1.21.0-4679, 32 bits, 32-bit time_t
v4l2-compliance SHA: 225c6c2a17be 2020-10-30 15:13:07

Compliance test for unicam device /dev/video0:

Driver Info:
	Driver name      : unicam
	Card type        : unicam
	Bus info         : platform:fe801000.csi
	Driver version   : 5.10.0
	Capabilities     : 0x85a00001
		Video Capture
		Metadata Capture
		Read/Write
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x05200001
		Video Capture
		Read/Write
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : unicam
	Model            : unicam
	Serial           :
	Bus info         : platform:fe801000.csi
	Media version    : 5.10.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 5.10.0
Interface Info:
	ID               : 0x03000005
	Type             : V4L Video
Entity Info:
	ID               : 0x00000003 (3)
	Name             : unicam-image
	Function         : V4L2 I/O
	Flags         : default
	Pad 0x01000004   : 0: Sink
	  Link 0x02000007: from remote pad 0x1000002 of entity 'ov5647 10-0036': Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

	test invalid ioctls: OK
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
	Standard Controls: 12 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
		fail: v4l2-test-formats.cpp(1606): !doioctl(node, VIDIOC_G_SELECTION, &sel)
		fail: v4l2-test-formats.cpp(1624): testLegacyCrop(node)
	test Cropping: FAIL
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

Total for unicam device /dev/video0: 46, Succeeded: 45, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------

Dave Stevenson (1):
  dt-bindings: media: Document BCM283x CSI2/CCP2 receiver

Laurent Pinchart (1):
  ARM: dts: bcm2711: Add Unicam DT nodes

Naushir Patuck (3):
  media: uapi: v4l2-core: Add sensor ancillary data V4L2 fourcc type
  media: uapi: Add MEDIA_BUS_FMT_SENSOR_DATA media bus format
  media: bcm2835-unicam: Driver for CCP2/CSI2 camera interface

 .../bindings/media/brcm,bcm2835-unicam.yaml   |  155 +
 .../userspace-api/media/v4l/meta-formats.rst  |    1 +
 .../media/v4l/pixfmt-meta-sensor-data.rst     |   32 +
 .../media/v4l/subdev-formats.rst              |   32 +
 MAINTAINERS                                   |    7 +
 arch/arm/boot/dts/bcm2711.dtsi                |   45 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/bcm2835-unicam/Kconfig  |   21 +
 drivers/staging/media/bcm2835-unicam/Makefile |    3 +
 .../media/bcm2835-unicam/bcm2835-unicam.c     | 2800 +++++++++++++++++
 .../media/bcm2835-unicam/vc4-regs-unicam.h    |  253 ++
 include/uapi/linux/media-bus-format.h         |    3 +
 include/uapi/linux/videodev2.h                |    1 +
 15 files changed, 3357 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-meta-sensor-data.rst
 create mode 100644 drivers/staging/media/bcm2835-unicam/Kconfig
 create mode 100644 drivers/staging/media/bcm2835-unicam/Makefile
 create mode 100644 drivers/staging/media/bcm2835-unicam/bcm2835-unicam.c
 create mode 100644 drivers/staging/media/bcm2835-unicam/vc4-regs-unicam.h

--
2.29.1

