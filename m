Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0E8565F66
	for <lists+linux-media@lfdr.de>; Tue,  5 Jul 2022 00:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232178AbiGDWQB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jul 2022 18:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbiGDWP7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jul 2022 18:15:59 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D03AC2BC0
        for <linux-media@vger.kernel.org>; Mon,  4 Jul 2022 15:15:58 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id t24so17677601lfr.4
        for <linux-media@vger.kernel.org>; Mon, 04 Jul 2022 15:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Et5zSnUjb9Vbw9zKwungPD4S4Sn12m5sCI/BTFYnGg=;
        b=wfmydPEJU94kzohYIYDa9N7AxHy9mfImDiKTsMkO2HZV2ORGwM/45OnuuPkmduN0l0
         7MECdhpyNyWEBDA8qEZLkWMfj7SLAEYCgZpthtKMi1uza5Z1u/5prktGMGoUq+vmivYt
         XPSlAMMXMu8128qNv8luGzBjyVxOwlGrbKwxrvc3dXqfbvecM9J23pZ7wAGfAwpHOSye
         O1aY8dnswInPiMwDgTweWUzly+ZvyR9yY7ItWJe/wm6EC/OjgTxq8OCw6YfhbLEkX82U
         x/QHGk9v2ATaurVKGE376qDTp9+M8XS0Q4JFypXPePtynJmTp6b5DWL3DJCM0BXa4eYg
         le5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Et5zSnUjb9Vbw9zKwungPD4S4Sn12m5sCI/BTFYnGg=;
        b=5hcZpbGphjnof+QULT/3igkJTuOzD9Z7kLn06AnGQnS3kdaRagV6T+IpjH+xOGeqem
         q7T9giJFhRZWHwvUVCOZeY5Eeu70y/NBOoqG73o4Ho5B+xLIyuAu+WMULGELsbrLYIsx
         x1xLF6eqMZX0aX1ienVoeVsTD5FS6gqzLPmiCkU1koUOM4INFXRW5rIDpa/nDfv76u9r
         QaqAjrNXS1wyDyUroJSrMImMNI7RfpuGHaLAh5Qmv3JzA8mhDVR2KcALkY6GoDYmsnwb
         5R2GOUYZUWnQTuUa+BxlVNoa1PpPjW2yBLmIRAR13d/ZZhVll4ionLRAWWUUg+AQyKKL
         x0nQ==
X-Gm-Message-State: AJIora95Y1Aser2WE4Y+yORr+WwrF9I+zDFcWt1hosr6WF1nGP8LD0rW
        78tNO1BnU3hrA62guZYJ7I4b6Q==
X-Google-Smtp-Source: AGRyM1spudlSV3k6+r9Wc7PmnnKaV3A6USLu0C9Bl5I/oQ3zhXoEoGMw5qY7/Il3Dij/8bFuHzkugg==
X-Received: by 2002:a05:6512:128f:b0:480:fd23:6647 with SMTP id u15-20020a056512128f00b00480fd236647mr20798608lfs.136.1656972957112;
        Mon, 04 Jul 2022 15:15:57 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id o13-20020ac25e2d000000b0047f660822e0sm5319931lfg.289.2022.07.04.15.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 15:15:56 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Todor Tomov <todor.too@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] media: camss: Split power domain management
Date:   Tue,  5 Jul 2022 01:15:48 +0300
Message-Id: <20220704221548.629302-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220704221548.629302-1-vladimir.zapolskiy@linaro.org>
References: <20220704221548.629302-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are three cases of power domain management on supported platforms:
1) CAMSS on MSM8916, where a single VFE power domain is operated outside
   of the camss device driver,
2) CAMSS on MSM8996 and SDM630/SDM660, where two VFE power domains are
   managed separately by the camss device driver, the power domains are
   linked and unlinked on demand by their functions vfe_pm_domain_on()
   and vfe_pm_domain_off() respectively,
3) CAMSS on SDM845 and SM8250 platforms, and there are two VFE power
   domains and their parent power domain TITAN_TOP, the latter one
   shall be turned on prior to turning on any of VFE power domains.

Due to a previously missing link between TITAN_TOP and VFEx power domains
in the latter case, which is now fixed by [1], it was decided always to
turn on all found VFE power domains and TITAN_TOP power domain, even if
just one particular VFE is needed to be enabled or none of VFE power domains
are required, for instance the latter case is when vfe_lite is in use.
This misusage becomes more incovenient and clumsy, if next generations are
to be supported, for instance CAMSS on SM8450 has three VFE power domains.

The change splits the power management support for platforms with TITAN_TOP
parent power domain, and, since 'power-domain-names' property is not present
in camss device tree nodes, the assumption is that the first N power domains
from the 'power-domains' list correspond to VFE power domains, and, if the
number of power domains is greater than number of non-lite VFEs, then the
last power domain from the list is the TITAN_TOP power domain.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../media/platform/qcom/camss/camss-vfe-170.c | 20 ++++++++++++-
 .../media/platform/qcom/camss/camss-vfe-480.c | 20 ++++++++++++-
 drivers/media/platform/qcom/camss/camss.c     | 30 ++++++++++---------
 3 files changed, 54 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
index 600150cfc4f7..8e506a805d11 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
@@ -687,7 +687,12 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
  */
 static void vfe_pm_domain_off(struct vfe_device *vfe)
 {
-	/* nop */
+	struct camss *camss = vfe->camss;
+
+	if (vfe->id >= camss->vfe_num)
+		return;
+
+	device_link_del(camss->genpd_link[vfe->id]);
 }
 
 /*
@@ -696,6 +701,19 @@ static void vfe_pm_domain_off(struct vfe_device *vfe)
  */
 static int vfe_pm_domain_on(struct vfe_device *vfe)
 {
+	struct camss *camss = vfe->camss;
+	enum vfe_line_id id = vfe->id;
+
+	if (id >= camss->vfe_num)
+		return 0;
+
+	camss->genpd_link[id] = device_link_add(camss->dev, camss->genpd[id],
+						DL_FLAG_STATELESS |
+						DL_FLAG_PM_RUNTIME |
+						DL_FLAG_RPM_ACTIVE);
+	if (!camss->genpd_link[id])
+		return -EINVAL;
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index 129585110393..3aa962b5663b 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -494,7 +494,12 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
  */
 static void vfe_pm_domain_off(struct vfe_device *vfe)
 {
-	/* nop */
+	struct camss *camss = vfe->camss;
+
+	if (vfe->id >= camss->vfe_num)
+		return;
+
+	device_link_del(camss->genpd_link[vfe->id]);
 }
 
 /*
@@ -503,6 +508,19 @@ static void vfe_pm_domain_off(struct vfe_device *vfe)
  */
 static int vfe_pm_domain_on(struct vfe_device *vfe)
 {
+	struct camss *camss = vfe->camss;
+	enum vfe_line_id id = vfe->id;
+
+	if (id >= camss->vfe_num)
+		return 0;
+
+	camss->genpd_link[id] = device_link_add(camss->dev, camss->genpd[id],
+						DL_FLAG_STATELESS |
+						DL_FLAG_PM_RUNTIME |
+						DL_FLAG_RPM_ACTIVE);
+	if (!camss->genpd_link[id])
+		return -EINVAL;
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 795eebd9af6c..f009297ba182 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1453,7 +1453,6 @@ static const struct media_device_ops camss_media_ops = {
 static int camss_configure_pd(struct camss *camss)
 {
 	struct device *dev = camss->dev;
-	int last_pm_domain = 0;
 	int i;
 	int ret;
 
@@ -1484,32 +1483,34 @@ static int camss_configure_pd(struct camss *camss)
 	if (!camss->genpd_link)
 		return -ENOMEM;
 
+	/*
+	 * VFE power domains are in the beginning of the list, and while all
+	 * power domains should be attached, only if TITAN_TOP power domain is
+	 * found in the list, it should be linked over here.
+	 */
 	for (i = 0; i < camss->genpd_num; i++) {
 		camss->genpd[i] = dev_pm_domain_attach_by_id(camss->dev, i);
 		if (IS_ERR(camss->genpd[i])) {
 			ret = PTR_ERR(camss->genpd[i]);
 			goto fail_pm;
 		}
+	}
 
-		camss->genpd_link[i] = device_link_add(camss->dev, camss->genpd[i],
-						       DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
-						       DL_FLAG_RPM_ACTIVE);
-		if (!camss->genpd_link[i]) {
-			dev_pm_domain_detach(camss->genpd[i], true);
+	if (i > camss->vfe_num) {
+		camss->genpd_link[i - 1] = device_link_add(camss->dev, camss->genpd[i - 1],
+							   DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
+							   DL_FLAG_RPM_ACTIVE);
+		if (!camss->genpd_link[i - 1]) {
 			ret = -EINVAL;
 			goto fail_pm;
 		}
-
-		last_pm_domain = i;
 	}
 
 	return 0;
 
 fail_pm:
-	for (i = 0; i < last_pm_domain; i++) {
-		device_link_del(camss->genpd_link[i]);
+	for (--i ; i >= 0; i--)
 		dev_pm_domain_detach(camss->genpd[i], true);
-	}
 
 	return ret;
 }
@@ -1711,10 +1712,11 @@ void camss_delete(struct camss *camss)
 	if (camss->genpd_num == 1)
 		return;
 
-	for (i = 0; i < camss->genpd_num; i++) {
-		device_link_del(camss->genpd_link[i]);
+	if (camss->genpd_num > camss->vfe_num)
+		device_link_del(camss->genpd_link[camss->genpd_num - 1]);
+
+	for (i = 0; i < camss->genpd_num; i++)
 		dev_pm_domain_detach(camss->genpd[i], true);
-	}
 }
 
 /*
-- 
2.33.0

