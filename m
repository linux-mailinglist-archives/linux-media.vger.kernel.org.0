Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDD32963F5
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 19:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369278AbgJVRrX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 13:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2900872AbgJVRrV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 13:47:21 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A93EBC0613CE;
        Thu, 22 Oct 2020 10:47:20 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id b8so3588126wrn.0;
        Thu, 22 Oct 2020 10:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YDKD/4kES32xLnMEZnjIyG4gujN1bUpwWJxuJXMEomE=;
        b=c+LgKAFISy6TfUohEbqIsGi5NxQ4ONVcrGeQgthf6YM/6DySrZ9nbhWJUQQbK7+v51
         QZDTo8mrnek7weR5NdsbrNUUEclDy1WIehe5o2YgXsUUzxdTSxJTwPWVrzeMBmoRZ7j5
         FGPzccyPNRyBr1R5F0nXVZkIZjrOomGsPabfuGIReHASZp06KItmFhCuH0nC5QPhM9AZ
         dQ/OTHCTp/dykwy7w7XhkFZVOBzPSLNJwopwUAczHsInYB/iohMRTG/as/rUS6/K/nH5
         8MaGCOdH5Xv7ZBeiEIXFSbfQKjAzWgvVfJaDUufVDLY2xPC4HO3O0B4KeR8o5Gj5WoXp
         upNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YDKD/4kES32xLnMEZnjIyG4gujN1bUpwWJxuJXMEomE=;
        b=nd5A/pjBhTdolJ0WoTiSXzschkDZVKvPOR8o4AjmBESBFKOKSeAr3rvx1wHTdAZ1jN
         YzDquA3lc7259v6izOmj4oa6M17rDmQ3Wq/F263m9me28UPl8zO+QaZk+gCnYigX+/3s
         NisJDexHtS7nikdDnIr2g2fgJXszF/Qgnqzr75EIz34fKxR9qSGINEYtdRlI4wkhrhQi
         /guckVkXRerMrApqxIrHkvM4u5E32fLDFhoZNmYPgiNyqJWUK+tyEW4/fmE94+AP1Lxp
         rTkXnFi1aTV0pzj3fq6fLdK49nzz+ClCODDDMx3N3X5YXgKYOo7dHe5Ro40MQbYzzLL7
         qKNg==
X-Gm-Message-State: AOAM532SKDQsq6aHzUxjJw/8OU255op8D1r/mGgbKiEGeS0M9Vrmaj09
        M0S7Mv9nvn5+JKQ5qIdgPbU=
X-Google-Smtp-Source: ABdhPJy5MgRvxc88KZuHZSHu44U5E04fBclYyzrI5cReRLbi184Oyr4USIJlVH25Blpc7Ym1q+dTJQ==
X-Received: by 2002:adf:de91:: with SMTP id w17mr3858877wrl.84.1603388839266;
        Thu, 22 Oct 2020 10:47:19 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id u202sm5368355wmu.23.2020.10.22.10.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 10:47:18 -0700 (PDT)
From:   kholk11@gmail.com
To:     todor.too@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robert.foss@linaro.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH v2 3/7] media: camss: vfe: Add support for VFE 4.8
Date:   Thu, 22 Oct 2020 19:47:02 +0200
Message-Id: <20201022174706.8813-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022174706.8813-1-kholk11@gmail.com>
References: <20201022174706.8813-1-kholk11@gmail.com>
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
 .../media/platform/qcom/camss/camss-vfe-4-7.c | 115 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-vfe.h |   1 +
 2 files changed, 116 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index 6f380a450ca1..b5704a2f119b 100644
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
 
@@ -1139,3 +1150,107 @@ const struct vfe_hw_ops vfe_ops_4_7 = {
 	.violation_read = vfe_violation_read,
 	.isr = vfe_isr,
 };
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
+
+	/* The WM must be enabled before sending other commands */
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
+	.global_reset = vfe_global_reset,
+	.halt_request = vfe_halt_request,
+	.halt_clear = vfe_halt_clear,
+	.wm_enable = vfe48_wm_enable,
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
+	.set_qos = vfe48_set_qos,
+	.set_ds = vfe48_set_ds,
+	.set_cgc_override = vfe_set_cgc_override,
+	.set_camif_cfg = vfe_set_camif_cfg,
+	.set_camif_cmd = vfe_set_camif_cmd,
+	.set_module_cfg = vfe_set_module_cfg,
+	.camif_wait_for_stop = vfe_camif_wait_for_stop,
+	.isr_read = vfe_isr_read,
+	.violation_read = vfe_violation_read,
+	.isr = vfe_isr,
+};
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

