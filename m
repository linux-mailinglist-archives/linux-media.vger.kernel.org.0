Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8148D291784
	for <lists+linux-media@lfdr.de>; Sun, 18 Oct 2020 14:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726848AbgJRMyL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Oct 2020 08:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgJRMwp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Oct 2020 08:52:45 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51FBBC061755;
        Sun, 18 Oct 2020 05:52:45 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id h7so8409167wre.4;
        Sun, 18 Oct 2020 05:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J6UnJQ1CxcfHuU9cOkGzuesSKZTzK3ffJr7uWrH3m+k=;
        b=PEZ5R5uzXg9pZzWXHe6bfWGK/ysFGxxzQZ9D5KUWQpuSdvky5Bvo55KAj0GtS5nw6d
         qbVZdwePrDPJxhZJO7B2wL/p7NFh7T6gR8dZdAMmkFM/6O5jqbEoIs7+mywKAk44hoNO
         eZfODbYV2CmR5b+0hNYGW8ZvzAUter3zdAqVAFr1v1jOKpm8cBWFkGlld380w+tp0G7t
         i1jM5JLVlLSfC7rsFZfNe0T/CsRxaUa8NqX8U/oy94o72SWOr8r7GEm8J9PsIw/QQMDd
         tfe2MedcZrA6bSZjUyLKs987A5O1D/QMJJ9aHCGalQ+4MLoZKLMRP7gZYqdP0RXwmbTs
         2Ekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J6UnJQ1CxcfHuU9cOkGzuesSKZTzK3ffJr7uWrH3m+k=;
        b=WT18mgs5EYmk7P59D9OSctutRU7nCclZsF1vNWax1qNH0Hdc45AWKQZosj6Ye1JJkz
         CeSwHjK3ze4m+yqT6nJVPBV8H/PY+bl7y+RtXcq2PW7rUQJ2Ub8oJMl84Em3OFn2+Q4p
         rqivRZIdjjE34lpj7rCLl6T3lzdbTHWt1JNHwK+lkupWO4odFROu1kFplIPi9UG2Z7rZ
         OQ0CKF2DfaU6kh6ijQU7EuVcisqIaU8JTfQloO1fw0YKiRKBexGLVosQnXEPreVPyz0E
         szKnDD1swjGoUAZoI35ahhqA/Acskphwih3yuQO4dnA3f4+mKL3c7MI60O+BRNuWas8z
         PLpw==
X-Gm-Message-State: AOAM530VriB1oY9aHtveTXmyQwJzwEDL+inKmIHoPyvMNc3m1EgCr81d
        teMHRv9ZGIuAAN9ZuiFc5Kc=
X-Google-Smtp-Source: ABdhPJzzh/tY0L3moqsPVsm/2Xn83c+k0152Alk+8natMBEmbJxiX5Fwk1Bw7ZF0ZL44UfSACjdPVA==
X-Received: by 2002:adf:ec0e:: with SMTP id x14mr15988593wrn.204.1603025563900;
        Sun, 18 Oct 2020 05:52:43 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id u2sm11940158wme.1.2020.10.18.05.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:52:43 -0700 (PDT)
From:   kholk11@gmail.com
To:     todor.too@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH 3/6] media: camss: vfe: Add support for VFE 4.8
Date:   Sun, 18 Oct 2020 14:52:34 +0200
Message-Id: <20201018125237.16717-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201018125237.16717-1-kholk11@gmail.com>
References: <20201018125237.16717-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Add the support for VFE 4.8 in the camss-vfe-4-7 driver, as this one
really is a minor revision, requiring the very same management and
basically having the same register layout as VFE 4.7, but needing
a different QoS and DS configuration, using a different register to
enable the wm and habing the same UB size for both instances (instead
of a different size between instance 0 and 1).

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 .../media/platform/qcom/camss/camss-vfe-4-7.c | 129 ++++++++++++++++--
 drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
 2 files changed, 122 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index 0dca8bf9281e..e48d58a4a9d1 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -133,6 +133,11 @@
 #define VFE_0_BUS_BDG_QOS_CFG_7		0x420
 #define VFE_0_BUS_BDG_QOS_CFG_7_CFG	0x0001aaa9
 
+#define VFE48_0_BUS_BDG_QOS_CFG_0_CFG	0xaaa5aaa5
+#define VFE48_0_BUS_BDG_QOS_CFG_3_CFG	0xaa55aaa5
+#define VFE48_0_BUS_BDG_QOS_CFG_4_CFG	0xaa55aa55
+#define VFE48_0_BUS_BDG_QOS_CFG_7_CFG	0x0005aa55
+
 #define VFE_0_BUS_BDG_DS_CFG_0		0x424
 #define VFE_0_BUS_BDG_DS_CFG_0_CFG	0xcccc0011
 #define VFE_0_BUS_BDG_DS_CFG_1		0x428
@@ -153,6 +158,9 @@
 #define VFE_0_BUS_BDG_DS_CFG_16		0x464
 #define VFE_0_BUS_BDG_DS_CFG_16_CFG	0x40000103
 
+#define VFE48_0_BUS_BDG_DS_CFG_0_CFG	0xcccc1111
+#define VFE48_0_BUS_BDG_DS_CFG_16_CFG	0x00000110
+
 #define VFE_0_RDI_CFG_x(x)		(0x46c + (0x4 * (x)))
 #define VFE_0_RDI_CFG_x_RDI_STREAM_SEL_SHIFT	28
 #define VFE_0_RDI_CFG_x_RDI_STREAM_SEL_MASK	(0xf << 28)
@@ -231,6 +239,9 @@
 #define VFE_0_REALIGN_BUF_CFG_CR_ODD_PIXEL     BIT(3)
 #define VFE_0_REALIGN_BUF_CFG_HSUB_ENABLE      BIT(4)
 
+#define VFE48_0_BUS_IMAGE_MASTER_CMD		0xcec
+#define VFE48_0_BUS_IMAGE_MASTER_n_SHIFT(x)	(2 * (x))
+
 #define CAMIF_TIMEOUT_SLEEP_US 1000
 #define CAMIF_TIMEOUT_ALL_US 1000000
 
@@ -246,7 +257,7 @@ static void vfe_hw_version_read(struct vfe_device *vfe, struct device *dev)
 	dev_err(dev, "VFE HW Version = 0x%08x\n", hw_version);
 }
 
-static u16 vfe_get_ub_size(u8 vfe_id)
+static u16 vfe47_get_ub_size(u8 vfe_id)
 {
 	if (vfe_id == 0)
 		return MSM_VFE_VFE0_UB_SIZE_RDI;
@@ -299,7 +310,7 @@ static void vfe_halt_clear(struct vfe_device *vfe)
 	writel_relaxed(0x0, vfe->base + VFE_0_BUS_BDG_CMD);
 }
 
-static void vfe_wm_enable(struct vfe_device *vfe, u8 wm, u8 enable)
+static void vfe47_wm_enable(struct vfe_device *vfe, u8 wm, u8 enable)
 {
 	if (enable)
 		vfe_reg_set(vfe, VFE_0_BUS_IMAGE_MASTER_n_WR_CFG(wm),
@@ -883,7 +894,7 @@ static void vfe_set_clamp_cfg(struct vfe_device *vfe)
 	writel_relaxed(val, vfe->base + VFE_0_CLAMP_ENC_MIN_CFG);
 }
 
-static void vfe_set_qos(struct vfe_device *vfe)
+static void vfe47_set_qos(struct vfe_device *vfe)
 {
 	u32 val = VFE_0_BUS_BDG_QOS_CFG_0_CFG;
 	u32 val7 = VFE_0_BUS_BDG_QOS_CFG_7_CFG;
@@ -898,7 +909,7 @@ static void vfe_set_qos(struct vfe_device *vfe)
 	writel_relaxed(val7, vfe->base + VFE_0_BUS_BDG_QOS_CFG_7);
 }
 
-static void vfe_set_ds(struct vfe_device *vfe)
+static void vfe47_set_ds(struct vfe_device *vfe)
 {
 	u32 val = VFE_0_BUS_BDG_DS_CFG_0_CFG;
 	u32 val16 = VFE_0_BUS_BDG_DS_CFG_16_CFG;
@@ -1098,11 +1109,113 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 
 const struct vfe_hw_ops vfe_ops_4_7 = {
 	.hw_version_read = vfe_hw_version_read,
-	.get_ub_size = vfe_get_ub_size,
+	.get_ub_size = vfe47_get_ub_size,
+	.global_reset = vfe_global_reset,
+	.halt_request = vfe_halt_request,
+	.halt_clear = vfe_halt_clear,
+	.wm_enable = vfe47_wm_enable,
+	.wm_frame_based = vfe_wm_frame_based,
+	.wm_line_based = vfe_wm_line_based,
+	.wm_set_framedrop_period = vfe_wm_set_framedrop_period,
+	.wm_set_framedrop_pattern = vfe_wm_set_framedrop_pattern,
+	.wm_set_ub_cfg = vfe_wm_set_ub_cfg,
+	.bus_reload_wm = vfe_bus_reload_wm,
+	.wm_set_ping_addr = vfe_wm_set_ping_addr,
+	.wm_set_pong_addr = vfe_wm_set_pong_addr,
+	.wm_get_ping_pong_status = vfe_wm_get_ping_pong_status,
+	.bus_enable_wr_if = vfe_bus_enable_wr_if,
+	.bus_connect_wm_to_rdi = vfe_bus_connect_wm_to_rdi,
+	.wm_set_subsample = vfe_wm_set_subsample,
+	.bus_disconnect_wm_from_rdi = vfe_bus_disconnect_wm_from_rdi,
+	.set_xbar_cfg = vfe_set_xbar_cfg,
+	.set_realign_cfg = vfe_set_realign_cfg,
+	.set_rdi_cid = vfe_set_rdi_cid,
+	.reg_update = vfe_reg_update,
+	.reg_update_clear = vfe_reg_update_clear,
+	.enable_irq_wm_line = vfe_enable_irq_wm_line,
+	.enable_irq_pix_line = vfe_enable_irq_pix_line,
+	.enable_irq_common = vfe_enable_irq_common,
+	.set_demux_cfg = vfe_set_demux_cfg,
+	.set_scale_cfg = vfe_set_scale_cfg,
+	.set_crop_cfg = vfe_set_crop_cfg,
+	.set_clamp_cfg = vfe_set_clamp_cfg,
+	.set_qos = vfe47_set_qos,
+	.set_ds = vfe47_set_ds,
+	.set_cgc_override = vfe_set_cgc_override,
+	.set_camif_cfg = vfe_set_camif_cfg,
+	.set_camif_cmd = vfe_set_camif_cmd,
+	.set_module_cfg = vfe_set_module_cfg,
+	.camif_wait_for_stop = vfe_camif_wait_for_stop,
+	.isr_read = vfe_isr_read,
+	.violation_read = vfe_violation_read,
+	.isr = vfe_isr,
+};
+
+static u16 vfe48_get_ub_size(u8 vfe_id)
+{
+	/* On VFE4.8 the ub-size is the same on both instances */
+	return MSM_VFE_VFE0_UB_SIZE_RDI;
+}
+
+static void vfe48_wm_enable(struct vfe_device *vfe, u8 wm, u8 enable)
+{
+	if (enable)
+		writel_relaxed(2 << VFE48_0_BUS_IMAGE_MASTER_n_SHIFT(wm),
+			       vfe->base + VFE48_0_BUS_IMAGE_MASTER_CMD);
+	else
+		writel_relaxed(1 << VFE48_0_BUS_IMAGE_MASTER_n_SHIFT(wm),
+			       vfe->base + VFE48_0_BUS_IMAGE_MASTER_CMD);
+	wmb();
+}
+
+static void vfe48_set_qos(struct vfe_device *vfe)
+{
+	u32 val = VFE48_0_BUS_BDG_QOS_CFG_0_CFG;
+	u32 val3 = VFE48_0_BUS_BDG_QOS_CFG_3_CFG;
+	u32 val4 = VFE48_0_BUS_BDG_QOS_CFG_4_CFG;
+	u32 val7 = VFE48_0_BUS_BDG_QOS_CFG_7_CFG;
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
+static void vfe48_set_ds(struct vfe_device *vfe)
+{
+	u32 val = VFE48_0_BUS_BDG_DS_CFG_0_CFG;
+	u32 val16 = VFE48_0_BUS_BDG_DS_CFG_16_CFG;
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
+const struct vfe_hw_ops vfe_ops_4_8 = {
+	.hw_version_read = vfe_hw_version_read,
+	.get_ub_size = vfe48_get_ub_size,
 	.global_reset = vfe_global_reset,
 	.halt_request = vfe_halt_request,
 	.halt_clear = vfe_halt_clear,
-	.wm_enable = vfe_wm_enable,
+	.wm_enable = vfe48_wm_enable,
 	.wm_frame_based = vfe_wm_frame_based,
 	.wm_line_based = vfe_wm_line_based,
 	.wm_set_framedrop_period = vfe_wm_set_framedrop_period,
@@ -1128,8 +1241,8 @@ const struct vfe_hw_ops vfe_ops_4_7 = {
 	.set_scale_cfg = vfe_set_scale_cfg,
 	.set_crop_cfg = vfe_set_crop_cfg,
 	.set_clamp_cfg = vfe_set_clamp_cfg,
-	.set_qos = vfe_set_qos,
-	.set_ds = vfe_set_ds,
+	.set_qos = vfe48_set_qos,
+	.set_ds = vfe48_set_ds,
 	.set_cgc_override = vfe_set_cgc_override,
 	.set_camif_cfg = vfe_set_camif_cfg,
 	.set_camif_cmd = vfe_set_camif_cmd,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index a90b0d2cc6de..5bce6736e4bb 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -180,5 +180,6 @@ void msm_vfe_get_vfe_line_id(struct media_entity *entity, enum vfe_line_id *id);
 
 extern const struct vfe_hw_ops vfe_ops_4_1;
 extern const struct vfe_hw_ops vfe_ops_4_7;
+extern const struct vfe_hw_ops vfe_ops_4_8;
 
 #endif /* QC_MSM_CAMSS_VFE_H */
-- 
2.28.0

