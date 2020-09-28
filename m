Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8347B27B18B
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 18:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgI1QOS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 12:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgI1QOS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 12:14:18 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FF83C0613CE
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2020 09:14:17 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id t10so2023080wrv.1
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2020 09:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wsE+wZCsr2B/rt2qhMck0fAx7tH1ws4WpV99o/rd8Tk=;
        b=y1jJilgwAgmeqerMgEz8OJHYLWjQjVYFOPPkCe1p0KnOHmXNM30LFtALalFHyzhq8z
         2z4rTgv8Ek2pxpWUPSCOdjMR0PknTYhDhI5e1q67miaKw63w3wgVg3+q2wdnXeym5gsx
         h/whuq5wWG1dxEISjJrXDPTN56jYWPZZp1d+9EGJY5udZff7GxrT7wUpBtd1JtxCeaeo
         32X/WCcb6/nGn9d8CC07bviNCYVxzjthrWnC7XP6/GJpUsa1DFuG26/H0kQ9Y1Dq28fc
         e/hbvj3BpPKMVrZMEw9bXH830fUTlFdM3cMZfClC6r5HvJdcNJadfmHPFiE05vzfgB6I
         LM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wsE+wZCsr2B/rt2qhMck0fAx7tH1ws4WpV99o/rd8Tk=;
        b=BUOGqA/qXMIW5JVkfjiY0p9DqQlRuKZMewB6M7WIHJLDDRCSbPld0R2H4+5kqnPnqm
         78gLw0gjXpLfc2dPYmkoPYDepBELp0ZOe0lhzlNVHBYxJ/99mIY9/qI5Pph6DNm9vTId
         PKg5t5YlpqkJ2rumjQZwwMqzbhyOfMf9Yg28YeGN7OHKY4JSmyCLojNIBDjejVGHiPYY
         CHni/dBZ+Ow6LVrqEpv96XYIlbPSIiien2xdmynfeKidm4Fo47ua/GX6DZj0P4s6RTt+
         /s7MYrhRusqp9iTlDD/K39AVkKD64y8IWydTBKGuf1bQlZRpo4+XHXtWjnujQmktOKG5
         7/sg==
X-Gm-Message-State: AOAM530qrWbVS8hKAj9vUDmcDi59N7IMBU9BndDHXa998YSdyO23fjtH
        d3g8j1Sw1aZ6GfeLAP6dRQi+/w==
X-Google-Smtp-Source: ABdhPJySt0XxOeoAws8/fINDoVLFSuY4/CCM/h3xQYpD9Or1Xos/k2VPWmESS4+8lHlfxnWA7gdneQ==
X-Received: by 2002:adf:91a4:: with SMTP id 33mr2724673wri.170.1601309655588;
        Mon, 28 Sep 2020 09:14:15 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:19c2:a71d:5af8:dbf6])
        by smtp.gmail.com with ESMTPSA id n4sm2004867wrp.61.2020.09.28.09.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 09:14:14 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] media: meson: Add support for the Amlogic GE2D Accelerator Unit
Date:   Mon, 28 Sep 2020 18:14:07 +0200
Message-Id: <20200928161411.323581-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The GE2D is a 2D accelerator with various features like configurable blitter
with alpha blending, frame rotation, scaling, format conversion and colorspace
conversion.

The driver implements a Memory2Memory VB2 V4L2 streaming device permitting:
- 0, 90, 180, 270deg rotation
- horizontal/vertical flipping
- source cropping
- destination compositing
- 32bit/24bit/16bit format conversion

This adds the support for the GE2D version found in the AXG SoCs Family.

The missing features are:
- Source scaling
- Colorspace conversion
- Advanced alpha blending & blitting options

Dependencies:
- Patches 1-3: None
- Patch 4: https://lkml.kernel.org/r/20200915124553.8056-1-narmstrong@baylibre.com

/ # v4l2-compliance -s
v4l2-compliance SHA: ea16a7ef13a902793a5c2626b0cefc4d956147f3, 64 bits, 64-bit time_t

Compliance test for meson-ge2d device /dev/video0:

Driver Info:
	Driver name      : meson-ge2d
	Card type        : meson-ge2d
	Bus info         : platform:meson-ge2d
	Driver version   : 5.9.0
	Capabilities     : 0x84208000
		Video Memory-to-Memory
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04208000
		Video Memory-to-Memory
		Streaming
		Extended Pix Format

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
	Standard Controls: 4 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK
	test Composing: OK
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
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
	Video Capture: Captured 58 buffers                
	test MMAP (no poll): OK
	Video Capture: Captured 58 buffers                
	test MMAP (select): OK
	Video Capture: Captured 58 buffers                
	test MMAP (epoll): OK
	test USERPTR (no poll): OK (Not Supported)
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for meson-ge2d device /dev/video0: 52, Succeeded: 52, Failed: 0, Warnings: 0

Neil Armstrong (4):
  dt-bindings: media: Add bindings for the Amlogic GE2D Accelerator Unit
  media: meson: Add M2M driver for the Amlogic GE2D Accelerator Unit
  MAINTAINERS: Add myself as maintainer of the Amlogic GE2D driver
  arm64: dts: meson-axg: add GE2D node

 .../bindings/media/amlogic,axg-ge2d.yaml      |   47 +
 MAINTAINERS                                   |    9 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |    9 +
 drivers/media/platform/Kconfig                |   13 +
 drivers/media/platform/Makefile               |    2 +
 drivers/media/platform/meson/ge2d/Makefile    |    3 +
 drivers/media/platform/meson/ge2d/ge2d-regs.h |  360 ++++++
 drivers/media/platform/meson/ge2d/ge2d.c      | 1105 +++++++++++++++++
 8 files changed, 1548 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
 create mode 100644 drivers/media/platform/meson/ge2d/Makefile
 create mode 100644 drivers/media/platform/meson/ge2d/ge2d-regs.h
 create mode 100644 drivers/media/platform/meson/ge2d/ge2d.c

-- 
2.25.1

