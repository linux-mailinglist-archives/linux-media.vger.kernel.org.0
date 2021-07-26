Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3EC3D54CB
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 10:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232836AbhGZHVH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 03:21:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232807AbhGZHVG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 03:21:06 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9768CC0613D3
        for <linux-media@vger.kernel.org>; Mon, 26 Jul 2021 01:01:35 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id q3so10014973wrx.0
        for <linux-media@vger.kernel.org>; Mon, 26 Jul 2021 01:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TMv5pNQLtj3z4HnxrdOEyzC4R0UvS0SYkpbtyPuEbyo=;
        b=rFl+WRVs4wmrem2xToXADdWytoUjHE0sj7XJ3SYLINwx4TpuSM553Fd7LDPhiqPdsY
         WiVmSCR/kUOYhicF0qfv1ixQl3piuUv0KXo8wgF+lcN77h9s1ELlXFNi4pO7z2eq0VYN
         EolAGzqTPIv/L2js3lndvmhmFoAbnt8cz0WZtJhQa6r51Qo9LaFAK5Am5cVI0PfJWQNG
         jLJnhaBvUJ4ShtPbxgTmDvf4E2wf9rhHR9qGZW3Ty9JfwVvIfB4Y7KBzK8u5GTvjIaur
         HANX5cxvdAZRKU2Yxl8o+Y4EroLuXYWVJejNpc3TSSx8e1kBwzXjmlE9HDOri1+wJvtu
         WDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TMv5pNQLtj3z4HnxrdOEyzC4R0UvS0SYkpbtyPuEbyo=;
        b=M1HhVlaZiet1JWUxRZiRDnpL6auw32pLT1uBcB17TsZrXloaNe1guc9cvHcQ5NniNF
         v2ARra6ZvMOjqyEjjI3rsmpAdu4q7dciT9Q7LZWfAYkJn2SvGlfqrk9TOidQzec7zapN
         W1TC+RpGzJNJKq4c28Hew6ilRGyo5qbnBn/R7dt9A/6qyi3Rz2/1kYg/OSEsJOYw4vem
         AQYn/hMWOiCd9EWlKw4Ne5rDphD7NTwkBcIPI9caVkSX1aYqbraXURap/LMbUVF4wMdW
         b8hdCIpv2G6kls5J5gq19fklftAUpnr9AfcPBBmFN1zKwMunDcrG2FLHbTupQvlYYusy
         9Jqg==
X-Gm-Message-State: AOAM530OfQmiufk3BmqXg9++p+UzGvPSZCxKd/9Dql/fptW7aL4baIc0
        y20qP6VzJFpXlsagxDzHs1M+PA==
X-Google-Smtp-Source: ABdhPJzlBmkPgJUcR9yrxacto9PbKbi5SBfJwRiYHn14459MqV88YkPeYYKp1doIKsi6IhhqcIC1nQ==
X-Received: by 2002:a5d:58c1:: with SMTP id o1mr7078556wrf.6.1627286494233;
        Mon, 26 Jul 2021 01:01:34 -0700 (PDT)
Received: from qcom-hackbox.linaro.org.net (163-172-5-244.rev.poneytelecom.eu. [163.172.5.244])
        by smtp.gmail.com with ESMTPSA id n8sm460600wrx.46.2021.07.26.01.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 01:01:33 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH v1 3/4] media: camss: vfe: Remove vfe_hw_version_read() argument
Date:   Mon, 26 Jul 2021 10:01:12 +0200
Message-Id: <20210726080113.8378-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210726080113.8378-1-robert.foss@linaro.org>
References: <20210726080113.8378-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The device argument is not needed, since it is accessible through
the vfe_device argument already.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-170.c | 5 +++--
 drivers/media/platform/qcom/camss/camss-vfe-4-1.c | 4 ++--
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c | 4 ++--
 drivers/media/platform/qcom/camss/camss-vfe-4-8.c | 4 ++--
 drivers/media/platform/qcom/camss/camss-vfe.c     | 2 +-
 drivers/media/platform/qcom/camss/camss-vfe.h     | 2 +-
 6 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
index 1ad502a1c276..8ef4e80a62a2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
@@ -177,7 +177,7 @@
 #define VFE_BUS_WM_FRAME_INC(n)			(0x2258 + (n) * 0x100)
 #define VFE_BUS_WM_BURST_LIMIT(n)		(0x225c + (n) * 0x100)
 
-static void vfe_hw_version_read(struct vfe_device *vfe, struct device *dev)
+static void vfe_hw_version_read(struct vfe_device *vfe)
 {
 	u32 hw_version = readl_relaxed(vfe->base + VFE_HW_VERSION);
 
@@ -185,7 +185,8 @@ static void vfe_hw_version_read(struct vfe_device *vfe, struct device *dev)
 	u32 rev = (hw_version >> 16) & 0xFFF;
 	u32 step = hw_version & 0xFFFF;
 
-	dev_dbg(dev, "VFE HW Version = %u.%u.%u\n", gen, rev, step);
+	dev_dbg(vfe->camss->dev, "VFE HW Version = %u.%u.%u\n",
+		gen, rev, step);
 }
 
 static inline void vfe_reg_clr(struct vfe_device *vfe, u32 reg, u32 clr_bits)
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
index 53c56a8d4545..614c266e8cd1 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-1.c
@@ -210,11 +210,11 @@
 #define MSM_VFE_VFE0_UB_SIZE 1023
 #define MSM_VFE_VFE0_UB_SIZE_RDI (MSM_VFE_VFE0_UB_SIZE / 3)
 
-static void vfe_hw_version_read(struct vfe_device *vfe, struct device *dev)
+static void vfe_hw_version_read(struct vfe_device *vfe)
 {
 	u32 hw_version = readl_relaxed(vfe->base + VFE_0_HW_VERSION);
 
-	dev_dbg(dev, "VFE HW Version = 0x%08x\n", hw_version);
+	dev_dbg(vfe->camss->dev, "VFE HW Version = 0x%08x\n", hw_version);
 }
 
 static u16 vfe_get_ub_size(u8 vfe_id)
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index 13f0fa6a7d60..aa175e0f6331 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -254,11 +254,11 @@
 #define MSM_VFE_VFE1_UB_SIZE 1535
 #define MSM_VFE_VFE1_UB_SIZE_RDI (MSM_VFE_VFE1_UB_SIZE / 3)
 
-static void vfe_hw_version_read(struct vfe_device *vfe, struct device *dev)
+static void vfe_hw_version_read(struct vfe_device *vfe)
 {
 	u32 hw_version = readl_relaxed(vfe->base + VFE_0_HW_VERSION);
 
-	dev_dbg(dev, "VFE HW Version = 0x%08x\n", hw_version);
+	dev_dbg(vfe->camss->dev, "VFE HW Version = 0x%08x\n", hw_version);
 }
 
 static u16 vfe_get_ub_size(u8 vfe_id)
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
index 03f92a6737b0..b897f5163c5d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
@@ -247,11 +247,11 @@
 #define MSM_VFE_VFE1_UB_SIZE 1535
 #define MSM_VFE_VFE1_UB_SIZE_RDI (MSM_VFE_VFE1_UB_SIZE / 3)
 
-static void vfe_hw_version_read(struct vfe_device *vfe, struct device *dev)
+static void vfe_hw_version_read(struct vfe_device *vfe)
 {
 	u32 hw_version = readl_relaxed(vfe->base + VFE_0_HW_VERSION);
 
-	dev_dbg(dev, "VFE HW Version = 0x%08x\n", hw_version);
+	dev_dbg(vfe->camss->dev, "VFE HW Version = 0x%08x\n", hw_version);
 }
 
 static inline void vfe_reg_clr(struct vfe_device *vfe, u32 reg, u32 clr_bits)
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index f6e889c1598e..9b4f8136759c 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1299,7 +1299,7 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 		return -EINVAL;
 	}
 	vfe->ops->subdev_init(dev, vfe);
-	vfe->ops->hw_version_read(vfe, dev);
+	vfe->ops->hw_version_read(vfe);
 
 	/* Memory */
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 844b9275031d..cca251816d28 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -103,7 +103,7 @@ struct vfe_device;
 struct vfe_hw_ops {
 	void (*enable_irq_common)(struct vfe_device *vfe);
 	void (*global_reset)(struct vfe_device *vfe);
-	void (*hw_version_read)(struct vfe_device *vfe, struct device *dev);
+	void (*hw_version_read)(struct vfe_device *vfe);
 	irqreturn_t (*isr)(int irq, void *dev);
 	void (*isr_read)(struct vfe_device *vfe, u32 *value0, u32 *value1);
 	void (*pm_domain_off)(struct vfe_device *vfe);
-- 
2.29.2

