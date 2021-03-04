Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06DD432D269
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 13:09:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239930AbhCDMGu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 07:06:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239948AbhCDMGe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 07:06:34 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC803C0617AA
        for <linux-media@vger.kernel.org>; Thu,  4 Mar 2021 04:05:53 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id v13so18022925edw.9
        for <linux-media@vger.kernel.org>; Thu, 04 Mar 2021 04:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6WKSkdfJWQT6ScsStAWwBW6BE9cv0kXfab41hM2FrSw=;
        b=WPsfmGscBQG1qAq/ELu0hlEw9yRYPqfgL40a6c1NGZKpqKmrCJH+WyidDzlLDmqJio
         7lBgyjKoqOV1R+NGP+8ePO94dCmiF2HbHi2CFL6UNNsrpuGBLiWgmCWiFV2en4UfjWoO
         SgWldqT4mfLURsCw9eIMS+dyTXoRgSlBGKxw3+hVYlIuy19vgvEFWrJqRbPO+jNLwGIf
         UlwzAXWsVxP2odgt+V2ZuRsRWbYbuax78bVrup0L88C5+VmM7JOMeTUs5Gp4rrSyKYje
         Ml6k3vPQ/0sg9I6/3myE5AQQhqGvlaRi06alIutSPwzjC6PAm35UM43EHKxXm4WMv8rn
         XEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6WKSkdfJWQT6ScsStAWwBW6BE9cv0kXfab41hM2FrSw=;
        b=CA8UkxTbuE76HJeHKO0kABAbbGnMM12xab1rZ2MF5FmoKifMKr08+XIYpBNro2+zcX
         xTzOJGiafrM7sD/WlQJPFojE+zvkzJL+Uy8b81q6dXXypu3tIyPNy17H98C498PFp639
         y9xeScgCKPY2PTJ8RrygLDlHgI+Ch0+S8rbqnZsWoHUE6iLJGDkmGpn/75CJMlwyAOIF
         cW1CQf9zSowrHv62RssGQv+t/DzlFcVsfhjlbVmtkaFTXXtOKh9x1F9BAFEZOutxf/86
         Hhic7ZFJyacs4io/zPyjdg1Lr+XrByjqP3VUwYRZxXk2Z9enSQUwhZb6C43N4vkaV6Io
         7Ecg==
X-Gm-Message-State: AOAM533sImzu7s912py/MSj3rYHWS1mOlWPXCFhUtZ24tP9aPWRSEtBg
        tuqUukynJefC92O5SvAOnrpBBD6/rIKfTGH6
X-Google-Smtp-Source: ABdhPJzh2Trz97+zpJX/AkYkOUZEU9uk6/ObEzbr1GYzhKJDvXJylFvLSBX3KKpxoxLb47JwOUifyA==
X-Received: by 2002:a05:6402:30a5:: with SMTP id df5mr4075052edb.24.1614859552385;
        Thu, 04 Mar 2021 04:05:52 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:470a:340b:1b:29dd])
        by smtp.gmail.com with ESMTPSA id cf6sm20464447edb.92.2021.03.04.04.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 04:05:51 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v6 12/22] media: camss: Remove per VFE power domain toggling
Date:   Thu,  4 Mar 2021 13:03:18 +0100
Message-Id: <20210304120326.153966-13-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210304120326.153966-1-robert.foss@linaro.org>
References: <20210304120326.153966-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For Titan ISPs clocks fail to re-enable during vfe_get()
after any vfe has been halted and its corresponding power
domain power has been detached.

Since all of the clocks depend on all of the PDs, per
VFE PD detaching is no option for this generation of HW.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---


Changes since v5:
 - Andrey: Bifurcated PD support into Gen1 & Gen2 paths


 .../media/platform/qcom/camss/camss-vfe-170.c | 21 +++++
 .../media/platform/qcom/camss/camss-vfe-4-1.c | 19 ++++
 .../media/platform/qcom/camss/camss-vfe-4-7.c | 39 ++++++++
 .../media/platform/qcom/camss/camss-vfe-4-8.c | 34 +++++++
 drivers/media/platform/qcom/camss/camss-vfe.c |  6 +-
 drivers/media/platform/qcom/camss/camss-vfe.h |  2 +
 drivers/media/platform/qcom/camss/camss.c     | 94 +++++++++++++------
 drivers/media/platform/qcom/camss/camss.h     | 10 +-
 8 files changed, 189 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
index ce1130108e01..99f27124ad3b 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
@@ -714,6 +714,25 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 }
 
+/*
+ * vfe_pm_domain_off - Disable power domains specific to this VFE.
+ * @vfe: VFE Device
+ */
+static void vfe_pm_domain_off(struct vfe_device *vfe)
+{
+
+}
+
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
@@ -775,6 +794,8 @@ const struct vfe_hw_ops vfe_ops_170 = {
 	.hw_version_read = vfe_hw_version_read,
 	.isr_read = vfe_isr_read,
 	.isr = vfe_isr,
+	.pm_domain_off = vfe_pm_domain_off,
+	.pm_domain_on = vfe_pm_domain_on,
 	.reg_update_clear = vfe_reg_update_clear,
 	.reg_update = vfe_reg_update,
 	.subdev_init = vfe_subdev_init,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index 81756d7fd5c2..9fc44be3ccb8 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -938,6 +938,23 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+/*
+ * vfe_pm_domain_off - Disable power domains specific to this VFE.
+ * @vfe: VFE Device
+ */
+static void vfe_pm_domain_off(struct vfe_device *vfe)
+{
+
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
 
 const struct vfe_hw_ops_gen1 vfe_ops_gen1_4_1 = {
 	.bus_connect_wm_to_rdi = vfe_bus_connect_wm_to_rdi,
@@ -990,6 +1007,8 @@ const struct vfe_hw_ops vfe_ops_4_1 = {
 	.hw_version_read = vfe_hw_version_read,
 	.isr_read = vfe_isr_read,
 	.isr = vfe_isr,
+	.pm_domain_off = vfe_pm_domain_off,
+	.pm_domain_on = vfe_pm_domain_on,
 	.reg_update_clear = vfe_reg_update_clear,
 	.reg_update = vfe_reg_update,
 	.subdev_init = vfe_subdev_init,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index 5ecb87f1b047..41cf150d9efe 100644
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
index 732b93b365d3..f368870ae36d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2015-2021 Linaro Ltd.
  */
 
+#include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
@@ -1098,6 +1099,37 @@ static void vfe_isr_read(struct vfe_device *vfe, u32 *value0, u32 *value1)
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
@@ -1156,6 +1188,8 @@ const struct vfe_hw_ops vfe_ops_4_8 = {
 	.hw_version_read = vfe_hw_version_read,
 	.isr_read = vfe_isr_read,
 	.isr = vfe_isr,
+	.pm_domain_off = vfe_pm_domain_off,
+	.pm_domain_on = vfe_pm_domain_on,
 	.reg_update_clear = vfe_reg_update_clear,
 	.reg_update = vfe_reg_update,
 	.subdev_init = vfe_subdev_init,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 6fafeb8a5484..402f18729f9f 100644
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
index 29b3d930ffc6..05839a9f60f6 100644
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
index 5d0479b5589c..0a9388227c59 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -776,24 +776,24 @@ int camss_get_pixel_clock(struct media_entity *entity, u32 *pixel_clock)
 
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
@@ -1207,6 +1207,48 @@ static const struct media_device_ops camss_media_ops = {
 	.link_notify = v4l2_pipeline_link_notify,
 };
 
+
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
+			DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
+
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
@@ -1339,20 +1381,10 @@ static int camss_probe(struct platform_device *pdev)
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
@@ -1373,6 +1405,9 @@ static int camss_probe(struct platform_device *pdev)
 
 void camss_delete(struct camss *camss)
 {
+	int nbr_pm_domains = 0;
+	int i;
+
 	v4l2_device_unregister(&camss->v4l2_dev);
 	media_device_unregister(&camss->media_dev);
 	media_device_cleanup(&camss->media_dev);
@@ -1380,9 +1415,12 @@ void camss_delete(struct camss *camss)
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
index b7ad8e9f68a8..244991710879 100644
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

