Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9253822ADB5
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 13:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728594AbgGWL1n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jul 2020 07:27:43 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:11741 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728040AbgGWL1l (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jul 2020 07:27:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595503661; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=5kJv5bK70XI1EQS3imigPUhyWdkx9f4j/5x4fmgv+Hc=; b=xgsns2jnqa86uuV6j5KwybbrRE2gvnwbVPuy4ApvK6EY1EhMD5BY6vL/uOnudS3dNkptYmtG
 oUdJ/bH70llNkO27ralEUuYaZbWc1Zn3yIlmQEN/KqpkLYR0fgRZYW/zjqRZ6mv5BshEdhCh
 t3aDdOnmFEcY2DM2LwwdbDWTQwk=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n17.prod.us-west-2.postgun.com with SMTP id
 5f1974225912b3a4059b51bf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 23 Jul 2020 11:27:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D000BC433CB; Thu, 23 Jul 2020 11:27:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 23E9EC433CA;
        Thu, 23 Jul 2020 11:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 23E9EC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     stanimir.varbanov@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v4 3/5] media: venus: core: Add support for opp tables/perf voting
Date:   Thu, 23 Jul 2020 16:56:50 +0530
Message-Id: <1595503612-2901-4-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595503612-2901-1-git-send-email-rnayak@codeaurora.org>
References: <1595503612-2901-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support to add OPP tables and perf voting on the OPP powerdomain.
This is needed so venus votes on the corresponding performance state
for the OPP powerdomain along with setting the core clock rate.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
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
index abf9315..0308d20 100644
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
 
@@ -740,13 +740,16 @@ static int venc_power_v4(struct device *dev, int on)
 
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
@@ -763,7 +766,41 @@ static int vcodec_domains_get(struct device *dev)
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
@@ -773,7 +810,7 @@ static void vcodec_domains_put(struct device *dev)
 	unsigned int i;
 
 	if (!res->vcodec_pmdomains_num)
-		return;
+		goto skip_pmdomains;
 
 	if (core->pd_dl_venus)
 		device_link_del(core->pd_dl_venus);
@@ -783,6 +820,15 @@ static void vcodec_domains_put(struct device *dev)
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
@@ -811,19 +857,46 @@ static int core_get_v4(struct device *dev)
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
@@ -831,10 +904,15 @@ static int core_power_v4(struct device *dev, int on)
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

