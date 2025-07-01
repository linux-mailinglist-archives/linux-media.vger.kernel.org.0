Return-Path: <linux-media+bounces-36450-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E6FAEFECE
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 18:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 303903AB55F
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 16:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A4E27AC35;
	Tue,  1 Jul 2025 16:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="LMilzz2Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF832253A4
	for <linux-media@vger.kernel.org>; Tue,  1 Jul 2025 16:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751385720; cv=none; b=tumRWhlLAq/thVYFtlzSpV25AJ7r1Exouk/4DIkDghbADxHvF7ZGZH3Kflc/hBFKLnYw4TuUb4Dg1hPq1Z/dGVwqOlWjGE+n/GTiyeV6pCrNpcbDOTT+PbUvP6LoHGJikgEs5kGqlcpOHI685huzNLZ3U/vnbsbhUQS6bzzRfOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751385720; c=relaxed/simple;
	bh=VaU9KtiEsZd2EVUAjLlTgYQ2bd05wAjb2rXv02gqKkQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TqiHm8UixYw6rbQ3THX2aelGO0373475+wv3X1tB63sLy8689RAgY0AnNEFOyEzM2wzpjPGDmgxxJORj4KWcM7NtdBaoBghySzIRUi/5eZp5juwoBTELVq9+3d9PCZK+uTBm+Uz4byogn4Gj6i4Ooy5BVV/S6PJIf1BHYv5aKfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=LMilzz2Z; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so18202535e9.2
        for <linux-media@vger.kernel.org>; Tue, 01 Jul 2025 09:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1751385715; x=1751990515; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fs3JAozsYsD/2WW79a82RkP4PH1iMiVPVWhyq+47Szo=;
        b=LMilzz2ZxfkX9vcplcK6Ig38tDOuz5HVOLkN11AdcnesdIGX+SOjDW0p/1mJHdznXE
         UIx+BMA1cjTrKqXPfWvJvCYjq81ALZJUkmk6GIq9RAfA7OJ+TS4PZCqOHLVGmW/xAaoI
         nzeYf+iAGwBZh+MJ1oKrJmmhB57ab/nKW1MfVdeIofHvOvqwuBUnVhfYVvRJPuV1s564
         ZAyUaUdj/nUMTATeYFnP7vsam3zXMALaYz82CH1jLHYhD7BKuF1HQFh44FvxrS/KkAeo
         N7R1SotFZAVh3bw7MhpTGo/pEI8XtLfC7meBtr//3FjCYqDU1/yVfB2cyTHmuPqcyhMz
         JJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751385715; x=1751990515;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fs3JAozsYsD/2WW79a82RkP4PH1iMiVPVWhyq+47Szo=;
        b=wA8GsLitBW1B9GVONEvuYxnHCmshBNqx5JYXbAUBHjXgehESDD0qEHI7szxLWYZbLV
         Pi3BZEyNi8Ic37N+DoL6eFATxs0Hve5f/pgG4o9cXfVlz0sP+jG+p1k083l5gJqhW96A
         xbmazMzFXaAIRPhVPxckABHrdiQP6K04y/YfV3ao2nS7UlNMGMmihQm77nh3nzYeeX8W
         1o3iQ08z1krTy2A5Dm64KCYqtnwar6vy1uw/ME2SAPJ4f/CQRCWgsqjAWbGVIhyjKlba
         UTyYPfcx69W3Ou9Bdhbydbs3RE6ZrSpSnih65pcucPXJZnejf6+d3ccVcmMb76MamozA
         pvgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGrCFUxYX4ALbkSi2So/i6zqhkV3eRWacNHdg8DDMZcQvXfp+7mXEgSl3ZbtYLoHoUL3i52E8rSwTIyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaUtyy0fV7Uf+6ibX5hFE+eiBHyhGfuUEUBlfcwhFuXAuHI+vP
	prUGexYlK6bEb4WNz2ucn4gD19+3bDX197AQCv5vW/oCm4tUAd7/wHKF6PlW6ojM2H0=
X-Gm-Gg: ASbGncsSGUcufR7/ZXPOGAU21y2UaEKE4wK6holZnBiQJD2QcRIRLCewqbqdARbgsgH
	LNLVtcuCkYkLo6ygeMMaqoEZAreOzWuNCV7E/mYZsY9ZJlqs8faMNlsVTO7R6ag0w3UrxBLJRZZ
	Gn7QQp1d44YYpm/408bN2Scg7BbWQVAYL2CBdqUPpwvRZdpgJJyamLDwvvc/ttd8g/41ToebdoA
	osHbh8F3WOECFi9SasIzjjE0TU6z7oeV9P3brKk7oVn4wEMChshpZNH3ZLNAARx5p5g2RLlkstV
	9/Tf2uVnJ5X9+rlR69mp3fnL8ovanSp3a6s/g5yq2WwVuWW+C68crQ==
X-Google-Smtp-Source: AGHT+IGMMAfyKj8jFqWLmzk8Rj2j7dBknlV19cnUCzUeiREguJOJeqK8EAyxRItVH48lXpZUOSz4ig==
X-Received: by 2002:a05:600c:1d1a:b0:43e:afca:808f with SMTP id 5b1f17b1804b1-4538ee790admr211077095e9.31.1751385714401;
        Tue, 01 Jul 2025 09:01:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45388888533sm182500995e9.21.2025.07.01.09.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:01:53 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v4 0/5] Raspberry Pi HEVC decoder driver
Date: Tue, 01 Jul 2025 17:01:35 +0100
Message-Id: <20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGAGZGgC/23NQQ7CIBCF4as0rMXADK3VlfcwLgoMdhbaBgyxM
 b272Ghc2OX/kvnmKRJFpiQO1VNEypx4uJUwm0q4vrtdSLIvLUCB0aBBXslzJ+PIsqfspCcn0da
 WdrgPaL0oh2OkwI8FPZ1L95zuQ5yWH1m/1w8Hao3LWiqpyDqnDHkDdIxdGi3FOI28dcNVvNEMX
 6hWoJpVCArU7LFG17aqtrAO4Q8ygKsQFqgNHkPntW+C/YfmeX4B4Q5RtkwBAAA=
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

Hi All

This has been in the pipeline for a while, but I've finally cleaned
up our HEVC decoder driver to be in a shape to at least get a first
review.
John Cox has done almost all of the work under contract to Raspberry
Pi, and I'm largely just doing the process of patch curation and
sending.

This series has been updated to use the manual request completion
framework from Hans and Nicolas as a dependency
https://lore.kernel.org/linux-media/20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com/

Thanks
  Dave

v4l2-compliance output:
v4l-utils $ ./build/utils/v4l2-compliance/v4l2-compliance 
v4l2-compliance 1.31.0-5374, 64 bits, 64-bit time_t
v4l2-compliance SHA: b8c26bb16d75 2025-06-10 21:30:38

Compliance test for rpi-hevc-dec device /dev/video0:

Driver Info:
	Driver name      : rpi-hevc-dec
	Card type        : rpi-hevc-dec
	Bus info         : platform:rpi-hevc-dec
	Driver version   : 6.16.0
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
	Detected Stateless Decoder
Media Driver Info:
	Driver name      : rpi-hevc-dec
	Model            : rpi-hevc-dec
	Serial           : 
	Bus info         : platform:rpi-hevc-dec
	Media version    : 6.16.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 6.16.0
Interface Info:
	ID               : 0x0300000c
	Type             : V4L Video
Entity Info:
	ID               : 0x00000001 (1)
	Name             : rpi-hevc-dec-source
	Function         : V4L2 I/O
	Pad 0x01000002   : 0: Source
	  Link 0x02000008: to remote pad 0x1000004 of entity 'rpi-hevc-dec-proc' (Video Decoder): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

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
		fail: v4l2-test-controls.cpp(939): try_ext_ctrls returned an error (22)
	test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 3 Private Controls: 0
	Standard Compound Controls: 5 Private Compound Controls: 0

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
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK
	test blocking wait: OK

Total for rpi-hevc-dec device /dev/video0: 49, Succeeded: 48, Failed: 1, Warnings: 0

Testing is mainly with a downstream patchset to FFmpeg. I'm told FFmpeg
currently has no stateless decode support, but we will be reviewing
works that have been in progress and our downstream patches to see
whether that can be pushed onwards.
Downstream tree is at
https://github.com/jc-kynesim/rpi-ffmpeg/tree/dev/5.1.6/sandm_1

https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9247
adds support for the new formats to GStreamer, and allows Fluster to run.
Using the JCT-VC-HEVC_V1 test suite we get 142 passes out of 147 tests.
PICSIZE_[ABCD]_Bossen_1 all fail due to the image sizes being greater than
the 4096x4096 limit of this driver.
TSUNEQBD_A_MAIN10_Technicolor_2 fails as the hardware doesn't support
having a different bit depth for luma and chroma.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes in v4:
- dt-bindings: Drop to just SoC compatibles and updated description (Krzysztof).
- dts: Corrected address in node name.
- NV12MT_COL128 format description added vertical alignment to a
  multiple of 8 (Nicolas)
- driver: Merged in driver updates based on Nicolas' review.
- driver: Added debug module parameter to avoid log spam due to some bitstreams.
- cover-letter: Added Fluster results.
- rebased and based on the updated version of 
  https://lore.kernel.org/linux-media/20250604-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v3-0-603db4749d90@collabora.com/
- update v4l2-compliance output
- Link to v3: https://lore.kernel.org/r/20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com

Changes in v3:
- Updated the dtbinding with SoC specific compatible strings (Rob).
- Reordered hevc_dec and v3d in bcm2711.dtsi to keep them in ascending
  register order (Stefan).
- Reordered hevc_dec in bcm2711-rpi.dtsi to keep them in alphabetical
  order (Stefan).
- Tested on top of Nicolas' revised version of Hans' patch set for
  manual request completion.
  https://lore.kernel.org/all/20250410-sebastianfricke-vcodec_manual_request_completion_with_state_machine-v2-0-5b99ec0450e6@collabora.com/
- Link to v2: https://lore.kernel.org/r/20250206-media-rpi-hevc-dec-v2-0-69353c8805b2@raspberrypi.com

Changes in v2:
- Rebased to use Hans' manual request completion scheme.
  https://lore.kernel.org/linux-media/cover.1724928939.git.hverkuil-cisco@xs4all.nl/
- Require all slices for a frame to be submitted in one request.
- Added the missing header file.
- Used the full macro name for pix format docs (Sakari)
- Dropped unneeded |- from dtbinding (Rob)
- Made reg and reg-names match in order (Rob)
- Removed clock-names from dtbinding (Rob)
- Driver changed to not request the clock by name
- Dropped clock-names from DTS file
- Minor fixes for compliance failures
  fail: v4l2-test-formats.cpp(958): fmt_cap.g_colorspace() != col
  fail: v4l2-test-buffers.cpp(901): q.create_bufs(node, 1, &fmt) != EINVAL
- v4l2-compliance output added to cover letter (Nicholas)
  I believe the "fail: v4l2-test-controls.cpp(939): try_ext_ctrls
  returned an error (22)" is expected as it is validating the SPS.
  Hantro and Cedrus certainly both appear to return errors in the same place
- Link to v1: https://lore.kernel.org/r/20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com

---
Dave Stevenson (4):
      docs: uapi: media: Document Raspberry Pi NV12 column format
      media: ioctl: Add pixel formats NV12MT_COL128 and NV12MT_10_COL128
      dt-bindings: media: Add the Raspberry Pi HEVC decoder
      arm: dts: bcm2711-rpi: Add HEVC decoder node

John Cox (1):
      media: platform: Add Raspberry Pi HEVC decoder driver

 .../bindings/media/raspberrypi,hevc-dec.yaml       |   72 +
 .../media/v4l/ext-ctrls-codec-stateless.rst        |    6 +-
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  |   42 +
 MAINTAINERS                                        |   10 +
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi        |    4 +
 arch/arm/boot/dts/broadcom/bcm2711.dtsi            |    9 +
 drivers/media/platform/raspberrypi/Kconfig         |    1 +
 drivers/media/platform/raspberrypi/Makefile        |    1 +
 .../media/platform/raspberrypi/hevc_dec/Kconfig    |   17 +
 .../media/platform/raspberrypi/hevc_dec/Makefile   |    5 +
 .../media/platform/raspberrypi/hevc_dec/hevc_d.c   |  369 +++
 .../media/platform/raspberrypi/hevc_dec/hevc_d.h   |  192 ++
 .../platform/raspberrypi/hevc_dec/hevc_d_h265.c    | 2554 ++++++++++++++++++++
 .../platform/raspberrypi/hevc_dec/hevc_d_h265.h    |   23 +
 .../platform/raspberrypi/hevc_dec/hevc_d_hw.c      |  376 +++
 .../platform/raspberrypi/hevc_dec/hevc_d_hw.h      |  314 +++
 .../platform/raspberrypi/hevc_dec/hevc_d_video.c   |  674 ++++++
 .../platform/raspberrypi/hevc_dec/hevc_d_video.h   |   38 +
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 include/uapi/linux/videodev2.h                     |    4 +
 20 files changed, 4711 insertions(+), 2 deletions(-)
---
base-commit: 6669fd53a3c2be6dc632a87d9105016139088144
change-id: 20241212-media-rpi-hevc-dec-3b5be739f3bd

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>


