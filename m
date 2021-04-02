Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71966352957
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 12:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234635AbhDBKFa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Apr 2021 06:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234397AbhDBKF2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 06:05:28 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AD0BC061794
        for <linux-media@vger.kernel.org>; Fri,  2 Apr 2021 03:05:20 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id j20-20020a05600c1914b029010f31e15a7fso4109355wmq.1
        for <linux-media@vger.kernel.org>; Fri, 02 Apr 2021 03:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gu1aUpypBdZ1g5qKxxRYnsFtYrUSNKGTe+yXVLDDZJw=;
        b=ksnOHVigXlc06+QGymJwGypYZ0yHUSBjvgJ9S5ox1SFQaJuQX67kRqXCPyqRTy75cp
         KYE2Gq2pwsfTlbvQluFyIispAcWQ/O7+PljGRqxk6K6IWsl9gOtRV3Pt29TXpFmI1DJt
         DuXpDPsplc36VdxUb5nsn4wJ826xjsJNIzh9vq/XbjFkKFpT84ndzDsxTfdHSL2kmOEO
         rdDXOX80pWt5dgCIdzuz0YsjT39e6DIArQzXXnbHe7rqnOiGJwrGtgqAvNk9NHpsTTdw
         HOefLyGda9up2QVD9cpVzIgfWnMB/Zteng29+f23vahUwwSPDfgA7U5YnhkMNfYmsQ7i
         e7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gu1aUpypBdZ1g5qKxxRYnsFtYrUSNKGTe+yXVLDDZJw=;
        b=AyBEhpI0bjLifDCoCR8Bqe96Us9tay55Y55KZKpBGfVzqz2AhKW7THPIaTuQUF6SO3
         Ka2NFZagYRwpgGsPkIRO83Q5QtX6IGCLcj1rqDRSg0WwmYBNUvLlDnwTvgoFfqUPpIZr
         QVpjzNWtxDg3L3/mWgjnU3mCgZ0lyEwOjSBL8IG0m/w5Yth32cK7HaTpwdiKUAkyedit
         Qdizl1KVQdzKPWZBh3Axa7ofRjfnOmRM4lubuDd1CJGxKV5d3MSVrK4jRMqUC+MhSmu5
         6mudiug6we9pAnfRNnEVrDzI+wAR2uUQxL7MNvgzzWu7JrueNvKs9Q24yHkAfNSNp72R
         VRhQ==
X-Gm-Message-State: AOAM530w2RQpfoBxIV5DDYrTiT0PwQ1yc4fM0EtugQuQyjouJ9htx/Wj
        NEMQOJPkLaog2R2AkmmC03HJfA==
X-Google-Smtp-Source: ABdhPJx0Djr1zdKJ1SvmWb1VYil+tIq/VtMx4mTIQccyktFnwuiddoiKt1XXXr5b2eFxKUMyKIYUOQ==
X-Received: by 2002:a1c:6855:: with SMTP id d82mr12367791wmc.169.1617357918717;
        Fri, 02 Apr 2021 03:05:18 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:18 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 02/25] media: venus: core,pm: Add handling for resets
Date:   Fri,  2 Apr 2021 11:06:25 +0100
Message-Id: <20210402100648.1815854-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Stanimir Varbanov <stanimir.varbanov@linaro.org>

The Venus driver has to control two reset signals related to
gcc video_axi0 and videocc mvs0c for v6. Add it.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h      |  4 ++
 .../media/platform/qcom/venus/pm_helpers.c    | 60 +++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 13c18c49714d..0a90cd79104b 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -24,6 +24,7 @@
 #define VIDC_CLKS_NUM_MAX		4
 #define VIDC_VCODEC_CLKS_NUM_MAX	2
 #define VIDC_PMDOMAINS_NUM_MAX		3
+#define VIDC_RESETS_NUM_MAX		2
 
 extern int venus_fw_debug;
 
@@ -64,6 +65,8 @@ struct venus_resources {
 	unsigned int vcodec_pmdomains_num;
 	const char **opp_pmdomain;
 	unsigned int vcodec_num;
+	const char * const resets[VIDC_RESETS_NUM_MAX];
+	unsigned int resets_num;
 	enum hfi_version hfi_version;
 	u32 max_load;
 	unsigned int vmem_id;
@@ -130,6 +133,7 @@ struct venus_core {
 	struct device *pmdomains[VIDC_PMDOMAINS_NUM_MAX];
 	struct device_link *opp_dl_venus;
 	struct device *opp_pmdomain;
+	struct reset_control *resets[VIDC_RESETS_NUM_MAX];
 	struct video_device *vdev_dec;
 	struct video_device *vdev_enc;
 	struct v4l2_device v4l2_dev;
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 95b4d40ff6a5..794c2d6f0543 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -11,6 +11,7 @@
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/types.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -847,6 +848,52 @@ static void vcodec_domains_put(struct venus_core *core)
 	dev_pm_opp_detach_genpd(core->opp_table);
 }
 
+static int core_resets_reset(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+	unsigned char i;
+	int ret;
+
+	if (!res->resets_num)
+		return 0;
+
+	for (i = 0; i < res->resets_num; i++) {
+		ret = reset_control_assert(core->resets[i]);
+		if (ret)
+			goto err;
+
+		usleep_range(150, 250);
+		ret = reset_control_deassert(core->resets[i]);
+		if (ret)
+			goto err;
+	}
+
+err:
+	return ret;
+}
+
+static int core_resets_get(struct venus_core *core)
+{
+	struct device *dev = core->dev;
+	const struct venus_resources *res = core->res;
+	unsigned char i;
+	int ret;
+
+	if (!res->resets_num)
+		return 0;
+
+	for (i = 0; i < res->resets_num; i++) {
+		core->resets[i] =
+			devm_reset_control_get_exclusive(dev, res->resets[i]);
+		if (IS_ERR(core->resets[i])) {
+			ret = PTR_ERR(core->resets[i]);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int core_get_v4(struct venus_core *core)
 {
 	struct device *dev = core->dev;
@@ -870,6 +917,10 @@ static int core_get_v4(struct venus_core *core)
 	if (ret)
 		return ret;
 
+	ret = core_resets_get(core);
+	if (ret)
+		return ret;
+
 	if (legacy_binding)
 		return 0;
 
@@ -929,6 +980,13 @@ static int core_power_v4(struct venus_core *core, int on)
 			}
 		}
 
+		ret = core_resets_reset(core);
+		if (ret) {
+			if (pmctrl)
+				pm_runtime_put_sync(pmctrl);
+			return ret;
+		}
+
 		ret = core_clks_enable(core);
 		if (ret < 0 && pmctrl)
 			pm_runtime_put_sync(pmctrl);
@@ -939,6 +997,8 @@ static int core_power_v4(struct venus_core *core, int on)
 
 		core_clks_disable(core);
 
+		ret = core_resets_reset(core);
+
 		if (pmctrl)
 			pm_runtime_put_sync(pmctrl);
 	}
-- 
2.30.1

