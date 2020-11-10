Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED5652ADD22
	for <lists+linux-media@lfdr.de>; Tue, 10 Nov 2020 18:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728272AbgKJRkq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Nov 2020 12:40:46 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:57855 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgKJRkq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Nov 2020 12:40:46 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 31272FF802;
        Tue, 10 Nov 2020 17:40:40 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, naush@raspberrypi.com,
        dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, niklas.soderlund@ragnatech.se,
        dafna.hirschfeld@collabora.com, hverkuil@xs4all.nl,
        sakari.ailus@iki.fi, nsaenzjulienne@suse.de,
        mchehab+huawei@kernel.org
Subject: [PATCH v4 0/5] media: staging: Add bcm2835-unicam driver
Date:   Tue, 10 Nov 2020 18:40:31 +0100
Message-Id: <20201110174036.220883-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
  new iteration following
v3: https://patchwork.linuxtv.org/project/linux-media/list/?series=3768

Major changelog:
- Use v4l2_dev.release and drop manual ref-counting as suggested by Dafna
- Address Hans' comments on queue setup and metadata format handling function
- s/MEDIA_BUS_FMT_SENSOR_DATA/MEDIA_BUS_FMT_CUSTOM_SENSOR_DATA as suggested by
  Hans and rebase on Dafna's fixed metadata format patch
- Add a TODO file to explain why the driver is in staging.
- Conditionally register the unicam-embedded video device node on the presence
  of the sensor's metadata source pad.

  The media graph, when connected to a sensor that does not report metadata
  looks like:

	Media controller API version 5.10.0

	Media device information
	------------------------
	driver          unicam
	model           unicam
	serial
	bus info        platform:fe801000.csi
	hw revision     0x0
	driver version  5.10.0

	Device topology
	- entity 1: ov5647 10-0036 (1 pad, 1 link)
		    type V4L2 subdev subtype Sensor flags 0
		    device node name /dev/v4l-subdev0
		pad0: Source
			[fmt:SBGGR10_1X10/640x480 field:none colorspace:srgb
			 crop.bounds:(16,16)/2592x1944
			 crop:(32,16)/2560x1920]
			-> "unicam-image":0 [ENABLED,IMMUTABLE]

	- entity 3: unicam-image (1 pad, 1 link)
		    type Node subtype V4L flags 1
		    device node name /dev/video0
		pad0: Sink
			<- "ov5647 10-0036":0 [ENABLED,IMMUTABLE]


  If the sensor reports an additional metadata pad:

	Media controller API version 5.10.0

	Media device information
	------------------------
	driver          unicam
	model           unicam
	serial
	bus info        platform:fe801000.csi
	hw revision     0x0
	driver version  5.10.0

	Device topology
	- entity 1: imx219 10-0010 (2 pads, 2 links)
		    type V4L2 subdev subtype Sensor flags 0
		    device node name /dev/v4l-subdev0
		pad0: Source
			[fmt:SRGGB10_1X10/3280x2464 field:none colorspace:srgb xfer:srgb ycbcr:601 quantization:full-range
			 crop:(0,0)/3280x2464]
			-> "unicam-image":0 [ENABLED,IMMUTABLE]
		pad1: Source
			[fmt:unknown/16384x1 field:none
			 crop:(0,0)/3280x2464]
			-> "unicam-embedded":0 [ENABLED,IMMUTABLE]

	- entity 4: unicam-image (1 pad, 1 link)
		    type Node subtype V4L flags 1
		    device node name /dev/video0
		pad0: Sink
			<- "imx219 10-0010":0 [ENABLED,IMMUTABLE]

	- entity 10: unicam-embedded (1 pad, 1 link)
		     type Node subtype V4L flags 0
		     device node name /dev/video1
		pad0: Sink
			<- "imx219 10-0010":1 [ENABLED,IMMUTABLE]

  Conditionally registering the metadata video node allows to simplify the
  code in the driver as well, removing the 'sensor_embedded_data' flag.

  An additional note: this version will break the libcamera pipeline handler
  which assume the unicam-embedded video device node to always be there.

  From Dave's reply to Dafna's comments I get instead that for the existing
  applications ecosystem, having the metadata node not registered if the sensor
  does not support it is not an issue.

The v4l2-compliance output is reported below, with one test failing, again
on the selection API, and again I'm not sure about the root cause. Seems like
the compliance tool complains because a list of discrete formats is reported and
the selection APIs are supported at the same time. Seems unlikely though.

-------------------------------------------------------------------------------
v4l2-compliance 1.21.0-4679, 32 bits, 32-bit time_t
v4l2-compliance SHA: 225c6c2a17be 2020-10-30 15:13:07

Compliance test for unicam device /dev/media0:

Media Driver Info:
	Driver name      : unicam
	Model            : unicam
	Serial           :
	Bus info         : platform:fe801000.csi
	Media version    : 5.10.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 5.10.0

Required ioctls:
	test MEDIA_IOC_DEVICE_INFO: OK

Allow for multiple opens:
	test second /dev/media0 open: OK
	test MEDIA_IOC_DEVICE_INFO: OK
	test for unlimited opens: OK

Media Controller ioctls:
	test MEDIA_IOC_G_TOPOLOGY: OK
	Entities: 2 Interfaces: 2 Pads: 2 Links: 3
	test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
	test MEDIA_IOC_SETUP_LINK: OK
	test invalid ioctls: OK

Total for unicam device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
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
		fail: v4l2-test-formats.cpp(1505): node->frmsizes_count[pixfmt] > 1
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

Test input 0:

Streaming ioctls:
	test read/write: OK
	test blocking wait: OK
	test MMAP (no poll): OK
	test MMAP (select): OK
	test MMAP (epoll): OK
	test USERPTR (no poll): OK (Not Supported)
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Stream using all formats:
	test MMAP for Format pBAA, Frame Size 2592x1944:
		Crop 2592x1944@16x16, Stride 3264, Field None: OK
		Crop 2592x1944@16x16, Stride 3328, Field None: OK
	test MMAP for Format pBAA, Frame Size 1920x1080:
		Crop 1928x1080@364x450, Stride 2400, Field None: OK
		Crop 1928x1080@364x450, Stride 2464, Field None: OK
	test MMAP for Format pBAA, Frame Size 1296x972:
		Crop 2592x1944@16x16, Stride 1632, Field None: OK
		Crop 2592x1944@16x16, Stride 1696, Field None: OK
	test MMAP for Format pBAA, Frame Size 640x480:
		Crop 2560x1920@32x16, Stride 800, Field None: OK
		Crop 2560x1920@32x16, Stride 864, Field None: OK
	test MMAP for Format BG10, Frame Size 2592x1944:
		Crop 2592x1944@16x16, Stride 5184, Field None: OK
		Crop 2592x1944@16x16, Stride 5248, Field None: OK
	test MMAP for Format BG10, Frame Size 1920x1080:
		Crop 1928x1080@364x450, Stride 3840, Field None: OK
		Crop 1928x1080@364x450, Stride 3904, Field None: OK
	test MMAP for Format BG10, Frame Size 1296x972:
		Crop 2592x1944@16x16, Stride 2592, Field None: OK
		Crop 2592x1944@16x16, Stride 2656, Field None: OK
	test MMAP for Format BG10, Frame Size 640x480:
		Crop 2560x1920@32x16, Stride 1280, Field None: OK
		Crop 2560x1920@32x16, Stride 1344, Field None: OK
Total for unicam device /dev/video0: 69, Succeeded: 68, Failed: 1, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for device /dev/v4l-subdev0:


Required ioctls:

Allow for multiple opens:
	test second /dev/v4l-subdev0 open: OK
	test for unlimited opens: OK

	test invalid ioctls: OK
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
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev0: 41, Succeeded: 41, Failed: 0, Warnings: 0

Grand Total for unicam device /dev/media0: 118, Succeeded: 117, Failed: 1, Warnings: 0
-------------------------------------------------------------------------------

Tested by capturing frames from RPi Camera Module v1 (ov5647) and v2 (imx219)
in 10-bit formats and 8-bit formats (imx219 only).

Image are captured in a format I cannot inspect (raw2rgbpnm and 7yuv do not
support the sensor's Bayern pattern), but I can spot shapes when converting to
a format with a different pattern permutation, so I assume data is there.

Thanks
  j

Dave Stevenson (1):
  dt-bindings: media: Document BCM283x CSI2/CCP2 receiver

Jacopo Mondi (1):
  media: bcm2835-unicam: Add TODO file

Laurent Pinchart (1):
  ARM: dts: bcm2711: Add Unicam DT nodes

Naushir Patuck (2):
  media: uapi: Add MEDIA_BUS_FMT_CUSTOM_SENSOR_DATA
  media: bcm2835-unicam: Driver for CCP2/CSI2 camera interface

 .../bindings/media/brcm,bcm2835-unicam.yaml   |  155 +
 .../userspace-api/media/v4l/meta-formats.rst  |    1 +
 .../media/v4l/pixfmt-meta-sensor-data.rst     |   24 +
 .../media/v4l/subdev-formats.rst              |   29 +
 MAINTAINERS                                   |    7 +
 arch/arm/boot/dts/bcm2711.dtsi                |   41 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/bcm2835-unicam/Kconfig  |   21 +
 drivers/staging/media/bcm2835-unicam/Makefile |    3 +
 drivers/staging/media/bcm2835-unicam/TODO     |   37 +
 .../media/bcm2835-unicam/bcm2835-unicam.c     | 2750 +++++++++++++++++
 .../media/bcm2835-unicam/vc4-regs-unicam.h    |  253 ++
 include/uapi/linux/media-bus-format.h         |    3 +
 include/uapi/linux/videodev2.h                |    1 +
 16 files changed, 3329 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-meta-sensor-data.rst
 create mode 100644 drivers/staging/media/bcm2835-unicam/Kconfig
 create mode 100644 drivers/staging/media/bcm2835-unicam/Makefile
 create mode 100644 drivers/staging/media/bcm2835-unicam/TODO
 create mode 100644 drivers/staging/media/bcm2835-unicam/bcm2835-unicam.c
 create mode 100644 drivers/staging/media/bcm2835-unicam/vc4-regs-unicam.h

--
2.29.1

