Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F57C3394C1
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 18:29:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232311AbhCLR3X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 12:29:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232689AbhCLR3P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:15 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B15EEC061761
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:14 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id f22-20020a7bc8d60000b029010c024a1407so16276028wml.2
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x83uovnMOJTdyefGlIGHI08yYtXPvr91w/2f/jSvlJs=;
        b=XLFeT9DgpJGU0vi3RKLjF+R3QIgBsbcQn2/gV7k9okAcaAvXEh+UVM9GEiUoGpjsiX
         OWIGNYhuPtEE0ufgzuulkBLtVJKMWZJpy3Pj6Ol5s6QjhcvPuhH5+hJdyot9CfPzErwn
         u7xZLOwALJjdxsh8I3R8E2+AzaTJ2Lbd0nvzd0+jlZyLo8PAHC4LSxV0OsxWKCMsAspW
         KSekZ3ka34AugII3VrYu74RSyJDmv6/N96ejGzUD7U6P3zDg9zl6m8YqknQjiGQZeUlx
         IFBY0FFl0xpzytnkz15h0oKgVkUdPtHks2PQJ4Qp+Vhj+nBcJVJLWf3urHjnCD2CuHYF
         6XQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x83uovnMOJTdyefGlIGHI08yYtXPvr91w/2f/jSvlJs=;
        b=WmP8/oicyFSHxXKe/NbF0Fokm00vkRGQlioxZ1PRM9M3JCvg0H+RDejYfhRROUS6X+
         zKZZd0Ki/fPHCseIIVErpuD4950dGy2Vm0gTZ2gOW8vFz+Ta4GUzS5w7g8HOBfiMPC5T
         wB+U41STL0FOHhsl4p3YH/P4MzbCUiaj7Bho09MqEvYGjGWo2M55U8m8w09SdqWyVIp7
         vCcoUt0YCEdbqL0xdrQYbvaSfIeUosZXnYbZ8E4yIs26ohw1ZccGrFZkdPWJpI4UuIzy
         OdU2iWCJXrjgaacehvSS90I9j2OVstPVuiqKULKkuBXGdUQKwFnhhzfnboRsgCvcRFxy
         jeDg==
X-Gm-Message-State: AOAM530Gol6o6Ha6VaAaEjsUy9EA08mGTtAIbRGoTgg68VIpBTaNP5nk
        MKaekc3tOmRe9uBmuy2UQoP8uA==
X-Google-Smtp-Source: ABdhPJwFzFLe8cxyr98kuCRyqV2ZgtpD1Ae922PrMW+4s6y0ehRD+WPXtrxtADHC//o1fqetwXhsFQ==
X-Received: by 2002:a05:600c:220d:: with SMTP id z13mr14177471wml.1.1615570153435;
        Fri, 12 Mar 2021 09:29:13 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:12 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v2 02/25] media: venus: core,pm: Add handling for resets
Date:   Fri, 12 Mar 2021 17:30:16 +0000
Message-Id: <20210312173039.1387617-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
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

