Return-Path: <linux-media+bounces-50381-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD10D10550
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 03:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E539302D3A5
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 02:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801B9302151;
	Mon, 12 Jan 2026 02:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvyAlKTF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636AE2D94A3
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 02:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768184672; cv=none; b=Anc39091g3St5xw1sPzj2NQamGHMoAWkWrtYOEa+NkICvIQkQhlrayGcpqSjXPgrEU3dpHfPFHQbClBzyJMNvsjyq1QOm9NleyPPWF5jv5MCmN6m4uke+wXW8VxyuJf0BdHEouvxNpk7K7cmyzNUL0eK3EmxFv48SBGgnyu4oHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768184672; c=relaxed/simple;
	bh=9Df/qKTUOcn6/38y3IhX1hmpCNdylkDnWd5LMtcHOsw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kfEST58bMiJq7LRIkVE8v90fKklIGGLLh4qbiZ0KF/xgcV4NqstkEktII4s6zVxme8q68HbiTstgk05LqloczdoXUNjhBteodrpZdT1Ac7dWMU6LCyll0q1Zv81STiC53G6ujqaWLVgwAAqYrIFZsznTmqupmD5hmga2splSNOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YvyAlKTF; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4510974a6bbso2205989b6e.3
        for <linux-media@vger.kernel.org>; Sun, 11 Jan 2026 18:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768184669; x=1768789469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EiAqMuDHhCGi13tQVFG3rPHevnj/AEbGf3wOu0YYew4=;
        b=YvyAlKTFB/jxwS0qvXUFJRz1KJ2ANdYIp9QB9ySQspdJM0muJU79+7gRWaC99K2YwW
         iyhg+u/7wE7DWqheVHwmOBxOdTKqqVax8Z5QTABvWYERXXJ26tkFqe1BYfIiWMVPGmCC
         jMZNoPbOJf9RJIcogjuArKZgLVnhjl3a0xjkNUfkw5WTkTe94wjkJDZXVdwSvcTxShgx
         hQ/0sw0uKf3uEoDNRO1FAzhd0xAhUA+Up2rw5Aj4N0ZGGZeQaLLIsS3fd9CX2EhJ1CRG
         YsX7BR6O4xACa+GjOHxdwFvl4T8MpdEUtXzSwZL90dpZ9fH3c5gwmQF5I208FdPkK2w6
         AcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768184669; x=1768789469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EiAqMuDHhCGi13tQVFG3rPHevnj/AEbGf3wOu0YYew4=;
        b=MI7NHZD8a7LrAaIsYKairoqf1E1lo2t87rfgEVdaQEgGIffHyst6wwGeiGX560GDYS
         4FNlFcEQnlJ6iTCK5V9JpQldlBOmsmHWJ/Skr53sj1p8eZgLbTQUBzjlMMMjiFoTNUk0
         GtB+D0gH3kXrIkOYt1VXLwupZlSq/rb7R2A1ava5KVwpAHDKcpV71mrhHHp6ddl3F9oD
         1tsVjA3Xhq0//3b2rh+PPwHr2eHe7ADD0nRGMwunI4Aq6pGYwd8u9CMDycxM8jla7jpZ
         a7GVPfPTFZUAl5nTbGW1vYlNC/491rJQj5QEbBIRkx8+X7UyVLCGgNjZ+lgIA9w8Go8+
         rY1Q==
X-Gm-Message-State: AOJu0Yz4YKQb6bg5HzrP0tJC8kSdXzGcsAGuQtOH0Kp5Nw4n/ZvqhF7A
	B5v2Un1Pw80FoPJx2ZuU5cq5sjlNa24ySexgG5Z8vEyq53243PG2ufxDgJIyHg==
X-Gm-Gg: AY/fxX7eeA4IUg5yGEmgvpaCJ9bbQmyF93EIjk9iBWAf7+hy2KTLi06OzpQaVSSkmEN
	JFCpbIZAxlIzFH5gh0hqHI8ujvjnTrHRsJB6M9DwoJdC7YF3GlOBMsF52ukShAsevFCWi+hWzCv
	9SB2Cvsr4H08qiZ1EOtda9kIFWDQjIWevGSj5LWXPvwA94lWfs4Mv2CRHNl+RDQMeMWC2LPY7aN
	YhJja6pXlGEBbpn6mMUX8TI3QILySlcVKy/eEZHTchr7Hl0nFiZdFIXqhWDz2+t4BQKCWjKW7fI
	42TexEn7SfHPDh1m0MW2uQNRJK4nHM3F7+enfZTIkNjqMU+MRXLP0UENzPfW6khzhgcOakvoEFW
	sjiyUG1iw3IhD0Ur8+wtUf/94ZNI8/pGU/XdlkCowgwOSXWyOlONVK3m5CiXHuQP7vlcLTR1gY3
	fLLTQH2vBXLynu9ffPB96lBin7FgQ22Qz/6HSd03DClH4Q1cFSaXwKEEVIHEx6yFgeCaHNs7Syh
	A==
X-Google-Smtp-Source: AGHT+IEFSgr5pLuJURO5AtZyhfaUmUgahXYSOxA0I1tLMBZaVNcjpjm646DD/g5d0v3C385UC6IQog==
X-Received: by 2002:a05:6808:470c:b0:450:4367:111 with SMTP id 5614622812f47-45a6bf6ee15mr9330094b6e.66.1768184669050;
        Sun, 11 Jan 2026 18:24:29 -0800 (PST)
Received: from princess (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa50ecb58sm11293354fac.18.2026.01.11.18.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 18:24:28 -0800 (PST)
From: Ben Hoff <hoff.benjamin.k@gmail.com>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil@kernel.org,
	Ben Hoff <hoff.benjamin.k@gmail.com>
Subject: [PATCH v1 0/2] media: pci: AVMatrix HWS capture driver
Date: Sun, 11 Jan 2026 21:24:18 -0500
Message-ID: <20260112022420.390854-1-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This series introduces an in-tree AVMatrix HWS PCIe capture driver.
The driver supports up to four HDMI inputs and exposes the video capture
path through V4L2. Audio support is intentionally omitted in this
revision so the series can focus on the video pipeline and PCIe glue.

Major pieces include:
  - PCI glue with capability discovery, BAR setup, interrupt handling,
    and power-management hooks.
  - A vb2-dma-contig based capture pipeline with DV timings support,
    per-channel controls, two-buffer management, and loss-of-signal
    recovery.

The baseline GPL out-of-tree driver is available at:
  https://github.com/benhoff/hws/tree/baseline
A vendor driver bundle is available at:
  https://www.acasis.com/pages/acasis-product-drivers
The vendor is not involved in this upstreaming effort.

Prior RFC posting: https://lore.kernel.org/lkml/20251027195638.481129-1-hoff.benjamin.k@gmail.com/

Current status / open items:
  - `v4l2-compliance` passes for each video node, and I have exercised
    basic capture in OBS and run this driver in a steady state mode
    daily

v4l2-compliance (from v4l-utils git, v4l2-compliance 1.32.0):
v4l2-compliance 1.32.0, 64 bits, 64-bit time_t

Compliance test for HwsCapture device /dev/video1:

Driver Info:
        Driver name      : HwsCapture
        Card type        : AVMatrix HWS Capture 2
        Bus info         : PCI:0000:17:00.0
        Driver version   : 6.18.3
        Capabilities     : 0x84200001
                Video Capture
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04200001
                Video Capture
                Streaming
                Extended Pix Format

Required ioctls:
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video1 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
        test VIDIOC_DV_TIMINGS_CAP: OK
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
                info: checking v4l2_query_ext_ctrl of control 'User Controls' (0x00980001)
                info: checking v4l2_query_ext_ctrl of control 'Brightness' (0x00980900)
                info: checking v4l2_query_ext_ctrl of control 'Contrast' (0x00980901)
                info: checking v4l2_query_ext_ctrl of control 'Saturation' (0x00980902)
                info: checking v4l2_query_ext_ctrl of control 'Hue' (0x00980903)
                info: checking v4l2_query_ext_ctrl of control 'Brightness' (0x00980900)
                info: checking v4l2_query_ext_ctrl of control 'Contrast' (0x00980901)
                info: checking v4l2_query_ext_ctrl of control 'Saturation' (0x00980902)
                info: checking v4l2_query_ext_ctrl of control 'Hue' (0x00980903)
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
                info: checking control 'User Controls' (0x00980001)
                info: checking control 'Brightness' (0x00980900)
                info: checking control 'Contrast' (0x00980901)
                info: checking control 'Saturation' (0x00980902)
                info: checking control 'Hue' (0x00980903)
        test VIDIOC_G/S_CTRL: OK
                info: checking extended control 'User Controls' (0x00980001)
                info: checking extended control 'Brightness' (0x00980900)
                info: checking extended control 'Contrast' (0x00980901)
                info: checking extended control 'Saturation' (0x00980902)
                info: checking extended control 'Hue' (0x00980903)
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
                info: checking control event 'User Controls' (0x00980001)
                info: checking control event 'Brightness' (0x00980900)
                info: checking control event 'Contrast' (0x00980901)
                info: checking control event 'Saturation' (0x00980902)
                info: checking control event 'Hue' (0x00980903)
                warn: v4l2-test-controls.cpp(1159): V4L2_CID_DV_RX_POWER_PRESENT not found for input 0
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 5 Private Controls: 0

Format ioctls (Input 0):
                info: found 1 formats for buftype 1
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
                warn: v4l2-test-formats.cpp(1485): S_PARM is supported for buftype 1, but not for ENUM_FRAMEINTERVALS
        test VIDIOC_G/S_PARM: OK
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK

Codec ioctls (Input 0):
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
                info: test buftype Video Capture
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Test input 0:

Stream using all formats:
        test MMAP for Format YUYV, Frame Size 640x480:
                Stride 1280, Field None: OK
                Stride 1344, Field None: OK
        test MMAP for Format YUYV, Frame Size 1920x1080:
                Stride 3840, Field None: OK
Total for HwsCapture device /dev/video1: 51, Succeeded: 51, Failed: 0, Warnings: 2


Thanks for taking a look!

Ben

Ben Hoff (2):
  media: pci: add AVMatrix HWS capture driver
  MAINTAINERS: add entry for AVMatrix HWS driver

 MAINTAINERS                            |    6 +
 drivers/media/pci/Kconfig              |    1 +
 drivers/media/pci/Makefile             |    1 +
 drivers/media/pci/hws/Kconfig          |   12 +
 drivers/media/pci/hws/Makefile         |    4 +
 drivers/media/pci/hws/hws.h            |  175 +++
 drivers/media/pci/hws/hws_irq.c        |  268 ++++
 drivers/media/pci/hws/hws_irq.h        |   10 +
 drivers/media/pci/hws/hws_pci.c        |  722 +++++++++++
 drivers/media/pci/hws/hws_reg.h        |  144 +++
 drivers/media/pci/hws/hws_v4l2_ioctl.c |  755 ++++++++++++
 drivers/media/pci/hws/hws_v4l2_ioctl.h |   38 +
 drivers/media/pci/hws/hws_video.c      | 1542 ++++++++++++++++++++++++
 drivers/media/pci/hws/hws_video.h      |   29 +
 14 files changed, 3707 insertions(+)
 create mode 100644 drivers/media/pci/hws/Kconfig
 create mode 100644 drivers/media/pci/hws/Makefile
 create mode 100644 drivers/media/pci/hws/hws.h
 create mode 100644 drivers/media/pci/hws/hws_irq.c
 create mode 100644 drivers/media/pci/hws/hws_irq.h
 create mode 100644 drivers/media/pci/hws/hws_pci.c
 create mode 100644 drivers/media/pci/hws/hws_reg.h
 create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.c
 create mode 100644 drivers/media/pci/hws/hws_v4l2_ioctl.h
 create mode 100644 drivers/media/pci/hws/hws_video.c
 create mode 100644 drivers/media/pci/hws/hws_video.h

-- 
2.51.0

