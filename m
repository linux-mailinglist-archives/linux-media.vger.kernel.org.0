Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4A402CC424
	for <lists+linux-media@lfdr.de>; Wed,  2 Dec 2020 18:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730967AbgLBRpK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 12:45:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730873AbgLBRpK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Dec 2020 12:45:10 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08EE9C0617A7
        for <linux-media@vger.kernel.org>; Wed,  2 Dec 2020 09:44:24 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id e7so4966033wrv.6
        for <linux-media@vger.kernel.org>; Wed, 02 Dec 2020 09:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=og2P49iViWEWzWwqprbc7YqWxuiFFqb2QXhaHJuh+Es=;
        b=TI+ZiSjRRjp0Chxn742QSRKoZPM5yqr1orTfYREdY2t7DOMY81ZXUURWTjJazUdUlx
         6PzIuNhj8u11aYjetMj3g+NHs9z3Ze/6JNL6KPB63VoDz1Cp8eizyXbJqC0R/+3lQk6W
         agIXRv2okb7dzCE+NS3u0d0ie2d/GkFfWN9VaxNmsHizFug9A2WZt3A/ez8WnyN1cg11
         Yy13fU1AnKWNKCZUmQJ5WjqMuIiN46GqmjtAlemHaf2V+usG+tgyPYH5rCKTMFT4FWep
         qLZrEQUAcc3WwrovovPzlX6+LmU/NZiNhUigRkHsgDQs9yBLLRPk4uZ9Md7JfdflHw5B
         fUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=og2P49iViWEWzWwqprbc7YqWxuiFFqb2QXhaHJuh+Es=;
        b=IC0p7zX24Z5rjbncYHCXigNfDrYoVFOZckhUO/iv1KhP+5DWH2emdn7fTg3IGg93dK
         /Hw0aSKkuy9QBQMlZmhgv+DwNU/ge+YjRuJ8hfsyE6wHaAMpWX6t9qNZEtBfBA8DOETS
         B/Tss35bF0OjeS50nP1RRREoihi1DpGCKDx8zQr9sp1mlsuMggw5uRfuDjgWQMHTizZ9
         7pGJl3/sKRIerk4O2/WDPi84Y35uy4BEsx7FfthzOIP//WhCo5yHc4l8ulE69Dl7Lnee
         hXv5ed6o5zF0cBdbM3keVDCuLueTVyxR1fTvrjWJYWi16FELU4L/NcwuY0l69iIF83PO
         TULQ==
X-Gm-Message-State: AOAM531HS5xlKBGXY+loFsJ3zS1WYrJfFFPr3PtpRD3bSVKF04XNFnx1
        4RgxJYKAixG46HbRngd0q6KUnw==
X-Google-Smtp-Source: ABdhPJyu/5eHl3rHLVtbq/BB4JwK3Cb8C+avo9c66STs6euPWenUunbw4GGp/0EpoZ1KpkFoxvgqVg==
X-Received: by 2002:a5d:4ac1:: with SMTP id y1mr4781042wrs.366.1606931062420;
        Wed, 02 Dec 2020 09:44:22 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:15b4:c668:8f06:1b99])
        by smtp.gmail.com with ESMTPSA id q12sm2842915wrx.86.2020.12.02.09.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 09:44:21 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     hverkuil@xs4all.nl
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] media: meson: Add support for the Amlogic GE2D Accelerator Unit
Date:   Wed,  2 Dec 2020 18:44:13 +0100
Message-Id: <20201202174417.3778306-1-narmstrong@baylibre.com>
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
- Patch 4: https://lkml.kernel.org/r/20200915124553.8056-1-narmstrong@baylibre.com (applied for 5.11)

Changes since v3:
- Removed spinlock
- Removed useless streamon_cap/streamon_out
- Fixed probe failure path & remove path
- Changed default size to 128x128
- Removed useless pix.width/height test
- Upgraded v4l2-compliance to 1.21.0 (11da65eee7a271bba3f21d8117cdac428fe3a91e)

Changes since v2:
- removed error check in and after get_frame()
- moved the v4l2_file_operations lower in the code to avoid adding vidioc_setup_cap_fmt on top
- removed all memcpy of pix_fmt
- simplified & fixed ge2d_start_streaming
- added local buffer type check in vidioc_g_selection instead of using get_frame error
- removed impossible <0 rectangle check, fixed error string
- added comment on condition after V4L2_CID_ROTATE

Changes since v1:
- Rebased on v5.10-rc1

/ # v4l2-compliance -s
v4l2-compliance 1.21.0-4682, 64 bits, 64-bit time_t
v4l2-compliance SHA: 11da65eee7a2 2020-11-14 12:41:14

Compliance test for meson-ge2d device /dev/video0:

Driver Info:
	Driver name      : meson-ge2d
	Card type        : meson-ge2d
	Bus info         : platform:meson-ge2d
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
 drivers/media/platform/meson/ge2d/ge2d.c      | 1066 +++++++++++++++++
 8 files changed, 1509 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
 create mode 100644 drivers/media/platform/meson/ge2d/Makefile
 create mode 100644 drivers/media/platform/meson/ge2d/ge2d-regs.h
 create mode 100644 drivers/media/platform/meson/ge2d/ge2d.c

-- 
2.25.1

