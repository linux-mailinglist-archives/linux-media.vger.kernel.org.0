Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 291072C764
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 15:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727372AbfE1NJ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 09:09:27 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:60637 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbfE1NJZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 09:09:25 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1hVbr1-0005rz-QK; Tue, 28 May 2019 15:09:23 +0200
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.89)
        (envelope-from <mtr@pengutronix.de>)
        id 1hVbr1-0001As-1h; Tue, 28 May 2019 15:09:23 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org,
        tfiga@chromium.org, dshah@xilinx.com, hverkuil@xs4all.nl,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v7 0/5] Add ZynqMP VCU/Allegro DVT H.264 encoder driver
Date:   Tue, 28 May 2019 15:09:15 +0200
Message-Id: <20190528130920.4450-1-m.tretter@pengutronix.de>
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

This is v7 of the Allegro DVT H.264 encoder driver found in the EV
family of the Xilinx ZynqMP platform.

I moved the driver back to staging, because the v4l2 stateful encoder spec is
not finished, yet. Once the spec is finished, this driver shall be tested
against the final v4l2-compliance and moved to mainline again.

Further, I converted the allegro vendor prefix to the new json format in
vendor-prefixes.yaml.

The observed occasional failures in v4l2-compliance in v6 of this series
turned out to be caused by a race condition with v4l2_m2m_poll(). I will send
patches to fix this issue as a separate series.

This is the v4l2-compliance test result using the vicodec branch:

v4l2-compliance SHA: c2ad13e4b7aef9ae160303189c67a91e1775f025, 64 bits

Compliance test for allegro device /dev/video2:

Driver Info:
        Driver name      : allegro
        Card type        : Allegro DVT Video Encoder
        Bus info         : platform:a0009000.video-codec
        Driver version   : 5.2.0
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
        test second /dev/video2 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

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
        Standard Controls: 10 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK

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

Total for allegro device /dev/video2: 49, Succeeded: 49, Failed: 0, Warnings: 0

Michael

v6 -> v7:
- move driver back into staging
- convert to json format for vendor-prefixes.yaml
- remove unused allegro_state_get_name()

v5 -> v6:
- drop selection api and document visual size
- drop references to the video decoder
- fix sparse warnings regarding non-static functions
- fix return type of rbsp_read_bit

v4 -> v5:
- add patch for allegro vendor prefix
- move driver out of staging
- implement draining with CMD_STOP and CMD_START
- rewrite NAL unit RBSP generator

v3 -> v4:
- fix checkpatch and compiler warnings
- use v4l2_m2m_buf_copy_metadata to copy buffer metadata
- resolve FIXME regarding channel creation and streamon
- resolve various TODOs
- add mailbox format to firmware info
- add suballocator_size to firmware info
- use struct_size to allocate mcu_msg_push_buffers_internal
- handle *_response messages in a union
- cleanup mcu_send_msg functions
- increase maximum video resolution to 4k
- handle errors when creating a channel
- do not update ctrls after channel is created
- add documentation for nal_h264.h

v2 -> v3:
- add clocks to devicetree bindings
- fix devicetree binding according to review comments on v2
- add missing v4l2 callbacks
- drop unnecessary v4l2 callbacks
- drop debug module parameter poison_capture_buffers
- check firmware size before loading firmware
- rework error handling

v1 -> v2:
- clean up debug log levels
- fix unused variable in allegro_mbox_init
- fix uninitialized variable in allegro_mbox_write
- fix global module parameters
- fix Kconfig dependencies
- return h264 as default codec for mcu
- implement device reset as documented
- document why irq does not wait for clear
- rename ENCODE_ONE_FRM to ENCODE_FRAME
- allow error codes for mcu_channel_id
- move control handler to channel
- add fw version check
- add support for colorspaces
- enable configuration of H.264 levels
- enable configuration of frame size
- enable configuration of bit rate and CPB size
- enable configuration of GOP size
- rework response handling
- fix missing error handling in allegro_h264_write_sps

Hans Verkuil (1):
  videobuf2-v4l2: set last_buffer_dequeued in dqbuf

Michael Tretter (4):
  media: dt-bindings: media: document allegro-dvt bindings
  media: dt-bindings: media: Add vendor prefix for allegro
  [media] allegro: add Allegro DVT video IP core driver
  [media] allegro: add SPS/PPS nal unit writer

 .../devicetree/bindings/media/allegro.txt     |   43 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |    7 +
 .../media/common/videobuf2/videobuf2-v4l2.c   |   10 +-
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/allegro-dvt/Kconfig     |   16 +
 drivers/staging/media/allegro-dvt/Makefile    |    6 +
 drivers/staging/media/allegro-dvt/TODO        |    4 +
 .../staging/media/allegro-dvt/allegro-core.c  | 3032 +++++++++++++++++
 drivers/staging/media/allegro-dvt/nal-h264.c  | 1001 ++++++
 drivers/staging/media/allegro-dvt/nal-h264.h  |  208 ++
 12 files changed, 4327 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allegro.txt
 create mode 100644 drivers/staging/media/allegro-dvt/Kconfig
 create mode 100644 drivers/staging/media/allegro-dvt/Makefile
 create mode 100644 drivers/staging/media/allegro-dvt/TODO
 create mode 100644 drivers/staging/media/allegro-dvt/allegro-core.c
 create mode 100644 drivers/staging/media/allegro-dvt/nal-h264.c
 create mode 100644 drivers/staging/media/allegro-dvt/nal-h264.h

-- 
2.20.1

