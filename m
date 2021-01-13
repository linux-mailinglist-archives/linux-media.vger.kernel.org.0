Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5EC42F481F
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 10:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbhAMJ6O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 04:58:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbhAMJ6O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 04:58:14 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D7DC061786
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 01:57:33 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id d17so2160254ejy.9
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 01:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=L4xQZl7+36KMU2/wIiB68+QeODvGN5IdQvwifWOg93A=;
        b=PuTWWoI2Va9z2ZLcPYk9yFzCkLHR3Uin79vK5c4lCfplOKz+I+LQ1kcdJOF/XsWlnm
         plsTIkD7rWAHR4Wwg0Smsu9/k6fMxWVx90ma+clezW2v+Qkp+4/j7ElJUOFGE41n2Klm
         hmAUR0Yqu5FLIS+kXYZUXxAlDRHl2IwiV1OraMG4c0+ta6hTS7Tj0gfWIg/WMr6qbHnh
         LXJNv0ToBN5H+AjO/zOYB0DYRbl9BQt9a56leVVlW+TcGY9mk9YwoZlrch5+fE8wE4Et
         d5M/J15GOIXRY18c0s5/VoSUJU9UFMKovPlTaN4pYVJHMi+yagZcH/Zc5L/UnDZUvt1L
         IJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=L4xQZl7+36KMU2/wIiB68+QeODvGN5IdQvwifWOg93A=;
        b=LQC+aMCqFIpo3EuWvZVdjGJtpl/jyrS/Bs8xqxoYw820dcjkM5Ptz+fJsoap3IbWaR
         UhQbzMyaOyLO1bntg+DWc/oQeGl8tN51YgogiDr35cU0rLWyLMpNZbC4ebgO7ikr4UzO
         Uxm004A9D+RM2n9KpJgS9ljvrO9R2xx7DnLEQJ5718s0G4/367eRYEqIazzM/CaQIp6+
         dMRSD41mvxw3vdPlUqgjGkdHHEO475wLRYhySdL0PDeWbo/Htdmbc/YnDV73+4KBGmLG
         8QY1cyZzWs1NhVMDSHFnoNndTJqjAybqJy6KzCSPf2ccNH43nHoPEzkY7qYBjRuYKl4C
         B80Q==
X-Gm-Message-State: AOAM533IKbV7RXYpcFZJkJn6iHN/j/ChpXq+osEtP5YAuo4is28qa4F4
        c7l6CRJGROE4gbWXov3wvIRL4Y3oOrxbtWCM
X-Google-Smtp-Source: ABdhPJx6zO3wLuQC3IZHag66xi+Wlx7Hc/0ssUMmA+U3IsKK7HAyMqUsbqsmV1wYhbLXmkGLMTG3cA==
X-Received: by 2002:a17:907:20f1:: with SMTP id rh17mr974811ejb.147.1610531850905;
        Wed, 13 Jan 2021 01:57:30 -0800 (PST)
Received: from localhost.localdomain (hst-221-43.medicom.bg. [84.238.221.43])
        by smtp.gmail.com with ESMTPSA id l1sm508950eje.12.2021.01.13.01.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 01:57:30 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Fritz Koenig <frkoenig@chromium.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2] venus: pm_helpers: Control core power domain manually
Date:   Wed, 13 Jan 2021 11:57:16 +0200
Message-Id: <20210113095716.15802-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Presently we use device_link to control core power domain. But this
leads to issues because the genpd doesn't guarantee synchronous on/off
for supplier devices. Switch to manually control by pmruntime calls.

Tested-by: Fritz Koenig <frkoenig@chromium.org>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---

changes since v1:
 * drop pd_dl_venus from struct description (Fritz)

 drivers/media/platform/qcom/venus/core.h      |  2 --
 .../media/platform/qcom/venus/pm_helpers.c    | 36 ++++++++++---------
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index e886023afbe9..d2482dff518e 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -91,7 +91,6 @@ struct venus_format {
  * @clks:	an array of struct clk pointers
  * @vcodec0_clks: an array of vcodec0 struct clk pointers
  * @vcodec1_clks: an array of vcodec1 struct clk pointers
- * @pd_dl_venus: pmdomain device-link for venus domain
  * @pmdomains:	an array of pmdomains struct device pointers
  * @vdev_dec:	a reference to video device structure for decoder instances
  * @vdev_enc:	a reference to video device structure for encoder instances
@@ -128,7 +127,6 @@ struct venus_core {
 	struct icc_path *cpucfg_path;
 	struct opp_table *opp_table;
 	bool has_opp_table;
-	struct device_link *pd_dl_venus;
 	struct device *pmdomains[VIDC_PMDOMAINS_NUM_MAX];
 	struct device_link *opp_dl_venus;
 	struct device *opp_pmdomain;
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 0011c3aa3a73..43c4e3d9e281 100644
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
@@ -916,16 +904,30 @@ static void core_put_v4(struct device *dev)
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

