Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2A401B6AD6
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 03:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgDXBex (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 21:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725884AbgDXBew (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 21:34:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CF89C09B042
        for <linux-media@vger.kernel.org>; Thu, 23 Apr 2020 18:34:52 -0700 (PDT)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA55F4F7;
        Fri, 24 Apr 2020 03:34:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1587692090;
        bh=2QFxJUbXrNIxbuixyadq7wOapYZJm6mr/wphrimJXEQ=;
        h=From:To:Cc:Subject:Date:From;
        b=H4Nayp0CHQVhJAfELUWiL1BFiGvgLwnSWynJORwAtOe8H4b97SQHrw0Qbavo5TFQ3
         yhAW78C+PtO+QrEHHN00r9um3MoplbpiGqg4NYCYFp89ncVUA3iBul5ZbETIkZTBr0
         qM2YL/1A6hhZjgsFyjKDgZaBPVQaQMxVDnx6FjFU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Naushir Patuck <naush@raspberrypi.com>
Subject: [PATCH 0/5] Driver for the BCM283x CSI-2/CCP2 receiver
Date:   Fri, 24 Apr 2020 04:34:14 +0300
Message-Id: <20200424013419.12954-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series adds a driver for the CSI-2/CCP2 receiver found in the
Broadcom BCM283x and compatible SoCs. The IP core is known as Unicam.
The most well known platforms representative of these SoCs are the
Raspberry Pi.

A driver already exists in drivers/staging/vc04_services/bcm2835-camera/
to support cameras on Raspberry Pi platforms. The driver relies on the
firmware running on the VC4 VPU to control the camera, and is thus
limited to the camera sensors supported in the firmware. This driver, on
the other hand, doesn't rely on the firmware and controls the Unicam
hardware directly. It is limited to the CSI-2/CCP2 receiver, but
supports any camera sensor compatible with those interfaces.

Patch 1/5 enables event reporting in the IMX219 driver to fix a V4L2
compliance failure. Patches 2/5 and 3/5 add new a pixel format and media
bus code for sensor embedded data. Patch 4/5 then adds DT bindings for
the driver, and patch 5/5 adds the driver itself.

The driver supports capturing both image data and embedded data. Support
of embedded data is currently implemented through two sink pads,
requiring two source pads on the sensor driver side. Work is ongoing to
try and replace this with usage of a multiplexed streams API.

The code is based on top v5.7-rc2 with Jacopo's "[PATCH v4 0/5] media:
Register read-only sub-dev devnode" series applied.

Here's the v4l2-compliance report, run on the Raspberry Pi 4 with an
IMX219 sensor (Raspberry Pi Camera V2).

$ ./utils/v4l2-compliance/v4l2-compliance -m /dev/media0
v4l2-compliance SHA: 2984938795a23e4bdf5a4b75c12a4245a2e0daff, 32 bits, 32-bit time_t

Compliance test for unicam device /dev/media0:

Media Driver Info:
        Driver name      : unicam
        Model            : unicam
        Serial           :
        Bus info         : platform:fe801000.csi
        Media version    : 5.7.0
        Hardware revision: 0x00000000 (0)
        Driver version   : 5.7.0

Required ioctls:
        test MEDIA_IOC_DEVICE_INFO: OK

Allow for multiple opens:
        test second /dev/media0 open: OK
        test MEDIA_IOC_DEVICE_INFO: OK
        test for unlimited opens: OK

Media Controller ioctls:
        test MEDIA_IOC_G_TOPOLOGY: OK
        Entities: 3 Interfaces: 3 Pads: 3 Links: 4
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
        Driver version   : 5.7.0
        Capabilities     : 0x84a00001
                Video Capture
                Metadata Capture
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04200001
                Video Capture
                Streaming
                Extended Pix Format
Media Driver Info:
        Driver name      : unicam
        Model            : unicam
        Serial           :
        Bus info         : platform:fe801000.csi
        Media version    : 5.7.0
        Hardware revision: 0x00000000 (0)
        Driver version   : 5.7.0
Interface Info:
        ID               : 0x03000005
        Type             : V4L Video
Entity Info:
        ID               : 0x00000003 (3)
        Name             : unicam-image
        Function         : V4L2 I/O
        Flags         : default
        Pad 0x01000004   : 0: Sink
          Link 0x02000007: from remote pad 0x1000002 of entity 'imx219 0-0010': Data, Enabled, Immutable

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
        Standard Controls: 16 Private Controls: 0

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

Total for unicam device /dev/video0: 46, Succeeded: 46, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for unicam device /dev/video1:

Driver Info:
        Driver name      : unicam
        Card type        : unicam
        Bus info         : platform:fe801000.csi
        Driver version   : 5.7.0
        Capabilities     : 0x84a00001
                Video Capture
                Metadata Capture
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04a00000
                Metadata Capture
                Streaming
                Extended Pix Format
Media Driver Info:
        Driver name      : unicam
        Model            : unicam
        Serial           :
        Bus info         : platform:fe801000.csi
        Media version    : 5.7.0
        Hardware revision: 0x00000000 (0)
        Driver version   : 5.7.0
Interface Info:
        ID               : 0x0300000b
        Type             : V4L Video
Entity Info:
        ID               : 0x00000009 (9)
        Name             : unicam-embedded
        Function         : V4L2 I/O
        Pad 0x0100000a   : 0: Sink

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
        test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
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

Total for unicam device /dev/video1: 46, Succeeded: 46, Failed: 0, Warnings: 0
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
        Standard Controls: 16 Private Controls: 0

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

Grand Total for unicam device /dev/media0: 141, Succeeded: 141, Failed: 0, Warnings: 0

Dave Stevenson (1):
  dt-bindings: media: Document BCM283x CSI2/CCP2 receiver

Laurent Pinchart (1):
  media: i2c: imx219: Set V4L2_SUBDEV_FL_HAS_EVENTS flag

Naushir Patuck (3):
  media: uapi: v4l2-core: Add sensor ancillary data V4L2 fourcc type
  media: uapi: Add MEDIA_BUS_FMT_SENSOR_DATA media bus format
  media: bcm2835-unicam: Driver for CCP2/CSI2 camera interface

 .../bindings/media/brcm,bcm2835-unicam.yaml   |  155 +
 Documentation/media/uapi/v4l/meta-formats.rst |    1 +
 .../uapi/v4l/pixfmt-meta-sensor-data.rst      |   32 +
 .../media/uapi/v4l/subdev-formats.rst         |   33 +
 MAINTAINERS                                   |    7 +
 drivers/media/i2c/imx219.c                    |    3 +-
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    2 +
 drivers/media/platform/bcm2835/Kconfig        |   15 +
 drivers/media/platform/bcm2835/Makefile       |    3 +
 .../media/platform/bcm2835/bcm2835-unicam.c   | 2761 +++++++++++++++++
 .../media/platform/bcm2835/vc4-regs-unicam.h  |  253 ++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 include/uapi/linux/media-bus-format.h         |    3 +
 include/uapi/linux/videodev2.h                |    1 +
 15 files changed, 3270 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-meta-sensor-data.rst
 create mode 100644 drivers/media/platform/bcm2835/Kconfig
 create mode 100644 drivers/media/platform/bcm2835/Makefile
 create mode 100644 drivers/media/platform/bcm2835/bcm2835-unicam.c
 create mode 100644 drivers/media/platform/bcm2835/vc4-regs-unicam.h

-- 
Regards,

Laurent Pinchart

