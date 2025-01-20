Return-Path: <linux-media+bounces-24990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0A0A16F9D
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 16:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C33C16026E
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 15:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872E41EB9F2;
	Mon, 20 Jan 2025 15:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GAxm9Ii/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1771EB9F4
	for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 15:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737388031; cv=none; b=fImc5smEoP8T8sO17lAYKVd/AzvlAf3SoIdsLT80q7PZ1dovxpPuGNdlBMsmzaBLFhv1vET20KxU7JACG2lvAb77jHJY0cA7lZ5oxtmZ2YBAE5DJ0VT2ujuqd6ubAvaZ+2fXwl2ir8z87y/okcP84O1xJZJ//B6a8p2uoQwHFHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737388031; c=relaxed/simple;
	bh=IfgEIbTWLE300yNjn9Ylsg8c8Fz6crExj5cjxT85+VU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ElwYUaV9n8sAGVU9gMDCKvX+Qrac67iljwo6jU00Dg7/5c7CvwAKpTUU9fjPgaYvFmmrrkaoeLw+D5zroApxCbb8U2ZXeSl4Xk+fwv1+xx9fEGgyudyq2DxOkiEYelfmR1kUQsSyK/TkOHle6TIYdjqOgpzXiMGLr1gQKIIPKvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GAxm9Ii/; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3863494591bso2492081f8f.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jan 2025 07:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737388027; x=1737992827; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZksqZt6a5N8Vh9QZ7aXYq48HH2CRtv70taxtaqK9q4=;
        b=GAxm9Ii/6JE7l0OJYAXw9mbMyva7d7TgcyhIh5DFO0Xtp9NvA2ZxA6OI3pW+HII5pU
         fcuh93US4Ar4FIQV1Jj94oCqpmrdbO2UYwuGKCEz5YwMd6q54SvB96+k0NwyhhTs434E
         e+G6HHSDVloKpNWx6AOOnoiZMfJpXQkxBCF3TQEL5+q2JfhH4mG2oV89AxdF8rH76K/i
         IF0jlHLRm75E0IZK+sknYC/UriSA4UxU761fGMF1+rF4RWD/vRMFUp3RS4V+R0fSxk97
         9DAQHye6HmbmdV9++nze1fTmXZ5fme2eC8wkvmJ5t4kbna47gO82eucQ367zrfN72vGQ
         8R2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737388027; x=1737992827;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZksqZt6a5N8Vh9QZ7aXYq48HH2CRtv70taxtaqK9q4=;
        b=LSWWkAsD+uHowtYGTzlIb3NLx4qT9nBlE43o6q35T/oN4WbSI/dFWHJsekYrpYZCCA
         iYhQuA4PGIKtBRu2/EK/AAEq9brOrV7KpDG9TbeOXuBagFA0P1ww1d7OKofJ0yQs1HYA
         u7JVJcsEPwuhVvEyt30kBaE3bxvPbJKMSUMFQpmy6iaq+NSOrFMUmUmuj7qNX3guVE9x
         bXAol4ARmgEmSaOHYfWc1mYe46jmrBAiE7muWq9gKZEvGYufcH5xFmw6TvdgC7qx3hsq
         bZewYDqkDeR4QvkGtwGRWM61ZhnmnmS4IsZD5cJU/Q6ljPjHSl64+9g6fUfQFAZ3QAYn
         sEBg==
X-Gm-Message-State: AOJu0YzHHvOBqFQI1YRlhahB6cfDgObEmWOf0bHoWbZEOxicqEY0zYvJ
	yHqoA55qv181mLQubArx9Fjk1DqWnonW1czE3CZlPSkWO+Iv6opb6armOTC1Bxo=
X-Gm-Gg: ASbGncujvTUcrHgaURmDHQLxm1pZY9d0UV9yqVWc2ssxmODLuepSfSS499xoouSkosO
	RPrmVERjrLa+aq/1E5+ELlRbchraNAE3UyA9MaRJXZvP7PO7MHmsNjxxzsKIydeugkSUX2/TOur
	XkmeGgi3zbKHYwXSbi50vF2yWvfflh+hQn97UHMHkGWZyWcgWHGU+CYL2p29Sfvg6coYMEmiXml
	qb/GSNny5ygTUfPMRSQrL31x2GNVrtv3azhkdrK6jxtJ1vfAMgrrrGq6vlGzHsaCsXTOrDJ84/v
	P1E=
X-Google-Smtp-Source: AGHT+IEKd+8Jvcr0rzYfMmMDaK/lxpn3kF1+sF8zUhY1iUkIjKT3TZ4CpQFOgqyfpCtv912JQIadyA==
X-Received: by 2002:a5d:64a1:0:b0:38b:da32:4f40 with SMTP id ffacd0b85a97d-38bf566e69cmr12182533f8f.2.1737388027349;
        Mon, 20 Jan 2025 07:47:07 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221b70sm10645766f8f.26.2025.01.20.07.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 07:47:06 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 20 Jan 2025 15:47:01 +0000
Subject: [PATCH 4/7] media: qcom: camss: Add VFE680 support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-4-44c62a0edcd2@linaro.org>
References: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
In-Reply-To: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Depeng Shao <quic_depengs@quicinc.com>, 
 Vikram Sharma <quic_vikramsa@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-33ea6

Add silicon enabling support for VFE680 as found on sm8450, x1e and
derivatives thereof.

References previous work from Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/Makefile        |   1 +
 drivers/media/platform/qcom/camss/camss-vfe-680.c | 243 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.h     |   1 +
 3 files changed, 245 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 71797745f2f71..d26a9c24a430a 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -18,6 +18,7 @@ qcom-camss-objs += \
 		camss-vfe-4-8.o \
 		camss-vfe-17x.o \
 		camss-vfe-480.o \
+		camss-vfe-680.o \
 		camss-vfe-780.o \
 		camss-vfe-gen1.o \
 		camss-vfe.o \
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-680.c b/drivers/media/platform/qcom/camss/camss-vfe-680.c
new file mode 100644
index 0000000000000..1b2aa2c98887a
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-vfe-680.c
@@ -0,0 +1,243 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-vfe-680.c
+ *
+ * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v680
+ *
+ * Copyright (C) 2024 Linaro Ltd.
+ */
+
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+
+#include "camss.h"
+#include "camss-vfe.h"
+
+#define VFE_TOP_IRQn_STATUS(vfe, n)		((vfe_is_lite(vfe) ? 0x1c : 0x44) + (n) * 4)
+#define VFE_TOP_IRQn_MASK(vfe, n)		((vfe_is_lite(vfe) ? 0x24 : 0x34) + (n) * 4)
+#define VFE_TOP_IRQn_CLEAR(vfe, n)		((vfe_is_lite(vfe) ? 0x2c : 0x3c) + (n) * 4)
+#define		VFE_IRQ1_SOF(vfe, rdi)		((vfe_is_lite(vfe) ? BIT(2) : BIT(8)) << ((rdi) * 2))
+#define		VFE_IRQ1_EOF(vfe, rdi)		((vfe_is_lite(vfe) ? BIT(3) : BIT(9)) << ((rdi) * 2))
+#define VFE_TOP_IRQ_CMD(vfe)			(vfe_is_lite(vfe) ? 0x38 : 0x30)
+#define		VFE_TOP_IRQ_CMD_GLOBAL_CLEAR	BIT(0)
+#define VFE_TOP_DIAG_CONFIG			(vfe_is_lite(vfe) ? 0x40 : 0x50)
+
+#define VFE_TOP_DEBUG_11(vfe)			(vfe_is_lite(vfe) ? 0x40 : 0xcc)
+#define VFE_TOP_DEBUG_12(vfe)			(vfe_is_lite(vfe) ? 0x40 : 0xd0)
+#define VFE_TOP_DEBUG_13(vfe)			(vfe_is_lite(vfe) ? 0x40 : 0xd4)
+
+#define VFE_BUS_IRQn_MASK(vfe, n)		((vfe_is_lite(vfe) ? 0x218 : 0xc18) + (n) * 4)
+#define VFE_BUS_IRQn_CLEAR(vfe, n)		((vfe_is_lite(vfe) ? 0x220 : 0xc20) + (n) * 4)
+#define VFE_BUS_IRQn_STATUS(vfe, n)		((vfe_is_lite(vfe) ? 0x228 : 0xc28) + (n) * 4)
+#define VFE_BUS_IRQ_GLOBAL_CLEAR(vfe)		(vfe_is_lite(vfe) ? 0x230 : 0xc30)
+#define VFE_BUS_WR_VIOLATION_STATUS(vfe)	(vfe_is_lite(vfe) ? 0x264 : 0xc64)
+#define VFE_BUS_WR_OVERFLOW_STATUS(vfe)		(vfe_is_lite(vfe) ? 0x268 : 0xc68)
+#define VFE_BUS_WR_IMAGE_VIOLATION_STATUS(vfe)	(vfe_is_lite(vfe) ? 0x270 : 0xc70)
+
+#define VFE_BUS_CFG(vfe, c)			((vfe_is_lite(vfe) ? 0x400 : 0xe00) + (c) * 0x100)
+#define VFE_BUS_IMAGE_ADDR(vfe, c)		((vfe_is_lite(vfe) ? 0x404 : 0xe04) + (c) * 0x100)
+#define VFE_BUS_FRAME_INCR(vfe, c)		((vfe_is_lite(vfe) ? 0x408 : 0xe08) + (c) * 0x100)
+#define VFE_BUS_IMAGE_CFG0(vfe, c)		((vfe_is_lite(vfe) ? 0x40c : 0xe0c) + (c) * 0x100)
+#define		VFE_BUS_IMAGE_CFG0_DATA(h, s)	(((h) << 16) | ((s) >> 4))
+#define WM_IMAGE_CFG_0_DEFAULT_WIDTH		(0xFFFF)
+
+#define VFE_BUS_IMAGE_CFG1(vfe, c)		((vfe_is_lite(vfe) ? 0x410 : 0xe10) + (c) * 0x100)
+#define VFE_BUS_IMAGE_CFG2(vfe, c)		((vfe_is_lite(vfe) ? 0x414 : 0xe14) + (c) * 0x100)
+#define VFE_BUS_PACKER_CFG(vfe, c)		((vfe_is_lite(vfe) ? 0x418 : 0xe18) + (c) * 0x100)
+#define VFE_BUS_IRQ_SUBSAMPLE_PERIOD(vfe, c)	((vfe_is_lite(vfe) ? 0x430 : 0xe30) + (c) * 0x100)
+#define VFE_BUS_IRQ_SUBSAMPLE_PATTERN(vfe, c)	((vfe_is_lite(vfe) ? 0x434 : 0xe34) + (c) * 0x100)
+#define VFE_BUS_FRAMEDROP_PERIOD(vfe, c)	((vfe_is_lite(vfe) ? 0x438 : 0xe38) + (c) * 0x100)
+#define VFE_BUS_FRAMEDROP_PATTERN(vfe, c)	((vfe_is_lite(vfe) ? 0x43c : 0xe3c) + (c) * 0x100)
+#define VFE_BUS_MMU_PREFETCH_CFG(vfe, c)	((vfe_is_lite(vfe) ? 0x460 : 0xe60) + (c) * 0x100)
+#define		VFE_BUS_MMU_PREFETCH_CFG_EN	BIT(0)
+#define VFE_BUS_MMU_PREFETCH_MAX_OFFSET(vfe, c)	((vfe_is_lite(vfe) ? 0x464 : 0xe64) + (c) * 0x100)
+#define VFE_BUS_ADDR_STATUS0(vfe, c)		((vfe_is_lite(vfe) ? 0x470 : 0xe70) + (c) * 0x100)
+
+/*
+ * TODO: differentiate the port id based on requested type of RDI, BHIST etc
+ *
+ * IFE write master IDs
+ *
+ * VIDEO_FULL_Y		0
+ * VIDEO_FULL_C		1
+ * VIDEO_DS_4:1		2
+ * VIDEO_DS_16:1	3
+ * DISPLAY_FULL_Y	4
+ * DISPLAY_FULL_C	5
+ * DISPLAY_DS_4:1	6
+ * DISPLAY_DS_16:1	7
+ * FD_Y			8
+ * FD_C			9
+ * PIXEL_RAW		10
+ * STATS_BE0		11
+ * STATS_BHIST0		12
+ * STATS_TINTLESS_BG	13
+ * STATS_AWB_BG		14
+ * STATS_AWB_BFW	15
+ * STATS_BAF		16
+ * STATS_BHIST		17
+ * STATS_RS		18
+ * STATS_IHIST		19
+ * SPARSE_PD		20
+ * PDAF_V2.0_PD_DATA	21
+ * PDAF_V2.0_SAD	22
+ * LCR			23
+ * RDI0			24
+ * RDI1			25
+ * RDI2			26
+ * LTM_STATS		27
+ *
+ * IFE Lite write master IDs
+ *
+ * RDI0			0
+ * RDI1			1
+ * RDI2			2
+ * RDI3			3
+ * GAMMA		4
+ * BE			5
+ */
+
+/* TODO: assign an ENUM in resources and use the provided master
+ *       id directly for RDI, STATS, AWB_BG, BHIST.
+ *       This macro only works because RDI is all we support right now.
+ */
+#define RDI_WM(n)			((vfe_is_lite(vfe) ? 0 : 24) + (n))
+
+static void vfe_global_reset(struct vfe_device *vfe)
+{
+	/* VFE680 has no global reset, simply report a completion */
+	complete(&vfe->reset_complete);
+}
+
+/*
+ * vfe_isr - VFE module interrupt handler
+ * @irq: Interrupt line
+ * @dev: VFE device
+ *
+ * Return IRQ_HANDLED on success
+ */
+static irqreturn_t vfe_isr(int irq, void *dev)
+{
+	return IRQ_HANDLED;
+}
+
+/*
+ * vfe_halt - Trigger halt on VFE module and wait to complete
+ * @vfe: VFE device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int vfe_halt(struct vfe_device *vfe)
+{
+	/* rely on vfe_disable_output() to stop the VFE */
+	return 0;
+}
+
+static void vfe_disable_irq(struct vfe_device *vfe)
+{
+	writel(0u, vfe->base + VFE_TOP_IRQn_MASK(vfe, 0));
+	writel(0u, vfe->base + VFE_TOP_IRQn_MASK(vfe, 1));
+	writel(0u, vfe->base + VFE_BUS_IRQn_MASK(vfe, 0));
+	writel(0u, vfe->base + VFE_BUS_IRQn_MASK(vfe, 1));
+}
+
+static void vfe_wm_update(struct vfe_device *vfe, u8 rdi, u32 addr,
+			  struct vfe_line *line)
+{
+	u8 wm = RDI_WM(rdi);
+
+	writel(addr, vfe->base + VFE_BUS_IMAGE_ADDR(vfe, wm));
+}
+
+static void vfe_wm_start(struct vfe_device *vfe, u8 rdi, struct vfe_line *line)
+{
+	struct v4l2_pix_format_mplane *pix =
+		&line->video_out.active_fmt.fmt.pix_mp;
+	u32 stride = pix->plane_fmt[0].bytesperline;
+	u32 cfg;
+	u8 wm;
+
+	cfg = VFE_BUS_IMAGE_CFG0_DATA(pix->height, stride);
+	wm = RDI_WM(rdi);
+
+	writel(cfg, vfe->base + VFE_BUS_IMAGE_CFG0(vfe, wm));
+	writel(0, vfe->base + VFE_BUS_IMAGE_CFG1(vfe, wm));
+	writel(stride, vfe->base + VFE_BUS_IMAGE_CFG2(vfe, wm));
+	writel(0, vfe->base + VFE_BUS_PACKER_CFG(vfe, wm));
+
+	/* Set total frame increment value */
+	writel(pix->plane_fmt[0].bytesperline * pix->height,
+	       vfe->base + VFE_BUS_FRAME_INCR(vfe, wm));
+
+	/* MMU */
+	writel(VFE_BUS_MMU_PREFETCH_CFG_EN, vfe->base + VFE_BUS_MMU_PREFETCH_CFG(vfe, wm));
+	writel(~0u, vfe->base + VFE_BUS_MMU_PREFETCH_MAX_OFFSET(vfe, wm));
+
+	/* no dropped frames, one irq per frame */
+	writel(1, vfe->base + VFE_BUS_FRAMEDROP_PATTERN(vfe, wm));
+	writel(0, vfe->base + VFE_BUS_FRAMEDROP_PERIOD(vfe, wm));
+	writel(1, vfe->base + VFE_BUS_IRQ_SUBSAMPLE_PATTERN(vfe, wm));
+	writel(0, vfe->base + VFE_BUS_IRQ_SUBSAMPLE_PERIOD(vfe, wm));
+
+	/* We don't process IRQs for VFE in RDI mode at the moment */
+	vfe_disable_irq(vfe);
+
+	/* Enable WM */
+	writel(BIT(0), vfe->base + VFE_BUS_CFG(vfe, wm));
+
+	dev_dbg(vfe->camss->dev, "RDI%d WM:%d width %d height %d\n",
+		rdi, wm, pix->width, pix->height);
+	dev_dbg(vfe->camss->dev, "WM:%d stride %d\n", wm, stride);
+}
+
+static void vfe_wm_stop(struct vfe_device *vfe, u8 rdi)
+{
+	u8 wm = RDI_WM(rdi);
+
+	writel(0, vfe->base + VFE_BUS_CFG(vfe, wm));
+}
+
+static const struct camss_video_ops vfe_video_ops_680 = {
+	.queue_buffer = vfe_queue_buffer_v2,
+	.flush_buffers = vfe_flush_buffers,
+};
+
+static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
+{
+	vfe->video_ops = vfe_video_ops_680;
+}
+
+static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
+{
+	int port_id = line_id;
+
+	camss_reg_update(vfe->camss, vfe->id, port_id, false);
+}
+
+static inline void vfe_reg_update_clear(struct vfe_device *vfe,
+					enum vfe_line_id line_id)
+{
+	int port_id = line_id;
+
+	camss_reg_update(vfe->camss, vfe->id, port_id, true);
+}
+
+const struct vfe_hw_ops vfe_ops_680 = {
+	.global_reset = vfe_global_reset,
+	.hw_version = vfe_hw_version,
+	.isr = vfe_isr,
+	.pm_domain_off = vfe_pm_domain_off,
+	.pm_domain_on = vfe_pm_domain_on,
+	.subdev_init = vfe_subdev_init,
+	.vfe_disable = vfe_disable,
+	.vfe_enable = vfe_enable_v2,
+	.vfe_halt = vfe_halt,
+	.vfe_wm_start = vfe_wm_start,
+	.vfe_wm_stop = vfe_wm_stop,
+	.vfe_buf_done = vfe_buf_done,
+	.vfe_wm_update = vfe_wm_update,
+	.reg_update = vfe_reg_update,
+	.reg_update_clear = vfe_reg_update_clear,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 9dec5bc0d1b14..a23f666be7531 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -243,6 +243,7 @@ extern const struct vfe_hw_ops vfe_ops_4_7;
 extern const struct vfe_hw_ops vfe_ops_4_8;
 extern const struct vfe_hw_ops vfe_ops_170;
 extern const struct vfe_hw_ops vfe_ops_480;
+extern const struct vfe_hw_ops vfe_ops_680;
 extern const struct vfe_hw_ops vfe_ops_780;
 
 int vfe_get(struct vfe_device *vfe);

-- 
2.47.1


