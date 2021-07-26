Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D86DC3D54CC
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 10:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232182AbhGZHVK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 03:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232295AbhGZHVI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 03:21:08 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75BC0C061757
        for <linux-media@vger.kernel.org>; Mon, 26 Jul 2021 01:01:36 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id c16so88994wrp.13
        for <linux-media@vger.kernel.org>; Mon, 26 Jul 2021 01:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=upzwPoATA2+BpeywH9BXoLQjHHRdyqwMIY4xqkio9lQ=;
        b=PW3Pk8YRIyJNU7VgYYVV2fBp4io9wtDsiPiQRpwCkCQ30K0IVxpiYsY/Eox1dZWyhH
         i7QIT1JO9AI6cV9lyE5IABZRZ+bdG2rmu9pmswkSa8AzW3Qb0cHrkBY73ZO3btkM8KXj
         OKZ54ftbG+fu2qPkG8QF/Fx+/8jIVfwkhhdtH7bioSzEN2Z8q0UrpLFBcLAJWTtE3DLO
         E7IyYivgaQAJt4ZJAoUetzttgfuXGoJD5bCK+1nusHFS2Y2uqtPVQR4rwyJuDXUhDW7K
         Thq0eqUG/nwUn7INZg8UW1G3iMLxas3FASLDee8cBEAi45lhvMVrVUrjHCtlHnDkeUrb
         yCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=upzwPoATA2+BpeywH9BXoLQjHHRdyqwMIY4xqkio9lQ=;
        b=MTL5UwY15bwJ8DXg4keysS6USadCe7CshUSb7hzYXUV1gd+YI9ryBNUTlZT9pZpXez
         a+diIk4EeeP7mOqUP8FcDX/5Ho4NDXzYaJ9CHDRdtQu3FnFz+mWY36g7djeYySIJJHsp
         MgzKOdhV2oAGhe/fugDbutZMLNpAsneo+HILuY5prGqUBiuK/zihqGkzG3Y35ZUfgl67
         pjIGnzdTKJVoPu5Z4O6ZCvy9hBrIx7i/UHdDaCgSHolS+4f72Tuu1U/dwLhOfAphOqOC
         cAgxjrXwH+SaQcSOFWxeaNmgpzAnH1WQWd7zbT7sex26iMmgEcSx1W0BjtGNG4bi/O16
         I05w==
X-Gm-Message-State: AOAM5314BJs5kpqbtfmNDjKINlvCTURP1sb2Pd7kJsvFiG2MyXtcpszT
        UHKsGQH+aFPpzNs77kaghZbmJA==
X-Google-Smtp-Source: ABdhPJxryYLJzN6ra6Q6lvG27FVaBbl38pW8NW3STR5BtW8/UUoEpEs3NykpRMFOFcrhPeCdAPiBgg==
X-Received: by 2002:adf:dd07:: with SMTP id a7mr4002764wrm.377.1627286495050;
        Mon, 26 Jul 2021 01:01:35 -0700 (PDT)
Received: from qcom-hackbox.linaro.org.net (163-172-5-244.rev.poneytelecom.eu. [163.172.5.244])
        by smtp.gmail.com with ESMTPSA id n8sm460600wrx.46.2021.07.26.01.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 01:01:34 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH v1 4/4] media: camss: vfe: Rework vfe_hw_version_read() function definition
Date:   Mon, 26 Jul 2021 10:01:13 +0200
Message-Id: <20210726080113.8378-4-robert.foss@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210726080113.8378-1-robert.foss@linaro.org>
References: <20210726080113.8378-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Expose the VFE version by returning the value read from the HW_VERSION
register.

Secondly, change the name of this function to conform with the CSID
equivalent.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-170.c | 6 ++++--
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c | 6 ++++--
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c | 6 ++++--
 drivers/media/platform/qcom/camss/camss-vfe-4-8.c | 6 ++++--
 drivers/media/platform/qcom/camss/camss-vfe.c     | 2 +-
 drivers/media/platform/qcom/camss/camss-vfe.h     | 2 +-
 6 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
index 8ef4e80a62a2..5c083d70d495 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
@@ -177,7 +177,7 @@
 #define VFE_BUS_WM_FRAME_INC(n)			(0x2258 + (n) * 0x100)
 #define VFE_BUS_WM_BURST_LIMIT(n)		(0x225c + (n) * 0x100)
 
-static void vfe_hw_version_read(struct vfe_device *vfe)
+static u32 vfe_hw_version(struct vfe_device *vfe)
 {
 	u32 hw_version = readl_relaxed(vfe->base + VFE_HW_VERSION);
 
@@ -187,6 +187,8 @@ static void vfe_hw_version_read(struct vfe_device *vfe)
 
 	dev_dbg(vfe->camss->dev, "VFE HW Version = %u.%u.%u\n",
 		gen, rev, step);
+
+	return hw_version;
 }
 
 static inline void vfe_reg_clr(struct vfe_device *vfe, u32 reg, u32 clr_bits)
@@ -772,7 +774,7 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 
 const struct vfe_hw_ops vfe_ops_170 = {
 	.global_reset = vfe_global_reset,
-	.hw_version_read = vfe_hw_version_read,
+	.hw_version = vfe_hw_version,
 	.isr_read = vfe_isr_read,
 	.isr = vfe_isr,
 	.pm_domain_off = vfe_pm_domain_off,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index 614c266e8cd1..7b7c9a0aaab2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -210,11 +210,13 @@
 #define MSM_VFE_VFE0_UB_SIZE 1023
 #define MSM_VFE_VFE0_UB_SIZE_RDI (MSM_VFE_VFE0_UB_SIZE / 3)
 
-static void vfe_hw_version_read(struct vfe_device *vfe)
+static u32 vfe_hw_version(struct vfe_device *vfe)
 {
 	u32 hw_version = readl_relaxed(vfe->base + VFE_0_HW_VERSION);
 
 	dev_dbg(vfe->camss->dev, "VFE HW Version = 0x%08x\n", hw_version);
+
+	return hw_version;
 }
 
 static u16 vfe_get_ub_size(u8 vfe_id)
@@ -1004,7 +1006,7 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 
 const struct vfe_hw_ops vfe_ops_4_1 = {
 	.global_reset = vfe_global_reset,
-	.hw_version_read = vfe_hw_version_read,
+	.hw_version = vfe_hw_version,
 	.isr_read = vfe_isr_read,
 	.isr = vfe_isr,
 	.pm_domain_off = vfe_pm_domain_off,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index aa175e0f6331..2836b12ec989 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -254,11 +254,13 @@
 #define MSM_VFE_VFE1_UB_SIZE 1535
 #define MSM_VFE_VFE1_UB_SIZE_RDI (MSM_VFE_VFE1_UB_SIZE / 3)
 
-static void vfe_hw_version_read(struct vfe_device *vfe)
+static u32 vfe_hw_version(struct vfe_device *vfe)
 {
 	u32 hw_version = readl_relaxed(vfe->base + VFE_0_HW_VERSION);
 
 	dev_dbg(vfe->camss->dev, "VFE HW Version = 0x%08x\n", hw_version);
+
+	return hw_version;
 }
 
 static u16 vfe_get_ub_size(u8 vfe_id)
@@ -1196,7 +1198,7 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 
 const struct vfe_hw_ops vfe_ops_4_7 = {
 	.global_reset = vfe_global_reset,
-	.hw_version_read = vfe_hw_version_read,
+	.hw_version = vfe_hw_version,
 	.isr_read = vfe_isr_read,
 	.isr = vfe_isr,
 	.pm_domain_off = vfe_pm_domain_off,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
index b897f5163c5d..19519234f727 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
@@ -247,11 +247,13 @@
 #define MSM_VFE_VFE1_UB_SIZE 1535
 #define MSM_VFE_VFE1_UB_SIZE_RDI (MSM_VFE_VFE1_UB_SIZE / 3)
 
-static void vfe_hw_version_read(struct vfe_device *vfe)
+static u32 vfe_hw_version(struct vfe_device *vfe)
 {
 	u32 hw_version = readl_relaxed(vfe->base + VFE_0_HW_VERSION);
 
 	dev_dbg(vfe->camss->dev, "VFE HW Version = 0x%08x\n", hw_version);
+
+	return hw_version;
 }
 
 static inline void vfe_reg_clr(struct vfe_device *vfe, u32 reg, u32 clr_bits)
@@ -1180,7 +1182,7 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 
 const struct vfe_hw_ops vfe_ops_4_8 = {
 	.global_reset = vfe_global_reset,
-	.hw_version_read = vfe_hw_version_read,
+	.hw_version = vfe_hw_version,
 	.isr_read = vfe_isr_read,
 	.isr = vfe_isr,
 	.pm_domain_off = vfe_pm_domain_off,
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 9b4f8136759c..6b2f33fc9be2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1299,7 +1299,7 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 		return -EINVAL;
 	}
 	vfe->ops->subdev_init(dev, vfe);
-	vfe->ops->hw_version_read(vfe);
+	vfe->ops->hw_version(vfe);
 
 	/* Memory */
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index cca251816d28..f166d176cb77 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -103,7 +103,7 @@ struct vfe_device;
 struct vfe_hw_ops {
 	void (*enable_irq_common)(struct vfe_device *vfe);
 	void (*global_reset)(struct vfe_device *vfe);
-	void (*hw_version_read)(struct vfe_device *vfe);
+	u32 (*hw_version)(struct vfe_device *vfe);
 	irqreturn_t (*isr)(int irq, void *dev);
 	void (*isr_read)(struct vfe_device *vfe, u32 *value0, u32 *value1);
 	void (*pm_domain_off)(struct vfe_device *vfe);
-- 
2.29.2

