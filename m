Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95AA93A0715
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 00:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235227AbhFHWkQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 18:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234727AbhFHWkJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 18:40:09 -0400
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C84DAC061574
        for <linux-media@vger.kernel.org>; Tue,  8 Jun 2021 15:38:01 -0700 (PDT)
Received: by mail-qk1-x733.google.com with SMTP id k4so21968942qkd.0
        for <linux-media@vger.kernel.org>; Tue, 08 Jun 2021 15:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aZPCUvA3r/jPCBue3y5Ex4fe4jKcwZVGJEqkCPHKirc=;
        b=CAuesYg+p7rDm/QnReTz6LHgEpfMdfrHDSyqzuRxeGk7FE54lQY0rAj77BRdj44zFx
         uYE7zRbncBuIOiuLWEGuk1oToVwsadsITDFG+7rqsUQQz6nSbym9dE4rrtt8gDCOYIpk
         pTlMYBBzOPz0V7UFlAN2jB7SvvvC00p/BEKthEzMmmXhgokOKENRmE559WNAC9jSYBYN
         U1VrETgQqNZMLtrUpnDL11oGPxz8/xjgrXjHMgQ5MYctEcmsUb3pqO9r/kIzuarRXi6z
         2q7m4D1bwCjvRre4m0LbcS4Lbom+49HGhsXueFMVIomxxpvI6ecN/gjEMDgT4S+ikApb
         wmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aZPCUvA3r/jPCBue3y5Ex4fe4jKcwZVGJEqkCPHKirc=;
        b=rHqwjgAm8nLkluezbSSVCyTek3tm1IVw2WHgsgC3dfpGyrRDvKj9IjITlZDBfOzv7V
         ikghOD0MMudRfVTzR9buU7/Jd5TyVZoS54Mo0Xbh/mtrFvogl3qQYhgaLGhKyN1EPr4W
         fwXmLGkULPbtI7g3vFwUR7O3rYjOVWSnyP9qywpCuVQN2n6xrzhwJ6ZUAAcVtfe52Nkw
         BrXM5Zwx/fnRTHbmTdn7ba2PqCpOgX5h9CbiDWCv1yJrmT4j9SXiV4s1xXxr5SLKU8RQ
         6pL3aWOnW5enh0U15uxKasdJmCvKxmiLHnCYPBC94i/HJ09f3DtCd2c7o7AXlxWD09UZ
         8ALw==
X-Gm-Message-State: AOAM531Hkqtkwb8N4q+rf9CCJ2je5awAi6KNfL/Mwc9eYjk99fFjTTje
        8KooM87H8M9D491og3JKjv9Gdg==
X-Google-Smtp-Source: ABdhPJxCfAKLa7Qxaw97ETlH/kBsQIcvarxMt/W41SQCVSmbq9JTIpPrzjasFclFVJTy55HGayARkQ==
X-Received: by 2002:a05:620a:c87:: with SMTP id q7mr22756613qki.99.1623191880882;
        Tue, 08 Jun 2021 15:38:00 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id m3sm2324266qkh.135.2021.06.08.15.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 15:38:00 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 12/17] media: camss: remove some vfe ops and clean up dead vfe-170 code
Date:   Tue,  8 Jun 2021 18:35:01 -0400
Message-Id: <20210608223513.23193-13-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608223513.23193-1-jonathan@marek.ca>
References: <20210608223513.23193-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Delete vfe_isr_ops. In all cases the right function can just be called
directly.

From vfe_hw_ops:
 - enable_irq_common is completely dead
 - isr_read/violation_read dont need ops (call right function directly)
 - reg_update/reg_update_clear moved to gen1 ops, vfe-170 can call the
   right function directly

This reveals dead function in vfe-170 which are deleted. comp_done IRQ
handling is also removed for vfe-170 - only RDI is supported.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../media/platform/qcom/camss/camss-vfe-170.c | 89 ++----------------
 .../media/platform/qcom/camss/camss-vfe-4-1.c | 25 +++--
 .../media/platform/qcom/camss/camss-vfe-4-7.c | 63 ++++++-------
 .../media/platform/qcom/camss/camss-vfe-4-8.c | 65 ++++++-------
 .../platform/qcom/camss/camss-vfe-gen1.c      | 94 ++++++++++---------
 .../platform/qcom/camss/camss-vfe-gen1.h      | 39 +++++++-
 drivers/media/platform/qcom/camss/camss-vfe.c | 16 ----
 drivers/media/platform/qcom/camss/camss-vfe.h | 16 ----
 8 files changed, 169 insertions(+), 238 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
index 8594d275b41d1..1de793b218194 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
@@ -188,20 +188,6 @@ static void vfe_hw_version_read(struct vfe_device *vfe, struct device *dev)
 	dev_err(dev, "VFE HW Version = %u.%u.%u\n", gen, rev, step);
 }
 
-static inline void vfe_reg_clr(struct vfe_device *vfe, u32 reg, u32 clr_bits)
-{
-	u32 bits = readl_relaxed(vfe->base + reg);
-
-	writel_relaxed(bits & ~clr_bits, vfe->base + reg);
-}
-
-static inline void vfe_reg_set(struct vfe_device *vfe, u32 reg, u32 set_bits)
-{
-	u32 bits = readl_relaxed(vfe->base + reg);
-
-	writel_relaxed(bits | set_bits, vfe->base + reg);
-}
-
 static void vfe_global_reset(struct vfe_device *vfe)
 {
 	u32 reset_bits = GLOBAL_RESET_CMD_CORE		|
@@ -305,38 +291,16 @@ static inline void vfe_reg_update_clear(struct vfe_device *vfe,
 
 static void vfe_enable_irq_common(struct vfe_device *vfe)
 {
-	vfe_reg_set(vfe, VFE_IRQ_MASK_0, ~0u);
-	vfe_reg_set(vfe, VFE_IRQ_MASK_1, ~0u);
+	writel_relaxed(~0u, vfe->base + VFE_IRQ_MASK_0);
+	writel_relaxed(~0u, vfe->base + VFE_IRQ_MASK_1);
 
 	writel_relaxed(~0u, vfe->base + VFE_BUS_IRQ_MASK(0));
 	writel_relaxed(~0u, vfe->base + VFE_BUS_IRQ_MASK(1));
 	writel_relaxed(~0u, vfe->base + VFE_BUS_IRQ_MASK(2));
 }
 
-static void vfe_isr_halt_ack(struct vfe_device *vfe)
-{
-	complete(&vfe->halt_complete);
-}
-
-static void vfe_isr_read(struct vfe_device *vfe, u32 *status0, u32 *status1)
-{
-	*status0 = readl_relaxed(vfe->base + VFE_IRQ_STATUS_0);
-	*status1 = readl_relaxed(vfe->base + VFE_IRQ_STATUS_1);
-
-	writel_relaxed(*status0, vfe->base + VFE_IRQ_CLEAR_0);
-	writel_relaxed(*status1, vfe->base + VFE_IRQ_CLEAR_1);
-
-	/* Enforce ordering between IRQ Clear and Global IRQ Clear */
-	wmb();
-	writel_relaxed(CMD_GLOBAL_CLEAR, vfe->base + VFE_IRQ_CMD);
-}
-
-static void vfe_violation_read(struct vfe_device *vfe)
-{
-	u32 violation = readl_relaxed(vfe->base + VFE_VIOLATION_STATUS);
-
-	pr_err_ratelimited("VFE: violation = 0x%08x\n", violation);
-}
+static void vfe_isr_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id);
+static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm);
 
 /*
  * vfe_isr - VFE module interrupt handler
@@ -369,24 +333,16 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 	writel_relaxed(1, vfe->base + VFE_BUS_IRQ_CLEAR_GLOBAL);
 
 	if (status0 & STATUS_0_RESET_ACK)
-		vfe->isr_ops.reset_ack(vfe);
+		vfe_isr_reset_ack(vfe);
 
 	for (i = VFE_LINE_RDI0; i <= VFE_LINE_RDI2; i++)
 		if (status0 & STATUS_0_RDI_REG_UPDATE(i))
-			vfe->isr_ops.reg_update(vfe, i);
-
-	for (i = VFE_LINE_RDI0; i <= VFE_LINE_RDI2; i++)
-		if (status0 & STATUS_1_RDI_SOF(i))
-			vfe->isr_ops.sof(vfe, i);
-
-	for (i = 0; i < MSM_VFE_COMPOSITE_IRQ_NUM; i++)
-		if (vfe_bus_status[0] & STATUS0_COMP_BUF_DONE(i))
-			vfe->isr_ops.comp_done(vfe, i);
+			vfe_isr_reg_update(vfe, i);
 
 	for (wm = 0; wm < MSM_VFE_IMAGE_MASTERS_NUM; wm++)
 		if (status0 & BIT(9))
 			if (vfe_bus_status[1] & STATUS1_WM_CLIENT_BUF_DONE(wm))
-				vfe->isr_ops.wm_done(vfe, wm);
+				vfe_isr_wm_done(vfe, wm);
 
 	return IRQ_HANDLED;
 }
@@ -456,7 +412,6 @@ static int vfe_enable_output(struct vfe_line *line)
 {
 	struct vfe_device *vfe = to_vfe(line);
 	struct vfe_output *output = &line->output;
-	const struct vfe_hw_ops *ops = vfe->ops;
 	struct media_entity *sensor;
 	unsigned long flags;
 	unsigned int frame_skip = 0;
@@ -474,7 +429,7 @@ static int vfe_enable_output(struct vfe_line *line)
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
-	ops->reg_update_clear(vfe, line->id);
+	vfe_reg_update_clear(vfe, line->id);
 
 	if (output->state != VFE_OUTPUT_OFF) {
 		dev_err(vfe->camss->dev, "Output is not in reserved state %d\n",
@@ -501,7 +456,7 @@ static int vfe_enable_output(struct vfe_line *line)
 		vfe_wm_update(vfe, output->wm_idx[0], output->buf[i]->addr[0], line);
 	}
 
-	ops->reg_update(vfe, line->id);
+	vfe_reg_update(vfe, line->id);
 
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 
@@ -607,16 +562,6 @@ static int vfe_disable(struct vfe_line *line)
 	return 0;
 }
 
-/*
- * vfe_isr_sof - Process start of frame interrupt
- * @vfe: VFE Device
- * @line_id: VFE line
- */
-static void vfe_isr_sof(struct vfe_device *vfe, enum vfe_line_id line_id)
-{
-	/* nop */
-}
-
 /*
  * vfe_isr_reg_update - Process reg update interrupt
  * @vfe: VFE Device
@@ -628,7 +573,7 @@ static void vfe_isr_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
 	unsigned long flags;
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
-	vfe->ops->reg_update_clear(vfe, line_id);
+	vfe_reg_update_clear(vfe, line_id);
 
 	output = &vfe->line[line_id].output;
 
@@ -747,15 +692,6 @@ static int vfe_queue_buffer(struct camss_video *vid,
 	return 0;
 }
 
-static const struct vfe_isr_ops vfe_isr_ops_170 = {
-	.reset_ack = vfe_isr_reset_ack,
-	.halt_ack = vfe_isr_halt_ack,
-	.reg_update = vfe_isr_reg_update,
-	.sof = vfe_isr_sof,
-	.comp_done = vfe_isr_comp_done,
-	.wm_done = vfe_isr_wm_done,
-};
-
 static const struct camss_video_ops vfe_video_ops_170 = {
 	.queue_buffer = vfe_queue_buffer,
 	.flush_buffers = vfe_flush_buffers,
@@ -763,7 +699,6 @@ static const struct camss_video_ops vfe_video_ops_170 = {
 
 static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 {
-	vfe->isr_ops = vfe_isr_ops_170;
 	vfe->video_ops = vfe_video_ops_170;
 
 	vfe->line_num = VFE_LINE_NUM_GEN2;
@@ -772,15 +707,11 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 const struct vfe_hw_ops vfe_ops_170 = {
 	.global_reset = vfe_global_reset,
 	.hw_version_read = vfe_hw_version_read,
-	.isr_read = vfe_isr_read,
 	.isr = vfe_isr,
 	.pm_domain_off = vfe_pm_domain_off,
 	.pm_domain_on = vfe_pm_domain_on,
-	.reg_update_clear = vfe_reg_update_clear,
-	.reg_update = vfe_reg_update,
 	.subdev_init = vfe_subdev_init,
 	.vfe_disable = vfe_disable,
 	.vfe_enable = vfe_enable,
 	.vfe_halt = vfe_halt,
-	.violation_read = vfe_violation_read,
 };
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index 53c56a8d45458..873f348cf2fae 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -898,34 +898,34 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 	u32 value0, value1;
 	int i, j;
 
-	vfe->ops->isr_read(vfe, &value0, &value1);
+	vfe_isr_read(vfe, &value0, &value1);
 
 	dev_dbg(vfe->camss->dev, "VFE: status0 = 0x%08x, status1 = 0x%08x\n",
 		value0, value1);
 
 	if (value0 & VFE_0_IRQ_STATUS_0_RESET_ACK)
-		vfe->isr_ops.reset_ack(vfe);
+		vfe_isr_reset_ack(vfe);
 
 	if (value1 & VFE_0_IRQ_STATUS_1_VIOLATION)
-		vfe->ops->violation_read(vfe);
+		vfe_violation_read(vfe);
 
 	if (value1 & VFE_0_IRQ_STATUS_1_BUS_BDG_HALT_ACK)
-		vfe->isr_ops.halt_ack(vfe);
+		vfe_gen1_isr_halt_ack(vfe);
 
 	for (i = VFE_LINE_RDI0; i <= VFE_LINE_PIX; i++)
 		if (value0 & VFE_0_IRQ_STATUS_0_line_n_REG_UPDATE(i))
-			vfe->isr_ops.reg_update(vfe, i);
+			vfe_gen1_reg_update(vfe, i);
 
 	if (value0 & VFE_0_IRQ_STATUS_0_CAMIF_SOF)
-		vfe->isr_ops.sof(vfe, VFE_LINE_PIX);
+		vfe_gen1_isr_sof(vfe, VFE_LINE_PIX);
 
 	for (i = VFE_LINE_RDI0; i <= VFE_LINE_RDI2; i++)
 		if (value1 & VFE_0_IRQ_STATUS_1_RDIn_SOF(i))
-			vfe->isr_ops.sof(vfe, i);
+			vfe_gen1_isr_sof(vfe, i);
 
 	for (i = 0; i < MSM_VFE_COMPOSITE_IRQ_NUM; i++)
 		if (value0 & VFE_0_IRQ_STATUS_0_IMAGE_COMPOSITE_DONE_n(i)) {
-			vfe->isr_ops.comp_done(vfe, i);
+			vfe_gen1_isr_comp_done(vfe, i);
 			for (j = 0; j < ARRAY_SIZE(vfe->wm_output_map); j++)
 				if (vfe->wm_output_map[j] == VFE_LINE_PIX)
 					value0 &= ~VFE_0_IRQ_MASK_0_IMAGE_MASTER_n_PING_PONG(j);
@@ -933,7 +933,7 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 
 	for (i = 0; i < MSM_VFE_IMAGE_MASTERS_NUM; i++)
 		if (value0 & VFE_0_IRQ_STATUS_0_IMAGE_MASTER_n_PING_PONG(i))
-			vfe->isr_ops.wm_done(vfe, i);
+			vfe_gen1_isr_wm_done(vfe, i);
 
 	return IRQ_HANDLED;
 }
@@ -991,11 +991,12 @@ static const struct vfe_hw_ops_gen1 vfe_ops_gen1_4_1 = {
 	.wm_set_pong_addr = vfe_wm_set_pong_addr,
 	.wm_set_subsample = vfe_wm_set_subsample,
 	.wm_set_ub_cfg = vfe_wm_set_ub_cfg,
+	.reg_update_clear = vfe_reg_update_clear,
+	.reg_update = vfe_reg_update,
 };
 
 static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 {
-	vfe->isr_ops = vfe_isr_ops_gen1;
 	vfe->ops_gen1 = &vfe_ops_gen1_4_1;
 	vfe->video_ops = vfe_video_ops_gen1;
 
@@ -1005,15 +1006,11 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 const struct vfe_hw_ops vfe_ops_4_1 = {
 	.global_reset = vfe_global_reset,
 	.hw_version_read = vfe_hw_version_read,
-	.isr_read = vfe_isr_read,
 	.isr = vfe_isr,
 	.pm_domain_off = vfe_pm_domain_off,
 	.pm_domain_on = vfe_pm_domain_on,
-	.reg_update_clear = vfe_reg_update_clear,
-	.reg_update = vfe_reg_update,
 	.subdev_init = vfe_subdev_init,
 	.vfe_disable = vfe_gen1_disable,
 	.vfe_enable = vfe_gen1_enable,
 	.vfe_halt = vfe_gen1_halt,
-	.violation_read = vfe_violation_read,
 };
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index a596352177583..35178f66360eb 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -1037,7 +1037,25 @@ static int vfe_camif_wait_for_stop(struct vfe_device *vfe, struct device *dev)
 	return ret;
 }
 
+static void vfe_isr_read(struct vfe_device *vfe, u32 *value0, u32 *value1)
+{
+	*value0 = readl_relaxed(vfe->base + VFE_0_IRQ_STATUS_0);
+	*value1 = readl_relaxed(vfe->base + VFE_0_IRQ_STATUS_1);
 
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
 
 /*
  * vfe_isr - VFE module interrupt handler
@@ -1052,34 +1070,34 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 	u32 value0, value1;
 	int i, j;
 
-	vfe->ops->isr_read(vfe, &value0, &value1);
+	vfe_isr_read(vfe, &value0, &value1);
 
 	dev_dbg(vfe->camss->dev, "VFE: status0 = 0x%08x, status1 = 0x%08x\n",
 		value0, value1);
 
 	if (value0 & VFE_0_IRQ_STATUS_0_RESET_ACK)
-		vfe->isr_ops.reset_ack(vfe);
+		vfe_isr_reset_ack(vfe);
 
 	if (value1 & VFE_0_IRQ_STATUS_1_VIOLATION)
-		vfe->ops->violation_read(vfe);
+		vfe_violation_read(vfe);
 
 	if (value1 & VFE_0_IRQ_STATUS_1_BUS_BDG_HALT_ACK)
-		vfe->isr_ops.halt_ack(vfe);
+		vfe_gen1_isr_halt_ack(vfe);
 
 	for (i = VFE_LINE_RDI0; i < vfe->line_num; i++)
 		if (value0 & VFE_0_IRQ_STATUS_0_line_n_REG_UPDATE(i))
-			vfe->isr_ops.reg_update(vfe, i);
+			vfe_gen1_reg_update(vfe, i);
 
 	if (value0 & VFE_0_IRQ_STATUS_0_CAMIF_SOF)
-		vfe->isr_ops.sof(vfe, VFE_LINE_PIX);
+		vfe_gen1_isr_sof(vfe, VFE_LINE_PIX);
 
 	for (i = VFE_LINE_RDI0; i <= VFE_LINE_RDI2; i++)
 		if (value1 & VFE_0_IRQ_STATUS_1_RDIn_SOF(i))
-			vfe->isr_ops.sof(vfe, i);
+			vfe_gen1_isr_sof(vfe, i);
 
 	for (i = 0; i < MSM_VFE_COMPOSITE_IRQ_NUM; i++)
 		if (value0 & VFE_0_IRQ_STATUS_0_IMAGE_COMPOSITE_DONE_n(i)) {
-			vfe->isr_ops.comp_done(vfe, i);
+			vfe_gen1_isr_comp_done(vfe, i);
 			for (j = 0; j < ARRAY_SIZE(vfe->wm_output_map); j++)
 				if (vfe->wm_output_map[j] == VFE_LINE_PIX)
 					value0 &= ~VFE_0_IRQ_MASK_0_IMAGE_MASTER_n_PING_PONG(j);
@@ -1087,24 +1105,11 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 
 	for (i = 0; i < MSM_VFE_IMAGE_MASTERS_NUM; i++)
 		if (value0 & VFE_0_IRQ_STATUS_0_IMAGE_MASTER_n_PING_PONG(i))
-			vfe->isr_ops.wm_done(vfe, i);
+			vfe_gen1_isr_wm_done(vfe, i);
 
 	return IRQ_HANDLED;
 }
 
-static void vfe_isr_read(struct vfe_device *vfe, u32 *value0, u32 *value1)
-{
-	*value0 = readl_relaxed(vfe->base + VFE_0_IRQ_STATUS_0);
-	*value1 = readl_relaxed(vfe->base + VFE_0_IRQ_STATUS_1);
-
-	writel_relaxed(*value0, vfe->base + VFE_0_IRQ_CLEAR_0);
-	writel_relaxed(*value1, vfe->base + VFE_0_IRQ_CLEAR_1);
-
-	/* Enforce barrier between local & global IRQ clear */
-	wmb();
-	writel_relaxed(VFE_0_IRQ_CMD_GLOBAL_CLEAR, vfe->base + VFE_0_IRQ_CMD);
-}
-
 /*
  * vfe_pm_domain_off - Disable power domains specific to this VFE.
  * @vfe: VFE Device
@@ -1141,13 +1146,6 @@ static int vfe_pm_domain_on(struct vfe_device *vfe)
 	return 0;
 }
 
-static void vfe_violation_read(struct vfe_device *vfe)
-{
-	u32 violation = readl_relaxed(vfe->base + VFE_0_VIOLATION_STATUS);
-
-	pr_err_ratelimited("VFE: violation = 0x%08x\n", violation);
-}
-
 static const struct vfe_hw_ops_gen1 vfe_ops_gen1_4_7 = {
 	.bus_connect_wm_to_rdi = vfe_bus_connect_wm_to_rdi,
 	.bus_disconnect_wm_from_rdi = vfe_bus_disconnect_wm_from_rdi,
@@ -1183,11 +1181,12 @@ static const struct vfe_hw_ops_gen1 vfe_ops_gen1_4_7 = {
 	.wm_set_pong_addr = vfe_wm_set_pong_addr,
 	.wm_set_subsample = vfe_wm_set_subsample,
 	.wm_set_ub_cfg = vfe_wm_set_ub_cfg,
+	.reg_update_clear = vfe_reg_update_clear,
+	.reg_update = vfe_reg_update,
 };
 
 static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 {
-	vfe->isr_ops = vfe_isr_ops_gen1;
 	vfe->ops_gen1 = &vfe_ops_gen1_4_7;
 	vfe->video_ops = vfe_video_ops_gen1;
 
@@ -1197,15 +1196,11 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 const struct vfe_hw_ops vfe_ops_4_7 = {
 	.global_reset = vfe_global_reset,
 	.hw_version_read = vfe_hw_version_read,
-	.isr_read = vfe_isr_read,
 	.isr = vfe_isr,
 	.pm_domain_off = vfe_pm_domain_off,
 	.pm_domain_on = vfe_pm_domain_on,
-	.reg_update_clear = vfe_reg_update_clear,
-	.reg_update = vfe_reg_update,
 	.subdev_init = vfe_subdev_init,
 	.vfe_disable = vfe_gen1_disable,
 	.vfe_enable = vfe_gen1_enable,
 	.vfe_halt = vfe_gen1_halt,
-	.violation_read = vfe_violation_read,
 };
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
index 998429dbb65cd..d4ddbbf44f514 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
@@ -968,6 +968,26 @@ static int vfe_camif_wait_for_stop(struct vfe_device *vfe, struct device *dev)
 	return ret;
 }
 
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
 /*
  * vfe_isr - VFE module interrupt handler
  * @irq: Interrupt line
@@ -981,34 +1001,34 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 	u32 value0, value1;
 	int i, j;
 
-	vfe->ops->isr_read(vfe, &value0, &value1);
+	vfe_isr_read(vfe, &value0, &value1);
 
 	dev_dbg(vfe->camss->dev, "VFE: status0 = 0x%08x, status1 = 0x%08x\n",
 		value0, value1);
 
 	if (value0 & VFE_0_IRQ_STATUS_0_RESET_ACK)
-		vfe->isr_ops.reset_ack(vfe);
+		vfe_isr_reset_ack(vfe);
 
 	if (value1 & VFE_0_IRQ_STATUS_1_VIOLATION)
-		vfe->ops->violation_read(vfe);
+		vfe_violation_read(vfe);
 
 	if (value1 & VFE_0_IRQ_STATUS_1_BUS_BDG_HALT_ACK)
-		vfe->isr_ops.halt_ack(vfe);
+		vfe_gen1_isr_halt_ack(vfe);
 
 	for (i = VFE_LINE_RDI0; i < vfe->line_num; i++)
 		if (value0 & VFE_0_IRQ_STATUS_0_line_n_REG_UPDATE(i))
-			vfe->isr_ops.reg_update(vfe, i);
+			vfe_gen1_reg_update(vfe, i);
 
 	if (value0 & VFE_0_IRQ_STATUS_0_CAMIF_SOF)
-		vfe->isr_ops.sof(vfe, VFE_LINE_PIX);
+		vfe_gen1_isr_sof(vfe, VFE_LINE_PIX);
 
 	for (i = VFE_LINE_RDI0; i <= VFE_LINE_RDI2; i++)
 		if (value1 & VFE_0_IRQ_STATUS_1_RDIn_SOF(i))
-			vfe->isr_ops.sof(vfe, i);
+			vfe_gen1_isr_sof(vfe, i);
 
 	for (i = 0; i < MSM_VFE_COMPOSITE_IRQ_NUM; i++)
 		if (value0 & VFE_0_IRQ_STATUS_0_IMAGE_COMPOSITE_DONE_n(i)) {
-			vfe->isr_ops.comp_done(vfe, i);
+			vfe_gen1_isr_comp_done(vfe, i);
 			for (j = 0; j < ARRAY_SIZE(vfe->wm_output_map); j++)
 				if (vfe->wm_output_map[j] == VFE_LINE_PIX)
 					value0 &= ~VFE_0_IRQ_MASK_0_IMAGE_MASTER_n_PING_PONG(j);
@@ -1016,7 +1036,7 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 
 	for (i = 0; i < MSM_VFE_IMAGE_MASTERS_NUM; i++)
 		if (value0 & VFE_0_IRQ_STATUS_0_IMAGE_MASTER_n_PING_PONG(i))
-			vfe->isr_ops.wm_done(vfe, i);
+			vfe_gen1_isr_wm_done(vfe, i);
 
 	return IRQ_HANDLED;
 }
@@ -1081,19 +1101,6 @@ static void vfe_set_ds(struct vfe_device *vfe)
 	writel_relaxed(val16, vfe->base + VFE_0_BUS_BDG_DS_CFG_16);
 }
 
-static void vfe_isr_read(struct vfe_device *vfe, u32 *value0, u32 *value1)
-{
-	*value0 = readl_relaxed(vfe->base + VFE_0_IRQ_STATUS_0);
-	*value1 = readl_relaxed(vfe->base + VFE_0_IRQ_STATUS_1);
-
-	writel_relaxed(*value0, vfe->base + VFE_0_IRQ_CLEAR_0);
-	writel_relaxed(*value1, vfe->base + VFE_0_IRQ_CLEAR_1);
-
-	/* Enforce barrier between local & global IRQ clear */
-	wmb();
-	writel_relaxed(VFE_0_IRQ_CMD_GLOBAL_CLEAR, vfe->base + VFE_0_IRQ_CMD);
-}
-
 /*
  * vfe_pm_domain_off - Disable power domains specific to this VFE.
  * @vfe: VFE Device
@@ -1125,13 +1132,6 @@ static int vfe_pm_domain_on(struct vfe_device *vfe)
 	return 0;
 }
 
-static void vfe_violation_read(struct vfe_device *vfe)
-{
-	u32 violation = readl_relaxed(vfe->base + VFE_0_VIOLATION_STATUS);
-
-	pr_err_ratelimited("VFE: violation = 0x%08x\n", violation);
-}
-
 static const struct vfe_hw_ops_gen1 vfe_ops_gen1_4_8 = {
 	.bus_connect_wm_to_rdi = vfe_bus_connect_wm_to_rdi,
 	.bus_disconnect_wm_from_rdi = vfe_bus_disconnect_wm_from_rdi,
@@ -1167,11 +1167,12 @@ static const struct vfe_hw_ops_gen1 vfe_ops_gen1_4_8 = {
 	.wm_set_pong_addr = vfe_wm_set_pong_addr,
 	.wm_set_subsample = vfe_wm_set_subsample,
 	.wm_set_ub_cfg = vfe_wm_set_ub_cfg,
+	.reg_update_clear = vfe_reg_update_clear,
+	.reg_update = vfe_reg_update,
 };
 
 static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 {
-	vfe->isr_ops = vfe_isr_ops_gen1;
 	vfe->ops_gen1 = &vfe_ops_gen1_4_8;
 	vfe->video_ops = vfe_video_ops_gen1;
 
@@ -1181,15 +1182,11 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 const struct vfe_hw_ops vfe_ops_4_8 = {
 	.global_reset = vfe_global_reset,
 	.hw_version_read = vfe_hw_version_read,
-	.isr_read = vfe_isr_read,
 	.isr = vfe_isr,
 	.pm_domain_off = vfe_pm_domain_off,
 	.pm_domain_on = vfe_pm_domain_on,
-	.reg_update_clear = vfe_reg_update_clear,
-	.reg_update = vfe_reg_update,
 	.subdev_init = vfe_subdev_init,
 	.vfe_disable = vfe_gen1_disable,
 	.vfe_enable = vfe_gen1_enable,
 	.vfe_halt = vfe_gen1_halt,
-	.violation_read = vfe_violation_read,
 };
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
index 4fd265d018834..2c0cd14bbdf8e 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen1.c
@@ -37,7 +37,6 @@ static int vfe_disable_output(struct vfe_line *line)
 {
 	struct vfe_device *vfe = to_vfe(line);
 	struct vfe_output *output = &line->output;
-	const struct vfe_hw_ops *ops = vfe->ops;
 	unsigned long flags;
 	unsigned long time;
 	unsigned int i;
@@ -55,7 +54,7 @@ static int vfe_disable_output(struct vfe_line *line)
 	for (i = 0; i < output->wm_num; i++)
 		vfe->ops_gen1->wm_enable(vfe, output->wm_idx[i], 0);
 
-	ops->reg_update(vfe, line->id);
+	vfe->ops_gen1->reg_update(vfe, line->id);
 	output->wait_reg_update = 1;
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 
@@ -162,21 +161,21 @@ static void vfe_output_frame_drop(struct vfe_device *vfe,
 		vfe->ops_gen1->wm_set_framedrop_pattern(vfe, output->wm_idx[i], drop_pattern);
 	}
 
-	vfe->ops->reg_update(vfe, container_of(output, struct vfe_line, output)->id);
+	vfe->ops_gen1->reg_update(vfe, container_of(output, struct vfe_line, output)->id);
 }
 
 static int vfe_enable_output(struct vfe_line *line)
 {
 	struct vfe_device *vfe = to_vfe(line);
 	struct vfe_output *output = &line->output;
-	const struct vfe_hw_ops *ops = vfe->ops;
+	const struct vfe_hw_ops_gen1 *ops = vfe->ops_gen1;
 	struct media_entity *sensor;
 	unsigned long flags;
 	unsigned int frame_skip = 0;
 	unsigned int i;
 	u16 ub_size;
 
-	ub_size = vfe->ops_gen1->get_ub_size(vfe->id);
+	ub_size = ops->get_ub_size(vfe->id);
 	if (!ub_size)
 		return -EINVAL;
 
@@ -236,38 +235,38 @@ static int vfe_enable_output(struct vfe_line *line)
 	vfe_output_init_addrs(vfe, output, 0, line);
 
 	if (line->id != VFE_LINE_PIX) {
-		vfe->ops_gen1->set_cgc_override(vfe, output->wm_idx[0], 1);
-		vfe->ops_gen1->enable_irq_wm_line(vfe, output->wm_idx[0], line->id, 1);
-		vfe->ops_gen1->bus_connect_wm_to_rdi(vfe, output->wm_idx[0], line->id);
-		vfe->ops_gen1->wm_set_subsample(vfe, output->wm_idx[0]);
-		vfe->ops_gen1->set_rdi_cid(vfe, line->id, 0);
-		vfe->ops_gen1->wm_set_ub_cfg(vfe, output->wm_idx[0],
+		ops->set_cgc_override(vfe, output->wm_idx[0], 1);
+		ops->enable_irq_wm_line(vfe, output->wm_idx[0], line->id, 1);
+		ops->bus_connect_wm_to_rdi(vfe, output->wm_idx[0], line->id);
+		ops->wm_set_subsample(vfe, output->wm_idx[0]);
+		ops->set_rdi_cid(vfe, line->id, 0);
+		ops->wm_set_ub_cfg(vfe, output->wm_idx[0],
 					    (ub_size + 1) * output->wm_idx[0], ub_size);
-		vfe->ops_gen1->wm_frame_based(vfe, output->wm_idx[0], 1);
-		vfe->ops_gen1->wm_enable(vfe, output->wm_idx[0], 1);
-		vfe->ops_gen1->bus_reload_wm(vfe, output->wm_idx[0]);
+		ops->wm_frame_based(vfe, output->wm_idx[0], 1);
+		ops->wm_enable(vfe, output->wm_idx[0], 1);
+		ops->bus_reload_wm(vfe, output->wm_idx[0]);
 	} else {
 		ub_size /= output->wm_num;
 		for (i = 0; i < output->wm_num; i++) {
-			vfe->ops_gen1->set_cgc_override(vfe, output->wm_idx[i], 1);
-			vfe->ops_gen1->wm_set_subsample(vfe, output->wm_idx[i]);
-			vfe->ops_gen1->wm_set_ub_cfg(vfe, output->wm_idx[i],
+			ops->set_cgc_override(vfe, output->wm_idx[i], 1);
+			ops->wm_set_subsample(vfe, output->wm_idx[i]);
+			ops->wm_set_ub_cfg(vfe, output->wm_idx[i],
 						     (ub_size + 1) * output->wm_idx[i], ub_size);
-			vfe->ops_gen1->wm_line_based(vfe, output->wm_idx[i],
+			ops->wm_line_based(vfe, output->wm_idx[i],
 						     &line->video_out.active_fmt.fmt.pix_mp, i, 1);
-			vfe->ops_gen1->wm_enable(vfe, output->wm_idx[i], 1);
-			vfe->ops_gen1->bus_reload_wm(vfe, output->wm_idx[i]);
+			ops->wm_enable(vfe, output->wm_idx[i], 1);
+			ops->bus_reload_wm(vfe, output->wm_idx[i]);
 		}
-		vfe->ops_gen1->enable_irq_pix_line(vfe, 0, line->id, 1);
-		vfe->ops_gen1->set_module_cfg(vfe, 1);
-		vfe->ops_gen1->set_camif_cfg(vfe, line);
-		vfe->ops_gen1->set_realign_cfg(vfe, line, 1);
-		vfe->ops_gen1->set_xbar_cfg(vfe, output, 1);
-		vfe->ops_gen1->set_demux_cfg(vfe, line);
-		vfe->ops_gen1->set_scale_cfg(vfe, line);
-		vfe->ops_gen1->set_crop_cfg(vfe, line);
-		vfe->ops_gen1->set_clamp_cfg(vfe);
-		vfe->ops_gen1->set_camif_cmd(vfe, 1);
+		ops->enable_irq_pix_line(vfe, 0, line->id, 1);
+		ops->set_module_cfg(vfe, 1);
+		ops->set_camif_cfg(vfe, line);
+		ops->set_realign_cfg(vfe, line, 1);
+		ops->set_xbar_cfg(vfe, output, 1);
+		ops->set_demux_cfg(vfe, line);
+		ops->set_scale_cfg(vfe, line);
+		ops->set_crop_cfg(vfe, line);
+		ops->set_clamp_cfg(vfe);
+		ops->set_camif_cmd(vfe, 1);
 	}
 
 	ops->reg_update(vfe, line->id);
@@ -508,7 +507,7 @@ static void vfe_buf_update_wm_on_new(struct vfe_device *vfe,
  * vfe_isr_halt_ack - Process halt ack
  * @vfe: VFE Device
  */
-static void vfe_isr_halt_ack(struct vfe_device *vfe)
+void vfe_gen1_isr_halt_ack(struct vfe_device *vfe)
 {
 	complete(&vfe->halt_complete);
 	vfe->ops_gen1->halt_clear(vfe);
@@ -519,7 +518,7 @@ static void vfe_isr_halt_ack(struct vfe_device *vfe)
  * @vfe: VFE Device
  * @line_id: VFE line
  */
-static void vfe_isr_sof(struct vfe_device *vfe, enum vfe_line_id line_id)
+void vfe_gen1_isr_sof(struct vfe_device *vfe, enum vfe_line_id line_id)
 {
 	struct vfe_output *output;
 	unsigned long flags;
@@ -538,14 +537,14 @@ static void vfe_isr_sof(struct vfe_device *vfe, enum vfe_line_id line_id)
  * @vfe: VFE Device
  * @line_id: VFE line
  */
-static void vfe_isr_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
+void vfe_gen1_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
 {
 	struct vfe_output *output;
 	struct vfe_line *line = &vfe->line[line_id];
 	unsigned long flags;
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
-	vfe->ops->reg_update_clear(vfe, line_id);
+	vfe->ops_gen1->reg_update_clear(vfe, line_id);
 
 	output = &line->output;
 
@@ -605,7 +604,7 @@ static void vfe_isr_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
  * @vfe: VFE Device
  * @wm: Write master id
  */
-static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
+void vfe_gen1_isr_wm_done(struct vfe_device *vfe, u8 wm)
 {
 	struct camss_buffer *ready_buf;
 	struct vfe_output *output;
@@ -675,6 +674,22 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 }
 
+/**
+ * vfe_isr_comp_done() - Process composite image done interrupt
+ * @vfe: VFE Device
+ * @comp: Composite image id
+ */
+void vfe_gen1_isr_comp_done(struct vfe_device *vfe, u8 comp)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(vfe->wm_output_map); i++)
+		if (vfe->wm_output_map[i] == VFE_LINE_PIX) {
+			vfe_gen1_isr_wm_done(vfe, i);
+			break;
+		}
+}
+
 /*
  * vfe_queue_buffer - Add empty buffer
  * @vid: Video device structure
@@ -727,15 +742,6 @@ int vfe_word_per_line(u32 format, u32 width)
 	return val;
 }
 
-const struct vfe_isr_ops vfe_isr_ops_gen1 = {
-	.reset_ack = vfe_isr_reset_ack,
-	.halt_ack = vfe_isr_halt_ack,
-	.reg_update = vfe_isr_reg_update,
-	.sof = vfe_isr_sof,
-	.comp_done = vfe_isr_comp_done,
-	.wm_done = vfe_isr_wm_done,
-};
-
 const struct camss_video_ops vfe_video_ops_gen1 = {
 	.queue_buffer = vfe_queue_buffer,
 	.flush_buffers = vfe_flush_buffers,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen1.h b/drivers/media/platform/qcom/camss/camss-vfe-gen1.h
index 6d5f9656562c8..2619df66aa713 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen1.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen1.h
@@ -55,6 +55,9 @@ struct vfe_hw_ops_gen1 {
 	void (*wm_set_pong_addr)(struct vfe_device *vfe, u8 wm, u32 addr);
 	int (*wm_get_ping_pong_status)(struct vfe_device *vfe, u8 wm);
 	void (*wm_enable)(struct vfe_device *vfe, u8 wm, u8 enable);
+	void (*reg_update)(struct vfe_device *vfe, enum vfe_line_id line_id);
+	void (*reg_update_clear)(struct vfe_device *vfe,
+				 enum vfe_line_id line_id);
 };
 
 /*
@@ -95,13 +98,47 @@ int vfe_gen1_disable(struct vfe_line *line);
 int vfe_gen1_enable(struct vfe_line *line);
 
 /*
- * vfe_gen1_enable - Halt VFE module
+ * vfe_gen1_halt - Halt VFE module
  * @vfe: VFE device
  *
  * Return 0 on success
  */
 int vfe_gen1_halt(struct vfe_device *vfe);
 
+/*
+ * vfe_gen1_isr_halt_ack - Process halt ack
+ * @vfe: VFE Device
+ */
+void vfe_gen1_isr_halt_ack(struct vfe_device *vfe);
+
+/*
+ * vfe_gen1_isr_sof - Process start of frame interrupt
+ * @vfe: VFE Device
+ * @line_id: VFE line
+ */
+void vfe_gen1_isr_sof(struct vfe_device *vfe, enum vfe_line_id line_id);
+
+/*
+ * vfe_gen1_reg_update - Process reg update interrupt
+ * @vfe: VFE Device
+ * @line_id: VFE line
+ */
+void vfe_gen1_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id);
+
+/*
+ * vfe_gen1_isr_wm_done - Process write master done interrupt
+ * @vfe: VFE Device
+ * @wm: Write master id
+ */
+void vfe_gen1_isr_wm_done(struct vfe_device *vfe, u8 wm);
+
+/**
+ * vfe_gen1_isr_comp_done() - Process composite image done interrupt
+ * @vfe: VFE Device
+ * @comp: Composite image id
+ */
+void vfe_gen1_isr_comp_done(struct vfe_device *vfe, u8 comp);
+
 /*
  * vfe_word_per_line - Calculate number of words per frame width
  * @format: V4L2 format
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index dec89079c6ae4..3e467034710b9 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -405,22 +405,6 @@ int vfe_put_output(struct vfe_line *line)
 	return 0;
 }
 
-/**
- * vfe_isr_comp_done() - Process composite image done interrupt
- * @vfe: VFE Device
- * @comp: Composite image id
- */
-void vfe_isr_comp_done(struct vfe_device *vfe, u8 comp)
-{
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(vfe->wm_output_map); i++)
-		if (vfe->wm_output_map[i] == VFE_LINE_PIX) {
-			vfe->isr_ops.wm_done(vfe, i);
-			break;
-		}
-}
-
 void vfe_isr_reset_ack(struct vfe_device *vfe)
 {
 	complete(&vfe->reset_complete);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 844b9275031d9..97a1361996308 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -101,30 +101,15 @@ struct vfe_line {
 struct vfe_device;
 
 struct vfe_hw_ops {
-	void (*enable_irq_common)(struct vfe_device *vfe);
 	void (*global_reset)(struct vfe_device *vfe);
 	void (*hw_version_read)(struct vfe_device *vfe, struct device *dev);
 	irqreturn_t (*isr)(int irq, void *dev);
-	void (*isr_read)(struct vfe_device *vfe, u32 *value0, u32 *value1);
 	void (*pm_domain_off)(struct vfe_device *vfe);
 	int (*pm_domain_on)(struct vfe_device *vfe);
-	void (*reg_update)(struct vfe_device *vfe, enum vfe_line_id line_id);
-	void (*reg_update_clear)(struct vfe_device *vfe,
-				 enum vfe_line_id line_id);
 	void (*subdev_init)(struct device *dev, struct vfe_device *vfe);
 	int (*vfe_disable)(struct vfe_line *line);
 	int (*vfe_enable)(struct vfe_line *line);
 	int (*vfe_halt)(struct vfe_device *vfe);
-	void (*violation_read)(struct vfe_device *vfe);
-};
-
-struct vfe_isr_ops {
-	void (*reset_ack)(struct vfe_device *vfe);
-	void (*halt_ack)(struct vfe_device *vfe);
-	void (*reg_update)(struct vfe_device *vfe, enum vfe_line_id line_id);
-	void (*sof)(struct vfe_device *vfe, enum vfe_line_id line_id);
-	void (*comp_done)(struct vfe_device *vfe, u8 comp);
-	void (*wm_done)(struct vfe_device *vfe, u8 wm);
 };
 
 struct vfe_device {
@@ -149,7 +134,6 @@ struct vfe_device {
 	u8 was_streaming;
 	const struct vfe_hw_ops *ops;
 	const struct vfe_hw_ops_gen1 *ops_gen1;
-	struct vfe_isr_ops isr_ops;
 	struct camss_video_ops video_ops;
 };
 
-- 
2.26.1

