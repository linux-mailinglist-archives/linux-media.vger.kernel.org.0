Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 590D427B18F
	for <lists+linux-media@lfdr.de>; Mon, 28 Sep 2020 18:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbgI1QOX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Sep 2020 12:14:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbgI1QOV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Sep 2020 12:14:21 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DAA8C061755
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2020 09:14:21 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id j2so1990962wrx.7
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2020 09:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+Vy4tbFhiZnXCL0E3AMYHCiY3chg3SbB1i/m8aXRZUY=;
        b=uAFxreBweVDAKq7YB5QA+DbI47ANHgJDRcglu6WYytXDYzajMSAKDVTwNOsDJvH/If
         gCeGYchYP13qArgDF1GzZHOtnGPLSOZ7jXkmz80yURcgTOjCIkymWxrZrEl1AiC5W8M0
         ildXUSHyim/4PCJrSmNNj4RAsg0dzBBHzAzsy7ialR15bEgIG8g3VWUB4QSjwBila/LN
         zeoCqBeB+X8lsgPXhZNjRzH2gd6+aij8mgXk4dz6dROJSxK4aJkzBxult5zU3JiY6K/m
         2R1xk4FlXLPPQDm4NACV+1pWCPZhYeslWlNMfzBJpt8stG5B32Tfi/Dy+uE0jeTKOQBY
         BlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+Vy4tbFhiZnXCL0E3AMYHCiY3chg3SbB1i/m8aXRZUY=;
        b=OikGDsHoxX46P3BwWwS1qgbcQ26QCRl+fu00h7YtuH5h+GZuwQc6X+w6pUH+MgwHWy
         Yzq0CbhMCAfW05RqZev2d66A0DftOQ7HJS0mZRgzkYfXdC5M0JrLK1iKw/99tZSYWQsC
         KPJsgsbHaw7BfoGQMJTk4GQBCCU+goPbgNBHqxG0MCmp7Ox14JSJFIWtB1cbBXx9zfV4
         XAJTBt+4uRtuaTYLhuVW1opNzU2syM+aEdVZchZWMV9pr3cd+iT+hCOnaDw0KfzBYxm+
         fgDt0GU04FmfF+RsKCn0QCcc71VKtpDKh2V3AF5izivn2F3u5/Yj6YVv/YoqtorYED53
         nIUg==
X-Gm-Message-State: AOAM530h3b1B9ypBI/IigSfIKQ+kdivZ2VbSaHsR9yFQJoylIQCs1TmU
        PIwj0P/EzK6Z9In/60MpfgWpPA==
X-Google-Smtp-Source: ABdhPJwh6qB/fJS+Rrw5Tm6ElACV6/cBonPBCezJaouTVyV7sE+GUL/biVXYtaBOhRBLGr6kzeScfA==
X-Received: by 2002:adf:f707:: with SMTP id r7mr2526331wrp.413.1601309659414;
        Mon, 28 Sep 2020 09:14:19 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:19c2:a71d:5af8:dbf6])
        by smtp.gmail.com with ESMTPSA id n4sm2004867wrp.61.2020.09.28.09.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 09:14:18 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] media: meson: Add M2M driver for the Amlogic GE2D Accelerator Unit
Date:   Mon, 28 Sep 2020 18:14:09 +0200
Message-Id: <20200928161411.323581-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928161411.323581-1-narmstrong@baylibre.com>
References: <20200928161411.323581-1-narmstrong@baylibre.com>
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

Is passes v4l2-compliance SHA: ea16a7ef13a902793a5c2626b0cefc4d956147f3, 64 bits, 64-bit time_t

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/media/platform/Kconfig                |   13 +
 drivers/media/platform/Makefile               |    2 +
 drivers/media/platform/meson/ge2d/Makefile    |    3 +
 drivers/media/platform/meson/ge2d/ge2d-regs.h |  360 ++++++
 drivers/media/platform/meson/ge2d/ge2d.c      | 1105 +++++++++++++++++
 5 files changed, 1483 insertions(+)
 create mode 100644 drivers/media/platform/meson/ge2d/Makefile
 create mode 100644 drivers/media/platform/meson/ge2d/ge2d-regs.h
 create mode 100644 drivers/media/platform/meson/ge2d/ge2d.c

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index c57ee78fa99d..a25ff3151340 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -273,6 +273,19 @@ config VIDEO_MEM2MEM_DEINTERLACE
 	help
 	    Generic deinterlacing V4L2 driver.
 
+config VIDEO_MESON_GE2D
+	tristate "Amlogic 2D Graphic Acceleration Unit"
+	depends on VIDEO_DEV && VIDEO_V4L2
+	depends on ARCH_MESON || COMPILE_TEST
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_MEM2MEM_DEV
+	help
+	  This is a v4l2 driver for Amlogic GE2D 2D graphics accelerator.
+	  GE2D is a standalone 2D graphic acceleration unit, with color converter,
+	  image scaling, BitBLT & alpha blending operations.
+
+	  To compile this driver as a module choose m here.
+
 config VIDEO_SAMSUNG_S5P_G2D
 	tristate "Samsung S5P and EXYNOS4 G2D 2d graphics accelerator driver"
 	depends on VIDEO_DEV && VIDEO_V4L2
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 62b6cdc8c730..d47e0dcc65d7 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -80,3 +80,5 @@ obj-$(CONFIG_VIDEO_QCOM_CAMSS)		+= qcom/camss/
 obj-$(CONFIG_VIDEO_QCOM_VENUS)		+= qcom/venus/
 
 obj-y					+= sunxi/
+
+obj-$(CONFIG_VIDEO_MESON_GE2D)		+= meson/ge2d/
diff --git a/drivers/media/platform/meson/ge2d/Makefile b/drivers/media/platform/meson/ge2d/Makefile
new file mode 100644
index 000000000000..450586df27d7
--- /dev/null
+++ b/drivers/media/platform/meson/ge2d/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_VIDEO_MESON_GE2D) += ge2d.o
diff --git a/drivers/media/platform/meson/ge2d/ge2d-regs.h b/drivers/media/platform/meson/ge2d/ge2d-regs.h
new file mode 100644
index 000000000000..2a76dd4c0ccb
--- /dev/null
+++ b/drivers/media/platform/meson/ge2d/ge2d-regs.h
@@ -0,0 +1,360 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2020 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ * Copyright (C) 2017 Amlogic, Inc. All rights reserved.
+ */
+
+#ifndef __GE2D_REGS__
+#define __GE2D_REGS__
+
+/* Registers starts at (GE2D_REG(0x8a0 * 4) */
+#define GE2D_REG(x) ((0x8a0 + (x)) * 4)
+
+#define GE2D_GEN_CTRL0 GE2D_REG(0x00)
+
+#define GE2D_DST_BYTEMASK_ONLY		BIT(31)
+#define GE2D_DST_BITMASK_EN		BIT(30)
+#define GE2D_SRC2_KEY_EN		BIT(29)
+#define GE2D_SRC2_KEY_MODE		BIT(28)
+#define GE2D_SRC1_KEY_EN		BIT(27)
+#define GE2D_SRC1_KEY_MODE		BIT(26)
+#define GE2D_DST1_8B_MODE_SEL		GENMASK(25, 24)
+#define GE2D_DST_CLIP_MODE		BIT(23)
+#define GE2D_SRC2_8B_MODE_SEL		GENMASK(16, 15)
+#define GE2D_SRC2_FILL_MODE		BIT(14)
+#define GE2D_SRC2_PIC_STRUCT		GENMASK(13, 12)
+#define GE2D_SRC2_X_YC_RATIO		BIT(11)
+#define GE2D_SRC1_8B_MODE_SEL		GENMASK(6, 5)
+#define GE2D_SRC1_FILL_MODE		BIT(4)
+#define GE2D_SRC1_LUT_EN		BIT(3)
+#define GE2D_SRC1_PIC_STRUCT		GENMASK(2, 1)
+
+#define GE2D_GEN_CTRL1 GE2D_REG(0x01)
+
+#define GE2D_SOFT_RST			BIT(31)
+#define GE2D_DST_WRITE_RESP_CNT_RST	BIT(30)
+#define GE2D_DST_WRITE_RESP_CNT_ADD_DIS	BIT(29)
+#define GE2D_COLOR_CONVERSION_MODE1	BIT(26)
+#define GE2D_INTERRUPT_CTRL		GENMASK(25, 24)
+#define GE2D_SRC2_BURST_SIZE_CTRL	GENMASK(23, 22)
+#define GE2D_SRC1_BURST_SIZE_CTRL	GENMASK(21, 16)
+#define GE2D_DST1_PIC_STRUCT		GENMASK(15, 14)
+#define GE2D_SRC_RD_CTRL		GENMASK(13, 12)
+#define GE2D_DST2_URGENT_EN		BIT(11)
+#define GE2D_SRC1_URGENT_EN		BIT(10)
+#define GE2D_SRC2_URGENT_EN		BIT(9)
+#define GE2D_DST1_URGENT_EN		BIT(8)
+#define GE2D_SRC1_GB_ALPHA		GENMASK(7, 0)
+
+#define GE2D_GEN_CTRL2 GE2D_REG(0x02)
+
+#define GE2D_ALPHA_CONVERSION_MODE0	BIT(31)
+#define GE2D_COLOR_CONVERSION_MODE0	BIT(30)
+#define GE2D_SRC1_GB_ALPHA_EN		BIT(29)
+#define GE2D_DST1_COLOR_ROUND_MODE	BIT(28)
+#define GE2D_SRC2_COLOR_EXPAND_MODE	BIT(27)
+#define GE2D_SRC2_ALPHA_EXPAND_MODE	BIT(26)
+#define GE2D_SRC1_COLOR_EXPAND_MODE	BIT(25)
+#define GE2D_SRC1_ALPHA_EXPAND_MODE	BIT(24)
+#define GE2D_DST_LITTLE_ENDIAN		BIT(23)
+#define GE2D_DST1_COLOR_MAP		GENMASK(22, 19)
+#define GE2D_ALU_MULT_MODE		BIT(18)
+#define GE2D_DST1_FORMAT		GENMASK(17, 16)
+#define GE2D_SRC2_LITTLE_ENDIAN		BIT(15)
+#define GE2D_SRC2_COLOR_MAP		GENMASK(14, 11)
+#define GE2D_ALPHA_CONVERSION_MODE1	BIT(10)
+#define GE2D_SRC2_FORMAT		GENMASK(9, 8)
+#define GE2D_SRC1_LITTLE_ENDIAN		BIT(7)
+#define GE2D_SRC1_COLOR_MAP		GENMASK(6, 3)
+#define GE2D_SRC1_DEEPCOLOR		BIT(2)
+#define GE2D_SRC1_FORMAT		GENMASK(1, 0)
+
+#define GE2D_FORMAT_8BIT	0
+#define GE2D_FORMAT_16BIT	1
+#define GE2D_FORMAT_24BIT	2
+#define GE2D_FORMAT_32BIT	3
+
+/* 16 bit */
+#define GE2D_COLOR_MAP_YUV422		0
+#define GE2D_COLOR_MAP_RGB655		1
+#define GE2D_COLOR_MAP_YUV655		1
+#define GE2D_COLOR_MAP_RGB844		2
+#define GE2D_COLOR_MAP_YUV844		2
+#define GE2D_COLOR_MAP_RGBA6442		3
+#define GE2D_COLOR_MAP_YUVA6442		3
+#define GE2D_COLOR_MAP_RGBA4444		4
+#define GE2D_COLOR_MAP_YUVA4444		4
+#define GE2D_COLOR_MAP_RGB565		5
+#define GE2D_COLOR_MAP_YUV565		5
+#define GE2D_COLOR_MAP_ARGB4444		6
+#define GE2D_COLOR_MAP_AYUV4444		6
+#define GE2D_COLOR_MAP_ARGB1555		7
+#define GE2D_COLOR_MAP_AYUV1555		7
+#define GE2D_COLOR_MAP_RGBA4642		8
+#define GE2D_COLOR_MAP_YUVA4642		8
+
+/* 24 bit */
+#define GE2D_COLOR_MAP_RGB888		0
+#define GE2D_COLOR_MAP_YUV444		0
+#define GE2D_COLOR_MAP_RGBA5658		1
+#define GE2D_COLOR_MAP_YUVA5658		1
+#define GE2D_COLOR_MAP_ARGB8565		2
+#define GE2D_COLOR_MAP_AYUV8565		2
+#define GE2D_COLOR_MAP_RGBA6666		3
+#define GE2D_COLOR_MAP_YUVA6666		3
+#define GE2D_COLOR_MAP_ARGB6666		4
+#define GE2D_COLOR_MAP_AYUV6666		4
+#define GE2D_COLOR_MAP_BGR888		5
+#define GE2D_COLOR_MAP_VUY888		5
+
+/* 32 bit */
+#define GE2D_COLOR_MAP_RGBA8888		0
+#define GE2D_COLOR_MAP_YUVA8888		0
+#define GE2D_COLOR_MAP_ARGB8888		1
+#define GE2D_COLOR_MAP_AYUV8888		1
+#define GE2D_COLOR_MAP_ABGR8888		2
+#define GE2D_COLOR_MAP_AVUY8888		2
+#define GE2D_COLOR_MAP_BGRA8888		3
+#define GE2D_COLOR_MAP_VUYA8888		3
+
+#define GE2D_CMD_CTRL GE2D_REG(0x03)
+
+#define GE2D_SRC2_FILL_COLOR_EN		BIT(9)
+#define GE2D_SRC1_FILL_COLOR_EN		BIT(8)
+#define GE2D_DST_XY_SWAP		BIT(7)
+#define GE2D_DST_X_REV			BIT(6)
+#define GE2D_DST_Y_REV			BIT(5)
+#define GE2D_SRC2_X_REV			BIT(4)
+#define GE2D_SRC2_Y_REV			BIT(3)
+#define GE2D_SRC1_X_REV			BIT(2)
+#define GE2D_SRC1_Y_REV			BIT(1)
+#define GE2D_CBUS_CMD_WR		BIT(0)
+
+#define GE2D_STATUS0 GE2D_REG(0x04)
+
+#define GE2D_DST_WRITE_RSP_CNT		GENMASK(28, 17)
+#define GE2D_DP_STATUS			GENMASK(16, 7)
+#define GE2D_R1CMD_RDY			BIT(6)
+#define GE2D_R2CMD_RDY			BIT(5)
+#define GE2D_PDPCMD_VALID		BIT(4)
+#define GE2D_DPCMD_RDY			BIT(3)
+#define GE2D_BUF_CMD_VALID		BIT(2)
+#define GE2D_CURR_CMD_VALID		BIT(1)
+#define GE2D_GE2D_BUSY			BIT(0)
+
+#define GE2D_STATUS1 GE2D_REG(0x05)
+
+#define GE2D_WR_DST1_STATUS		GENMASK(29, 16)
+#define GE2D_RD_SRC2_FIFO_EMPTY		BIT(15)
+#define GE2D_RD_SRC2_FIFO_OVERFLOW	BIT(14)
+#define GE2D_RD_SRC2_STATE_Y		GENMASK(13, 12)
+#define GE2D_RD_SRC2_WIN_ERR		BIT(11)
+#define GE2D_RD_SRC2_CMD_BUSY		BIT(10)
+#define GE2D_RD_SRC1_FIFO_EMPTY		BIT(9)
+#define GE2D_RD_SRC1_FIFO_OVERFLOW	BIT(8)
+#define GE2D_RD_SRC1_STATE_CR		GENMASK(7, 6)
+#define GE2D_RD_SRC1_STATE_CB		GENMASK(5, 4)
+#define GE2D_RD_SRC1_STATE_Y		GENMASK(3, 2)
+#define GE2D_RD_SRC1_WIN_ERR		BIT(1)
+#define GE2D_RD_SRC1_CMD_BUSY		BIT(0)
+
+#define GE2D_SRC1_DEF_COLOR GE2D_REG(0x06)
+
+#define GE2D_COLOR_R_Y			GENMASK(31, 24)
+#define GE2D_COLOR_B_CB			GENMASK(23, 16)
+#define GE2D_COLOR_B_CR			GENMASK(15, 8)
+#define GE2D_COLOR_ALPHA		GENMASK(7, 0)
+
+#define GE2D_SRC1_CLIPX_START_END GE2D_REG(0x07)
+
+#define GE2D_START_EXTRA	BIT(31) /* For GE2D_SRC1_CLIPX/Y_START_END */
+#define GE2D_START_EXTRA0	BIT(30)	/* For GE2D_SRC1_X/Y_START_END */
+#define GE2D_START		GENMASK(28, 16)
+#define GE2D_END_EXTRA		BIT(15) /* For GE2D_SRC1_CLIPX/Y_START_END */
+#define GE2D_END_EXTRA0		BIT(14)	/* For GE2D_SRC1_X/Y_START_END */
+#define GE2D_END		GENMASK(12, 0)
+
+#define GE2D_SRC1_CLIPY_START_END GE2D_REG(0x08)
+#define GE2D_SRC1_CANVAS GE2D_REG(0x09)
+
+#define GE2D_SRC1_CANVAS_ADDR	GENMASK(31, 24)
+
+#define GE2D_SRC1_X_START_END GE2D_REG(0x0a)
+#define GE2D_SRC1_Y_START_END GE2D_REG(0x0b)
+#define GE2D_SRC1_LUT_ADDR GE2D_REG(0x0c)
+
+#define GE2D_LUT_READ		BIT(8)
+#define GE2D_LUT_ADDR		GENMASK(7, 0)
+
+#define GE2D_SRC1_LUT_DAT GE2D_REG(0x0d)
+#define GE2D_SRC1_FMT_CTRL GE2D_REG(0x0e)
+#define GE2D_SRC2_DEF_COLOR GE2D_REG(0x0f)
+#define GE2D_SRC2_CLIPX_START_END GE2D_REG(0x10)
+#define GE2D_SRC2_CLIPY_START_END GE2D_REG(0x11)
+#define GE2D_SRC2_X_START_END GE2D_REG(0x12)
+#define GE2D_SRC2_Y_START_END GE2D_REG(0x13)
+#define GE2D_DST_CLIPX_START_END GE2D_REG(0x14)
+#define GE2D_DST_CLIPY_START_END GE2D_REG(0x15)
+#define GE2D_DST_X_START_END GE2D_REG(0x16)
+#define GE2D_DST_Y_START_END GE2D_REG(0x17)
+#define GE2D_SRC2_DST_CANVAS GE2D_REG(0x18)
+
+#define GE2D_DST2_CANVAS_ADDR	GENMASK(23, 16)
+#define GE2D_SRC2_CANVAS_ADDR	GENMASK(15, 8)
+#define GE2D_DST1_CANVAS_ADDR	GENMASK(7, 0)
+
+#define GE2D_VSC_START_PHASE_STEP GE2D_REG(0x19)
+#define GE2D_VSC_PHASE_SLOPE GE2D_REG(0x1a)
+#define GE2D_VSC_INI_CTRL GE2D_REG(0x1b)
+#define GE2D_HSC_START_PHASE_STEP GE2D_REG(0x1c)
+#define GE2D_HSC_PHASE_SLOPE GE2D_REG(0x1d)
+#define GE2D_HSC_INI_CTRL GE2D_REG(0x1e)
+#define GE2D_HSC_ADV_CTRL GE2D_REG(0x1f)
+#define GE2D_SC_MISC_CTRL GE2D_REG(0x20)
+#define GE2D_VSC_NRND_POINT GE2D_REG(0x21)
+#define GE2D_VSC_NRND_PHASE GE2D_REG(0x22)
+#define GE2D_HSC_NRND_POINT GE2D_REG(0x23)
+#define GE2D_HSC_NRND_PHASE GE2D_REG(0x24)
+#define GE2D_MATRIX_PRE_OFFSET GE2D_REG(0x25)
+#define GE2D_MATRIX_COEF00_01 GE2D_REG(0x26)
+#define GE2D_MATRIX_COEF02_10 GE2D_REG(0x27)
+#define GE2D_MATRIX_COEF11_12 GE2D_REG(0x28)
+#define GE2D_MATRIX_COEF20_21 GE2D_REG(0x29)
+#define GE2D_MATRIX_COEF22_CTRL GE2D_REG(0x2a)
+#define GE2D_MATRIX_OFFSET GE2D_REG(0x2b)
+#define GE2D_ALU_OP_CTRL GE2D_REG(0x2c)
+
+#define GE2D_SRC1_COLOR_MULT_ALPHA_SEL	GENMASK(26, 25)
+#define GE2D_SRC2_COLOR_MULT_ALPHA_SEL	BIT(24)
+#define GE2D_ALU_BLEND_MODE		GENMASK(22, 20)
+
+#define OPERATION_ADD           0    /* Cd = Cs*Fs+Cd*Fd */
+#define OPERATION_SUB           1    /* Cd = Cs*Fs-Cd*Fd */
+#define OPERATION_REVERSE_SUB   2    /* Cd = Cd*Fd-Cs*Fs */
+#define OPERATION_MIN           3    /* Cd = Min(Cd*Fd,Cs*Fs) */
+#define OPERATION_MAX           4    /* Cd = Max(Cd*Fd,Cs*Fs) */
+#define OPERATION_LOGIC         5
+
+#define GE2D_ALU_SRC_COLOR_BLEND_FACTOR	GENMASK(19, 16)
+#define GE2D_ALU_DST_COLOR_BLEND_FACTOR	GENMASK(15, 12)
+
+#define COLOR_FACTOR_ZERO                     0
+#define COLOR_FACTOR_ONE                      1
+#define COLOR_FACTOR_SRC_COLOR                2
+#define COLOR_FACTOR_ONE_MINUS_SRC_COLOR      3
+#define COLOR_FACTOR_DST_COLOR                4
+#define COLOR_FACTOR_ONE_MINUS_DST_COLOR      5
+#define COLOR_FACTOR_SRC_ALPHA                6
+#define COLOR_FACTOR_ONE_MINUS_SRC_ALPHA      7
+#define COLOR_FACTOR_DST_ALPHA                8
+#define COLOR_FACTOR_ONE_MINUS_DST_ALPHA      9
+#define COLOR_FACTOR_CONST_COLOR              10
+#define COLOR_FACTOR_ONE_MINUS_CONST_COLOR    11
+#define COLOR_FACTOR_CONST_ALPHA              12
+#define COLOR_FACTOR_ONE_MINUS_CONST_ALPHA    13
+#define COLOR_FACTOR_SRC_ALPHA_SATURATE       14
+
+#define GE2D_ALU_OPERATION_LOGIC	GENMASK(15, 12)
+
+#define LOGIC_OPERATION_CLEAR       0
+#define LOGIC_OPERATION_COPY        1
+#define LOGIC_OPERATION_NOOP        2
+#define LOGIC_OPERATION_SET         3
+#define LOGIC_OPERATION_COPY_INVERT 4
+#define LOGIC_OPERATION_INVERT      5
+#define LOGIC_OPERATION_AND_REVERSE 6
+#define LOGIC_OPERATION_OR_REVERSE  7
+#define LOGIC_OPERATION_AND         8
+#define LOGIC_OPERATION_OR          9
+#define LOGIC_OPERATION_NAND        10
+#define LOGIC_OPERATION_NOR         11
+#define LOGIC_OPERATION_XOR         12
+#define LOGIC_OPERATION_EQUIV       13
+#define LOGIC_OPERATION_AND_INVERT  14
+#define LOGIC_OPERATION_OR_INVERT   15
+
+#define GE2D_ALU_ALPHA_BLEND_MODE	GENMASK(10, 8)
+#define GE2D_ALU_SRC_ALPHA_BLEND_FACTOR	GENMASK(7, 4)
+#define GE2D_ALU_DST_ALPHA_BLEND_FACTOR	GENMASK(3, 0)
+
+#define ALPHA_FACTOR_ZERO                     0
+#define ALPHA_FACTOR_ONE                      1
+#define ALPHA_FACTOR_SRC_ALPHA                2
+#define ALPHA_FACTOR_ONE_MINUS_SRC_ALPHA      3
+#define ALPHA_FACTOR_DST_ALPHA                4
+#define ALPHA_FACTOR_ONE_MINUS_DST_ALPHA      5
+#define ALPHA_FACTOR_CONST_ALPHA              6
+#define ALPHA_FACTOR_ONE_MINUS_CONST_ALPHA    7
+
+#define GE2D_ALU_ALPHA_OPERATION_LOGIC	GENMASK(3, 0)
+
+#define GE2D_ALU_COLOR_OP(__op, __src_factor, __dst_factor) \
+	(FIELD_PREP(GE2D_ALU_BLEND_MODE, __op) | \
+	 FIELD_PREP(GE2D_ALU_SRC_COLOR_BLEND_FACTOR, __src_factor) | \
+	 FIELD_PREP(GE2D_ALU_DST_COLOR_BLEND_FACTOR, __dst_factor))
+
+#define GE2D_ALU_DO_COLOR_OPERATION_LOGIC(__op, __src_factor) \
+	GE2D_ALU_COLOR_OP(OPERATION_LOGIC, __src_factor, __op)
+
+#define GE2D_ALU_ALPHA_OP(__op, __src_factor, __dst_factor) \
+	(FIELD_PREP(GE2D_ALU_ALPHA_BLEND_MODE, __op) | \
+	 FIELD_PREP(GE2D_ALU_SRC_ALPHA_BLEND_FACTOR, __src_factor) | \
+	 FIELD_PREP(GE2D_ALU_DST_ALPHA_BLEND_FACTOR, __dst_factor))
+
+#define GE2D_ALU_DO_ALPHA_OPERATION_LOGIC(__op, __src_factor) \
+	GE2D_ALU_ALPHA_OP(OPERATION_LOGIC, __src_factor, __op)
+
+#define GE2D_ALU_CONST_COLOR GE2D_REG(0x2d)
+#define GE2D_SRC1_KEY GE2D_REG(0x2e)
+#define GE2D_SRC1_KEY_MASK GE2D_REG(0x2f)
+#define GE2D_SRC2_KEY GE2D_REG(0x30)
+#define GE2D_SRC2_KEY_MASK GE2D_REG(0x31)
+#define GE2D_DST_BITMASK GE2D_REG(0x32)
+#define GE2D_DP_ONOFF_CTRL GE2D_REG(0x33)
+#define GE2D_SCALE_COEF_IDX GE2D_REG(0x34)
+#define GE2D_SCALE_COEF GE2D_REG(0x35)
+#define GE2D_SRC_OUTSIDE_ALPHA GE2D_REG(0x36)
+#define GE2D_ANTIFLICK_CTRL0 GE2D_REG(0x38)
+#define GE2D_ANTIFLICK_CTRL1 GE2D_REG(0x39)
+#define GE2D_ANTIFLICK_COLOR_FILT0 GE2D_REG(0x3a)
+#define GE2D_ANTIFLICK_COLOR_FILT1 GE2D_REG(0x3b)
+#define GE2D_ANTIFLICK_COLOR_FILT2 GE2D_REG(0x3c)
+#define GE2D_ANTIFLICK_COLOR_FILT3 GE2D_REG(0x3d)
+#define GE2D_ANTIFLICK_ALPHA_FILT0 GE2D_REG(0x3e)
+#define GE2D_ANTIFLICK_ALPHA_FILT1 GE2D_REG(0x3f)
+#define GE2D_ANTIFLICK_ALPHA_FILT2 GE2D_REG(0x40)
+#define GE2D_ANTIFLICK_ALPHA_FILT3 GE2D_REG(0x41)
+#define GE2D_SRC1_RANGE_MAP_Y_CTRL GE2D_REG(0x43)
+#define GE2D_SRC1_RANGE_MAP_CB_CTRL GE2D_REG(0x44)
+#define GE2D_SRC1_RANGE_MAP_CR_CTRL GE2D_REG(0x45)
+#define GE2D_ARB_BURST_NUM GE2D_REG(0x46)
+#define GE2D_TID_TOKEN GE2D_REG(0x47)
+#define GE2D_GEN_CTRL3 GE2D_REG(0x48)
+
+#define GE2D_DST2_BYTEMASK_VAL		GENMASK(31, 28)
+#define GE2D_DST2_PIC_STRUCT		GENMASK(27, 26)
+#define GE2D_DST2_8B_MODE_SEL		GENMASK(25, 24)
+#define GE2D_DST2_COLOR_MAP		GENMASK(22, 19)
+#define GE2D_DST2_FORMAT		GENMASK(17, 16)
+#define GE2D_DST2_COLOR_ROUND_MODE	BIT(14)
+#define GE2D_DST2_X_DISCARD_MODE	GENMASK(13, 12)
+#define GE2D_DST2_Y_DISCARD_MODE	GENMASK(11, 10)
+#define GE2D_DST2_ENABLE		BIT(8)
+#define GE2D_DST1_X_DISCARD_MODE	GENMASK(5, 4)
+#define GE2D_DST1_Y_DISCARD_MODE	GENMASK(3, 2)
+#define GE2D_DST1_ENABLE		BIT(0)
+
+#define GE2D_STATUS2 GE2D_REG(0x49)
+#define GE2D_GEN_CTRL4 GE2D_REG(0x4a)
+#define GE2D_DST1_BADDR_CTRL  GE2D_REG(0x51)
+#define GE2D_DST1_STRIDE_CTRL GE2D_REG(0x52)
+
+#define GE2D_STRIDE_SIZE	GENMASK(19, 0)
+
+#define GE2D_SRC1_BADDR_CTRL  GE2D_REG(0x53)
+#define GE2D_SRC1_STRIDE_CTRL GE2D_REG(0x54)
+#define GE2D_SRC2_BADDR_CTRL  GE2D_REG(0x55)
+#define GE2D_SRC2_STRIDE_CTRL GE2D_REG(0x56)
+
+#endif /* __GE2D_REGS__ */
diff --git a/drivers/media/platform/meson/ge2d/ge2d.c b/drivers/media/platform/meson/ge2d/ge2d.c
new file mode 100644
index 000000000000..439bdc5151fa
--- /dev/null
+++ b/drivers/media/platform/meson/ge2d/ge2d.c
@@ -0,0 +1,1105 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2020 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/reset.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/timer.h>
+#include <linux/regmap.h>
+
+#include <linux/platform_device.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-ctrls.h>
+#include <media/videobuf2-v4l2.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "ge2d-regs.h"
+
+#define GE2D_NAME	"meson-ge2d"
+
+#define DEFAULT_WIDTH	100
+#define DEFAULT_HEIGHT	100
+
+#define MAX_WIDTH	8191
+#define MAX_HEIGHT	8191
+
+/*
+ * Missing features:
+ * - Scaling
+ * - Simple 1/2 vertical scaling
+ * - YUV input support
+ * - Source global alpha
+ * - Colorspace conversion
+ */
+
+struct ge2d_fmt {
+	u32 fourcc;
+	bool alpha;
+	bool le;
+	unsigned int depth;
+	unsigned int hw_fmt;
+	unsigned int hw_map;
+};
+
+struct ge2d_frame {
+	struct vb2_v4l2_buffer *buf;
+
+	/* Image Format */
+	struct v4l2_pix_format pix_fmt;
+
+	/* Crop */
+	struct v4l2_rect crop;
+
+	/* Image format */
+	const struct ge2d_fmt *fmt;
+};
+
+struct ge2d_ctx {
+	struct v4l2_fh fh;
+	struct meson_ge2d *ge2d;
+	struct ge2d_frame in;
+	struct ge2d_frame out;
+	struct v4l2_ctrl_handler ctrl_handler;
+
+	bool streamon_out, streamon_cap;
+	unsigned long sequence_out, sequence_cap;
+
+	/* Control values */
+	u32 hflip;
+	u32 vflip;
+	u32 xy_swap;
+};
+
+struct meson_ge2d {
+	struct v4l2_device v4l2_dev;
+	struct v4l2_m2m_dev *m2m_dev;
+	struct video_device *vfd;
+
+	struct device *dev;
+	struct regmap *map;
+	struct clk *clk;
+
+	/* vb2 queue lock */
+	struct mutex mutex;
+	/* device access spinlock */
+	spinlock_t ctrl_lock;
+
+	struct ge2d_ctx *curr;
+};
+
+static void vidioc_setup_cap_fmt(struct ge2d_ctx *ctx, struct v4l2_pix_format *f);
+
+#define FMT(_fourcc, _alpha, _depth, _map)		\
+{							\
+	.fourcc = _fourcc,				\
+	.alpha = (_alpha),				\
+	.depth = (_depth),				\
+	.hw_fmt = GE2D_FORMAT_ ## _depth ## BIT,	\
+	.hw_map = GE2D_COLOR_MAP_ ## _map,		\
+}
+
+/* TOFIX Handle the YUV input formats */
+static const struct ge2d_fmt formats[] = {
+	/*  FOURCC Alpha  HW FMT  HW MAP */
+	FMT(V4L2_PIX_FMT_XRGB32, false, 32, BGRA8888),
+	FMT(V4L2_PIX_FMT_RGB32, true, 32, BGRA8888),
+	FMT(V4L2_PIX_FMT_ARGB32, true, 32, BGRA8888),
+	FMT(V4L2_PIX_FMT_RGBX32, false, 32, ABGR8888),
+	FMT(V4L2_PIX_FMT_RGBA32, true, 32, ABGR8888),
+	FMT(V4L2_PIX_FMT_BGRX32, false, 32, RGBA8888),
+	FMT(V4L2_PIX_FMT_BGRA32, true, 32, RGBA8888),
+	FMT(V4L2_PIX_FMT_BGR32, true, 32, ARGB8888),
+	FMT(V4L2_PIX_FMT_ABGR32, true, 32, ARGB8888),
+	FMT(V4L2_PIX_FMT_XBGR32, false, 32, ARGB8888),
+
+	FMT(V4L2_PIX_FMT_RGB24, false, 24, BGR888),
+	FMT(V4L2_PIX_FMT_BGR24, false, 24, RGB888),
+
+	FMT(V4L2_PIX_FMT_XRGB555X, false, 16, ARGB1555),
+	FMT(V4L2_PIX_FMT_ARGB555X, true, 16, ARGB1555),
+	FMT(V4L2_PIX_FMT_RGB565, false, 16, RGB565),
+	FMT(V4L2_PIX_FMT_RGBX444, false, 16, RGBA4444),
+	FMT(V4L2_PIX_FMT_RGBA444, true, 16, RGBA4444),
+	FMT(V4L2_PIX_FMT_XRGB444, false, 16, ARGB4444),
+	FMT(V4L2_PIX_FMT_ARGB444, true, 16, ARGB4444),
+};
+
+#define NUM_FORMATS ARRAY_SIZE(formats)
+
+static const struct ge2d_fmt *find_fmt(struct v4l2_format *f)
+{
+	unsigned int i;
+
+	for (i = 0; i < NUM_FORMATS; i++) {
+		if (formats[i].fourcc == f->fmt.pix.pixelformat)
+			return &formats[i];
+	}
+
+	/*
+	 * TRY_FMT/S_FMT should never return an error when the requested format
+	 * is not supported. Drivers should always return a valid format,
+	 * preferably a format that is as widely supported by applications as
+	 * possible.
+	 */
+	return &formats[0];
+}
+
+static struct ge2d_frame *get_frame(struct ge2d_ctx *ctx,
+				    enum v4l2_buf_type type)
+{
+	switch (type) {
+	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
+		return &ctx->in;
+	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
+		return &ctx->out;
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+}
+
+static void ge2d_hw_start(struct meson_ge2d *ge2d)
+{
+	struct ge2d_ctx *ctx = ge2d->curr;
+	u32 reg;
+
+	/* Reset */
+	regmap_update_bits(ge2d->map, GE2D_GEN_CTRL1,
+			   GE2D_SOFT_RST, GE2D_SOFT_RST);
+	regmap_update_bits(ge2d->map, GE2D_GEN_CTRL1,
+			   GE2D_SOFT_RST, 0);
+
+	usleep_range(100, 200);
+
+	/* Implement CANVAS for non-AXG */
+	regmap_write(ge2d->map, GE2D_SRC1_BADDR_CTRL,
+		     (vb2_dma_contig_plane_dma_addr(&ctx->in.buf->vb2_buf, 0) + 7) >> 3);
+	regmap_write(ge2d->map, GE2D_SRC1_STRIDE_CTRL,
+		     (ctx->in.pix_fmt.bytesperline + 7) >> 3);
+	regmap_write(ge2d->map, GE2D_SRC2_BADDR_CTRL,
+		     (vb2_dma_contig_plane_dma_addr(&ctx->out.buf->vb2_buf, 0) + 7) >> 3);
+	regmap_write(ge2d->map, GE2D_SRC2_STRIDE_CTRL,
+		     (ctx->out.pix_fmt.bytesperline + 7) >> 3);
+	regmap_write(ge2d->map, GE2D_DST1_BADDR_CTRL,
+		     (vb2_dma_contig_plane_dma_addr(&ctx->out.buf->vb2_buf, 0) + 7) >> 3);
+	regmap_write(ge2d->map, GE2D_DST1_STRIDE_CTRL,
+		     (ctx->out.pix_fmt.bytesperline + 7) >> 3);
+
+	regmap_write(ge2d->map, GE2D_GEN_CTRL0, 0);
+	regmap_write(ge2d->map, GE2D_GEN_CTRL1,
+		     FIELD_PREP(GE2D_INTERRUPT_CTRL, 2) |
+		     FIELD_PREP(GE2D_SRC2_BURST_SIZE_CTRL, 3) |
+		     FIELD_PREP(GE2D_SRC1_BURST_SIZE_CTRL, 0x3f));
+
+	regmap_write(ge2d->map, GE2D_GEN_CTRL2,
+		     GE2D_SRC1_LITTLE_ENDIAN |
+		     GE2D_SRC2_LITTLE_ENDIAN |
+		     GE2D_DST_LITTLE_ENDIAN |
+		     FIELD_PREP(GE2D_DST1_COLOR_MAP, ctx->out.fmt->hw_map) |
+		     FIELD_PREP(GE2D_DST1_FORMAT, ctx->out.fmt->hw_fmt) |
+		     FIELD_PREP(GE2D_SRC2_COLOR_MAP, ctx->out.fmt->hw_map) |
+		     FIELD_PREP(GE2D_SRC2_FORMAT, ctx->out.fmt->hw_fmt) |
+		     FIELD_PREP(GE2D_SRC1_COLOR_MAP, ctx->in.fmt->hw_map) |
+		     FIELD_PREP(GE2D_SRC1_FORMAT, ctx->in.fmt->hw_fmt));
+	regmap_write(ge2d->map, GE2D_GEN_CTRL3,
+		     GE2D_DST1_ENABLE);
+
+	regmap_write(ge2d->map, GE2D_SRC1_CLIPY_START_END,
+		     FIELD_PREP(GE2D_START, ctx->in.crop.top) |
+		     FIELD_PREP(GE2D_END, ctx->in.crop.top + ctx->in.crop.height));
+	regmap_write(ge2d->map, GE2D_SRC1_CLIPX_START_END,
+		     FIELD_PREP(GE2D_START, ctx->in.crop.left) |
+		     FIELD_PREP(GE2D_END, ctx->in.crop.left + ctx->in.crop.width));
+	regmap_write(ge2d->map, GE2D_SRC2_CLIPY_START_END,
+		     FIELD_PREP(GE2D_START, ctx->out.crop.top) |
+		     FIELD_PREP(GE2D_END, ctx->out.crop.top + ctx->out.crop.height));
+	regmap_write(ge2d->map, GE2D_SRC2_CLIPX_START_END,
+		     FIELD_PREP(GE2D_START, ctx->out.crop.left) |
+		     FIELD_PREP(GE2D_END, ctx->out.crop.left + ctx->out.crop.width));
+	regmap_write(ge2d->map, GE2D_DST_CLIPY_START_END,
+		     FIELD_PREP(GE2D_START, ctx->out.crop.top) |
+		     FIELD_PREP(GE2D_END, ctx->out.crop.top + ctx->out.crop.height));
+	regmap_write(ge2d->map, GE2D_DST_CLIPX_START_END,
+		     FIELD_PREP(GE2D_START, ctx->out.crop.left) |
+		     FIELD_PREP(GE2D_END, ctx->out.crop.left + ctx->out.crop.width));
+
+	regmap_write(ge2d->map, GE2D_SRC1_Y_START_END,
+		     FIELD_PREP(GE2D_END, ctx->in.pix_fmt.height));
+	regmap_write(ge2d->map, GE2D_SRC1_X_START_END,
+		     FIELD_PREP(GE2D_END, ctx->in.pix_fmt.width));
+	regmap_write(ge2d->map, GE2D_SRC2_Y_START_END,
+		     FIELD_PREP(GE2D_END, ctx->out.pix_fmt.height));
+	regmap_write(ge2d->map, GE2D_SRC2_X_START_END,
+		     FIELD_PREP(GE2D_END, ctx->out.pix_fmt.width));
+	regmap_write(ge2d->map, GE2D_DST_Y_START_END,
+		     FIELD_PREP(GE2D_END, ctx->out.pix_fmt.height));
+	regmap_write(ge2d->map, GE2D_DST_X_START_END,
+		     FIELD_PREP(GE2D_END, ctx->out.pix_fmt.width));
+
+	/* Color, no blend, use source color */
+	reg = GE2D_ALU_DO_COLOR_OPERATION_LOGIC(LOGIC_OPERATION_COPY,
+						COLOR_FACTOR_SRC_COLOR);
+
+	if (ctx->in.fmt->alpha && ctx->out.fmt->alpha)
+		/* Take source alpha */
+		reg |= GE2D_ALU_DO_ALPHA_OPERATION_LOGIC(LOGIC_OPERATION_COPY,
+							 COLOR_FACTOR_SRC_ALPHA);
+	else if (!ctx->out.fmt->alpha)
+		/* Set alpha to 0 */
+		reg |= GE2D_ALU_DO_ALPHA_OPERATION_LOGIC(LOGIC_OPERATION_SET,
+							 COLOR_FACTOR_ZERO);
+	else
+		/* Keep original alpha */
+		reg |= GE2D_ALU_DO_ALPHA_OPERATION_LOGIC(LOGIC_OPERATION_COPY,
+							 COLOR_FACTOR_DST_ALPHA);
+
+	regmap_write(ge2d->map, GE2D_ALU_OP_CTRL, reg);
+
+	/* Start */
+	regmap_write(ge2d->map, GE2D_CMD_CTRL,
+		     (ctx->xy_swap ? GE2D_DST_XY_SWAP : 0) |
+		     (ctx->hflip ? GE2D_SRC1_Y_REV : 0) |
+		     (ctx->vflip ? GE2D_SRC1_X_REV : 0) |
+		     GE2D_CBUS_CMD_WR);
+}
+
+static void device_run(void *priv)
+{
+	struct ge2d_ctx *ctx = priv;
+	struct meson_ge2d *ge2d = ctx->ge2d;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ge2d->ctrl_lock, flags);
+
+	ge2d->curr = ctx;
+
+	ctx->in.buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+	ctx->out.buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
+
+	ge2d_hw_start(ge2d);
+
+	spin_unlock_irqrestore(&ge2d->ctrl_lock, flags);
+}
+
+static irqreturn_t ge2d_isr(int irq, void *priv)
+{
+	struct meson_ge2d *ge2d = priv;
+	u32 intr;
+
+	regmap_read(ge2d->map, GE2D_STATUS0, &intr);
+
+	if (!(intr & GE2D_GE2D_BUSY)) {
+		struct vb2_v4l2_buffer *src, *dst;
+		struct ge2d_ctx *ctx = ge2d->curr;
+
+		ge2d->curr = NULL;
+
+		src = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+		dst = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+
+		src->sequence = ctx->sequence_out++;
+		dst->sequence = ctx->sequence_cap++;
+
+		dst->timecode = src->timecode;
+		dst->vb2_buf.timestamp = src->vb2_buf.timestamp;
+		dst->flags = src->flags;
+
+		v4l2_m2m_buf_done(src, VB2_BUF_STATE_DONE);
+		v4l2_m2m_buf_done(dst, VB2_BUF_STATE_DONE);
+		v4l2_m2m_job_finish(ge2d->m2m_dev, ctx->fh.m2m_ctx);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static const struct v4l2_m2m_ops ge2d_m2m_ops = {
+	.device_run = device_run,
+};
+
+static int ge2d_queue_setup(struct vb2_queue *vq,
+			    unsigned int *nbuffers, unsigned int *nplanes,
+			    unsigned int sizes[], struct device *alloc_devs[])
+{
+	struct ge2d_ctx *ctx = vb2_get_drv_priv(vq);
+	struct ge2d_frame *f = get_frame(ctx, vq->type);
+
+	if (IS_ERR(f))
+		return PTR_ERR(f);
+
+	if (*nplanes)
+		return sizes[0] < f->pix_fmt.sizeimage ? -EINVAL : 0;
+
+	sizes[0] = f->pix_fmt.sizeimage;
+	*nplanes = 1;
+
+	return 0;
+}
+
+static int ge2d_buf_prepare(struct vb2_buffer *vb)
+{
+	struct ge2d_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct ge2d_frame *f = get_frame(ctx, vb->vb2_queue->type);
+
+	if (IS_ERR(f))
+		return PTR_ERR(f);
+
+	vbuf->field = V4L2_FIELD_NONE;
+
+	vb2_set_plane_payload(vb, 0, f->pix_fmt.sizeimage);
+
+	return 0;
+}
+
+static void ge2d_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct ge2d_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+
+	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
+}
+
+static int ge2d_start_streaming(struct vb2_queue *vq, unsigned int count)
+{
+	struct ge2d_ctx *ctx = vb2_get_drv_priv(vq);
+
+	if (V4L2_TYPE_IS_OUTPUT(vq->type))
+		ctx->streamon_out = true;
+	else
+		ctx->streamon_cap = true;
+
+	if (!ctx->streamon_out)
+		return 0;
+
+	ctx->sequence_out = 0;
+	ctx->sequence_cap = 0;
+
+	return 0;
+}
+
+static void ge2d_stop_streaming(struct vb2_queue *vq)
+{
+	struct ge2d_ctx *ctx = vb2_get_drv_priv(vq);
+	struct vb2_v4l2_buffer *vbuf;
+
+	if (V4L2_TYPE_IS_OUTPUT(vq->type))
+		ctx->streamon_out = false;
+	else
+		ctx->streamon_cap = false;
+
+	for (;;) {
+		if (V4L2_TYPE_IS_OUTPUT(vq->type))
+			vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+		else
+			vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+		if (!vbuf)
+			break;
+		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+	}
+}
+
+static const struct vb2_ops ge2d_qops = {
+	.queue_setup = ge2d_queue_setup,
+	.buf_prepare = ge2d_buf_prepare,
+	.buf_queue = ge2d_buf_queue,
+	.start_streaming = ge2d_start_streaming,
+	.stop_streaming = ge2d_stop_streaming,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+};
+
+static int
+queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
+{
+	struct ge2d_ctx *ctx = priv;
+	int ret;
+
+	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	src_vq->drv_priv = ctx;
+	src_vq->ops = &ge2d_qops;
+	src_vq->mem_ops = &vb2_dma_contig_memops;
+	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->lock = &ctx->ge2d->mutex;
+	src_vq->dev = ctx->ge2d->v4l2_dev.dev;
+
+	ret = vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	dst_vq->drv_priv = ctx;
+	dst_vq->ops = &ge2d_qops;
+	dst_vq->mem_ops = &vb2_dma_contig_memops;
+	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->lock = &ctx->ge2d->mutex;
+	dst_vq->dev = ctx->ge2d->v4l2_dev.dev;
+
+	return vb2_queue_init(dst_vq);
+}
+
+static int ge2d_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct ge2d_ctx *ctx = container_of(ctrl->handler, struct ge2d_ctx,
+					   ctrl_handler);
+	struct v4l2_pix_format fmt;
+	struct vb2_queue *vq;
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctx->ge2d->ctrl_lock, flags);
+	switch (ctrl->id) {
+	case V4L2_CID_HFLIP:
+		ctx->hflip = ctrl->val;
+		break;
+	case V4L2_CID_VFLIP:
+		ctx->vflip = ctrl->val;
+		break;
+	case V4L2_CID_ROTATE:
+		vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+		if (vb2_is_busy(vq))
+			return -EBUSY;
+
+		if (ctrl->val == 90) {
+			ctx->hflip = 0;
+			ctx->vflip = 0;
+			ctx->xy_swap = 1;
+		} else if (ctrl->val == 180) {
+			ctx->hflip = 1;
+			ctx->vflip = 1;
+			ctx->xy_swap = 0;
+		} else if (ctrl->val == 270) {
+			ctx->hflip = 1;
+			ctx->vflip = 1;
+			ctx->xy_swap = 1;
+		} else {
+			ctx->hflip = 0;
+			ctx->vflip = 0;
+			ctx->xy_swap = 0;
+		}
+
+		vidioc_setup_cap_fmt(ctx, &fmt);
+
+		if (fmt.width != ctx->out.pix_fmt.width ||
+		    fmt.height != ctx->out.pix_fmt.width ||
+		    fmt.bytesperline > ctx->out.pix_fmt.bytesperline ||
+		    fmt.sizeimage > ctx->out.pix_fmt.sizeimage)
+			memcpy(&ctx->out.pix_fmt, &fmt, sizeof(struct v4l2_pix_format));
+
+		break;
+	}
+	spin_unlock_irqrestore(&ctx->ge2d->ctrl_lock, flags);
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops ge2d_ctrl_ops = {
+	.s_ctrl = ge2d_s_ctrl,
+};
+
+static int ge2d_setup_ctrls(struct ge2d_ctx *ctx)
+{
+	struct meson_ge2d *ge2d = ctx->ge2d;
+
+	v4l2_ctrl_handler_init(&ctx->ctrl_handler, 4);
+
+	v4l2_ctrl_new_std(&ctx->ctrl_handler, &ge2d_ctrl_ops,
+			  V4L2_CID_HFLIP, 0, 1, 1, 0);
+
+	v4l2_ctrl_new_std(&ctx->ctrl_handler, &ge2d_ctrl_ops,
+			  V4L2_CID_VFLIP, 0, 1, 1, 0);
+
+	v4l2_ctrl_new_std(&ctx->ctrl_handler, &ge2d_ctrl_ops,
+			  V4L2_CID_ROTATE, 0, 270, 90, 0);
+
+	if (ctx->ctrl_handler.error) {
+		int err = ctx->ctrl_handler.error;
+
+		v4l2_err(&ge2d->v4l2_dev, "%s failed\n", __func__);
+		v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+		return err;
+	}
+
+	return 0;
+}
+
+static const struct ge2d_frame def_frame = {
+	.pix_fmt = {
+		.width = DEFAULT_WIDTH,
+		.height = DEFAULT_HEIGHT,
+		.field = V4L2_FIELD_NONE,
+	},
+	.crop.left = 0,
+	.crop.top = 0,
+	.crop.width = DEFAULT_WIDTH,
+	.crop.height = DEFAULT_HEIGHT,
+	.fmt = &formats[0],
+};
+
+static int ge2d_open(struct file *file)
+{
+	struct meson_ge2d *ge2d = video_drvdata(file);
+	struct ge2d_ctx *ctx = NULL;
+	int ret = 0;
+
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	ctx->ge2d = ge2d;
+
+	/* Set default formats */
+	ctx->in = def_frame;
+	ctx->out = def_frame;
+
+	/* Initialize default frames */
+	ctx->in.pix_fmt.bytesperline = ALIGN((ctx->in.pix_fmt.width * ctx->in.fmt->depth) / 8, 8);
+	ctx->in.pix_fmt.sizeimage = ctx->in.pix_fmt.height * ctx->in.pix_fmt.bytesperline;
+	memcpy(&ctx->out.pix_fmt, &ctx->in.pix_fmt, sizeof(struct v4l2_pix_format));
+
+	if (mutex_lock_interruptible(&ge2d->mutex)) {
+		kfree(ctx);
+		return -ERESTARTSYS;
+	}
+	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(ge2d->m2m_dev, ctx, &queue_init);
+	if (IS_ERR(ctx->fh.m2m_ctx)) {
+		ret = PTR_ERR(ctx->fh.m2m_ctx);
+		mutex_unlock(&ge2d->mutex);
+		kfree(ctx);
+		return ret;
+	}
+	v4l2_fh_init(&ctx->fh, video_devdata(file));
+	file->private_data = &ctx->fh;
+	v4l2_fh_add(&ctx->fh);
+
+	ge2d_setup_ctrls(ctx);
+
+	/* Write the default values to the ctx struct */
+	v4l2_ctrl_handler_setup(&ctx->ctrl_handler);
+
+	ctx->fh.ctrl_handler = &ctx->ctrl_handler;
+	mutex_unlock(&ge2d->mutex);
+
+	return 0;
+}
+
+static int ge2d_release(struct file *file)
+{
+	struct ge2d_ctx *ctx =
+		container_of(file->private_data, struct ge2d_ctx, fh);
+	struct meson_ge2d *ge2d = ctx->ge2d;
+
+	mutex_lock(&ge2d->mutex);
+
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+
+	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_exit(&ctx->fh);
+	kfree(ctx);
+
+	mutex_unlock(&ge2d->mutex);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations ge2d_fops = {
+	.owner = THIS_MODULE,
+	.open = ge2d_open,
+	.release = ge2d_release,
+	.poll = v4l2_m2m_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap = v4l2_m2m_fop_mmap,
+};
+
+static int
+vidioc_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, GE2D_NAME, sizeof(cap->driver));
+	strscpy(cap->card, GE2D_NAME, sizeof(cap->card));
+	strscpy(cap->bus_info, "platform:" GE2D_NAME, sizeof(cap->bus_info));
+
+	return 0;
+}
+
+static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f)
+{
+	const struct ge2d_fmt *fmt;
+
+	if (f->index >= NUM_FORMATS)
+		return -EINVAL;
+
+	fmt = &formats[f->index];
+	f->pixelformat = fmt->fourcc;
+
+	return 0;
+}
+
+static int vidioc_g_selection(struct file *file, void *priv,
+			      struct v4l2_selection *s)
+{
+	struct ge2d_ctx *ctx = priv;
+	struct ge2d_frame *f;
+	bool use_frame = false;
+
+	f = get_frame(ctx, s->type);
+	if (IS_ERR(f))
+		return PTR_ERR(f);
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+		if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+			return -EINVAL;
+		break;
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
+			return -EINVAL;
+		break;
+	case V4L2_SEL_TGT_COMPOSE:
+		if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+			return -EINVAL;
+		use_frame = true;
+		break;
+	case V4L2_SEL_TGT_CROP:
+		if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
+			return -EINVAL;
+		use_frame = true;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (use_frame) {
+		s->r = f->crop;
+	} else {
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = f->pix_fmt.width;
+		s->r.height = f->pix_fmt.height;
+	}
+
+	return 0;
+}
+
+static int vidioc_s_selection(struct file *file, void *priv,
+			      struct v4l2_selection *s)
+{
+	struct ge2d_ctx *ctx = priv;
+	struct meson_ge2d *ge2d = ctx->ge2d;
+	struct ge2d_frame *f;
+	int ret = 0;
+
+	f = get_frame(ctx, s->type);
+	if (IS_ERR(f))
+		return PTR_ERR(f);
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_COMPOSE:
+		/*
+		 * COMPOSE target is only valid for capture buffer type, return
+		 * error for output buffer type
+		 */
+		if (s->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+			return -EINVAL;
+		break;
+	case V4L2_SEL_TGT_CROP:
+		/*
+		 * CROP target is only valid for output buffer type, return
+		 * error for capture buffer type
+		 */
+		if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
+			return -EINVAL;
+		break;
+	/*
+	 * bound and default crop/compose targets are invalid targets to
+	 * try/set
+	 */
+	default:
+		return -EINVAL;
+	}
+
+	if (s->r.top < 0 || s->r.left < 0) {
+		v4l2_err(&ge2d->v4l2_dev,
+			 "doesn't support negative values for top & left.\n");
+		return -EINVAL;
+	}
+
+	if (s->r.left + s->r.width > f->pix_fmt.width ||
+	    s->r.top + s->r.height > f->pix_fmt.height ||
+	    s->r.width < 0 || s->r.height < 0) {
+		v4l2_err(&ge2d->v4l2_dev, "unsupported crop value.\n");
+		return -EINVAL;
+	}
+
+	f->crop = s->r;
+
+	return ret;
+}
+
+static void vidioc_setup_cap_fmt(struct ge2d_ctx *ctx, struct v4l2_pix_format *f)
+{
+	struct ge2d_frame *frm_out = get_frame(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
+
+	memcpy(f, &frm_out->pix_fmt, sizeof(struct v4l2_pix_format));
+
+	if (ctx->xy_swap) {
+		f->width = frm_out->pix_fmt.height;
+		f->height = frm_out->pix_fmt.width;
+	}
+}
+
+static int vidioc_try_fmt_cap(struct file *file, void *priv, struct v4l2_format *f)
+{
+	const struct ge2d_fmt *fmt = find_fmt(f);
+	struct ge2d_ctx *ctx = priv;
+	struct v4l2_pix_format fmt_cap;
+
+	vidioc_setup_cap_fmt(ctx, &fmt_cap);
+
+	fmt_cap.pixelformat = fmt->fourcc;
+
+	fmt_cap.bytesperline = max(f->fmt.pix.bytesperline,
+				   ALIGN((fmt_cap.width * fmt->depth) >> 3, 8));
+
+	fmt_cap.sizeimage = max(f->fmt.pix.sizeimage,
+				fmt_cap.height * fmt_cap.bytesperline);
+
+	memcpy(&f->fmt.pix, &fmt_cap, sizeof(struct v4l2_pix_format));
+
+	return 0;
+}
+
+static int vidioc_s_fmt_cap(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct ge2d_ctx *ctx = priv;
+	struct meson_ge2d *ge2d = ctx->ge2d;
+	struct vb2_queue *vq;
+	struct ge2d_frame *frm;
+	int ret = 0;
+
+	/* Adjust all values accordingly to the hardware capabilities
+	 * and chosen format.
+	 */
+	ret = vidioc_try_fmt_cap(file, priv, f);
+	if (ret)
+		return ret;
+
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
+	if (vb2_is_busy(vq)) {
+		v4l2_err(&ge2d->v4l2_dev, "queue (%d) bust\n", f->type);
+		return -EBUSY;
+	}
+
+	frm = get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	if (IS_ERR(frm))
+		return PTR_ERR(frm);
+
+	memcpy(&frm->pix_fmt, &f->fmt.pix, sizeof(struct v4l2_pix_format));
+	frm->fmt = find_fmt(f);
+	f->fmt.pix.pixelformat = frm->fmt->fourcc;
+
+	/* Reset crop settings */
+	frm->crop.left = 0;
+	frm->crop.top = 0;
+	frm->crop.width = frm->pix_fmt.width;
+	frm->crop.height = frm->pix_fmt.height;
+
+	return 0;
+}
+
+static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct ge2d_ctx *ctx = priv;
+	struct vb2_queue *vq;
+	struct ge2d_frame *frm;
+
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
+	if (!vq)
+		return -EINVAL;
+
+	frm = get_frame(ctx, f->type);
+	if (IS_ERR(frm))
+		return PTR_ERR(frm);
+
+	memcpy(&f->fmt.pix, &frm->pix_fmt, sizeof(struct v4l2_pix_format));
+	f->fmt.pix.pixelformat = frm->fmt->fourcc;
+
+	return 0;
+}
+
+static int vidioc_try_fmt_out(struct file *file, void *priv, struct v4l2_format *f)
+{
+	const struct ge2d_fmt *fmt = find_fmt(f);
+
+	f->fmt.pix.field = V4L2_FIELD_NONE;
+	f->fmt.pix.pixelformat = fmt->fourcc;
+
+	if (f->fmt.pix.width > MAX_WIDTH)
+		f->fmt.pix.width = MAX_WIDTH;
+	if (f->fmt.pix.height > MAX_HEIGHT)
+		f->fmt.pix.height = MAX_HEIGHT;
+
+	if (f->fmt.pix.width < 0)
+		f->fmt.pix.width = 0;
+	if (f->fmt.pix.height < 0)
+		f->fmt.pix.height = 0;
+
+	f->fmt.pix.bytesperline = max(f->fmt.pix.bytesperline,
+				      ALIGN((f->fmt.pix.width * fmt->depth) >> 3, 8));
+
+	f->fmt.pix.sizeimage = max(f->fmt.pix.sizeimage,
+				   f->fmt.pix.height * f->fmt.pix.bytesperline);
+
+	return 0;
+}
+
+static int vidioc_s_fmt_out(struct file *file, void *priv, struct v4l2_format *f)
+{
+	struct ge2d_ctx *ctx = priv;
+	struct meson_ge2d *ge2d = ctx->ge2d;
+	struct vb2_queue *vq;
+	struct ge2d_frame *frm, *frm_cap;
+	int ret = 0;
+
+	/* Adjust all values accordingly to the hardware capabilities
+	 * and chosen format.
+	 */
+	ret = vidioc_try_fmt_out(file, priv, f);
+	if (ret)
+		return ret;
+
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
+	if (vb2_is_busy(vq)) {
+		v4l2_err(&ge2d->v4l2_dev, "queue (%d) bust\n", f->type);
+		return -EBUSY;
+	}
+
+	frm = get_frame(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
+	if (IS_ERR(frm))
+		return PTR_ERR(frm);
+	frm_cap = get_frame(ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	if (IS_ERR(frm_cap))
+		return PTR_ERR(frm_cap);
+
+	memcpy(&frm->pix_fmt, &f->fmt.pix, sizeof(struct v4l2_pix_format));
+	frm->fmt = find_fmt(f);
+	f->fmt.pix.pixelformat = frm->fmt->fourcc;
+
+	/* Reset crop settings */
+	frm->crop.left = 0;
+	frm->crop.top = 0;
+	frm->crop.width = frm->pix_fmt.width;
+	frm->crop.height = frm->pix_fmt.height;
+
+	/* Propagate settings to capture */
+	vidioc_setup_cap_fmt(ctx, &frm_cap->pix_fmt);
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops ge2d_ioctl_ops = {
+	.vidioc_querycap = vidioc_querycap,
+
+	.vidioc_enum_fmt_vid_cap = vidioc_enum_fmt,
+	.vidioc_g_fmt_vid_cap = vidioc_g_fmt,
+	.vidioc_try_fmt_vid_cap = vidioc_try_fmt_cap,
+	.vidioc_s_fmt_vid_cap = vidioc_s_fmt_cap,
+
+	.vidioc_enum_fmt_vid_out = vidioc_enum_fmt,
+	.vidioc_g_fmt_vid_out = vidioc_g_fmt,
+	.vidioc_try_fmt_vid_out = vidioc_try_fmt_out,
+	.vidioc_s_fmt_vid_out = vidioc_s_fmt_out,
+
+	.vidioc_reqbufs = v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf = v4l2_m2m_ioctl_querybuf,
+	.vidioc_qbuf = v4l2_m2m_ioctl_qbuf,
+	.vidioc_dqbuf = v4l2_m2m_ioctl_dqbuf,
+	.vidioc_prepare_buf = v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_create_bufs = v4l2_m2m_ioctl_create_bufs,
+	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
+
+	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+
+	.vidioc_streamon = v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff = v4l2_m2m_ioctl_streamoff,
+
+	.vidioc_g_selection = vidioc_g_selection,
+	.vidioc_s_selection = vidioc_s_selection,
+};
+
+static const struct video_device ge2d_videodev = {
+	.name = "meson-ge2d",
+	.fops = &ge2d_fops,
+	.ioctl_ops = &ge2d_ioctl_ops,
+	.minor = -1,
+	.release = video_device_release,
+	.vfl_dir = VFL_DIR_M2M,
+	.device_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING,
+};
+
+static const struct regmap_config meson_ge2d_regmap_conf = {
+	.reg_bits = 8,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = GE2D_SRC2_STRIDE_CTRL,
+};
+
+static int ge2d_probe(struct platform_device *pdev)
+{
+	struct reset_control *rst;
+	struct video_device *vfd;
+	struct meson_ge2d *ge2d;
+	struct resource *res;
+	void __iomem *regs;
+	int ret = 0;
+	int irq;
+
+	if (!pdev->dev.of_node)
+		return -ENODEV;
+
+	ge2d = devm_kzalloc(&pdev->dev, sizeof(*ge2d), GFP_KERNEL);
+	if (!ge2d)
+		return -ENOMEM;
+
+	ge2d->dev = &pdev->dev;
+	spin_lock_init(&ge2d->ctrl_lock);
+	mutex_init(&ge2d->mutex);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	regs = devm_ioremap_resource(ge2d->dev, res);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	ge2d->map = devm_regmap_init_mmio(ge2d->dev, regs,
+					  &meson_ge2d_regmap_conf);
+	if (IS_ERR(ge2d->map))
+		return PTR_ERR(ge2d->map);
+
+	irq = platform_get_irq(pdev, 0);
+	ret = devm_request_irq(ge2d->dev, irq, ge2d_isr, 0,
+			       dev_name(ge2d->dev), ge2d);
+	if (ret < 0) {
+		dev_err(ge2d->dev, "failed to request irq\n");
+		return ret;
+	}
+
+	rst = devm_reset_control_get(ge2d->dev, NULL);
+	if (IS_ERR(rst)) {
+		dev_err(ge2d->dev, "failed to get core reset controller\n");
+		return PTR_ERR(rst);
+	}
+
+	ge2d->clk = devm_clk_get(ge2d->dev, NULL);
+	if (IS_ERR(ge2d->clk)) {
+		dev_err(ge2d->dev, "failed to get clock\n");
+		return PTR_ERR(ge2d->clk);
+	}
+
+	reset_control_assert(rst);
+	udelay(1);
+	reset_control_deassert(rst);
+
+	ret = clk_prepare_enable(ge2d->clk);
+	if (ret) {
+		dev_err(ge2d->dev, "Cannot enable ge2d sclk: %d\n", ret);
+		return ret;
+	}
+
+	ret = v4l2_device_register(&pdev->dev, &ge2d->v4l2_dev);
+	if (ret)
+		goto disable_clks;
+
+	vfd = video_device_alloc();
+	if (!vfd) {
+		v4l2_err(&ge2d->v4l2_dev, "Failed to allocate video device\n");
+		goto unreg_v4l2_dev;
+	}
+
+	*vfd = ge2d_videodev;
+	vfd->lock = &ge2d->mutex;
+	vfd->v4l2_dev = &ge2d->v4l2_dev;
+
+	video_set_drvdata(vfd, ge2d);
+	ge2d->vfd = vfd;
+
+	platform_set_drvdata(pdev, ge2d);
+	ge2d->m2m_dev = v4l2_m2m_init(&ge2d_m2m_ops);
+	if (IS_ERR(ge2d->m2m_dev)) {
+		v4l2_err(&ge2d->v4l2_dev, "Failed to init mem2mem device\n");
+		ret = PTR_ERR(ge2d->m2m_dev);
+		goto unreg_video_dev;
+	}
+
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		v4l2_err(&ge2d->v4l2_dev, "Failed to register video device\n");
+		goto rel_vdev;
+	}
+
+	v4l2_info(&ge2d->v4l2_dev, "Registered %s as /dev/%s\n",
+		  vfd->name, video_device_node_name(vfd));
+
+	return 0;
+
+rel_vdev:
+	video_device_release(vfd);
+unreg_video_dev:
+	video_unregister_device(ge2d->vfd);
+unreg_v4l2_dev:
+	v4l2_device_unregister(&ge2d->v4l2_dev);
+disable_clks:
+	clk_disable_unprepare(ge2d->clk);
+
+	return ret;
+}
+
+static int ge2d_remove(struct platform_device *pdev)
+{
+	struct meson_ge2d *ge2d = platform_get_drvdata(pdev);
+
+	v4l2_m2m_release(ge2d->m2m_dev);
+	video_unregister_device(ge2d->vfd);
+	v4l2_device_unregister(&ge2d->v4l2_dev);
+
+	clk_disable_unprepare(ge2d->clk);
+
+	return 0;
+}
+
+static const struct of_device_id meson_ge2d_match[] = {
+	{
+		.compatible = "amlogic,axg-ge2d",
+	},
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, meson_ge2d_match);
+
+static struct platform_driver ge2d_drv = {
+	.probe = ge2d_probe,
+	.remove = ge2d_remove,
+	.driver = {
+		.name = "meson-ge2d",
+		.of_match_table = meson_ge2d_match,
+	},
+};
+
+module_platform_driver(ge2d_drv);
+
+MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
+MODULE_DESCRIPTION("Amlogic 2D Graphic Acceleration Unit");
+MODULE_LICENSE("GPL");
-- 
2.25.1

