Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEC9F21D8CA
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 16:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730049AbgGMOml (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 10:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729689AbgGMOmd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 10:42:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A790C08C5DD
        for <linux-media@vger.kernel.org>; Mon, 13 Jul 2020 07:42:33 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1juzf5-0001mN-CN; Mon, 13 Jul 2020 16:42:31 +0200
Received: from mtr by dude02.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1juzf4-0007rJ-IV; Mon, 13 Jul 2020 16:42:30 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 00/12] media: allegro: Add support for firmware 2019.2
Date:   Mon, 13 Jul 2020 16:42:17 +0200
Message-Id: <20200713144229.30057-1-m.tretter@pengutronix.de>
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

This is v2 of the series to add support for the firmware version 2019.2 to the
allegro driver.

The changes compared to v1:

- Change the return type of allegro_mbox_notify() to void. The return
  value was neither checked, nor is there anything we can do, if an error
  occurs, thus there is no need to return an error.

- Add the string.h to allegro-mail.c, which is necessary for memcpy().

Motivation of the patch series in the cover letter of v1:

The updated firmware contains updates and bugfixes. For example, VBR encoding
works much more reliable than with the firmware 2018.2. Unfortunately, I was
not able to find an actual changelog that lists the firmware changes. Even
more unfortunately, the firmware ABI is not stable across firmware versions.

Therefore, this series changes how messages for the mailbox are created.
Previously, the driver defined a struct mcu_msg_* for each message that can be
written directly into the mailbox. This approach is incompatible with support
for more than one firmware version. Now the driver converts the struct
mcu_msg_* into the binary format that is expected by the firmware. The struct
mcu_msg_* are still the same to reduce changes to the code that is used to
prepare the messages.

This separation allows to change the struct mcu_msg_* more freely, because it
is not bound to the firmware ABI anymore and allows to get rid of ugly hacks
like using the message size to determine the number of elements in the
PUSH_BUFFER_INTERMEDIATE and PUSH_BUFFER_REFERENCE message.

Updated v4l2-compliance result:

v4l2-compliance SHA: d366a4e439599450ae1a82b23a37fc8e6b38d1ab, 64 bits, 64-bit time_t

Compliance test for allegro device /dev/video3:

Driver Info:
	Driver name      : allegro
	Card type        : Allegro DVT Video Encoder
	Bus info         : platform:a0009000.video-codec
	Driver version   : 5.8.0
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

Michael

Changelog:

v1 -> v2:

- change allegro_mbox_notify() to void
- add missing string.h header

Michael Tretter (12):
  media: allegro: rework mbox handling
  media: allegro: rework read/write to mailbox
  media: allegro: add explicit mail encoding and decoding
  media: allegro: add field for number of buffers
  media: allegro: don't pack MCU messages
  media: allegro: support handling firmware dependent values
  media: allegro: encode bit fields separately
  media: allegro: add config blob for channel
  media: allegro: set num_ref_idx using response of configured channels
  media: allegro: drop length field from message header
  media: allegro: add a version field to mcu messages
  media: allegro: add support for allegro firmware 2019.2

 .../staging/media/allegro-dvt/allegro-core.c  | 383 +++++++------
 .../staging/media/allegro-dvt/allegro-mail.c  | 507 ++++++++++++++++++
 .../staging/media/allegro-dvt/allegro-mail.h  | 111 ++--
 3 files changed, 800 insertions(+), 201 deletions(-)

-- 
2.20.1

