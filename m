Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B211B33C0EB
	for <lists+linux-media@lfdr.de>; Mon, 15 Mar 2021 17:02:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232922AbhCOQBN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Mar 2021 12:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232821AbhCOQAt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Mar 2021 12:00:49 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91C0BC061762
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 09:00:48 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id p7so55807263eju.6
        for <linux-media@vger.kernel.org>; Mon, 15 Mar 2021 09:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wL7z/Cl90+04yIIn+iAI5zRGPk+hlHwQzilyWB9rjjE=;
        b=RdekbNfdMkO6T1JZWOoPI3KL21l/T+juksdUIZ/cxfsWdFQ/lH7YHTqeNZcIJjDS0U
         Kb7kLddr7npAC/njvkqZgPpC0ovD7YuDTj5mk8rss6hMn91JlgLBcbZ6Q8NQ1i3bCsne
         ku01F01ymkGIU1L4ITGmb9oqHmVxNXsUatp6dDsMIwwQ43X0fyz7KnljtkWgnvXpbbuX
         bmzG1GWkaVLK+vfBpEcGJfNVlc/BSwSXRg1bWnLs1ZE9GwmMw03729G/5RTBwmCPSZxq
         x21OmG/44HMeU5ms/9QKR+rwxn1rI0WQ3PTMJXTf8KT4jH/K5JwZf5psZvCmlVPYx1SB
         NCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wL7z/Cl90+04yIIn+iAI5zRGPk+hlHwQzilyWB9rjjE=;
        b=SzgZPWzoGMd0oveCnUJzFRuoMy1p1VmbZa+dQjEP6L3Qll8uCv3DMm/E6WQoZXqdmn
         YollYq/eEOk37aQK0+zsM2n3BGcaqmBXH8FVF+5DYm/G+xtRdI/hGzRnK9jiRgaAH/AH
         aBEkpqF9QpCUbfhzEwSJ8iG4CgO59E6mKI4NbNL2aXt42UmwkiWcYYWF2mdHgOhFpFDA
         FKZ8DK6kax4RcE5O4MsDLAWlmNO05St+qdZzUG9GSj7x/r38pVSM43owdTWwC8KL9OrD
         4sIrt9CAIlof0S+fYJs/gX267pKn7poHxCTgL3x7XtWmiT/9hEzoqlyb0P1LmrD6u6U/
         q8cw==
X-Gm-Message-State: AOAM532Gs/LYDokc9HUMg2b2zWgq9Nh1QpvGWBMJOxJgqCV2gHkANWwB
        Mdtq5mi9T/1mwdZyt32Jk0TUtA==
X-Google-Smtp-Source: ABdhPJy055OKDXsbp68KRp5KOvJc6mpKbAJrG6GR67jG5OKwgU6U8eBS44iiy9oS8NYI64XS/kjXOA==
X-Received: by 2002:a17:906:ccde:: with SMTP id ot30mr24520249ejb.550.1615824047139;
        Mon, 15 Mar 2021 09:00:47 -0700 (PDT)
Received: from localhost.localdomain ([37.120.1.234])
        by smtp.gmail.com with ESMTPSA id r5sm8456445eds.49.2021.03.15.09.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 09:00:46 -0700 (PDT)
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
Subject: [PATCH v8 12/22] media: camss: Refactor VFE power domain toggling
Date:   Mon, 15 Mar 2021 16:59:33 +0100
Message-Id: <20210315155942.640889-13-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315155942.640889-1-robert.foss@linaro.org>
References: <20210315155942.640889-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For Titan ISPs clocks fail to re-enable during vfe_get()
after any vfe has been halted and its corresponding power
domain power has been detached.

Since all of the clocks depend on all of the PDs, per
VFE PD detaching is no option for Gen2 HW.

In order to not have regressions on for Gen1 HW, refactor
the power domain management into hardware version specific
code paths.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---


Changes since v5:
 - Andrey: Bifurcated PD support into Gen1 & Gen2 paths

Changes since v6:
 - Andrey: Add r-b
 - Improved commit msg



 .../media/platform/qcom/camss/camss-vfe-170.c | 20 ++++
 .../media/platform/qcom/camss/camss-vfe-4-1.c | 20 ++++
 .../media/platform/qcom/camss/camss-vfe-4-7.c | 39 ++++++++
 .../media/platform/qcom/camss/camss-vfe-4-8.c | 34 +++++++
 drivers/media/platform/qcom/camss/camss-vfe.c |  6 +-
 drivers/media/platform/qcom/camss/camss-vfe.h |  2 +
 drivers/media/platform/qcom/camss/camss.c     | 93 +++++++++++++------
 drivers/media/platform/qcom/camss/camss.h     | 10 +-
 8 files changed, 188 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
index 18d63c2c9d2b..8594d275b41d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
@@ -695,6 +695,24 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 }
 
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
 /*
  * vfe_queue_buffer - Add empty buffer
  * @vid: Video device structure
@@ -756,6 +774,8 @@ const struct vfe_hw_ops vfe_ops_170 = {
 	.hw_version_read = vfe_hw_version_read,
 	.isr_read = vfe_isr_read,
 	.isr = vfe_isr,
+	.pm_domain_off = vfe_pm_domain_off,
+	.pm_domain_on = vfe_pm_domain_on,
 	.reg_update_clear = vfe_reg_update_clear,
 	.reg_update = vfe_reg_update,
 	.subdev_init = vfe_subdev_init,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index 636c0515506e..53c56a8d4545 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -938,6 +938,24 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
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
 static const struct vfe_hw_ops_gen1 vfe_ops_gen1_4_1 = {
 	.bus_connect_wm_to_rdi = vfe_bus_connect_wm_to_rdi,
 	.bus_disconnect_wm_from_rdi = vfe_bus_disconnect_wm_from_rdi,
@@ -989,6 +1007,8 @@ const struct vfe_hw_ops vfe_ops_4_1 = {
 	.hw_version_read = vfe_hw_version_read,
 	.isr_read = vfe_isr_read,
 	.isr = vfe_isr,
+	.pm_domain_off = vfe_pm_domain_off,
+	.pm_domain_on = vfe_pm_domain_on,
 	.reg_update_clear = vfe_reg_update_clear,
 	.reg_update = vfe_reg_update,
 	.subdev_init = vfe_subdev_init,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index f5ba09a93016..a59635217758 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2015-2018 Linaro Ltd.
  */
 
+#include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -1104,6 +1105,42 @@ static void vfe_isr_read(struct vfe_device *vfe, u32 *value0, u32 *value1)
 	writel_relaxed(VFE_0_IRQ_CMD_GLOBAL_CLEAR, vfe->base + VFE_0_IRQ_CMD);
 }
 
+/*
+ * vfe_pm_domain_off - Disable power domains specific to this VFE.
+ * @vfe: VFE Device
+ */
+static void vfe_pm_domain_off(struct vfe_device *vfe)
+{
+	struct camss *camss;
+
+	if (!vfe)
+		return;
+
+	camss = vfe->camss;
+
+	device_link_del(camss->genpd_link[vfe->id]);
+}
+
+/*
+ * vfe_pm_domain_on - Enable power domains specific to this VFE.
+ * @vfe: VFE Device
+ */
+static int vfe_pm_domain_on(struct vfe_device *vfe)
+{
+	struct camss *camss = vfe->camss;
+	enum vfe_line_id id = vfe->id;
+
+	camss->genpd_link[id] = device_link_add(camss->dev, camss->genpd[id], DL_FLAG_STATELESS |
+						DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
+
+	if (!camss->genpd_link[id]) {
+		dev_err(vfe->camss->dev, "Failed to add VFE#%d to power domain\n", id);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static void vfe_violation_read(struct vfe_device *vfe)
 {
 	u32 violation = readl_relaxed(vfe->base + VFE_0_VIOLATION_STATUS);
@@ -1162,6 +1199,8 @@ const struct vfe_hw_ops vfe_ops_4_7 = {
 	.hw_version_read = vfe_hw_version_read,
 	.isr_read = vfe_isr_read,
 	.isr = vfe_isr,
+	.pm_domain_off = vfe_pm_domain_off,
+	.pm_domain_on = vfe_pm_domain_on,
 	.reg_update_clear = vfe_reg_update_clear,
 	.reg_update = vfe_reg_update,
 	.subdev_init = vfe_subdev_init,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
index 8c3a5d293a1c..998429dbb65c 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2015-2021 Linaro Ltd.
  */
 
+#include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -1093,6 +1094,37 @@ static void vfe_isr_read(struct vfe_device *vfe, u32 *value0, u32 *value1)
 	writel_relaxed(VFE_0_IRQ_CMD_GLOBAL_CLEAR, vfe->base + VFE_0_IRQ_CMD);
 }
 
+/*
+ * vfe_pm_domain_off - Disable power domains specific to this VFE.
+ * @vfe: VFE Device
+ */
+static void vfe_pm_domain_off(struct vfe_device *vfe)
+{
+	struct camss *camss = vfe->camss;
+
+	device_link_del(camss->genpd_link[vfe->id]);
+}
+
+/*
+ * vfe_pm_domain_on - Enable power domains specific to this VFE.
+ * @vfe: VFE Device
+ */
+static int vfe_pm_domain_on(struct vfe_device *vfe)
+{
+	struct camss *camss = vfe->camss;
+	enum vfe_line_id id = vfe->id;
+
+	camss->genpd_link[id] = device_link_add(camss->dev, camss->genpd[id], DL_FLAG_STATELESS |
+						DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
+
+	if (!camss->genpd_link[id]) {
+		dev_err(vfe->camss->dev, "Failed to add VFE#%d to power domain\n", id);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static void vfe_violation_read(struct vfe_device *vfe)
 {
 	u32 violation = readl_relaxed(vfe->base + VFE_0_VIOLATION_STATUS);
@@ -1151,6 +1183,8 @@ const struct vfe_hw_ops vfe_ops_4_8 = {
 	.hw_version_read = vfe_hw_version_read,
 	.isr_read = vfe_isr_read,
 	.isr = vfe_isr,
+	.pm_domain_off = vfe_pm_domain_off,
+	.pm_domain_on = vfe_pm_domain_on,
 	.reg_update_clear = vfe_reg_update_clear,
 	.reg_update = vfe_reg_update,
 	.subdev_init = vfe_subdev_init,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index c4b2c8edb760..15695fd466c4 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -580,7 +580,7 @@ static int vfe_get(struct vfe_device *vfe)
 	mutex_lock(&vfe->power_lock);
 
 	if (vfe->power_count == 0) {
-		ret = camss_pm_domain_on(vfe->camss, vfe->id);
+		ret = vfe->ops->pm_domain_on(vfe);
 		if (ret < 0)
 			goto error_pm_domain;
 
@@ -620,7 +620,7 @@ static int vfe_get(struct vfe_device *vfe)
 
 error_pm_runtime_get:
 	pm_runtime_put_sync(vfe->camss->dev);
-	camss_pm_domain_off(vfe->camss, vfe->id);
+	vfe->ops->pm_domain_off(vfe);
 
 error_pm_domain:
 	mutex_unlock(&vfe->power_lock);
@@ -646,7 +646,7 @@ static void vfe_put(struct vfe_device *vfe)
 		}
 		camss_disable_clocks(vfe->nclocks, vfe->clock);
 		pm_runtime_put_sync(vfe->camss->dev);
-		camss_pm_domain_off(vfe->camss, vfe->id);
+		vfe->ops->pm_domain_off(vfe);
 	}
 
 	vfe->power_count--;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 57bdc758f0a8..17625b481c19 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -106,6 +106,8 @@ struct vfe_hw_ops {
 	void (*hw_version_read)(struct vfe_device *vfe, struct device *dev);
 	irqreturn_t (*isr)(int irq, void *dev);
 	void (*isr_read)(struct vfe_device *vfe, u32 *value0, u32 *value1);
+	void (*pm_domain_off)(struct vfe_device *vfe);
+	int (*pm_domain_on)(struct vfe_device *vfe);
 	void (*reg_update)(struct vfe_device *vfe, enum vfe_line_id line_id);
 	void (*reg_update_clear)(struct vfe_device *vfe,
 				 enum vfe_line_id line_id);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index d022aed47e25..9b23285d1c20 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -799,24 +799,24 @@ int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock)
 
 int camss_pm_domain_on(struct camss *camss, int id)
 {
-	if (camss->version == CAMSS_8x96 ||
-	    camss->version == CAMSS_660) {
-		camss->genpd_link[id] = device_link_add(camss->dev,
-				camss->genpd[id], DL_FLAG_STATELESS |
-				DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
+	int ret = 0;
+
+	if (id < camss->vfe_num) {
+		struct vfe_device *vfe = &camss->vfe[id];
 
-		if (!camss->genpd_link[id])
-			return -EINVAL;
+		ret = vfe->ops->pm_domain_on(vfe);
 	}
 
-	return 0;
+	return ret;
 }
 
 void camss_pm_domain_off(struct camss *camss, int id)
 {
-	if (camss->version == CAMSS_8x96 ||
-	    camss->version == CAMSS_660)
-		device_link_del(camss->genpd_link[id]);
+	if (id < camss->vfe_num) {
+		struct vfe_device *vfe = &camss->vfe[id];
+
+		vfe->ops->pm_domain_off(vfe);
+	}
 }
 
 /*
@@ -1234,6 +1234,47 @@ static const struct media_device_ops camss_media_ops = {
 	.link_notify = v4l2_pipeline_link_notify,
 };
 
+static int camss_configure_pd(struct camss *camss)
+{
+	int nbr_pm_domains = 0;
+	int last_pm_domain = 0;
+	int i;
+	int ret;
+
+	if (camss->version == CAMSS_8x96 ||
+	    camss->version == CAMSS_660)
+		nbr_pm_domains = PM_DOMAIN_GEN1_COUNT;
+
+	for (i = 0; i < nbr_pm_domains; i++) {
+		camss->genpd[i] = dev_pm_domain_attach_by_id(camss->dev, i);
+		if (IS_ERR(camss->genpd[i])) {
+			ret = PTR_ERR(camss->genpd[i]);
+			goto fail_pm;
+		}
+
+		camss->genpd_link[i] = device_link_add(camss->dev, camss->genpd[i],
+						       DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
+						       DL_FLAG_RPM_ACTIVE);
+		if (!camss->genpd_link[i]) {
+			dev_pm_domain_detach(camss->genpd[i], true);
+			ret = -EINVAL;
+			goto fail_pm;
+		}
+
+		last_pm_domain = i;
+	}
+
+	return 0;
+
+fail_pm:
+	for (i = 0; i < last_pm_domain; i++) {
+		device_link_del(camss->genpd_link[i]);
+		dev_pm_domain_detach(camss->genpd[i], true);
+	}
+
+	return ret;
+}
+
 /*
  * camss_probe - Probe CAMSS platform device
  * @pdev: Pointer to CAMSS platform device
@@ -1366,20 +1407,10 @@ static int camss_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (camss->version == CAMSS_8x96 ||
-	    camss->version == CAMSS_660) {
-		camss->genpd[PM_DOMAIN_VFE0] = dev_pm_domain_attach_by_id(
-						camss->dev, PM_DOMAIN_VFE0);
-		if (IS_ERR(camss->genpd[PM_DOMAIN_VFE0]))
-			return PTR_ERR(camss->genpd[PM_DOMAIN_VFE0]);
-
-		camss->genpd[PM_DOMAIN_VFE1] = dev_pm_domain_attach_by_id(
-						camss->dev, PM_DOMAIN_VFE1);
-		if (IS_ERR(camss->genpd[PM_DOMAIN_VFE1])) {
-			dev_pm_domain_detach(camss->genpd[PM_DOMAIN_VFE0],
-					     true);
-			return PTR_ERR(camss->genpd[PM_DOMAIN_VFE1]);
-		}
+	ret = camss_configure_pd(camss);
+	if (ret < 0) {
+		dev_err(dev, "Failed to configure power domains: %d\n", ret);
+		return ret;
 	}
 
 	pm_runtime_enable(dev);
@@ -1400,6 +1431,9 @@ static int camss_probe(struct platform_device *pdev)
 
 void camss_delete(struct camss *camss)
 {
+	int nbr_pm_domains = 0;
+	int i;
+
 	v4l2_device_unregister(&camss->v4l2_dev);
 	media_device_unregister(&camss->media_dev);
 	media_device_cleanup(&camss->media_dev);
@@ -1407,9 +1441,12 @@ void camss_delete(struct camss *camss)
 	pm_runtime_disable(camss->dev);
 
 	if (camss->version == CAMSS_8x96 ||
-	    camss->version == CAMSS_660) {
-		dev_pm_domain_detach(camss->genpd[PM_DOMAIN_VFE0], true);
-		dev_pm_domain_detach(camss->genpd[PM_DOMAIN_VFE1], true);
+	    camss->version == CAMSS_660)
+		nbr_pm_domains = PM_DOMAIN_GEN1_COUNT;
+
+	for (i = 0; i < nbr_pm_domains; i++) {
+		device_link_del(camss->genpd_link[i]);
+		dev_pm_domain_detach(camss->genpd[i], true);
 	}
 
 	kfree(camss);
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 0f8f77801001..33ed16ab821d 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -57,9 +57,9 @@ struct resources_ispif {
 };
 
 enum pm_domain {
-	PM_DOMAIN_VFE0,
-	PM_DOMAIN_VFE1,
-	PM_DOMAIN_COUNT
+	PM_DOMAIN_VFE0 = 0,
+	PM_DOMAIN_VFE1 = 1,
+	PM_DOMAIN_GEN1_COUNT = 2,	/* CAMSS series of ISPs */
 };
 
 enum camss_version {
@@ -83,8 +83,8 @@ struct camss {
 	int vfe_num;
 	struct vfe_device *vfe;
 	atomic_t ref_count;
-	struct device *genpd[PM_DOMAIN_COUNT];
-	struct device_link *genpd_link[PM_DOMAIN_COUNT];
+	struct device *genpd[PM_DOMAIN_GEN1_COUNT];
+	struct device_link *genpd_link[PM_DOMAIN_GEN1_COUNT];
 };
 
 struct camss_camera_interface {
-- 
2.27.0

