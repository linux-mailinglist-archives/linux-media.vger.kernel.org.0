Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0619C2CBE58
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 14:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbgLBNbf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 08:31:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727785AbgLBNbd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 08:31:33 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41E4C0617A6
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 05:30:53 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kkSDb-0000LL-1p; Wed, 02 Dec 2020 14:30:51 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kkSDa-008CeT-66; Wed, 02 Dec 2020 14:30:50 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     kernel@pengutronix.de, robh+dt@kernel.org,
        hverkuil-cisco@xs4all.nl,
        Michael Tretter <m.tretter@pengutronix.de>
Date:   Wed,  2 Dec 2020 14:30:36 +0100
Message-Id: <20201202133040.1954837-1-m.tretter@pengutronix.de>
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
Subject: [PATCH v2 0/4] media: allegro: move driver out of staging
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

With the V4L2 stateful encoder spec being finished, the Allegro encoder driver
is ready to be moved from staging to mainline.

While not directly related, I used the opportunity to convert the dt-binding
to YAML, to remove the custom draining state handling from the driver and to
rename a badly named field in the MCU messages.

v2 fixes the reported warnings in the YAML dt-bindings.

There are no functional changes in the actual driver since v1, but I am
sending the updated v4l2-compliance result anyway.

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

Changelog:

v2:
- Fix make dt_binding_check warnings

Michael Tretter (4):
  media: allegro: move driver out of staging
  dt-bindings: media: allegro,al5e: Convert to YAML
  media: allegro: remove custom drain state handling
  media: allegro: rename stream_id to dst_handle

 .../bindings/media/allegro,al5e.yaml          | 105 ++++++++++
 .../devicetree/bindings/media/allegro.txt     |  43 -----
 MAINTAINERS                                   |   3 +-
 drivers/media/platform/Kconfig                |  15 ++
 drivers/media/platform/Makefile               |   1 +
 .../platform}/allegro-dvt/Makefile            |   0
 .../platform}/allegro-dvt/allegro-core.c      | 180 +++++-------------
 .../platform}/allegro-dvt/allegro-mail.c      |   8 +-
 .../platform}/allegro-dvt/allegro-mail.h      |   4 +-
 .../platform}/allegro-dvt/nal-h264.c          |   0
 .../platform}/allegro-dvt/nal-h264.h          |   0
 drivers/staging/media/Kconfig                 |   2 -
 drivers/staging/media/Makefile                |   1 -
 drivers/staging/media/allegro-dvt/Kconfig     |  16 --
 drivers/staging/media/allegro-dvt/TODO        |   4 -
 15 files changed, 177 insertions(+), 205 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allegro,al5e.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/allegro.txt
 rename drivers/{staging/media => media/platform}/allegro-dvt/Makefile (100%)
 rename drivers/{staging/media => media/platform}/allegro-dvt/allegro-core.c (95%)
 rename drivers/{staging/media => media/platform}/allegro-dvt/allegro-mail.c (98%)
 rename drivers/{staging/media => media/platform}/allegro-dvt/allegro-mail.h (98%)
 rename drivers/{staging/media => media/platform}/allegro-dvt/nal-h264.c (100%)
 rename drivers/{staging/media => media/platform}/allegro-dvt/nal-h264.h (100%)
 delete mode 100644 drivers/staging/media/allegro-dvt/Kconfig
 delete mode 100644 drivers/staging/media/allegro-dvt/TODO

-- 
2.20.1

