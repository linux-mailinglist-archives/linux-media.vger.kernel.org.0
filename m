Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EECF72A61BB
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 11:36:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728645AbgKDKgm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 05:36:42 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:37239 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728287AbgKDKgm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 05:36:42 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B4B092000E;
        Wed,  4 Nov 2020 10:36:36 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dafna.hirschfeld@collabora.com,
        dave.stevenson@raspberrypi.org, naush@raspberrypi.com,
        erosca@de.adit-jv.com
Subject: [PATCH v2 00/30] media: ov5647: Support RaspberryPi Camera Module v1
Date:   Wed,  4 Nov 2020 11:35:52 +0100
Message-Id: <20201104103622.595908-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,
   this second iteration of the series introduces a new feature and
addresses comments received on v1 [0]
[0] https://patchwork.linuxtv.org/project/linux-media/list/?series=2765

The major chanlog items is the introduction of pm_runtime_support to
replace the deprecated s_power() operation.

Other minor changes address comments received from Dafna and Sakari:
- Rebased on most recent media master
- Constify all driver structures
- Protect against multiple s_stream() calls
- Set default format to 640x480 SBGGR10_1X10 to match s_fmt()
- Check for devm_gpiod_get_optional() return value in probe
- A few more cosmetic changes

The only remaning open point, not clarified by the v1 discussion is:
- Should sensor driver handle read-only controls ?

Tested on RPi capturing RGGB10 in all resolutions with yavta.

v1 was tested by Dafna on rockpi:
Tested-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
(should I apply this to all patches ? What's the correct procedure ?)

RGGB8 seems to be broken, at least when capturing on RPi using mainline
unicam driver. I wonder if it shouldn't be removed at all. I can't test if this
is a regression as the mainline driver version fails to probe here.

v4l2-compliance report below: 1 error on event handling

-------------------------------------------------------------------------------
v4l2-compliance 1.21.0-4679, 32 bits, 32-bit time_t
v4l2-compliance SHA: 225c6c2a17be 2020-10-30 15:13:07

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
		fail: v4l2-test-controls.cpp(823): subscribe event for control 'User Controls' failed
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
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

Total for device /dev/v4l-subdev0: 41, Succeeded: 40, Failed: 1, Warnings: 0
-------------------------------------------------------------------------------

Thanks
  j

Dave Stevenson (8):
  media: ov5647: Add support for PWDN GPIO.
  media: ov5647: Add support for non-continuous clock mode
  media: ov5647: Add set_fmt and get_fmt calls.
  media: ov5647: Add support for get_selection()
  media: ov5647: Set V4L2_SUBDEV_FL_HAS_EVENTS flag
  media: ov5647: Support V4L2_CID_PIXEL_RATE
  media: ov5647: Support V4L2_CID_VBLANK control
  media: ov5647: Advertise the correct exposure range

David Plowman (1):
  media: ov5647: Support gain, exposure and AWB controls

Jacopo Mondi (21):
  dt-bindings: media: i2c: Rename ov5647.yaml
  media: ov5647: Fix format initialization
  media: ov5647: Fix style issues
  media: ov5647: Replace license with SPDX identifier
  media: ov5647: Fix return value from read/write
  media: ov5647: Program mode at s_stream(1) time
  media: ov5647: Implement enum_frame_size()
  media: ov5647: Protect s_stream() with mutex
  media: ov5647: Rationalize driver structure name
  media: ov5647: Break out format handling
  media: ov5647: Rename SBGGR8 VGA mode
  media: ov5647: Add SGGBR10_1X10 modes
  media: ov5647: Use SBGGR10_1X10 640x480 as default
  media: ov5647: Implement set_fmt pad operation
  media: ov5647: Program mode only if it has changed
  media: ov5647: Support V4L2_CID_HBLANK control
  media: ov5647: Use pm_runtime infrastructure
  media: ov5647: Rework s_stream() operation
  media: ov5647: Apply controls only when powered
  media: ov5647: Constify oe_enable/disable reglist
  media: ov5647: Reflow register-value lists

 .../i2c/{ov5647.yaml => ovti,ov5647.yaml}     |    0
 MAINTAINERS                                   |    2 +-
 drivers/media/i2c/ov5647.c                    | 1237 +++++++++++++----
 3 files changed, 960 insertions(+), 279 deletions(-)
 rename Documentation/devicetree/bindings/media/i2c/{ov5647.yaml => ovti,ov5647.yaml} (100%)

--
2.29.1

