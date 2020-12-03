Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ECBC2CD42D
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 12:03:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729055AbgLCLDc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 06:03:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728779AbgLCLDc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 06:03:32 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE0BC061A4F
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 03:02:51 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kkmNs-0002Kn-On; Thu, 03 Dec 2020 12:02:50 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kkmNr-00CKhT-MC; Thu, 03 Dec 2020 12:02:47 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Dec 2020 12:00:48 +0100
Message-Id: <20201203110106.2939463-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
        metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
        version=3.4.2
Subject: [PATCH 00/18] media: allegro: add HEVC support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

The Allegro DVT video encoder IP core supports HEVC/H.265 and H.264. This
series adds the HEVC encoding support to the allegro driver.

Patches 1 - 3 add the VPS/SPS/PPS generator that is necessary, because
although being a stateful encoder, the encoder firmware does not produce these
non-VCL NALs. The generator is implemented in the same way as it has been
implemented for H.264 and both share the code to encode bits into RBSP.

Patches 4 - 12 restructure the driver to make it easier to change encoding
parameters on format changes. Patch 7 is special and fixes a bug in the
parameters that are used to configure the encoder channel. It became apparent
when synchronizing the values in the channel configuration with the SPS and,
thus, is included here.

Patches 13 - 15 add helpers for getting codec-specific values in a common
function if the messages to the firmware have only single field for both
codecs.

Patch 16 increases the reserved space at the beginning of the CAPTURE buffers.
The previously reserved space was not sufficient for the HEVC VPS/SPS/PPS
anymore.

Patch 17 adds the deactivation the H.264 specific controls if the coded format
is not H.264.

Patch 18 finally adds the format and controls for HEVC encoding and the code
to configure the encoder accordingly.

The series is based on the series that moved the driver out of staging:

https://lore.kernel.org/linux-media/20201202133040.1954837-1-m.tretter@pengutronix.de/

The v4l2-compliance result is attached.

Michael

v4l2-compliance 1.21.0-4683, 64 bits, 64-bit time_t
v4l2-compliance SHA: 0aee9991e0c0 2020-12-01 09:48:02

Compliance test for allegro device /dev/video3:

Driver Info:
	Driver name      : allegro
	Card type        : Allegro DVT Video Encoder
	Bus info         : platform:a0009000.video-codec
	Driver version   : 5.10.0
	Capabilities     : 0x84208000
		Video Memory-to-Memory
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04208000
		Video Memory-to-Memory
		Streaming
		Extended Pix Format
	Detected Stateful Encoder

Required ioctls:
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video3 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

	test invalid ioctls: OK
Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK
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
	Standard Controls: 24 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test blocking wait: OK
	Video Capture: Captured 60 buffers
	test MMAP (select): OK
	Video Capture: Captured 60 buffers
	test MMAP (epoll): OK
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for allegro device /dev/video3: 50, Succeeded: 50, Failed: 0, Warnings: 0

Michael Tretter (18):
  media: allegro: extract RBSP handler from H.264 NAL generator
  media: allegro: add helper to report unsupported fields
  media: allegro: add HEVC NAL unit generator
  media: allegro: implement S_FMT for CAPTURE
  media: allegro: adjust channel after format change
  media: allegro: move encoding options to channel
  media: allegro: fix log2_max_poc in firmware 2019.1
  media: allegro: use handler_setup to configure channel
  media: allegro: initialize bitrate using v4l2_ctrl
  media: allegro: implement scaling of cpb size in SPS
  media: allegro: remove cpb_size and gop_size from channel
  media: allegro: remove profile and level from channel
  media: allegro: use accessor functions for QP values
  media: allegro: add helper to get entropy mode
  media: allegro: rename codec specific functions
  media: allegro: increase offset in CAPTURE buffer
  media: allegro: activate v4l2-ctrls only for current codec
  media: allegro: add support for HEVC encoding

 drivers/media/platform/allegro-dvt/Makefile   |   3 +-
 .../media/platform/allegro-dvt/allegro-core.c | 810 +++++++++++++++--
 .../media/platform/allegro-dvt/allegro-mail.c |  13 +-
 .../media/platform/allegro-dvt/allegro-mail.h |   1 +
 drivers/media/platform/allegro-dvt/nal-h264.c | 336 +------
 drivers/media/platform/allegro-dvt/nal-hevc.c | 824 ++++++++++++++++++
 drivers/media/platform/allegro-dvt/nal-hevc.h | 350 ++++++++
 drivers/media/platform/allegro-dvt/nal-rbsp.c | 310 +++++++
 drivers/media/platform/allegro-dvt/nal-rbsp.h |  61 ++
 9 files changed, 2283 insertions(+), 425 deletions(-)
 create mode 100644 drivers/media/platform/allegro-dvt/nal-hevc.c
 create mode 100644 drivers/media/platform/allegro-dvt/nal-hevc.h
 create mode 100644 drivers/media/platform/allegro-dvt/nal-rbsp.c
 create mode 100644 drivers/media/platform/allegro-dvt/nal-rbsp.h

-- 
2.20.1

