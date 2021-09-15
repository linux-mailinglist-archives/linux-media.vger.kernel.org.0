Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2586F40C9F7
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 18:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbhIOQZG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 12:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229465AbhIOQZG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 12:25:06 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2756AC061574;
        Wed, 15 Sep 2021 09:23:47 -0700 (PDT)
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:6886:1a1c:e30b:c0f1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1ABB31F43788;
        Wed, 15 Sep 2021 17:23:45 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE
        (V4L/DVB)),
        linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
        linux-kernel@vger.kernel.org (open list),
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com, bob.beckett@collabora.com,
        kiril.bicevski@collabora.com,
        Nas Chung <nas.chung@chipsnmedia.com>,
        lafley.kim@chipsnmedia.com, scott.woo@chipsnmedia.com,
        olivier.crete@collabora.com
Subject: [PATCH 0/6] staging: media: wave5: add wave5 codec driver
Date:   Wed, 15 Sep 2021 18:23:18 +0200
Message-Id: <20210915162324.25513-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The wave5 codec is a stateful encoder/decoder.
It is found on the JH7100 SoC.

The driver currently supports V4L2_PIX_FMT_HEVC, V4L2_PIX_FMT_H264.

This driver has so far been tested on pre-silicon FPGA and on the beta BeagleV
board which uses the StarFive JH7100 beta SoC.

Testing on FPGA shows it working fine, though the FPGA uses polled interrupts
and copied buffers between the host and it's on board RAM.

Testing on BeagleV shows buffer corruption that is currently attributed to a
known silicon issue in the SoC that makes the cache coherent interconnect not
so coherent.
This can likely be solved when the riscv non-coherent dma support lands and
provide optional v4l2 non-contiguous allocator, though it remains to be seen
whether support non-coherent use cases will be useful in real world hw.

Until we can test and resolve any issues on final silicon (due 2H 2021)
this driver should remain in staging.

We currently tested only the decoder.
Testing the encoder is currently impossible because of the BeagleV buffer problems,
That will need to be tested once we have fixed beaglev buffer problems.

v4l2-compliance:

# v4l2-compliance -d0
v4l2-compliance SHA: not available
, 64 bits, 64-bit time_t

Compliance test for vpu-dec device /dev/video0:

Driver Info:
	Driver name      : vpu-dec
	Card type        : vpu-dec
	Bus info         : platform:vpu-dec
	Driver version   : 5.14.0
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
	Detected Stateful Decoder

Required ioctls:
	test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

	test invalid ioctls: OK
Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
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
	Standard Controls: 2 Private Controls: 1

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for vpu-dec device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 0


Dafna Hirschfeld (4):
  staging: media: wave5: Add vpuapi layer
  staging: media: wave5: Add the vdi layer
  staging: media: wave5: Add the v4l2 layer
  staging: wave5: Add TODO file

Robert Beckett (2):
  dt-bindings: media: staging: wave5: add yaml devicetree bindings
  media: wave5: Add wave5 driver to maintainers file

 .../bindings/staging/media/cnm,wave.yaml      |   71 +
 MAINTAINERS                                   |    9 +
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/wave5/Kconfig           |   10 +
 drivers/staging/media/wave5/Makefile          |   10 +
 drivers/staging/media/wave5/TODO              |   42 +
 drivers/staging/media/wave5/v4l2/vpu.c        |  386 ++
 drivers/staging/media/wave5/v4l2/vpu.h        |   76 +
 drivers/staging/media/wave5/v4l2/vpu_dec.c    | 1393 +++++++
 drivers/staging/media/wave5/v4l2/vpu_dec.h    |   20 +
 drivers/staging/media/wave5/v4l2/vpu_enc.c    | 1580 +++++++
 drivers/staging/media/wave5/v4l2/vpu_enc.h    |   18 +
 drivers/staging/media/wave5/vdi/vdi.c         |  325 ++
 drivers/staging/media/wave5/vdi/vdi.h         |   79 +
 drivers/staging/media/wave5/vpuapi/vpuapi.c   | 1094 +++++
 drivers/staging/media/wave5/vpuapi/vpuapi.h   | 1176 ++++++
 .../staging/media/wave5/vpuapi/vpuconfig.h    |   81 +
 drivers/staging/media/wave5/vpuapi/vpuerror.h |  455 +++
 .../staging/media/wave5/vpuapi/wave/wave5.c   | 3626 +++++++++++++++++
 .../staging/media/wave5/vpuapi/wave/wave5.h   |   86 +
 .../media/wave5/vpuapi/wave/wave5_regdefine.h |  638 +++
 22 files changed, 11178 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/staging/media/cnm,wave.yaml
 create mode 100644 drivers/staging/media/wave5/Kconfig
 create mode 100644 drivers/staging/media/wave5/Makefile
 create mode 100644 drivers/staging/media/wave5/TODO
 create mode 100644 drivers/staging/media/wave5/v4l2/vpu.c
 create mode 100644 drivers/staging/media/wave5/v4l2/vpu.h
 create mode 100644 drivers/staging/media/wave5/v4l2/vpu_dec.c
 create mode 100644 drivers/staging/media/wave5/v4l2/vpu_dec.h
 create mode 100644 drivers/staging/media/wave5/v4l2/vpu_enc.c
 create mode 100644 drivers/staging/media/wave5/v4l2/vpu_enc.h
 create mode 100644 drivers/staging/media/wave5/vdi/vdi.c
 create mode 100644 drivers/staging/media/wave5/vdi/vdi.h
 create mode 100644 drivers/staging/media/wave5/vpuapi/vpuapi.c
 create mode 100644 drivers/staging/media/wave5/vpuapi/vpuapi.h
 create mode 100644 drivers/staging/media/wave5/vpuapi/vpuconfig.h
 create mode 100644 drivers/staging/media/wave5/vpuapi/vpuerror.h
 create mode 100644 drivers/staging/media/wave5/vpuapi/wave/wave5.c
 create mode 100644 drivers/staging/media/wave5/vpuapi/wave/wave5.h
 create mode 100644 drivers/staging/media/wave5/vpuapi/wave/wave5_regdefine.h

-- 
2.17.1

