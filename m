Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35E1A44DA23
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:14:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234265AbhKKQQ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:16:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234260AbhKKQQ4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:16:56 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 808B6C061766
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:14:06 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id v127so5503856wme.5
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ORLw2txICCosz/rzxeyrC+n3WA+dm3OUgpraV7Iiag0=;
        b=IoaXbGILMaBI89+GG25E7kf6nZfMDj3zoYY91pCH2i6x6BSWpALryhDAXpk0z4lVTl
         5cqaW2GKerZhY92b1SP/j1lrrnOEC0PzCMEooxkz4PHrMJug8ZYHUAagE4Wy2gh6t/h1
         66TKC942oliY9LCnfKmUiRKZ9iquFoKBQ4KJBFhHD6eARWVlxnlxcmWQdtS4ek7lF5y4
         wHniXcchaFbNm94eu033nmgtwJgOJaMTw6hBlWzf+EyT4NEDRe+fdvMHPdYhhKA1CA82
         qtJVe0pKtV4beUTj8gQ8fnjNPCAx+ZZTdAUuJH3gg8qDiOy1HUm407IflQ8jk11PHyhh
         IXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ORLw2txICCosz/rzxeyrC+n3WA+dm3OUgpraV7Iiag0=;
        b=A4y/MgRORDlH9zB7D9dh7E6UiW/kNq+phjH5K6PVuXNw24Gd94lDK4GnmbNxUjvt2F
         wYcKmgGNqFCvqSjA1aKFV5qw7lapQrS8k2v7IeDp7w8RS5iD3LcKqOmgQ9f0SBrJ3M4S
         T0VH0voc4LBN9/Ttq9oE9N3rWXZvXawdgYySBDQQvPvQlTNmmq68TJoxRgMbQ301HOf9
         z7GonyleC5le5i8H60yNgJj56Lh0cShf4/t+ZU77cYoe8ZaLakJbQf8GGRUzRv5G3DQ5
         7WaAbcG71uIXvualCViGgjWhM1Vz6U4XSmykdWtWGsxOMP7TH7sRaVnN70DX7z1XkwJJ
         OBoQ==
X-Gm-Message-State: AOAM532DpMlnJu3nVcdlce+cjAdjgtjAcDjEY2uy3umaUUcd1skOmMgg
        ibw2HTIvRpE/UqmTzCXlNAx05A==
X-Google-Smtp-Source: ABdhPJwCLjmJH7degpBeSvh+/j8POslXgAO4cV6CChQui9LMHMiTzySN/7jtmomJfq7lOec24SOYsw==
X-Received: by 2002:a1c:7ed3:: with SMTP id z202mr9278966wmc.110.1636647245065;
        Thu, 11 Nov 2021 08:14:05 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o1sm3441451wrn.63.2021.11.11.08.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:14:04 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH 17/18] media: camss: Add SM8250 bandwdith configuration support
Date:   Thu, 11 Nov 2021 16:15:41 +0000
Message-Id: <20211111161542.3936425-18-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
References: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
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

