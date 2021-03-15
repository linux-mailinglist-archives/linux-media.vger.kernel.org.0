Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05E3333C0D5
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 17:02:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233097AbhCOQBG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 12:01:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231591AbhCOQAe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 12:00:34 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDC1FC06175F
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 09:00:33 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id p8so67111339ejb.10
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 09:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/empcMHuq6wpO3CnrElHPh1IwPeEGqsFeQByrSuFZCE=;
        b=ysP3R63Qnigsv0tmEth7YyUE3fQDwF1KkUuf672E5o0qDyHbBNRFWn8oScACELB4QM
         r09SFL4xoxiyzoGV+IF4KtvjKo3BwPIH8bTq8xGnFsZmITbkXWAtVBGBYFlAWNnpGg8d
         gW9yZnfhy7l+mWV9zOeF4OLZ9p45pnn4wuS6Weu0b2inVMHslp8IclHp3K0n+a4ZauVv
         vPYH58GmfxrVdGFEprwdwgAonG1dyHIPvx7+UAOZVdUPiRg6poyv9TkyJ2N5nOEhfQdP
         0z6VD0xm7QKBHOWNHjE/iz9ONyIZYhnmyH6z635bJdu0t0ziM7xwT/rQrZUEDyukmVKz
         tOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/empcMHuq6wpO3CnrElHPh1IwPeEGqsFeQByrSuFZCE=;
        b=UUD1ub1T2f8dIn+yOvfJE5t9OJ/hdzWrFrEdhnQ+o+rUA+tmbA8feg9/0fd+sVv0lO
         McoPGpSXI+EOAHrRkWSEI6vU1CChLeXdhmgtOIuYJzRCiyI0PnqPb/C1q47Q15PD5FeS
         PhdcPDinC9hes8xtc2x91r+EvwaoJGWMhxp2fdqCTKaLf4pJk3HXMNvsvnEA26QoRPQ2
         6TJlPRFKm2aivnh/Ou27PulkVrdshbfI5owHs05YxdlEV8cxAtjBeY5JEKTc2DX3eNsC
         c42P+g02jc3PXGVwUq9vF3pH17WnMRoNt6bSIqcaS+3CuSU73hh9VK1D1iops7+NmHAv
         ExHw==
X-Gm-Message-State: AOAM533LqvJ4MF/XFQhYpDvTuy7NNgrodE+7m4itTfKRTWRQjDR0mwVo
        xDhPskN2yqg4c5/DkNAiHsoaLQ==
X-Google-Smtp-Source: ABdhPJxBe8n+XqCmKkyvnZIMYwkk5qSyZ/eN/DDdc4EsOOM0cijUHh8ZZ3IjN7Q3GHPvYYh/tvCGrg==
X-Received: by 2002:a17:907:f97:: with SMTP id kb23mr24167069ejc.33.1615824026714;
        Mon, 15 Mar 2021 09:00:26 -0700 (PDT)
Received: from localhost.localdomain ([37.120.1.234])
        by smtp.gmail.com with ESMTPSA id r5sm8456445eds.49.2021.03.15.09.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 09:00:25 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v8 07/22] media: camss: Add support for VFE hardware version Titan 170
Date:   Mon, 15 Mar 2021 16:59:28 +0100
Message-Id: <20210315155942.640889-8-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315155942.640889-1-robert.foss@linaro.org>
References: <20210315155942.640889-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add register definitions for version 170 of the Titan architecture
and implement support for the RDI output mode.

The RDI mode as opposed to the PIX output mode for the VFE unit does
not support any ISP functionality. This means essentially only
supporting dumping the output of the whatever the CSI decoder receives
from the sensor.

For example will a sensor outputting YUV pixel format frames, only
allow the VFE to dump those frames as they are received by the ISP
to memory through the RDI interface.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---

Changes since v1:
 - Andrey: Remove commented out chunk
 - Remove left over WIP comments

Changes since v4:
 - Andrey: Remove traces of PIX support
 - Andrey: Fix vfe_global_reset() overwriting reset command
 - Remove unused variable

Changes since v5:
 - Andrey: Fix copy/paste issues in header
 - Andrey: Remove unecessary looping for 1 value

Changes since v6:
 - Andrey: Add r-b
 
Changes since v7:
 - Hans: Fix "make C=1 CHECK='/usr/bin/sparse'" warnings
 - Hans: Fix checkpatch.pl --strict warnings


 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../media/platform/qcom/camss/camss-vfe-170.c | 767 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c |  47 +-
 drivers/media/platform/qcom/camss/camss-vfe.h |  24 +-
 .../media/platform/qcom/camss/camss-video.c   |  52 ++
 drivers/media/platform/qcom/camss/camss.c     |  61 ++
 6 files changed, 934 insertions(+), 18 deletions(-)
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-170.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 940c0ae3e003..052c4f405fa3 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -11,6 +11,7 @@ qcom-camss-objs += \
 		camss-vfe-4-1.o \
 		camss-vfe-4-7.o \
 		camss-vfe-4-8.o \
+		camss-vfe-170.o \
 		camss-vfe-gen1.o \
 		camss-vfe.o \
 		camss-video.o \
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
new file mode 100644
index 000000000000..d99971e0b83c
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
@@ -0,0 +1,767 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-vfe-170.c
+ *
+ * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v170
+ *
+ * Copyright (C) 2020-2021 Linaro Ltd.
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
+#define VFE_HW_VERSION				(0x000)
+
+#define VFE_GLOBAL_RESET_CMD			(0x018)
+#define		GLOBAL_RESET_CMD_CORE		BIT(0)
+#define		GLOBAL_RESET_CMD_CAMIF		BIT(1)
+#define		GLOBAL_RESET_CMD_BUS		BIT(2)
+#define		GLOBAL_RESET_CMD_BUS_BDG	BIT(3)
+#define		GLOBAL_RESET_CMD_REGISTER	BIT(4)
+#define		GLOBAL_RESET_CMD_PM		BIT(5)
+#define		GLOBAL_RESET_CMD_BUS_MISR	BIT(6)
+#define		GLOBAL_RESET_CMD_TESTGEN	BIT(7)
+#define		GLOBAL_RESET_CMD_DSP		BIT(8)
+#define		GLOBAL_RESET_CMD_IDLE_CGC	BIT(9)
+#define		GLOBAL_RESET_CMD_RDI0		BIT(10)
+#define		GLOBAL_RESET_CMD_RDI1		BIT(11)
+#define		GLOBAL_RESET_CMD_RDI2		BIT(12)
+#define		GLOBAL_RESET_CMD_RDI3		BIT(13)
+#define		GLOBAL_RESET_CMD_VFE_DOMAIN	BIT(30)
+#define		GLOBAL_RESET_CMD_RESET_BYPASS	BIT(31)
+
+#define VFE_CORE_CFG				(0x050)
+#define		CFG_PIXEL_PATTERN_YCBYCR	(0x4)
+#define		CFG_PIXEL_PATTERN_YCRYCB	(0x5)
+#define		CFG_PIXEL_PATTERN_CBYCRY	(0x6)
+#define		CFG_PIXEL_PATTERN_CRYCBY	(0x7)
+#define		CFG_COMPOSITE_REG_UPDATE_EN	BIT(4)
+
+#define VFE_IRQ_CMD				(0x058)
+#define		CMD_GLOBAL_CLEAR		BIT(0)
+
+#define VFE_IRQ_MASK_0					(0x05c)
+#define		MASK_0_CAMIF_SOF			BIT(0)
+#define		MASK_0_CAMIF_EOF			BIT(1)
+#define		MASK_0_RDI_REG_UPDATE(n)		BIT((n) + 5)
+#define		MASK_0_IMAGE_MASTER_n_PING_PONG(n)	BIT((n) + 8)
+#define		MASK_0_IMAGE_COMPOSITE_DONE_n(n)	BIT((n) + 25)
+#define		MASK_0_RESET_ACK			BIT(31)
+
+#define VFE_IRQ_MASK_1					(0x060)
+#define		MASK_1_CAMIF_ERROR			BIT(0)
+#define		MASK_1_VIOLATION			BIT(7)
+#define		MASK_1_BUS_BDG_HALT_ACK			BIT(8)
+#define		MASK_1_IMAGE_MASTER_n_BUS_OVERFLOW(n)	BIT((n) + 9)
+#define		MASK_1_RDI_SOF(n)			BIT((n) + 29)
+
+#define VFE_IRQ_CLEAR_0					(0x064)
+#define VFE_IRQ_CLEAR_1					(0x068)
+
+#define VFE_IRQ_STATUS_0				(0x06c)
+#define		STATUS_0_CAMIF_SOF			BIT(0)
+#define		STATUS_0_RDI_REG_UPDATE(n)		BIT((n) + 5)
+#define		STATUS_0_IMAGE_MASTER_PING_PONG(n)	BIT((n) + 8)
+#define		STATUS_0_IMAGE_COMPOSITE_DONE(n)	BIT((n) + 25)
+#define		STATUS_0_RESET_ACK			BIT(31)
+
+#define VFE_IRQ_STATUS_1				(0x070)
+#define		STATUS_1_VIOLATION			BIT(7)
+#define		STATUS_1_BUS_BDG_HALT_ACK		BIT(8)
+#define		STATUS_1_RDI_SOF(n)			BIT((n) + 27)
+
+#define VFE_VIOLATION_STATUS			(0x07c)
+
+#define VFE_CAMIF_CMD				(0x478)
+#define		CMD_CLEAR_CAMIF_STATUS		BIT(2)
+
+#define VFE_CAMIF_CFG				(0x47c)
+#define		CFG_VSYNC_SYNC_EDGE		(0)
+#define			VSYNC_ACTIVE_HIGH	(0)
+#define			VSYNC_ACTIVE_LOW	(1)
+#define		CFG_HSYNC_SYNC_EDGE		(1)
+#define			HSYNC_ACTIVE_HIGH	(0)
+#define			HSYNC_ACTIVE_LOW	(1)
+#define		CFG_VFE_SUBSAMPLE_ENABLE	BIT(4)
+#define		CFG_BUS_SUBSAMPLE_ENABLE	BIT(5)
+#define		CFG_VFE_OUTPUT_EN		BIT(6)
+#define		CFG_BUS_OUTPUT_EN		BIT(7)
+#define		CFG_BINNING_EN			BIT(9)
+#define		CFG_FRAME_BASED_EN		BIT(10)
+#define		CFG_RAW_CROP_EN			BIT(22)
+
+#define VFE_REG_UPDATE_CMD			(0x4ac)
+#define		REG_UPDATE_RDI(n)		BIT(1 + (n))
+
+#define VFE_BUS_IRQ_MASK(n)		(0x2044 + (n) * 4)
+#define VFE_BUS_IRQ_CLEAR(n)		(0x2050 + (n) * 4)
+#define VFE_BUS_IRQ_STATUS(n)		(0x205c + (n) * 4)
+#define		STATUS0_COMP_RESET_DONE		BIT(0)
+#define		STATUS0_COMP_REG_UPDATE0_DONE	BIT(1)
+#define		STATUS0_COMP_REG_UPDATE1_DONE	BIT(2)
+#define		STATUS0_COMP_REG_UPDATE2_DONE	BIT(3)
+#define		STATUS0_COMP_REG_UPDATE3_DONE	BIT(4)
+#define		STATUS0_COMP_REG_UPDATE_DONE(n)	BIT((n) + 1)
+#define		STATUS0_COMP0_BUF_DONE		BIT(5)
+#define		STATUS0_COMP1_BUF_DONE		BIT(6)
+#define		STATUS0_COMP2_BUF_DONE		BIT(7)
+#define		STATUS0_COMP3_BUF_DONE		BIT(8)
+#define		STATUS0_COMP4_BUF_DONE		BIT(9)
+#define		STATUS0_COMP5_BUF_DONE		BIT(10)
+#define		STATUS0_COMP_BUF_DONE(n)	BIT((n) + 5)
+#define		STATUS0_COMP_ERROR		BIT(11)
+#define		STATUS0_COMP_OVERWRITE		BIT(12)
+#define		STATUS0_OVERFLOW		BIT(13)
+#define		STATUS0_VIOLATION		BIT(14)
+/* WM_CLIENT_BUF_DONE defined for buffers 0:19 */
+#define		STATUS1_WM_CLIENT_BUF_DONE(n)		BIT(n)
+#define		STATUS1_EARLY_DONE			BIT(24)
+#define		STATUS2_DUAL_COMP0_BUF_DONE		BIT(0)
+#define		STATUS2_DUAL_COMP1_BUF_DONE		BIT(1)
+#define		STATUS2_DUAL_COMP2_BUF_DONE		BIT(2)
+#define		STATUS2_DUAL_COMP3_BUF_DONE		BIT(3)
+#define		STATUS2_DUAL_COMP4_BUF_DONE		BIT(4)
+#define		STATUS2_DUAL_COMP5_BUF_DONE		BIT(5)
+#define		STATUS2_DUAL_COMP_BUF_DONE(n)		BIT(n)
+#define		STATUS2_DUAL_COMP_ERROR			BIT(6)
+#define		STATUS2_DUAL_COMP_OVERWRITE		BIT(7)
+
+#define VFE_BUS_IRQ_CLEAR_GLOBAL		(0x2068)
+
+#define VFE_BUS_WM_DEBUG_STATUS_CFG		(0x226c)
+#define		DEBUG_STATUS_CFG_STATUS0(n)	BIT(n)
+#define		DEBUG_STATUS_CFG_STATUS1(n)	BIT(8 + (n))
+
+#define VFE_BUS_WM_ADDR_SYNC_FRAME_HEADER	(0x2080)
+
+#define VFE_BUS_WM_ADDR_SYNC_NO_SYNC		(0x2084)
+#define		BUS_VER2_MAX_CLIENTS (24)
+#define		WM_ADDR_NO_SYNC_DEFAULT_VAL \
+				((1 << BUS_VER2_MAX_CLIENTS) - 1)
+
+#define VFE_BUS_WM_CGC_OVERRIDE			(0x200c)
+#define		WM_CGC_OVERRIDE_ALL		(0xFFFFF)
+
+#define VFE_BUS_WM_TEST_BUS_CTRL		(0x211c)
+
+#define VFE_BUS_WM_STATUS0(n)			(0x2200 + (n) * 0x100)
+#define VFE_BUS_WM_STATUS1(n)			(0x2204 + (n) * 0x100)
+#define VFE_BUS_WM_CFG(n)			(0x2208 + (n) * 0x100)
+#define		WM_CFG_EN			(0)
+#define		WM_CFG_MODE			(1)
+#define			MODE_QCOM_PLAIN	(0)
+#define			MODE_MIPI_RAW	(1)
+#define		WM_CFG_VIRTUALFRAME		(2)
+#define VFE_BUS_WM_HEADER_ADDR(n)		(0x220c + (n) * 0x100)
+#define VFE_BUS_WM_HEADER_CFG(n)		(0x2210 + (n) * 0x100)
+#define VFE_BUS_WM_IMAGE_ADDR(n)		(0x2214 + (n) * 0x100)
+#define VFE_BUS_WM_IMAGE_ADDR_OFFSET(n)		(0x2218 + (n) * 0x100)
+#define VFE_BUS_WM_BUFFER_WIDTH_CFG(n)		(0x221c + (n) * 0x100)
+#define		WM_BUFFER_DEFAULT_WIDTH		(0xFF01)
+
+#define VFE_BUS_WM_BUFFER_HEIGHT_CFG(n)		(0x2220 + (n) * 0x100)
+#define VFE_BUS_WM_PACKER_CFG(n)		(0x2224 + (n) * 0x100)
+
+#define VFE_BUS_WM_STRIDE(n)			(0x2228 + (n) * 0x100)
+#define		WM_STRIDE_DEFAULT_STRIDE	(0xFF01)
+
+#define VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(n)	(0x2248 + (n) * 0x100)
+#define VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(n)	(0x224c + (n) * 0x100)
+#define VFE_BUS_WM_FRAMEDROP_PERIOD(n)		(0x2250 + (n) * 0x100)
+#define VFE_BUS_WM_FRAMEDROP_PATTERN(n)		(0x2254 + (n) * 0x100)
+#define VFE_BUS_WM_FRAME_INC(n)			(0x2258 + (n) * 0x100)
+#define VFE_BUS_WM_BURST_LIMIT(n)		(0x225c + (n) * 0x100)
+
+static void vfe_hw_version_read(struct vfe_device *vfe, struct device *dev)
+{
+	u32 hw_version = readl_relaxed(vfe->base + VFE_HW_VERSION);
+
+	u32 gen = (hw_version >> 28) & 0xF;
+	u32 rev = (hw_version >> 16) & 0xFFF;
+	u32 step = hw_version & 0xFFFF;
+
+	dev_err(dev, "VFE HW Version = %u.%u.%u\n", gen, rev, step);
+}
+
+static inline void vfe_reg_clr(struct vfe_device *vfe, u32 reg, u32 clr_bits)
+{
+	u32 bits = readl_relaxed(vfe->base + reg);
+
+	writel_relaxed(bits & ~clr_bits, vfe->base + reg);
+}
+
+static inline void vfe_reg_set(struct vfe_device *vfe, u32 reg, u32 set_bits)
+{
+	u32 bits = readl_relaxed(vfe->base + reg);
+
+	writel_relaxed(bits | set_bits, vfe->base + reg);
+}
+
+static void vfe_global_reset(struct vfe_device *vfe)
+{
+	u32 reset_bits = GLOBAL_RESET_CMD_CORE		|
+			 GLOBAL_RESET_CMD_CAMIF		|
+			 GLOBAL_RESET_CMD_BUS		|
+			 GLOBAL_RESET_CMD_BUS_BDG	|
+			 GLOBAL_RESET_CMD_REGISTER	|
+			 GLOBAL_RESET_CMD_TESTGEN	|
+			 GLOBAL_RESET_CMD_DSP		|
+			 GLOBAL_RESET_CMD_IDLE_CGC	|
+			 GLOBAL_RESET_CMD_RDI0		|
+			 GLOBAL_RESET_CMD_RDI1		|
+			 GLOBAL_RESET_CMD_RDI2;
+
+	writel_relaxed(BIT(31), vfe->base + VFE_IRQ_MASK_0);
+
+	/* Make sure IRQ mask has been written before resetting */
+	wmb();
+
+	writel_relaxed(reset_bits, vfe->base + VFE_GLOBAL_RESET_CMD);
+}
+
+static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
+{
+	u32 val;
+
+	/*Set Debug Registers*/
+	val = DEBUG_STATUS_CFG_STATUS0(1) |
+	      DEBUG_STATUS_CFG_STATUS0(7);
+	writel_relaxed(val, vfe->base + VFE_BUS_WM_DEBUG_STATUS_CFG);
+
+	/* BUS_WM_INPUT_IF_ADDR_SYNC_FRAME_HEADER */
+	writel_relaxed(0, vfe->base + VFE_BUS_WM_ADDR_SYNC_FRAME_HEADER);
+
+	/* no clock gating at bus input */
+	val = WM_CGC_OVERRIDE_ALL;
+	writel_relaxed(val, vfe->base + VFE_BUS_WM_CGC_OVERRIDE);
+
+	writel_relaxed(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
+
+	/* if addr_no_sync has default value then config the addr no sync reg */
+	val = WM_ADDR_NO_SYNC_DEFAULT_VAL;
+	writel_relaxed(val, vfe->base + VFE_BUS_WM_ADDR_SYNC_NO_SYNC);
+
+	writel_relaxed(0xf, vfe->base + VFE_BUS_WM_BURST_LIMIT(wm));
+
+	val = WM_BUFFER_DEFAULT_WIDTH;
+	writel_relaxed(val, vfe->base + VFE_BUS_WM_BUFFER_WIDTH_CFG(wm));
+
+	val = 0;
+	writel_relaxed(val, vfe->base + VFE_BUS_WM_BUFFER_HEIGHT_CFG(wm));
+
+	val = 0;
+	writel_relaxed(val, vfe->base + VFE_BUS_WM_PACKER_CFG(wm)); // XXX 1 for PLAIN8?
+
+	/* Configure stride for RDIs */
+	//val = pix->plane_fmt[0].bytesperline;
+	val = WM_STRIDE_DEFAULT_STRIDE;
+	writel_relaxed(val, vfe->base + VFE_BUS_WM_STRIDE(wm));
+
+	/* Enable WM */
+	val = 1 << WM_CFG_EN |
+	      MODE_MIPI_RAW << WM_CFG_MODE;
+	writel_relaxed(val, vfe->base + VFE_BUS_WM_CFG(wm));
+}
+
+static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
+{
+	/* Disable WM */
+	writel_relaxed(0, vfe->base + VFE_BUS_WM_CFG(wm));
+}
+
+static void vfe_wm_update(struct vfe_device *vfe, u8 wm, u32 addr,
+			  struct vfe_line *line)
+{
+	struct v4l2_pix_format_mplane *pix =
+		&line->video_out.active_fmt.fmt.pix_mp;
+	u32 stride = pix->plane_fmt[0].bytesperline;
+
+	writel_relaxed(addr, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
+	writel_relaxed(stride * pix->height, vfe->base + VFE_BUS_WM_FRAME_INC(wm));
+}
+
+static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
+{
+	vfe->reg_update |= REG_UPDATE_RDI(line_id);
+
+	/* Enforce ordering between previous reg writes and reg update */
+	wmb();
+
+	writel_relaxed(vfe->reg_update, vfe->base + VFE_REG_UPDATE_CMD);
+
+	/* Enforce ordering between reg update and subsequent reg writes */
+	wmb();
+}
+
+static inline void vfe_reg_update_clear(struct vfe_device *vfe,
+					enum vfe_line_id line_id)
+{
+	vfe->reg_update &= ~REG_UPDATE_RDI(line_id);
+}
+
+static void vfe_enable_irq_common(struct vfe_device *vfe)
+{
+	vfe_reg_set(vfe, VFE_IRQ_MASK_0, ~0u);
+	vfe_reg_set(vfe, VFE_IRQ_MASK_1, ~0u);
+
+	writel_relaxed(~0u, vfe->base + VFE_BUS_IRQ_MASK(0));
+	writel_relaxed(~0u, vfe->base + VFE_BUS_IRQ_MASK(1));
+	writel_relaxed(~0u, vfe->base + VFE_BUS_IRQ_MASK(2));
+}
+
+static void vfe_isr_halt_ack(struct vfe_device *vfe)
+{
+	complete(&vfe->halt_complete);
+}
+
+static void vfe_isr_read(struct vfe_device *vfe, u32 *status0, u32 *status1)
+{
+	*status0 = readl_relaxed(vfe->base + VFE_IRQ_STATUS_0);
+	*status1 = readl_relaxed(vfe->base + VFE_IRQ_STATUS_1);
+
+	writel_relaxed(*status0, vfe->base + VFE_IRQ_CLEAR_0);
+	writel_relaxed(*status1, vfe->base + VFE_IRQ_CLEAR_1);
+
+	/* Enforce ordering between IRQ Clear and Global IRQ Clear */
+	wmb();
+	writel_relaxed(CMD_GLOBAL_CLEAR, vfe->base + VFE_IRQ_CMD);
+}
+
+static void vfe_violation_read(struct vfe_device *vfe)
+{
+	u32 violation = readl_relaxed(vfe->base + VFE_VIOLATION_STATUS);
+
+	pr_err_ratelimited("VFE: violation = 0x%08x\n", violation);
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
+	struct vfe_device *vfe = dev;
+	u32 status0, status1, vfe_bus_status[3];
+	int i, wm;
+
+	status0 = readl_relaxed(vfe->base + VFE_IRQ_STATUS_0);
+	status1 = readl_relaxed(vfe->base + VFE_IRQ_STATUS_1);
+
+	writel_relaxed(status0, vfe->base + VFE_IRQ_CLEAR_0);
+	writel_relaxed(status1, vfe->base + VFE_IRQ_CLEAR_1);
+
+	for (i = VFE_LINE_RDI0; i <= VFE_LINE_RDI2; i++) {
+		vfe_bus_status[i] = readl_relaxed(vfe->base + VFE_BUS_IRQ_STATUS(i));
+		writel_relaxed(vfe_bus_status[i], vfe->base + VFE_BUS_IRQ_CLEAR(i));
+	}
+
+	/* Enforce ordering between IRQ reading and interpretation */
+	wmb();
+
+	writel_relaxed(CMD_GLOBAL_CLEAR, vfe->base + VFE_IRQ_CMD);
+	writel_relaxed(1, vfe->base + VFE_BUS_IRQ_CLEAR_GLOBAL);
+
+	if (status0 & STATUS_0_RESET_ACK)
+		vfe->isr_ops.reset_ack(vfe);
+
+	for (i = VFE_LINE_RDI0; i <= VFE_LINE_RDI2; i++)
+		if (status0 & STATUS_0_RDI_REG_UPDATE(i))
+			vfe->isr_ops.reg_update(vfe, i);
+
+	for (i = VFE_LINE_RDI0; i <= VFE_LINE_RDI2; i++)
+		if (status0 & STATUS_1_RDI_SOF(i))
+			vfe->isr_ops.sof(vfe, i);
+
+	for (i = 0; i < MSM_VFE_COMPOSITE_IRQ_NUM; i++)
+		if (vfe_bus_status[0] & STATUS0_COMP_BUF_DONE(i))
+			vfe->isr_ops.comp_done(vfe, i);
+
+	for (wm = 0; wm < MSM_VFE_IMAGE_MASTERS_NUM; wm++)
+		if (status0 & BIT(9))
+			if (vfe_bus_status[1] & STATUS1_WM_CLIENT_BUF_DONE(wm))
+				vfe->isr_ops.wm_done(vfe, wm);
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
+	unsigned long time;
+
+	reinit_completion(&vfe->halt_complete);
+
+	time = wait_for_completion_timeout(&vfe->halt_complete,
+					   msecs_to_jiffies(VFE_HALT_TIMEOUT_MS));
+	if (!time) {
+		dev_err(vfe->camss->dev, "VFE halt timeout\n");
+		return -EIO;
+	}
+
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
+	const struct vfe_hw_ops *ops = vfe->ops;
+	struct media_entity *sensor;
+	unsigned long flags;
+	unsigned int frame_skip = 0;
+	unsigned int i;
+
+	sensor = camss_find_sensor(&line->subdev.entity);
+	if (sensor) {
+		struct v4l2_subdev *subdev = media_entity_to_v4l2_subdev(sensor);
+
+		v4l2_subdev_call(subdev, sensor, g_skip_frames, &frame_skip);
+		/* Max frame skip is 29 frames */
+		if (frame_skip > VFE_FRAME_DROP_VAL - 1)
+			frame_skip = VFE_FRAME_DROP_VAL - 1;
+	}
+
+	spin_lock_irqsave(&vfe->output_lock, flags);
+
+	ops->reg_update_clear(vfe, line->id);
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
+	ops->reg_update(vfe, line->id);
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
+ * vfe_isr_sof - Process start of frame interrupt
+ * @vfe: VFE Device
+ * @line_id: VFE line
+ */
+static void vfe_isr_sof(struct vfe_device *vfe, enum vfe_line_id line_id)
+{
+	/* nop */
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
+	vfe->ops->reg_update_clear(vfe, line_id);
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
+static const struct vfe_isr_ops vfe_isr_ops_170 = {
+	.reset_ack = vfe_isr_reset_ack,
+	.halt_ack = vfe_isr_halt_ack,
+	.reg_update = vfe_isr_reg_update,
+	.sof = vfe_isr_sof,
+	.comp_done = vfe_isr_comp_done,
+	.wm_done = vfe_isr_wm_done,
+};
+
+static const struct camss_video_ops vfe_video_ops_170 = {
+	.queue_buffer = vfe_queue_buffer,
+	.flush_buffers = vfe_flush_buffers,
+};
+
+static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
+{
+	vfe->isr_ops = vfe_isr_ops_170;
+	vfe->video_ops = vfe_video_ops_170;
+
+	vfe->line_num = VFE_LINE_NUM_GEN2;
+}
+
+const struct vfe_hw_ops vfe_ops_170 = {
+	.global_reset = vfe_global_reset,
+	.hw_version_read = vfe_hw_version_read,
+	.isr_read = vfe_isr_read,
+	.isr = vfe_isr,
+	.reg_update_clear = vfe_reg_update_clear,
+	.reg_update = vfe_reg_update,
+	.subdev_init = vfe_subdev_init,
+	.vfe_disable = vfe_disable,
+	.vfe_enable = vfe_enable,
+	.vfe_halt = vfe_halt,
+	.violation_read = vfe_violation_read,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index e8cf66416004..c4b2c8edb760 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -96,6 +96,32 @@ static const struct vfe_format formats_pix_8x96[] = {
 	{ MEDIA_BUS_FMT_YVYU8_2X8, 8 },
 };
 
+static const struct vfe_format formats_rdi_845[] = {
+	{ MEDIA_BUS_FMT_UYVY8_2X8, 8 },
+	{ MEDIA_BUS_FMT_VYUY8_2X8, 8 },
+	{ MEDIA_BUS_FMT_YUYV8_2X8, 8 },
+	{ MEDIA_BUS_FMT_YVYU8_2X8, 8 },
+	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8 },
+	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8 },
+	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8 },
+	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8 },
+	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10 },
+	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10 },
+	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10 },
+	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10 },
+	{ MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, 16 },
+	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12 },
+	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12 },
+	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12 },
+	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12 },
+	{ MEDIA_BUS_FMT_SBGGR14_1X14, 14 },
+	{ MEDIA_BUS_FMT_SGBRG14_1X14, 14 },
+	{ MEDIA_BUS_FMT_SGRBG14_1X14, 14 },
+	{ MEDIA_BUS_FMT_SRGGB14_1X14, 14 },
+	{ MEDIA_BUS_FMT_Y10_1X10, 10 },
+	{ MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, 16 },
+};
+
 /*
  * vfe_get_bpp - map media bus format to bits per pixel
  * @formats: supported media bus formats array
@@ -192,7 +218,8 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 			return sink_code;
 		}
 	else if (vfe->camss->version == CAMSS_8x96 ||
-		 vfe->camss->version == CAMSS_660)
+		 vfe->camss->version == CAMSS_660 ||
+		 vfe->camss->version == CAMSS_845)
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_2X8:
 		{
@@ -256,13 +283,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 		return 0;
 }
 
-/*
- * vfe_reset - Trigger reset on VFE module and wait to complete
- * @vfe: VFE device
- *
- * Return 0 on success or a negative error code otherwise
- */
-static int vfe_reset(struct vfe_device *vfe)
+int vfe_reset(struct vfe_device *vfe)
 {
 	unsigned long time;
 
@@ -429,7 +450,8 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
 		struct camss_clock *clock = &vfe->clock[i];
 
 		if (!strcmp(clock->name, "vfe0") ||
-		    !strcmp(clock->name, "vfe1")) {
+		    !strcmp(clock->name, "vfe1") ||
+		    !strcmp(clock->name, "vfe_lite")) {
 			u64 min_rate = 0;
 			long rate;
 
@@ -1268,6 +1290,10 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 	case CAMSS_660:
 		vfe->ops = &vfe_ops_4_8;
 		break;
+
+	case CAMSS_845:
+		vfe->ops = &vfe_ops_170;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1379,6 +1405,9 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 				l->formats = formats_rdi_8x96;
 				l->nformats = ARRAY_SIZE(formats_rdi_8x96);
 			}
+		} else if (camss->version == CAMSS_845) {
+			l->formats = formats_rdi_845;
+			l->nformats = ARRAY_SIZE(formats_rdi_845);
 		} else {
 			return -EINVAL;
 		}
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index ceff4985b1cc..57bdc758f0a8 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -43,7 +43,8 @@ enum vfe_output_state {
 	VFE_OUTPUT_SINGLE,
 	VFE_OUTPUT_CONTINUOUS,
 	VFE_OUTPUT_IDLE,
-	VFE_OUTPUT_STOPPING
+	VFE_OUTPUT_STOPPING,
+	VFE_OUTPUT_ON,
 };
 
 enum vfe_line_id {
@@ -51,6 +52,7 @@ enum vfe_line_id {
 	VFE_LINE_RDI0 = 0,
 	VFE_LINE_RDI1 = 1,
 	VFE_LINE_RDI2 = 2,
+	VFE_LINE_NUM_GEN2 = 3,
 	VFE_LINE_PIX = 3,
 	VFE_LINE_NUM_GEN1 = 4,
 	VFE_LINE_NUM_MAX = 4
@@ -71,6 +73,9 @@ struct vfe_output {
 			int active_buf;
 			int wait_sof;
 		} gen1;
+		struct {
+			int active_num;
+		} gen2;
 	};
 	enum vfe_output_state state;
 	unsigned int sequence;
@@ -168,14 +173,6 @@ void vfe_buf_add_pending(struct vfe_output *output, struct camss_buffer *buffer)
 
 struct camss_buffer *vfe_buf_get_pending(struct vfe_output *output);
 
-/*
- * vfe_disable - Disable streaming on VFE line
- * @line: VFE line
- *
- * Return 0 on success or a negative error code otherwise
- */
-int vfe_disable(struct vfe_line *line);
-
 int vfe_flush_buffers(struct camss_video *vid, enum vb2_buffer_state state);
 
 /*
@@ -190,8 +187,17 @@ int vfe_put_output(struct vfe_line *line);
 int vfe_release_wm(struct vfe_device *vfe, u8 wm);
 int vfe_reserve_wm(struct vfe_device *vfe, enum vfe_line_id line_id);
 
+/*
+ * vfe_reset - Trigger reset on VFE module and wait to complete
+ * @vfe: VFE device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+int vfe_reset(struct vfe_device *vfe);
+
 extern const struct vfe_hw_ops vfe_ops_4_1;
 extern const struct vfe_hw_ops vfe_ops_4_7;
 extern const struct vfe_hw_ops vfe_ops_4_8;
+extern const struct vfe_hw_ops vfe_ops_170;
 
 #endif /* QC_MSM_CAMSS_VFE_H */
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 97cea7c4d769..f282275af626 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -133,6 +133,55 @@ static const struct camss_format_info formats_rdi_8x96[] = {
 	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
 };
 
+static const struct camss_format_info formats_rdi_845[] = {
+	{ MEDIA_BUS_FMT_UYVY8_2X8, V4L2_PIX_FMT_UYVY, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
+	{ MEDIA_BUS_FMT_VYUY8_2X8, V4L2_PIX_FMT_VYUY, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
+	{ MEDIA_BUS_FMT_YUYV8_2X8, V4L2_PIX_FMT_YUYV, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
+	{ MEDIA_BUS_FMT_YVYU8_2X8, V4L2_PIX_FMT_YVYU, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
+	{ MEDIA_BUS_FMT_SBGGR8_1X8, V4L2_PIX_FMT_SBGGR8, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
+	{ MEDIA_BUS_FMT_SGBRG8_1X8, V4L2_PIX_FMT_SGBRG8, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
+	{ MEDIA_BUS_FMT_SGRBG8_1X8, V4L2_PIX_FMT_SGRBG8, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
+	{ MEDIA_BUS_FMT_SRGGB8_1X8, V4L2_PIX_FMT_SRGGB8, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
+	{ MEDIA_BUS_FMT_SBGGR10_1X10, V4L2_PIX_FMT_SBGGR10P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
+	{ MEDIA_BUS_FMT_SGBRG10_1X10, V4L2_PIX_FMT_SGBRG10P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
+	{ MEDIA_BUS_FMT_SGRBG10_1X10, V4L2_PIX_FMT_SGRBG10P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
+	{ MEDIA_BUS_FMT_SRGGB10_1X10, V4L2_PIX_FMT_SRGGB10P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
+	{ MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, V4L2_PIX_FMT_SBGGR10, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
+	{ MEDIA_BUS_FMT_SBGGR12_1X12, V4L2_PIX_FMT_SBGGR12P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
+	{ MEDIA_BUS_FMT_SGBRG12_1X12, V4L2_PIX_FMT_SGBRG12P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
+	{ MEDIA_BUS_FMT_SGRBG12_1X12, V4L2_PIX_FMT_SGRBG12P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
+	{ MEDIA_BUS_FMT_SRGGB12_1X12, V4L2_PIX_FMT_SRGGB12P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
+	{ MEDIA_BUS_FMT_SBGGR14_1X14, V4L2_PIX_FMT_SBGGR14P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
+	{ MEDIA_BUS_FMT_SGBRG14_1X14, V4L2_PIX_FMT_SGBRG14P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
+	{ MEDIA_BUS_FMT_SGRBG14_1X14, V4L2_PIX_FMT_SGRBG14P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
+	{ MEDIA_BUS_FMT_SRGGB14_1X14, V4L2_PIX_FMT_SRGGB14P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
+	{ MEDIA_BUS_FMT_Y10_1X10, V4L2_PIX_FMT_Y10P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
+	{ MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, V4L2_PIX_FMT_Y10, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
+};
+
 static const struct camss_format_info formats_pix_8x16[] = {
 	{ MEDIA_BUS_FMT_YUYV8_1_5X8, V4L2_PIX_FMT_NV12, 1,
 	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
@@ -960,6 +1009,9 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 			video->formats = formats_rdi_8x96;
 			video->nformats = ARRAY_SIZE(formats_rdi_8x96);
 		}
+	}  else if (video->camss->version == CAMSS_845) {
+		video->formats = formats_rdi_845;
+		video->nformats = ARRAY_SIZE(formats_rdi_845);
 	} else {
 		ret = -EINVAL;
 		goto error_video_register;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 49e25c837bdc..addc14016c09 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -465,6 +465,67 @@ static const struct resources vfe_res_660[] = {
 	}
 };
 
+static const struct resources vfe_res_845[] = {
+	/* VFE0 */
+	{
+		.regulator = { NULL },
+		.clock = { "camnoc_axi", "cpas_ahb", "slow_ahb_src",
+				"soc_ahb", "vfe0", "vfe0_axi",
+				"vfe0_src", "csi0",
+				"csi0_src"},
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 80000000 },
+				{ 0 },
+				{ 19200000, 100000000, 320000000, 404000000, 480000000, 600000000 },
+				{ 0 },
+				{ 320000000 },
+				{ 19200000, 75000000, 384000000, 538666667 },
+				{ 384000000 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" }
+	},
+
+	/* VFE1 */
+	{
+		.regulator = { NULL },
+		.clock = { "camnoc_axi", "cpas_ahb", "slow_ahb_src",
+				"soc_ahb", "vfe1", "vfe1_axi",
+				"vfe1_src", "csi1",
+				"csi1_src"},
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 80000000 },
+				{ 0 },
+				{ 19200000, 100000000, 320000000, 404000000, 480000000, 600000000 },
+				{ 0 },
+				{ 320000000 },
+				{ 19200000, 75000000, 384000000, 538666667 },
+				{ 384000000 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" }
+	},
+
+	/* VFE-lite */
+	{
+		.regulator = { NULL },
+		.clock = { "camnoc_axi", "cpas_ahb", "slow_ahb_src",
+				"soc_ahb", "vfe_lite",
+				"vfe_lite_src", "csi2",
+				"csi2_src"},
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 80000000 },
+				{ 0 },
+				{ 19200000, 100000000, 320000000, 404000000, 480000000, 600000000 },
+				{ 320000000 },
+				{ 19200000, 75000000, 384000000, 538666667 },
+				{ 384000000 } },
+		.reg = { "vfe_lite" },
+		.interrupt = { "vfe_lite" }
+	}
+};
+
 /*
  * camss_add_clock_margin - Add margin to clock frequency rate
  * @rate: Clock frequency rate
-- 
2.27.0

