Return-Path: <linux-media+bounces-922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FA77F64B9
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 18:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8794DB21296
	for <lists+linux-media@lfdr.de>; Thu, 23 Nov 2023 17:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C433FE46;
	Thu, 23 Nov 2023 17:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o6YE4no9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D6B1AE
	for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 09:03:07 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-332e7630a9dso110479f8f.1
        for <linux-media@vger.kernel.org>; Thu, 23 Nov 2023 09:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700758986; x=1701363786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FU64yB094w/k/dpqAQjQeJG192Ggsw7tuSAo8zmyjiE=;
        b=o6YE4no9U23wnZL3/dAs/vjuYoAWzWSyRa8sKcShGMYxSrfhUt8W2FbjNUwlDJKWDf
         wAJnAC9dJpvaRtF929XwoE910+s1XXblJ6+CiLNI7W4f7CfXZL2xdmV70bhr0+TZyGy6
         resbZojeCzmjXLFmpvQWMzn0z0yu5aUJDG5/ENqA6+mBAOlsnAkMkEqNjAvJOVRClSya
         T7z3IdgCenV7cLJjU6WDhQEDzDuTPiLYVnIhkrU0m/rahmjLn9mjwAYXQtd/4J48Tdeh
         G4v/SiHod10CvRIisHVLwjZFq2BudGpRTDIoyCrUxzIp/9BccsT6Y4Dri9UmtEaD+xI2
         9DfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700758986; x=1701363786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FU64yB094w/k/dpqAQjQeJG192Ggsw7tuSAo8zmyjiE=;
        b=vzVe3MUP+WNMB6Qgdfro0oTSWT5fhRAp8OMZi4e+WR8pNNV+xdLtENFU7+LzdyBm2H
         l3fpLgiBRuKn78RboGqp61EDWw3lxSwwjlwP6F2rA81l/vRTmevAORWhSZkYLdlGzJ/Y
         bWidwvq2ZaoaXA0oVLq5ii/rYorVXHcGq7g88T0nREoxncI1ULHd0GEseLIaegGFk+pa
         7WZZpEezRkrO3tZujKkzDktgV2kIBeAQSW9Yi8y+ZAbeeJ6kI8H/Hu/KzFXoFvc5gs24
         bzyQnuLMEZ66baouSTLUYBH2JmzSz4gIXcR0h/7lyLdcvHHkmMJLpQXTEU++0hxm+xqM
         THqg==
X-Gm-Message-State: AOJu0YwBpTi1OWCD1mNbsYC1Mqi9+zFdJhWqrDGhQPCb+ksT4kiylXDH
	vTOL5QSv15a2Pw+Dv0dMG2m3Hg==
X-Google-Smtp-Source: AGHT+IG2iNyDmurr/XZExCjpPEpXvcJ3Ks4CXtVmZNjv0oma+f1lSiyhJ5Qyr25J93s6IFOu54EYrA==
X-Received: by 2002:adf:fdcf:0:b0:332:e58b:ab58 with SMTP id i15-20020adffdcf000000b00332e58bab58mr72910wrs.1.1700758984912;
        Thu, 23 Nov 2023 09:03:04 -0800 (PST)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id f9-20020a0560001b0900b0032196c508e3sm2172585wrz.53.2023.11.23.09.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 09:03:04 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 23 Nov 2023 17:03:01 +0000
Subject: [PATCH v6 2/8] media: qcom: camss: Convert to per-VFE pointer for
 power-domain linkages
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231123-b4-camss-named-power-domains-v6-2-3ec2fd9e8e36@linaro.org>
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

Right now we use the top-level camss structure to provide pointers via
VFE id index back to genpd linkages.

In effect this hard-codes VFE indexes to power-domain indexes in the
dtsi and mandates a very particular ordering of power domains in the
dtsi, which bears no relationship to a real hardware dependency.

As a first step to rationalising the VFE power-domain code and breaking
the magic indexing in dtsi use per-VFE pointers to genpd linkages.

The top-level index in msm_vfe_subdev_init is still used to attain the
initial so no functional or logical change arises from this change.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Tested-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
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


