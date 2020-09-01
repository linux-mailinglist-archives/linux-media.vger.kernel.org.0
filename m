Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CAC3259092
	for <lists+linux-media@lfdr.de>; Tue,  1 Sep 2020 16:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728388AbgIAOfQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Sep 2020 10:35:16 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:36408 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728358AbgIAOVN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Sep 2020 10:21:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598970071; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=kSj6kC40JWnDnxc6lXMwrPkfer4vaGjWOxuIc4G/8nI=; b=Sg6G5/SSuYmay4LoKDkSpT6AYD721qpyvVlMBEZuyJzhdd48YAoQ4ALQunxDw1Y9WyxekP5X
 4UUSPag/SBCTFnv9808OGPsZSDCVkBHSAQisLt5BhBuc1sf9EYwP3eysNjnOqy2Qlqkz9U4l
 +b/JP8sGorBJPB+bbKfRU0YDQj4=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f4e58c6380a624e4d047851 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Sep 2020 14:20:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9B2BBC433CA; Tue,  1 Sep 2020 14:20:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 305CDC43391;
        Tue,  1 Sep 2020 14:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 305CDC43391
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     stanimir.varbanov@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v6 3/5] media: venus: core: Add support for opp tables/perf voting
Date:   Tue,  1 Sep 2020 19:50:24 +0530
Message-Id: <1598970026-7199-4-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598970026-7199-1-git-send-email-rnayak@codeaurora.org>
References: <1598970026-7199-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support to add OPP tables and perf voting on the OPP powerdomain.
This is needed so venus votes on the corresponding performance state
for the OPP powerdomain along with setting the core clock rate.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c       |  2 +
 drivers/media/platform/qcom/venus/core.h       |  5 ++
 drivers/media/platform/qcom/venus/pm_helpers.c | 92 ++++++++++++++++++++++++--
 3 files changed, 92 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index bfcaba3..a3e98a5 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -525,6 +525,7 @@ static const struct venus_resources sdm845_res_v2 = {
 	.vcodec_clks_num = 2,
 	.vcodec_pmdomains = { "venus", "vcodec0", "vcodec1" },
 	.vcodec_pmdomains_num = 3,
+	.opp_pmdomain = (const char *[]) { "cx", NULL },
 	.vcodec_num = 2,
 	.max_load = 3110400,	/* 4096x2160@90 */
 	.hfi_version = HFI_VERSION_4XX,
@@ -570,6 +571,7 @@ static const struct venus_resources sc7180_res = {
 	.vcodec_clks_num = 2,
 	.vcodec_pmdomains = { "venus", "vcodec0" },
 	.vcodec_pmdomains_num = 2,
+	.opp_pmdomain = (const char *[]) { "cx", NULL },
 	.vcodec_num = 1,
 	.hfi_version = HFI_VERSION_4XX,
 	.vmem_id = VIDC_RESOURCE_NONE,
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7118612..b0cc544 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -62,6 +62,7 @@ struct venus_resources {
 	unsigned int vcodec_clks_num;
 	const char * const vcodec_pmdomains[VIDC_PMDOMAINS_NUM_MAX];
 	unsigned int vcodec_pmdomains_num;
+	const char **opp_pmdomain;
 	unsigned int vcodec_num;
 	enum hfi_version hfi_version;
 	u32 max_load;
@@ -145,8 +146,12 @@ struct venus_core {
 	struct clk *vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct icc_path *video_path;
 	struct icc_path *cpucfg_path;
+	struct opp_table *opp_table;
+	bool has_opp_table;
 	struct device_link *pd_dl_venus;
 	struct device *pmdomains[VIDC_PMDOMAINS_NUM_MAX];
+	struct device_link *opp_dl_venus;
+	struct device *opp_pmdomain;
 	struct video_device *vdev_dec;
 	struct video_device *vdev_enc;
 	struct v4l2_device v4l2_dev;
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 531e7a4..3127af8 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -9,6 +9,7 @@
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/types.h>
 #include <media/v4l2-mem2mem.h>
@@ -66,10 +67,9 @@ static void core_clks_disable(struct venus_core *core)
 
 static int core_clks_set_rate(struct venus_core *core, unsigned long freq)
 {
-	struct clk *clk = core->clks[0];
 	int ret;
 
-	ret = clk_set_rate(clk, freq);
+	ret = dev_pm_opp_set_rate(core->dev, freq);
 	if (ret)
 		return ret;
 
@@ -744,13 +744,16 @@ static int venc_power_v4(struct device *dev, int on)
 
 static int vcodec_domains_get(struct device *dev)
 {
+	int ret;
+	struct opp_table *opp_table;
+	struct device **opp_virt_dev;
 	struct venus_core *core = dev_get_drvdata(dev);
 	const struct venus_resources *res = core->res;
 	struct device *pd;
 	unsigned int i;
 
 	if (!res->vcodec_pmdomains_num)
-		return -ENODEV;
+		goto skip_pmdomains;
 
 	for (i = 0; i < res->vcodec_pmdomains_num; i++) {
 		pd = dev_pm_domain_attach_by_name(dev,
@@ -767,7 +770,41 @@ static int vcodec_domains_get(struct device *dev)
 	if (!core->pd_dl_venus)
 		return -ENODEV;
 
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
 	return 0;
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
 }
 
 static void vcodec_domains_put(struct device *dev)
@@ -777,7 +814,7 @@ static void vcodec_domains_put(struct device *dev)
 	unsigned int i;
 
 	if (!res->vcodec_pmdomains_num)
-		return;
+		goto skip_pmdomains;
 
 	if (core->pd_dl_venus)
 		device_link_del(core->pd_dl_venus);
@@ -787,6 +824,15 @@ static void vcodec_domains_put(struct device *dev)
 			continue;
 		dev_pm_domain_detach(core->pmdomains[i], true);
 	}
+
+skip_pmdomains:
+	if (!core->has_opp_table)
+		return;
+
+	if (core->opp_dl_venus)
+		device_link_del(core->opp_dl_venus);
+
+	dev_pm_domain_detach(core->opp_pmdomain, true);
 }
 
 static int core_get_v4(struct device *dev)
@@ -815,19 +861,46 @@ static int core_get_v4(struct device *dev)
 	if (legacy_binding)
 		return 0;
 
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
 	ret = vcodec_domains_get(dev);
-	if (ret)
+	if (ret) {
+		if (core->has_opp_table)
+			dev_pm_opp_of_remove_table(dev);
+		dev_pm_opp_put_clkname(core->opp_table);
 		return ret;
+	}
 
 	return 0;
 }
 
 static void core_put_v4(struct device *dev)
 {
+	struct venus_core *core = dev_get_drvdata(dev);
+
 	if (legacy_binding)
 		return;
 
 	vcodec_domains_put(dev);
+
+	if (core->has_opp_table)
+		dev_pm_opp_of_remove_table(dev);
+	if (core->opp_table)
+		dev_pm_opp_put_clkname(core->opp_table);
+
 }
 
 static int core_power_v4(struct device *dev, int on)
@@ -835,10 +908,15 @@ static int core_power_v4(struct device *dev, int on)
 	struct venus_core *core = dev_get_drvdata(dev);
 	int ret = 0;
 
-	if (on == POWER_ON)
+	if (on == POWER_ON) {
 		ret = core_clks_enable(core);
-	else
+	} else {
+		/* Drop the performance state vote */
+		if (core->opp_pmdomain)
+			dev_pm_opp_set_rate(dev, 0);
+
 		core_clks_disable(core);
+	}
 
 	return ret;
 }
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

