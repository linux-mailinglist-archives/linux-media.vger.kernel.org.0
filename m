Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFE8C321C10
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 17:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbhBVQDF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 11:03:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbhBVQDC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 11:03:02 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14CC4C06178C
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:40 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id d11so267899wrj.7
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0WW2t9gxZjLIIqwdcJaOQq5OeJW2zdxpgdUPYhM+q4A=;
        b=ECvLOi0s9Z0nDyx9D6A4EdDSJay/GY9RxV1YdySb1dGUVeSqqA7xo0NwsH0s/jWoMp
         ZXC5KfNWYTZEH6h5t8ZURwvaP8bOwRBfkn2oLgwdTfKA2Aoj9Qf9M68Edgh8ZeLIdDsK
         L3VuXmDSzCC4KXw08VYsqoVvuHm79HTaBYm9rT7G1TBBHEkAwnO+17emSi/dBuNmnYVu
         9R44JVXHNDXBHimidkBc3DYaS20/NBR1vAG+DU8yUq6ILJzQGZIywhHbG6ucQ2QlhPdT
         k4lC6EroeunBPEthJs9EYhYGgTBBuf4UED7S5MdGGoO/4E4f72JZ6a/PQbU+WWMkManU
         iMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0WW2t9gxZjLIIqwdcJaOQq5OeJW2zdxpgdUPYhM+q4A=;
        b=azTXPTXzqof1q4KXhwOtMaozpXazOxk+LyK0p5a0Sd7Zz6Y4LHuZwg9XsK8xaoZsvl
         2KA/CUtcSVWrvaei0n28PK8MOBY1b9MKe5Ey6X4lgCSpDt3gURG1/RQZdx8a4QyJPbvz
         qhRCkdf8Q6D7Ods10WY1qwFBCU42S9FGUkjuzsR1YiEDQf6o0Ym5LkO+n5mfnndsGcmU
         o2exdJLlhQPEkqvta2b7VEG/U4UMJYmmolgaf0SpatovHrNrrarLxRuQRq2kTYquzZ6J
         3vWiXbDW8r0AY1FSevn0wyNDEFxl1x1SIzdcGdSGqxrhOsxGuMasGzTmO7PEfZ0Mhzjk
         D1kw==
X-Gm-Message-State: AOAM53003kk4u4Ttd7rvrCFJ61t374TlBZ3I52tDwolsv/kkhh7ZwFvU
        d/kxBLvZvcLGMjT8vWsdPvrYIw==
X-Google-Smtp-Source: ABdhPJwMpBiRRoDutjN7MNVWa/G4zns+61jPTWF6jYUTNoA+kixxDfoD8KhjM9Vi0EI0lbCbZm9YCQ==
X-Received: by 2002:adf:f4d1:: with SMTP id h17mr4001700wrp.350.1614009698895;
        Mon, 22 Feb 2021 08:01:38 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:38 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 02/25] media: venus: core,pm: Add handling for resets
Date:   Mon, 22 Feb 2021 16:02:37 +0000
Message-Id: <20210222160300.1811121-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
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
---
 drivers/media/platform/qcom/venus/core.h      |  4 ++
 .../media/platform/qcom/venus/pm_helpers.c    | 60 +++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index a252ed32cc14..771f5bb0981e 100644
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
index e349d01422c5..4f5d42662963 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -11,6 +11,7 @@
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/types.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -830,6 +831,52 @@ static void vcodec_domains_put(struct venus_core *core)
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
@@ -853,6 +900,10 @@ static int core_get_v4(struct venus_core *core)
 	if (ret)
 		return ret;
 
+	ret = core_resets_get(core);
+	if (ret)
+		return ret;
+
 	if (legacy_binding)
 		return 0;
 
@@ -912,6 +963,13 @@ static int core_power_v4(struct venus_core *core, int on)
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
@@ -922,6 +980,8 @@ static int core_power_v4(struct venus_core *core, int on)
 
 		core_clks_disable(core);
 
+		ret = core_resets_reset(core);
+
 		if (pmctrl)
 			pm_runtime_put_sync(pmctrl);
 	}
-- 
2.29.2

