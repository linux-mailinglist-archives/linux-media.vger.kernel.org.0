Return-Path: <linux-media+bounces-923-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B978A7F64BA
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 18:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD03C1C20F8A
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 17:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84BB3FE34;
	Thu, 23 Nov 2023 17:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YJtdT+Ym"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC6FD65
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 09:03:10 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40b358f216dso6533755e9.1
        for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 09:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700758989; x=1701363789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TyWn2sWxlTw7Q4m48/J6zzoO/2iT3h6vpulSOl0sgCs=;
        b=YJtdT+YmXnIhouHywAi4cBznt6yjyWiPPYUu8LLOytzVHFRkQLo21hGIdMLF6cd4Rv
         8DMx1EqGOPNSJjI8UIw9qFC3iy8w9Ntl4eEOOFJKJolGaK0wbsXGqAP+7sFb8k2A7ON6
         lvYVdKeCUe62WHWeSb0Z977Xkpg2sJ8UVH+kiJdUtI4dxtk6YXZeA785q84JbcCtdObr
         cquuS5LNARySxQOpa5novOdDhl34/j4vI2oDrjfyG4cnwMqGaTvT+G9WkMXY49SDJDBL
         cactSPX+yE6ZIq4CWNQW/pUdtsLN4NU+K4GT65aHtxVbjdKQi4JRJka6n4NXxYm+RQuF
         HBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700758989; x=1701363789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TyWn2sWxlTw7Q4m48/J6zzoO/2iT3h6vpulSOl0sgCs=;
        b=RNgWgLt6Y54eUGCHXkZIFuM0B7wQPryh82zx90WeqRWuFbPKtrElwP1MFiCqBwi9st
         LPalQgl/eEOmzg2kksCh3SZs+O0SSdZwSNbuFQBZLPIUoQR+htVoQrElzB0zdYpHq1Si
         c1Aqrm9s+3RePC22SrXs/REec6pW4+lHaOR+jQ9oRWAPXb/H1lJn4BL2qct5lrFFORXc
         td5ogowE8b4xyIT2WGGrnItYS+h9A6I9pL7r9f7oCLd4Bigupl1yKnsqLrJzxKCupPaK
         bcwZb05dICo/rMaqzwT2jsKfYg9S7EAhpo76c6DvbpxaCLIe9eCy/6f3nQyW95jmYJQ7
         qseA==
X-Gm-Message-State: AOJu0Yx5bh+awhy8w2B5zgE/fICpXz0dqLpSw6SVcJlwGlgHSyPj1YEK
	IvN9QS7Mk+OP9ThkkqBkTXARXQ==
X-Google-Smtp-Source: AGHT+IGoRDNG3Y2Y7PxYDIKNVIzgwP52fladAKcN1qHbzB/PK+KvafYLWpVHqldA1ebLNOZf9o060g==
X-Received: by 2002:a5d:640e:0:b0:332:c9e7:3d16 with SMTP id z14-20020a5d640e000000b00332c9e73d16mr36403wru.54.1700758988995;
        Thu, 23 Nov 2023 09:03:08 -0800 (PST)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id f9-20020a0560001b0900b0032196c508e3sm2172585wrz.53.2023.11.23.09.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 09:03:07 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 23 Nov 2023 17:03:03 +0000
Subject: [PATCH v6 4/8] media: qcom: camss: Move VFE power-domain specifics
 into vfe.c
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231123-b4-camss-named-power-domains-v6-4-3ec2fd9e8e36@linaro.org>
References: <20231123-b4-camss-named-power-domains-v6-0-3ec2fd9e8e36@linaro.org>
In-Reply-To: <20231123-b4-camss-named-power-domains-v6-0-3ec2fd9e8e36@linaro.org>
To: hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com, 
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, matti.lehtimaki@gmail.com, 
 quic_grosikop@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13-dev-26615

Moving the location of the hooks to VFE power domains has several
advantages.

1. Separation of concerns and functional decomposition.
   vfe.c should be responsible for and know best how manage
   power-domains for a VFE, excising from camss.c follows this
   principle.

2. Embedding a pointer to genpd in struct camss_vfe{} meas that we can
   dispense with a bunch of kmalloc array inside of camss.c.

3. Splitting up titan top gdsc from vfe/ife gdsc provides a base for
   breaking up magic indexes in dtsi.

Suggested-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Tested-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 21 ++++++++-
 drivers/media/platform/qcom/camss/camss-vfe.h |  2 +
 drivers/media/platform/qcom/camss/camss.c     | 67 ++++++++++++++-------------
 drivers/media/platform/qcom/camss/camss.h     |  4 +-
 4 files changed, 59 insertions(+), 35 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 5172eb5612a1c..60c4730e7c9d1 100644
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
@@ -1381,8 +1382,11 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 	if (!res->line_num)
 		return -EINVAL;
 
-	if (res->has_pd)
-		vfe->genpd = camss->genpd[id];
+	if (res->has_pd) {
+		vfe->genpd = dev_pm_domain_attach_by_id(camss->dev, id);
+		if (IS_ERR(vfe->genpd))
+			return PTR_ERR(vfe->genpd);
+	}
 
 	vfe->line_num = res->line_num;
 	vfe->ops->subdev_init(dev, vfe);
@@ -1506,6 +1510,19 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 	return 0;
 }
 
+/*
+ * msm_vfe_genpd_cleanup - Cleanup VFE genpd linkages
+ * @vfe: VFE device
+ */
+void msm_vfe_genpd_cleanup(struct vfe_device *vfe)
+{
+	if (vfe->genpd_link)
+		device_link_del(vfe->genpd_link);
+
+	if (vfe->genpd)
+		dev_pm_domain_detach(vfe->genpd, true);
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
index ed01a3ac7a38e..35918cf837bdd 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1486,7 +1486,9 @@ static const struct media_device_ops camss_media_ops = {
 
 static int camss_configure_pd(struct camss *camss)
 {
+	const struct camss_resources *res = camss->res;
 	struct device *dev = camss->dev;
+	int vfepd_num;
 	int i;
 	int ret;
 
@@ -1506,45 +1508,41 @@ static int camss_configure_pd(struct camss *camss)
 	if (camss->genpd_num == 1)
 		return 0;
 
-	camss->genpd = devm_kmalloc_array(dev, camss->genpd_num,
-					  sizeof(*camss->genpd), GFP_KERNEL);
-	if (!camss->genpd)
-		return -ENOMEM;
+	/* count the # of VFEs which have flagged power-domain */
+	for (vfepd_num = i = 0; i < camss->vfe_total_num; i++) {
+		if (res->vfe_res[i].has_pd)
+			vfepd_num++;
+	}
 
-	camss->genpd_link = devm_kmalloc_array(dev, camss->genpd_num,
-					       sizeof(*camss->genpd_link),
-					       GFP_KERNEL);
-	if (!camss->genpd_link)
-		return -ENOMEM;
+	/*
+	 * If the number of power-domains is greater than the number of VFEs
+	 * then the additional power-domain is for the entire CAMSS block.
+	 */
+	if (!(camss->genpd_num > vfepd_num))
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
@@ -1566,18 +1564,25 @@ static int camss_icc_get(struct camss *camss)
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
+	camss_genpd_subdevice_cleanup(camss);
+
+	if (camss->genpd_link)
+		device_link_del(camss->genpd_link);
 
-	for (i = 0; i < camss->genpd_num; i++)
-		dev_pm_domain_detach(camss->genpd[i], true);
+	dev_pm_domain_detach(camss->genpd, true);
 }
 
 /*
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index b854cff1774d4..1ba824a2cb76c 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -107,8 +107,8 @@ struct camss {
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


