Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75783186E8E
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 16:27:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731732AbgCPP1A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 11:27:00 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51237 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731483AbgCPP0n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 11:26:43 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jDrdZ-0000lA-5Z; Mon, 16 Mar 2020 16:26:41 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jDrdY-00054q-GK; Mon, 16 Mar 2020 16:26:40 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 00/18] media: allegro: fixes and new features
Date:   Mon, 16 Mar 2020 16:26:20 +0100
Message-Id: <20200316152638.19457-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This is v2 of the series containing various patches for the allegro-dvt
driver.

I fixed the various errors/warnings/checks reported by checkpatch.pl. Except
for a warning about a potential update in MAINTAINERS, which is not required,
because I am already the maintainer for that directory, and a check for
the alignment with an open parenthesis, which I ignored, because readability
gets worse if I fix it, checkpatch.pl does not report any problems anymore.

I combined the BITRATE_MODE, BITRATE and BITRATE_PEAK controls into a control
cluster, which ensures that BITRATE_PEAK is always at least BITRATE.

I fixed a build warning due to casting pointers to u64. Since I need the u64
in the messages that are passed to the firmware, I properly convert the
pointers to u64 now.

Finally, I changed the functions to retrieve buffers from the shadows lists to
return NULL if a buffer cannot be found to be able to handle errors in the
allegro_channel_finish_frame() function. I also fixed a bug, which resulted in
the last but one buffer to be marked as the last buffer, because the driver
missed a check if there are any buffers still in the source shadow list.

v4l2-compliance still produces a warning, because I implemented s_parm, but
don't support enum_frameintervals. However, once I implement
enum_frameintervals, it produces a failure, because I don't implement s_parm
on OUTPUT _and_ CAPTURE, but I am understanding, that s_parm for setting the
framerate should be only implemented on OUTPUT. I am not sure what to do with
that.

Michael

This is the v4l-compliance test result:

v4l2-compliance SHA: 0b239af2ca93726b63dfa9c64a8622644f898a25, 64 bits, 64-bit time_t

Compliance test for allegro device /dev/video3:

Driver Info:
	Driver name      : allegro
	Card type        : Allegro DVT Video Encoder
	Bus info         : platform:a0009000.video-codec
	Driver version   : 5.6.0
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
	Standard Controls: 16 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
		warn: v4l2-test-formats.cpp(1329): S_PARM is supported for buftype 2, but not for ENUM_FRAMEINTERVALS
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

Total for allegro device /dev/video3: 50, Succeeded: 50, Failed: 0, Warnings: 1

Changelog:

v1 -> v2:
- Fix checkpatch.pl errors/warnings/checks
- Use control cluster for bitrate controls
- Fix build warnings of ptr casts to u64
- Fix handling of errors on shadow lists

Michael Tretter (18):
  media: allegro: print message on mcu error
  media: allegro: fail encoding only on actual errors
  media: allegro: fix type of gop_length in channel_create message
  media: allegro: remove unknown39 field from create_channel
  media: allegro: start a GOP with an IDR frame
  media: allegro: fix calculation of CPB size
  media: allegro: fix reset if WAKEUP has not been set properly
  media: allegro: extract mcu and codec address calculation
  media: allegro: warn if response message has an unexpected size
  media: allegro: skip filler data if possible
  media: allegro: make frame rate configurable
  media: allegro: make QP configurable
  media: allegro: read bitrate mode directly from control
  media: allegro: handle dependency of bitrate and bitrate_peak
  media: allegro: verify source and destination buffer in VCU response
  media: allegro: pass buffers through firmware
  media: allegro: move mail definitions to separate file
  media: allegro: create new struct for channel parameters

 drivers/staging/media/allegro-dvt/Makefile    |   2 +-
 .../staging/media/allegro-dvt/allegro-core.c  | 905 ++++++++++--------
 .../staging/media/allegro-dvt/allegro-mail.c  |  37 +
 .../staging/media/allegro-dvt/allegro-mail.h  | 267 ++++++
 4 files changed, 824 insertions(+), 387 deletions(-)
 create mode 100644 drivers/staging/media/allegro-dvt/allegro-mail.c
 create mode 100644 drivers/staging/media/allegro-dvt/allegro-mail.h

-- 
2.20.1

