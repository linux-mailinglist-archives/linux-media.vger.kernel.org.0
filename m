Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03BC82EFE41
	for <lists+linux-media@lfdr.de>; Sat,  9 Jan 2021 08:22:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbhAIHWX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Jan 2021 02:22:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726374AbhAIHWX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Jan 2021 02:22:23 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D23D6C061574
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 23:21:42 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id q22so17642563eja.2
        for <linux-media@vger.kernel.org>; Fri, 08 Jan 2021 23:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=oMPxP8SoOc9C3ojU0+ecvXLMtYQCURVMW/VkKHiEGY4=;
        b=D3oeU1IUw5BxYChFH5RBM7HmjqemG9yIWB6lQNXUDu/LEVX4AYOn0CEz0Tu+JlpRKA
         H2YAjUNChY8MYNUtmRJ3iNQNoGYFLTA1oI4P1Znwk5PIfAUwcn/H51JwaINe0B+zZS3z
         VAEsmp2RAzZfoQH/+gM/qON1rQpIeMC3sfaJZPnV27dlWalgGfs0uQl1CUR9XAU8Bhoz
         fLt+e1HtXqiCaZSL8CUSnbh+5gPucZo0y5O5pWPsJVvDpV6XyttfKg4VXC6b/hliS5lb
         m11Ov8r5+GXtZpkXW1gUHvLsodMSodEhFEq558uu3OBjw+XMYAkvzu++gJBS+otcXEVI
         AbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=oMPxP8SoOc9C3ojU0+ecvXLMtYQCURVMW/VkKHiEGY4=;
        b=qgmqZpOIXbyXRWRO0Qq8VL0SkhouqjeYTHVoCD4/pImRDxGjEzDp0M0bAF0ZRddbXa
         9v1sNzrNUkQKML0v6u7IP/3llMGI+/VKlVd+Md1IT2jmlobon8C3D3tHyFRQKCDXk1Xq
         98GnwWvL4Jn+Syx27STBtkN+Tky1aE0BqQFc+NEF0+RPRsjeG7Y8bZ5NPuxO5rAveiHJ
         NvRnHUM5xitxLs0aK/hdXW5fyvpNBVse7zGZjA5D908MipoTM4U2jSII+qSk1YCMsju+
         baE+h9r7nauFSR6Xd2jQuZsiLjyIm/EaWm2LzalhXBz4T43eX+Gi3s856w0HD432HVR2
         WPEg==
X-Gm-Message-State: AOAM53288KTdlpHbMNXzLB4hbccP96hgSHDSKqoOhrr++MHBjTH3msaH
        EpRepiqpjxpIscIE5XiKurgTrzcvQFoqwYAQ
X-Google-Smtp-Source: ABdhPJz50lAAVKVmI5+jnQY8Ve3Q6+tO4q+i/rMfqHyZ23xEsIImRCgLUhd+SAECxRJoVR4JSWfl7g==
X-Received: by 2002:a17:906:b309:: with SMTP id n9mr4905950ejz.365.1610176901271;
        Fri, 08 Jan 2021 23:21:41 -0800 (PST)
Received: from localhost.localdomain (hst-221-28.medicom.bg. [84.238.221.28])
        by smtp.gmail.com with ESMTPSA id o10sm4293997eju.89.2021.01.08.23.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 23:21:40 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] venus: pm_helpers: Control core power domain manually
Date:   Sat,  9 Jan 2021 09:21:30 +0200
Message-Id: <20210109072130.784-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Presently we use device_link to control core power domain. But this
leads to issues because the genpd doesn't guarantee synchronous on/off
for supplier devices. Switch to manually control by pmruntime calls.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h      |  1 -
 .../media/platform/qcom/venus/pm_helpers.c    | 36 ++++++++++---------
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index dfc13b2f371f..74d9fd3d51cc 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -128,7 +128,6 @@ struct venus_core {
 	struct icc_path *cpucfg_path;
 	struct opp_table *opp_table;
 	bool has_opp_table;
-	struct device_link *pd_dl_venus;
 	struct device *pmdomains[VIDC_PMDOMAINS_NUM_MAX];
 	struct device_link *opp_dl_venus;
 	struct device *opp_pmdomain;
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 94219a3093cb..e0338932a720 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -774,13 +774,6 @@ static int vcodec_domains_get(struct device *dev)
 		core->pmdomains[i] = pd;
 	}
 
-	core->pd_dl_venus = device_link_add(dev, core->pmdomains[0],
-					    DL_FLAG_PM_RUNTIME |
-					    DL_FLAG_STATELESS |
-					    DL_FLAG_RPM_ACTIVE);
-	if (!core->pd_dl_venus)
-		return -ENODEV;
-
 skip_pmdomains:
 	if (!core->has_opp_table)
 		return 0;
@@ -807,14 +800,12 @@ static int vcodec_domains_get(struct device *dev)
 opp_dl_add_err:
 	dev_pm_opp_detach_genpd(core->opp_table);
 opp_attach_err:
-	if (core->pd_dl_venus) {
-		device_link_del(core->pd_dl_venus);
-		for (i = 0; i < res->vcodec_pmdomains_num; i++) {
-			if (IS_ERR_OR_NULL(core->pmdomains[i]))
-				continue;
-			dev_pm_domain_detach(core->pmdomains[i], true);
-		}
+	for (i = 0; i < res->vcodec_pmdomains_num; i++) {
+		if (IS_ERR_OR_NULL(core->pmdomains[i]))
+			continue;
+		dev_pm_domain_detach(core->pmdomains[i], true);
 	}
+
 	return ret;
 }
 
@@ -827,9 +818,6 @@ static void vcodec_domains_put(struct device *dev)
 	if (!res->vcodec_pmdomains_num)
 		goto skip_pmdomains;
 
-	if (core->pd_dl_venus)
-		device_link_del(core->pd_dl_venus);
-
 	for (i = 0; i < res->vcodec_pmdomains_num; i++) {
 		if (IS_ERR_OR_NULL(core->pmdomains[i]))
 			continue;
@@ -917,16 +905,30 @@ static void core_put_v4(struct device *dev)
 static int core_power_v4(struct device *dev, int on)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
+	struct device *pmctrl = core->pmdomains[0];
 	int ret = 0;
 
 	if (on == POWER_ON) {
+		if (pmctrl) {
+			ret = pm_runtime_get_sync(pmctrl);
+			if (ret < 0) {
+				pm_runtime_put_noidle(pmctrl);
+				return ret;
+			}
+		}
+
 		ret = core_clks_enable(core);
+		if (ret < 0 && pmctrl)
+			pm_runtime_put_sync(pmctrl);
 	} else {
 		/* Drop the performance state vote */
 		if (core->opp_pmdomain)
 			dev_pm_opp_set_rate(dev, 0);
 
 		core_clks_disable(core);
+
+		if (pmctrl)
+			pm_runtime_put_sync(pmctrl);
 	}
 
 	return ret;
-- 
2.17.1

