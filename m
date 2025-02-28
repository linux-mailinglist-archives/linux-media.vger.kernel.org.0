Return-Path: <linux-media+bounces-27235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE317A49A3F
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 14:09:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D96B83BACDA
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2025 13:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465CC26E156;
	Fri, 28 Feb 2025 13:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LZIFMs4b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D6126BDA4
	for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 13:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740748127; cv=none; b=l3DvYJONgLdad9isWzDTCmtPbrA72ajuWPIX7P8AoHrHJ9lmRRuelvSJC+LxNrqZjeH9MM+349wIsJnFVrSu/wAMaYhfPG2Hhclch6PYGjXIjEYhcOabikr7r6Kt0tvutDeooOeEeebnjtmlyfv+9D6IXUpY/NNH3kZ71S+d8kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740748127; c=relaxed/simple;
	bh=F8eNSy1cVFa82SUn9oBgWI8lkzQbk3HPpuXl9dYwcVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HexA5m6EgcRmEdII5dMLhSQ1ykcVAu/WhEZe5DwebPYauXWHfwO1W3E3s9ixbPg+Q0nUoN4qrK9ODgmc4OdMm6WpwS+oq60x6Ihsnocj+9rd7VWaRJY9IcXm5ZSw0awOwWwjhuMvjIudJOfowBMZ66otX+2FR0gH1HV8ta66bSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LZIFMs4b; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e89bce647fso15089186d6.3
        for <linux-media@vger.kernel.org>; Fri, 28 Feb 2025 05:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740748125; x=1741352925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSkWiHfj8zFyE3PkFRF3vUoZzQbgweuuC9qsrjLMGFY=;
        b=LZIFMs4bUUgEHKSRbbRxFCoVlZood/jVIBkoJjCKmBjaO0WA/3Okosfb2jQpjuEu93
         lFlUCYarJ1+pIHA7BalPgEzCAIWdGyea5tzLkH2B7I6ThtowprRXUZTgHaL+Xsm1U97+
         4c50c8PAEFTIPFAiqEqPB95VHIXLHpTx+R11Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740748125; x=1741352925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSkWiHfj8zFyE3PkFRF3vUoZzQbgweuuC9qsrjLMGFY=;
        b=RI3D1gV2YZI+UiVNW4CxdM1q43Z0E2vz+EbEUxOYb8qiLi+LaeSuk0UIX4tRalhf7c
         FlqsIyQGeUJKfMRsjcZ6K6hoOUMiJ/fW9CL0fCXGM4SS9iexuvAKprpkKY6xEsqcMOOm
         IKzMmXP04MD3o8rOzM4G/hoCouUTT8BejKkjyvMoUZPzoGTn42lNLZaad0qLH/fbzR0+
         tKIq6W6rWj3bAMpVwBJEc3PgSpEHb2tpd6dogZYXxXJLTilSdtbOVJhr865/oxd5ryUX
         fqZhRed9hdSMOzOn0IHkzPWTHkCpq00RyuBsF2kxaggD0oo3JnF+WK+oBQ7LjKtEqsN2
         M3yg==
X-Gm-Message-State: AOJu0Yy4Niz9aY6QdtmuxX5SSvMpTFgH8T2TvU/+387naDi6vpSUT7BT
	IZWbA4f/aHtzQi0Nf/WnOVm/sd6a8uubM5dwYHekhHjaPewZEIyIfJao8aYA/Q==
X-Gm-Gg: ASbGncvBoeslFhhVCNwPohXCisOWA6S2iocALt/94T7phnMNhfh/yXEWecfPsqj+O+z
	j+4BENs90HFtddwBV+4ZksypivzI3hRgQ1a4VKi1Pp6tmeP/nfiBYXdnfgh++mhtzAiq6XL8BnJ
	knFUWtYYvYsaFnbHXU15aLUVcWxSKxziHWKbh/EfvuscszOF6YhhO2Vs+SrleK3B3SWJB83NsCW
	y8KqU1DsRifU0VuOG+pNmMlXdtYkkMVS8QLczy0KeWv0deG+s8shTBk46P6HpoJDL1uJgbhfePd
	HfDIfMwMoibDxJ2T+tfmhOJUJZUO8G2uW0uDb5CVCCJX9BMM8s+aC8yRiokoy+n17RCOdfExdFN
	OmkY=
X-Google-Smtp-Source: AGHT+IEW4reuGtssjwVSPN6ulRTiNwk4RQ19u8otKf5gm2KujnCQn8IrfiQIAgJ7r9MSx1uVBYjc4g==
X-Received: by 2002:ad4:5f0a:0:b0:6e4:4331:aadf with SMTP id 6a1803df08f44-6e8a0d05614mr53010216d6.23.1740748124735;
        Fri, 28 Feb 2025 05:08:44 -0800 (PST)
Received: from denia.c.googlers.com (15.237.245.35.bc.googleusercontent.com. [35.245.237.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8976d9fe1sm21938046d6.102.2025.02.28.05.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 05:08:43 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 28 Feb 2025 13:08:39 +0000
Subject: [PATCH 2/2] media: vivid: Introduce VIDEO_VIVID_OSD
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-vivid-osd-v1-2-16963a0a0ab7@chromium.org>
References: <20250228-vivid-osd-v1-0-16963a0a0ab7@chromium.org>
In-Reply-To: <20250228-vivid-osd-v1-0-16963a0a0ab7@chromium.org>
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Slawomir Rosek <srosek@google.com>, 
 Hidenori Kobayashi <hidenorik@google.com>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.1

vivid-osd depends on CONFIG_FB, which can be a large dependency. Introduce
CONFIG_VIDEO_VIVID_OSD to control enabling support for testing output
overlay.

Suggested-by: Slawomir Rosek <srosek@google.com>
Co-developed-by: Slawomir Rosek <srosek@google.com>
Signed-off-by: Slawomir Rosek <srosek@google.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/test-drivers/vivid/Kconfig         | 12 ++++++++++--
 drivers/media/test-drivers/vivid/Makefile        |  5 ++++-
 drivers/media/test-drivers/vivid/vivid-core.c    |  4 ++++
 drivers/media/test-drivers/vivid/vivid-core.h    |  2 ++
 drivers/media/test-drivers/vivid/vivid-osd.h     | 11 +++++++++++
 drivers/media/test-drivers/vivid/vivid-vid-out.c |  7 ++++---
 6 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/Kconfig b/drivers/media/test-drivers/vivid/Kconfig
index ec2e71d76965..e95edc0f22bf 100644
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
index b12ad0152a3e..284a59e97335 100644
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
index 10f5bef3f49c..6af12a76a067 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -125,7 +125,9 @@ MODULE_PARM_DESC(node_types, " node types, default is 0xe1d3d. Bitmask with the
 			     "\t\t    bit 8: Video Output node\n"
 			     "\t\t    bit 10-11: VBI Output node: 0 = none, 1 = raw vbi, 2 = sliced vbi, 3 = both\n"
 			     "\t\t    bit 12: Radio Transmitter node\n"
+#if IS_ENABLED(CONFIG_VIDEO_VIVID_OSD)
 			     "\t\t    bit 16: Framebuffer for testing output overlays\n"
+#endif
 			     "\t\t    bit 17: Metadata Capture node\n"
 			     "\t\t    bit 18: Metadata Output node\n"
 			     "\t\t    bit 19: Touch Capture node\n");
@@ -1071,9 +1073,11 @@ static int vivid_detect_feature_set(struct vivid_dev *dev, int inst,
 	/* do we have a modulator? */
 	*has_modulator = dev->has_radio_tx;
 
+#if IS_ENABLED(CONFIG_VIDEO_VIVID_OSD)
 	if (dev->has_vid_cap)
 		/* do we have a framebuffer for overlay testing? */
 		dev->has_fb = node_type & 0x10000;
+#endif
 
 	/* can we do crop/compose/scaling while capturing? */
 	if (no_error_inj && *ccs_cap == -1)
diff --git a/drivers/media/test-drivers/vivid/vivid-core.h b/drivers/media/test-drivers/vivid/vivid-core.h
index d2d52763b119..72bd48031ba0 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.h
+++ b/drivers/media/test-drivers/vivid/vivid-core.h
@@ -403,9 +403,11 @@ struct vivid_dev {
 	int				display_byte_stride;
 	int				bits_per_pixel;
 	int				bytes_per_pixel;
+#if IS_ENABLED(CONFIG_VIDEO_VIVID_OSD)
 	struct fb_info			fb_info;
 	struct fb_var_screeninfo	fb_defined;
 	struct fb_fix_screeninfo	fb_fix;
+#endif
 
 	/* Error injection */
 	bool				disconnect_error;
diff --git a/drivers/media/test-drivers/vivid/vivid-osd.h b/drivers/media/test-drivers/vivid/vivid-osd.h
index 883459552fa9..6830e6d63dc5 100644
--- a/drivers/media/test-drivers/vivid/vivid-osd.h
+++ b/drivers/media/test-drivers/vivid/vivid-osd.h
@@ -8,8 +8,19 @@
 #ifndef _VIVID_OSD_H_
 #define _VIVID_OSD_H_
 
+#if IS_ENABLED(CONFIG_VIDEO_VIVID_OSD)
 int vivid_fb_init(struct vivid_dev *dev);
 void vivid_fb_deinit(struct vivid_dev *dev);
 void vivid_clear_fb(struct vivid_dev *dev);
+#else
+static inline int vivid_fb_init(struct vivid_dev *dev)
+{
+	return -ENODEV;
+}
+
+static inline void vivid_fb_deinit(struct vivid_dev *dev) {}
+
+static inline void vivid_clear_fb(struct vivid_dev *dev) {}
+#endif
 
 #endif
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-out.c b/drivers/media/test-drivers/vivid/vivid-vid-out.c
index 5ec84db934d6..75b24751b9a4 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-out.c
@@ -907,10 +907,11 @@ int vivid_vid_out_g_fbuf(struct file *file, void *fh,
 	a->base = (void *)dev->video_pbase;
 	a->fmt.width = dev->display_width;
 	a->fmt.height = dev->display_height;
-	if (dev->fb_defined.green.length == 5)
-		a->fmt.pixelformat = V4L2_PIX_FMT_ARGB555;
-	else
+	a->fmt.pixelformat = V4L2_PIX_FMT_ARGB555;
+#if IS_ENABLED(CONFIG_VIDEO_VIVID_FB)
+	if (dev->fb_defined.green.length != 5)
 		a->fmt.pixelformat = V4L2_PIX_FMT_RGB565;
+#endif
 	a->fmt.bytesperline = dev->display_byte_stride;
 	a->fmt.sizeimage = a->fmt.height * a->fmt.bytesperline;
 	a->fmt.field = V4L2_FIELD_NONE;

-- 
2.48.1.711.g2feabab25a-goog


