Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53FD6164634
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2020 15:02:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbgBSOCG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Feb 2020 09:02:06 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:32806 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbgBSOCG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Feb 2020 09:02:06 -0500
Received: by mail-wm1-f66.google.com with SMTP id m10so435579wmc.0
        for <linux-media@vger.kernel.org>; Wed, 19 Feb 2020 06:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3PkCztssznJI9iVDZrOoZdc1ElAvEMwXCsPG/TQrbQ0=;
        b=JkTpZ76T6WWc9equDLMWzUDi1SXfjWLcAT/GexT/31hvj/Gg3suAI+S6+firqx7xcK
         49h2DvpSbLpSCXgXxwfJ7/DabokRNuOB7QaiDOzL9+Qttbw5ktB3DmZa5S9Zaq+wcRKU
         TcU9ty3oPJnaK/NKPQveTIJVz8PNXLPRsPOmzOmVKmiN13KX2dahE5tgnzvn0wfYyWN3
         kazFIUDNvWPMtm3bFk5g1789hJuP24xUVovUjGfoxbrmPTgM8oWYxW4tB1oJP2LQvLUn
         3LR6PNqeQEVKm13zxTkwWyRXztX9v+vK4D5c/NYXayjze4k7jxHeFy982RTlyLRJwlTb
         eDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3PkCztssznJI9iVDZrOoZdc1ElAvEMwXCsPG/TQrbQ0=;
        b=fqnzc9x4CkCC3b7EqfL/1duNRNO0WDZU7hgix6Z5VeebcLk7nq3R5NYf9EaVeP5sA2
         F1o6IqUrNUpDz5sT69UKlli12WVP1Kaq89/UuFRXrXWSRH+jSwynBjKUekVXAyS4MyJO
         6u9P9hehgKQKu3uI+D0i6oYEByidowC9IcEuVbb8oPsUVwHHJ0Uy+LpPaREoSuJe0Iop
         j/lrulJz7VDEfWCMHFVpp5iMosnogJBgXvPwqzaPh1u5HPLTYx0Gu4fYHn1PTkw0I/2A
         DvPbTHi8/d1VgnJ5M6X1NhzWQnFxeZU5/T2Mkxp2+BIpsjBdiUy/G8sKDclq4kWZdfGK
         C1Vg==
X-Gm-Message-State: APjAAAWMeV1vibtSRIITFuq1H1bcpRf4IGJjODMosn//33NlkUiVN1fv
        NZQb6xql3PL5hUmW+kBwvzYbP/nwrmaHBg==
X-Google-Smtp-Source: APXvYqyYd0M6Dp6ShLD9EySdgoIEk1+8VgX1+PV7H8RVqbVzldrCOQjouAoXJNWBJpeKaeafSbP2fg==
X-Received: by 2002:a1c:ddd6:: with SMTP id u205mr10774057wmg.151.1582120921970;
        Wed, 19 Feb 2020 06:02:01 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:4ca8:b25b:98e4:858])
        by smtp.gmail.com with ESMTPSA id j14sm3178634wrn.32.2020.02.19.06.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 06:02:01 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/4] media: meson: vdec: Add compliant H264 support
Date:   Wed, 19 Feb 2020 15:01:52 +0100
Message-Id: <20200219140156.22893-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This patch series aims to bring H.264 support as well as compliance update
to the amlogic stateful video decoder driver.

The issue in the V1 patchset at [1] is solved by patch #1 following comments
and requirements from hans. It moves the full draining & stopped state tracking
and handling from vicodec to core v4l2-mem2mem.

The vicodec changes still passes the v4l2-utils "media-test" tests, log at [5]:
[...]
vicodec media controller compliance tests

Thu Jan 16 13:00:56 UTC 2020
v4l2-compliance SHA: 7ead0e1856b89f2e19369af452bb03fd0cd16793, 64 bits
[...]
Summary:

Total for vicodec device /dev/media3: 7, Succeeded: 7, Failed: 0, Warnings: 0
Total for vicodec device /dev/video13: 51, Succeeded: 51, Failed: 0, Warnings: 0
Total for vicodec device /dev/video14: 51, Succeeded: 51, Failed: 0, Warnings: 0
Total for vicodec device /dev/video14: 51, Succeeded: 51, Failed: 0, Warnings: 0
Total for vicodec device /dev/video14: 51, Succeeded: 51, Failed: 0, Warnings: 0
Total for vicodec device /dev/video14: 51, Succeeded: 51, Failed: 0, Warnings: 0
Total for vicodec device /dev/video14: 51, Succeeded: 51, Failed: 0, Warnings: 0
Total for vicodec device /dev/video14: 51, Succeeded: 51, Failed: 0, Warnings: 0

Final Summary: 364, Succeeded: 364, Failed: 0, Warnings: 0
Thu Jan 16 13:02:59 UTC 2020

With this, it also passes vdec v4l2-compliance with H264 streaming on Amlogic G12A
and Amlogic SM1 SoCs successfully.

The compliance log is:
# v4l2-compliance --stream-from-hdr test-25fps.h264.hdr -s
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
	test second /dev/video19 open: OK
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
	Video Capture Multiplanar: Captured 60 buffers    
	test MMAP (select): OK
	Video Capture Multiplanar: Captured 60 buffers    
	test MMAP (epoll): OK
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for meson-vdec device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0

Changes since v5 at [6]:
- Changed name of v4l2_m2m_start/stop_streaming to v4l2_m2m_update_start/stop_streaming_state
- Changed name of v4l2_mark_last_buf to v4l2_update_last_buf_state
- Added comment in code to describe usage and use-case
- Added comment in header for helpers
- Updated vicodec with v4l2_m2m_start/stop_streaming renaming in patch 2
- Fixes htmldoc warnings in patch 4

Changes since v4 at [5]:
- Squashed "don't resume instantly if not streaming capture" and "fix OUTPUT buffer size configuration" fixes from maxime

Changes since v3 at [3]:
- Fixed vicodec compliance
- Fixed vdec compliance with v4l2 state management
- fixed doc errors for v4l2-mem2mem.h

Changes since v2 at [2]:
- Move full draining & stopped state tracking into core v4l2-mem2mem
- Adapt vicodec to use the core v4l2-mem2mem draining & stopped state tracking

Changes since v1 at [1]:
- fixed output_size is never used reported by hans
- rebased on G12A and SM1 patches
- added handling of qbuf after STREAMON and STOP before enought buffer queued

[1] https://lore.kernel.org/linux-media/20191007145909.29979-1-mjourdan@baylibre.com
[2] https://lore.kernel.org/linux-media/20191126093733.32404-1-narmstrong@baylibre.com
[3] https://lore.kernel.org/linux-media/20191209122028.13714-1-narmstrong@baylibre.com
[4] https://people.freedesktop.org/~narmstrong/vicodec-compliance-7ead0e1856b89f2e19369af452bb03fd0cd16793-20200116.log
[5] https://lore.kernel.org/linux-media/20200116133025.1903-1-narmstrong@baylibre.com
[6] https://lore.kernel.org/linux-media/20200206082648.25184-1-narmstrong@baylibre.com

Maxime Jourdan (2):
  media: meson: vdec: bring up to compliance
  media: meson: vdec: add H.264 decoding support

Neil Armstrong (2):
  media: v4l2-mem2mem: handle draining, stopped and next-buf-is-last
    states
  media: vicodec: use v4l2-mem2mem draining, stopped and
    next-buf-is-last states handling

 drivers/media/platform/vicodec/vicodec-core.c | 162 ++----
 drivers/media/v4l2-core/v4l2-mem2mem.c        | 221 +++++++-
 drivers/staging/media/meson/vdec/Makefile     |   2 +-
 drivers/staging/media/meson/vdec/codec_h264.c | 484 ++++++++++++++++++
 drivers/staging/media/meson/vdec/codec_h264.h |  14 +
 drivers/staging/media/meson/vdec/esparser.c   |  58 +--
 drivers/staging/media/meson/vdec/vdec.c       |  90 ++--
 drivers/staging/media/meson/vdec/vdec.h       |  14 +-
 .../staging/media/meson/vdec/vdec_helpers.c   |  88 ++--
 .../staging/media/meson/vdec/vdec_helpers.h   |   6 +-
 .../staging/media/meson/vdec/vdec_platform.c  |  71 +++
 include/media/v4l2-mem2mem.h                  | 133 +++++
 12 files changed, 1113 insertions(+), 230 deletions(-)
 create mode 100644 drivers/staging/media/meson/vdec/codec_h264.c
 create mode 100644 drivers/staging/media/meson/vdec/codec_h264.h

-- 
2.22.0

