Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1830C31098E
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 11:53:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231302AbhBEKws (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 05:52:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231768AbhBEKuh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 05:50:37 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 015CFC0698C8
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 02:45:15 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id w4so5612804wmi.4
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 02:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kvX1fPx3FMQ5uXckxXhS8AVQna5Rb5Ybg4HAxWPNgfE=;
        b=ENQh6NsMSfxa3GT7kJpNjD/dyfyphvRasEWdBNimWlO4LIe86KW4N1moIzupJz2z85
         LDc/Vxu3a07Vh4eTVGu9Lb26aeWdlG/Z43nl8EJEg8BRhXGQW2f9dk4WDuRCH1uIu6dj
         EuNAAn31hTfM4UdqCQCKN7ctnKkY5zHsZM2HN6SRNGwJO+Jsa7FhUmi7uThHZX7DwWQS
         crgmC+wAUYisJVtEdIYzsgjjV0koO+/Bt7+3jAMgf1SxppncMKy/EsEiowKdTcoMtF72
         Ewyj1JqueuvVn638tkSB69rcACTdyldOOu7kA1Hah/ManVFw3zr8LT2ZHVpgwCaM+B6e
         DN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kvX1fPx3FMQ5uXckxXhS8AVQna5Rb5Ybg4HAxWPNgfE=;
        b=GrGvJiAGg4dvD5yj6LLoxvqE0K7u5BeST4jFQoXiY/+K/OD/QK4/cRLhqvyh9FUNlf
         QjE4ebmD4OX3nXV1llERcP5mtfDm65gU71GFZGtcOjTlSGg12w14KDzQCe95a4TpTtoB
         9nXSj8HhBlCjkZDEE2OfcayYRgi6qsDAxU6Jr5S95DR0n6R+LBsFSAH7dze2FHMAEcqI
         th5NtiFatWNwnlPCD9S09+o8h8PsNt2jj450OP0Pidsj1cvpV1v02sZwuzOWwXvZT4bg
         3+apkXMjBmWbBQdBUusfdFTbNeaVA7MjrOd9OeFSz7kfgitSvyxVR41Srr5hY/D/6/2b
         NzrQ==
X-Gm-Message-State: AOAM531CCfYdmRYR0Ffpwmtf3eycSei5VZe5xJgOBM4SjQNcmQ91ST3l
        OjcmynRDcbC5XF8WJGsVfk36Lg==
X-Google-Smtp-Source: ABdhPJxEgdxWOYeSfxwa2WBWHlaCingCJ7zZEoEQFGr+hSU4LEQCS2q+mHzY0cYKNMpC4Ejw1DYdCQ==
X-Received: by 2002:a1c:9d4c:: with SMTP id g73mr2937298wme.105.1612521913733;
        Fri, 05 Feb 2021 02:45:13 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:38fd:e0db:ea01:afc8])
        by smtp.gmail.com with ESMTPSA id u4sm11300233wrr.37.2021.02.05.02.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 02:45:13 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v4 13/22] media: camss: Enable SDM845
Date:   Fri,  5 Feb 2021 11:44:05 +0100
Message-Id: <20210205104414.299732-14-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210205104414.299732-1-robert.foss@linaro.org>
References: <20210205104414.299732-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable support for SDM845 based Titan 170 ISPs.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 17 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  6 ++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 22f9d7d7085a..5ce7cae2ab9b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -897,6 +897,12 @@ static int camss_init_subdevices(struct camss *camss)
 		csid_res = csid_res_660;
 		ispif_res = &ispif_res_660;
 		vfe_res = vfe_res_660;
+	}  else if (camss->version == CAMSS_845) {
+		csiphy_res = csiphy_res_845;
+		csid_res = csid_res_845;
+		/* Titan VFEs don't have an ISPIF  */
+		ispif_res = NULL;
+		vfe_res = vfe_res_845;
 	} else {
 		return -EINVAL;
 	}
@@ -1203,6 +1209,8 @@ static int camss_configure_pd(struct camss *camss)
 	if (camss->version == CAMSS_8x96 ||
 	    camss->version == CAMSS_660)
 		nbr_pm_domains = PM_DOMAIN_CAMSS_COUNT;
+	else if (camss->version == CAMSS_845)
+		nbr_pm_domains = PM_DOMAIN_TITAN_COUNT;
 
 	for (i = 0; i < nbr_pm_domains; i++) {
 		camss->genpd[i] = dev_pm_domain_attach_by_id(camss->dev, i);
@@ -1271,6 +1279,12 @@ static int camss_probe(struct platform_device *pdev)
 		camss->csiphy_num = 3;
 		camss->csid_num = 4;
 		camss->vfe_num = 2;
+	} else if (of_device_is_compatible(dev->of_node,
+					   "qcom,sdm845-camss")) {
+		camss->version = CAMSS_845;
+		camss->csiphy_num = 4;
+		camss->csid_num = 3;
+		camss->vfe_num = 3;
 	} else {
 		ret = -EINVAL;
 		goto err_free;
@@ -1402,6 +1416,8 @@ void camss_delete(struct camss *camss)
 	if (camss->version == CAMSS_8x96 ||
 	    camss->version == CAMSS_660)
 		nbr_pm_domains = PM_DOMAIN_CAMSS_COUNT;
+	else if (camss->version == CAMSS_845)
+		nbr_pm_domains = PM_DOMAIN_TITAN_COUNT;
 
 	for (i = 0; i < nbr_pm_domains; i++) {
 		device_link_del(camss->genpd_link[i]);
@@ -1435,6 +1451,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss" },
 	{ .compatible = "qcom,msm8996-camss" },
 	{ .compatible = "qcom,sdm660-camss" },
+	{ .compatible = "qcom,sdm845-camss" },
 	{ }
 };
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7560d85b3352..2f853557ed16 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -60,6 +60,8 @@ enum pm_domain {
 	PM_DOMAIN_VFE0 = 0,
 	PM_DOMAIN_VFE1 = 1,
 	PM_DOMAIN_CAMSS_COUNT = 2,	/* CAMSS series of ISPs */
+	PM_DOMAIN_VFELITE = 2,		/* VFELITE / TOP GDSC */
+	PM_DOMAIN_TITAN_COUNT = 3,	/* Titan series of ISPs */
 };
 
 enum camss_version {
@@ -83,8 +85,8 @@ struct camss {
 	int vfe_num;
 	struct vfe_device *vfe;
 	atomic_t ref_count;
-	struct device *genpd[PM_DOMAIN_CAMSS_COUNT];
-	struct device_link *genpd_link[PM_DOMAIN_CAMSS_COUNT];
+	struct device *genpd[PM_DOMAIN_TITAN_COUNT];
+	struct device_link *genpd_link[PM_DOMAIN_TITAN_COUNT];
 };
 
 struct camss_camera_interface {
-- 
2.27.0

