Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A13121BBFE0
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 15:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728014AbgD1Njd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 09:39:33 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:49790 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728001AbgD1Njc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 09:39:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588081171; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=15TKWLEkzwSM87lgEQBTCGIp448Gy8fi+rdMfKejitg=; b=Sb0SIiCFsUxGIjAN3q4cAYO1Y6VF9sYOQi2xU7jwvgpgOOHtbeDmOqGYroo1jW2p8XvNPlz9
 ARyR0X9s44+lVbo1rN2s8Sw7oLheNPw98wk1F06OeBFbggLb0G2VPnsuQi1Z9Yb750OQtx4N
 AmZBQy/6fzoVkB5chay2Qbqdn+I=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea83211.7fc2f0a471b8-smtp-out-n05;
 Tue, 28 Apr 2020 13:39:29 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 55D30C3855E; Tue, 28 Apr 2020 13:39:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7A56FC072B3;
        Tue, 28 Apr 2020 13:39:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7A56FC072B3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Subject: [PATCH v3 12/17] media: venus: core: Add support for opp tables/perf voting
Date:   Tue, 28 Apr 2020 19:03:00 +0530
Message-Id: <1588080785-6812-13-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
References: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support to add OPP tables and perf voting on the OPP powerdomain.
This is needed so venus votes on the corresponding performance state
for the OPP powerdomain along with setting the core clock rate.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org
---
 drivers/media/platform/qcom/venus/core.c       | 28 +++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h       |  5 ++++
 drivers/media/platform/qcom/venus/pm_helpers.c | 37 +++++++++++++++++++++++---
 3 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 194b10b9..e98fea92 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-mem2mem.h>
@@ -214,6 +215,20 @@ static int venus_probe(struct platform_device *pdev)
 	if (!core->pm_ops)
 		return -ENODEV;
 
+	core->opp_table = dev_pm_opp_set_clkname(dev, "core");
+	if (IS_ERR(core->opp_table))
+		return PTR_ERR(core->opp_table);
+
+	if (core->res->opp_pmdomain) {
+		ret = dev_pm_opp_of_add_table(dev);
+		if (!ret) {
+			core->has_opp_table = true;
+		} else if (ret != -ENODEV) {
+			dev_err(dev, "Invalid OPP table in Device tree\n");
+			return ret;
+		}
+	}
+
 	if (core->pm_ops->core_get) {
 		ret = core->pm_ops->core_get(dev);
 		if (ret)
@@ -301,6 +316,9 @@ static int venus_probe(struct platform_device *pdev)
 err_venus_shutdown:
 	venus_shutdown(core);
 err_runtime_disable:
+	if (core->res->opp_pmdomain && core->has_opp_table)
+		dev_pm_opp_of_remove_table(dev);
+	dev_pm_opp_put_clkname(core->opp_table);
 	pm_runtime_set_suspended(dev);
 	pm_runtime_disable(dev);
 	hfi_destroy(core);
@@ -326,6 +344,10 @@ static int venus_remove(struct platform_device *pdev)
 
 	venus_firmware_deinit(core);
 
+	if (core->res->opp_pmdomain && core->has_opp_table)
+		dev_pm_opp_of_remove_table(dev);
+	dev_pm_opp_put_clkname(core->opp_table);
+
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 
@@ -350,6 +372,10 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
+	/* Drop the performance state vote */
+	if (core->opp_pmdomain)
+		dev_pm_opp_set_rate(dev, 0);
+
 	if (pm_ops->core_power)
 		ret = pm_ops->core_power(dev, POWER_OFF);
 
@@ -511,6 +537,7 @@ static const struct venus_resources sdm845_res_v2 = {
 	.vcodec_clks_num = 2,
 	.vcodec_pmdomains = { "venus", "vcodec0", "vcodec1" },
 	.vcodec_pmdomains_num = 3,
+	.opp_pmdomain = (const char *[]) { "opp-pd", NULL },
 	.vcodec_num = 2,
 	.max_load = 3110400,	/* 4096x2160@90 */
 	.hfi_version = HFI_VERSION_4XX,
@@ -556,6 +583,7 @@ static const struct venus_resources sc7180_res = {
 	.vcodec_clks_num = 2,
 	.vcodec_pmdomains = { "venus", "vcodec0" },
 	.vcodec_pmdomains_num = 2,
+	.opp_pmdomain = (const char *[]) { "opp-pd", NULL },
 	.vcodec_num = 1,
 	.hfi_version = HFI_VERSION_4XX,
 	.vmem_id = VIDC_RESOURCE_NONE,
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index bd3ac6a..cc1d511 100644
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
@@ -144,8 +145,12 @@ struct venus_core {
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
index abf9315..bc5bbd2 100644
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
 
@@ -740,13 +740,15 @@ static int venc_power_v4(struct device *dev, int on)
 
 static int vcodec_domains_get(struct device *dev)
 {
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
@@ -763,6 +765,24 @@ static int vcodec_domains_get(struct device *dev)
 	if (!core->pd_dl_venus)
 		return -ENODEV;
 
+skip_pmdomains:
+	if (!res->opp_pmdomain || !core->has_opp_table)
+		return 0;
+
+	/* Attach the power domain for setting performance state */
+	opp_table = dev_pm_opp_attach_genpd(dev, res->opp_pmdomain, &opp_virt_dev);
+	if (IS_ERR(opp_table)) {
+		return PTR_ERR(opp_table);
+	} else if (opp_virt_dev) {
+		core->opp_pmdomain = *opp_virt_dev;
+		core->opp_dl_venus = device_link_add(dev, core->opp_pmdomain,
+						     DL_FLAG_RPM_ACTIVE |
+						     DL_FLAG_PM_RUNTIME |
+						     DL_FLAG_STATELESS);
+		if (!core->opp_dl_venus)
+			return -ENODEV;
+	}
+
 	return 0;
 }
 
@@ -773,7 +793,7 @@ static void vcodec_domains_put(struct device *dev)
 	unsigned int i;
 
 	if (!res->vcodec_pmdomains_num)
-		return;
+		goto skip_pmdomains;
 
 	if (core->pd_dl_venus)
 		device_link_del(core->pd_dl_venus);
@@ -783,6 +803,15 @@ static void vcodec_domains_put(struct device *dev)
 			continue;
 		dev_pm_domain_detach(core->pmdomains[i], true);
 	}
+
+skip_pmdomains:
+	if (!res->opp_pmdomain)
+		return;
+
+	if (core->opp_dl_venus)
+		device_link_del(core->opp_dl_venus);
+
+	dev_pm_domain_detach(core->opp_pmdomain, true);
 }
 
 static int core_get_v4(struct device *dev)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
