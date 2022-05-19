Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF4BD52CB6B
	for <lists+linux-media@lfdr.de>; Thu, 19 May 2022 07:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233882AbiESFO1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 01:14:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbiESFO0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 01:14:26 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04650994D0
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 22:14:23 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id b32so4921985ljf.1
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 22:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6oteEUWo3BejQsY6otGsI/7H4Z8rywbWY+p4jX1sDu0=;
        b=o/lmD8dIZ7zhMvbclflrBPMnxtDMnOUX4yJHfSh+KmEPA69pI6goVFii284+d6nYsN
         Usg0V97p8dtWTc9FHn5IcQL3bvt3shO6uA+D71fKZ/02bUtbiNwvy7xVdSX0Iw/74Sur
         f59qdChYctDLuJhbFrDGQaV5a6hD5lvVct8k2mB4ol8BvbH5HFg20ssfHQjnb3S092g0
         SaJzrzjanqKX/wZ1z3SuJlxH6rkDCJdDZWnMTnQaV4mEf0vgBc54AMqCVONLdWJ/kJpp
         p2oldMHbw6ppViw/Q4zawVkEntsiv1UC5SoIPdWdhdXoAmZnAhFA+KLBGEG/FIK0pJzs
         D14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6oteEUWo3BejQsY6otGsI/7H4Z8rywbWY+p4jX1sDu0=;
        b=K1atePYL60veLzJzyilZMhOmEPNLJ/HUD4SKSU6x9UUx1baUwvEoKjM8JPBIb1DZZA
         kfzXiqvr37UY9GOI0kplmY2uhbLOjwZkh9U6NnRakfPEbQ/j3f1oy5Lk0Jm/Jgs0UybJ
         tsJhfQo+ViESVwPybAwJSNX6GXPecawbjKiwBdXIuRV0ucNq2g5qWacLPdHaJvvNUYi+
         ppm2TyvL0o7OynIYHiDx6ah+m1S4D/UoyBFEL3ywIXTz6kDEFRmk6rejRUeDMPoUF/f9
         mT6Y3HEnEf0dLAoxDNvamVUyhGpUeRJEYOqi+bNqCQxJc3VSSLn+0qgsXqzAaXPmfWsI
         486Q==
X-Gm-Message-State: AOAM533yllu3WYTF09h+ZmRwbyS+sZspYizucjwox0dAwVbTkzVsGRLl
        sRkew2OtnFYoPSp09tsUNuRIYg==
X-Google-Smtp-Source: ABdhPJz5IbbCgXnvKwiosEWp8lM34Jx9WjqXwq5EmZzsE21zlHBLbc7OmA5o50iLfPGOlow1y4CGRw==
X-Received: by 2002:a2e:aa14:0:b0:24f:25ed:e0a2 with SMTP id bf20-20020a2eaa14000000b0024f25ede0a2mr1584145ljb.43.1652937261325;
        Wed, 18 May 2022 22:14:21 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-b04822-211.dhcp.inet.fi. [176.72.34.211])
        by smtp.gmail.com with ESMTPSA id y25-20020ac24219000000b0047255d2119esm148361lfh.205.2022.05.18.22.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 22:14:20 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] media: camss: Allocate camss struct as a managed device resource
Date:   Thu, 19 May 2022 08:14:15 +0300
Message-Id: <20220519051415.1198248-1-vladimir.zapolskiy@linaro.org>
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

The change simplifies driver's probe and remove functions, no functional
change is intended.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v1 to v2:
* rebased on top of media/master

 drivers/media/platform/qcom/camss/camss.c | 33 +++++++----------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 79ad82e233cb..2055233af101 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1529,7 +1529,7 @@ static int camss_probe(struct platform_device *pdev)
 	struct camss *camss;
 	int num_subdevs, ret;
 
-	camss = kzalloc(sizeof(*camss), GFP_KERNEL);
+	camss = devm_kzalloc(dev, sizeof(*camss), GFP_KERNEL);
 	if (!camss)
 		return -ENOMEM;
 
@@ -1567,39 +1567,30 @@ static int camss_probe(struct platform_device *pdev)
 		camss->csid_num = 4;
 		camss->vfe_num = 4;
 	} else {
-		ret = -EINVAL;
-		goto err_free;
+		return -EINVAL;
 	}
 
 	camss->csiphy = devm_kcalloc(dev, camss->csiphy_num,
 				     sizeof(*camss->csiphy), GFP_KERNEL);
-	if (!camss->csiphy) {
-		ret = -ENOMEM;
-		goto err_free;
-	}
+	if (!camss->csiphy)
+		return -ENOMEM;
 
 	camss->csid = devm_kcalloc(dev, camss->csid_num, sizeof(*camss->csid),
 				   GFP_KERNEL);
-	if (!camss->csid) {
-		ret = -ENOMEM;
-		goto err_free;
-	}
+	if (!camss->csid)
+		return -ENOMEM;
 
 	if (camss->version == CAMSS_8x16 ||
 	    camss->version == CAMSS_8x96) {
 		camss->ispif = devm_kcalloc(dev, 1, sizeof(*camss->ispif), GFP_KERNEL);
-		if (!camss->ispif) {
-			ret = -ENOMEM;
-			goto err_free;
-		}
+		if (!camss->ispif)
+			return -ENOMEM;
 	}
 
 	camss->vfe = devm_kcalloc(dev, camss->vfe_num, sizeof(*camss->vfe),
 				  GFP_KERNEL);
-	if (!camss->vfe) {
-		ret = -ENOMEM;
-		goto err_free;
-	}
+	if (!camss->vfe)
+		return -ENOMEM;
 
 	v4l2_async_nf_init(&camss->notifier);
 
@@ -1681,8 +1672,6 @@ static int camss_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&camss->v4l2_dev);
 err_cleanup:
 	v4l2_async_nf_cleanup(&camss->notifier);
-err_free:
-	kfree(camss);
 
 	return ret;
 }
@@ -1709,8 +1698,6 @@ void camss_delete(struct camss *camss)
 		device_link_del(camss->genpd_link[i]);
 		dev_pm_domain_detach(camss->genpd[i], true);
 	}
-
-	kfree(camss);
 }
 
 /*
-- 
2.33.0

