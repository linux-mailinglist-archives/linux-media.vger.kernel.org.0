Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCB3A7D5E5D
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 00:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344616AbjJXWnW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 18:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344570AbjJXWnS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 18:43:18 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5ACA10CC
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 15:43:14 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40859c46447so26416345e9.1
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 15:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698187393; x=1698792193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRUzcqXrJpaCGHIX3C89YackOmf/WIqYpEcrqSvOKDE=;
        b=FOnbeoq0cZUCggodhAuaItHob8B5v1vU6s3VPln4nJGx+CPGqrLa7rm+LOd5cF4gD4
         56qwrC9ZYCiQ88fR1DMFSIpg9Bo//H/FnZ4uUNePwTaN0t5ywyD9BuqdylaSICQl+YeG
         5IfyR8NhBthGGxQTPHyID1WAHI1L9S/I9M+GGuFlnSjLaY6Tq/BkZYMUqkopOwXiKB+t
         fdII+dYFOmcw6pnEj8yXBkb+9802L6oMAW6zC/qntzunMeznoIk0H6r+uL0/1bJh/n0r
         d4yIUPz86W336PGX1RP9mBq8z2FnGzWrXHPM/feXguyGrIx9xfT81VsaTAUQ3qv1KhQ5
         UcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698187393; x=1698792193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nRUzcqXrJpaCGHIX3C89YackOmf/WIqYpEcrqSvOKDE=;
        b=dESTt8baUPuYmMZhtJE5fR1iSRLMlL2gMG4qzUIEV97TfeJ4xc89FVGtXrpfI+x4XB
         au2eh8on2iEbLHuR2m2CviHPt5/zXalfWpZTRamR09UJbQPPVp7NG6GEnQeewz6ar9LQ
         7whTK0VEf+QwnZW6J1hZgIipR0cgg3Lvrgo9TIAHRehvfHVpxqBU5WzIOfJ2HZqPpOVz
         Ct7Mb7V4GkmKRYMjSsYh56zQhdTnNn8jSDloJxgfOiJnFICZ8O3fUuV/pMeAeChlnDMa
         irRrN5EjyZHlbtXIlQ21NxHVdqa4SlmqhZ2gL5FAeHu4V06Vd8UF+XuDEV1cU66fHiG6
         pV5g==
X-Gm-Message-State: AOJu0Ywbb3Gi5qRPExL9dEvrYQvvUGt1hiyHUACtrWocGRyYLuIuyssC
        keRd6taGLJMJ8q+DI67QiOEaeQ==
X-Google-Smtp-Source: AGHT+IFxCvF6GecGq39a2dirJVqwelsXV7gUpdMmgqkL2vDx2yrADu5ybN+Qc3UF6XyTYRpQr2lnlA==
X-Received: by 2002:a05:600c:4fc7:b0:407:5b54:bb10 with SMTP id o7-20020a05600c4fc700b004075b54bb10mr10815166wmq.8.1698187393238;
        Tue, 24 Oct 2023 15:43:13 -0700 (PDT)
Received: from sagittarius-a.nxsw.local ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c190600b0040641a9d49bsm13049531wmq.17.2023.10.24.15.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 15:43:12 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        rfoss@kernel.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 3/4] media: qcom: camss: Move VFE power-domain specifics into vfe.c
Date:   Tue, 24 Oct 2023 23:42:54 +0100
Message-ID: <20231024224255.754779-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231024224255.754779-1-bryan.odonoghue@linaro.org>
References: <20231024224255.754779-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moving the location of the hooks to VFE power domains has several
advantages.

1. Separation of concerns and functional decomposition.
   vfe.c should be responsible for and know best how manage
   power-domains for a VFE, excising from camss.c follows this
   principle.

2. Embeddeding a pointer to genpd in struct camss_vfe{} meas that we can
   dispense with a bunch of kmalloc array inside of camss.c.

3. Splitting up titan top gdsc from vfe/ife gdsc provides a base for
   breaking up magic indexes in dtsi.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 24 ++++++-
 drivers/media/platform/qcom/camss/camss-vfe.h |  2 +
 drivers/media/platform/qcom/camss/camss.c     | 63 +++++++++----------
 drivers/media/platform/qcom/camss/camss.h     |  4 +-
 4 files changed, 55 insertions(+), 38 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index fc3733baa668d..bc14ae4771e31 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -14,6 +14,7 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/spinlock_types.h>
 #include <linux/spinlock.h>
@@ -493,7 +494,6 @@ void vfe_pm_domain_off(struct vfe_device *vfe)
 int vfe_pm_domain_on(struct vfe_device *vfe)
 {
 	struct camss *camss = vfe->camss;
-	enum vfe_line_id id = vfe->id;
 
 	if (!vfe->genpd)
 		return 0;
@@ -1381,8 +1381,13 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 	if (!res->line_num)
 		return -EINVAL;
 
-	if (camss->genpd)
-		vfe->genpd = camss->genpd[id];
+	if (camss->genpd) {
+		vfe->genpd = dev_pm_domain_attach_by_id(camss->dev, id);
+		if (IS_ERR(vfe->genpd)) {
+			ret = PTR_ERR(vfe->genpd);
+			return ret;
+		}
+	}
 
 	vfe->line_num = res->line_num;
 	vfe->ops->subdev_init(dev, vfe);
@@ -1506,6 +1511,19 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 	return 0;
 }
 
+/*
+ * msm_vfe_genpd_cleanup - Cleanup VFE genpd linkages
+ * @vfe: VFE device
+ *
+ */
+void msm_vfe_genpd_cleanup(struct vfe_device *vfe)
+{
+	if (vfe->genpd_link)
+		device_link_del(vfe->genpd_link);
+
+	dev_pm_domain_detach(vfe->genpd, true);
+}
+
 /*
  * vfe_link_setup - Setup VFE connections
  * @entity: Pointer to media entity structure
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 992a2103ec44c..cdbe59d8d437e 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -159,6 +159,8 @@ struct camss_subdev_resources;
 int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 			const struct camss_subdev_resources *res, u8 id);
 
+void msm_vfe_genpd_cleanup(struct vfe_device *vfe);
+
 int msm_vfe_register_entities(struct vfe_device *vfe,
 			      struct v4l2_device *v4l2_dev);
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 8e78dd8d5961e..523b36d86f6cf 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1479,7 +1479,6 @@ static const struct media_device_ops camss_media_ops = {
 static int camss_configure_pd(struct camss *camss)
 {
 	struct device *dev = camss->dev;
-	int i;
 	int ret;
 
 	camss->genpd_num = of_count_phandle_with_args(dev->of_node,
@@ -1498,45 +1497,36 @@ static int camss_configure_pd(struct camss *camss)
 	if (camss->genpd_num == 1)
 		return 0;
 
-	camss->genpd = devm_kmalloc_array(dev, camss->genpd_num,
-					  sizeof(*camss->genpd), GFP_KERNEL);
-	if (!camss->genpd)
-		return -ENOMEM;
-
-	camss->genpd_link = devm_kmalloc_array(dev, camss->genpd_num,
-					       sizeof(*camss->genpd_link),
-					       GFP_KERNEL);
-	if (!camss->genpd_link)
-		return -ENOMEM;
+	/*
+	 * If the number of power-domains is greather than the number of VFEs
+	 * then the additional power-domain is for the entire CAMSS block the
+	 * 'top' power-domain.
+	 */
+	if (camss->genpd_num <= camss->res->vfe_num)
+		return 0;
 
 	/*
 	 * VFE power domains are in the beginning of the list, and while all
 	 * power domains should be attached, only if TITAN_TOP power domain is
 	 * found in the list, it should be linked over here.
 	 */
-	for (i = 0; i < camss->genpd_num; i++) {
-		camss->genpd[i] = dev_pm_domain_attach_by_id(camss->dev, i);
-		if (IS_ERR(camss->genpd[i])) {
-			ret = PTR_ERR(camss->genpd[i]);
-			goto fail_pm;
-		}
+	camss->genpd = dev_pm_domain_attach_by_id(camss->dev, camss->genpd_num - 1);
+	if (IS_ERR(camss->genpd)) {
+		ret = PTR_ERR(camss->genpd);
+		goto fail_pm;
 	}
-
-	if (i > camss->res->vfe_num) {
-		camss->genpd_link[i - 1] = device_link_add(camss->dev, camss->genpd[i - 1],
-							   DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
-							   DL_FLAG_RPM_ACTIVE);
-		if (!camss->genpd_link[i - 1]) {
-			ret = -EINVAL;
-			goto fail_pm;
-		}
+	camss->genpd_link = device_link_add(camss->dev, camss->genpd,
+					    DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
+					    DL_FLAG_RPM_ACTIVE);
+	if (!camss->genpd_link) {
+		ret = -EINVAL;
+		goto fail_pm;
 	}
 
 	return 0;
 
 fail_pm:
-	for (--i ; i >= 0; i--)
-		dev_pm_domain_detach(camss->genpd[i], true);
+	dev_pm_domain_detach(camss->genpd, true);
 
 	return ret;
 }
@@ -1558,18 +1548,25 @@ static int camss_icc_get(struct camss *camss)
 	return 0;
 }
 
-static void camss_genpd_cleanup(struct camss *camss)
+static void camss_genpd_subdevice_cleanup(struct camss *camss)
 {
 	int i;
 
+	for (i = 0; i < camss->vfe_total_num; i++)
+		msm_vfe_genpd_cleanup(&camss->vfe[i]);
+}
+
+static void camss_genpd_cleanup(struct camss *camss)
+{
 	if (camss->genpd_num == 1)
 		return;
 
-	if (camss->genpd_num > camss->res->vfe_num)
-		device_link_del(camss->genpd_link[camss->genpd_num - 1]);
+	if (camss->genpd_link)
+		device_link_del(camss->genpd_link);
+
+	dev_pm_domain_detach(camss->genpd, true);
 
-	for (i = 0; i < camss->genpd_num; i++)
-		dev_pm_domain_detach(camss->genpd[i], true);
+	camss_genpd_subdevice_cleanup(camss);
 }
 
 /*
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 8acad7321c09d..95486c494afc6 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -106,8 +106,8 @@ struct camss {
 	struct vfe_device *vfe;
 	atomic_t ref_count;
 	int genpd_num;
-	struct device **genpd;
-	struct device_link **genpd_link;
+	struct device *genpd;
+	struct device_link *genpd_link;
 	struct icc_path *icc_path[ICC_SM8250_COUNT];
 	const struct camss_resources *res;
 	unsigned int vfe_total_num;
-- 
2.42.0

