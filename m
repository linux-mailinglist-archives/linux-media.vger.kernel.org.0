Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1FA944D9F2
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:09:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234188AbhKKQLz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:11:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234197AbhKKQLw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:11:52 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9012C061205
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:09:02 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id d72-20020a1c1d4b000000b00331140f3dc8so4779736wmd.1
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ORLw2txICCosz/rzxeyrC+n3WA+dm3OUgpraV7Iiag0=;
        b=CzFvGTsI+IYerfEc0GpUA05HCLX3pHGYxv+30NQRgYGrJZuHiP6TobQXqeAvq4qEQx
         lNdjSDI4Yeo5q/WgnRISIeyFlFjUtcPVhj6FmTyUTzcYGa4hmoxZixnGnbsIWuo63lFB
         p5gik1qK12mx6EjR2az5OnUNP443RaUXdaD1QL0U6gfUZFPcwBHWEUCZmElvvJh8PH+o
         Nzi6u5/IALlmoR4tZuMSp3L8d45XcB9OjBwXTh0OCag6r80SEhxDZ9cRsegD0VjlsJn6
         7735c+txl2XOKdxCP4+VZSBfYYCDOVrpVwkvX29msowSOM6+lxkSyRq7Q4UO21krhf5j
         VknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ORLw2txICCosz/rzxeyrC+n3WA+dm3OUgpraV7Iiag0=;
        b=taWlGEXnH4k921fL+Drt2Ab7sEYHXPcag5fOT6xDHL7qkyphpnjF2vOmTmkLFLbBvc
         l3e+J78MdZD8ubW7FHLCfnWws8bX0dvZpuzsBZG8eyRnuNhP3VYIOBSgChczj1A/d0Ks
         Ydd2NRi0H6ko7PuW42l2ezzFIs/xcwQQhGpWlspfArp1URzTqoT/Fg3xprwH3zIwjcpU
         5SvEbC08rjz6ArWJ84rc25Li8MvrBMMxKHdJ6tt7LCHbMhuoe4kdk31W1MGAF6lBmY9N
         K9Nt28TUY4rTJ4/Ae4B90qh4drYoROe8ANU7/1ShyhGjKX22W3FojzwgmQIW8Z8LALcj
         x53w==
X-Gm-Message-State: AOAM531Qbk3BtRMBUe2xk/36xMXCOWv+/ai5TWxj05/4hzd1jGEXOBDC
        AzZfWKTNn6dYWJsVdS3J+N4pEw==
X-Google-Smtp-Source: ABdhPJxPIMyl7kjaAsVUzQ8fKW0NV56ssbNTPmKyj8gaHX9PY5Qdb318oqRmZKD350aQFhpM3S1Pqg==
X-Received: by 2002:a05:600c:3227:: with SMTP id r39mr28383138wmp.120.1636646940697;
        Thu, 11 Nov 2021 08:09:00 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x8sm3245558wrw.6.2021.11.11.08.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:08:59 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     inux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH 17/18] media: camss: Add SM8250 bandwdith configuration support
Date:   Thu, 11 Nov 2021 16:10:37 +0000
Message-Id: <20211111161038.3936217-18-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
References: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Downstream makes some pretty explicit comments about voting for bus
bandwidth prior to camcc_camnoc_axi_clk_src. Working with camx downstream
also shows that the bandwidth vote is required to get that root clock
working.

Add a simple mechanism to declare set and unset named NOCs. Whereas the
objective is to enable the sm8250 specifically the code has been
implemented to allow setting of whatever NOCs different SoCs using this
driver may require.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 81 +++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h | 17 +++++
 2 files changed, 98 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 06fb38ff95f7..25bc3bb01dc1 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2015-2018 Linaro Ltd.
  */
 #include <linux/clk.h>
+#include <linux/interconnect.h>
 #include <linux/media-bus-format.h>
 #include <linux/media.h>
 #include <linux/module.h>
@@ -833,6 +834,29 @@ static const struct resources vfe_res_8250[] = {
 	},
 };
 
+static const struct resources_icc icc_res_sm8250[] = {
+	{
+		.name = "cam_ahb",
+		.icc_bw_tbl.avg = 38400,
+		.icc_bw_tbl.peak = 76800,
+	},
+	{
+		.name = "cam_hf_0_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+	{
+		.name = "cam_sf_0_mnoc",
+		.icc_bw_tbl.avg = 0,
+		.icc_bw_tbl.peak = 2097152,
+	},
+	{
+		.name = "cam_sf_icp_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 /*
  * camss_add_clock_margin - Add margin to clock frequency rate
  * @rate: Clock frequency rate
@@ -1462,6 +1486,29 @@ static int camss_configure_pd(struct camss *camss)
 	return ret;
 }
 
+static int camss_icc_get(struct camss *camss)
+{
+	const struct resources_icc *icc_res;
+	int nbr_icc_paths = 0;
+	int i;
+
+	if (camss->version == CAMSS_8250) {
+		icc_res = &icc_res_sm8250[0];
+		nbr_icc_paths =	ICC_SM8250_COUNT;
+	}
+
+	for (i = 0; i < nbr_icc_paths; i++) {
+		camss->icc_path[i] = devm_of_icc_get(camss->dev,
+						     icc_res[i].name);
+		if (IS_ERR(camss->icc_path[i]))
+			return PTR_ERR(camss->icc_path[i]);
+
+		camss->icc_bw_tbl[i] = icc_res[i].icc_bw_tbl;
+	}
+
+	return 0;
+}
+
 /*
  * camss_probe - Probe CAMSS platform device
  * @pdev: Pointer to CAMSS platform device
@@ -1554,6 +1601,10 @@ static int camss_probe(struct platform_device *pdev)
 		goto err_cleanup;
 	}
 
+	ret = camss_icc_get(camss);
+	if (ret < 0)
+		goto err_cleanup;
+
 	ret = camss_init_subdevices(camss);
 	if (ret < 0)
 		goto err_cleanup;
@@ -1687,11 +1738,41 @@ MODULE_DEVICE_TABLE(of, camss_dt_match);
 
 static int __maybe_unused camss_runtime_suspend(struct device *dev)
 {
+	struct camss *camss = dev_get_drvdata(dev);
+	int nbr_icc_paths = 0;
+	int i;
+	int ret;
+
+	if (camss->version == CAMSS_8250)
+		nbr_icc_paths =	ICC_SM8250_COUNT;
+
+	for (i = 0; i < nbr_icc_paths; i++) {
+		ret = icc_set_bw(camss->icc_path[i], 0, 0);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
 static int __maybe_unused camss_runtime_resume(struct device *dev)
 {
+	struct camss *camss = dev_get_drvdata(dev);
+	int nbr_icc_paths = 0;
+	int i;
+	int ret;
+
+	if (camss->version == CAMSS_8250)
+		nbr_icc_paths =	ICC_SM8250_COUNT;
+
+	for (i = 0; i < nbr_icc_paths; i++) {
+		ret = icc_set_bw(camss->icc_path[i],
+				 camss->icc_bw_tbl[i].avg,
+				 camss->icc_bw_tbl[i].peak);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 377e2474a485..9c644e638a94 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -56,6 +56,16 @@ struct resources_ispif {
 	char *interrupt;
 };
 
+struct icc_bw_tbl {
+	u32 avg;
+	u32 peak;
+};
+
+struct resources_icc {
+	char *name;
+	struct icc_bw_tbl icc_bw_tbl;
+};
+
 enum pm_domain {
 	PM_DOMAIN_VFE0 = 0,
 	PM_DOMAIN_VFE1 = 1,
@@ -72,6 +82,11 @@ enum camss_version {
 	CAMSS_8250,
 };
 
+enum icc_count {
+	ICC_DEFAULT_COUNT = 0,
+	ICC_SM8250_COUNT = 4,
+};
+
 struct camss {
 	enum camss_version version;
 	struct v4l2_device v4l2_dev;
@@ -88,6 +103,8 @@ struct camss {
 	atomic_t ref_count;
 	struct device *genpd[PM_DOMAIN_GEN2_COUNT];
 	struct device_link *genpd_link[PM_DOMAIN_GEN2_COUNT];
+	struct icc_path *icc_path[ICC_SM8250_COUNT];
+	struct icc_bw_tbl icc_bw_tbl[ICC_SM8250_COUNT];
 };
 
 struct camss_camera_interface {
-- 
2.33.0

