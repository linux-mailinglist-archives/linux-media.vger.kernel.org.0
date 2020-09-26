Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BDC9279927
	for <lists+linux-media@lfdr.de>; Sat, 26 Sep 2020 14:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729264AbgIZMyZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 26 Sep 2020 08:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729142AbgIZMyY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 26 Sep 2020 08:54:24 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 669F7C0613CE;
        Sat, 26 Sep 2020 05:54:24 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id t10so6898818wrv.1;
        Sat, 26 Sep 2020 05:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2yuFHQxYU7X+/jwAU5Mqv0bAxsGtJszTiZjuuO38mxA=;
        b=YyKT0lS9cNa9ntriA9A8g7C9fnSnwrjrBaz0jAllfmk1bMJVlgsqsqLYPInl45PHNk
         YwqqHzF68qTrK9QtQUiGN1Gdbet5eC8K9uz5GyjM+CuCSXo8j6F1WOZLRkV2ldwIFe2n
         oqGPDxujWBEvpwfYldefOj3vrsDZVHxfgEt0w9fE0PirtkwkUkpNYFatR+mtG7YSvwLK
         f0ys5AQDePb9kdO91NyNwAU43rtlVS+luU/C1PI+nbI+sRvTw0TR3zvgf9WIKAKsq+c3
         YALWik+aDEV+iJUFy21NHtSclcrrHLhirA/Jmg+jboTupxGpVDCWKrCcHAAlmWK7WVEb
         3JCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2yuFHQxYU7X+/jwAU5Mqv0bAxsGtJszTiZjuuO38mxA=;
        b=WZUDUDStCR+3zv+TxXYKOQfcfhlyGKv1LdWNWfkoUILuSbGWa3LMmWO1B8OWIsLi3w
         AyGn4h/YHWHkPr2EYGBScCzEoaeE4RlD4c6TTeBQgjaSgEjyAlXUDYKk2N/OM18OKHs9
         oP0aQTN0QVVOWah+RpEOLrcVtXj7Ahd9gFS6DYJaI9oWgBd++LvWiMrxSy6pNCuZNQr8
         dtveVq7XIiPIZHfdrrtYKsxSbbcLkWRt2KJf3VNvc2kUp7kr6N1JCueaxbyopgaNinCV
         PXCPkm86MF12bzWJCETVtPA28YvNeSrA8E2C/YEEER2o7FeGKWmiInKiZR4Yh5A/BSBU
         13xg==
X-Gm-Message-State: AOAM531orVJo/zkZxl8ShO41BHYyZVXtd9d6RMMKRfp8jv+QrCDDnt5O
        vSHsav+A7aIjsjf0mQGjkVk=
X-Google-Smtp-Source: ABdhPJz4eKrXkXMYHczvdkfXDqCrXegbRSnVMDbRMbj5UTHrSHOcXEtY5nRmwyd8rJ1Mw9+clTbrKA==
X-Received: by 2002:a5d:5307:: with SMTP id e7mr9288761wrv.215.1601124862862;
        Sat, 26 Sep 2020 05:54:22 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id 70sm2617707wmb.41.2020.09.26.05.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:54:22 -0700 (PDT)
From:   kholk11@gmail.com
To:     stanimir.varbanov@linaro.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-media@vger.kernel.org, kholk11@gmail.com,
        marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] media: venus: pm_helper: Commonize v3/v4 pmdomains and clocks management
Date:   Sat, 26 Sep 2020 14:54:10 +0200
Message-Id: <20200926125412.13024-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926125412.13024-1-kholk11@gmail.com>
References: <20200926125412.13024-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Most of the SoCs that are featuring Venus HFI3 also need to scale the
clocks and also need to bringup power domains, very very similarly to
SoCs (like SDM845 and SC7180) featuring HFI4 Venus, which has *yes*
differences, but not in that specific "field".

So, reduce code duplication (most v3 functions are a subset of v4),
achieve better power consumption and slightly simplify the code by
merging the v3 and v4 functions that are responsible for bringing
up and tearing down clocks and pm domains.

While at it, also add a small quirk to the video encoder functions:
since not all SoCs have got two (or more) vcodec instances, it is
incorrect to *always* manage vcodec1_clks (and itsrelative pmdomain)
there.
To get video encoders working fine - and to avoid duplicating clocks
and pmdomains declarations between vcodec0 and 1 - check for the
number of vcodecs and currently assume that:
  1. If Venus has only one vcodec (vcodec_num), then we use vcodec0
     for both video decoder and encoder;
  2. If it has more than one vcodec, then we use vcodec1 for the
     video encoder and vcodec0 for the decoder.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 .../media/platform/qcom/venus/pm_helpers.c    | 525 +++++++++---------
 1 file changed, 277 insertions(+), 248 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 57877eacecf0..fda480b26636 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -130,6 +130,100 @@ static void vcodec_clks_disable(struct venus_core *core, struct clk **clks)
 		clk_disable_unprepare(clks[i]);
 }
 
+static int vcodec_domains_get(struct device *dev)
+{
+	int ret;
+	struct opp_table *opp_table;
+	struct device **opp_virt_dev;
+	struct venus_core *core = dev_get_drvdata(dev);
+	const struct venus_resources *res = core->res;
+	struct device *pd;
+	unsigned int i;
+
+	if (!res->vcodec_pmdomains_num)
+		goto skip_pmdomains;
+
+	for (i = 0; i < res->vcodec_pmdomains_num; i++) {
+		pd = dev_pm_domain_attach_by_name(dev,
+						  res->vcodec_pmdomains[i]);
+		if (IS_ERR(pd))
+			return PTR_ERR(pd);
+		core->pmdomains[i] = pd;
+	}
+
+	core->pd_dl_venus = device_link_add(dev, core->pmdomains[0],
+					    DL_FLAG_PM_RUNTIME |
+					    DL_FLAG_STATELESS |
+					    DL_FLAG_RPM_ACTIVE);
+	if (!core->pd_dl_venus)
+		return -ENODEV;
+
+skip_pmdomains:
+	if (!core->has_opp_table)
+		return 0;
+
+	/* Attach the power domain for setting performance state */
+	opp_table = dev_pm_opp_attach_genpd(dev, res->opp_pmdomain, &opp_virt_dev);
+	if (IS_ERR(opp_table)) {
+		ret = PTR_ERR(opp_table);
+		goto opp_attach_err;
+	}
+
+	core->opp_pmdomain = *opp_virt_dev;
+	core->opp_dl_venus = device_link_add(dev, core->opp_pmdomain,
+					     DL_FLAG_RPM_ACTIVE |
+					     DL_FLAG_PM_RUNTIME |
+					     DL_FLAG_STATELESS);
+	if (!core->opp_dl_venus) {
+		ret = -ENODEV;
+		goto opp_dl_add_err;
+	}
+
+	return 0;
+
+opp_dl_add_err:
+	dev_pm_domain_detach(core->opp_pmdomain, true);
+opp_attach_err:
+	if (core->pd_dl_venus) {
+		device_link_del(core->pd_dl_venus);
+		for (i = 0; i < res->vcodec_pmdomains_num; i++) {
+			if (IS_ERR_OR_NULL(core->pmdomains[i]))
+				continue;
+			dev_pm_domain_detach(core->pmdomains[i], true);
+		}
+	}
+	return ret;
+}
+
+static void vcodec_domains_put(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	const struct venus_resources *res = core->res;
+	unsigned int i;
+
+	if (!res->vcodec_pmdomains_num)
+		goto skip_pmdomains;
+
+	if (core->pd_dl_venus)
+		device_link_del(core->pd_dl_venus);
+
+	for (i = 0; i < res->vcodec_pmdomains_num; i++) {
+		if (IS_ERR_OR_NULL(core->pmdomains[i]))
+			continue;
+		dev_pm_domain_detach(core->pmdomains[i], true);
+	}
+
+skip_pmdomains:
+	if (!core->has_opp_table)
+		return;
+
+	if (core->opp_dl_venus)
+		device_link_del(core->opp_dl_venus);
+
+	dev_pm_domain_detach(core->opp_pmdomain, true);
+}
+
+
 static u32 load_per_instance(struct venus_inst *inst)
 {
 	u32 mbs;
@@ -308,19 +402,17 @@ vcodec_control_v3(struct venus_core *core, u32 session_type, bool enable)
 		writel(1, ctrl);
 }
 
-static int vdec_get_v3(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-
-	return vcodec_clks_get(core, dev, core->vcodec0_clks,
-			       core->res->vcodec0_clks);
-}
-
 static int vdec_power_v3(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
 	int ret = 0;
 
+	if (!legacy_binding && on == POWER_ON) {
+		ret = pm_runtime_get_sync(core->pmdomains[1]);
+		if (ret < 0)
+			return ret;
+	}
+
 	vcodec_control_v3(core, VIDC_SESSION_TYPE_DEC, true);
 
 	if (on == POWER_ON)
@@ -330,40 +422,202 @@ static int vdec_power_v3(struct device *dev, int on)
 
 	vcodec_control_v3(core, VIDC_SESSION_TYPE_DEC, false);
 
-	return ret;
-}
-
-static int venc_get_v3(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
+	if (!legacy_binding && on == POWER_OFF) {
+		ret = pm_runtime_put_sync(core->pmdomains[1]);
+		if (ret < 0)
+			return ret;
+	}
 
-	return vcodec_clks_get(core, dev, core->vcodec1_clks,
-			       core->res->vcodec1_clks);
+	return ret;
 }
 
 static int venc_power_v3(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
-	int ret = 0;
+	const struct venus_resources *res = core->res;
+	struct clk **vcodec_clks;
+	int idx, ret = 0;
+
+	/*
+	 * Some SoCs have got only one vcodec instance and all of them
+	 * have got one global and one pmdomain per instance.
+	 */
+	if (res->vcodec_num > 1) {
+		vcodec_clks = core->vcodec1_clks;
+		idx = 2;
+	} else {
+		vcodec_clks = core->vcodec0_clks;
+		idx = 1;
+	}
+
+	if (!legacy_binding && on == POWER_ON) {
+		ret = pm_runtime_get_sync(core->pmdomains[idx]);
+		if (ret < 0)
+			return ret;
+	}
 
 	vcodec_control_v3(core, VIDC_SESSION_TYPE_ENC, true);
 
 	if (on == POWER_ON)
-		ret = vcodec_clks_enable(core, core->vcodec1_clks);
+		ret = vcodec_clks_enable(core, vcodec_clks);
 	else
-		vcodec_clks_disable(core, core->vcodec1_clks);
+		vcodec_clks_disable(core, vcodec_clks);
 
 	vcodec_control_v3(core, VIDC_SESSION_TYPE_ENC, false);
 
+	if (!legacy_binding && on == POWER_OFF) {
+		ret = pm_runtime_put_sync(core->pmdomains[idx]);
+		if (ret < 0)
+			return ret;
+	}
+
+	return ret;
+}
+
+static int core_get_v4(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	const struct venus_resources *res = core->res;
+	int ret;
+
+	ret = core_clks_get(core);
+	if (ret)
+		return ret;
+
+	if (!res->vcodec_pmdomains_num)
+		legacy_binding = true;
+
+	dev_info(dev, "%s legacy binding\n", legacy_binding ? "" : "non");
+
+	ret = vcodec_clks_get(core, dev, core->vcodec0_clks, res->vcodec0_clks);
+	if (ret)
+		return ret;
+
+	if (core->vcodec1_clks) {
+		ret = vcodec_clks_get(core, dev,
+				      core->vcodec1_clks, res->vcodec1_clks);
+		if (ret)
+			return ret;
+	}
+
+	if (legacy_binding)
+		return 0;
+
+	core->opp_table = dev_pm_opp_set_clkname(dev, "core");
+	if (IS_ERR(core->opp_table))
+		return PTR_ERR(core->opp_table);
+
+	if (core->res->opp_pmdomain) {
+		ret = dev_pm_opp_of_add_table(dev);
+		if (!ret) {
+			core->has_opp_table = true;
+		} else if (ret != -ENODEV) {
+			dev_err(dev, "invalid OPP table in device tree\n");
+			dev_pm_opp_put_clkname(core->opp_table);
+			return ret;
+		}
+	}
+
+	ret = vcodec_domains_get(dev);
+	if (ret) {
+		if (core->has_opp_table)
+			dev_pm_opp_of_remove_table(dev);
+		dev_pm_opp_put_clkname(core->opp_table);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void core_put_v4(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	if (legacy_binding)
+		return;
+
+	vcodec_domains_put(dev);
+
+	if (core->has_opp_table)
+		dev_pm_opp_of_remove_table(dev);
+	if (core->opp_table)
+		dev_pm_opp_put_clkname(core->opp_table);
+
+}
+
+static int core_power_v4(struct device *dev, int on)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (on == POWER_ON) {
+		ret = core_clks_enable(core);
+	} else {
+		/* Drop the performance state vote */
+		if (core->opp_pmdomain)
+			dev_pm_opp_set_rate(dev, 0);
+
+		core_clks_disable(core);
+	}
+
 	return ret;
 }
 
+static int vdec_get_v4(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	if (!legacy_binding)
+		return 0;
+
+	return vcodec_clks_get(core, dev, core->vcodec0_clks,
+			       core->res->vcodec0_clks);
+}
+
+static void vdec_put_v4(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	unsigned int i;
+
+	if (!legacy_binding)
+		return;
+
+	for (i = 0; i < core->res->vcodec_clks_num; i++)
+		core->vcodec0_clks[i] = NULL;
+}
+
+static int venc_get_v4(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+
+	if (!legacy_binding)
+		return 0;
+
+	return vcodec_clks_get(core, dev, core->vcodec1_clks,
+			       core->res->vcodec1_clks);
+}
+
+static void venc_put_v4(struct device *dev)
+{
+	struct venus_core *core = dev_get_drvdata(dev);
+	unsigned int i;
+
+	if (!legacy_binding)
+		return;
+
+	for (i = 0; i < core->res->vcodec_clks_num; i++)
+		core->vcodec1_clks[i] = NULL;
+}
+
 static const struct venus_pm_ops pm_ops_v3 = {
-	.core_get = core_get_v1,
-	.core_power = core_power_v1,
-	.vdec_get = vdec_get_v3,
+	.core_get = core_get_v4,
+	.core_put = core_put_v4,
+	.core_power = core_power_v4,
+	.vdec_get = vdec_get_v4,
+	.vdec_put = vdec_put_v4,
 	.vdec_power = vdec_power_v3,
-	.venc_get = venc_get_v3,
+	.venc_get = venc_get_v4,
+	.venc_put = venc_put_v4,
 	.venc_power = venc_power_v3,
 	.load_scale = load_scale_v1,
 };
@@ -652,29 +906,6 @@ static int coreid_power_v4(struct venus_inst *inst, int on)
 	return ret;
 }
 
-static int vdec_get_v4(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-
-	if (!legacy_binding)
-		return 0;
-
-	return vcodec_clks_get(core, dev, core->vcodec0_clks,
-			       core->res->vcodec0_clks);
-}
-
-static void vdec_put_v4(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-	unsigned int i;
-
-	if (!legacy_binding)
-		return;
-
-	for (i = 0; i < core->res->vcodec_clks_num; i++)
-		core->vcodec0_clks[i] = NULL;
-}
-
 static int vdec_power_v4(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
@@ -697,29 +928,6 @@ static int vdec_power_v4(struct device *dev, int on)
 	return ret;
 }
 
-static int venc_get_v4(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-
-	if (!legacy_binding)
-		return 0;
-
-	return vcodec_clks_get(core, dev, core->vcodec1_clks,
-			       core->res->vcodec1_clks);
-}
-
-static void venc_put_v4(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-	unsigned int i;
-
-	if (!legacy_binding)
-		return;
-
-	for (i = 0; i < core->res->vcodec_clks_num; i++)
-		core->vcodec1_clks[i] = NULL;
-}
-
 static int venc_power_v4(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
@@ -742,185 +950,6 @@ static int venc_power_v4(struct device *dev, int on)
 	return ret;
 }
 
-static int vcodec_domains_get(struct device *dev)
-{
-	int ret;
-	struct opp_table *opp_table;
-	struct device **opp_virt_dev;
-	struct venus_core *core = dev_get_drvdata(dev);
-	const struct venus_resources *res = core->res;
-	struct device *pd;
-	unsigned int i;
-
-	if (!res->vcodec_pmdomains_num)
-		goto skip_pmdomains;
-
-	for (i = 0; i < res->vcodec_pmdomains_num; i++) {
-		pd = dev_pm_domain_attach_by_name(dev,
-						  res->vcodec_pmdomains[i]);
-		if (IS_ERR(pd))
-			return PTR_ERR(pd);
-		core->pmdomains[i] = pd;
-	}
-
-	core->pd_dl_venus = device_link_add(dev, core->pmdomains[0],
-					    DL_FLAG_PM_RUNTIME |
-					    DL_FLAG_STATELESS |
-					    DL_FLAG_RPM_ACTIVE);
-	if (!core->pd_dl_venus)
-		return -ENODEV;
-
-skip_pmdomains:
-	if (!core->has_opp_table)
-		return 0;
-
-	/* Attach the power domain for setting performance state */
-	opp_table = dev_pm_opp_attach_genpd(dev, res->opp_pmdomain, &opp_virt_dev);
-	if (IS_ERR(opp_table)) {
-		ret = PTR_ERR(opp_table);
-		goto opp_attach_err;
-	}
-
-	core->opp_pmdomain = *opp_virt_dev;
-	core->opp_dl_venus = device_link_add(dev, core->opp_pmdomain,
-					     DL_FLAG_RPM_ACTIVE |
-					     DL_FLAG_PM_RUNTIME |
-					     DL_FLAG_STATELESS);
-	if (!core->opp_dl_venus) {
-		ret = -ENODEV;
-		goto opp_dl_add_err;
-	}
-
-	return 0;
-
-opp_dl_add_err:
-	dev_pm_domain_detach(core->opp_pmdomain, true);
-opp_attach_err:
-	if (core->pd_dl_venus) {
-		device_link_del(core->pd_dl_venus);
-		for (i = 0; i < res->vcodec_pmdomains_num; i++) {
-			if (IS_ERR_OR_NULL(core->pmdomains[i]))
-				continue;
-			dev_pm_domain_detach(core->pmdomains[i], true);
-		}
-	}
-	return ret;
-}
-
-static void vcodec_domains_put(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-	const struct venus_resources *res = core->res;
-	unsigned int i;
-
-	if (!res->vcodec_pmdomains_num)
-		goto skip_pmdomains;
-
-	if (core->pd_dl_venus)
-		device_link_del(core->pd_dl_venus);
-
-	for (i = 0; i < res->vcodec_pmdomains_num; i++) {
-		if (IS_ERR_OR_NULL(core->pmdomains[i]))
-			continue;
-		dev_pm_domain_detach(core->pmdomains[i], true);
-	}
-
-skip_pmdomains:
-	if (!core->has_opp_table)
-		return;
-
-	if (core->opp_dl_venus)
-		device_link_del(core->opp_dl_venus);
-
-	dev_pm_domain_detach(core->opp_pmdomain, true);
-}
-
-static int core_get_v4(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-	const struct venus_resources *res = core->res;
-	int ret;
-
-	ret = core_clks_get(core);
-	if (ret)
-		return ret;
-
-	if (!res->vcodec_pmdomains_num)
-		legacy_binding = true;
-
-	dev_info(dev, "%s legacy binding\n", legacy_binding ? "" : "non");
-
-	ret = vcodec_clks_get(core, dev, core->vcodec0_clks, res->vcodec0_clks);
-	if (ret)
-		return ret;
-
-	ret = vcodec_clks_get(core, dev, core->vcodec1_clks, res->vcodec1_clks);
-	if (ret)
-		return ret;
-
-	if (legacy_binding)
-		return 0;
-
-	core->opp_table = dev_pm_opp_set_clkname(dev, "core");
-	if (IS_ERR(core->opp_table))
-		return PTR_ERR(core->opp_table);
-
-	if (core->res->opp_pmdomain) {
-		ret = dev_pm_opp_of_add_table(dev);
-		if (!ret) {
-			core->has_opp_table = true;
-		} else if (ret != -ENODEV) {
-			dev_err(dev, "invalid OPP table in device tree\n");
-			dev_pm_opp_put_clkname(core->opp_table);
-			return ret;
-		}
-	}
-
-	ret = vcodec_domains_get(dev);
-	if (ret) {
-		if (core->has_opp_table)
-			dev_pm_opp_of_remove_table(dev);
-		dev_pm_opp_put_clkname(core->opp_table);
-		return ret;
-	}
-
-	return 0;
-}
-
-static void core_put_v4(struct device *dev)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-
-	if (legacy_binding)
-		return;
-
-	vcodec_domains_put(dev);
-
-	if (core->has_opp_table)
-		dev_pm_opp_of_remove_table(dev);
-	if (core->opp_table)
-		dev_pm_opp_put_clkname(core->opp_table);
-
-}
-
-static int core_power_v4(struct device *dev, int on)
-{
-	struct venus_core *core = dev_get_drvdata(dev);
-	int ret = 0;
-
-	if (on == POWER_ON) {
-		ret = core_clks_enable(core);
-	} else {
-		/* Drop the performance state vote */
-		if (core->opp_pmdomain)
-			dev_pm_opp_set_rate(dev, 0);
-
-		core_clks_disable(core);
-	}
-
-	return ret;
-}
-
 static unsigned long calculate_inst_freq(struct venus_inst *inst,
 					 unsigned long filled_len)
 {
-- 
2.28.0

