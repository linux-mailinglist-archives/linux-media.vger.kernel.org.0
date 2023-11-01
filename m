Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABFC7DDFEF
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 11:55:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234811AbjKAKz5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Nov 2023 06:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233467AbjKAKzg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Nov 2023 06:55:36 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E76C110
        for <linux-media@vger.kernel.org>; Wed,  1 Nov 2023 03:55:30 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-32dbbf3c782so410031f8f.1
        for <linux-media@vger.kernel.org>; Wed, 01 Nov 2023 03:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698836128; x=1699440928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tv2R/vFkv5aw1eD9VUmJogdPL3QNVlhIxcpLogPWtuI=;
        b=hJ6AUxL3rDPnxeV5To2ClhRPDOTkhpuYNfQY9EY0cV3sIasdFcCtlnDgiF7xD9fWrI
         tomu9Y8UkPGRl5uRDzQMscE8zPo0G+MktW5ielPlLeoN0TMSGPiPoY7cKGpjytXGzjWF
         0hsrkY/UZiSucVsrOoAfLknkKu/CJvNU4z7xJ1p79VEm1LSOlfLPiVQwaz4GEBrzNlNL
         upcnCcdTzIb8eioOyRBMdmt4T4KFevOE3ZgH46/+tXSxH4pCBnwpfXnaB4VqpPRX1uGk
         xI2z/v8aAvanTs+Cs+19XYd3TovHYdEqRkG1PXJI65/lCPJY7ECz5MklhlhH2mXA2gm9
         0c2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698836128; x=1699440928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tv2R/vFkv5aw1eD9VUmJogdPL3QNVlhIxcpLogPWtuI=;
        b=VowyTFvPiBXxRcEe/PB4694cn9KKS88DSSm4KbzaEnGQBLdEJwi+c6S4TdskwPsDbq
         vZeN/pw43mEx6E6j77XfO6FecXdSLTtWDFI++TcesTQMu6chKYJmD/P2kgnxWrX8E0eJ
         20JSrwvj7t3FXWGqBGukl7XTFmQs0o+SzAt5471V7Uh00gQshMqzw9tYkN47sCeCy2SQ
         NGqt9P0gKv5nI1zak8F/q1F0lm7GNhr2p2mb0zZb+tvlcDSVNZdFJ/bqkeRcaTfa0YAn
         Yqr5gw9hSNyQyfpaNRh7qx+owT3ZhU3qmq89Ma8O6zzbIHw9fByX7ldouPaIyc1TqvZD
         OGoQ==
X-Gm-Message-State: AOJu0YxSEQQPdt2bE7XGKimnkyGiNueq4KCRyjSpAK8wIT2myt36nWZo
        14YN7jdhxFVSIewjufuzQEE9Uw==
X-Google-Smtp-Source: AGHT+IHnjLgTLiFStrcS6i1t2P65Kpb20s5fRHwbOmiZm6Mwj/MKNH2Lq646EHjDXicAYgx2p4c0MQ==
X-Received: by 2002:a5d:5847:0:b0:32f:7a22:8b42 with SMTP id i7-20020a5d5847000000b0032f7a228b42mr2576503wrf.23.1698836128599;
        Wed, 01 Nov 2023 03:55:28 -0700 (PDT)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d6542000000b0032d09f7a713sm3830948wrv.18.2023.11.01.03.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 03:55:28 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date:   Wed, 01 Nov 2023 10:54:35 +0000
Subject: [PATCH v3 5/5] media: qcom: camss: Add support for named
 power-domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231101-b4-camss-named-power-domains-v3-5-bbdf5f22462a@linaro.org>
References: <20231101-b4-camss-named-power-domains-v3-0-bbdf5f22462a@linaro.org>
In-Reply-To: <20231101-b4-camss-named-power-domains-v3-0-bbdf5f22462a@linaro.org>
To:     hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        matti.lehtimaki@gmail.com
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.13-dev-26615
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Right now we use fixed indexes to assign power-domains, with a
requirement for the TOP GDSC to come last in the list.

Adding support for named power-domains means the declaration in the dtsi
can come in any order.

After this change we continue to support the old indexing - if a SoC
resource declaration or the in-use dtb doesn't declare power-domain names
we fall back to the default legacy indexing.

From this point on though new SoC additions should contain named
power-domains, eventually we will drop support for legacy indexing.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 24 +++++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.c     | 26 +++++++++++++++++++++-----
 drivers/media/platform/qcom/camss/camss.h     |  2 ++
 3 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index defff24f07ce3..123e5ead7602d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1382,7 +1382,29 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 	if (!res->line_num)
 		return -EINVAL;
 
-	if (res->has_pd) {
+	/* Power domain */
+
+	if (res->pd_name) {
+		vfe->genpd = dev_pm_domain_attach_by_name(camss->dev,
+							  res->pd_name);
+		if (IS_ERR(vfe->genpd)) {
+			ret = PTR_ERR(vfe->genpd);
+			return ret;
+		}
+	}
+
+	if (!vfe->genpd && res->has_pd) {
+		/*
+		 * Legacy magic index.
+		 * Requires
+		 * power-domain = <VFE_X>,
+		 *                <VFE_Y>,
+		 *                <TITAN_TOP>
+		 * id must correspondng to the index of the VFE which must
+		 * come before the TOP GDSC. VFE Lite has no individually
+		 * collapasible domain which is why id < vfe_num is a valid
+		 * check.
+		 */
 		vfe->genpd = dev_pm_domain_attach_by_id(camss->dev, id);
 		if (IS_ERR(vfe->genpd)) {
 			ret = PTR_ERR(vfe->genpd);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 415164bf00402..83c0c28a8c953 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1514,12 +1514,28 @@ static int camss_configure_pd(struct camss *camss)
 		return 0;
 
 	/*
-	 * VFE power domains are in the beginning of the list, and while all
-	 * power domains should be attached, only if TITAN_TOP power domain is
-	 * found in the list, it should be linked over here.
+	 * If a power-domain name is defined try to use it.
+	 * It is possible we are running a new kernel with an old dtb so
+	 * fallback to indexes even if a pd_name is defined but not found.
 	 */
-	camss->genpd = dev_pm_domain_attach_by_id(camss->dev, camss->genpd_num - 1);
-	if (IS_ERR(camss->genpd)) {
+	if (camss->res->pd_name) {
+		camss->genpd = dev_pm_domain_attach_by_name(camss->dev,
+							    camss->res->pd_name);
+		if (IS_ERR(camss->genpd)) {
+			ret = PTR_ERR(camss->genpd);
+			goto fail_pm;
+		}
+	}
+
+	if (!camss->genpd) {
+		/*
+		 * Legacy magic index. TITAN_TOP GDSC must be the last
+		 * item in the power-domain list.
+		 */
+		camss->genpd = dev_pm_domain_attach_by_id(camss->dev,
+							  camss->genpd_num - 1);
+	}
+	if (IS_ERR_OR_NULL(camss->genpd)) {
 		ret = PTR_ERR(camss->genpd);
 		goto fail_pm;
 	}
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 1ba824a2cb76c..cd8186fe1797b 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -48,6 +48,7 @@ struct camss_subdev_resources {
 	u32 clock_rate[CAMSS_RES_MAX][CAMSS_RES_MAX];
 	char *reg[CAMSS_RES_MAX];
 	char *interrupt[CAMSS_RES_MAX];
+	char *pd_name;
 	u8 line_num;
 	bool has_pd;
 	const void *ops;
@@ -84,6 +85,7 @@ enum icc_count {
 
 struct camss_resources {
 	enum camss_version version;
+	const char *pd_name;
 	const struct camss_subdev_resources *csiphy_res;
 	const struct camss_subdev_resources *csid_res;
 	const struct camss_subdev_resources *ispif_res;

-- 
2.42.0

