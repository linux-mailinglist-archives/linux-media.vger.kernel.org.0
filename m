Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD0FD1ADF59
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 16:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731113AbgDQOGW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 10:06:22 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:62587 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731099AbgDQOGT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 10:06:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587132378; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=JgpwToNdmNH5TckqDtwht+dLh2sp+hER98TGqoDOOno=; b=aYLpJfnGw4E5sdBcTopbaDiEY1oNgwCJKz2szpDaQ9Y5Me4ExyvG4fBOLteO++oI8ZsJtka3
 +pWvbZYTFAw8N4yusjcF3yNcotrl9yp7L5NytHOVv4+6FzDtvz5hu0GkTt0ctPglmHLN0WUc
 m+h41L3mcVKDMb7dvnwsKszgpp4=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e99b7d6.7f9f3acf4e68-smtp-out-n04;
 Fri, 17 Apr 2020 14:06:14 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 14063C44792; Fri, 17 Apr 2020 14:06:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 54CA0C44798;
        Fri, 17 Apr 2020 14:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 54CA0C44798
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
Subject: [PATCH v2 12/17] media: venus: core: Add support for opp tables/perf voting
Date:   Fri, 17 Apr 2020 19:34:34 +0530
Message-Id: <1587132279-27659-13-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587132279-27659-1-git-send-email-rnayak@codeaurora.org>
References: <1587132279-27659-1-git-send-email-rnayak@codeaurora.org>
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
 drivers/media/platform/qcom/venus/core.c       | 21 +++++++++++++++
 drivers/media/platform/qcom/venus/core.h       |  5 ++++
 drivers/media/platform/qcom/venus/pm_helpers.c | 37 +++++++++++++++++++++++---
 3 files changed, 59 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 194b10b9..0d1ef88 100644
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
@@ -250,6 +251,13 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	core->opp = dev_pm_opp_set_clkname(dev, "core");
+	if (IS_ERR(core->opp))
+		return PTR_ERR(core->opp);
+
+	if (core->opp_pmdomain && !dev_pm_opp_of_add_table(dev))
+		core->opp_table = true;
+
 	pm_runtime_enable(dev);
 
 	ret = pm_runtime_get_sync(dev);
@@ -301,6 +309,9 @@ static int venus_probe(struct platform_device *pdev)
 err_venus_shutdown:
 	venus_shutdown(core);
 err_runtime_disable:
+	if (core->opp_pmdomain && core->opp_table)
+		dev_pm_opp_of_remove_table(dev);
+	dev_pm_opp_put_clkname(core->opp);
 	pm_runtime_set_suspended(dev);
 	pm_runtime_disable(dev);
 	hfi_destroy(core);
@@ -326,6 +337,10 @@ static int venus_remove(struct platform_device *pdev)
 
 	venus_firmware_deinit(core);
 
+	if (core->opp_pmdomain && core->opp_table)
+		dev_pm_opp_of_remove_table(dev);
+	dev_pm_opp_put_clkname(core->opp);
+
 	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 
@@ -350,6 +365,10 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
+	/* Drop the performance state vote */
+	if (core->opp_pmdomain)
+		dev_pm_opp_set_rate(dev, 0);
+
 	if (pm_ops->core_power)
 		ret = pm_ops->core_power(dev, POWER_OFF);
 
@@ -511,6 +530,7 @@ static const struct venus_resources sdm845_res_v2 = {
 	.vcodec_clks_num = 2,
 	.vcodec_pmdomains = { "venus", "vcodec0", "vcodec1" },
 	.vcodec_pmdomains_num = 3,
+	.opp_pmdomain = (const char *[]) { "opp-pd", NULL },
 	.vcodec_num = 2,
 	.max_load = 3110400,	/* 4096x2160@90 */
 	.hfi_version = HFI_VERSION_4XX,
@@ -556,6 +576,7 @@ static const struct venus_resources sc7180_res = {
 	.vcodec_clks_num = 2,
 	.vcodec_pmdomains = { "venus", "vcodec0" },
 	.vcodec_pmdomains_num = 2,
+	.opp_pmdomain = (const char *[]) { "opp-pd", NULL },
 	.vcodec_num = 1,
 	.hfi_version = HFI_VERSION_4XX,
 	.vmem_id = VIDC_RESOURCE_NONE,
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index bd3ac6a..e583ee3 100644
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
+	struct opp_table *opp;
+	bool opp_table;
 	struct device_link *pd_dl_venus;
 	struct device *pmdomains[VIDC_PMDOMAINS_NUM_MAX];
+	struct device_link *opp_dl_venus;
+	struct device *opp_pmdomain;
 	struct video_device *vdev_dec;
 	struct video_device *vdev_enc;
 	struct v4l2_device v4l2_dev;
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index abf9315..b81592f 100644
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
+	if (IS_ERR(opp)) {
+		return PTR_ERR(opp);
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
