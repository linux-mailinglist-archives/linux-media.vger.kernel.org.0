Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59ACF2EF1D6
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 13:08:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727449AbhAHMGc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 07:06:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727418AbhAHMG1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 07:06:27 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E082BC0612A7
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 04:05:03 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id qw4so14109069ejb.12
        for <linux-media@vger.kernel.org>; Fri, 08 Jan 2021 04:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9b8cQkLU+Dm9rRUSZ/+A4LA2sYXr9x7Uxhw8X0MgEro=;
        b=dZMP0tAn2fNx8hoqdViPJakxwDSqbu1sTfXIcAJCEpePy+kJJXifgCQD8aPhD+l15v
         /mTQdiII1jU/R6Uu/cHIWhbL9OpYdKhAc/xmiNlInfVmKB95LPvn/larYEhvPVtoxPkW
         46bmY8G6Nq50dVjBoQCv3Y4FuVaMcq9X/RnDDId0OrPrgrj49fcaaG9cVXHf0spujKIU
         Ks/E+Utl7kOolTk3kLT3Nw0Isb8LnCnNjx2p3AKJZcL9atBTaVCV20dHqFEDwgrrRwpR
         IVuAa/qyqqIK7xgK4AheYOGZhL2VTo7yBwuzPwMgY+vGR293UMcwc9Nu59UJnXCzdogF
         WGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9b8cQkLU+Dm9rRUSZ/+A4LA2sYXr9x7Uxhw8X0MgEro=;
        b=SbqzhGHZrTuK6hJ4Ym6KAVYoZZt1OPyqVQsCJWhXi/4ZhxMJV9OqdjuINPMzMO43tA
         twpbdMm4MEsx0Zs8yit5psQ8Df8LZ0u19d1drHbhlRzsQ+tnNOjFTbQScnqoK7v5t/rz
         lrM7lJ2U8QOY3YzFB5YC0M/on4JGqQMfjGLqL/2EmQcL/2xwYwwDgVZVT6s3+07VkP0I
         vAVa+9hjVfmWPHvcNfz6TBZeo4vZWAT3YVt68/9yGbdeo6phmdS4te217A04N7RNZYTC
         udsjlPoLjByD5AtsWENSO609zXKEz6XvV0MlYgZKOh3lzUL9lJr6ipr5P2qErZOmBdv9
         RrZw==
X-Gm-Message-State: AOAM531oKmR90Fown7dUrIieVmSdx7NgtJJx67Rp+s7K73RFtyXZVObi
        +S6ZD+qea4wBj1kuBAFrCRzMAw==
X-Google-Smtp-Source: ABdhPJzgXRkGoGhYhsfAhfYZfXn+6jxKZoMqNi/z1vfKddo0VpO9KUUSio2GQ1oSV2V7fEyS8J+akA==
X-Received: by 2002:a17:906:3712:: with SMTP id d18mr2557205ejc.178.1610107501841;
        Fri, 08 Jan 2021 04:05:01 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:bb2e:8b50:322a:1b9a])
        by smtp.gmail.com with ESMTPSA id i18sm3674498edt.68.2021.01.08.04.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 04:05:00 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        arnd@arndb.de, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 05/17] media: camss: Refactor VFE HW version support
Date:   Fri,  8 Jan 2021 13:04:17 +0100
Message-Id: <20210108120429.895046-6-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210108120429.895046-1-robert.foss@linaro.org>
References: <20210108120429.895046-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to support Qualcomm ISP hardware architectures that diverge
from older architectures, the VFE subdevice driver needs to be refactored
to better abstract the different ISP architectures.

Gen1 represents the CAMSS ISP architecture. The ISP architecture developed
after CAMSS, Titan, will be referred to as Gen2.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/Makefile    |    2 +
 .../media/platform/qcom/camss/camss-vfe-4-1.c |  117 +-
 .../media/platform/qcom/camss/camss-vfe-4-7.c |  238 ++--
 .../media/platform/qcom/camss/camss-vfe-4-8.c | 1166 +++++++++++++++++
 .../platform/qcom/camss/camss-vfe-gen1.c      |  760 +++++++++++
 .../platform/qcom/camss/camss-vfe-gen1.h      |  110 ++
 drivers/media/platform/qcom/camss/camss-vfe.c |  770 +----------
 drivers/media/platform/qcom/camss/camss-vfe.h |  113 +-
 8 files changed, 2241 insertions(+), 1035 deletions(-)
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-4-8.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-gen1.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-gen1.h

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 63c1b1b2943c..940c0ae3e003 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -10,6 +10,8 @@ qcom-camss-objs += \
 		camss-ispif.o \
 		camss-vfe-4-1.o \
 		camss-vfe-4-7.o \
+		camss-vfe-4-8.o \
+		camss-vfe-gen1.o \
 		camss-vfe.o \
 		camss-video.o \
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index a1b56b89130d..269dc0860de9 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -12,7 +12,9 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 
+#include "camss.h"
 #include "camss-vfe.h"
+#include "camss-vfe-gen1.h"
 
 #define VFE_0_HW_VERSION		0x000
 
@@ -283,30 +285,6 @@ static void vfe_wm_frame_based(struct vfe_device *vfe, u8 wm, u8 enable)
 			1 << VFE_0_BUS_IMAGE_MASTER_n_WR_CFG_FRM_BASED_SHIFT);
 }
 
-#define CALC_WORD(width, M, N) (((width) * (M) + (N) - 1) / (N))
-
-static int vfe_word_per_line(u32 format, u32 pixel_per_line)
-{
-	int val = 0;
-
-	switch (format) {
-	case V4L2_PIX_FMT_NV12:
-	case V4L2_PIX_FMT_NV21:
-	case V4L2_PIX_FMT_NV16:
-	case V4L2_PIX_FMT_NV61:
-		val = CALC_WORD(pixel_per_line, 1, 8);
-		break;
-	case V4L2_PIX_FMT_YUYV:
-	case V4L2_PIX_FMT_YVYU:
-	case V4L2_PIX_FMT_UYVY:
-	case V4L2_PIX_FMT_VYUY:
-		val = CALC_WORD(pixel_per_line, 2, 8);
-		break;
-	}
-
-	return val;
-}
-
 static void vfe_get_wm_sizes(struct v4l2_pix_format_mplane *pix, u8 plane,
 			     u16 *width, u16 *height, u16 *bytesperline)
 {
@@ -665,20 +643,6 @@ static void vfe_set_demux_cfg(struct vfe_device *vfe, struct vfe_line *line)
 	writel_relaxed(odd_cfg, vfe->base + VFE_0_DEMUX_ODD_CFG);
 }
 
-static inline u8 vfe_calc_interp_reso(u16 input, u16 output)
-{
-	if (input / output >= 16)
-		return 0;
-
-	if (input / output >= 8)
-		return 1;
-
-	if (input / output >= 4)
-		return 2;
-
-	return 3;
-}
-
 static void vfe_set_scale_cfg(struct vfe_device *vfe, struct vfe_line *line)
 {
 	u32 p = line->video_out.active_fmt.fmt.pix_mp.pixelformat;
@@ -974,46 +938,61 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-const struct vfe_hw_ops vfe_ops_4_1 = {
-	.hw_version_read = vfe_hw_version_read,
+
+const struct vfe_hw_ops_gen1 vfe_ops_gen1_4_1 = {
+	.bus_connect_wm_to_rdi = vfe_bus_connect_wm_to_rdi,
+	.bus_disconnect_wm_from_rdi = vfe_bus_disconnect_wm_from_rdi,
+	.bus_enable_wr_if = vfe_bus_enable_wr_if,
+	.bus_reload_wm = vfe_bus_reload_wm,
+	.camif_wait_for_stop = vfe_camif_wait_for_stop,
+	.enable_irq_common = vfe_enable_irq_common,
+	.enable_irq_pix_line = vfe_enable_irq_pix_line,
+	.enable_irq_wm_line = vfe_enable_irq_wm_line,
 	.get_ub_size = vfe_get_ub_size,
-	.global_reset = vfe_global_reset,
-	.halt_request = vfe_halt_request,
 	.halt_clear = vfe_halt_clear,
+	.halt_request = vfe_halt_request,
+	.set_camif_cfg = vfe_set_camif_cfg,
+	.set_camif_cmd = vfe_set_camif_cmd,
+	.set_cgc_override = vfe_set_cgc_override,
+	.set_clamp_cfg = vfe_set_clamp_cfg,
+	.set_crop_cfg = vfe_set_crop_cfg,
+	.set_demux_cfg = vfe_set_demux_cfg,
+	.set_ds = vfe_set_ds,
+	.set_module_cfg = vfe_set_module_cfg,
+	.set_qos = vfe_set_qos,
+	.set_rdi_cid = vfe_set_rdi_cid,
+	.set_realign_cfg = vfe_set_realign_cfg,
+	.set_scale_cfg = vfe_set_scale_cfg,
+	.set_xbar_cfg = vfe_set_xbar_cfg,
 	.wm_enable = vfe_wm_enable,
 	.wm_frame_based = vfe_wm_frame_based,
+	.wm_get_ping_pong_status = vfe_wm_get_ping_pong_status,
 	.wm_line_based = vfe_wm_line_based,
-	.wm_set_framedrop_period = vfe_wm_set_framedrop_period,
 	.wm_set_framedrop_pattern = vfe_wm_set_framedrop_pattern,
-	.wm_set_ub_cfg = vfe_wm_set_ub_cfg,
-	.bus_reload_wm = vfe_bus_reload_wm,
+	.wm_set_framedrop_period = vfe_wm_set_framedrop_period,
 	.wm_set_ping_addr = vfe_wm_set_ping_addr,
 	.wm_set_pong_addr = vfe_wm_set_pong_addr,
-	.wm_get_ping_pong_status = vfe_wm_get_ping_pong_status,
-	.bus_enable_wr_if = vfe_bus_enable_wr_if,
-	.bus_connect_wm_to_rdi = vfe_bus_connect_wm_to_rdi,
 	.wm_set_subsample = vfe_wm_set_subsample,
-	.bus_disconnect_wm_from_rdi = vfe_bus_disconnect_wm_from_rdi,
-	.set_xbar_cfg = vfe_set_xbar_cfg,
-	.set_realign_cfg = vfe_set_realign_cfg,
-	.set_rdi_cid = vfe_set_rdi_cid,
-	.reg_update = vfe_reg_update,
-	.reg_update_clear = vfe_reg_update_clear,
-	.enable_irq_wm_line = vfe_enable_irq_wm_line,
-	.enable_irq_pix_line = vfe_enable_irq_pix_line,
-	.enable_irq_common = vfe_enable_irq_common,
-	.set_demux_cfg = vfe_set_demux_cfg,
-	.set_scale_cfg = vfe_set_scale_cfg,
-	.set_crop_cfg = vfe_set_crop_cfg,
-	.set_clamp_cfg = vfe_set_clamp_cfg,
-	.set_qos = vfe_set_qos,
-	.set_ds = vfe_set_ds,
-	.set_cgc_override = vfe_set_cgc_override,
-	.set_camif_cfg = vfe_set_camif_cfg,
-	.set_camif_cmd = vfe_set_camif_cmd,
-	.set_module_cfg = vfe_set_module_cfg,
-	.camif_wait_for_stop = vfe_camif_wait_for_stop,
+	.wm_set_ub_cfg = vfe_wm_set_ub_cfg,
+};
+
+static void vfe_subdev_init(struct vfe_device *vfe)
+{
+	vfe->isr_ops = vfe_isr_ops_gen1;
+	vfe->ops_gen1 = &vfe_ops_gen1_4_1;
+	vfe->video_ops = vfe_video_ops_gen1;
+}
+
+const struct vfe_hw_ops vfe_ops_4_1 = {
+	.global_reset = vfe_global_reset,
+	.hw_version_read = vfe_hw_version_read,
 	.isr_read = vfe_isr_read,
-	.violation_read = vfe_violation_read,
 	.isr = vfe_isr,
+	.reg_update_clear = vfe_reg_update_clear,
+	.reg_update = vfe_reg_update,
+	.subdev_init = vfe_subdev_init,
+	.vfe_disable = vfe_gen1_disable,
+	.vfe_enable = vfe_gen1_enable,
+	.vfe_halt = vfe_gen1_halt,
+	.violation_read = vfe_violation_read,
 };
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index 84c33b8f9fe3..d0d470be1c10 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -12,7 +12,10 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 
+#include "camss.h"
 #include "camss-vfe.h"
+#include "camss-vfe-gen1.h"
+
 
 #define VFE_0_HW_VERSION		0x000
 
@@ -257,7 +260,7 @@ static void vfe_hw_version_read(struct vfe_device *vfe, struct device *dev)
 	dev_err(dev, "VFE HW Version = 0x%08x\n", hw_version);
 }
 
-static u16 vfe47_get_ub_size(u8 vfe_id)
+static u16 vfe_get_ub_size(u8 vfe_id)
 {
 	if (vfe_id == 0)
 		return MSM_VFE_VFE0_UB_SIZE_RDI;
@@ -295,6 +298,8 @@ static void vfe_global_reset(struct vfe_device *vfe)
 			 VFE_0_GLOBAL_RESET_CMD_CORE;
 
 	writel_relaxed(BIT(31), vfe->base + VFE_0_IRQ_MASK_0);
+
+	/* Enforce barrier between IRQ mask setup and global reset */
 	wmb();
 	writel_relaxed(reset_bits, vfe->base + VFE_0_GLOBAL_RESET_CMD);
 }
@@ -310,7 +315,7 @@ static void vfe_halt_clear(struct vfe_device *vfe)
 	writel_relaxed(0x0, vfe->base + VFE_0_BUS_BDG_CMD);
 }
 
-static void vfe47_wm_enable(struct vfe_device *vfe, u8 wm, u8 enable)
+static void vfe_wm_enable(struct vfe_device *vfe, u8 wm, u8 enable)
 {
 	if (enable)
 		vfe_reg_set(vfe, VFE_0_BUS_IMAGE_MASTER_n_WR_CFG(wm),
@@ -459,8 +464,12 @@ static void vfe_wm_set_ub_cfg(struct vfe_device *vfe, u8 wm,
 
 static void vfe_bus_reload_wm(struct vfe_device *vfe, u8 wm)
 {
+	/* Enforce barrier between any outstanding register write */
 	wmb();
+
 	writel_relaxed(VFE_0_BUS_CMD_Mx_RLD_CMD(wm), vfe->base + VFE_0_BUS_CMD);
+
+	/* Use barrier to make sure bus reload is issued before anything else */
 	wmb();
 }
 
@@ -674,8 +683,12 @@ static void vfe_set_rdi_cid(struct vfe_device *vfe, enum vfe_line_id id, u8 cid)
 static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
 {
 	vfe->reg_update |= VFE_0_REG_UPDATE_line_n(line_id);
+
+	/* Enforce barrier between line update and commit */
 	wmb();
 	writel_relaxed(vfe->reg_update, vfe->base + VFE_0_REG_UPDATE);
+
+	/* Make sure register update is issued before further reg writes */
 	wmb();
 }
 
@@ -779,20 +792,6 @@ static void vfe_set_demux_cfg(struct vfe_device *vfe, struct vfe_line *line)
 	writel_relaxed(odd_cfg, vfe->base + VFE_0_DEMUX_ODD_CFG);
 }
 
-static inline u8 vfe_calc_interp_reso(u16 input, u16 output)
-{
-	if (input / output >= 16)
-		return 0;
-
-	if (input / output >= 8)
-		return 1;
-
-	if (input / output >= 4)
-		return 2;
-
-	return 3;
-}
-
 static void vfe_set_scale_cfg(struct vfe_device *vfe, struct vfe_line *line)
 {
 	u32 p = line->video_out.active_fmt.fmt.pix_mp.pixelformat;
@@ -894,7 +893,7 @@ static void vfe_set_clamp_cfg(struct vfe_device *vfe)
 	writel_relaxed(val, vfe->base + VFE_0_CLAMP_ENC_MIN_CFG);
 }
 
-static void vfe47_set_qos(struct vfe_device *vfe)
+static void vfe_set_qos(struct vfe_device *vfe)
 {
 	u32 val = VFE_0_BUS_BDG_QOS_CFG_0_CFG;
 	u32 val7 = VFE_0_BUS_BDG_QOS_CFG_7_CFG;
@@ -909,7 +908,7 @@ static void vfe47_set_qos(struct vfe_device *vfe)
 	writel_relaxed(val7, vfe->base + VFE_0_BUS_BDG_QOS_CFG_7);
 }
 
-static void vfe47_set_ds(struct vfe_device *vfe)
+static void vfe_set_ds(struct vfe_device *vfe)
 {
 	u32 val = VFE_0_BUS_BDG_DS_CFG_0_CFG;
 	u32 val16 = VFE_0_BUS_BDG_DS_CFG_16_CFG;
@@ -993,6 +992,8 @@ static void vfe_set_camif_cmd(struct vfe_device *vfe, u8 enable)
 
 	cmd = VFE_0_CAMIF_CMD_CLEAR_CAMIF_STATUS | VFE_0_CAMIF_CMD_NO_CHANGE;
 	writel_relaxed(cmd, vfe->base + VFE_0_CAMIF_CMD);
+
+	/* Make sure camif command is issued written before it is changed again */
 	wmb();
 
 	if (enable)
@@ -1035,24 +1036,7 @@ static int vfe_camif_wait_for_stop(struct vfe_device *vfe, struct device *dev)
 	return ret;
 }
 
-static void vfe_isr_read(struct vfe_device *vfe, u32 *value0, u32 *value1)
-{
-	*value0 = readl_relaxed(vfe->base + VFE_0_IRQ_STATUS_0);
-	*value1 = readl_relaxed(vfe->base + VFE_0_IRQ_STATUS_1);
 
-	writel_relaxed(*value0, vfe->base + VFE_0_IRQ_CLEAR_0);
-	writel_relaxed(*value1, vfe->base + VFE_0_IRQ_CLEAR_1);
-
-	wmb();
-	writel_relaxed(VFE_0_IRQ_CMD_GLOBAL_CLEAR, vfe->base + VFE_0_IRQ_CMD);
-}
-
-static void vfe_violation_read(struct vfe_device *vfe)
-{
-	u32 violation = readl_relaxed(vfe->base + VFE_0_VIOLATION_STATUS);
-
-	pr_err_ratelimited("VFE: violation = 0x%08x\n", violation);
-}
 
 /*
  * vfe_isr - VFE module interrupt handler
@@ -1107,150 +1091,80 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-const struct vfe_hw_ops vfe_ops_4_7 = {
-	.hw_version_read = vfe_hw_version_read,
-	.get_ub_size = vfe47_get_ub_size,
-	.global_reset = vfe_global_reset,
-	.halt_request = vfe_halt_request,
-	.halt_clear = vfe_halt_clear,
-	.wm_enable = vfe47_wm_enable,
-	.wm_frame_based = vfe_wm_frame_based,
-	.wm_line_based = vfe_wm_line_based,
-	.wm_set_framedrop_period = vfe_wm_set_framedrop_period,
-	.wm_set_framedrop_pattern = vfe_wm_set_framedrop_pattern,
-	.wm_set_ub_cfg = vfe_wm_set_ub_cfg,
-	.bus_reload_wm = vfe_bus_reload_wm,
-	.wm_set_ping_addr = vfe_wm_set_ping_addr,
-	.wm_set_pong_addr = vfe_wm_set_pong_addr,
-	.wm_get_ping_pong_status = vfe_wm_get_ping_pong_status,
-	.bus_enable_wr_if = vfe_bus_enable_wr_if,
-	.bus_connect_wm_to_rdi = vfe_bus_connect_wm_to_rdi,
-	.wm_set_subsample = vfe_wm_set_subsample,
-	.bus_disconnect_wm_from_rdi = vfe_bus_disconnect_wm_from_rdi,
-	.set_xbar_cfg = vfe_set_xbar_cfg,
-	.set_realign_cfg = vfe_set_realign_cfg,
-	.set_rdi_cid = vfe_set_rdi_cid,
-	.reg_update = vfe_reg_update,
-	.reg_update_clear = vfe_reg_update_clear,
-	.enable_irq_wm_line = vfe_enable_irq_wm_line,
-	.enable_irq_pix_line = vfe_enable_irq_pix_line,
-	.enable_irq_common = vfe_enable_irq_common,
-	.set_demux_cfg = vfe_set_demux_cfg,
-	.set_scale_cfg = vfe_set_scale_cfg,
-	.set_crop_cfg = vfe_set_crop_cfg,
-	.set_clamp_cfg = vfe_set_clamp_cfg,
-	.set_qos = vfe47_set_qos,
-	.set_ds = vfe47_set_ds,
-	.set_cgc_override = vfe_set_cgc_override,
-	.set_camif_cfg = vfe_set_camif_cfg,
-	.set_camif_cmd = vfe_set_camif_cmd,
-	.set_module_cfg = vfe_set_module_cfg,
-	.camif_wait_for_stop = vfe_camif_wait_for_stop,
-	.isr_read = vfe_isr_read,
-	.violation_read = vfe_violation_read,
-	.isr = vfe_isr,
-};
-
-static u16 vfe48_get_ub_size(u8 vfe_id)
+static void vfe_isr_read(struct vfe_device *vfe, u32 *value0, u32 *value1)
 {
-	/* On VFE4.8 the ub-size is the same on both instances */
-	return MSM_VFE_VFE0_UB_SIZE_RDI;
-}
+	*value0 = readl_relaxed(vfe->base + VFE_0_IRQ_STATUS_0);
+	*value1 = readl_relaxed(vfe->base + VFE_0_IRQ_STATUS_1);
 
-static void vfe48_wm_enable(struct vfe_device *vfe, u8 wm, u8 enable)
-{
-	if (enable)
-		writel_relaxed(2 << VFE48_0_BUS_IMAGE_MASTER_n_SHIFT(wm),
-			       vfe->base + VFE48_0_BUS_IMAGE_MASTER_CMD);
-	else
-		writel_relaxed(1 << VFE48_0_BUS_IMAGE_MASTER_n_SHIFT(wm),
-			       vfe->base + VFE48_0_BUS_IMAGE_MASTER_CMD);
+	writel_relaxed(*value0, vfe->base + VFE_0_IRQ_CLEAR_0);
+	writel_relaxed(*value1, vfe->base + VFE_0_IRQ_CLEAR_1);
 
-	/* The WM must be enabled before sending other commands */
+	/* Enforce barrier between local & global IRQ clear */
 	wmb();
+	writel_relaxed(VFE_0_IRQ_CMD_GLOBAL_CLEAR, vfe->base + VFE_0_IRQ_CMD);
 }
 
-static void vfe48_set_qos(struct vfe_device *vfe)
-{
-	u32 val = VFE48_0_BUS_BDG_QOS_CFG_0_CFG;
-	u32 val3 = VFE48_0_BUS_BDG_QOS_CFG_3_CFG;
-	u32 val4 = VFE48_0_BUS_BDG_QOS_CFG_4_CFG;
-	u32 val7 = VFE48_0_BUS_BDG_QOS_CFG_7_CFG;
-
-	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_0);
-	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_1);
-	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_2);
-	writel_relaxed(val3, vfe->base + VFE_0_BUS_BDG_QOS_CFG_3);
-	writel_relaxed(val4, vfe->base + VFE_0_BUS_BDG_QOS_CFG_4);
-	writel_relaxed(val4, vfe->base + VFE_0_BUS_BDG_QOS_CFG_5);
-	writel_relaxed(val4, vfe->base + VFE_0_BUS_BDG_QOS_CFG_6);
-	writel_relaxed(val7, vfe->base + VFE_0_BUS_BDG_QOS_CFG_7);
-}
-
-static void vfe48_set_ds(struct vfe_device *vfe)
+static void vfe_violation_read(struct vfe_device *vfe)
 {
-	u32 val = VFE48_0_BUS_BDG_DS_CFG_0_CFG;
-	u32 val16 = VFE48_0_BUS_BDG_DS_CFG_16_CFG;
+	u32 violation = readl_relaxed(vfe->base + VFE_0_VIOLATION_STATUS);
 
-	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_0);
-	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_1);
-	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_2);
-	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_3);
-	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_4);
-	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_5);
-	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_6);
-	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_7);
-	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_8);
-	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_9);
-	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_10);
-	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_11);
-	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_12);
-	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_13);
-	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_14);
-	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_15);
-	writel_relaxed(val16, vfe->base + VFE_0_BUS_BDG_DS_CFG_16);
+	pr_err_ratelimited("VFE: violation = 0x%08x\n", violation);
 }
 
-const struct vfe_hw_ops vfe_ops_4_8 = {
-	.hw_version_read = vfe_hw_version_read,
-	.get_ub_size = vfe48_get_ub_size,
-	.global_reset = vfe_global_reset,
-	.halt_request = vfe_halt_request,
+const struct vfe_hw_ops_gen1 vfe_ops_gen1_4_7 = {
+	.bus_connect_wm_to_rdi = vfe_bus_connect_wm_to_rdi,
+	.bus_disconnect_wm_from_rdi = vfe_bus_disconnect_wm_from_rdi,
+	.bus_enable_wr_if = vfe_bus_enable_wr_if,
+	.bus_reload_wm = vfe_bus_reload_wm,
+	.camif_wait_for_stop = vfe_camif_wait_for_stop,
+	.enable_irq_common = vfe_enable_irq_common,
+	.enable_irq_pix_line = vfe_enable_irq_pix_line,
+	.enable_irq_wm_line = vfe_enable_irq_wm_line,
+	.get_ub_size = vfe_get_ub_size,
 	.halt_clear = vfe_halt_clear,
-	.wm_enable = vfe48_wm_enable,
+	.halt_request = vfe_halt_request,
+	.set_camif_cfg = vfe_set_camif_cfg,
+	.set_camif_cmd = vfe_set_camif_cmd,
+	.set_cgc_override = vfe_set_cgc_override,
+	.set_clamp_cfg = vfe_set_clamp_cfg,
+	.set_crop_cfg = vfe_set_crop_cfg,
+	.set_demux_cfg = vfe_set_demux_cfg,
+	.set_ds = vfe_set_ds,
+	.set_module_cfg = vfe_set_module_cfg,
+	.set_qos = vfe_set_qos,
+	.set_rdi_cid = vfe_set_rdi_cid,
+	.set_realign_cfg = vfe_set_realign_cfg,
+	.set_scale_cfg = vfe_set_scale_cfg,
+	.set_xbar_cfg = vfe_set_xbar_cfg,
+	.wm_enable = vfe_wm_enable,
 	.wm_frame_based = vfe_wm_frame_based,
+	.wm_get_ping_pong_status = vfe_wm_get_ping_pong_status,
 	.wm_line_based = vfe_wm_line_based,
-	.wm_set_framedrop_period = vfe_wm_set_framedrop_period,
 	.wm_set_framedrop_pattern = vfe_wm_set_framedrop_pattern,
-	.wm_set_ub_cfg = vfe_wm_set_ub_cfg,
-	.bus_reload_wm = vfe_bus_reload_wm,
+	.wm_set_framedrop_period = vfe_wm_set_framedrop_period,
 	.wm_set_ping_addr = vfe_wm_set_ping_addr,
 	.wm_set_pong_addr = vfe_wm_set_pong_addr,
-	.wm_get_ping_pong_status = vfe_wm_get_ping_pong_status,
-	.bus_enable_wr_if = vfe_bus_enable_wr_if,
-	.bus_connect_wm_to_rdi = vfe_bus_connect_wm_to_rdi,
 	.wm_set_subsample = vfe_wm_set_subsample,
-	.bus_disconnect_wm_from_rdi = vfe_bus_disconnect_wm_from_rdi,
-	.set_xbar_cfg = vfe_set_xbar_cfg,
-	.set_realign_cfg = vfe_set_realign_cfg,
-	.set_rdi_cid = vfe_set_rdi_cid,
-	.reg_update = vfe_reg_update,
-	.reg_update_clear = vfe_reg_update_clear,
-	.enable_irq_wm_line = vfe_enable_irq_wm_line,
-	.enable_irq_pix_line = vfe_enable_irq_pix_line,
-	.enable_irq_common = vfe_enable_irq_common,
-	.set_demux_cfg = vfe_set_demux_cfg,
-	.set_scale_cfg = vfe_set_scale_cfg,
-	.set_crop_cfg = vfe_set_crop_cfg,
-	.set_clamp_cfg = vfe_set_clamp_cfg,
-	.set_qos = vfe48_set_qos,
-	.set_ds = vfe48_set_ds,
-	.set_cgc_override = vfe_set_cgc_override,
-	.set_camif_cfg = vfe_set_camif_cfg,
-	.set_camif_cmd = vfe_set_camif_cmd,
-	.set_module_cfg = vfe_set_module_cfg,
-	.camif_wait_for_stop = vfe_camif_wait_for_stop,
+	.wm_set_ub_cfg = vfe_wm_set_ub_cfg,
+};
+
+static void vfe_subdev_init(struct vfe_device *vfe)
+{
+	vfe->isr_ops = vfe_isr_ops_gen1;
+	vfe->ops_gen1 = &vfe_ops_gen1_4_7;
+	vfe->video_ops = vfe_video_ops_gen1;
+}
+
+const struct vfe_hw_ops vfe_ops_4_7 = {
+	.global_reset = vfe_global_reset,
+	.hw_version_read = vfe_hw_version_read,
 	.isr_read = vfe_isr_read,
-	.violation_read = vfe_violation_read,
 	.isr = vfe_isr,
+	.reg_update_clear = vfe_reg_update_clear,
+	.reg_update = vfe_reg_update,
+	.subdev_init = vfe_subdev_init,
+	.vfe_disable = vfe_gen1_disable,
+	.vfe_enable = vfe_gen1_enable,
+	.vfe_halt = vfe_gen1_halt,
+	.violation_read = vfe_violation_read,
 };
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
new file mode 100644
index 000000000000..609db85c5039
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
@@ -0,0 +1,1166 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-vfe-4-7.c
+ *
+ * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v4.7
+ *
+ * Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.
+ * Copyright (C) 2015-2018 Linaro Ltd.
+ */
+
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+
+#include "camss.h"
+#include "camss-vfe.h"
+#include "camss-vfe-gen1.h"
+
+
+#define VFE_0_HW_VERSION		0x000
+
+#define VFE_0_GLOBAL_RESET_CMD		0x018
+#define VFE_0_GLOBAL_RESET_CMD_CORE	BIT(0)
+#define VFE_0_GLOBAL_RESET_CMD_CAMIF	BIT(1)
+#define VFE_0_GLOBAL_RESET_CMD_BUS	BIT(2)
+#define VFE_0_GLOBAL_RESET_CMD_BUS_BDG	BIT(3)
+#define VFE_0_GLOBAL_RESET_CMD_REGISTER	BIT(4)
+#define VFE_0_GLOBAL_RESET_CMD_PM	BIT(5)
+#define VFE_0_GLOBAL_RESET_CMD_BUS_MISR	BIT(6)
+#define VFE_0_GLOBAL_RESET_CMD_TESTGEN	BIT(7)
+#define VFE_0_GLOBAL_RESET_CMD_DSP	BIT(8)
+#define VFE_0_GLOBAL_RESET_CMD_IDLE_CGC	BIT(9)
+
+#define VFE_0_MODULE_LENS_EN		0x040
+#define VFE_0_MODULE_LENS_EN_DEMUX		BIT(2)
+#define VFE_0_MODULE_LENS_EN_CHROMA_UPSAMPLE	BIT(3)
+
+#define VFE_0_MODULE_ZOOM_EN		0x04c
+#define VFE_0_MODULE_ZOOM_EN_SCALE_ENC		BIT(1)
+#define VFE_0_MODULE_ZOOM_EN_CROP_ENC		BIT(2)
+#define VFE_0_MODULE_ZOOM_EN_REALIGN_BUF	BIT(9)
+
+#define VFE_0_CORE_CFG			0x050
+#define VFE_0_CORE_CFG_PIXEL_PATTERN_YCBYCR	0x4
+#define VFE_0_CORE_CFG_PIXEL_PATTERN_YCRYCB	0x5
+#define VFE_0_CORE_CFG_PIXEL_PATTERN_CBYCRY	0x6
+#define VFE_0_CORE_CFG_PIXEL_PATTERN_CRYCBY	0x7
+#define VFE_0_CORE_CFG_COMPOSITE_REG_UPDATE_EN	BIT(4)
+
+#define VFE_0_IRQ_CMD			0x058
+#define VFE_0_IRQ_CMD_GLOBAL_CLEAR	BIT(0)
+
+#define VFE_0_IRQ_MASK_0		0x05c
+#define VFE_0_IRQ_MASK_0_CAMIF_SOF			BIT(0)
+#define VFE_0_IRQ_MASK_0_CAMIF_EOF			BIT(1)
+#define VFE_0_IRQ_MASK_0_RDIn_REG_UPDATE(n)		BIT((n) + 5)
+#define VFE_0_IRQ_MASK_0_line_n_REG_UPDATE(n)		\
+	((n) == VFE_LINE_PIX ? BIT(4) : VFE_0_IRQ_MASK_0_RDIn_REG_UPDATE(n))
+#define VFE_0_IRQ_MASK_0_IMAGE_MASTER_n_PING_PONG(n)	BIT((n) + 8)
+#define VFE_0_IRQ_MASK_0_IMAGE_COMPOSITE_DONE_n(n)	BIT((n) + 25)
+#define VFE_0_IRQ_MASK_0_RESET_ACK			BIT(31)
+#define VFE_0_IRQ_MASK_1		0x060
+#define VFE_0_IRQ_MASK_1_CAMIF_ERROR			BIT(0)
+#define VFE_0_IRQ_MASK_1_VIOLATION			BIT(7)
+#define VFE_0_IRQ_MASK_1_BUS_BDG_HALT_ACK		BIT(8)
+#define VFE_0_IRQ_MASK_1_IMAGE_MASTER_n_BUS_OVERFLOW(n)	BIT((n) + 9)
+#define VFE_0_IRQ_MASK_1_RDIn_SOF(n)			BIT((n) + 29)
+
+#define VFE_0_IRQ_CLEAR_0		0x064
+#define VFE_0_IRQ_CLEAR_1		0x068
+
+#define VFE_0_IRQ_STATUS_0		0x06c
+#define VFE_0_IRQ_STATUS_0_CAMIF_SOF			BIT(0)
+#define VFE_0_IRQ_STATUS_0_RDIn_REG_UPDATE(n)		BIT((n) + 5)
+#define VFE_0_IRQ_STATUS_0_line_n_REG_UPDATE(n)		\
+	((n) == VFE_LINE_PIX ? BIT(4) : VFE_0_IRQ_STATUS_0_RDIn_REG_UPDATE(n))
+#define VFE_0_IRQ_STATUS_0_IMAGE_MASTER_n_PING_PONG(n)	BIT((n) + 8)
+#define VFE_0_IRQ_STATUS_0_IMAGE_COMPOSITE_DONE_n(n)	BIT((n) + 25)
+#define VFE_0_IRQ_STATUS_0_RESET_ACK			BIT(31)
+#define VFE_0_IRQ_STATUS_1		0x070
+#define VFE_0_IRQ_STATUS_1_VIOLATION			BIT(7)
+#define VFE_0_IRQ_STATUS_1_BUS_BDG_HALT_ACK		BIT(8)
+#define VFE_0_IRQ_STATUS_1_RDIn_SOF(n)			BIT((n) + 29)
+
+#define VFE_0_IRQ_COMPOSITE_MASK_0	0x074
+#define VFE_0_VIOLATION_STATUS		0x07c
+
+#define VFE_0_BUS_CMD			0x80
+#define VFE_0_BUS_CMD_Mx_RLD_CMD(x)	BIT(x)
+
+#define VFE_0_BUS_CFG			0x084
+
+#define VFE_0_BUS_XBAR_CFG_x(x)		(0x90 + 0x4 * ((x) / 2))
+#define VFE_0_BUS_XBAR_CFG_x_M_PAIR_STREAM_EN			BIT(2)
+#define VFE_0_BUS_XBAR_CFG_x_M_REALIGN_BUF_EN			BIT(3)
+#define VFE_0_BUS_XBAR_CFG_x_M_PAIR_STREAM_SWAP_INTRA		(0x1 << 4)
+#define VFE_0_BUS_XBAR_CFG_x_M_PAIR_STREAM_SWAP_INTER		(0x2 << 4)
+#define VFE_0_BUS_XBAR_CFG_x_M_PAIR_STREAM_SWAP_INTER_INTRA	(0x3 << 4)
+#define VFE_0_BUS_XBAR_CFG_x_M_SINGLE_STREAM_SEL_SHIFT		8
+#define VFE_0_BUS_XBAR_CFG_x_M_SINGLE_STREAM_SEL_LUMA		0x0
+#define VFE_0_BUS_XBAR_CFG_x_M_SINGLE_STREAM_SEL_VAL_RDI0	0xc
+#define VFE_0_BUS_XBAR_CFG_x_M_SINGLE_STREAM_SEL_VAL_RDI1	0xd
+#define VFE_0_BUS_XBAR_CFG_x_M_SINGLE_STREAM_SEL_VAL_RDI2	0xe
+
+#define VFE_0_BUS_IMAGE_MASTER_n_WR_CFG(n)		(0x0a0 + 0x2c * (n))
+#define VFE_0_BUS_IMAGE_MASTER_n_WR_CFG_WR_PATH_SHIFT	0
+#define VFE_0_BUS_IMAGE_MASTER_n_WR_PING_ADDR(n)	(0x0a4 + 0x2c * (n))
+#define VFE_0_BUS_IMAGE_MASTER_n_WR_PONG_ADDR(n)	(0x0ac + 0x2c * (n))
+#define VFE_0_BUS_IMAGE_MASTER_n_WR_ADDR_CFG(n)		(0x0b4 + 0x2c * (n))
+#define VFE_0_BUS_IMAGE_MASTER_n_WR_ADDR_CFG_FRM_BASED_SHIFT	1
+#define VFE_0_BUS_IMAGE_MASTER_n_WR_ADDR_CFG_FRM_DROP_PER_SHIFT	2
+#define VFE_0_BUS_IMAGE_MASTER_n_WR_ADDR_CFG_FRM_DROP_PER_MASK	(0x1f << 2)
+#define VFE_0_BUS_IMAGE_MASTER_n_WR_UB_CFG(n)		(0x0b8 + 0x2c * (n))
+#define VFE_0_BUS_IMAGE_MASTER_n_WR_UB_CFG_OFFSET_SHIFT	16
+#define VFE_0_BUS_IMAGE_MASTER_n_WR_IMAGE_SIZE(n)	(0x0bc + 0x2c * (n))
+#define VFE_0_BUS_IMAGE_MASTER_n_WR_BUFFER_CFG(n)	(0x0c0 + 0x2c * (n))
+#define VFE_0_BUS_IMAGE_MASTER_n_WR_FRAMEDROP_PATTERN(n)	\
+							(0x0c4 + 0x2c * (n))
+#define VFE_0_BUS_IMAGE_MASTER_n_WR_IRQ_SUBSAMPLE_PATTERN(n)	\
+							(0x0c8 + 0x2c * (n))
+#define VFE_0_BUS_IMAGE_MASTER_n_WR_IRQ_SUBSAMPLE_PATTERN_DEF	0xffffffff
+
+#define VFE_0_BUS_PING_PONG_STATUS	0x338
+
+#define VFE_0_BUS_BDG_CMD		0x400
+#define VFE_0_BUS_BDG_CMD_HALT_REQ	1
+
+#define VFE_0_BUS_BDG_QOS_CFG_0		0x404
+#define VFE_0_BUS_BDG_QOS_CFG_0_CFG	0xaaa5aaa5
+#define VFE_0_BUS_BDG_QOS_CFG_1		0x408
+#define VFE_0_BUS_BDG_QOS_CFG_2		0x40c
+#define VFE_0_BUS_BDG_QOS_CFG_3		0x410
+#define VFE_0_BUS_BDG_QOS_CFG_3_CFG	0xaa55aaa5
+#define VFE_0_BUS_BDG_QOS_CFG_4		0x414
+#define VFE_0_BUS_BDG_QOS_CFG_4_CFG	0xaa55aa55
+#define VFE_0_BUS_BDG_QOS_CFG_5		0x418
+#define VFE_0_BUS_BDG_QOS_CFG_6		0x41c
+#define VFE_0_BUS_BDG_QOS_CFG_7		0x420
+#define VFE_0_BUS_BDG_QOS_CFG_7_CFG	0x0005aa55
+
+#define VFE_0_BUS_BDG_DS_CFG_0		0x424
+#define VFE_0_BUS_BDG_DS_CFG_0_CFG	0xcccc1111
+#define VFE_0_BUS_BDG_DS_CFG_1		0x428
+#define VFE_0_BUS_BDG_DS_CFG_2		0x42c
+#define VFE_0_BUS_BDG_DS_CFG_3		0x430
+#define VFE_0_BUS_BDG_DS_CFG_4		0x434
+#define VFE_0_BUS_BDG_DS_CFG_5		0x438
+#define VFE_0_BUS_BDG_DS_CFG_6		0x43c
+#define VFE_0_BUS_BDG_DS_CFG_7		0x440
+#define VFE_0_BUS_BDG_DS_CFG_8		0x444
+#define VFE_0_BUS_BDG_DS_CFG_9		0x448
+#define VFE_0_BUS_BDG_DS_CFG_10		0x44c
+#define VFE_0_BUS_BDG_DS_CFG_11		0x450
+#define VFE_0_BUS_BDG_DS_CFG_12		0x454
+#define VFE_0_BUS_BDG_DS_CFG_13		0x458
+#define VFE_0_BUS_BDG_DS_CFG_14		0x45c
+#define VFE_0_BUS_BDG_DS_CFG_15		0x460
+#define VFE_0_BUS_BDG_DS_CFG_16		0x464
+#define VFE_0_BUS_BDG_DS_CFG_16_CFG	0x00000110
+
+#define VFE_0_RDI_CFG_x(x)		(0x46c + (0x4 * (x)))
+#define VFE_0_RDI_CFG_x_RDI_STREAM_SEL_SHIFT	28
+#define VFE_0_RDI_CFG_x_RDI_STREAM_SEL_MASK	(0xf << 28)
+#define VFE_0_RDI_CFG_x_RDI_M0_SEL_SHIFT	4
+#define VFE_0_RDI_CFG_x_RDI_M0_SEL_MASK		(0xf << 4)
+#define VFE_0_RDI_CFG_x_RDI_EN_BIT		BIT(2)
+#define VFE_0_RDI_CFG_x_MIPI_EN_BITS		0x3
+
+#define VFE_0_CAMIF_CMD				0x478
+#define VFE_0_CAMIF_CMD_DISABLE_FRAME_BOUNDARY	0
+#define VFE_0_CAMIF_CMD_ENABLE_FRAME_BOUNDARY	1
+#define VFE_0_CAMIF_CMD_NO_CHANGE		3
+#define VFE_0_CAMIF_CMD_CLEAR_CAMIF_STATUS	BIT(2)
+#define VFE_0_CAMIF_CFG				0x47c
+#define VFE_0_CAMIF_CFG_VFE_OUTPUT_EN		BIT(6)
+#define VFE_0_CAMIF_FRAME_CFG			0x484
+#define VFE_0_CAMIF_WINDOW_WIDTH_CFG		0x488
+#define VFE_0_CAMIF_WINDOW_HEIGHT_CFG		0x48c
+#define VFE_0_CAMIF_SUBSAMPLE_CFG		0x490
+#define VFE_0_CAMIF_IRQ_FRAMEDROP_PATTERN	0x498
+#define VFE_0_CAMIF_IRQ_SUBSAMPLE_PATTERN	0x49c
+#define VFE_0_CAMIF_STATUS			0x4a4
+#define VFE_0_CAMIF_STATUS_HALT			BIT(31)
+
+#define VFE_0_REG_UPDATE		0x4ac
+#define VFE_0_REG_UPDATE_RDIn(n)		BIT(1 + (n))
+#define VFE_0_REG_UPDATE_line_n(n)		\
+			((n) == VFE_LINE_PIX ? 1 : VFE_0_REG_UPDATE_RDIn(n))
+
+#define VFE_0_DEMUX_CFG				0x560
+#define VFE_0_DEMUX_CFG_PERIOD			0x3
+#define VFE_0_DEMUX_GAIN_0			0x564
+#define VFE_0_DEMUX_GAIN_0_CH0_EVEN		(0x80 << 0)
+#define VFE_0_DEMUX_GAIN_0_CH0_ODD		(0x80 << 16)
+#define VFE_0_DEMUX_GAIN_1			0x568
+#define VFE_0_DEMUX_GAIN_1_CH1			(0x80 << 0)
+#define VFE_0_DEMUX_GAIN_1_CH2			(0x80 << 16)
+#define VFE_0_DEMUX_EVEN_CFG			0x574
+#define VFE_0_DEMUX_EVEN_CFG_PATTERN_YUYV	0x9cac
+#define VFE_0_DEMUX_EVEN_CFG_PATTERN_YVYU	0xac9c
+#define VFE_0_DEMUX_EVEN_CFG_PATTERN_UYVY	0xc9ca
+#define VFE_0_DEMUX_EVEN_CFG_PATTERN_VYUY	0xcac9
+#define VFE_0_DEMUX_ODD_CFG			0x578
+#define VFE_0_DEMUX_ODD_CFG_PATTERN_YUYV	0x9cac
+#define VFE_0_DEMUX_ODD_CFG_PATTERN_YVYU	0xac9c
+#define VFE_0_DEMUX_ODD_CFG_PATTERN_UYVY	0xc9ca
+#define VFE_0_DEMUX_ODD_CFG_PATTERN_VYUY	0xcac9
+
+#define VFE_0_SCALE_ENC_Y_CFG			0x91c
+#define VFE_0_SCALE_ENC_Y_H_IMAGE_SIZE		0x920
+#define VFE_0_SCALE_ENC_Y_H_PHASE		0x924
+#define VFE_0_SCALE_ENC_Y_V_IMAGE_SIZE		0x934
+#define VFE_0_SCALE_ENC_Y_V_PHASE		0x938
+#define VFE_0_SCALE_ENC_CBCR_CFG		0x948
+#define VFE_0_SCALE_ENC_CBCR_H_IMAGE_SIZE	0x94c
+#define VFE_0_SCALE_ENC_CBCR_H_PHASE		0x950
+#define VFE_0_SCALE_ENC_CBCR_V_IMAGE_SIZE	0x960
+#define VFE_0_SCALE_ENC_CBCR_V_PHASE		0x964
+
+#define VFE_0_CROP_ENC_Y_WIDTH			0x974
+#define VFE_0_CROP_ENC_Y_HEIGHT			0x978
+#define VFE_0_CROP_ENC_CBCR_WIDTH		0x97c
+#define VFE_0_CROP_ENC_CBCR_HEIGHT		0x980
+
+#define VFE_0_CLAMP_ENC_MAX_CFG			0x984
+#define VFE_0_CLAMP_ENC_MAX_CFG_CH0		(0xff << 0)
+#define VFE_0_CLAMP_ENC_MAX_CFG_CH1		(0xff << 8)
+#define VFE_0_CLAMP_ENC_MAX_CFG_CH2		(0xff << 16)
+#define VFE_0_CLAMP_ENC_MIN_CFG			0x988
+#define VFE_0_CLAMP_ENC_MIN_CFG_CH0		(0x0 << 0)
+#define VFE_0_CLAMP_ENC_MIN_CFG_CH1		(0x0 << 8)
+#define VFE_0_CLAMP_ENC_MIN_CFG_CH2		(0x0 << 16)
+
+#define VFE_0_REALIGN_BUF_CFG			0xaac
+#define VFE_0_REALIGN_BUF_CFG_CB_ODD_PIXEL     BIT(2)
+#define VFE_0_REALIGN_BUF_CFG_CR_ODD_PIXEL     BIT(3)
+#define VFE_0_REALIGN_BUF_CFG_HSUB_ENABLE      BIT(4)
+
+#define VFE_0_BUS_IMAGE_MASTER_CMD		0xcec
+#define VFE_0_BUS_IMAGE_MASTER_n_SHIFT(x)	(2 * (x))
+
+#define CAMIF_TIMEOUT_SLEEP_US 1000
+#define CAMIF_TIMEOUT_ALL_US 1000000
+
+#define MSM_VFE_VFE0_UB_SIZE 2047
+#define MSM_VFE_VFE0_UB_SIZE_RDI (MSM_VFE_VFE0_UB_SIZE / 3)
+#define MSM_VFE_VFE1_UB_SIZE 1535
+#define MSM_VFE_VFE1_UB_SIZE_RDI (MSM_VFE_VFE1_UB_SIZE / 3)
+
+static void vfe_hw_version_read(struct vfe_device *vfe, struct device *dev)
+{
+	u32 hw_version = readl_relaxed(vfe->base + VFE_0_HW_VERSION);
+
+	dev_err(dev, "VFE HW Version = 0x%08x\n", hw_version);
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
+	u32 reset_bits = VFE_0_GLOBAL_RESET_CMD_IDLE_CGC	|
+			 VFE_0_GLOBAL_RESET_CMD_DSP		|
+			 VFE_0_GLOBAL_RESET_CMD_TESTGEN		|
+			 VFE_0_GLOBAL_RESET_CMD_BUS_MISR	|
+			 VFE_0_GLOBAL_RESET_CMD_PM		|
+			 VFE_0_GLOBAL_RESET_CMD_REGISTER	|
+			 VFE_0_GLOBAL_RESET_CMD_BUS_BDG		|
+			 VFE_0_GLOBAL_RESET_CMD_BUS		|
+			 VFE_0_GLOBAL_RESET_CMD_CAMIF		|
+			 VFE_0_GLOBAL_RESET_CMD_CORE;
+
+	writel_relaxed(BIT(31), vfe->base + VFE_0_IRQ_MASK_0);
+
+	/* Enforce barrier between IRQ mask setup and global reset */
+	wmb();
+	writel_relaxed(reset_bits, vfe->base + VFE_0_GLOBAL_RESET_CMD);
+}
+
+static void vfe_halt_request(struct vfe_device *vfe)
+{
+	writel_relaxed(VFE_0_BUS_BDG_CMD_HALT_REQ,
+		       vfe->base + VFE_0_BUS_BDG_CMD);
+}
+
+static void vfe_halt_clear(struct vfe_device *vfe)
+{
+	writel_relaxed(0x0, vfe->base + VFE_0_BUS_BDG_CMD);
+}
+
+static void vfe_wm_frame_based(struct vfe_device *vfe, u8 wm, u8 enable)
+{
+	if (enable)
+		vfe_reg_set(vfe, VFE_0_BUS_IMAGE_MASTER_n_WR_ADDR_CFG(wm),
+			1 << VFE_0_BUS_IMAGE_MASTER_n_WR_ADDR_CFG_FRM_BASED_SHIFT);
+	else
+		vfe_reg_clr(vfe, VFE_0_BUS_IMAGE_MASTER_n_WR_ADDR_CFG(wm),
+			1 << VFE_0_BUS_IMAGE_MASTER_n_WR_ADDR_CFG_FRM_BASED_SHIFT);
+}
+
+#define CALC_WORD(width, M, N) (((width) * (M) + (N) - 1) / (N))
+
+static int vfe_word_per_line_by_pixel(u32 format, u32 pixel_per_line)
+{
+	int val = 0;
+
+	switch (format) {
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV21:
+	case V4L2_PIX_FMT_NV16:
+	case V4L2_PIX_FMT_NV61:
+		val = CALC_WORD(pixel_per_line, 1, 8);
+		break;
+	case V4L2_PIX_FMT_YUYV:
+	case V4L2_PIX_FMT_YVYU:
+	case V4L2_PIX_FMT_UYVY:
+	case V4L2_PIX_FMT_VYUY:
+		val = CALC_WORD(pixel_per_line, 2, 8);
+		break;
+	}
+
+	return val;
+}
+
+static int vfe_word_per_line_by_bytes(u32 bytes_per_line)
+{
+	return CALC_WORD(bytes_per_line, 1, 8);
+}
+
+static void vfe_get_wm_sizes(struct v4l2_pix_format_mplane *pix, u8 plane,
+			     u16 *width, u16 *height, u16 *bytesperline)
+{
+	switch (pix->pixelformat) {
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV21:
+		*width = pix->width;
+		*height = pix->height;
+		*bytesperline = pix->plane_fmt[0].bytesperline;
+		if (plane == 1)
+			*height /= 2;
+		break;
+	case V4L2_PIX_FMT_NV16:
+	case V4L2_PIX_FMT_NV61:
+		*width = pix->width;
+		*height = pix->height;
+		*bytesperline = pix->plane_fmt[0].bytesperline;
+		break;
+	case V4L2_PIX_FMT_YUYV:
+	case V4L2_PIX_FMT_YVYU:
+	case V4L2_PIX_FMT_VYUY:
+	case V4L2_PIX_FMT_UYVY:
+		*width = pix->width;
+		*height = pix->height;
+		*bytesperline = pix->plane_fmt[plane].bytesperline;
+		break;
+
+	}
+}
+
+static void vfe_wm_line_based(struct vfe_device *vfe, u32 wm,
+			      struct v4l2_pix_format_mplane *pix,
+			      u8 plane, u32 enable)
+{
+	u32 reg;
+
+	if (enable) {
+		u16 width = 0, height = 0, bytesperline = 0, wpl;
+
+		vfe_get_wm_sizes(pix, plane, &width, &height, &bytesperline);
+
+		wpl = vfe_word_per_line_by_pixel(pix->pixelformat, width);
+
+		reg = height - 1;
+		reg |= ((wpl + 3) / 4 - 1) << 16;
+
+		writel_relaxed(reg, vfe->base +
+			       VFE_0_BUS_IMAGE_MASTER_n_WR_IMAGE_SIZE(wm));
+
+		wpl = vfe_word_per_line_by_bytes(bytesperline);
+
+		reg = 0x3;
+		reg |= (height - 1) << 2;
+		reg |= ((wpl + 1) / 2) << 16;
+
+		writel_relaxed(reg, vfe->base +
+			       VFE_0_BUS_IMAGE_MASTER_n_WR_BUFFER_CFG(wm));
+	} else {
+		writel_relaxed(0, vfe->base +
+			       VFE_0_BUS_IMAGE_MASTER_n_WR_IMAGE_SIZE(wm));
+		writel_relaxed(0, vfe->base +
+			       VFE_0_BUS_IMAGE_MASTER_n_WR_BUFFER_CFG(wm));
+	}
+}
+
+static void vfe_wm_set_framedrop_period(struct vfe_device *vfe, u8 wm, u8 per)
+{
+	u32 reg;
+
+	reg = readl_relaxed(vfe->base +
+			    VFE_0_BUS_IMAGE_MASTER_n_WR_ADDR_CFG(wm));
+
+	reg &= ~(VFE_0_BUS_IMAGE_MASTER_n_WR_ADDR_CFG_FRM_DROP_PER_MASK);
+
+	reg |= (per << VFE_0_BUS_IMAGE_MASTER_n_WR_ADDR_CFG_FRM_DROP_PER_SHIFT)
+		& VFE_0_BUS_IMAGE_MASTER_n_WR_ADDR_CFG_FRM_DROP_PER_MASK;
+
+	writel_relaxed(reg,
+		       vfe->base + VFE_0_BUS_IMAGE_MASTER_n_WR_ADDR_CFG(wm));
+}
+
+static void vfe_wm_set_framedrop_pattern(struct vfe_device *vfe, u8 wm,
+					 u32 pattern)
+{
+	writel_relaxed(pattern,
+	       vfe->base + VFE_0_BUS_IMAGE_MASTER_n_WR_FRAMEDROP_PATTERN(wm));
+}
+
+static void vfe_wm_set_ub_cfg(struct vfe_device *vfe, u8 wm,
+			      u16 offset, u16 depth)
+{
+	u32 reg;
+
+	reg = (offset << VFE_0_BUS_IMAGE_MASTER_n_WR_UB_CFG_OFFSET_SHIFT) |
+		depth;
+	writel_relaxed(reg, vfe->base + VFE_0_BUS_IMAGE_MASTER_n_WR_UB_CFG(wm));
+}
+
+static void vfe_bus_reload_wm(struct vfe_device *vfe, u8 wm)
+{
+	/* Enforce barrier between any outstanding register write */
+	wmb();
+
+	writel_relaxed(VFE_0_BUS_CMD_Mx_RLD_CMD(wm), vfe->base + VFE_0_BUS_CMD);
+
+	/* Use barrier to make sure bus reload is issued before anything else */
+	wmb();
+}
+
+static void vfe_wm_set_ping_addr(struct vfe_device *vfe, u8 wm, u32 addr)
+{
+	writel_relaxed(addr,
+		       vfe->base + VFE_0_BUS_IMAGE_MASTER_n_WR_PING_ADDR(wm));
+}
+
+static void vfe_wm_set_pong_addr(struct vfe_device *vfe, u8 wm, u32 addr)
+{
+	writel_relaxed(addr,
+		       vfe->base + VFE_0_BUS_IMAGE_MASTER_n_WR_PONG_ADDR(wm));
+}
+
+static int vfe_wm_get_ping_pong_status(struct vfe_device *vfe, u8 wm)
+{
+	u32 reg;
+
+	reg = readl_relaxed(vfe->base + VFE_0_BUS_PING_PONG_STATUS);
+
+	return (reg >> wm) & 0x1;
+}
+
+static void vfe_bus_enable_wr_if(struct vfe_device *vfe, u8 enable)
+{
+	if (enable)
+		writel_relaxed(0x101, vfe->base + VFE_0_BUS_CFG);
+	else
+		writel_relaxed(0, vfe->base + VFE_0_BUS_CFG);
+}
+
+static void vfe_bus_connect_wm_to_rdi(struct vfe_device *vfe, u8 wm,
+				      enum vfe_line_id id)
+{
+	u32 reg;
+
+	reg = VFE_0_RDI_CFG_x_MIPI_EN_BITS;
+	vfe_reg_set(vfe, VFE_0_RDI_CFG_x(0), reg);
+
+	reg = VFE_0_RDI_CFG_x_RDI_EN_BIT;
+	reg |= ((3 * id) << VFE_0_RDI_CFG_x_RDI_STREAM_SEL_SHIFT) &
+		VFE_0_RDI_CFG_x_RDI_STREAM_SEL_MASK;
+	vfe_reg_set(vfe, VFE_0_RDI_CFG_x(id), reg);
+
+	switch (id) {
+	case VFE_LINE_RDI0:
+	default:
+		reg = VFE_0_BUS_XBAR_CFG_x_M_SINGLE_STREAM_SEL_VAL_RDI0 <<
+		      VFE_0_BUS_XBAR_CFG_x_M_SINGLE_STREAM_SEL_SHIFT;
+		break;
+	case VFE_LINE_RDI1:
+		reg = VFE_0_BUS_XBAR_CFG_x_M_SINGLE_STREAM_SEL_VAL_RDI1 <<
+		      VFE_0_BUS_XBAR_CFG_x_M_SINGLE_STREAM_SEL_SHIFT;
+		break;
+	case VFE_LINE_RDI2:
+		reg = VFE_0_BUS_XBAR_CFG_x_M_SINGLE_STREAM_SEL_VAL_RDI2 <<
+		      VFE_0_BUS_XBAR_CFG_x_M_SINGLE_STREAM_SEL_SHIFT;
+		break;
+	}
+
+	if (wm % 2 == 1)
+		reg <<= 16;
+
+	vfe_reg_set(vfe, VFE_0_BUS_XBAR_CFG_x(wm), reg);
+}
+
+static void vfe_wm_set_subsample(struct vfe_device *vfe, u8 wm)
+{
+	writel_relaxed(VFE_0_BUS_IMAGE_MASTER_n_WR_IRQ_SUBSAMPLE_PATTERN_DEF,
+	       vfe->base +
+	       VFE_0_BUS_IMAGE_MASTER_n_WR_IRQ_SUBSAMPLE_PATTERN(wm));
+}
+
+static void vfe_bus_disconnect_wm_from_rdi(struct vfe_device *vfe, u8 wm,
+					   enum vfe_line_id id)
+{
+	u32 reg;
+
+	reg = VFE_0_RDI_CFG_x_RDI_EN_BIT;
+	vfe_reg_clr(vfe, VFE_0_RDI_CFG_x(id), reg);
+
+	switch (id) {
+	case VFE_LINE_RDI0:
+	default:
+		reg = VFE_0_BUS_XBAR_CFG_x_M_SINGLE_STREAM_SEL_VAL_RDI0 <<
+		      VFE_0_BUS_XBAR_CFG_x_M_SINGLE_STREAM_SEL_SHIFT;
+		break;
+	case VFE_LINE_RDI1:
+		reg = VFE_0_BUS_XBAR_CFG_x_M_SINGLE_STREAM_SEL_VAL_RDI1 <<
+		      VFE_0_BUS_XBAR_CFG_x_M_SINGLE_STREAM_SEL_SHIFT;
+		break;
+	case VFE_LINE_RDI2:
+		reg = VFE_0_BUS_XBAR_CFG_x_M_SINGLE_STREAM_SEL_VAL_RDI2 <<
+		      VFE_0_BUS_XBAR_CFG_x_M_SINGLE_STREAM_SEL_SHIFT;
+		break;
+	}
+
+	if (wm % 2 == 1)
+		reg <<= 16;
+
+	vfe_reg_clr(vfe, VFE_0_BUS_XBAR_CFG_x(wm), reg);
+}
+
+static void vfe_set_xbar_cfg(struct vfe_device *vfe, struct vfe_output *output,
+			     u8 enable)
+{
+	struct vfe_line *line = container_of(output, struct vfe_line, output);
+	u32 p = line->video_out.active_fmt.fmt.pix_mp.pixelformat;
+	u32 reg;
+
+	switch (p) {
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV21:
+	case V4L2_PIX_FMT_NV16:
+	case V4L2_PIX_FMT_NV61:
+		reg = VFE_0_BUS_XBAR_CFG_x_M_SINGLE_STREAM_SEL_LUMA <<
+			VFE_0_BUS_XBAR_CFG_x_M_SINGLE_STREAM_SEL_SHIFT;
+
+		if (output->wm_idx[0] % 2 == 1)
+			reg <<= 16;
+
+		if (enable)
+			vfe_reg_set(vfe,
+				    VFE_0_BUS_XBAR_CFG_x(output->wm_idx[0]),
+				    reg);
+		else
+			vfe_reg_clr(vfe,
+				    VFE_0_BUS_XBAR_CFG_x(output->wm_idx[0]),
+				    reg);
+
+		reg = VFE_0_BUS_XBAR_CFG_x_M_PAIR_STREAM_EN;
+		if (p == V4L2_PIX_FMT_NV12 || p == V4L2_PIX_FMT_NV16)
+			reg |= VFE_0_BUS_XBAR_CFG_x_M_PAIR_STREAM_SWAP_INTER_INTRA;
+
+		if (output->wm_idx[1] % 2 == 1)
+			reg <<= 16;
+
+		if (enable)
+			vfe_reg_set(vfe,
+				    VFE_0_BUS_XBAR_CFG_x(output->wm_idx[1]),
+				    reg);
+		else
+			vfe_reg_clr(vfe,
+				    VFE_0_BUS_XBAR_CFG_x(output->wm_idx[1]),
+				    reg);
+		break;
+	case V4L2_PIX_FMT_YUYV:
+	case V4L2_PIX_FMT_YVYU:
+	case V4L2_PIX_FMT_VYUY:
+	case V4L2_PIX_FMT_UYVY:
+		reg = VFE_0_BUS_XBAR_CFG_x_M_REALIGN_BUF_EN;
+		reg |= VFE_0_BUS_XBAR_CFG_x_M_PAIR_STREAM_EN;
+
+		if (p == V4L2_PIX_FMT_YUYV || p == V4L2_PIX_FMT_YVYU)
+			reg |= VFE_0_BUS_XBAR_CFG_x_M_PAIR_STREAM_SWAP_INTER_INTRA;
+
+		if (output->wm_idx[0] % 2 == 1)
+			reg <<= 16;
+
+		if (enable)
+			vfe_reg_set(vfe,
+				    VFE_0_BUS_XBAR_CFG_x(output->wm_idx[0]),
+				    reg);
+		else
+			vfe_reg_clr(vfe,
+				    VFE_0_BUS_XBAR_CFG_x(output->wm_idx[0]),
+				    reg);
+		break;
+	default:
+		break;
+	}
+}
+
+static void vfe_set_realign_cfg(struct vfe_device *vfe, struct vfe_line *line,
+				u8 enable)
+{
+	u32 p = line->video_out.active_fmt.fmt.pix_mp.pixelformat;
+	u32 val = VFE_0_MODULE_ZOOM_EN_REALIGN_BUF;
+
+	if (p != V4L2_PIX_FMT_YUYV && p != V4L2_PIX_FMT_YVYU &&
+			p != V4L2_PIX_FMT_VYUY && p != V4L2_PIX_FMT_UYVY)
+		return;
+
+	if (enable) {
+		vfe_reg_set(vfe, VFE_0_MODULE_ZOOM_EN, val);
+	} else {
+		vfe_reg_clr(vfe, VFE_0_MODULE_ZOOM_EN, val);
+		return;
+	}
+
+	val = VFE_0_REALIGN_BUF_CFG_HSUB_ENABLE;
+
+	if (p == V4L2_PIX_FMT_UYVY || p == V4L2_PIX_FMT_YUYV)
+		val |= VFE_0_REALIGN_BUF_CFG_CR_ODD_PIXEL;
+	else
+		val |= VFE_0_REALIGN_BUF_CFG_CB_ODD_PIXEL;
+
+	writel_relaxed(val, vfe->base + VFE_0_REALIGN_BUF_CFG);
+}
+
+static void vfe_set_rdi_cid(struct vfe_device *vfe, enum vfe_line_id id, u8 cid)
+{
+	vfe_reg_clr(vfe, VFE_0_RDI_CFG_x(id),
+		    VFE_0_RDI_CFG_x_RDI_M0_SEL_MASK);
+
+	vfe_reg_set(vfe, VFE_0_RDI_CFG_x(id),
+		    cid << VFE_0_RDI_CFG_x_RDI_M0_SEL_SHIFT);
+}
+
+static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
+{
+	vfe->reg_update |= VFE_0_REG_UPDATE_line_n(line_id);
+
+	/* Enforce barrier between line update and commit */
+	wmb();
+
+	writel_relaxed(vfe->reg_update, vfe->base + VFE_0_REG_UPDATE);
+
+	/* Make sure register update is issued before further reg writes */
+	wmb();
+}
+
+static inline void vfe_reg_update_clear(struct vfe_device *vfe,
+					enum vfe_line_id line_id)
+{
+	vfe->reg_update &= ~VFE_0_REG_UPDATE_line_n(line_id);
+}
+
+static void vfe_enable_irq_wm_line(struct vfe_device *vfe, u8 wm,
+				   enum vfe_line_id line_id, u8 enable)
+{
+	u32 irq_en0 = VFE_0_IRQ_MASK_0_IMAGE_MASTER_n_PING_PONG(wm) |
+		      VFE_0_IRQ_MASK_0_line_n_REG_UPDATE(line_id);
+	u32 irq_en1 = VFE_0_IRQ_MASK_1_IMAGE_MASTER_n_BUS_OVERFLOW(wm) |
+		      VFE_0_IRQ_MASK_1_RDIn_SOF(line_id);
+
+	if (enable) {
+		vfe_reg_set(vfe, VFE_0_IRQ_MASK_0, irq_en0);
+		vfe_reg_set(vfe, VFE_0_IRQ_MASK_1, irq_en1);
+	} else {
+		vfe_reg_clr(vfe, VFE_0_IRQ_MASK_0, irq_en0);
+		vfe_reg_clr(vfe, VFE_0_IRQ_MASK_1, irq_en1);
+	}
+}
+
+static void vfe_enable_irq_pix_line(struct vfe_device *vfe, u8 comp,
+				    enum vfe_line_id line_id, u8 enable)
+{
+	struct vfe_output *output = &vfe->line[line_id].output;
+	unsigned int i;
+	u32 irq_en0;
+	u32 irq_en1;
+	u32 comp_mask = 0;
+
+	irq_en0 = VFE_0_IRQ_MASK_0_CAMIF_SOF;
+	irq_en0 |= VFE_0_IRQ_MASK_0_CAMIF_EOF;
+	irq_en0 |= VFE_0_IRQ_MASK_0_IMAGE_COMPOSITE_DONE_n(comp);
+	irq_en0 |= VFE_0_IRQ_MASK_0_line_n_REG_UPDATE(line_id);
+	irq_en1 = VFE_0_IRQ_MASK_1_CAMIF_ERROR;
+	for (i = 0; i < output->wm_num; i++) {
+		irq_en1 |= VFE_0_IRQ_MASK_1_IMAGE_MASTER_n_BUS_OVERFLOW(
+							output->wm_idx[i]);
+		comp_mask |= (1 << output->wm_idx[i]) << comp * 8;
+	}
+
+	if (enable) {
+		vfe_reg_set(vfe, VFE_0_IRQ_MASK_0, irq_en0);
+		vfe_reg_set(vfe, VFE_0_IRQ_MASK_1, irq_en1);
+		vfe_reg_set(vfe, VFE_0_IRQ_COMPOSITE_MASK_0, comp_mask);
+	} else {
+		vfe_reg_clr(vfe, VFE_0_IRQ_MASK_0, irq_en0);
+		vfe_reg_clr(vfe, VFE_0_IRQ_MASK_1, irq_en1);
+		vfe_reg_clr(vfe, VFE_0_IRQ_COMPOSITE_MASK_0, comp_mask);
+	}
+}
+
+static void vfe_enable_irq_common(struct vfe_device *vfe)
+{
+	u32 irq_en0 = VFE_0_IRQ_MASK_0_RESET_ACK;
+	u32 irq_en1 = VFE_0_IRQ_MASK_1_VIOLATION |
+		      VFE_0_IRQ_MASK_1_BUS_BDG_HALT_ACK;
+
+	vfe_reg_set(vfe, VFE_0_IRQ_MASK_0, irq_en0);
+	vfe_reg_set(vfe, VFE_0_IRQ_MASK_1, irq_en1);
+}
+
+static void vfe_set_demux_cfg(struct vfe_device *vfe, struct vfe_line *line)
+{
+	u32 val, even_cfg, odd_cfg;
+
+	writel_relaxed(VFE_0_DEMUX_CFG_PERIOD, vfe->base + VFE_0_DEMUX_CFG);
+
+	val = VFE_0_DEMUX_GAIN_0_CH0_EVEN | VFE_0_DEMUX_GAIN_0_CH0_ODD;
+	writel_relaxed(val, vfe->base + VFE_0_DEMUX_GAIN_0);
+
+	val = VFE_0_DEMUX_GAIN_1_CH1 | VFE_0_DEMUX_GAIN_1_CH2;
+	writel_relaxed(val, vfe->base + VFE_0_DEMUX_GAIN_1);
+
+	switch (line->fmt[MSM_VFE_PAD_SINK].code) {
+	case MEDIA_BUS_FMT_YUYV8_2X8:
+		even_cfg = VFE_0_DEMUX_EVEN_CFG_PATTERN_YUYV;
+		odd_cfg = VFE_0_DEMUX_ODD_CFG_PATTERN_YUYV;
+		break;
+	case MEDIA_BUS_FMT_YVYU8_2X8:
+		even_cfg = VFE_0_DEMUX_EVEN_CFG_PATTERN_YVYU;
+		odd_cfg = VFE_0_DEMUX_ODD_CFG_PATTERN_YVYU;
+		break;
+	case MEDIA_BUS_FMT_UYVY8_2X8:
+	default:
+		even_cfg = VFE_0_DEMUX_EVEN_CFG_PATTERN_UYVY;
+		odd_cfg = VFE_0_DEMUX_ODD_CFG_PATTERN_UYVY;
+		break;
+	case MEDIA_BUS_FMT_VYUY8_2X8:
+		even_cfg = VFE_0_DEMUX_EVEN_CFG_PATTERN_VYUY;
+		odd_cfg = VFE_0_DEMUX_ODD_CFG_PATTERN_VYUY;
+		break;
+	}
+
+	writel_relaxed(even_cfg, vfe->base + VFE_0_DEMUX_EVEN_CFG);
+	writel_relaxed(odd_cfg, vfe->base + VFE_0_DEMUX_ODD_CFG);
+}
+
+static void vfe_set_scale_cfg(struct vfe_device *vfe, struct vfe_line *line)
+{
+	u32 p = line->video_out.active_fmt.fmt.pix_mp.pixelformat;
+	u32 reg;
+	u16 input, output;
+	u8 interp_reso;
+	u32 phase_mult;
+
+	writel_relaxed(0x3, vfe->base + VFE_0_SCALE_ENC_Y_CFG);
+
+	input = line->fmt[MSM_VFE_PAD_SINK].width - 1;
+	output = line->compose.width - 1;
+	reg = (output << 16) | input;
+	writel_relaxed(reg, vfe->base + VFE_0_SCALE_ENC_Y_H_IMAGE_SIZE);
+
+	interp_reso = vfe_calc_interp_reso(input, output);
+	phase_mult = input * (1 << (14 + interp_reso)) / output;
+	reg = (interp_reso << 28) | phase_mult;
+	writel_relaxed(reg, vfe->base + VFE_0_SCALE_ENC_Y_H_PHASE);
+
+	input = line->fmt[MSM_VFE_PAD_SINK].height - 1;
+	output = line->compose.height - 1;
+	reg = (output << 16) | input;
+	writel_relaxed(reg, vfe->base + VFE_0_SCALE_ENC_Y_V_IMAGE_SIZE);
+
+	interp_reso = vfe_calc_interp_reso(input, output);
+	phase_mult = input * (1 << (14 + interp_reso)) / output;
+	reg = (interp_reso << 28) | phase_mult;
+	writel_relaxed(reg, vfe->base + VFE_0_SCALE_ENC_Y_V_PHASE);
+
+	writel_relaxed(0x3, vfe->base + VFE_0_SCALE_ENC_CBCR_CFG);
+
+	input = line->fmt[MSM_VFE_PAD_SINK].width - 1;
+	output = line->compose.width / 2 - 1;
+	reg = (output << 16) | input;
+	writel_relaxed(reg, vfe->base + VFE_0_SCALE_ENC_CBCR_H_IMAGE_SIZE);
+
+	interp_reso = vfe_calc_interp_reso(input, output);
+	phase_mult = input * (1 << (14 + interp_reso)) / output;
+	reg = (interp_reso << 28) | phase_mult;
+	writel_relaxed(reg, vfe->base + VFE_0_SCALE_ENC_CBCR_H_PHASE);
+
+	input = line->fmt[MSM_VFE_PAD_SINK].height - 1;
+	output = line->compose.height - 1;
+	if (p == V4L2_PIX_FMT_NV12 || p == V4L2_PIX_FMT_NV21)
+		output = line->compose.height / 2 - 1;
+	reg = (output << 16) | input;
+	writel_relaxed(reg, vfe->base + VFE_0_SCALE_ENC_CBCR_V_IMAGE_SIZE);
+
+	interp_reso = vfe_calc_interp_reso(input, output);
+	phase_mult = input * (1 << (14 + interp_reso)) / output;
+	reg = (interp_reso << 28) | phase_mult;
+	writel_relaxed(reg, vfe->base + VFE_0_SCALE_ENC_CBCR_V_PHASE);
+}
+
+static void vfe_set_crop_cfg(struct vfe_device *vfe, struct vfe_line *line)
+{
+	u32 p = line->video_out.active_fmt.fmt.pix_mp.pixelformat;
+	u32 reg;
+	u16 first, last;
+
+	first = line->crop.left;
+	last = line->crop.left + line->crop.width - 1;
+	reg = (first << 16) | last;
+	writel_relaxed(reg, vfe->base + VFE_0_CROP_ENC_Y_WIDTH);
+
+	first = line->crop.top;
+	last = line->crop.top + line->crop.height - 1;
+	reg = (first << 16) | last;
+	writel_relaxed(reg, vfe->base + VFE_0_CROP_ENC_Y_HEIGHT);
+
+	first = line->crop.left / 2;
+	last = line->crop.left / 2 + line->crop.width / 2 - 1;
+	reg = (first << 16) | last;
+	writel_relaxed(reg, vfe->base + VFE_0_CROP_ENC_CBCR_WIDTH);
+
+	first = line->crop.top;
+	last = line->crop.top + line->crop.height - 1;
+	if (p == V4L2_PIX_FMT_NV12 || p == V4L2_PIX_FMT_NV21) {
+		first = line->crop.top / 2;
+		last = line->crop.top / 2 + line->crop.height / 2 - 1;
+	}
+	reg = (first << 16) | last;
+	writel_relaxed(reg, vfe->base + VFE_0_CROP_ENC_CBCR_HEIGHT);
+}
+
+static void vfe_set_clamp_cfg(struct vfe_device *vfe)
+{
+	u32 val = VFE_0_CLAMP_ENC_MAX_CFG_CH0 |
+		VFE_0_CLAMP_ENC_MAX_CFG_CH1 |
+		VFE_0_CLAMP_ENC_MAX_CFG_CH2;
+
+	writel_relaxed(val, vfe->base + VFE_0_CLAMP_ENC_MAX_CFG);
+
+	val = VFE_0_CLAMP_ENC_MIN_CFG_CH0 |
+		VFE_0_CLAMP_ENC_MIN_CFG_CH1 |
+		VFE_0_CLAMP_ENC_MIN_CFG_CH2;
+
+	writel_relaxed(val, vfe->base + VFE_0_CLAMP_ENC_MIN_CFG);
+}
+
+static void vfe_set_cgc_override(struct vfe_device *vfe, u8 wm, u8 enable)
+{
+	/* empty */
+}
+
+static void vfe_set_camif_cfg(struct vfe_device *vfe, struct vfe_line *line)
+{
+	u32 val;
+
+	switch (line->fmt[MSM_VFE_PAD_SINK].code) {
+	case MEDIA_BUS_FMT_YUYV8_2X8:
+		val = VFE_0_CORE_CFG_PIXEL_PATTERN_YCBYCR;
+		break;
+	case MEDIA_BUS_FMT_YVYU8_2X8:
+		val = VFE_0_CORE_CFG_PIXEL_PATTERN_YCRYCB;
+		break;
+	case MEDIA_BUS_FMT_UYVY8_2X8:
+	default:
+		val = VFE_0_CORE_CFG_PIXEL_PATTERN_CBYCRY;
+		break;
+	case MEDIA_BUS_FMT_VYUY8_2X8:
+		val = VFE_0_CORE_CFG_PIXEL_PATTERN_CRYCBY;
+		break;
+	}
+
+	val |= VFE_0_CORE_CFG_COMPOSITE_REG_UPDATE_EN;
+	writel_relaxed(val, vfe->base + VFE_0_CORE_CFG);
+
+	val = line->fmt[MSM_VFE_PAD_SINK].width * 2 - 1;
+	val |= (line->fmt[MSM_VFE_PAD_SINK].height - 1) << 16;
+	writel_relaxed(val, vfe->base + VFE_0_CAMIF_FRAME_CFG);
+
+	val = line->fmt[MSM_VFE_PAD_SINK].width * 2 - 1;
+	writel_relaxed(val, vfe->base + VFE_0_CAMIF_WINDOW_WIDTH_CFG);
+
+	val = line->fmt[MSM_VFE_PAD_SINK].height - 1;
+	writel_relaxed(val, vfe->base + VFE_0_CAMIF_WINDOW_HEIGHT_CFG);
+
+	val = 0xffffffff;
+	writel_relaxed(val, vfe->base + VFE_0_CAMIF_SUBSAMPLE_CFG);
+
+	val = 0xffffffff;
+	writel_relaxed(val, vfe->base + VFE_0_CAMIF_IRQ_FRAMEDROP_PATTERN);
+
+	val = 0xffffffff;
+	writel_relaxed(val, vfe->base + VFE_0_CAMIF_IRQ_SUBSAMPLE_PATTERN);
+
+	val = VFE_0_RDI_CFG_x_MIPI_EN_BITS;
+	vfe_reg_set(vfe, VFE_0_RDI_CFG_x(0), val);
+
+	val = VFE_0_CAMIF_CFG_VFE_OUTPUT_EN;
+	writel_relaxed(val, vfe->base + VFE_0_CAMIF_CFG);
+}
+
+static void vfe_set_camif_cmd(struct vfe_device *vfe, u8 enable)
+{
+	u32 cmd;
+
+	cmd = VFE_0_CAMIF_CMD_CLEAR_CAMIF_STATUS | VFE_0_CAMIF_CMD_NO_CHANGE;
+	writel_relaxed(cmd, vfe->base + VFE_0_CAMIF_CMD);
+
+	/* Make sure camif command is issued written before it is changed again */
+	wmb();
+
+	if (enable)
+		cmd = VFE_0_CAMIF_CMD_ENABLE_FRAME_BOUNDARY;
+	else
+		cmd = VFE_0_CAMIF_CMD_DISABLE_FRAME_BOUNDARY;
+
+	writel_relaxed(cmd, vfe->base + VFE_0_CAMIF_CMD);
+}
+
+static void vfe_set_module_cfg(struct vfe_device *vfe, u8 enable)
+{
+	u32 val_lens = VFE_0_MODULE_LENS_EN_DEMUX |
+		       VFE_0_MODULE_LENS_EN_CHROMA_UPSAMPLE;
+	u32 val_zoom = VFE_0_MODULE_ZOOM_EN_SCALE_ENC |
+		       VFE_0_MODULE_ZOOM_EN_CROP_ENC;
+
+	if (enable) {
+		vfe_reg_set(vfe, VFE_0_MODULE_LENS_EN, val_lens);
+		vfe_reg_set(vfe, VFE_0_MODULE_ZOOM_EN, val_zoom);
+	} else {
+		vfe_reg_clr(vfe, VFE_0_MODULE_LENS_EN, val_lens);
+		vfe_reg_clr(vfe, VFE_0_MODULE_ZOOM_EN, val_zoom);
+	}
+}
+
+static int vfe_camif_wait_for_stop(struct vfe_device *vfe, struct device *dev)
+{
+	u32 val;
+	int ret;
+
+	ret = readl_poll_timeout(vfe->base + VFE_0_CAMIF_STATUS,
+				 val,
+				 (val & VFE_0_CAMIF_STATUS_HALT),
+				 CAMIF_TIMEOUT_SLEEP_US,
+				 CAMIF_TIMEOUT_ALL_US);
+	if (ret < 0)
+		dev_err(dev, "%s: camif stop timeout\n", __func__);
+
+	return ret;
+}
+
+
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
+	u32 value0, value1;
+	int i, j;
+
+	vfe->ops->isr_read(vfe, &value0, &value1);
+
+	trace_printk("VFE: status0 = 0x%08x, status1 = 0x%08x\n",
+		     value0, value1);
+
+	if (value0 & VFE_0_IRQ_STATUS_0_RESET_ACK)
+		vfe->isr_ops.reset_ack(vfe);
+
+	if (value1 & VFE_0_IRQ_STATUS_1_VIOLATION)
+		vfe->ops->violation_read(vfe);
+
+	if (value1 & VFE_0_IRQ_STATUS_1_BUS_BDG_HALT_ACK)
+		vfe->isr_ops.halt_ack(vfe);
+
+	for (i = VFE_LINE_RDI0; i <= VFE_LINE_PIX; i++)
+		if (value0 & VFE_0_IRQ_STATUS_0_line_n_REG_UPDATE(i))
+			vfe->isr_ops.reg_update(vfe, i);
+
+	if (value0 & VFE_0_IRQ_STATUS_0_CAMIF_SOF)
+		vfe->isr_ops.sof(vfe, VFE_LINE_PIX);
+
+	for (i = VFE_LINE_RDI0; i <= VFE_LINE_RDI2; i++)
+		if (value1 & VFE_0_IRQ_STATUS_1_RDIn_SOF(i))
+			vfe->isr_ops.sof(vfe, i);
+
+	for (i = 0; i < MSM_VFE_COMPOSITE_IRQ_NUM; i++)
+		if (value0 & VFE_0_IRQ_STATUS_0_IMAGE_COMPOSITE_DONE_n(i)) {
+			vfe->isr_ops.comp_done(vfe, i);
+			for (j = 0; j < ARRAY_SIZE(vfe->wm_output_map); j++)
+				if (vfe->wm_output_map[j] == VFE_LINE_PIX)
+					value0 &= ~VFE_0_IRQ_MASK_0_IMAGE_MASTER_n_PING_PONG(j);
+		}
+
+	for (i = 0; i < MSM_VFE_IMAGE_MASTERS_NUM; i++)
+		if (value0 & VFE_0_IRQ_STATUS_0_IMAGE_MASTER_n_PING_PONG(i))
+			vfe->isr_ops.wm_done(vfe, i);
+
+	return IRQ_HANDLED;
+}
+
+static u16 vfe_get_ub_size(u8 vfe_id)
+{
+	/* On VFE4.8 the ub-size is the same on both instances */
+	return MSM_VFE_VFE0_UB_SIZE_RDI;
+}
+
+static void vfe_wm_enable(struct vfe_device *vfe, u8 wm, u8 enable)
+{
+	if (enable)
+		writel_relaxed(2 << VFE_0_BUS_IMAGE_MASTER_n_SHIFT(wm),
+			       vfe->base + VFE_0_BUS_IMAGE_MASTER_CMD);
+	else
+		writel_relaxed(1 << VFE_0_BUS_IMAGE_MASTER_n_SHIFT(wm),
+			       vfe->base + VFE_0_BUS_IMAGE_MASTER_CMD);
+
+	/* The WM must be enabled before sending other commands */
+	wmb();
+}
+
+static void vfe_set_qos(struct vfe_device *vfe)
+{
+	u32 val = VFE_0_BUS_BDG_QOS_CFG_0_CFG;
+	u32 val3 = VFE_0_BUS_BDG_QOS_CFG_3_CFG;
+	u32 val4 = VFE_0_BUS_BDG_QOS_CFG_4_CFG;
+	u32 val7 = VFE_0_BUS_BDG_QOS_CFG_7_CFG;
+
+	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_0);
+	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_1);
+	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_QOS_CFG_2);
+	writel_relaxed(val3, vfe->base + VFE_0_BUS_BDG_QOS_CFG_3);
+	writel_relaxed(val4, vfe->base + VFE_0_BUS_BDG_QOS_CFG_4);
+	writel_relaxed(val4, vfe->base + VFE_0_BUS_BDG_QOS_CFG_5);
+	writel_relaxed(val4, vfe->base + VFE_0_BUS_BDG_QOS_CFG_6);
+	writel_relaxed(val7, vfe->base + VFE_0_BUS_BDG_QOS_CFG_7);
+}
+
+static void vfe_set_ds(struct vfe_device *vfe)
+{
+	u32 val = VFE_0_BUS_BDG_DS_CFG_0_CFG;
+	u32 val16 = VFE_0_BUS_BDG_DS_CFG_16_CFG;
+
+	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_0);
+	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_1);
+	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_2);
+	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_3);
+	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_4);
+	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_5);
+	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_6);
+	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_7);
+	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_8);
+	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_9);
+	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_10);
+	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_11);
+	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_12);
+	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_13);
+	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_14);
+	writel_relaxed(val, vfe->base + VFE_0_BUS_BDG_DS_CFG_15);
+	writel_relaxed(val16, vfe->base + VFE_0_BUS_BDG_DS_CFG_16);
+}
+
+static void vfe_isr_read(struct vfe_device *vfe, u32 *value0, u32 *value1)
+{
+	*value0 = readl_relaxed(vfe->base + VFE_0_IRQ_STATUS_0);
+	*value1 = readl_relaxed(vfe->base + VFE_0_IRQ_STATUS_1);
+
+	writel_relaxed(*value0, vfe->base + VFE_0_IRQ_CLEAR_0);
+	writel_relaxed(*value1, vfe->base + VFE_0_IRQ_CLEAR_1);
+
+	/* Enforce barrier between local & global IRQ clear */
+	wmb();
+	writel_relaxed(VFE_0_IRQ_CMD_GLOBAL_CLEAR, vfe->base + VFE_0_IRQ_CMD);
+}
+
+static void vfe_violation_read(struct vfe_device *vfe)
+{
+	u32 violation = readl_relaxed(vfe->base + VFE_0_VIOLATION_STATUS);
+
+	pr_err_ratelimited("VFE: violation = 0x%08x\n", violation);
+}
+
+const struct vfe_hw_ops_gen1 vfe_ops_gen1_4_8 = {
+	.bus_connect_wm_to_rdi = vfe_bus_connect_wm_to_rdi,
+	.bus_disconnect_wm_from_rdi = vfe_bus_disconnect_wm_from_rdi,
+	.bus_enable_wr_if = vfe_bus_enable_wr_if,
+	.bus_reload_wm = vfe_bus_reload_wm,
+	.camif_wait_for_stop = vfe_camif_wait_for_stop,
+	.enable_irq_common = vfe_enable_irq_common,
+	.enable_irq_pix_line = vfe_enable_irq_pix_line,
+	.enable_irq_wm_line = vfe_enable_irq_wm_line,
+	.get_ub_size = vfe_get_ub_size,
+	.halt_clear = vfe_halt_clear,
+	.halt_request = vfe_halt_request,
+	.set_camif_cfg = vfe_set_camif_cfg,
+	.set_camif_cmd = vfe_set_camif_cmd,
+	.set_cgc_override = vfe_set_cgc_override,
+	.set_clamp_cfg = vfe_set_clamp_cfg,
+	.set_crop_cfg = vfe_set_crop_cfg,
+	.set_demux_cfg = vfe_set_demux_cfg,
+	.set_ds = vfe_set_ds,
+	.set_module_cfg = vfe_set_module_cfg,
+	.set_qos = vfe_set_qos,
+	.set_rdi_cid = vfe_set_rdi_cid,
+	.set_realign_cfg = vfe_set_realign_cfg,
+	.set_scale_cfg = vfe_set_scale_cfg,
+	.set_xbar_cfg = vfe_set_xbar_cfg,
+	.wm_enable = vfe_wm_enable,
+	.wm_frame_based = vfe_wm_frame_based,
+	.wm_get_ping_pong_status = vfe_wm_get_ping_pong_status,
+	.wm_line_based = vfe_wm_line_based,
+	.wm_set_framedrop_pattern = vfe_wm_set_framedrop_pattern,
+	.wm_set_framedrop_period = vfe_wm_set_framedrop_period,
+	.wm_set_ping_addr = vfe_wm_set_ping_addr,
+	.wm_set_pong_addr = vfe_wm_set_pong_addr,
+	.wm_set_subsample = vfe_wm_set_subsample,
+	.wm_set_ub_cfg = vfe_wm_set_ub_cfg,
+};
+
+static void vfe_subdev_init(struct vfe_device *vfe)
+{
+	vfe->isr_ops = vfe_isr_ops_gen1;
+	vfe->ops_gen1 = &vfe_ops_gen1_4_8;
+	vfe->video_ops = vfe_video_ops_gen1;
+}
+
+const struct vfe_hw_ops vfe_ops_4_8 = {
+	.global_reset = vfe_global_reset,
+	.hw_version_read = vfe_hw_version_read,
+	.isr_read = vfe_isr_read,
+	.isr = vfe_isr,
+	.reg_update_clear = vfe_reg_update_clear,
+	.reg_update = vfe_reg_update,
+	.subdev_init = vfe_subdev_init,
+	.vfe_disable = vfe_gen1_disable,
+	.vfe_enable = vfe_gen1_enable,
+	.vfe_halt = vfe_gen1_halt,
+	.violation_read = vfe_violation_read,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
new file mode 100644
index 000000000000..ffc543685081
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
@@ -0,0 +1,760 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * camss-vfe-gen1.c
+ *
+ * Qualcomm MSM Camera Subsystem - VFE Common functionality for Gen 1 versions of hw (4.1, 4.7..)
+ *
+ * Copyright (C) 2020 Linaro Ltd.
+ */
+
+
+#include "camss.h"
+#include "camss-vfe.h"
+#include "camss-vfe-gen1.h"
+
+/* Max number of frame drop updates per frame */
+#define VFE_FRAME_DROP_UPDATES 2
+#define VFE_NEXT_SOF_MS 500
+
+
+int vfe_gen1_halt(struct vfe_device *vfe)
+{
+	unsigned long time;
+
+	return 0;
+
+	reinit_completion(&vfe->halt_complete);
+
+	vfe->ops_gen1->halt_request(vfe);
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
+static int vfe_disable_output(struct vfe_line *line)
+{
+	struct vfe_device *vfe = to_vfe(line);
+	struct vfe_output *output = &line->output;
+	const struct vfe_hw_ops *ops = vfe->ops;
+	unsigned long flags;
+	unsigned long time;
+	unsigned int i;
+
+	spin_lock_irqsave(&vfe->output_lock, flags);
+
+	output->gen1.wait_sof = 1;
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+
+	time = wait_for_completion_timeout(&output->sof, msecs_to_jiffies(VFE_NEXT_SOF_MS));
+	if (!time)
+		dev_err(vfe->camss->dev, "VFE sof timeout\n");
+
+	spin_lock_irqsave(&vfe->output_lock, flags);
+	for (i = 0; i < output->wm_num; i++)
+		vfe->ops_gen1->wm_enable(vfe, output->wm_idx[i], 0);
+
+	ops->reg_update(vfe, line->id);
+	output->wait_reg_update = 1;
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+
+	time = wait_for_completion_timeout(&output->reg_update, msecs_to_jiffies(VFE_NEXT_SOF_MS));
+	if (!time)
+		dev_err(vfe->camss->dev, "VFE reg update timeout\n");
+
+	spin_lock_irqsave(&vfe->output_lock, flags);
+
+	if (line->id != VFE_LINE_PIX) {
+		vfe->ops_gen1->wm_frame_based(vfe, output->wm_idx[0], 0);
+		vfe->ops_gen1->bus_disconnect_wm_from_rdi(vfe, output->wm_idx[0], line->id);
+		vfe->ops_gen1->enable_irq_wm_line(vfe, output->wm_idx[0], line->id, 0);
+		vfe->ops_gen1->set_cgc_override(vfe, output->wm_idx[0], 0);
+		spin_unlock_irqrestore(&vfe->output_lock, flags);
+	} else {
+		for (i = 0; i < output->wm_num; i++) {
+			vfe->ops_gen1->wm_line_based(vfe, output->wm_idx[i], NULL, i, 0);
+			vfe->ops_gen1->set_cgc_override(vfe, output->wm_idx[i], 0);
+		}
+
+		vfe->ops_gen1->enable_irq_pix_line(vfe, 0, line->id, 0);
+		vfe->ops_gen1->set_module_cfg(vfe, 0);
+		vfe->ops_gen1->set_realign_cfg(vfe, line, 0);
+		vfe->ops_gen1->set_xbar_cfg(vfe, output, 0);
+		vfe->ops_gen1->set_camif_cmd(vfe, 0);
+
+		spin_unlock_irqrestore(&vfe->output_lock, flags);
+
+		vfe->ops_gen1->camif_wait_for_stop(vfe, vfe->camss->dev);
+	}
+
+	return 0;
+}
+
+/*
+ * vfe_gen1_disable - Disable streaming on VFE line
+ * @line: VFE line
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+int vfe_gen1_disable(struct vfe_line *line)
+{
+	struct vfe_device *vfe = to_vfe(line);
+
+	vfe_disable_output(line);
+
+	vfe_put_output(line);
+
+	mutex_lock(&vfe->stream_lock);
+
+	if (vfe->stream_count == 1)
+		vfe->ops_gen1->bus_enable_wr_if(vfe, 0);
+
+	vfe->stream_count--;
+
+	mutex_unlock(&vfe->stream_lock);
+
+	return 0;
+}
+
+static void vfe_output_init_addrs(struct vfe_device *vfe,
+				  struct vfe_output *output, u8 sync,
+				  struct vfe_line *line)
+{
+	u32 ping_addr;
+	u32 pong_addr;
+	unsigned int i;
+
+	output->gen1.active_buf = 0;
+
+	for (i = 0; i < output->wm_num; i++) {
+		if (output->buf[0])
+			ping_addr = output->buf[0]->addr[i];
+		else
+			ping_addr = 0;
+
+		if (output->buf[1])
+			pong_addr = output->buf[1]->addr[i];
+		else
+			pong_addr = ping_addr;
+
+		vfe->ops_gen1->wm_set_ping_addr(vfe, output->wm_idx[i], ping_addr);
+		vfe->ops_gen1->wm_set_pong_addr(vfe, output->wm_idx[i], pong_addr);
+		if (sync)
+			vfe->ops_gen1->bus_reload_wm(vfe, output->wm_idx[i]);
+	}
+}
+
+static void vfe_output_frame_drop(struct vfe_device *vfe,
+				  struct vfe_output *output,
+				  u32 drop_pattern)
+{
+	u8 drop_period;
+	unsigned int i;
+
+	/* We need to toggle update period to be valid on next frame */
+	output->drop_update_idx++;
+	output->drop_update_idx %= VFE_FRAME_DROP_UPDATES;
+	drop_period = VFE_FRAME_DROP_VAL + output->drop_update_idx;
+
+	for (i = 0; i < output->wm_num; i++) {
+		vfe->ops_gen1->wm_set_framedrop_period(vfe, output->wm_idx[i], drop_period);
+		vfe->ops_gen1->wm_set_framedrop_pattern(vfe, output->wm_idx[i], drop_pattern);
+	}
+
+	vfe->ops->reg_update(vfe, container_of(output, struct vfe_line, output)->id);
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
+	u16 ub_size;
+
+	ub_size = vfe->ops_gen1->get_ub_size(vfe->id);
+	if (!ub_size)
+		return -EINVAL;
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
+	if (output->state != VFE_OUTPUT_RESERVED) {
+		dev_err(vfe->camss->dev, "Output is not in reserved state %d\n", output->state);
+		spin_unlock_irqrestore(&vfe->output_lock, flags);
+		return -EINVAL;
+	}
+	output->state = VFE_OUTPUT_IDLE;
+
+	output->buf[0] = vfe_buf_get_pending(output);
+	output->buf[1] = vfe_buf_get_pending(output);
+
+	if (!output->buf[0] && output->buf[1]) {
+		output->buf[0] = output->buf[1];
+		output->buf[1] = NULL;
+	}
+
+	if (output->buf[0])
+		output->state = VFE_OUTPUT_SINGLE;
+
+	if (output->buf[1])
+		output->state = VFE_OUTPUT_CONTINUOUS;
+
+	switch (output->state) {
+	case VFE_OUTPUT_SINGLE:
+		vfe_output_frame_drop(vfe, output, 1 << frame_skip);
+		break;
+	case VFE_OUTPUT_CONTINUOUS:
+		vfe_output_frame_drop(vfe, output, 3 << frame_skip);
+		break;
+	default:
+		vfe_output_frame_drop(vfe, output, 0);
+		break;
+	}
+
+	output->sequence = 0;
+	output->gen1.wait_sof = 0;
+	output->wait_reg_update = 0;
+	reinit_completion(&output->sof);
+	reinit_completion(&output->reg_update);
+
+	vfe_output_init_addrs(vfe, output, 0, line);
+
+	if (line->id != VFE_LINE_PIX) {
+		vfe->ops_gen1->set_cgc_override(vfe, output->wm_idx[0], 1);
+		vfe->ops_gen1->enable_irq_wm_line(vfe, output->wm_idx[0], line->id, 1);
+		vfe->ops_gen1->bus_connect_wm_to_rdi(vfe, output->wm_idx[0], line->id);
+		vfe->ops_gen1->wm_set_subsample(vfe, output->wm_idx[0]);
+		vfe->ops_gen1->set_rdi_cid(vfe, line->id, 0);
+		vfe->ops_gen1->wm_set_ub_cfg(vfe, output->wm_idx[0],
+					    (ub_size + 1) * output->wm_idx[0], ub_size);
+		vfe->ops_gen1->wm_frame_based(vfe, output->wm_idx[0], 1);
+		vfe->ops_gen1->wm_enable(vfe, output->wm_idx[0], 1);
+		vfe->ops_gen1->bus_reload_wm(vfe, output->wm_idx[0]);
+	} else {
+		ub_size /= output->wm_num;
+		for (i = 0; i < output->wm_num; i++) {
+			vfe->ops_gen1->set_cgc_override(vfe, output->wm_idx[i], 1);
+			vfe->ops_gen1->wm_set_subsample(vfe, output->wm_idx[i]);
+			vfe->ops_gen1->wm_set_ub_cfg(vfe, output->wm_idx[i],
+						     (ub_size + 1) * output->wm_idx[i], ub_size);
+			vfe->ops_gen1->wm_line_based(vfe, output->wm_idx[i],
+						     &line->video_out.active_fmt.fmt.pix_mp, i, 1);
+			vfe->ops_gen1->wm_enable(vfe, output->wm_idx[i], 1);
+			vfe->ops_gen1->bus_reload_wm(vfe, output->wm_idx[i]);
+		}
+		vfe->ops_gen1->enable_irq_pix_line(vfe, 0, line->id, 1);
+		vfe->ops_gen1->set_module_cfg(vfe, 1);
+		vfe->ops_gen1->set_camif_cfg(vfe, line);
+		vfe->ops_gen1->set_realign_cfg(vfe, line, 1);
+		vfe->ops_gen1->set_xbar_cfg(vfe, output, 1);
+		vfe->ops_gen1->set_demux_cfg(vfe, line);
+		vfe->ops_gen1->set_scale_cfg(vfe, line);
+		vfe->ops_gen1->set_crop_cfg(vfe, line);
+		vfe->ops_gen1->set_clamp_cfg(vfe);
+		vfe->ops_gen1->set_camif_cmd(vfe, 1);
+	}
+
+	ops->reg_update(vfe, line->id);
+
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+
+	return 0;
+}
+
+static int vfe_get_output(struct vfe_line *line)
+{
+	struct vfe_device *vfe = to_vfe(line);
+	struct vfe_output *output;
+	struct v4l2_format *f = &line->video_out.active_fmt;
+	unsigned long flags;
+	int i;
+	int wm_idx;
+
+	spin_lock_irqsave(&vfe->output_lock, flags);
+
+	output = &line->output;
+	if (output->state != VFE_OUTPUT_OFF) {
+		dev_err(vfe->camss->dev, "Output is running\n");
+		goto error;
+	}
+	output->state = VFE_OUTPUT_RESERVED;
+
+	output->gen1.active_buf = 0;
+
+	switch (f->fmt.pix_mp.pixelformat) {
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV21:
+	case V4L2_PIX_FMT_NV16:
+	case V4L2_PIX_FMT_NV61:
+		output->wm_num = 2;
+		break;
+	default:
+		output->wm_num = 1;
+		break;
+	}
+
+	for (i = 0; i < output->wm_num; i++) {
+		wm_idx = vfe_reserve_wm(vfe, line->id);
+		if (wm_idx < 0) {
+			dev_err(vfe->camss->dev, "Can not reserve wm\n");
+			goto error_get_wm;
+		}
+		output->wm_idx[i] = wm_idx;
+	}
+
+	output->drop_update_idx = 0;
+
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+
+	return 0;
+
+error_get_wm:
+	for (i--; i >= 0; i--)
+		vfe_release_wm(vfe, output->wm_idx[i]);
+	output->state = VFE_OUTPUT_OFF;
+error:
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+
+	return -EINVAL;
+}
+
+int vfe_gen1_enable(struct vfe_line *line)
+{
+	struct vfe_device *vfe = to_vfe(line);
+	int ret;
+
+	mutex_lock(&vfe->stream_lock);
+
+	if (!vfe->stream_count) {
+		vfe->ops_gen1->enable_irq_common(vfe);
+		vfe->ops_gen1->bus_enable_wr_if(vfe, 1);
+		vfe->ops_gen1->set_qos(vfe);
+		vfe->ops_gen1->set_ds(vfe);
+	}
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
+
+error_enable_output:
+	vfe_put_output(line);
+
+error_get_output:
+	mutex_lock(&vfe->stream_lock);
+
+	if (vfe->stream_count == 1)
+		vfe->ops_gen1->bus_enable_wr_if(vfe, 0);
+
+	vfe->stream_count--;
+
+	mutex_unlock(&vfe->stream_lock);
+
+	return ret;
+}
+
+static void vfe_output_update_ping_addr(struct vfe_device *vfe,
+					struct vfe_output *output, u8 sync,
+					struct vfe_line *line)
+{
+	u32 addr;
+	unsigned int i;
+
+	for (i = 0; i < output->wm_num; i++) {
+		if (output->buf[0])
+			addr = output->buf[0]->addr[i];
+		else
+			addr = 0;
+
+		vfe->ops_gen1->wm_set_ping_addr(vfe, output->wm_idx[i], addr);
+		if (sync)
+			vfe->ops_gen1->bus_reload_wm(vfe, output->wm_idx[i]);
+	}
+}
+
+static void vfe_output_update_pong_addr(struct vfe_device *vfe,
+					struct vfe_output *output, u8 sync,
+					struct vfe_line *line)
+{
+	u32 addr;
+	unsigned int i;
+
+	for (i = 0; i < output->wm_num; i++) {
+		if (output->buf[1])
+			addr = output->buf[1]->addr[i];
+		else
+			addr = 0;
+
+		// XXX
+	}
+
+}
+
+static void vfe_buf_update_wm_on_next(struct vfe_device *vfe,
+				      struct vfe_output *output)
+{
+	switch (output->state) {
+	case VFE_OUTPUT_CONTINUOUS:
+		vfe_output_frame_drop(vfe, output, 3);
+		break;
+	case VFE_OUTPUT_SINGLE:
+	default:
+		dev_err_ratelimited(vfe->camss->dev,
+				    "Next buf in wrong state! %d\n",
+				    output->state);
+		break;
+	}
+}
+
+static void vfe_buf_update_wm_on_last(struct vfe_device *vfe,
+				      struct vfe_output *output)
+{
+	switch (output->state) {
+	case VFE_OUTPUT_CONTINUOUS:
+		output->state = VFE_OUTPUT_SINGLE;
+		vfe_output_frame_drop(vfe, output, 1);
+		break;
+	case VFE_OUTPUT_SINGLE:
+		output->state = VFE_OUTPUT_STOPPING;
+		vfe_output_frame_drop(vfe, output, 0);
+		break;
+	default:
+		dev_err_ratelimited(vfe->camss->dev,
+				    "Last buff in wrong state! %d\n",
+				    output->state);
+		break;
+	}
+}
+
+static void vfe_buf_update_wm_on_new(struct vfe_device *vfe,
+				     struct vfe_output *output,
+				     struct camss_buffer *new_buf,
+				     struct vfe_line *line)
+{
+	int inactive_idx;
+
+	switch (output->state) {
+	case VFE_OUTPUT_SINGLE:
+		inactive_idx = !output->gen1.active_buf;
+
+		if (!output->buf[inactive_idx]) {
+			output->buf[inactive_idx] = new_buf;
+
+			if (inactive_idx)
+				vfe_output_update_pong_addr(vfe, output, 0, line);
+			else
+				vfe_output_update_ping_addr(vfe, output, 0, line);
+
+			vfe_output_frame_drop(vfe, output, 3);
+			output->state = VFE_OUTPUT_CONTINUOUS;
+		} else {
+			vfe_buf_add_pending(output, new_buf);
+			dev_err_ratelimited(vfe->camss->dev,
+					    "Inactive buffer is busy\n");
+		}
+		break;
+
+	case VFE_OUTPUT_IDLE:
+		if (!output->buf[0]) {
+			output->buf[0] = new_buf;
+
+			vfe_output_init_addrs(vfe, output, 1, line);
+			vfe_output_frame_drop(vfe, output, 1);
+
+			output->state = VFE_OUTPUT_SINGLE;
+		} else {
+			vfe_buf_add_pending(output, new_buf);
+			dev_err_ratelimited(vfe->camss->dev,
+					    "Output idle with buffer set!\n");
+		}
+		break;
+
+	case VFE_OUTPUT_CONTINUOUS:
+	default:
+		vfe_buf_add_pending(output, new_buf);
+		break;
+	}
+}
+
+/*
+ * vfe_isr_halt_ack - Process start of frame interrupt
+ * @vfe: VFE Device
+ */
+static void vfe_isr_halt_ack(struct vfe_device *vfe)
+{
+	complete(&vfe->halt_complete);
+	vfe->ops_gen1->halt_clear(vfe);
+}
+
+/*
+ * vfe_isr_sof - Process start of frame interrupt
+ * @vfe: VFE Device
+ * @line_id: VFE line
+ */
+static void vfe_isr_sof(struct vfe_device *vfe, enum vfe_line_id line_id)
+{
+	struct vfe_output *output;
+	unsigned long flags;
+
+	spin_lock_irqsave(&vfe->output_lock, flags);
+	output = &vfe->line[line_id].output;
+	if (output->gen1.wait_sof) {
+		output->gen1.wait_sof = 0;
+		complete(&output->sof);
+	}
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
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
+	struct vfe_line *line = &vfe->line[line_id];
+	unsigned long flags;
+
+	spin_lock_irqsave(&vfe->output_lock, flags);
+	vfe->ops->reg_update_clear(vfe, line_id);
+
+	output = &line->output;
+
+	if (output->wait_reg_update) {
+		output->wait_reg_update = 0;
+		complete(&output->reg_update);
+		spin_unlock_irqrestore(&vfe->output_lock, flags);
+		return;
+	}
+
+	if (output->state == VFE_OUTPUT_STOPPING) {
+		/* Release last buffer when hw is idle */
+		if (output->last_buffer) {
+			vb2_buffer_done(&output->last_buffer->vb.vb2_buf,
+					VB2_BUF_STATE_DONE);
+			output->last_buffer = NULL;
+		}
+		output->state = VFE_OUTPUT_IDLE;
+
+		/* Buffers received in stopping state are queued in */
+		/* dma pending queue, start next capture here */
+
+		output->buf[0] = vfe_buf_get_pending(output);
+		output->buf[1] = vfe_buf_get_pending(output);
+
+		if (!output->buf[0] && output->buf[1]) {
+			output->buf[0] = output->buf[1];
+			output->buf[1] = NULL;
+		}
+
+		if (output->buf[0])
+			output->state = VFE_OUTPUT_SINGLE;
+
+		if (output->buf[1])
+			output->state = VFE_OUTPUT_CONTINUOUS;
+
+		switch (output->state) {
+		case VFE_OUTPUT_SINGLE:
+			vfe_output_frame_drop(vfe, output, 2);
+			break;
+		case VFE_OUTPUT_CONTINUOUS:
+			vfe_output_frame_drop(vfe, output, 3);
+			break;
+		default:
+			vfe_output_frame_drop(vfe, output, 0);
+			break;
+		}
+
+		vfe_output_init_addrs(vfe, output, 1, &vfe->line[line_id]);
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
+	struct camss_buffer *ready_buf;
+	struct vfe_output *output;
+	dma_addr_t *new_addr;
+	unsigned long flags;
+	u32 active_index;
+	u64 ts = ktime_get_ns();
+	unsigned int i;
+
+	active_index = vfe->ops_gen1->wm_get_ping_pong_status(vfe, wm);
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
+	if (output->gen1.active_buf == active_index && 0) {
+		dev_err_ratelimited(vfe->camss->dev,
+				    "Active buffer mismatch!\n");
+		goto out_unlock;
+	}
+	output->gen1.active_buf = active_index;
+
+	ready_buf = output->buf[!active_index];
+	if (!ready_buf) {
+		dev_err_ratelimited(vfe->camss->dev,
+				    "Missing ready buf %d %d!\n",
+				    !active_index, output->state);
+		goto out_unlock;
+	}
+
+	ready_buf->vb.vb2_buf.timestamp = ts;
+	ready_buf->vb.sequence = output->sequence++;
+
+	/* Get next buffer */
+	output->buf[!active_index] = vfe_buf_get_pending(output);
+	if (!output->buf[!active_index]) {
+		/* No next buffer - set same address */
+		new_addr = ready_buf->addr;
+		vfe_buf_update_wm_on_last(vfe, output);
+	} else {
+		new_addr = output->buf[!active_index]->addr;
+		vfe_buf_update_wm_on_next(vfe, output);
+	}
+
+	if (active_index)
+		for (i = 0; i < output->wm_num; i++)
+			vfe->ops_gen1->wm_set_ping_addr(vfe, output->wm_idx[i], new_addr[i]);
+	else
+		for (i = 0; i < output->wm_num; i++)
+			vfe->ops_gen1->wm_set_pong_addr(vfe, output->wm_idx[i], new_addr[i]);
+
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+
+	if (output->state == VFE_OUTPUT_STOPPING)
+		output->last_buffer = ready_buf;
+	else
+		vb2_buffer_done(&ready_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
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
+static int vfe_queue_buffer(struct camss_video *vid, struct camss_buffer *buf)
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
+	vfe_buf_update_wm_on_new(vfe, output, buf, line);
+
+	spin_unlock_irqrestore(&vfe->output_lock, flags);
+
+	return 0;
+}
+
+inline u8 vfe_calc_interp_reso(u16 input, u16 output)
+{
+	if (input / output >= 16)
+		return 0;
+
+	if (input / output >= 8)
+		return 1;
+
+	if (input / output >= 4)
+		return 2;
+
+	return 3;
+}
+
+#define CALC_WORD(width, M, N) (((width) * (M) + (N) - 1) / (N))
+
+int vfe_word_per_line(u32 format, u32 width)
+{
+	int val = 0;
+
+	switch (format) {
+	case V4L2_PIX_FMT_NV12:
+	case V4L2_PIX_FMT_NV21:
+	case V4L2_PIX_FMT_NV16:
+	case V4L2_PIX_FMT_NV61:
+		val = CALC_WORD(width, 1, 8);
+		break;
+	case V4L2_PIX_FMT_YUYV:
+	case V4L2_PIX_FMT_YVYU:
+	case V4L2_PIX_FMT_UYVY:
+	case V4L2_PIX_FMT_VYUY:
+		val = CALC_WORD(width, 2, 8);
+		break;
+	}
+
+	return val;
+}
+
+const struct vfe_isr_ops vfe_isr_ops_gen1 = {
+	.reset_ack = vfe_isr_reset_ack,
+	.halt_ack = vfe_isr_halt_ack,
+	.reg_update = vfe_isr_reg_update,
+	.sof = vfe_isr_sof,
+	.comp_done = vfe_isr_comp_done,
+	.wm_done = vfe_isr_wm_done,
+};
+
+const struct camss_video_ops vfe_video_ops_gen1 = {
+	.queue_buffer = vfe_queue_buffer,
+	.flush_buffers = vfe_flush_buffers,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen1.h b/drivers/media/platform/qcom/camss/camss-vfe-gen1.h
new file mode 100644
index 000000000000..42e8a3333034
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen1.h
@@ -0,0 +1,110 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * camss-vfe.h
+ *
+ * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module
+ *
+ * Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.
+ * Copyright (C) 2015-2018 Linaro Ltd.
+ */
+#ifndef QC_MSM_CAMSS_VFE_GEN1_H
+#define QC_MSM_CAMSS_VFE_GEN1_H
+
+
+#include "camss-vfe.h"
+
+
+enum vfe_line_id;
+struct vfe_device;
+struct vfe_line;
+struct vfe_output;
+
+struct vfe_hw_ops_gen1 {
+	void (*bus_connect_wm_to_rdi)(struct vfe_device *vfe, u8 wm, enum vfe_line_id id);
+	void (*bus_disconnect_wm_from_rdi)(struct vfe_device *vfe, u8 wm, enum vfe_line_id id);
+	void (*bus_enable_wr_if)(struct vfe_device *vfe, u8 enable);
+	void (*bus_reload_wm)(struct vfe_device *vfe, u8 wm);
+	int (*camif_wait_for_stop)(struct vfe_device *vfe, struct device *dev);
+	void (*enable_irq_common)(struct vfe_device *vfe);
+	void (*enable_irq_wm_line)(struct vfe_device *vfe, u8 wm, enum vfe_line_id line_id,
+				   u8 enable);
+	void (*enable_irq_pix_line)(struct vfe_device *vfe, u8 comp, enum vfe_line_id line_id,
+				    u8 enable);
+	u16 (*get_ub_size)(u8 vfe_id);
+	void (*halt_clear)(struct vfe_device *vfe);
+	void (*halt_request)(struct vfe_device *vfe);
+	void (*set_camif_cfg)(struct vfe_device *vfe, struct vfe_line *line);
+	void (*set_camif_cmd)(struct vfe_device *vfe, u8 enable);
+	void (*set_cgc_override)(struct vfe_device *vfe, u8 wm, u8 enable);
+	void (*set_clamp_cfg)(struct vfe_device *vfe);
+	void (*set_crop_cfg)(struct vfe_device *vfe, struct vfe_line *line);
+	void (*set_demux_cfg)(struct vfe_device *vfe, struct vfe_line *line);
+	void (*set_ds)(struct vfe_device *vfe);
+	void (*set_module_cfg)(struct vfe_device *vfe, u8 enable);
+	void (*set_scale_cfg)(struct vfe_device *vfe, struct vfe_line *line);
+	void (*set_rdi_cid)(struct vfe_device *vfe, enum vfe_line_id id, u8 cid);
+	void (*set_realign_cfg)(struct vfe_device *vfe, struct vfe_line *line, u8 enable);
+	void (*set_qos)(struct vfe_device *vfe);
+	void (*set_xbar_cfg)(struct vfe_device *vfe, struct vfe_output *output, u8 enable);
+	void (*wm_frame_based)(struct vfe_device *vfe, u8 wm, u8 enable);
+	void (*wm_line_based)(struct vfe_device *vfe, u32 wm, struct v4l2_pix_format_mplane *pix,
+			      u8 plane, u32 enable);
+	void (*wm_set_ub_cfg)(struct vfe_device *vfe, u8 wm, u16 offset, u16 depth);
+	void (*wm_set_subsample)(struct vfe_device *vfe, u8 wm);
+	void (*wm_set_framedrop_period)(struct vfe_device *vfe, u8 wm, u8 per);
+	void (*wm_set_framedrop_pattern)(struct vfe_device *vfe, u8 wm, u32 pattern);
+	void (*wm_set_ping_addr)(struct vfe_device *vfe, u8 wm, u32 addr);
+	void (*wm_set_pong_addr)(struct vfe_device *vfe, u8 wm, u32 addr);
+	int (*wm_get_ping_pong_status)(struct vfe_device *vfe, u8 wm);
+	void (*wm_enable)(struct vfe_device *vfe, u8 wm, u8 enable);
+};
+
+/*
+ * vfe_calc_interp_reso - Calculate interpolation mode
+ * @input: Input resolution
+ * @output: Output resolution
+ *
+ * Return interpolation mode
+ */
+inline u8 vfe_calc_interp_reso(u16 input, u16 output);
+
+/*
+ * vfe_gen1_disable - Disable streaming on VFE line
+ * @line: VFE line
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+int vfe_gen1_disable(struct vfe_line *line);
+
+
+/*
+ * vfe_gen1_enable - Enable VFE module
+ * @line: VFE line
+ *
+ * Return 0 on success
+ */
+int vfe_gen1_enable(struct vfe_line *line);
+
+/*
+ * vfe_gen1_enable - Halt VFE module
+ * @vfe: VFE device
+ *
+ * Return 0 on success
+ */
+int vfe_gen1_halt(struct vfe_device *vfe);
+
+/*
+ * vfe_word_per_line - Calculate number of words per frame width
+ * @format: V4L2 format
+ * @width: Frame width
+ *
+ * Return number of words per frame width
+ */
+int vfe_word_per_line(u32 format, u32 width);
+
+
+extern const struct vfe_isr_ops vfe_isr_ops_gen1;
+extern const struct camss_video_ops vfe_video_ops_gen1;
+
+
+#endif /* QC_MSM_CAMSS_VFE_GEN1_H */
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 478be4f0cab5..2ffa5b3c5426 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -26,22 +26,8 @@
 
 #define MSM_VFE_NAME "msm_vfe"
 
-#define vfe_line_array(ptr_line)	\
-	((const struct vfe_line (*)[]) &(ptr_line[-(ptr_line->id)]))
-
-#define to_vfe(ptr_line)	\
-	container_of(vfe_line_array(ptr_line), struct vfe_device, line)
-
 /* VFE reset timeout */
 #define VFE_RESET_TIMEOUT_MS 50
-/* VFE halt timeout */
-#define VFE_HALT_TIMEOUT_MS 100
-/* Max number of frame drop updates per frame */
-#define VFE_FRAME_DROP_UPDATES 2
-/* Frame drop value. VAL + UPDATES - 1 should not exceed 31 */
-#define VFE_FRAME_DROP_VAL 30
-
-#define VFE_NEXT_SOF_MS 500
 
 #define SCALER_RATIO_MAX 16
 
@@ -294,30 +280,6 @@ static int vfe_reset(struct vfe_device *vfe)
 	return 0;
 }
 
-/*
- * vfe_halt - Trigger halt on VFE module and wait to complete
- * @vfe: VFE device
- *
- * Return 0 on success or a negative error code otherwise
- */
-static int vfe_halt(struct vfe_device *vfe)
-{
-	unsigned long time;
-
-	reinit_completion(&vfe->halt_complete);
-
-	vfe->ops->halt_request(vfe);
-
-	time = wait_for_completion_timeout(&vfe->halt_complete,
-		msecs_to_jiffies(VFE_HALT_TIMEOUT_MS));
-	if (!time) {
-		dev_err(vfe->camss->dev, "VFE halt timeout\n");
-		return -EIO;
-	}
-
-	return 0;
-}
-
 static void vfe_init_outputs(struct vfe_device *vfe)
 {
 	int i;
@@ -340,71 +302,7 @@ static void vfe_reset_output_maps(struct vfe_device *vfe)
 		vfe->wm_output_map[i] = VFE_LINE_NONE;
 }
 
-static void vfe_output_init_addrs(struct vfe_device *vfe,
-				  struct vfe_output *output, u8 sync)
-{
-	u32 ping_addr;
-	u32 pong_addr;
-	unsigned int i;
-
-	output->active_buf = 0;
-
-	for (i = 0; i < output->wm_num; i++) {
-		if (output->buf[0])
-			ping_addr = output->buf[0]->addr[i];
-		else
-			ping_addr = 0;
-
-		if (output->buf[1])
-			pong_addr = output->buf[1]->addr[i];
-		else
-			pong_addr = ping_addr;
-
-		vfe->ops->wm_set_ping_addr(vfe, output->wm_idx[i], ping_addr);
-		vfe->ops->wm_set_pong_addr(vfe, output->wm_idx[i], pong_addr);
-		if (sync)
-			vfe->ops->bus_reload_wm(vfe, output->wm_idx[i]);
-	}
-}
-
-static void vfe_output_update_ping_addr(struct vfe_device *vfe,
-					struct vfe_output *output, u8 sync)
-{
-	u32 addr;
-	unsigned int i;
-
-	for (i = 0; i < output->wm_num; i++) {
-		if (output->buf[0])
-			addr = output->buf[0]->addr[i];
-		else
-			addr = 0;
-
-		vfe->ops->wm_set_ping_addr(vfe, output->wm_idx[i], addr);
-		if (sync)
-			vfe->ops->bus_reload_wm(vfe, output->wm_idx[i]);
-	}
-}
-
-static void vfe_output_update_pong_addr(struct vfe_device *vfe,
-					struct vfe_output *output, u8 sync)
-{
-	u32 addr;
-	unsigned int i;
-
-	for (i = 0; i < output->wm_num; i++) {
-		if (output->buf[1])
-			addr = output->buf[1]->addr[i];
-		else
-			addr = 0;
-
-		vfe->ops->wm_set_pong_addr(vfe, output->wm_idx[i], addr);
-		if (sync)
-			vfe->ops->bus_reload_wm(vfe, output->wm_idx[i]);
-	}
-
-}
-
-static int vfe_reserve_wm(struct vfe_device *vfe, enum vfe_line_id line_id)
+int vfe_reserve_wm(struct vfe_device *vfe, enum vfe_line_id line_id)
 {
 	int ret = -EBUSY;
 	int i;
@@ -420,7 +318,7 @@ static int vfe_reserve_wm(struct vfe_device *vfe, enum vfe_line_id line_id)
 	return ret;
 }
 
-static int vfe_release_wm(struct vfe_device *vfe, u8 wm)
+int vfe_release_wm(struct vfe_device *vfe, u8 wm)
 {
 	if (wm >= ARRAY_SIZE(vfe->wm_output_map))
 		return -EINVAL;
@@ -430,29 +328,7 @@ static int vfe_release_wm(struct vfe_device *vfe, u8 wm)
 	return 0;
 }
 
-static void vfe_output_frame_drop(struct vfe_device *vfe,
-				  struct vfe_output *output,
-				  u32 drop_pattern)
-{
-	u8 drop_period;
-	unsigned int i;
-
-	/* We need to toggle update period to be valid on next frame */
-	output->drop_update_idx++;
-	output->drop_update_idx %= VFE_FRAME_DROP_UPDATES;
-	drop_period = VFE_FRAME_DROP_VAL + output->drop_update_idx;
-
-	for (i = 0; i < output->wm_num; i++) {
-		vfe->ops->wm_set_framedrop_period(vfe, output->wm_idx[i],
-						  drop_period);
-		vfe->ops->wm_set_framedrop_pattern(vfe, output->wm_idx[i],
-						   drop_pattern);
-	}
-	vfe->ops->reg_update(vfe,
-			     container_of(output, struct vfe_line, output)->id);
-}
-
-static struct camss_buffer *vfe_buf_get_pending(struct vfe_output *output)
+struct camss_buffer *vfe_buf_get_pending(struct vfe_output *output)
 {
 	struct camss_buffer *buffer = NULL;
 
@@ -466,13 +342,8 @@ static struct camss_buffer *vfe_buf_get_pending(struct vfe_output *output)
 	return buffer;
 }
 
-/*
- * vfe_buf_add_pending - Add output buffer to list of pending
- * @output: VFE output
- * @buffer: Video buffer
- */
-static void vfe_buf_add_pending(struct vfe_output *output,
-				struct camss_buffer *buffer)
+void vfe_buf_add_pending(struct vfe_output *output,
+			 struct camss_buffer *buffer)
 {
 	INIT_LIST_HEAD(&buffer->queue);
 	list_add_tail(&buffer->queue, &output->pending_bufs);
@@ -495,149 +366,7 @@ static void vfe_buf_flush_pending(struct vfe_output *output,
 	}
 }
 
-static void vfe_buf_update_wm_on_next(struct vfe_device *vfe,
-				      struct vfe_output *output)
-{
-	switch (output->state) {
-	case VFE_OUTPUT_CONTINUOUS:
-		vfe_output_frame_drop(vfe, output, 3);
-		break;
-	case VFE_OUTPUT_SINGLE:
-	default:
-		dev_err_ratelimited(vfe->camss->dev,
-				    "Next buf in wrong state! %d\n",
-				    output->state);
-		break;
-	}
-}
-
-static void vfe_buf_update_wm_on_last(struct vfe_device *vfe,
-				      struct vfe_output *output)
-{
-	switch (output->state) {
-	case VFE_OUTPUT_CONTINUOUS:
-		output->state = VFE_OUTPUT_SINGLE;
-		vfe_output_frame_drop(vfe, output, 1);
-		break;
-	case VFE_OUTPUT_SINGLE:
-		output->state = VFE_OUTPUT_STOPPING;
-		vfe_output_frame_drop(vfe, output, 0);
-		break;
-	default:
-		dev_err_ratelimited(vfe->camss->dev,
-				    "Last buff in wrong state! %d\n",
-				    output->state);
-		break;
-	}
-}
-
-static void vfe_buf_update_wm_on_new(struct vfe_device *vfe,
-				     struct vfe_output *output,
-				     struct camss_buffer *new_buf)
-{
-	int inactive_idx;
-
-	switch (output->state) {
-	case VFE_OUTPUT_SINGLE:
-		inactive_idx = !output->active_buf;
-
-		if (!output->buf[inactive_idx]) {
-			output->buf[inactive_idx] = new_buf;
-
-			if (inactive_idx)
-				vfe_output_update_pong_addr(vfe, output, 0);
-			else
-				vfe_output_update_ping_addr(vfe, output, 0);
-
-			vfe_output_frame_drop(vfe, output, 3);
-			output->state = VFE_OUTPUT_CONTINUOUS;
-		} else {
-			vfe_buf_add_pending(output, new_buf);
-			dev_err_ratelimited(vfe->camss->dev,
-					    "Inactive buffer is busy\n");
-		}
-		break;
-
-	case VFE_OUTPUT_IDLE:
-		if (!output->buf[0]) {
-			output->buf[0] = new_buf;
-
-			vfe_output_init_addrs(vfe, output, 1);
-
-			vfe_output_frame_drop(vfe, output, 1);
-			output->state = VFE_OUTPUT_SINGLE;
-		} else {
-			vfe_buf_add_pending(output, new_buf);
-			dev_err_ratelimited(vfe->camss->dev,
-					    "Output idle with buffer set!\n");
-		}
-		break;
-
-	case VFE_OUTPUT_CONTINUOUS:
-	default:
-		vfe_buf_add_pending(output, new_buf);
-		break;
-	}
-}
-
-static int vfe_get_output(struct vfe_line *line)
-{
-	struct vfe_device *vfe = to_vfe(line);
-	struct vfe_output *output;
-	struct v4l2_format *f = &line->video_out.active_fmt;
-	unsigned long flags;
-	int i;
-	int wm_idx;
-
-	spin_lock_irqsave(&vfe->output_lock, flags);
-
-	output = &line->output;
-	if (output->state != VFE_OUTPUT_OFF) {
-		dev_err(vfe->camss->dev, "Output is running\n");
-		goto error;
-	}
-	output->state = VFE_OUTPUT_RESERVED;
-
-	output->active_buf = 0;
-
-	switch (f->fmt.pix_mp.pixelformat) {
-	case V4L2_PIX_FMT_NV12:
-	case V4L2_PIX_FMT_NV21:
-	case V4L2_PIX_FMT_NV16:
-	case V4L2_PIX_FMT_NV61:
-		output->wm_num = 2;
-		break;
-	default:
-		output->wm_num = 1;
-		break;
-	}
-
-	for (i = 0; i < output->wm_num; i++) {
-		wm_idx = vfe_reserve_wm(vfe, line->id);
-		if (wm_idx < 0) {
-			dev_err(vfe->camss->dev, "Can not reserve wm\n");
-			goto error_get_wm;
-		}
-		output->wm_idx[i] = wm_idx;
-	}
-
-	output->drop_update_idx = 0;
-
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-
-	return 0;
-
-error_get_wm:
-	for (i--; i >= 0; i--)
-		vfe_release_wm(vfe, output->wm_idx[i]);
-	output->state = VFE_OUTPUT_OFF;
-error:
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-
-	return -EINVAL;
-}
-
-static int vfe_put_output(struct vfe_line *line)
+int vfe_put_output(struct vfe_line *line)
 {
 	struct vfe_device *vfe = to_vfe(line);
 	struct vfe_output *output = &line->output;
@@ -655,454 +384,27 @@ static int vfe_put_output(struct vfe_line *line)
 	return 0;
 }
 
-static int vfe_enable_output(struct vfe_line *line)
-{
-	struct vfe_device *vfe = to_vfe(line);
-	struct vfe_output *output = &line->output;
-	const struct vfe_hw_ops *ops = vfe->ops;
-	struct media_entity *sensor;
-	unsigned long flags;
-	unsigned int frame_skip = 0;
-	unsigned int i;
-	u16 ub_size;
-
-	ub_size = ops->get_ub_size(vfe->id);
-	if (!ub_size)
-		return -EINVAL;
-
-	sensor = camss_find_sensor(&line->subdev.entity);
-	if (sensor) {
-		struct v4l2_subdev *subdev =
-					media_entity_to_v4l2_subdev(sensor);
-
-		v4l2_subdev_call(subdev, sensor, g_skip_frames, &frame_skip);
-		/* Max frame skip is 29 frames */
-		if (frame_skip > VFE_FRAME_DROP_VAL - 1)
-			frame_skip = VFE_FRAME_DROP_VAL - 1;
-	}
-
-	spin_lock_irqsave(&vfe->output_lock, flags);
-
-	ops->reg_update_clear(vfe, line->id);
-
-	if (output->state != VFE_OUTPUT_RESERVED) {
-		dev_err(vfe->camss->dev, "Output is not in reserved state %d\n",
-			output->state);
-		spin_unlock_irqrestore(&vfe->output_lock, flags);
-		return -EINVAL;
-	}
-	output->state = VFE_OUTPUT_IDLE;
-
-	output->buf[0] = vfe_buf_get_pending(output);
-	output->buf[1] = vfe_buf_get_pending(output);
-
-	if (!output->buf[0] && output->buf[1]) {
-		output->buf[0] = output->buf[1];
-		output->buf[1] = NULL;
-	}
-
-	if (output->buf[0])
-		output->state = VFE_OUTPUT_SINGLE;
-
-	if (output->buf[1])
-		output->state = VFE_OUTPUT_CONTINUOUS;
-
-	switch (output->state) {
-	case VFE_OUTPUT_SINGLE:
-		vfe_output_frame_drop(vfe, output, 1 << frame_skip);
-		break;
-	case VFE_OUTPUT_CONTINUOUS:
-		vfe_output_frame_drop(vfe, output, 3 << frame_skip);
-		break;
-	default:
-		vfe_output_frame_drop(vfe, output, 0);
-		break;
-	}
-
-	output->sequence = 0;
-	output->wait_sof = 0;
-	output->wait_reg_update = 0;
-	reinit_completion(&output->sof);
-	reinit_completion(&output->reg_update);
-
-	vfe_output_init_addrs(vfe, output, 0);
-
-	if (line->id != VFE_LINE_PIX) {
-		ops->set_cgc_override(vfe, output->wm_idx[0], 1);
-		ops->enable_irq_wm_line(vfe, output->wm_idx[0], line->id, 1);
-		ops->bus_connect_wm_to_rdi(vfe, output->wm_idx[0], line->id);
-		ops->wm_set_subsample(vfe, output->wm_idx[0]);
-		ops->set_rdi_cid(vfe, line->id, 0);
-		ops->wm_set_ub_cfg(vfe, output->wm_idx[0],
-				   (ub_size + 1) * output->wm_idx[0], ub_size);
-		ops->wm_frame_based(vfe, output->wm_idx[0], 1);
-		ops->wm_enable(vfe, output->wm_idx[0], 1);
-		ops->bus_reload_wm(vfe, output->wm_idx[0]);
-	} else {
-		ub_size /= output->wm_num;
-		for (i = 0; i < output->wm_num; i++) {
-			ops->set_cgc_override(vfe, output->wm_idx[i], 1);
-			ops->wm_set_subsample(vfe, output->wm_idx[i]);
-			ops->wm_set_ub_cfg(vfe, output->wm_idx[i],
-					   (ub_size + 1) * output->wm_idx[i],
-					   ub_size);
-			ops->wm_line_based(vfe, output->wm_idx[i],
-					&line->video_out.active_fmt.fmt.pix_mp,
-					i, 1);
-			ops->wm_enable(vfe, output->wm_idx[i], 1);
-			ops->bus_reload_wm(vfe, output->wm_idx[i]);
-		}
-		ops->enable_irq_pix_line(vfe, 0, line->id, 1);
-		ops->set_module_cfg(vfe, 1);
-		ops->set_camif_cfg(vfe, line);
-		ops->set_realign_cfg(vfe, line, 1);
-		ops->set_xbar_cfg(vfe, output, 1);
-		ops->set_demux_cfg(vfe, line);
-		ops->set_scale_cfg(vfe, line);
-		ops->set_crop_cfg(vfe, line);
-		ops->set_clamp_cfg(vfe);
-		ops->set_camif_cmd(vfe, 1);
-	}
-
-	ops->reg_update(vfe, line->id);
-
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-
-	return 0;
-}
-
-static int vfe_disable_output(struct vfe_line *line)
-{
-	struct vfe_device *vfe = to_vfe(line);
-	struct vfe_output *output = &line->output;
-	const struct vfe_hw_ops *ops = vfe->ops;
-	unsigned long flags;
-	unsigned long time;
-	unsigned int i;
-
-	spin_lock_irqsave(&vfe->output_lock, flags);
-
-	output->wait_sof = 1;
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-
-	time = wait_for_completion_timeout(&output->sof,
-					   msecs_to_jiffies(VFE_NEXT_SOF_MS));
-	if (!time)
-		dev_err(vfe->camss->dev, "VFE sof timeout\n");
-
-	spin_lock_irqsave(&vfe->output_lock, flags);
-	for (i = 0; i < output->wm_num; i++)
-		ops->wm_enable(vfe, output->wm_idx[i], 0);
-
-	ops->reg_update(vfe, line->id);
-	output->wait_reg_update = 1;
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-
-	time = wait_for_completion_timeout(&output->reg_update,
-					   msecs_to_jiffies(VFE_NEXT_SOF_MS));
-	if (!time)
-		dev_err(vfe->camss->dev, "VFE reg update timeout\n");
-
-	spin_lock_irqsave(&vfe->output_lock, flags);
-
-	if (line->id != VFE_LINE_PIX) {
-		ops->wm_frame_based(vfe, output->wm_idx[0], 0);
-		ops->bus_disconnect_wm_from_rdi(vfe, output->wm_idx[0],
-						line->id);
-		ops->enable_irq_wm_line(vfe, output->wm_idx[0], line->id, 0);
-		ops->set_cgc_override(vfe, output->wm_idx[0], 0);
-		spin_unlock_irqrestore(&vfe->output_lock, flags);
-	} else {
-		for (i = 0; i < output->wm_num; i++) {
-			ops->wm_line_based(vfe, output->wm_idx[i], NULL, i, 0);
-			ops->set_cgc_override(vfe, output->wm_idx[i], 0);
-		}
-
-		ops->enable_irq_pix_line(vfe, 0, line->id, 0);
-		ops->set_module_cfg(vfe, 0);
-		ops->set_realign_cfg(vfe, line, 0);
-		ops->set_xbar_cfg(vfe, output, 0);
-
-		ops->set_camif_cmd(vfe, 0);
-		spin_unlock_irqrestore(&vfe->output_lock, flags);
-
-		ops->camif_wait_for_stop(vfe, vfe->camss->dev);
-	}
-
-	return 0;
-}
-
-/*
- * vfe_enable - Enable streaming on VFE line
- * @line: VFE line
- *
- * Return 0 on success or a negative error code otherwise
- */
-static int vfe_enable(struct vfe_line *line)
-{
-	struct vfe_device *vfe = to_vfe(line);
-	int ret;
-
-	mutex_lock(&vfe->stream_lock);
-
-	if (!vfe->stream_count) {
-		vfe->ops->enable_irq_common(vfe);
-
-		vfe->ops->bus_enable_wr_if(vfe, 1);
-
-		vfe->ops->set_qos(vfe);
-
-		vfe->ops->set_ds(vfe);
-	}
-
-	vfe->stream_count++;
-
-	mutex_unlock(&vfe->stream_lock);
-
-	ret = vfe_get_output(line);
-	if (ret < 0)
-		goto error_get_output;
-
-	ret = vfe_enable_output(line);
-	if (ret < 0)
-		goto error_enable_output;
-
-	vfe->was_streaming = 1;
-
-	return 0;
-
-
-error_enable_output:
-	vfe_put_output(line);
-
-error_get_output:
-	mutex_lock(&vfe->stream_lock);
-
-	if (vfe->stream_count == 1)
-		vfe->ops->bus_enable_wr_if(vfe, 0);
-
-	vfe->stream_count--;
-
-	mutex_unlock(&vfe->stream_lock);
-
-	return ret;
-}
-
-/*
- * vfe_disable - Disable streaming on VFE line
- * @line: VFE line
- *
- * Return 0 on success or a negative error code otherwise
- */
-static int vfe_disable(struct vfe_line *line)
-{
-	struct vfe_device *vfe = to_vfe(line);
-
-	vfe_disable_output(line);
-
-	vfe_put_output(line);
-
-	mutex_lock(&vfe->stream_lock);
-
-	if (vfe->stream_count == 1)
-		vfe->ops->bus_enable_wr_if(vfe, 0);
-
-	vfe->stream_count--;
-
-	mutex_unlock(&vfe->stream_lock);
-
-	return 0;
-}
-
-/*
- * vfe_isr_sof - Process start of frame interrupt
- * @vfe: VFE Device
- * @line_id: VFE line
- */
-static void vfe_isr_sof(struct vfe_device *vfe, enum vfe_line_id line_id)
-{
-	struct vfe_output *output;
-	unsigned long flags;
-
-	spin_lock_irqsave(&vfe->output_lock, flags);
-	output = &vfe->line[line_id].output;
-	if (output->wait_sof) {
-		output->wait_sof = 0;
-		complete(&output->sof);
-	}
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-}
-
-/*
- * vfe_isr_reg_update - Process reg update interrupt
- * @vfe: VFE Device
- * @line_id: VFE line
- */
-static void vfe_isr_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
-{
-	struct vfe_output *output;
-	unsigned long flags;
-
-	spin_lock_irqsave(&vfe->output_lock, flags);
-	vfe->ops->reg_update_clear(vfe, line_id);
-
-	output = &vfe->line[line_id].output;
-
-	if (output->wait_reg_update) {
-		output->wait_reg_update = 0;
-		complete(&output->reg_update);
-		spin_unlock_irqrestore(&vfe->output_lock, flags);
-		return;
-	}
-
-	if (output->state == VFE_OUTPUT_STOPPING) {
-		/* Release last buffer when hw is idle */
-		if (output->last_buffer) {
-			vb2_buffer_done(&output->last_buffer->vb.vb2_buf,
-					VB2_BUF_STATE_DONE);
-			output->last_buffer = NULL;
-		}
-		output->state = VFE_OUTPUT_IDLE;
-
-		/* Buffers received in stopping state are queued in */
-		/* dma pending queue, start next capture here */
-
-		output->buf[0] = vfe_buf_get_pending(output);
-		output->buf[1] = vfe_buf_get_pending(output);
-
-		if (!output->buf[0] && output->buf[1]) {
-			output->buf[0] = output->buf[1];
-			output->buf[1] = NULL;
-		}
-
-		if (output->buf[0])
-			output->state = VFE_OUTPUT_SINGLE;
-
-		if (output->buf[1])
-			output->state = VFE_OUTPUT_CONTINUOUS;
-
-		switch (output->state) {
-		case VFE_OUTPUT_SINGLE:
-			vfe_output_frame_drop(vfe, output, 2);
-			break;
-		case VFE_OUTPUT_CONTINUOUS:
-			vfe_output_frame_drop(vfe, output, 3);
-			break;
-		default:
-			vfe_output_frame_drop(vfe, output, 0);
-			break;
-		}
-
-		vfe_output_init_addrs(vfe, output, 1);
-	}
-
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-}
-
-/*
- * vfe_isr_wm_done - Process write master done interrupt
- * @vfe: VFE Device
- * @wm: Write master id
- */
-static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
-{
-	struct camss_buffer *ready_buf;
-	struct vfe_output *output;
-	dma_addr_t *new_addr;
-	unsigned long flags;
-	u32 active_index;
-	u64 ts = ktime_get_ns();
-	unsigned int i;
-
-	active_index = vfe->ops->wm_get_ping_pong_status(vfe, wm);
-
-	spin_lock_irqsave(&vfe->output_lock, flags);
-
-	if (vfe->wm_output_map[wm] == VFE_LINE_NONE) {
-		dev_err_ratelimited(vfe->camss->dev,
-				    "Received wm done for unmapped index\n");
-		goto out_unlock;
-	}
-	output = &vfe->line[vfe->wm_output_map[wm]].output;
-
-	if (output->active_buf == active_index) {
-		dev_err_ratelimited(vfe->camss->dev,
-				    "Active buffer mismatch!\n");
-		goto out_unlock;
-	}
-	output->active_buf = active_index;
-
-	ready_buf = output->buf[!active_index];
-	if (!ready_buf) {
-		dev_err_ratelimited(vfe->camss->dev,
-				    "Missing ready buf %d %d!\n",
-				    !active_index, output->state);
-		goto out_unlock;
-	}
-
-	ready_buf->vb.vb2_buf.timestamp = ts;
-	ready_buf->vb.sequence = output->sequence++;
-
-	/* Get next buffer */
-	output->buf[!active_index] = vfe_buf_get_pending(output);
-	if (!output->buf[!active_index]) {
-		/* No next buffer - set same address */
-		new_addr = ready_buf->addr;
-		vfe_buf_update_wm_on_last(vfe, output);
-	} else {
-		new_addr = output->buf[!active_index]->addr;
-		vfe_buf_update_wm_on_next(vfe, output);
-	}
-
-	if (active_index)
-		for (i = 0; i < output->wm_num; i++)
-			vfe->ops->wm_set_ping_addr(vfe, output->wm_idx[i],
-						   new_addr[i]);
-	else
-		for (i = 0; i < output->wm_num; i++)
-			vfe->ops->wm_set_pong_addr(vfe, output->wm_idx[i],
-						   new_addr[i]);
-
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-
-	if (output->state == VFE_OUTPUT_STOPPING)
-		output->last_buffer = ready_buf;
-	else
-		vb2_buffer_done(&ready_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
-
-	return;
-
-out_unlock:
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-}
-
 /*
  * vfe_isr_comp_done - Process composite image done interrupt
  * @vfe: VFE Device
  * @comp: Composite image id
  */
-static void vfe_isr_comp_done(struct vfe_device *vfe, u8 comp)
+void vfe_isr_comp_done(struct vfe_device *vfe, u8 comp)
 {
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(vfe->wm_output_map); i++)
 		if (vfe->wm_output_map[i] == VFE_LINE_PIX) {
-			vfe_isr_wm_done(vfe, i);
+			vfe->isr_ops.wm_done(vfe, i);
 			break;
 		}
 }
 
-static inline void vfe_isr_reset_ack(struct vfe_device *vfe)
+void vfe_isr_reset_ack(struct vfe_device *vfe)
 {
 	complete(&vfe->reset_complete);
 }
 
-static inline void vfe_isr_halt_ack(struct vfe_device *vfe)
-{
-	complete(&vfe->halt_complete);
-	vfe->ops->halt_clear(vfe);
-}
-
 /*
  * vfe_set_clock_rates - Calculate and set clock rates on VFE module
  * @vfe: VFE device
@@ -1318,7 +620,7 @@ static void vfe_put(struct vfe_device *vfe)
 	} else if (vfe->power_count == 1) {
 		if (vfe->was_streaming) {
 			vfe->was_streaming = 0;
-			vfe_halt(vfe);
+			vfe->ops->vfe_halt(vfe);
 		}
 		camss_disable_clocks(vfe->nclocks, vfe->clock);
 		pm_runtime_put_sync(vfe->camss->dev);
@@ -1331,35 +633,6 @@ static void vfe_put(struct vfe_device *vfe)
 	mutex_unlock(&vfe->power_lock);
 }
 
-/*
- * vfe_queue_buffer - Add empty buffer
- * @vid: Video device structure
- * @buf: Buffer to be enqueued
- *
- * Add an empty buffer - depending on the current number of buffers it will be
- * put in pending buffer queue or directly given to the hardware to be filled.
- *
- * Return 0 on success or a negative error code otherwise
- */
-static int vfe_queue_buffer(struct camss_video *vid,
-			    struct camss_buffer *buf)
-{
-	struct vfe_line *line = container_of(vid, struct vfe_line, video_out);
-	struct vfe_device *vfe = to_vfe(line);
-	struct vfe_output *output;
-	unsigned long flags;
-
-	output = &line->output;
-
-	spin_lock_irqsave(&vfe->output_lock, flags);
-
-	vfe_buf_update_wm_on_new(vfe, output, buf);
-
-	spin_unlock_irqrestore(&vfe->output_lock, flags);
-
-	return 0;
-}
-
 /*
  * vfe_flush_buffers - Return all vb2 buffers
  * @vid: Video device structure
@@ -1370,8 +643,8 @@ static int vfe_queue_buffer(struct camss_video *vid,
  *
  * Return 0 on success or a negative error code otherwise
  */
-static int vfe_flush_buffers(struct camss_video *vid,
-			     enum vb2_buffer_state state)
+int vfe_flush_buffers(struct camss_video *vid,
+		      enum vb2_buffer_state state)
 {
 	struct vfe_line *line = container_of(vid, struct vfe_line, video_out);
 	struct vfe_device *vfe = to_vfe(line);
@@ -1442,12 +715,12 @@ static int vfe_set_stream(struct v4l2_subdev *sd, int enable)
 	int ret;
 
 	if (enable) {
-		ret = vfe_enable(line);
+		ret = vfe->ops->vfe_enable(line);
 		if (ret < 0)
 			dev_err(vfe->camss->dev,
 				"Failed to enable vfe outputs\n");
 	} else {
-		ret = vfe_disable(line);
+		ret = vfe->ops->vfe_disable(line);
 		if (ret < 0)
 			dev_err(vfe->camss->dev,
 				"Failed to disable vfe outputs\n");
@@ -1985,13 +1258,6 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 	int i, j;
 	int ret;
 
-	vfe->isr_ops.reset_ack = vfe_isr_reset_ack;
-	vfe->isr_ops.halt_ack = vfe_isr_halt_ack;
-	vfe->isr_ops.reg_update = vfe_isr_reg_update;
-	vfe->isr_ops.sof = vfe_isr_sof;
-	vfe->isr_ops.comp_done = vfe_isr_comp_done;
-	vfe->isr_ops.wm_done = vfe_isr_wm_done;
-
 	switch (camss->version) {
 	case CAMSS_8x16:
 		vfe->ops = &vfe_ops_4_1;
@@ -2005,6 +1271,7 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 	default:
 		return -EINVAL;
 	}
+	vfe->ops->subdev_init(vfe);
 
 	/* Memory */
 
@@ -2209,11 +1476,6 @@ static const struct media_entity_operations vfe_media_ops = {
 	.link_validate = v4l2_subdev_link_validate,
 };
 
-static const struct camss_video_ops camss_vfe_video_ops = {
-	.queue_buffer = vfe_queue_buffer,
-	.flush_buffers = vfe_flush_buffers,
-};
-
 /*
  * msm_vfe_register_entities - Register subdev node for VFE module
  * @vfe: VFE device
@@ -2279,7 +1541,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 			goto error_reg_subdev;
 		}
 
-		video_out->ops = &camss_vfe_video_ops;
+		video_out->ops = &vfe->video_ops;
 		video_out->bpl_alignment = 8;
 		video_out->line_based = 0;
 		if (i == VFE_LINE_PIX) {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 5bce6736e4bb..8629c833f130 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -17,6 +17,8 @@
 #include <media/v4l2-subdev.h>
 
 #include "camss-video.h"
+#include "camss-vfe-gen1.h"
+
 
 #define MSM_VFE_PAD_SINK 0
 #define MSM_VFE_PAD_SRC 1
@@ -26,6 +28,18 @@
 #define MSM_VFE_IMAGE_MASTERS_NUM 7
 #define MSM_VFE_COMPOSITE_IRQ_NUM 4
 
+/* VFE halt timeout */
+#define VFE_HALT_TIMEOUT_MS 100
+/* Frame drop value. VAL + UPDATES - 1 should not exceed 31 */
+#define VFE_FRAME_DROP_VAL 30
+
+#define vfe_line_array(ptr_line)	\
+	((const struct vfe_line (*)[]) &(ptr_line[-(ptr_line->id)]))
+
+#define to_vfe(ptr_line)	\
+	container_of(vfe_line_array(ptr_line), struct vfe_device, line)
+
+
 enum vfe_output_state {
 	VFE_OUTPUT_OFF,
 	VFE_OUTPUT_RESERVED,
@@ -47,16 +61,21 @@ struct vfe_output {
 	u8 wm_num;
 	u8 wm_idx[3];
 
-	int active_buf;
 	struct camss_buffer *buf[2];
 	struct camss_buffer *last_buffer;
 	struct list_head pending_bufs;
 
 	unsigned int drop_update_idx;
 
+	union {
+		struct {
+			int active_buf;
+			int wait_sof;
+		} gen1;
+	};
 	enum vfe_output_state state;
 	unsigned int sequence;
-	int wait_sof;
+
 	int wait_reg_update;
 	struct completion sof;
 	struct completion reg_update;
@@ -78,59 +97,19 @@ struct vfe_line {
 struct vfe_device;
 
 struct vfe_hw_ops {
-	void (*hw_version_read)(struct vfe_device *vfe, struct device *dev);
-	u16 (*get_ub_size)(u8 vfe_id);
+	void (*enable_irq_common)(struct vfe_device *vfe);
 	void (*global_reset)(struct vfe_device *vfe);
-	void (*halt_request)(struct vfe_device *vfe);
-	void (*halt_clear)(struct vfe_device *vfe);
-	void (*wm_enable)(struct vfe_device *vfe, u8 wm, u8 enable);
-	void (*wm_frame_based)(struct vfe_device *vfe, u8 wm, u8 enable);
-	void (*wm_line_based)(struct vfe_device *vfe, u32 wm,
-			      struct v4l2_pix_format_mplane *pix,
-			      u8 plane, u32 enable);
-	void (*wm_set_framedrop_period)(struct vfe_device *vfe, u8 wm, u8 per);
-	void (*wm_set_framedrop_pattern)(struct vfe_device *vfe, u8 wm,
-					 u32 pattern);
-	void (*wm_set_ub_cfg)(struct vfe_device *vfe, u8 wm, u16 offset,
-			      u16 depth);
-	void (*bus_reload_wm)(struct vfe_device *vfe, u8 wm);
-	void (*wm_set_ping_addr)(struct vfe_device *vfe, u8 wm, u32 addr);
-	void (*wm_set_pong_addr)(struct vfe_device *vfe, u8 wm, u32 addr);
-	int (*wm_get_ping_pong_status)(struct vfe_device *vfe, u8 wm);
-	void (*bus_enable_wr_if)(struct vfe_device *vfe, u8 enable);
-	void (*bus_connect_wm_to_rdi)(struct vfe_device *vfe, u8 wm,
-				      enum vfe_line_id id);
-	void (*wm_set_subsample)(struct vfe_device *vfe, u8 wm);
-	void (*bus_disconnect_wm_from_rdi)(struct vfe_device *vfe, u8 wm,
-					   enum vfe_line_id id);
-	void (*set_xbar_cfg)(struct vfe_device *vfe, struct vfe_output *output,
-			     u8 enable);
-	void (*set_rdi_cid)(struct vfe_device *vfe, enum vfe_line_id id,
-			    u8 cid);
-	void (*set_realign_cfg)(struct vfe_device *vfe, struct vfe_line *line,
-				u8 enable);
+	void (*hw_version_read)(struct vfe_device *vfe, struct device *dev);
+	irqreturn_t (*isr)(int irq, void *dev);
+	void (*isr_read)(struct vfe_device *vfe, u32 *value0, u32 *value1);
 	void (*reg_update)(struct vfe_device *vfe, enum vfe_line_id line_id);
 	void (*reg_update_clear)(struct vfe_device *vfe,
 				 enum vfe_line_id line_id);
-	void (*enable_irq_wm_line)(struct vfe_device *vfe, u8 wm,
-				   enum vfe_line_id line_id, u8 enable);
-	void (*enable_irq_pix_line)(struct vfe_device *vfe, u8 comp,
-				    enum vfe_line_id line_id, u8 enable);
-	void (*enable_irq_common)(struct vfe_device *vfe);
-	void (*set_demux_cfg)(struct vfe_device *vfe, struct vfe_line *line);
-	void (*set_scale_cfg)(struct vfe_device *vfe, struct vfe_line *line);
-	void (*set_crop_cfg)(struct vfe_device *vfe, struct vfe_line *line);
-	void (*set_clamp_cfg)(struct vfe_device *vfe);
-	void (*set_qos)(struct vfe_device *vfe);
-	void (*set_ds)(struct vfe_device *vfe);
-	void (*set_cgc_override)(struct vfe_device *vfe, u8 wm, u8 enable);
-	void (*set_camif_cfg)(struct vfe_device *vfe, struct vfe_line *line);
-	void (*set_camif_cmd)(struct vfe_device *vfe, u8 enable);
-	void (*set_module_cfg)(struct vfe_device *vfe, u8 enable);
-	int (*camif_wait_for_stop)(struct vfe_device *vfe, struct device *dev);
-	void (*isr_read)(struct vfe_device *vfe, u32 *value0, u32 *value1);
+	void (*subdev_init)(struct vfe_device *vfe);
+	int (*vfe_disable)(struct vfe_line *line);
+	int (*vfe_enable)(struct vfe_line *line);
+	int (*vfe_halt)(struct vfe_device *vfe);
 	void (*violation_read)(struct vfe_device *vfe);
-	irqreturn_t (*isr)(int irq, void *dev);
 };
 
 struct vfe_isr_ops {
@@ -162,7 +141,9 @@ struct vfe_device {
 	u32 reg_update;
 	u8 was_streaming;
 	const struct vfe_hw_ops *ops;
+	const struct vfe_hw_ops_gen1 *ops_gen1;
 	struct vfe_isr_ops isr_ops;
+	struct camss_video_ops video_ops;
 };
 
 struct resources;
@@ -178,6 +159,38 @@ void msm_vfe_unregister_entities(struct vfe_device *vfe);
 void msm_vfe_get_vfe_id(struct media_entity *entity, u8 *id);
 void msm_vfe_get_vfe_line_id(struct media_entity *entity, enum vfe_line_id *id);
 
+
+/*
+ * vfe_buf_add_pending - Add output buffer to list of pending
+ * @output: VFE output
+ * @buffer: Video buffer
+ */
+void vfe_buf_add_pending(struct vfe_output *output, struct camss_buffer *buffer);
+
+struct camss_buffer *vfe_buf_get_pending(struct vfe_output *output);
+
+/*
+ * vfe_disable - Disable streaming on VFE line
+ * @line: VFE line
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+int vfe_disable(struct vfe_line *line);
+
+int vfe_flush_buffers(struct camss_video *vid, enum vb2_buffer_state state);
+
+/*
+ * vfe_isr_comp_done - Process composite image done interrupt
+ * @vfe: VFE Device
+ * @comp: Composite image id
+ */
+void vfe_isr_comp_done(struct vfe_device *vfe, u8 comp);
+
+void vfe_isr_reset_ack(struct vfe_device *vfe);
+int vfe_put_output(struct vfe_line *line);
+int vfe_release_wm(struct vfe_device *vfe, u8 wm);
+int vfe_reserve_wm(struct vfe_device *vfe, enum vfe_line_id line_id);
+
 extern const struct vfe_hw_ops vfe_ops_4_1;
 extern const struct vfe_hw_ops vfe_ops_4_7;
 extern const struct vfe_hw_ops vfe_ops_4_8;
-- 
2.27.0

