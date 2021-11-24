Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9C345CBA3
	for <lists+linux-media@lfdr.de>; Wed, 24 Nov 2021 18:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350110AbhKXSAt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Nov 2021 13:00:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350112AbhKXSAs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Nov 2021 13:00:48 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53EFBC061574
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 09:57:38 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id o19-20020a1c7513000000b0033a93202467so2797087wmc.2
        for <linux-media@vger.kernel.org>; Wed, 24 Nov 2021 09:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kYz3E7PVORTIaf/UdhSwT1/zCSO6K7cYJ65ZDegeuJw=;
        b=EbRum58Yd4NevUekyl1jgbAcBZpuw7i9Bk3zLoOzdtK14n7A+soROYrNYvbpnHBRF4
         nbH0zNQrOPjF5oAxLdp0hUH8segazqVQIOqvwYyZ5rQHCmF3y0LuUuK7yHnq9kDh3yKk
         EO7dbhtzPapAqeY1l3MSPb0NDVLrNnAecTdvwEoXu9s7GB+USfA0lT08s0nIM3nvXZF8
         vO7cwqXOhLK/fl2+al0zYa9ll0/qWENjnoiKr5AfS6Z3YwIqwiqFbONrK8l3J/xI7PGr
         8I7KLXDUF9XQA5uj9+KMs22jqivgRK/cj6wUvHLt1dMYx7lb6uomlYZTbxzhX6XutrxU
         l/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kYz3E7PVORTIaf/UdhSwT1/zCSO6K7cYJ65ZDegeuJw=;
        b=MMGJ9B8Rv6IZ4RqOsDuCh9MKltYsU75zRgnn3XQ9m8fHT6mmG8gCio4XtpXHCm9zzA
         PXFA14fZnFqMgpIl7S7R5JXtEyUjcwTff2zxDF8TR8PeQvbO2IiSXod67D/Asz3jCZAO
         H0rA8ZJFzCEnWIcT/VmrKCOLwUROBeZ4hpoUeCrnvIfWOem8gexf6zJE9Mi0CqF7aZgH
         aHGbBDvjmMRSGQVzeNz+Ub+QBwe560QKrFoR+wLMCdwQUC/QIK6ELyxppztiKMm6VnCP
         rXcvERCM5tHAVn+rltQtbBN+b3y21INzBxqdfQ9L6/DdPr2xPkmQPUdJskyYYZm3ojJD
         hSiQ==
X-Gm-Message-State: AOAM532NkzI6ZILf0TO2KirbE5cO60JxuMb0lGLeOw8K1TuqTs2ignkX
        9gElyWcvvL2IcfpoZpl1rvlNFw==
X-Google-Smtp-Source: ABdhPJyenib1UQ2nmv4ekM9ANKSizbi674NWYXO9CBwfMRwhUrHN2KG6G6mJwxRnzT2BaZEZr6NXiA==
X-Received: by 2002:a05:600c:1e06:: with SMTP id ay6mr18929231wmb.64.1637776656945;
        Wed, 24 Nov 2021 09:57:36 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s24sm380576wmj.26.2021.11.24.09.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 09:57:36 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH v2 17/19] media: camss: Add SM8250 bandwdith configuration support
Date:   Wed, 24 Nov 2021 17:59:19 +0000
Message-Id: <20211124175921.1048375-18-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
References: <20211124175921.1048375-1-bryan.odonoghue@linaro.org>
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

Tested-by: Julian Grahsl <jgrahsl@snap.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 81 +++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h | 17 +++++
 2 files changed, 98 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 066639db9f18..d9905e737d88 100644
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
@@ -841,6 +842,29 @@ static const struct resources vfe_res_8250[] = {
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
@@ -1470,6 +1494,29 @@ static int camss_configure_pd(struct camss *camss)
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
@@ -1562,6 +1609,10 @@ static int camss_probe(struct platform_device *pdev)
 		goto err_cleanup;
 	}
 
+	ret = camss_icc_get(camss);
+	if (ret < 0)
+		goto err_cleanup;
+
 	ret = camss_init_subdevices(camss);
 	if (ret < 0)
 		goto err_cleanup;
@@ -1695,11 +1746,41 @@ MODULE_DEVICE_TABLE(of, camss_dt_match);
 
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

