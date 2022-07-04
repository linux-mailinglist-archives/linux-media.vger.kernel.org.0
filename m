Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4CC1565F64
	for <lists+linux-media@lfdr.de>; Tue,  5 Jul 2022 00:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232113AbiGDWQA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jul 2022 18:16:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbiGDWP7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jul 2022 18:15:59 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCFB265D5
        for <linux-media@vger.kernel.org>; Mon,  4 Jul 2022 15:15:57 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id c15so12492428ljr.0
        for <linux-media@vger.kernel.org>; Mon, 04 Jul 2022 15:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qMaaTD6K4yj5INE84+CHyBEn/aNUZ8YByRBxEmdS9GY=;
        b=cZp6xF6fylogO2aUg0wHko3yH//q6LGiNN+1IhlU5LoNjPWOdFXC/fN7M+HvJCPI0y
         DuRRYMcYzsNxaAJE8LrLYwXZ2FAqm4rHYwxLXwv90mXG2xjU7zh1UEA4cKSDcxb6FYo1
         VOVY/CbVp7RWZf8Ir1LlHmHBz8fZODr1Ux4BZca2Y5BCbkHd/tDcbW84CdKJSpyPCCvN
         tNAki2maSPNLYOqlNoUo/s32SAkgKC9EKj8d61NpyakLy4y40MG5hOcpkB134FrQ/aSE
         65y42G/QjTEHdCrgtZD2tROEhuflMESL/V04XO9nQDQz/EgWbZGcWMwktYOsz20aHGLn
         PRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qMaaTD6K4yj5INE84+CHyBEn/aNUZ8YByRBxEmdS9GY=;
        b=MxG09rTqtL0JP84uQawdwj2etUCq4hYC2HblgeuasVlXwC6TSMT7Pu0OecmURwZbJr
         kK932rsaAT6X3hv4S9qUhFErh3HK7vYIZY93HwVAmJnkj1SWL2WMcQaOc9/X/pbdckQM
         8ErKasxC92e7Jsqeq8KuNWccLBc1INX3kiXV0ArRpqvo7tUf69uEjgD2k8y1lbRmMz1r
         Q5Q4A5jzPv3LNQJQf9B9Ag9ibGosntJfAyprTbNbSuVCSExYZhlt3bF8iqdjiY/vkmIY
         WvLMWvvUENpq63XeGgE+FeWk4kcrrkiecTMHu3A0pGu17TeLD+6iLMRuLU2lfT/0ta4B
         T6LQ==
X-Gm-Message-State: AJIora8A1aoBBpbCr44Jkmqe/EUmz/uU6Xmn0JzS33Bdf1QkLRk/RHle
        eL40YuGZbjUyNxqsdof+Y0R/GQ==
X-Google-Smtp-Source: AGRyM1uFR3sxlz1crihojTuAgbEK6rvojI9bAu9oS76JB1qsAORtNrh7zczoLh7mVZr9RliEguiU/Q==
X-Received: by 2002:a2e:b004:0:b0:25a:8d4e:a3f6 with SMTP id y4-20020a2eb004000000b0025a8d4ea3f6mr18256085ljk.70.1656972956285;
        Mon, 04 Jul 2022 15:15:56 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id o13-20020ac25e2d000000b0047f660822e0sm5319931lfg.289.2022.07.04.15.15.55
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
Subject: [PATCH 1/2] media: camss: Collect information about a number of lite VFEs
Date:   Tue,  5 Jul 2022 01:15:47 +0300
Message-Id: <20220704221548.629302-2-vladimir.zapolskiy@linaro.org>
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

VFE lite IPs are found on CAMSS with TITAN_TOP power domains, and in
some aspects these types of VFEs are different, in particular there
is no need to enable VFE power domains to operate over VFE lite IPs.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 20 +++++++++++---------
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 7a929f19e79b..795eebd9af6c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1170,7 +1170,7 @@ static int camss_init_subdevices(struct camss *camss)
 	}
 
 	/* note: SM8250 requires VFE to be initialized before CSID */
-	for (i = 0; i < camss->vfe_num; i++) {
+	for (i = 0; i < camss->vfe_num + camss->vfe_lite_num; i++) {
 		ret = msm_vfe_subdev_init(camss, &camss->vfe[i],
 					  &vfe_res[i], i);
 		if (ret < 0) {
@@ -1242,7 +1242,7 @@ static int camss_register_entities(struct camss *camss)
 		goto err_reg_ispif;
 	}
 
-	for (i = 0; i < camss->vfe_num; i++) {
+	for (i = 0; i < camss->vfe_num + camss->vfe_lite_num; i++) {
 		ret = msm_vfe_register_entities(&camss->vfe[i],
 						&camss->v4l2_dev);
 		if (ret < 0) {
@@ -1314,7 +1314,7 @@ static int camss_register_entities(struct camss *camss)
 				}
 	} else {
 		for (i = 0; i < camss->csid_num; i++)
-			for (k = 0; k < camss->vfe_num; k++)
+			for (k = 0; k < camss->vfe_num + camss->vfe_lite_num; k++)
 				for (j = 0; j < camss->vfe[k].line_num; j++) {
 					struct v4l2_subdev *csid = &camss->csid[i].subdev;
 					struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
@@ -1338,7 +1338,7 @@ static int camss_register_entities(struct camss *camss)
 	return 0;
 
 err_link:
-	i = camss->vfe_num;
+	i = camss->vfe_num + camss->vfe_lite_num;
 err_reg_vfe:
 	for (i--; i >= 0; i--)
 		msm_vfe_unregister_entities(&camss->vfe[i]);
@@ -1377,7 +1377,7 @@ static void camss_unregister_entities(struct camss *camss)
 
 	msm_ispif_unregister_entities(camss->ispif);
 
-	for (i = 0; i < camss->vfe_num; i++)
+	for (i = 0; i < camss->vfe_num + camss->vfe_lite_num; i++)
 		msm_vfe_unregister_entities(&camss->vfe[i]);
 }
 
@@ -1579,13 +1579,15 @@ static int camss_probe(struct platform_device *pdev)
 		camss->version = CAMSS_845;
 		camss->csiphy_num = 4;
 		camss->csid_num = 3;
-		camss->vfe_num = 3;
+		camss->vfe_num = 2;
+		camss->vfe_lite_num = 1;
 	} else if (of_device_is_compatible(dev->of_node,
 					   "qcom,sm8250-camss")) {
 		camss->version = CAMSS_8250;
 		camss->csiphy_num = 6;
 		camss->csid_num = 4;
-		camss->vfe_num = 4;
+		camss->vfe_num = 2;
+		camss->vfe_lite_num = 2;
 	} else {
 		return -EINVAL;
 	}
@@ -1607,8 +1609,8 @@ static int camss_probe(struct platform_device *pdev)
 			return -ENOMEM;
 	}
 
-	camss->vfe = devm_kcalloc(dev, camss->vfe_num, sizeof(*camss->vfe),
-				  GFP_KERNEL);
+	camss->vfe = devm_kcalloc(dev, camss->vfe_num + camss->vfe_lite_num,
+				  sizeof(*camss->vfe), GFP_KERNEL);
 	if (!camss->vfe)
 		return -ENOMEM;
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 0db80cadbbaa..3acd2b3403e8 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -97,6 +97,7 @@ struct camss {
 	struct csid_device *csid;
 	struct ispif_device *ispif;
 	int vfe_num;
+	int vfe_lite_num;
 	struct vfe_device *vfe;
 	atomic_t ref_count;
 	int genpd_num;
-- 
2.33.0

