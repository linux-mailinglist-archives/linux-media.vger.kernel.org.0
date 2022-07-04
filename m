Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84B4C5652DA
	for <lists+linux-media@lfdr.de>; Mon,  4 Jul 2022 12:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbiGDK5U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jul 2022 06:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232228AbiGDK5S (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jul 2022 06:57:18 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D00F5B4
        for <linux-media@vger.kernel.org>; Mon,  4 Jul 2022 03:57:17 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id r9so10589547ljp.9
        for <linux-media@vger.kernel.org>; Mon, 04 Jul 2022 03:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=24EtemxVLj76p6FHt7x5hSsqqbPeIvgrJ85Gzsoq1fA=;
        b=uVie8MqTNIkbJQCyaY0q57zRzXqdSBAYsd1YZuZbPUnK61WJqRFCK1DDPTtRwuSiWB
         5SNh7jlE7prHaqVVUjVktQcAWL6/z4i+k49hoxJ4xKa2kVvptEz1AZqeDEHZx4Wkh66s
         RdlPVOfaca8C83kbYFKxv6+XXx3rNDsuPgkYJRKdAM2B92/ucyNvLmXBVYi9fLh1Bidr
         xfQXD7NaE5V1p9pg5W5K5K8QUaAI2HrcKfBLwN2cb8JkdnPQookX+ONDY+ltjwX4bh3Y
         VwzWsm48232UkyUR44i1p4xG1xWoGFA1AphtqXVpuEo7Z0xfEBB+2/sx6xcbTnVisYsT
         MXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=24EtemxVLj76p6FHt7x5hSsqqbPeIvgrJ85Gzsoq1fA=;
        b=57fgBw6ueXfs5zYYgmezfol5aTJUT/Cv5UYlFKYW7PxBF23/acV9GsB0T5mkIo2KlQ
         qeAtql4zVkevkrfJv3OxpjjlDf8L0MxdncZDh7psM6wSe9g0Kthz6QqGfKbZoXtEOxPI
         O+uRs0ZenA7kUfxLJAAwLjtSSIZ7lZgqEsALiXKt6aI7pZRnJmQSHZFi/eowWOy22fU0
         ssJw6iBohCrP92NLMzG1rCb83RJyFlhVxXQLo7AiIg1FSbNiKV5hhjpJZguwGTkCPJT9
         709k37hWHQuxGHDONp+lf5VoBy/ARVESDFJEMJ2zzfejM1tLTbhqKUbDVz43xp2s7bwq
         EWiw==
X-Gm-Message-State: AJIora/KvdNGPuASf2fUlffKrE1EtJaxqSlhIvS5KtMxxV0En9IMiqPv
        tLrq1KlHn1SJVqY+kKFkRlZ/Rg==
X-Google-Smtp-Source: AGRyM1t1Rau0tktu2rQDrthibdA4uIfJne0lVH/uqnef5bVNfZJ/ZBKamcSOMGwBXRAf1LeSMnHxig==
X-Received: by 2002:a05:651c:4d1:b0:25b:b6ab:5b56 with SMTP id e17-20020a05651c04d100b0025bb6ab5b56mr17068928lji.84.1656932236019;
        Mon, 04 Jul 2022 03:57:16 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id o4-20020a2e9444000000b0025a6d6c269esm4948741ljh.41.2022.07.04.03.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 03:57:15 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] media: camss: Do not attach an already attached power domain on MSM8916 platform
Date:   Mon,  4 Jul 2022 13:57:12 +0300
Message-Id: <20220704105712.469657-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
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

The change to dynamically allocated power domains neglected a case of
CAMSS on MSM8916 platform, where a single VFE power domain is neither
attached, linked or managed in runtime in any way explicitly.

This is a special case and it shall be kept as is, because the power
domain management is done outside of the driver, and it's very different
in comparison to all other platforms supported by CAMSS.

Fixes: 929684b7ef4d ("media: camss: Allocate power domain resources dynamically")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index bf716b171c02..9e2899a0cdf4 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1684,6 +1684,14 @@ static int camss_configure_pd(struct camss *camss)
 		return camss->genpd_num;
 	}
 
+	/*
+	 * If a platform device has just one power domain, then it is attached
+	 * at platform_probe() level, thus there shall be no need and even no
+	 * option to attach it again, this is the case for CAMSS on MSM8916.
+	 */
+	if (camss->genpd_num == 1)
+		return 0;
+
 	camss->genpd = devm_kmalloc_array(dev, camss->genpd_num,
 					  sizeof(*camss->genpd), GFP_KERNEL);
 	if (!camss->genpd)
@@ -1923,6 +1931,9 @@ void camss_delete(struct camss *camss)
 
 	pm_runtime_disable(camss->dev);
 
+	if (camss->genpd_num == 1)
+		return;
+
 	for (i = 0; i < camss->genpd_num; i++) {
 		device_link_del(camss->genpd_link[i]);
 		dev_pm_domain_detach(camss->genpd[i], true);
-- 
2.33.0

