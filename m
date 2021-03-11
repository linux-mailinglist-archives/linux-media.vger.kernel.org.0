Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDEC337BF0
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 19:11:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbhCKSKj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 13:10:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230405AbhCKSKY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 13:10:24 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87BDAC061760
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 10:10:23 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id z1so4206705edb.8
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 10:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1AfdIZTqpGrnF71coA6YZPrrGqzYFO27hUk38aGGU4s=;
        b=T/blYpNpDrArp53wwEkelGLm+j9b/jutSbrKNlvV7kUj7Xukn0o7bAF/rDnM7g5cSP
         X5+B8k1t9mOYDN+dvXGmCWI2e/6ShpEKdagIRfLkL/MroO2hfIWa7fJ5Gq2T+OXGMQ8l
         KHTBreHYE2D9F5gQt7owFPMjw8WXELyMB7bMMOD11A1XK9PR33CuQIay1hFYPwUioFNr
         5TsWC/1mMK1Yf3wbboW5F395j/EqZiAwFxZ6Pj8QtgCZjxEnLa7GcEZuvj/GUEAOtkcJ
         QbKx7E7MgsFUfmE6Xaz8YBtUtL7kMMjMyRnDnIk70Qr8R9stFrD9upr9J7vTQRPPZUXJ
         jegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1AfdIZTqpGrnF71coA6YZPrrGqzYFO27hUk38aGGU4s=;
        b=HKkktXdcI8g7fjctQb1oWKGR17fBeJZ3nvjDHkMh62PNxX8NiSgdrMwykJVXqkNXL9
         8bk8PAVEpjp2YQpSb3Bq2vm7tj5Q2lUpQ8VxB4R1wBKNIINsuvstBAwjhEj0JGW1u1iW
         CORvq1+/VI2dLPWYuLd7OVSg1jG85/LyXcO3bprndLtgKvpZQr+3TbwlFPYKPq74MD9L
         YHOWYDu81xnSdyST8uCxmDcL0qw5hUZk9d783OJNYQ+RNqpvDyvK5fMXqFNG28cGHV8S
         0dzllio0Y5W2ozg0FoPxbfDXg7UWJdpqY/y3sOpC5QonSM8VDmnzg+sRnPlokICiInOS
         rlBQ==
X-Gm-Message-State: AOAM532Fs/0Mh3tCaDYvhWniOK48vtKIZelyDj32i6TTccfLXUXdntkK
        zdRHYusRNoHn1YSw20Nq46SbPQ==
X-Google-Smtp-Source: ABdhPJxPh5ei6/tQ0J+Eqj3GDGN0eeybOJtZK8aDtJS+u4j+23Yh3UKdpUvO0T3CwCfji1ati+zSKQ==
X-Received: by 2002:a05:6402:32d:: with SMTP id q13mr9824044edw.17.1615486222171;
        Thu, 11 Mar 2021 10:10:22 -0800 (PST)
Received: from localhost.localdomain ([2a02:2454:3e3:5f00:8e01:34c:da50:eb7e])
        by smtp.gmail.com with ESMTPSA id a22sm1741290ejr.89.2021.03.11.10.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 10:10:21 -0800 (PST)
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
Subject: [PATCH v7 12/22] media: camss: Refactor VFE power domain toggling
Date:   Thu, 11 Mar 2021 19:09:38 +0100
Message-Id: <20210311180948.268343-13-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210311180948.268343-1-robert.foss@linaro.org>
References: <20210311180948.268343-1-robert.foss@linaro.org>
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
index 9bf83cef01af..4ea1f251950b 100644
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
@@ -1230,6 +1230,48 @@ static const struct media_device_ops camss_media_ops = {
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
@@ -1362,20 +1404,10 @@ static int camss_probe(struct platform_device *pdev)
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
@@ -1396,6 +1428,9 @@ static int camss_probe(struct platform_device *pdev)
 
 void camss_delete(struct camss *camss)
 {
+	int nbr_pm_domains = 0;
+	int i;
+
 	v4l2_device_unregister(&camss->v4l2_dev);
 	media_device_unregister(&camss->media_dev);
 	media_device_cleanup(&camss->media_dev);
@@ -1403,9 +1438,12 @@ void camss_delete(struct camss *camss)
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

