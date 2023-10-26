Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 072767D8637
	for <lists+linux-media@lfdr.de>; Thu, 26 Oct 2023 17:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345504AbjJZPuy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Oct 2023 11:50:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345492AbjJZPuw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Oct 2023 11:50:52 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B351AB
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 08:50:49 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40859c464daso8707155e9.1
        for <linux-media@vger.kernel.org>; Thu, 26 Oct 2023 08:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698335447; x=1698940247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YU00avEttChWoKTeHCnTvaWaEc1lCuq+WqQjs5hraA=;
        b=VPP3sXYsZD/OSFM4Gs5eNOE1vsybh/sZP/EFWWxN95J3OuiQcoAhGZTOnD6Wqy2qfJ
         F+Tx+6aUCT3ZlwvO+C/kygdwahBXHCXKgcpL1on91t3kSd3/en6u6FvLYXYeRoQdF1i8
         2hVYIzJWvxfuhIYbGcSYaBfAu9AZjmphiyBLXF7OgIX7zWLqJwbqK+MHLvT1BpeEBKkp
         ulqBiSfEW23WLCbjJnZD79b6N3wUnV1XdSyTV7x9FidtCFxdD+XZ645uEF/LW3x/0rUK
         +N5QcFYKtXf2zQJniFCBHWKd/x4Dk82O5Cjbaj1qKNFv4JIWpI52FN+tmR62GYdmGt0a
         1r/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698335447; x=1698940247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4YU00avEttChWoKTeHCnTvaWaEc1lCuq+WqQjs5hraA=;
        b=sDvHgWkRwZ+IOMThgx88Sj9Ht/y7MUME8S7CnnMnjDyQx3sEGiN0a4NhJS5XvYYrIF
         lH2No3bZXfQ0Zw8NsO+Z0zjdPUbiDrcq97BGk49Z4ziSibWH6569hxWJvglEPW7u1Xk8
         LpRPxJEzt1zsF9zP/SqOcIFlFyVV4WrbYrbvJteJ8/cJtVUU7VDALi8mg7/T7gdLGHJm
         Znc7HhTmBwIxqCtaTTg5NEUggt587CjY9xWYBeCuGeBQFlyFNNnHQRm/XusAZudZkvcC
         OsOorRGLrDRoyu/3hLF7fWULBZ/QsC5Vk7Xl3Z5PG6iiNQR4uabJZZraI4bg6sx59M9I
         4SyA==
X-Gm-Message-State: AOJu0YwhX90JVBAdyzDOBtx9TwNtOmNZHeOG/tR2uDDLMOBMubxpFVu9
        qkUYVnvax770jhoj+GrCYg7zRWwBYjH7ZjZkML000Q==
X-Google-Smtp-Source: AGHT+IFwWAZFexOeURya8eby1E4NzwtjOyV5MzsJjzifdtI9wrsmDYYZ/cxLkT21KTXrHup+eXpmUA==
X-Received: by 2002:a05:600c:1c93:b0:408:3c8a:65ec with SMTP id k19-20020a05600c1c9300b004083c8a65ecmr189703wms.8.1698335447649;
        Thu, 26 Oct 2023 08:50:47 -0700 (PDT)
Received: from sagittarius-a.nxsw.local ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id m28-20020a05600c3b1c00b003feae747ff2sm2938289wms.35.2023.10.26.08.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 08:50:47 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        rfoss@kernel.org, todor.too@gmail.com, andersson@kernel.org,
        konrad.dybcio@linaro.org, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 2/5] media: qcom: camss: Convert to per-VFE pointer for power-domain linkages
Date:   Thu, 26 Oct 2023 16:50:39 +0100
Message-ID: <20231026155042.551731-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231026155042.551731-1-bryan.odonoghue@linaro.org>
References: <20231026155042.551731-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Right now we use the top-level camss structure to provide pointers via
VFE id index back to genpd linkages.

In effect this hard-codes VFE indexes to power-domain indexes in the
dtsi and mandates a very particular ordering of power domains in the
dtsi, which bears no relationship to a real hardware dependency.

As a first step to rationalising the VFE power-domain code and breaking
the magic indexing in dtsi use per-VFE pointers to genpd linkages.

The top-level index in msm_vfe_subdev_init is still used to attain the
initial so no functional or logical change arises from this change.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-170.c | 15 +++++++--------
 drivers/media/platform/qcom/camss/camss-vfe-4-7.c | 15 +++++----------
 drivers/media/platform/qcom/camss/camss-vfe-4-8.c | 13 +++++--------
 drivers/media/platform/qcom/camss/camss-vfe-480.c | 15 +++++++--------
 drivers/media/platform/qcom/camss/camss-vfe.c     |  3 +++
 drivers/media/platform/qcom/camss/camss-vfe.h     |  2 ++
 6 files changed, 29 insertions(+), 34 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
index 0b211fed12760..7451484317cc3 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
@@ -638,7 +638,7 @@ static void vfe_pm_domain_off(struct vfe_device *vfe)
 	if (vfe->id >= camss->res->vfe_num)
 		return;
 
-	device_link_del(camss->genpd_link[vfe->id]);
+	device_link_del(vfe->genpd_link);
 }
 
 /*
@@ -648,16 +648,15 @@ static void vfe_pm_domain_off(struct vfe_device *vfe)
 static int vfe_pm_domain_on(struct vfe_device *vfe)
 {
 	struct camss *camss = vfe->camss;
-	enum vfe_line_id id = vfe->id;
 
-	if (id >= camss->res->vfe_num)
+	if (vfe->id >= camss->res->vfe_num)
 		return 0;
 
-	camss->genpd_link[id] = device_link_add(camss->dev, camss->genpd[id],
-						DL_FLAG_STATELESS |
-						DL_FLAG_PM_RUNTIME |
-						DL_FLAG_RPM_ACTIVE);
-	if (!camss->genpd_link[id])
+	vfe->genpd_link = device_link_add(camss->dev, vfe->genpd,
+					  DL_FLAG_STATELESS |
+					  DL_FLAG_PM_RUNTIME |
+					  DL_FLAG_RPM_ACTIVE);
+	if (!vfe->genpd_link)
 		return -EINVAL;
 
 	return 0;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
index b65ed0fef595e..2b4e7e039407b 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-7.c
@@ -1109,14 +1109,10 @@ static void vfe_isr_read(struct vfe_device *vfe, u32 *value0, u32 *value1)
  */
 static void vfe_pm_domain_off(struct vfe_device *vfe)
 {
-	struct camss *camss;
-
 	if (!vfe)
 		return;
 
-	camss = vfe->camss;
-
-	device_link_del(camss->genpd_link[vfe->id]);
+	device_link_del(vfe->genpd_link);
 }
 
 /*
@@ -1126,13 +1122,12 @@ static void vfe_pm_domain_off(struct vfe_device *vfe)
 static int vfe_pm_domain_on(struct vfe_device *vfe)
 {
 	struct camss *camss = vfe->camss;
-	enum vfe_line_id id = vfe->id;
 
-	camss->genpd_link[id] = device_link_add(camss->dev, camss->genpd[id], DL_FLAG_STATELESS |
-						DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
+	vfe->genpd_link = device_link_add(camss->dev, vfe->genpd, DL_FLAG_STATELESS |
+					  DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
 
-	if (!camss->genpd_link[id]) {
-		dev_err(vfe->camss->dev, "Failed to add VFE#%d to power domain\n", id);
+	if (!vfe->genpd_link) {
+		dev_err(vfe->camss->dev, "Failed to add VFE#%d to power domain\n", vfe->id);
 		return -EINVAL;
 	}
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
index 7b3805177f037..5e95343241304 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-4-8.c
@@ -1099,9 +1099,7 @@ static void vfe_isr_read(struct vfe_device *vfe, u32 *value0, u32 *value1)
  */
 static void vfe_pm_domain_off(struct vfe_device *vfe)
 {
-	struct camss *camss = vfe->camss;
-
-	device_link_del(camss->genpd_link[vfe->id]);
+	device_link_del(vfe->genpd_link);
 }
 
 /*
@@ -1111,13 +1109,12 @@ static void vfe_pm_domain_off(struct vfe_device *vfe)
 static int vfe_pm_domain_on(struct vfe_device *vfe)
 {
 	struct camss *camss = vfe->camss;
-	enum vfe_line_id id = vfe->id;
 
-	camss->genpd_link[id] = device_link_add(camss->dev, camss->genpd[id], DL_FLAG_STATELESS |
-						DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
+	vfe->genpd_link = device_link_add(camss->dev, vfe->genpd, DL_FLAG_STATELESS |
+					  DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
 
-	if (!camss->genpd_link[id]) {
-		dev_err(vfe->camss->dev, "Failed to add VFE#%d to power domain\n", id);
+	if (!vfe->genpd_link) {
+		dev_err(vfe->camss->dev, "Failed to add VFE#%d to power domain\n", vfe->id);
 		return -EINVAL;
 	}
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index f2368b77fc6d6..a70b8633bb3eb 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -463,7 +463,7 @@ static void vfe_pm_domain_off(struct vfe_device *vfe)
 	if (vfe->id >= camss->res->vfe_num)
 		return;
 
-	device_link_del(camss->genpd_link[vfe->id]);
+	device_link_del(vfe->genpd_link);
 }
 
 /*
@@ -473,16 +473,15 @@ static void vfe_pm_domain_off(struct vfe_device *vfe)
 static int vfe_pm_domain_on(struct vfe_device *vfe)
 {
 	struct camss *camss = vfe->camss;
-	enum vfe_line_id id = vfe->id;
 
-	if (id >= camss->res->vfe_num)
+	if (vfe->id >= camss->res->vfe_num)
 		return 0;
 
-	camss->genpd_link[id] = device_link_add(camss->dev, camss->genpd[id],
-						DL_FLAG_STATELESS |
-						DL_FLAG_PM_RUNTIME |
-						DL_FLAG_RPM_ACTIVE);
-	if (!camss->genpd_link[id])
+	vfe->genpd_link = device_link_add(camss->dev, vfe->genpd,
+					  DL_FLAG_STATELESS |
+					  DL_FLAG_PM_RUNTIME |
+					  DL_FLAG_RPM_ACTIVE);
+	if (!vfe->genpd_link)
 		return -EINVAL;
 
 	return 0;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 4839e2cedfe58..94267b9974554 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1347,6 +1347,9 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 	if (!res->line_num)
 		return -EINVAL;
 
+	if (res->has_pd)
+		vfe->genpd = camss->genpd[id];
+
 	vfe->line_num = res->line_num;
 	vfe->ops->subdev_init(dev, vfe);
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 09baded0dcdd6..c1c50023d4876 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -150,6 +150,8 @@ struct vfe_device {
 	const struct vfe_hw_ops_gen1 *ops_gen1;
 	struct vfe_isr_ops isr_ops;
 	struct camss_video_ops video_ops;
+	struct device *genpd;
+	struct device_link *genpd_link;
 };
 
 struct camss_subdev_resources;
-- 
2.42.0

