Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B655447CA64
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 01:36:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239937AbhLVAgD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Dec 2021 19:36:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239908AbhLVAgD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Dec 2021 19:36:03 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A225FC061574
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 16:36:02 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id e5so1334456wrc.5
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 16:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gKTlVkvuCMOG7uQd4UYc8T3jiUZrLgkNQ30vrhYvEh8=;
        b=LXf0VRdF0SxjuiK7xRcRO+FkTGpnBXkFPlwXevbcTJvMclJAzOmkjiIiho7JjOX4zc
         4X1cmR8ZmlJUxXPC4KUOCkeejqLkFlUj3AbMr2DMqEZe5MYrkq7TBT2PTfk3mQ33EUeA
         83MQ+S5q0UzV47M7zMPzBELpjIcmUP/d665JjPn/nQTl4xXV/JU87RzJDXvBD7ssJWzj
         dCLwPSd/Fwa/ew3jmOnuaVLo4gm5o2z9r5P9GJV15vhX9Y10TJEJP/5ybBYSPUJUAmrz
         sTQe24pfIb5IzNwILMJnVOHT4IadRxDuwgZzGKEUH6YQIQZD7M6llEVqBnWh3v7a+RDN
         F9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gKTlVkvuCMOG7uQd4UYc8T3jiUZrLgkNQ30vrhYvEh8=;
        b=Dejp18xyus0xp+AkTRhhXEiVtMIWO+ajo589X0rTvTVN4aORVtU22X7curKQsWDBF8
         m976o/M19lnt/12UVnVVxDNK3PK65d/oC+NakzvEoAGKEYj9mUytP0ERLZSXf60g4byF
         Z2aohT8jr2ED+cq5JNBQUegY0stSDRxr2DPVnkm36WYkONxHRrZG82yv3l9u/X7DMxJ9
         tFmP9/HDtiMOfklk8VotAAK/jRujb7FTbBunYrNzdAdLj70bij+76cV5JETyDI0xlM8e
         Gr/ebSiRh5V77g0H5iuDmR3VlCCmCPELPhcrNhYMQpbUfbPlWVKphOmhrJ7lapd2pIIs
         P0oA==
X-Gm-Message-State: AOAM530LHb2+dnSjOxb7T8UMczRJT0TRfGknJDXT4V+0jz0seV1POv8Q
        fJgFnqO8b/6I2LOyoHMxAsxJDg==
X-Google-Smtp-Source: ABdhPJyc5aUL0emgQ9j1AfPtBFo1wSgd5wdfiLY2keslnIb3yaL3JZAqGoT2L+qp06S9+22Ry/5/Aw==
X-Received: by 2002:adf:ea0d:: with SMTP id q13mr361589wrm.597.1640133361248;
        Tue, 21 Dec 2021 16:36:01 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n7sm282825wms.45.2021.12.21.16.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 16:36:00 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 14/19] media: camss: Add initial support for VFE hardware version Titan 480
Date:   Wed, 22 Dec 2021 00:37:46 +0000
Message-Id: <20211222003751.2461466-15-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
References: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Add support for VFE found on SM8250 (Titan 480). This implementation is
based on the titan 170 implementation. It supports the normal and lite VFE,
and only supports the RDI0 capture path.

[bod: Updates hw_version callback]
[bod: Use static inline for macros reusing parameters checkpatch --strict]
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Julian Grahsl <jgrahsl@snap.com>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../media/platform/qcom/camss/camss-vfe-480.c | 564 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
 3 files changed, 566 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-480.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 0752c46ea37b5..81dd56aff0f27 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -15,6 +15,7 @@ qcom-camss-objs += \
 		camss-vfe-4-7.o \
 		camss-vfe-4-8.o \
 		camss-vfe-170.o \
+		camss-vfe-480.o \
 		camss-vfe-gen1.o \
 		camss-vfe.o \
 		camss-video.o \
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
new file mode 100644
index 0000000000000..1295851103931
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -0,0 +1,564 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-vfe-480.c
+ *
+ * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v480 (SM8250)
+ *
+ * Copyright (C) 2020-2021 Linaro Ltd.
+ * Copyright (C) 2021 Jonathan Marek
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
+/* VFE 2/3 are lite and have a different register layout */
+#define IS_LITE		(vfe->id >= 2 ? 1 : 0)
+
+#define VFE_HW_VERSION			(0x00)
+
+#define VFE_GLOBAL_RESET_CMD		(IS_LITE ? 0x0c : 0x1c)
+#define	    GLOBAL_RESET_HW_AND_REG	(IS_LITE ? BIT(1) : BIT(0))
+
+#define VFE_REG_UPDATE_CMD		(IS_LITE ? 0x20 : 0x34)
+static inline int reg_update_rdi(struct vfe_device *vfe, int n)
+{
+	return IS_LITE ? BIT(n) : BIT(1 + (n));
+}
+
+#define	    REG_UPDATE_RDI		reg_update_rdi
+#define VFE_IRQ_CMD			(IS_LITE ? 0x24 : 0x38)
+#define     IRQ_CMD_GLOBAL_CLEAR	BIT(0)
+
+#define VFE_IRQ_MASK(n)			((IS_LITE ? 0x28 : 0x3c) + (n) * 4)
+#define	    IRQ_MASK_0_RESET_ACK	(IS_LITE ? BIT(17) : BIT(0))
+#define	    IRQ_MASK_0_BUS_TOP_IRQ	(IS_LITE ? BIT(4) : BIT(7))
+#define VFE_IRQ_CLEAR(n)		((IS_LITE ? 0x34 : 0x48) + (n) * 4)
+#define VFE_IRQ_STATUS(n)		((IS_LITE ? 0x40 : 0x54) + (n) * 4)
+
+#define BUS_REG_BASE			(IS_LITE ? 0x1a00 : 0xaa00)
+
+#define VFE_BUS_WM_CGC_OVERRIDE		(BUS_REG_BASE + 0x08)
+#define		WM_CGC_OVERRIDE_ALL	(0x3FFFFFF)
+
+#define VFE_BUS_WM_TEST_BUS_CTRL	(BUS_REG_BASE + 0xdc)
+
+#define VFE_BUS_IRQ_MASK(n)		(BUS_REG_BASE + 0x18 + (n) * 4)
+static inline int bus_irq_mask_0_rdi_rup(struct vfe_device *vfe, int n)
+{
+	return IS_LITE ? BIT(n) : BIT(3 + (n));
+}
+
+#define     BUS_IRQ_MASK_0_RDI_RUP	bus_irq_mask_0_rdi_rup
+static inline int bus_irq_mask_0_comp_done(struct vfe_device *vfe, int n)
+{
+	return IS_LITE ? BIT(4 + (n)) : BIT(6 + (n));
+}
+
+#define     BUS_IRQ_MASK_0_COMP_DONE	bus_irq_mask_0_comp_done
+#define VFE_BUS_IRQ_CLEAR(n)		(BUS_REG_BASE + 0x20 + (n) * 4)
+#define VFE_BUS_IRQ_STATUS(n)		(BUS_REG_BASE + 0x28 + (n) * 4)
+#define VFE_BUS_IRQ_CLEAR_GLOBAL	(BUS_REG_BASE + 0x30)
+
+#define VFE_BUS_WM_CFG(n)		(BUS_REG_BASE + 0x200 + (n) * 0x100)
+#define		WM_CFG_EN			(0)
+#define		WM_CFG_MODE			(16)
+#define			MODE_QCOM_PLAIN	(0)
+#define			MODE_MIPI_RAW	(1)
+#define VFE_BUS_WM_IMAGE_ADDR(n)	(BUS_REG_BASE + 0x204 + (n) * 0x100)
+#define VFE_BUS_WM_FRAME_INCR(n)	(BUS_REG_BASE + 0x208 + (n) * 0x100)
+#define VFE_BUS_WM_IMAGE_CFG_0(n)	(BUS_REG_BASE + 0x20c + (n) * 0x100)
+#define		WM_IMAGE_CFG_0_DEFAULT_WIDTH	(0xFFFF)
+#define VFE_BUS_WM_IMAGE_CFG_1(n)	(BUS_REG_BASE + 0x210 + (n) * 0x100)
+#define VFE_BUS_WM_IMAGE_CFG_2(n)	(BUS_REG_BASE + 0x214 + (n) * 0x100)
+#define VFE_BUS_WM_PACKER_CFG(n)	(BUS_REG_BASE + 0x218 + (n) * 0x100)
+#define VFE_BUS_WM_HEADER_ADDR(n)	(BUS_REG_BASE + 0x220 + (n) * 0x100)
+#define VFE_BUS_WM_HEADER_INCR(n)	(BUS_REG_BASE + 0x224 + (n) * 0x100)
+#define VFE_BUS_WM_HEADER_CFG(n)	(BUS_REG_BASE + 0x228 + (n) * 0x100)
+
+#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)	(BUS_REG_BASE + 0x230 + (n) * 0x100)
+#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)	(BUS_REG_BASE + 0x234 + (n) * 0x100)
+#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)		(BUS_REG_BASE + 0x238 + (n) * 0x100)
+#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)		(BUS_REG_BASE + 0x23c + (n) * 0x100)
+
+#define VFE_BUS_WM_SYSTEM_CACHE_CFG(n)	(BUS_REG_BASE + 0x260 + (n) * 0x100)
+#define VFE_BUS_WM_BURST_LIMIT(n)	(BUS_REG_BASE + 0x264 + (n) * 0x100)
+
+/* for titan 480, each bus client is hardcoded to a specific path
+ * and each bus client is part of a hardcoded "comp group"
+ */
+#define RDI_WM(n)			((IS_LITE ? 0 : 23) + (n))
+#define RDI_COMP_GROUP(n)		((IS_LITE ? 0 : 11) + (n))
+
+static u32 vfe_hw_version(struct vfe_device *vfe)
+{
+	u32 hw_version = readl_relaxed(vfe->base + VFE_HW_VERSION);
+
+	u32 gen = (hw_version >> 28) & 0xF;
+	u32 rev = (hw_version >> 16) & 0xFFF;
+	u32 step = hw_version & 0xFFFF;
+
+	dev_dbg(vfe->camss->dev, "VFE HW Version = %u.%u.%u\n", gen, rev, step);
+
+	return hw_version;
+}
+
+static void vfe_global_reset(struct vfe_device *vfe)
+{
+	writel_relaxed(IRQ_MASK_0_RESET_ACK, vfe->base + VFE_IRQ_MASK(0));
+	writel_relaxed(GLOBAL_RESET_HW_AND_REG, vfe->base + VFE_GLOBAL_RESET_CMD);
+}
+
+static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
+{
+	struct v4l2_pix_format_mplane *pix =
+		&line->video_out.active_fmt.fmt.pix_mp;
+
+	wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
+
+	/* no clock gating at bus input */
+	writel_relaxed(WM_CGC_OVERRIDE_ALL, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
+
+	writel_relaxed(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
+
+	writel_relaxed(pix->plane_fmt[0].bytesperline * pix->height,
+		       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
+	writel_relaxed(0xf, vfe->base + VFE_BUS_WM_BURST_LIMIT(wm));
+	writel_relaxed(WM_IMAGE_CFG_0_DEFAULT_WIDTH,
+		       vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
+	writel_relaxed(pix->plane_fmt[0].bytesperline,
+		       vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
+	writel_relaxed(0, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
+
+	/* no dropped frames, one irq per frame */
+	writel_relaxed(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
+	writel_relaxed(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
+	writel_relaxed(0, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(wm));
+	writel_relaxed(1, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(wm));
+
+	writel_relaxed(1 << WM_CFG_EN | MODE_MIPI_RAW << WM_CFG_MODE,
+		       vfe->base + VFE_BUS_WM_CFG(wm));
+}
+
+static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
+{
+	wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
+	writel_relaxed(0, vfe->base + VFE_BUS_WM_CFG(wm));
+}
+
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
+			  struct vfe_line *line)
+{
+	wm = RDI_WM(wm); /* map to actual WM used (from wm=RDI index) */
+	writel_relaxed(addr, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
+}
+
+static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
+{
+	vfe->reg_update |= REG_UPDATE_RDI(vfe, line_id);
+	writel_relaxed(vfe->reg_update, vfe->base + VFE_REG_UPDATE_CMD);
+}
+
+static inline void vfe_reg_update_clear(struct vfe_device *vfe,
+					enum vfe_line_id line_id)
+{
+	vfe->reg_update &= ~REG_UPDATE_RDI(vfe, line_id);
+}
+
+static void vfe_enable_irq_common(struct vfe_device *vfe)
+{
+	/* enable only the IRQs used: rup and comp_done irqs for RDI0 */
+	writel_relaxed(IRQ_MASK_0_RESET_ACK | IRQ_MASK_0_BUS_TOP_IRQ,
+		       vfe->base + VFE_IRQ_MASK(0));
+	writel_relaxed(BUS_IRQ_MASK_0_RDI_RUP(vfe, 0) |
+		       BUS_IRQ_MASK_0_COMP_DONE(vfe, RDI_COMP_GROUP(0)),
+		       vfe->base + VFE_BUS_IRQ_MASK(0));
+}
+
+static void vfe_isr_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id);
+static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm);
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
+	struct vfe_device *vfe = dev;
+	u32 status;
+
+	status = readl_relaxed(vfe->base + VFE_IRQ_STATUS(0));
+	writel_relaxed(status, vfe->base + VFE_IRQ_CLEAR(0));
+	writel_relaxed(IRQ_CMD_GLOBAL_CLEAR, vfe->base + VFE_IRQ_CMD);
+
+	if (status & IRQ_MASK_0_RESET_ACK)
+		vfe_isr_reset_ack(vfe);
+
+	if (status & IRQ_MASK_0_BUS_TOP_IRQ) {
+		u32 status = readl_relaxed(vfe->base + VFE_BUS_IRQ_STATUS(0));
+
+		writel_relaxed(status, vfe->base + VFE_BUS_IRQ_CLEAR(0));
+		writel_relaxed(1, vfe->base + VFE_BUS_IRQ_CLEAR_GLOBAL);
+
+		if (status & BUS_IRQ_MASK_0_RDI_RUP(vfe, 0))
+			vfe_isr_reg_update(vfe, 0);
+
+		if (status & BUS_IRQ_MASK_0_COMP_DONE(vfe, RDI_COMP_GROUP(0)))
+			vfe_isr_wm_done(vfe, 0);
+	}
+
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
+static int vfe_get_output(struct vfe_line *line)
+{
+	struct vfe_device *vfe = to_vfe(line);
+	struct vfe_output *output;
+	unsigned long flags;
+	int wm_idx;
+
+	spin_lock_irqsave(&vfe->output_lock, flags);
+
+	output = &line->output;
+	if (output->state != VFE_OUTPUT_OFF) {
+		dev_err(vfe->camss->dev, "Output is running\n");
+		goto error;
+	}
+
+	output->wm_num = 1;
+
+	wm_idx = vfe_reserve_wm(vfe, line->id);
+	if (wm_idx < 0) {
+		dev_err(vfe->camss->dev, "Can not reserve wm\n");
+		goto error_get_wm;
+	}
+	output->wm_idx[0] = wm_idx;
+
+	output->drop_update_idx = 0;
+
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+
+	return 0;
+
+error_get_wm:
+	vfe_release_wm(vfe, output->wm_idx[0]);
+	output->state = VFE_OUTPUT_OFF;
+error:
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+
+	return -EINVAL;
+}
+
+static int vfe_enable_output(struct vfe_line *line)
+{
+	struct vfe_device *vfe = to_vfe(line);
+	struct vfe_output *output = &line->output;
+	unsigned long flags;
+	unsigned int i;
+
+	spin_lock_irqsave(&vfe->output_lock, flags);
+
+	vfe_reg_update_clear(vfe, line->id);
+
+	if (output->state != VFE_OUTPUT_OFF) {
+		dev_err(vfe->camss->dev, "Output is not in reserved state %d\n",
+			output->state);
+		spin_unlock_irqrestore(&vfe->output_lock, flags);
+		return -EINVAL;
+	}
+
+	WARN_ON(output->gen2.active_num);
+
+	output->state = VFE_OUTPUT_ON;
+
+	output->sequence = 0;
+	output->wait_reg_update = 0;
+	reinit_completion(&output->reg_update);
+
+	vfe_wm_start(vfe, output->wm_idx[0], line);
+
+	for (i = 0; i < 2; i++) {
+		output->buf[i] = vfe_buf_get_pending(output);
+		if (!output->buf[i])
+			break;
+		output->gen2.active_num++;
+		vfe_wm_update(vfe, output->wm_idx[0], output->buf[i]->addr[0], line);
+	}
+
+	vfe_reg_update(vfe, line->id);
+
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+
+	return 0;
+}
+
+static int vfe_disable_output(struct vfe_line *line)
+{
+	struct vfe_device *vfe = to_vfe(line);
+	struct vfe_output *output = &line->output;
+	unsigned long flags;
+	unsigned int i;
+	bool done;
+	int timeout = 0;
+
+	do {
+		spin_lock_irqsave(&vfe->output_lock, flags);
+		done = !output->gen2.active_num;
+		spin_unlock_irqrestore(&vfe->output_lock, flags);
+		usleep_range(10000, 20000);
+
+		if (timeout++ == 100) {
+			dev_err(vfe->camss->dev, "VFE idle timeout - resetting\n");
+			vfe_reset(vfe);
+			output->gen2.active_num = 0;
+			return 0;
+		}
+	} while (!done);
+
+	spin_lock_irqsave(&vfe->output_lock, flags);
+	for (i = 0; i < output->wm_num; i++)
+		vfe_wm_stop(vfe, output->wm_idx[i]);
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+
+	return 0;
+}
+
+/*
+ * vfe_enable - Enable streaming on VFE line
+ * @line: VFE line
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int vfe_enable(struct vfe_line *line)
+{
+	struct vfe_device *vfe = to_vfe(line);
+	int ret;
+
+	mutex_lock(&vfe->stream_lock);
+
+	if (!vfe->stream_count)
+		vfe_enable_irq_common(vfe);
+
+	vfe->stream_count++;
+
+	mutex_unlock(&vfe->stream_lock);
+
+	ret = vfe_get_output(line);
+	if (ret < 0)
+		goto error_get_output;
+
+	ret = vfe_enable_output(line);
+	if (ret < 0)
+		goto error_enable_output;
+
+	vfe->was_streaming = 1;
+
+	return 0;
+
+error_enable_output:
+	vfe_put_output(line);
+
+error_get_output:
+	mutex_lock(&vfe->stream_lock);
+
+	vfe->stream_count--;
+
+	mutex_unlock(&vfe->stream_lock);
+
+	return ret;
+}
+
+/*
+ * vfe_disable - Disable streaming on VFE line
+ * @line: VFE line
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int vfe_disable(struct vfe_line *line)
+{
+	struct vfe_device *vfe = to_vfe(line);
+
+	vfe_disable_output(line);
+
+	vfe_put_output(line);
+
+	mutex_lock(&vfe->stream_lock);
+
+	vfe->stream_count--;
+
+	mutex_unlock(&vfe->stream_lock);
+
+	return 0;
+}
+
+/*
+ * vfe_isr_reg_update - Process reg update interrupt
+ * @vfe: VFE Device
+ * @line_id: VFE line
+ */
+static void vfe_isr_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
+{
+	struct vfe_output *output;
+	unsigned long flags;
+
+	spin_lock_irqsave(&vfe->output_lock, flags);
+	vfe_reg_update_clear(vfe, line_id);
+
+	output = &vfe->line[line_id].output;
+
+	if (output->wait_reg_update) {
+		output->wait_reg_update = 0;
+		complete(&output->reg_update);
+	}
+
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+}
+
+/*
+ * vfe_isr_wm_done - Process write master done interrupt
+ * @vfe: VFE Device
+ * @wm: Write master id
+ */
+static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
+{
+	struct vfe_line *line = &vfe->line[vfe->wm_output_map[wm]];
+	struct camss_buffer *ready_buf;
+	struct vfe_output *output;
+	unsigned long flags;
+	u32 index;
+	u64 ts = ktime_get_ns();
+
+	spin_lock_irqsave(&vfe->output_lock, flags);
+
+	if (vfe->wm_output_map[wm] == VFE_LINE_NONE) {
+		dev_err_ratelimited(vfe->camss->dev,
+				    "Received wm done for unmapped index\n");
+		goto out_unlock;
+	}
+	output = &vfe->line[vfe->wm_output_map[wm]].output;
+
+	ready_buf = output->buf[0];
+	if (!ready_buf) {
+		dev_err_ratelimited(vfe->camss->dev,
+				    "Missing ready buf %d!\n", output->state);
+		goto out_unlock;
+	}
+
+	ready_buf->vb.vb2_buf.timestamp = ts;
+	ready_buf->vb.sequence = output->sequence++;
+
+	index = 0;
+	output->buf[0] = output->buf[1];
+	if (output->buf[0])
+		index = 1;
+
+	output->buf[index] = vfe_buf_get_pending(output);
+
+	if (output->buf[index])
+		vfe_wm_update(vfe, output->wm_idx[0], output->buf[index]->addr[0], line);
+	else
+		output->gen2.active_num--;
+
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+
+	vb2_buffer_done(&ready_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+
+	return;
+
+out_unlock:
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+}
+
+/*
+ * vfe_pm_domain_off - Disable power domains specific to this VFE.
+ * @vfe: VFE Device
+ */
+static void vfe_pm_domain_off(struct vfe_device *vfe)
+{
+	/* nop */
+}
+
+/*
+ * vfe_pm_domain_on - Enable power domains specific to this VFE.
+ * @vfe: VFE Device
+ */
+static int vfe_pm_domain_on(struct vfe_device *vfe)
+{
+	return 0;
+}
+
+/*
+ * vfe_queue_buffer - Add empty buffer
+ * @vid: Video device structure
+ * @buf: Buffer to be enqueued
+ *
+ * Add an empty buffer - depending on the current number of buffers it will be
+ * put in pending buffer queue or directly given to the hardware to be filled.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int vfe_queue_buffer(struct camss_video *vid,
+			    struct camss_buffer *buf)
+{
+	struct vfe_line *line = container_of(vid, struct vfe_line, video_out);
+	struct vfe_device *vfe = to_vfe(line);
+	struct vfe_output *output;
+	unsigned long flags;
+
+	output = &line->output;
+
+	spin_lock_irqsave(&vfe->output_lock, flags);
+
+	if (output->state == VFE_OUTPUT_ON && output->gen2.active_num < 2) {
+		output->buf[output->gen2.active_num++] = buf;
+		vfe_wm_update(vfe, output->wm_idx[0], buf->addr[0], line);
+	} else {
+		vfe_buf_add_pending(output, buf);
+	}
+
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+
+	return 0;
+}
+
+static const struct camss_video_ops vfe_video_ops_480 = {
+	.queue_buffer = vfe_queue_buffer,
+	.flush_buffers = vfe_flush_buffers,
+};
+
+static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
+{
+	vfe->video_ops = vfe_video_ops_480;
+	vfe->line_num = 1;
+}
+
+const struct vfe_hw_ops vfe_ops_480 = {
+	.global_reset = vfe_global_reset,
+	.hw_version = vfe_hw_version,
+	.isr = vfe_isr,
+	.pm_domain_off = vfe_pm_domain_off,
+	.pm_domain_on = vfe_pm_domain_on,
+	.subdev_init = vfe_subdev_init,
+	.vfe_disable = vfe_disable,
+	.vfe_enable = vfe_enable,
+	.vfe_halt = vfe_halt,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index f166d176cb771..6500474a749e7 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -201,5 +201,6 @@ extern const struct vfe_hw_ops vfe_ops_4_1;
 extern const struct vfe_hw_ops vfe_ops_4_7;
 extern const struct vfe_hw_ops vfe_ops_4_8;
 extern const struct vfe_hw_ops vfe_ops_170;
+extern const struct vfe_hw_ops vfe_ops_480;
 
 #endif /* QC_MSM_CAMSS_VFE_H */
-- 
2.33.0

