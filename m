Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82BA977F942
	for <lists+linux-media@lfdr.de>; Thu, 17 Aug 2023 16:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352045AbjHQOip (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Aug 2023 10:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352015AbjHQOiV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Aug 2023 10:38:21 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B8B2D74
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 07:38:19 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fe1e1142caso76453585e9.0
        for <linux-media@vger.kernel.org>; Thu, 17 Aug 2023 07:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692283098; x=1692887898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xK+anDaOi9G+3xMzqH/Q4SxzjFpnwN5RbVO/vL2COzw=;
        b=p5UwUdzpHrr9TIewviV4Muh++o/dw36i4vQVm2lCxkMXkm8Pg93dXALWOS/1mLYw1z
         wAyZ7AjU+BHFf8VPWLgLfydh/NLgY26sZBwSAwos7AS3ula9l7g/2LLIS7mmYnpRiigM
         A1y5h1H3GxVbLNUl3J7hK7Bbr9O1R0j9WdxK8TamjCdMdfZupwApbNuFF2mX6J2wd9S5
         4XIttdke6azD7MUANOJCOZ2SgsRurbnO+7agMPPqrWr+1mcCgbRSC1VRjwK83rj4RlzM
         7BMP1YCvXXgb4Msa6CoirTGSd0FN/Nt0032qy9gp4I/jQgmxMvNjpNyCyyD39YAA9j8l
         TMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692283098; x=1692887898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xK+anDaOi9G+3xMzqH/Q4SxzjFpnwN5RbVO/vL2COzw=;
        b=jGynf86VkB3F2OID/NJKgMOZkzRnm0smjneM9eTfRTmKrJ6hhwwcZ8GqKM4dF0YQPm
         onPBVuFS9VV0hVd0752NVyA4e7SW69iCg230PCgu9QLrOAmQxU0Vb0ouObdshs4hHti7
         948XTtZDdlTlgCBlexDTQWmPpSjYnIWBhmWf/SOv08MeIQZfs/WP2KQ4U/AAXDaQJ0hO
         BPDNs0+jVZge9+os8aBZhdThk/twkyVkeqBpGEiTqNFKaYf/Flgb34vAQiCb+HWmR0wW
         HteUOmAyb5WZaXHfrpxg8kUvN7Aco/ejYtVamjWL5QQ75q6JyuYB2J7dQWzB+4388wVQ
         IfdA==
X-Gm-Message-State: AOJu0YxDZXtUJ/rV/EEyoXftkKpVJfpJ4v3CFOLK3kWQdbKv6SU+Hirj
        ZLTQwRhHuzf3l3ypH0R4U6Z9LA==
X-Google-Smtp-Source: AGHT+IF+sig/oPJGgjXAGOYEloCZEbsLiSxmEIGKqN/B9fmBs2dCN3abvTnvXYWzeyJoeWQgvm2KRQ==
X-Received: by 2002:a05:600c:1d06:b0:3fe:26bf:65ea with SMTP id l6-20020a05600c1d0600b003fe26bf65eamr4317133wms.29.1692283098040;
        Thu, 17 Aug 2023 07:38:18 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id i8-20020a5d4388000000b0030647449730sm25218232wrq.74.2023.08.17.07.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 07:38:17 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/13] media: qcom: camss: Start to move to module compat matched resources
Date:   Thu, 17 Aug 2023 15:38:01 +0100
Message-ID: <20230817143812.677554-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817143812.677554-1-bryan.odonoghue@linaro.org>
References: <20230817143812.677554-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a lot of unnecessary if/elsing in this code that arguably
should never have made it upstream when adding a second let alone
subsequent SoC.

I'm guilty of not fixing the mess myself when adding in the sm8250.
Before adding in any new SoCs or resources lets take the time to cleanup
the resource passing.

First step is to pass the generic struct camss_resources as a parameter
per the compatible list.

Subsequent patches will address the other somewhat dispirate strutures
which we are also doing if/else on and assigning statically.

Squashed down a commit to drop useless NULL assignment for ispif resources.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 92 ++++++++++++-----------
 drivers/media/platform/qcom/camss/camss.h |  8 ++
 2 files changed, 56 insertions(+), 44 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index de39dc987444f..2f9d5ad303951 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_graph.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_domain.h>
@@ -1120,47 +1121,13 @@ static int camss_of_parse_ports(struct camss *camss)
  */
 static int camss_init_subdevices(struct camss *camss)
 {
-	const struct resources *csiphy_res;
-	const struct resources *csid_res;
-	const struct resources *ispif_res;
-	const struct resources *vfe_res;
+	const struct camss_resources *res = &camss->res;
 	unsigned int i;
 	int ret;
 
-	if (camss->version == CAMSS_8x16) {
-		csiphy_res = csiphy_res_8x16;
-		csid_res = csid_res_8x16;
-		ispif_res = &ispif_res_8x16;
-		vfe_res = vfe_res_8x16;
-	} else if (camss->version == CAMSS_8x96) {
-		csiphy_res = csiphy_res_8x96;
-		csid_res = csid_res_8x96;
-		ispif_res = &ispif_res_8x96;
-		vfe_res = vfe_res_8x96;
-	} else if (camss->version == CAMSS_660) {
-		csiphy_res = csiphy_res_660;
-		csid_res = csid_res_660;
-		ispif_res = &ispif_res_660;
-		vfe_res = vfe_res_660;
-	}  else if (camss->version == CAMSS_845) {
-		csiphy_res = csiphy_res_845;
-		csid_res = csid_res_845;
-		/* Titan VFEs don't have an ISPIF  */
-		ispif_res = NULL;
-		vfe_res = vfe_res_845;
-	} else if (camss->version == CAMSS_8250) {
-		csiphy_res = csiphy_res_8250;
-		csid_res = csid_res_8250;
-		/* Titan VFEs don't have an ISPIF  */
-		ispif_res = NULL;
-		vfe_res = vfe_res_8250;
-	} else {
-		return -EINVAL;
-	}
-
 	for (i = 0; i < camss->csiphy_num; i++) {
 		ret = msm_csiphy_subdev_init(camss, &camss->csiphy[i],
-					     &csiphy_res[i], i);
+					     res->csiphy_res[i], i);
 		if (ret < 0) {
 			dev_err(camss->dev,
 				"Failed to init csiphy%d sub-device: %d\n",
@@ -1172,7 +1139,7 @@ static int camss_init_subdevices(struct camss *camss)
 	/* note: SM8250 requires VFE to be initialized before CSID */
 	for (i = 0; i < camss->vfe_num + camss->vfe_lite_num; i++) {
 		ret = msm_vfe_subdev_init(camss, &camss->vfe[i],
-					  &vfe_res[i], i);
+					  res->vfe_res[i], i);
 		if (ret < 0) {
 			dev_err(camss->dev,
 				"Fail to init vfe%d sub-device: %d\n", i, ret);
@@ -1182,7 +1149,7 @@ static int camss_init_subdevices(struct camss *camss)
 
 	for (i = 0; i < camss->csid_num; i++) {
 		ret = msm_csid_subdev_init(camss, &camss->csid[i],
-					   &csid_res[i], i);
+					   res->csid_res[i], i);
 		if (ret < 0) {
 			dev_err(camss->dev,
 				"Failed to init csid%d sub-device: %d\n",
@@ -1191,7 +1158,7 @@ static int camss_init_subdevices(struct camss *camss)
 		}
 	}
 
-	ret = msm_ispif_subdev_init(camss, ispif_res);
+	ret = msm_ispif_subdev_init(camss, camss->res->ispif_res);
 	if (ret < 0) {
 		dev_err(camss->dev, "Failed to init ispif sub-device: %d\n",
 		ret);
@@ -1554,6 +1521,10 @@ static int camss_probe(struct platform_device *pdev)
 	if (!camss)
 		return -ENOMEM;
 
+	camss->res = of_device_get_match_data(dev);
+	if (!camss->res)
+		return -ENODEV;
+
 	atomic_set(&camss->ref_count, 0);
 	camss->dev = dev;
 	platform_set_drvdata(pdev, camss);
@@ -1735,12 +1706,45 @@ static void camss_remove(struct platform_device *pdev)
 		camss_delete(camss);
 }
 
+static const struct camss_resources msm8916_resources = {
+	.csiphy_res = csiphy_res_8x16,
+	.csid_res = csid_res_8x16,
+	.ispif_res = &ispif_res_8x16,
+	.vfe_res = vfe_res_8x16,
+};
+
+static const struct camss_resources msm8996_resources = {
+	.csiphy_res = csiphy_res_8x96,
+	.csid_res = csid_res_8x96,
+	.ispif_res = &ispif_res_8x96,
+	.vfe_res = vfe_res_8x96,
+};
+
+static const struct camss_resources sdm660_resources = {
+	.csiphy_res = csiphy_res_660,
+	.csid_res = csid_res_660,
+	.ispif_res = &ispif_res_660,
+	.vfe_res = vfe_res_660,
+};
+
+static const struct camss_resources sdm845_resources = {
+	.csiphy_res = csiphy_res_845,
+	.csid_res = csid_res_845,
+	.vfe_res = vfe_res_845,
+};
+
+static const struct camss_resources sm8250_resources = {
+	.csiphy_res = csiphy_res_8250,
+	.csid_res = csid_res_8250,
+	.vfe_res = vfe_res_8250,
+};
+
 static const struct of_device_id camss_dt_match[] = {
-	{ .compatible = "qcom,msm8916-camss" },
-	{ .compatible = "qcom,msm8996-camss" },
-	{ .compatible = "qcom,sdm660-camss" },
-	{ .compatible = "qcom,sdm845-camss" },
-	{ .compatible = "qcom,sm8250-camss" },
+	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
+	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
+	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
+	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
+	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ }
 };
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index e95211cdb1fd6..f632ee49ad83e 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -79,6 +79,13 @@ enum icc_count {
 	ICC_SM8250_COUNT = 4,
 };
 
+struct camss_resources {
+	const struct resources *csiphy_res;
+	const struct resources *csid_res;
+	const struct resources *ispif_res;
+	const struct resources *vfe_res;
+};
+
 struct camss {
 	enum camss_version version;
 	struct v4l2_device v4l2_dev;
@@ -99,6 +106,7 @@ struct camss {
 	struct device_link **genpd_link;
 	struct icc_path *icc_path[ICC_SM8250_COUNT];
 	struct icc_bw_tbl icc_bw_tbl[ICC_SM8250_COUNT];
+	const struct camss_resources *res;
 };
 
 struct camss_camera_interface {
-- 
2.41.0

