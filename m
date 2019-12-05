Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 086D7113DD0
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 10:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729143AbfLEJZA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 04:25:00 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50490 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729128AbfLEJZA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Dec 2019 04:25:00 -0500
Received: by mail-wm1-f66.google.com with SMTP id p9so2830987wmg.0
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2019 01:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mBF644RxUTBZva0im+niDbPkyL2AEsuC+ZFykTwNHIk=;
        b=jvHufdfywsSJ0HvGIzqsFTbHETU81IekWnO0l26AzmkTTAa7gwuMH1lsx7yrrzARg8
         mESZtima5ozmNO3vRaRMCjp15FqTL5zwSufZ6+Lfbd0KcpiBBAXTeTuc2su6FqnSLlzo
         PkhJ86WNgNijHeqHvopJM7YcU5GL0nlg6JpSpR33XOA2e8tpTBl7vR22glskgdaArJDg
         GKg+xOU7m/Z/8bKSfnM6G+McYokTd02Qw/YW3qwsArMn0EjzGZpsCcwfle7pXWXtVkGw
         PUa3WZn+OJaJ7sO5gV1FgxQe0ZhiOLHZcN52wLkPCA0GTCipPXbUnVrbP3jrGVMnbptL
         T1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mBF644RxUTBZva0im+niDbPkyL2AEsuC+ZFykTwNHIk=;
        b=FexP3YrU1emk8F5M492v0JOLsXOYFUJPXYtBWQexvsA5AItX5DIkbyctQu5FQm+QoJ
         2bdSh/hgWVY51dM+qrNC33ifCq4RG5MDMRiRvqeIb79rgTDPSHaAKtxKbzfNCqJyQRoW
         6mflbXQRGvfrjAMY42AfppkijAFacbLI9Zhpy/2+1E9/bqrjBr12Q8hJt0F5ePIzlFNN
         yM87RgiGRf/2M4SFdrLZ1Q2aEhUU4usCnCP+PW4CJ0q6XbtZFfugxZRwaAEkHysvGsF6
         UegdvU6qS6mgkaWcSGw6hFsa4k112P9cl9Dy4jtbfSw78MtUhkfI1UAVy6nwW9YQA0Nw
         r2bQ==
X-Gm-Message-State: APjAAAX5OKHPF9NQV/dTfc2jfBXf1h/1Bt3PMsT7/ryQWB7CIbojraSn
        xRjLjI3LU2mpu5PiWg1t3/2C5A==
X-Google-Smtp-Source: APXvYqzb9PZe4p/FaxkjRz+yIx4cEG1Ar/uArvNnrvahc13Bn+ryPAUa9ho0yU4y6s6dzxJC54jQkA==
X-Received: by 2002:a05:600c:22c8:: with SMTP id 8mr3810490wmg.178.1575537897038;
        Thu, 05 Dec 2019 01:24:57 -0800 (PST)
Received: from bender.baylibre.local (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id t5sm11642620wrr.35.2019.12.05.01.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 01:24:56 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mchehab@kernel.org, hans.verkuil@cisco.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] media: meson: vdec: Add VP9 decoding support
Date:   Thu,  5 Dec 2019 10:24:49 +0100
Message-Id: <20191205092454.26075-1-narmstrong@baylibre.com>
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
samples, passing 82 resolutions test streams, with 13 fails by pixel
differences and 3 timeouts.

This patchset depends on :
- G12A enablement at [3]
- SM1 enablement at [4]
- H.264 and compliance at [5]

[1] https://github.com/superna9999/pyv4l2compliance/raw/tests/output/Jellyfish_1080_10s_5MB.vp9.hdr
[2] https://github.com/superna9999/pyv4l2compliance
[3] https://lore.kernel.org/linux-media/20191120111430.29552-1-narmstrong@baylibre.com
[4] https://lore.kernel.org/linux-media/20191121101429.23831-1-narmstrong@baylibre.com
[5] https://lore.kernel.org/linux-media/20191126093733.32404-1-narmstrong@baylibre.com

The compliance log is:
# v4l2-compliance --stream-from-hdr Jellyfish_1080_10s_5MB.vp9.hdr -s 200
v4l2-compliance SHA: 7ead0e1856b89f2e19369af452bb03fd0cd16793, 64 bits

Compliance test for meson-vdec device /dev/video0:

Driver Info:
	Driver name      : meson-vdec
	Card type        : Amlogic Video Decoder
	Bus info         : platform:meson-vdec
	Driver version   : 5.4.0
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
	Video Capture Multiplanar: Captured 200 buffers   
	test MMAP (select): OK
	Video Capture Multiplanar: Captured 200 buffers   
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
 .../media/meson/vdec/codec_hevc_common.c      |  285 ++++
 .../media/meson/vdec/codec_hevc_common.h      |   77 ++
 drivers/staging/media/meson/vdec/codec_vp9.c  | 1192 +++++++++++++++++
 drivers/staging/media/meson/vdec/codec_vp9.h  |   13 +
 drivers/staging/media/meson/vdec/esparser.c   |  142 +-
 drivers/staging/media/meson/vdec/hevc_regs.h  |  218 +++
 drivers/staging/media/meson/vdec/vdec.c       |   10 +-
 .../staging/media/meson/vdec/vdec_helpers.c   |   31 +-
 .../staging/media/meson/vdec/vdec_helpers.h   |    4 +
 drivers/staging/media/meson/vdec/vdec_hevc.c  |  231 ++++
 drivers/staging/media/meson/vdec/vdec_hevc.h  |   13 +
 .../staging/media/meson/vdec/vdec_platform.c  |   38 +
 13 files changed, 2245 insertions(+), 13 deletions(-)
 create mode 100644 drivers/staging/media/meson/vdec/codec_hevc_common.c
 create mode 100644 drivers/staging/media/meson/vdec/codec_hevc_common.h
 create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.c
 create mode 100644 drivers/staging/media/meson/vdec/codec_vp9.h
 create mode 100644 drivers/staging/media/meson/vdec/hevc_regs.h
 create mode 100644 drivers/staging/media/meson/vdec/vdec_hevc.c
 create mode 100644 drivers/staging/media/meson/vdec/vdec_hevc.h

-- 
2.22.0

