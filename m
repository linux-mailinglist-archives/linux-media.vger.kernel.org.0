Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6EAF1A2385
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 15:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729395AbgDHNsW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 09:48:22 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:45503 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729388AbgDHNsV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Apr 2020 09:48:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586353701; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=oAeoV/kVHwPbkrGoZ7aZeGF+eF0FxLtQ1Yra0Lk7RmY=; b=tjFmU0iFkPdOq5XPD3Xg8XedjzqJdZYKeOvwpZ3im7Wk/t8Znhc11QyuTZCObTJMRp+e31JC
 wdz9b/KO3GxBFgKRoQSBxVeaF//0GvAVTZYbkFf5SHw+Fd4Brnb/BLMEjeeb4mqVfEdXVfLE
 8U7ni5mfu8I5Kdu8JJpmFI0/97g=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8dd61e.7fae422c4f10-smtp-out-n03;
 Wed, 08 Apr 2020 13:48:14 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B1C7EC38569; Wed,  8 Apr 2020 13:48:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 06878C44BC3;
        Wed,  8 Apr 2020 13:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 06878C44BC3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org
Subject: [PATCH 16/21] media: venus: core: Add support for opp tables/perf voting
Date:   Wed,  8 Apr 2020 19:16:42 +0530
Message-Id: <1586353607-32222-17-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
References: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
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
 drivers/media/platform/qcom/venus/core.c       | 16 +++++++++++
 drivers/media/platform/qcom/venus/core.h       |  4 +++
 drivers/media/platform/qcom/venus/pm_helpers.c | 37 +++++++++++++++++++++++---
 3 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 194b10b9..3853637 100644
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
@@ -250,6 +251,11 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (core->opp_pmdomain) {
+		core->opp = dev_pm_opp_set_clkname(dev, "core");
+		dev_pm_opp_of_add_table(dev);
+	}
+
 	pm_runtime_enable(dev);
 
 	ret = pm_runtime_get_sync(dev);
@@ -301,6 +307,8 @@ static int venus_probe(struct platform_device *pdev)
 err_venus_shutdown:
 	venus_shutdown(core);
 err_runtime_disable:
+	if (core->opp_pmdomain)
+		dev_pm_opp_of_remove_table(dev);
 	pm_runtime_set_suspended(dev);
 	pm_runtime_disable(dev);
 	hfi_destroy(core);
@@ -326,6 +334,9 @@ static int venus_remove(struct platform_device *pdev)
 
 	venus_firmware_deinit(core);
 
+	if (core->opp_pmdomain)
+		dev_pm_opp_of_remove_table(dev);
+
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 
@@ -350,6 +361,9 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
+	if (core->opp_pmdomain)
+		dev_pm_opp_set_rate(dev, 0);
+
 	if (pm_ops->core_power)
 		ret = pm_ops->core_power(dev, POWER_OFF);
 
@@ -511,6 +525,7 @@ static const struct venus_resources sdm845_res_v2 = {
 	.vcodec_clks_num = 2,
 	.vcodec_pmdomains = { "venus", "vcodec0", "vcodec1" },
 	.vcodec_pmdomains_num = 3,
+	.opp_pmdomain = (const char *[]) { "opp-pd", NULL },
 	.vcodec_num = 2,
 	.max_load = 3110400,	/* 4096x2160@90 */
 	.hfi_version = HFI_VERSION_4XX,
@@ -556,6 +571,7 @@ static const struct venus_resources sc7180_res = {
 	.vcodec_clks_num = 2,
 	.vcodec_pmdomains = { "venus", "vcodec0" },
 	.vcodec_pmdomains_num = 2,
+	.opp_pmdomain = (const char *[]) { "opp-pd", NULL },
 	.vcodec_num = 1,
 	.hfi_version = HFI_VERSION_4XX,
 	.vmem_id = VIDC_RESOURCE_NONE,
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index bd3ac6a..90d011d 100644
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
@@ -144,8 +145,11 @@ struct venus_core {
 	struct clk *vcodec1_clks[VIDC_VCODEC_CLKS_NUM_MAX];
 	struct icc_path *video_path;
 	struct icc_path *cpucfg_path;
+	struct opp_table *opp;
 	struct device_link *pd_dl_venus;
 	struct device *pmdomains[VIDC_PMDOMAINS_NUM_MAX];
+	struct device_link *opp_dl_venus;
+	struct device *opp_pmdomain;
 	struct video_device *vdev_dec;
 	struct video_device *vdev_enc;
 	struct v4l2_device v4l2_dev;
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index abf9315..b35ea7a 100644
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
+	struct opp_table *opp;
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
+	if (!res->opp_pmdomain)
+		return 0;
+
+	/* Attach the power domain for setting performance state */
+	opp = dev_pm_opp_attach_genpd(dev, res->opp_pmdomain, &opp_virt_dev);
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+	else if (opp_virt_dev) {
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
