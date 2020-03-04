Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECEB7178DB0
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 10:46:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729245AbgCDJqf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Mar 2020 04:46:35 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45171 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729138AbgCDJqf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Mar 2020 04:46:35 -0500
Received: by mail-wr1-f65.google.com with SMTP id v2so1502907wrp.12
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2020 01:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1rJHZ6cV8qIVgYWrX2RtOqvJSLdzpo5KC9hRlaXj0rE=;
        b=LKnfIdgqIropC4TENJpdxj1oNwZtHiGtUu9+J+A9CcMefxRRJrpfsNXEc48WoNPvWW
         7Axysd+MKLWruQIQ0lM/cFtbG9y5PoaCKSM8cuJKfbrF8VR4vAXKdlHC7fa/kLLVm105
         uXHAIK9IHWEew5zN/Vhqxov8xGRx6wnfhokdFYdWzsT0xKrR+j44MbnVHZm1iXcEgEqZ
         Rh55qndTAzVM51THW1Wl4HQuW4nL56ZtaSIoiejqNV9vOh3wqqXrjD/OdtkEobPno9AX
         SOUyrp6WQAGTJoL04PgW8Mj8tgAw3JRTTX+/xGXmA7LQimd7ViYDCcSqrmJRWK2AdloK
         7dJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1rJHZ6cV8qIVgYWrX2RtOqvJSLdzpo5KC9hRlaXj0rE=;
        b=BbchDvorenpl9UozI7/q/RYtho5R6pg/fYKdx8AhFlCcwt7PmtaouIAdzglGurX9SS
         5DuH0+WfJ1uvkij404XjidE4X44vWlbrftXhW/iyQHY0osiXWM4MSs95x6CTLUsFAWN6
         6cVDAg+8aqlAwFjk1ZZ6zJR1FqgoVNHOVBgxWkQO7RxHhd71JvJ2UzQkCDRI1QdhoTIm
         gk6zz1zAFYqFAx1YcBBZs0t1zvCpNyl9v0vnhMIBMvPeqdTm9KSJKmvnmiRmHMedWe4S
         bx3q8GM4KMe9xGlLeDLhvr0eiSU8NCy0gZWJW3fYisi8qgRSh7f0ZzdAPi0hFV4yvoXT
         VndQ==
X-Gm-Message-State: ANhLgQ2YIOderUJrVQbbcibgvqD1P6cnRIchCt0341HD54sk8UQO4/06
        fEtOnu6Q5xhx+zKM+j5d6HI1Xg==
X-Google-Smtp-Source: ADFU+vv7f4YuTU+v9je/hAdhTrmSTHlzbP85pjC9jtsLTan5g2h50q/hSo8WbAL/jeh87jz6s1CvKQ==
X-Received: by 2002:adf:d4d2:: with SMTP id w18mr3429279wrk.180.1583315191953;
        Wed, 04 Mar 2020 01:46:31 -0800 (PST)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id b10sm38696107wrw.61.2020.03.04.01.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 01:46:31 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/5] media: meson: vdec: Add VP9 decoding support
Date:   Wed,  4 Mar 2020 10:46:20 +0100
Message-Id: <20200304094625.2257-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patchset aims to bring VP9 decoding support to Amlogic GXL, G12A & SM1
platforms for the amlogic stateful video decoder driver.

With this, it passes v4l2-compliance with streaming on Amlogic G12A and
Amlogic SM1 SoCs successfully using the stream at [1] with a fixed
pyv4l2compliance script for VP9 at [2].

The original script kept the IVF headers in the stream, confusing the
decoder. The fixed script only extracts the payload from the IVF container.

The decoder has been tested using the Google CTS TestVectorsIttiam VP9 yuv420
samples and the VP9 Decoder Performance streams at [5], decoding all streams from
Profile 0 and 2 up to Level 4.1, with 10bit downsampling to 8bit.

This patchset depends on :
- H.264 and compliance v7 at [4]

Changes since v6 at [10]:
- Fixes missed gcc warnings in codec_hevc_common.[ch]/esparser.c/codec_vp9.c

Changes since v5 at [9]:
- Fixed sparse warnings in codec_hevc_common.h/codec_vp9.c/vdec_hevc.c
- No smatch warnings issued

Changes since v4 at [8]:
- Fixes checkpatch warning on patches 3 & 5

Changes since v3 at [7]:
- fixes necessary spare ref buffer handling in parser
- added a comment to indicate how it's handled
- fix VP9 on SM1, was working with G12A firmware, but needed some changed with SM1 specific firmware
- pushed (gxl) and switched to missing (sm1) vp9 firmwares to linux-firmware repo

Changes since v2 at [6]:
- Rebased on H.264 and compliance at [4]

Changes since v1 at [3]:
- Fixed compliance for delta frame resize, but proper ref keeping is broken
- Added warns for delta frame resize, to be fixed in a following patchset
- Added VP9 probabilities parsing and transformation support to decore the VP9 performance streams
- Fixed refs keeping, avoid deleting necessary refs for next frame
- Properly used the kernel clamp_val() macros
- Zeroed the workspace to avoid refs handling glitches
- Add lock around the flush & stop to avoid race between IRQ and drain/stop

[1] https://github.com/superna9999/pyv4l2compliance/raw/tests/output/Jellyfish_1080_10s_5MB.vp9.hdr
[2] https://github.com/superna9999/pyv4l2compliance
[3] https://lore.kernel.org/linux-media/20191205092454.26075-1-narmstrong@baylibre.com
[4] https://lore.kernel.org/linux-media/20200303143320.32562-1-narmstrong@baylibre.com
[5] https://www.webmproject.org/vp9/levels/
[6] https://lore.kernel.org/linux-media/20191217111939.10387-1-narmstrong@baylibre.com
[7] https://lore.kernel.org/linux-media/20200116133437.2443-1-narmstrong@baylibre.com
[8] https://lore.kernel.org/linux-media/20200206084152.7070-1-narmstrong@baylibre.com
[9] https://lore.kernel.org/linux-media/20200219140958.23542-1-narmstrong@baylibre.com
[10] https://lore.kernel.org/linux-media/20200303143732.762-1-narmstrong@baylibre.com

The compliance log is:
# v4l2-compliance --stream-from-hdr Jellyfish_1080_10s_5MB.vp9.hdr -s 200
v4l2-compliance SHA: 7ead0e1856b89f2e19369af452bb03fd0cd16793, 64 bits

Compliance test for meson-vdec device /dev/video0:

Driver Info:
	Driver name      : meson-vdec
	Card type        : Amlogic Video Decoder
	Bus info         : platform:meson-vdec
	Driver version   : 5.5.0
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
	Standard Controls: 2 Private Controls: 0

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
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test blocking wait: OK
	Video Capture Multiplanar: Captured 198 buffers   
	test MMAP (select): OK
	Video Capture Multiplanar: Captured 198 buffers   
	test MMAP (epoll): OK
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for meson-vdec device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0

Maxime Jourdan (4):
  media: meson: vdec: add helpers for lossless framebuffer compression
    buffers
  media: meson: vdec: add common HEVC decoder support
  media: meson: vdec: add VP9 input support
  media: meson: vdec: add VP9 decoder support

Neil Armstrong (1):
  media: meson: vdec: align stride on 32 bytes

 drivers/staging/media/meson/vdec/Makefile     |    4 +-
 .../media/meson/vdec/codec_hevc_common.c      |  297 +++
 .../media/meson/vdec/codec_hevc_common.h      |   71 +
 drivers/staging/media/meson/vdec/codec_vp9.c  | 2141 +++++++++++++++++
 drivers/staging/media/meson/vdec/codec_vp9.h  |   13 +
 drivers/staging/media/meson/vdec/esparser.c   |  150 +-
 drivers/staging/media/meson/vdec/hevc_regs.h  |  218 ++
 drivers/staging/media/meson/vdec/vdec.c       |   15 +-
 .../staging/media/meson/vdec/vdec_helpers.c   |   35 +-
 .../staging/media/meson/vdec/vdec_helpers.h   |    4 +
 drivers/staging/media/meson/vdec/vdec_hevc.c  |  231 ++
 drivers/staging/media/meson/vdec/vdec_hevc.h  |   13 +
 .../staging/media/meson/vdec/vdec_platform.c  |   38 +
 13 files changed, 3217 insertions(+), 13 deletions(-)
 create mode 100644 drivers/staging/media/meson/vdec/codec_hevc_common.c
 create mode 100644 drivers/staging/media/meson/vdec/codec_hevc_common.h
 create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.c
 create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.h
 create mode 100644 drivers/staging/media/meson/vdec/hevc_regs.h
 create mode 100644 drivers/staging/media/meson/vdec/vdec_hevc.c
 create mode 100644 drivers/staging/media/meson/vdec/vdec_hevc.h

-- 
2.22.0

