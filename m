Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC311FCCB8
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 13:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgFQLp5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 07:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgFQLpz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 07:45:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4345EC061755
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2020 04:45:55 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jlWVt-0002WQ-7H; Wed, 17 Jun 2020 13:45:53 +0200
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jlWVs-0000r7-AG; Wed, 17 Jun 2020 13:45:52 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 00/12] media: allegro: Add support for firmware 2019.2
Date:   Wed, 17 Jun 2020 13:45:38 +0200
Message-Id: <20200617114550.3235-1-m.tretter@pengutronix.de>
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

This series adds support for the firmware version 2019.2 to the allegro
driver.

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

Patch 1 and 2 rework how the mails are handled and how the interface to the
mailbox works to simplify adding the conversion step.

Patch 3 adds the conversion of the struct mcu_msg_* to mailbox binary format.

Patches 4 to 11 update the now independent struct mcu_msg_* to prepare the
conversion into the binary format expected by the firmware 2019.2.

Patch 12 finally adds support for firmware 2019.2 by adding the conversion
step for the new message format.

Support for the firmware 2020.1 can be added by a patch similar to Patch 13,
but I did not properly test firmware 2020.1, yet.

Based on this series, I am also preparing a series to add H.265 support.
Further, another series will cleanup the messages in allegro-mail.h by removing
reserved fields and clarifying existing field names.

The v4l2-compliance result is as follows. I decided to not fix the warning
regarding S_PARM in this series, because I want to fix it in yet another
series that adds framerate handling with different framerates on OUTPUT and
CAPTURE.

v4l2-compliance SHA: de91e870c2355e0fe754176563660b92b8ee040b, 64 bits, 64-bit time_t

Compliance test for allegro device /dev/video0:

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
	test second /dev/video0 open: OK
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
		warn: v4l2-test-formats.cpp(1332): S_PARM is supported for buftype 2, but not for ENUM_FRAMEINTERVALS
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

Total for allegro device /dev/video0: 50, Succeeded: 50, Failed: 0, Warnings: 1

Michael

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

 .../staging/media/allegro-dvt/allegro-core.c  | 387 ++++++++------
 .../staging/media/allegro-dvt/allegro-mail.c  | 506 ++++++++++++++++++
 .../staging/media/allegro-dvt/allegro-mail.h  | 111 ++--
 3 files changed, 803 insertions(+), 201 deletions(-)

-- 
2.20.1

