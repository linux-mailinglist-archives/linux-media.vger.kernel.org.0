Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE875247D1
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 10:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348357AbiELIX1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 04:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350960AbiELIX0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 04:23:26 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C7C6542D
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 01:23:23 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id v4so5522062ljd.10
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 01:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Xns6lRKpgkcycuMDcfZVrb+jWK/u1DDFjVoHWPKvQQ=;
        b=n5UWQmW63DSH5lrA/ll78g3pG9eepZB23V1YlOKJr4NxHGq28QZiY2P5W+NRnRaUGZ
         SSxF/R/5DbHT+U2qUh3HR1s6NQuR0v0Hqbs5UFSm1h81uVGl66tXWKJBoRTdmzuhPh7e
         Sn81FGUTdSMO3z5J8b3Gci+kwyYld9lsuuFZvovooFk7WWPqa0RnF9dUaHWUNU2ubFNZ
         WmKZbc+XpfpuhEGrZMC15Sh1pOrZHiH+ZFX3M4XMIRMiXSfSGlzowLN6Gk8GTN69GCO6
         nE4UxNrEmpYqVQoUYw8mmDnEIKq2TmTexz07/inyUOnB97Gk6TlTxDJhBg5Jtkvj73zE
         1L1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Xns6lRKpgkcycuMDcfZVrb+jWK/u1DDFjVoHWPKvQQ=;
        b=Y/4UNJXiO2Pc6fLsg9kxjtp1+UZ4/DCwjc/VpX6ZNHPve1oNk/C3jsLDGCqCKkUGoM
         yNsYq7ipGiEZhorMQ25Vj9nyMIkuiFwLfyqWMu14HMJov/uDXy8tDoBh+GcNT6NcIZ1q
         nuf5eIgTcU24exPn2rbJx/AKDoVZwM6upZ/6GmF6ovNJNGhEiVuK4KkJ5eVy/jV2KNS2
         TUb1Y+95DygaRyRG3/48PU89fKVdFCC8yTYz5a/O+TzzgvnnFxebG9sHH8UyQV0yT4NM
         vyAX6JRcqdMi+jJShNHV4rqYEOoS/gwEh46TOf7BJkulKLFmCMJYA757sJ64SXLnsnvg
         zdvw==
X-Gm-Message-State: AOAM531lpbaGYmKxv2dQt796/JU6MVb+reW/NyAK37FXYGcJHtny2sMi
        gpnkjSC41iKQ4Tgi1xbg3QQAqIyUk+mZzQ==
X-Google-Smtp-Source: ABdhPJzDB9IYPxoxMhCG++TmqH9AwjWMv0O86sAt2fG/ia/CvRblYY5pAP4j+ESxUNznisjrbJJ6Nw==
X-Received: by 2002:a2e:9917:0:b0:250:808a:f7c0 with SMTP id v23-20020a2e9917000000b00250808af7c0mr19959222lji.136.1652343802104;
        Thu, 12 May 2022 01:23:22 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-b04827-69.dhcp.inet.fi. [176.72.39.69])
        by smtp.gmail.com with ESMTPSA id k17-20020a056512331100b0047255d21116sm676882lfe.69.2022.05.12.01.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 01:23:21 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] media: camss: Allocate power domain resources dynamically
Date:   Thu, 12 May 2022 11:23:18 +0300
Message-Id: <20220512082318.189398-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To simplify the driver's maintenance it makes sense to escape from
hardcoded numbers of power domain resources per platform and statical
allocation of the resources. For instance on a QCOM SM8450 platform
the number of CAMSS power domains shall be bumped up to 6, also notably
CAMSS on MSM8916 has only one power domain, however it expects to get 2,
and thus it should result in a runtime error on driver probe.

The change fixes an issue mentioned above and gives more flexibility
to support more platforms in future.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 38 +++++++++++++----------
 drivers/media/platform/qcom/camss/camss.h |  7 ++---
 2 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 79ad82e233cb..32d72b4f947b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1452,19 +1452,31 @@ static const struct media_device_ops camss_media_ops = {
 
 static int camss_configure_pd(struct camss *camss)
 {
-	int nbr_pm_domains = 0;
+	struct device *dev = camss->dev;
 	int last_pm_domain = 0;
 	int i;
 	int ret;
 
-	if (camss->version == CAMSS_8x96 ||
-	    camss->version == CAMSS_660)
-		nbr_pm_domains = PM_DOMAIN_GEN1_COUNT;
-	else if (camss->version == CAMSS_845 ||
-		 camss->version == CAMSS_8250)
-		nbr_pm_domains = PM_DOMAIN_GEN2_COUNT;
+	camss->genpd_num = of_count_phandle_with_args(dev->of_node,
+						      "power-domains",
+						      "#power-domain-cells");
+	if (camss->genpd_num < 0) {
+		dev_err(dev, "Power domains are not defined for camss\n");
+		return camss->genpd_num;
+	}
+
+	camss->genpd = devm_kmalloc_array(dev, camss->genpd_num,
+					  sizeof(*camss->genpd), GFP_KERNEL);
+	if (!camss->genpd)
+		return -ENOMEM;
 
-	for (i = 0; i < nbr_pm_domains; i++) {
+	camss->genpd_link = devm_kmalloc_array(dev, camss->genpd_num,
+					       sizeof(*camss->genpd_link),
+					       GFP_KERNEL);
+	if (!camss->genpd_link)
+		return -ENOMEM;
+
+	for (i = 0; i < camss->genpd_num; i++) {
 		camss->genpd[i] = dev_pm_domain_attach_by_id(camss->dev, i);
 		if (IS_ERR(camss->genpd[i])) {
 			ret = PTR_ERR(camss->genpd[i]);
@@ -1689,7 +1701,6 @@ static int camss_probe(struct platform_device *pdev)
 
 void camss_delete(struct camss *camss)
 {
-	int nbr_pm_domains = 0;
 	int i;
 
 	v4l2_device_unregister(&camss->v4l2_dev);
@@ -1698,14 +1709,7 @@ void camss_delete(struct camss *camss)
 
 	pm_runtime_disable(camss->dev);
 
-	if (camss->version == CAMSS_8x96 ||
-	    camss->version == CAMSS_660)
-		nbr_pm_domains = PM_DOMAIN_GEN1_COUNT;
-	else if (camss->version == CAMSS_845 ||
-		 camss->version == CAMSS_8250)
-		nbr_pm_domains = PM_DOMAIN_GEN2_COUNT;
-
-	for (i = 0; i < nbr_pm_domains; i++) {
+	for (i = 0; i < camss->genpd_num; i++) {
 		device_link_del(camss->genpd_link[i]);
 		dev_pm_domain_detach(camss->genpd[i], true);
 	}
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index c9b3e0df5be8..0db80cadbbaa 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -69,9 +69,7 @@ struct resources_icc {
 enum pm_domain {
 	PM_DOMAIN_VFE0 = 0,
 	PM_DOMAIN_VFE1 = 1,
-	PM_DOMAIN_GEN1_COUNT = 2,	/* CAMSS series of ISPs */
 	PM_DOMAIN_VFELITE = 2,		/* VFELITE / TOP GDSC */
-	PM_DOMAIN_GEN2_COUNT = 3,	/* Titan series of ISPs */
 };
 
 enum camss_version {
@@ -101,8 +99,9 @@ struct camss {
 	int vfe_num;
 	struct vfe_device *vfe;
 	atomic_t ref_count;
-	struct device *genpd[PM_DOMAIN_GEN2_COUNT];
-	struct device_link *genpd_link[PM_DOMAIN_GEN2_COUNT];
+	int genpd_num;
+	struct device **genpd;
+	struct device_link **genpd_link;
 	struct icc_path *icc_path[ICC_SM8250_COUNT];
 	struct icc_bw_tbl icc_bw_tbl[ICC_SM8250_COUNT];
 };
-- 
2.33.0

