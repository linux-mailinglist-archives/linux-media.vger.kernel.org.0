Return-Path: <linux-media+bounces-27725-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE6EA54C26
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 14:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAA3B168597
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 13:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42AEF20F087;
	Thu,  6 Mar 2025 13:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Xz5j2vun"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03EE20E334
	for <linux-media@vger.kernel.org>; Thu,  6 Mar 2025 13:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741267666; cv=none; b=oPkjqtUOaOwjXNabHIbGdMmhJZNFLkM9ERfL4LcTXmbrEgyT4rXfYSW2g9QtiwfulGDehLS5csAEcwxnSrubav1Zv61QPMsGc2Rdd8SCGbQYbanRQu7ObZ+35214ezV8nazo5KAp6t4KPjfYPS4uK3t2A35SjgBT6QHTIKUExww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741267666; c=relaxed/simple;
	bh=Jqv28Jm7qzh84U9+lqjLvmKZl6KOXWlqr0fpxkfKg3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VQRv+LZZtgaxoLl9FKVXcZR87vd7OzNrax+Y1oJbMSM5vXLCv8Ajx/VSfi7AHmuMp7aYk/b2aTxILrBC/hCksQwKp1tTD2zt3SrOq6sAnVN9kswmeNwtZds5RqDJXnyvNbmWLSWUP25vW0TAsGhcOK59oWNWLCFfKzW642OVJNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Xz5j2vun; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c3d1664ed5so74314485a.2
        for <linux-media@vger.kernel.org>; Thu, 06 Mar 2025 05:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741267663; x=1741872463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k5fyHJOXDgzeVD5N4PQBEWE96deyhJv7YjSge5olLmc=;
        b=Xz5j2vunbZunWR4eFIIlfpCAHD8yHpmrIuw99rZk1aeDrZWZPh0nlgKwhQMslSjrBP
         gGixiiqmerG50h+eklBpk0BgSjtlpAN8asxALJKqf4ySSuu2HwRstq6gVcTCWwqYjduT
         fchzwktU2PVgEeB0q8gzsashLNtqkISqMjEZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741267663; x=1741872463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5fyHJOXDgzeVD5N4PQBEWE96deyhJv7YjSge5olLmc=;
        b=caHj3ylgR5gkxV1B1itf22ptfqPuRG7M3WasynGb3DOy5qBubBSPvEbxpTZb3UrrWR
         Nny0G0EOgeXeSuzlEFDlby9u6pSEBpGWlN1rvOn+Fq4Fe8BDWv0MRF2O7Zvrs4uhrNLY
         Cw4pS7XV9nzWSRGFhkPB/cFZUjoiRtrwTUxZtBqJV/SwsQWJB87BKMXs5hK8ljP14IV6
         eExzBw4aVnEax/1htGwV7C5aYE2GMK5l23iAonp0fE98tGrdks0Bg0zO4X9A+AE7DxJi
         EhMTw331mo9RH41nPMUpNySheJ1QejRt/Z3KNcZ0CafEIBNFTkvVIKYixafb31uZYEew
         I1/Q==
X-Gm-Message-State: AOJu0YztWufyTzmbkqHEIV7UKVwmmC0q6mUSdIhnvokpGn1fO2y/OcmT
	zwsXMy2ufAsETyoYs6PUtpKX2N9+srscLLhDz9WIOCHW/Xf7NOavU5DLlYqGdt2d2x+8U2Pl0Qg
	rSA==
X-Gm-Gg: ASbGncsx51jIMtjDoPge8YMRTXZTW6PXBORSz3eRC/7iC4AbA2PlIMRKiPveMK2RWgP
	hV46nxo6W/iktYcMm6We2YLFTQKR+GSMBp3mUhQLTmx+kR3LWARRgA4oRWoqyALSO9lBBRtxKRt
	+le2R4WHKTmuqQyi+awRhqQrcdknPJKyDGv/NmOIQ6MUnarTsdaioeACo7Kc8XD/O4SCd0lX647
	ZDOblYtDOefEHCFws3jJRSvCnPT+au0ZRxsKpygMZ5Ed/4xfAyf8QgeZSsOb9zCxFjL7QkX7DYo
	Pm95Fhhow1iNHGrev7EDMI5ahGYYC158lo32119liNQugc2hvPepV1NeTJocCx3DlxcdDDa0sox
	WcSCdmvMh5dISWzSPDHMPuw==
X-Google-Smtp-Source: AGHT+IHq1N4OYDeNoBf2bjvN54GUOf3HZ+YUtSjclkRhroCRuaQUtaXrUfoD8P+jnfCq0HclXR+/KA==
X-Received: by 2002:a05:620a:1b90:b0:7c0:bf09:405d with SMTP id af79cd13be357-7c3d8ec5f60mr1190072485a.50.1741267663492;
        Thu, 06 Mar 2025 05:27:43 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c3e538448fsm91268685a.63.2025.03.06.05.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 05:27:43 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 06 Mar 2025 13:27:31 +0000
Subject: [PATCH v2 2/2] media: vivid: Introduce VIDEO_VIVID_OSD
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-vivid-osd-v2-2-86db53ecb39c@chromium.org>
References: <20250306-vivid-osd-v2-0-86db53ecb39c@chromium.org>
In-Reply-To: <20250306-vivid-osd-v2-0-86db53ecb39c@chromium.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Slawomir Rosek <srosek@google.com>, 
 Hidenori Kobayashi <hidenorik@google.com>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

vivid-osd depends on CONFIG_FB, which can be a large dependency. Introduce
CONFIG_VIDEO_VIVID_OSD to control enabling support for testing output
overlay.

Suggested-by: Slawomir Rosek <srosek@google.com>
Co-developed-by: Slawomir Rosek <srosek@google.com>
Signed-off-by: Slawomir Rosek <srosek@google.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/test-drivers/vivid/Kconfig      | 12 ++++++++++--
 drivers/media/test-drivers/vivid/Makefile     |  5 ++++-
 drivers/media/test-drivers/vivid/vivid-core.c |  4 ++++
 drivers/media/test-drivers/vivid/vivid-core.h |  2 ++
 drivers/media/test-drivers/vivid/vivid-osd.h  | 13 +++++++++++++
 5 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/Kconfig b/drivers/media/test-drivers/vivid/Kconfig
index ec2e71d769659492df698a7e0874ce5e927042ed..e95edc0f22bfb97099f6fdea97402fc8a190f11f 100644
--- a/drivers/media/test-drivers/vivid/Kconfig
+++ b/drivers/media/test-drivers/vivid/Kconfig
@@ -1,9 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config VIDEO_VIVID
 	tristate "Virtual Video Test Driver"
-	depends on VIDEO_DEV && !SPARC32 && !SPARC64 && FB
+	depends on VIDEO_DEV && !SPARC32 && !SPARC64
 	depends on HAS_DMA
-	select FB_IOMEM_HELPERS
 	select FONT_SUPPORT
 	select FONT_8x16
 	select VIDEOBUF2_VMALLOC
@@ -31,6 +30,15 @@ config VIDEO_VIVID_CEC
 	  When selected the vivid module will emulate the optional
 	  HDMI CEC feature.
 
+config VIDEO_VIVID_OSD
+	bool "Enable Framebuffer for testing Output Overlay"
+	depends on VIDEO_VIVID && FB
+	default y
+	select FB_IOMEM_HELPERS
+	help
+	  When selected the vivid module will emulate a Framebuffer for
+	  testing Output Overlay.
+
 config VIDEO_VIVID_MAX_DEVS
 	int "Maximum number of devices"
 	depends on VIDEO_VIVID
diff --git a/drivers/media/test-drivers/vivid/Makefile b/drivers/media/test-drivers/vivid/Makefile
index b12ad0152a3e0fde428bd75fd50137bd2ae4d53c..284a59e9733554addabf73944ac9df5116c6c323 100644
--- a/drivers/media/test-drivers/vivid/Makefile
+++ b/drivers/media/test-drivers/vivid/Makefile
@@ -3,10 +3,13 @@ vivid-objs := vivid-core.o vivid-ctrls.o vivid-vid-common.o vivid-vbi-gen.o \
 		vivid-vid-cap.o vivid-vid-out.o vivid-kthread-cap.o vivid-kthread-out.o \
 		vivid-radio-rx.o vivid-radio-tx.o vivid-radio-common.o \
 		vivid-rds-gen.o vivid-sdr-cap.o vivid-vbi-cap.o vivid-vbi-out.o \
-		vivid-osd.o vivid-meta-cap.o vivid-meta-out.o \
+		vivid-meta-cap.o vivid-meta-out.o \
 		vivid-kthread-touch.o vivid-touch-cap.o
 ifeq ($(CONFIG_VIDEO_VIVID_CEC),y)
   vivid-objs += vivid-cec.o
 endif
+ifeq ($(CONFIG_VIDEO_VIVID_OSD),y)
+  vivid-objs += vivid-osd.o
+endif
 
 obj-$(CONFIG_VIDEO_VIVID) += vivid.o
diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 10f5bef3f49cca4c3a0ae62dd4704ac4180a7c43..8d56168c72aa09f94ba2f0bdb2415e7247e08c14 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -125,7 +125,9 @@ MODULE_PARM_DESC(node_types, " node types, default is 0xe1d3d. Bitmask with the
 			     "\t\t    bit 8: Video Output node\n"
 			     "\t\t    bit 10-11: VBI Output node: 0 = none, 1 = raw vbi, 2 = sliced vbi, 3 = both\n"
 			     "\t\t    bit 12: Radio Transmitter node\n"
+#ifdef CONFIG_VIDEO_VIVID_OSD
 			     "\t\t    bit 16: Framebuffer for testing output overlays\n"
+#endif
 			     "\t\t    bit 17: Metadata Capture node\n"
 			     "\t\t    bit 18: Metadata Output node\n"
 			     "\t\t    bit 19: Touch Capture node\n");
@@ -1071,9 +1073,11 @@ static int vivid_detect_feature_set(struct vivid_dev *dev, int inst,
 	/* do we have a modulator? */
 	*has_modulator = dev->has_radio_tx;
 
+#ifdef CONFIG_VIDEO_VIVID_OSD
 	if (dev->has_vid_cap)
 		/* do we have a framebuffer for overlay testing? */
 		dev->has_fb = node_type & 0x10000;
+#endif
 
 	/* can we do crop/compose/scaling while capturing? */
 	if (no_error_inj && *ccs_cap == -1)
diff --git a/drivers/media/test-drivers/vivid/vivid-core.h b/drivers/media/test-drivers/vivid/vivid-core.h
index d2d52763b11977d39f630dd9ae9bd9fdb288fd51..571a6c2229692109f5d038029bfd9d38d9e53fc3 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.h
+++ b/drivers/media/test-drivers/vivid/vivid-core.h
@@ -403,9 +403,11 @@ struct vivid_dev {
 	int				display_byte_stride;
 	int				bits_per_pixel;
 	int				bytes_per_pixel;
+#ifdef CONFIG_VIDEO_VIVID_OSD
 	struct fb_info			fb_info;
 	struct fb_var_screeninfo	fb_defined;
 	struct fb_fix_screeninfo	fb_fix;
+#endif
 
 	/* Error injection */
 	bool				disconnect_error;
diff --git a/drivers/media/test-drivers/vivid/vivid-osd.h b/drivers/media/test-drivers/vivid/vivid-osd.h
index 9a7ef83e6eb2e44e20d2a2e98303845703375bcb..b6a618834b65c6547d9ad2b47e4675040a3bf726 100644
--- a/drivers/media/test-drivers/vivid/vivid-osd.h
+++ b/drivers/media/test-drivers/vivid/vivid-osd.h
@@ -8,9 +8,22 @@
 #ifndef _VIVID_OSD_H_
 #define _VIVID_OSD_H_
 
+#ifdef CONFIG_VIDEO_VIVID_OSD
 int vivid_fb_init(struct vivid_dev *dev);
 void vivid_fb_deinit(struct vivid_dev *dev);
 void vivid_fb_clear(struct vivid_dev *dev);
 unsigned int vivid_fb_green_bits(struct vivid_dev *dev);
+#else
+static inline int vivid_fb_init(struct vivid_dev *dev)
+{
+	return -ENODEV;
+}
+static inline void vivid_fb_deinit(struct vivid_dev *dev) {}
+static inline void vivid_fb_clear(struct vivid_dev *dev) {}
+static inline unsigned int vivid_fb_green_bits(struct vivid_dev *dev)
+{
+	return 5;
+}
+#endif
 
 #endif

-- 
2.48.1.711.g2feabab25a-goog


