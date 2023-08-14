Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C53177BE11
	for <lists+linux-media@lfdr.de>; Mon, 14 Aug 2023 18:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbjHNQ3r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Aug 2023 12:29:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232516AbjHNQ3a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Aug 2023 12:29:30 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45A1510FB
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 09:29:26 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fe8242fc4dso37271915e9.1
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 09:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692030565; x=1692635365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9FgIR5BO1ZA/xwnNK7HzsY7163eVVAl221xkKgdSQ4=;
        b=t0DrTBKAUnZsOhKTySRBhIZjBEyiCu6lrIZbKlxcEhX6zO1Ez+fk0jM/I6CoLWplDS
         ntt6v5+8AXCoamgE9CwhyNauIGGhB5vI+AUO6towiMb7WC/K62f7Tw69AyzUY5Mmu+ck
         4TqxDvSRKcyTu1c3YonMVg/VVhb6f/FF6NQi54/GTMeuSXqikJpYaLrAix5rsPjDFP7a
         xxOebx1jx3FWvnIfSbh0Mbc5CNX2ZseiM0RbbtmOP7RTPhfCp8sX7ADwJmmZ02MvBins
         oexMWOyPM46Y7BI/3IaFBT5msykygWtnD7W2JiHoGS/xWY14wFfdMJETFskRv0N9Mtkk
         /97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692030565; x=1692635365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9FgIR5BO1ZA/xwnNK7HzsY7163eVVAl221xkKgdSQ4=;
        b=AxBJjoB/Ul5wbauxHVe5EmRANAK8gbYnpMdD9Q/ltef324y+Qdt7LHMq2eteDFp6Cn
         zqhsPuy8JO5HXLyQ/Iij6Q9H9iu5dNFD4JQLWKBwURAjiW8xTO0/eMCtN/KY7+8AxYiS
         QmulHuLESWNs75R/PGmf6nIYNkolFRrM8KlII+xeVZXfBIBMh9RxJ9lIGurjW9/MdloD
         mPUZuO2cZHabT+vS6DIgRsbXMD9Gjpt7dZ/SX5QuacKqEn7g+V8ywZWBIzjX3Lonkp1R
         zvO+pf2/j7Yal+i3fwy1JJz2+/TpJtVHvQeJ9x0hO2j/Za56smnPHiNV+RB9WWVaU/1E
         MntA==
X-Gm-Message-State: AOJu0YwekcqbRqIKXlADZPAh/Qb1hEW+J4uuS2+zDT72S2pY4EMjsloF
        JHbkHcbEBhSPTBoTwYr9Zt3gtg==
X-Google-Smtp-Source: AGHT+IFlFBtMXWXtNjBPfw8b8tvKeO1O7fSNRBA1UJ1pf4U/UG4KqA5s8MZcofKggbrJ3oqsyE9+Bw==
X-Received: by 2002:a05:600c:82c5:b0:3fe:90f:8496 with SMTP id eo5-20020a05600c82c500b003fe090f8496mr7756053wmb.1.1692030564860;
        Mon, 14 Aug 2023 09:29:24 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l14-20020a1c790e000000b003fc16ee2864sm14743475wme.48.2023.08.14.09.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 09:29:24 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 12/14] media: qcom: camss: Functionally decompose CSIPHY clock lookups
Date:   Mon, 14 Aug 2023 17:29:05 +0100
Message-ID: <20230814162907.3878421-13-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814162907.3878421-1-bryan.odonoghue@linaro.org>
References: <20230814162907.3878421-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The csiphyX_timer and csiX_phy values need not be hard-coded. We can
functionally decompose the string matching inside of a loop.

Static string values are brittle, difficult to extend and not required
anyway since the camss->res->csiphy_num value informs us of the number
of CSIPHYs and hence the set of potential clocks for a given CSIPHY.

In simple terms if we have five CSIPHYs we can have no more and no less
than five csiphy_timer clocks. Similarly csi_phy core clocks have a 1:1
relationship with the PHY they clock.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../media/platform/qcom/camss/camss-csiphy.c  | 37 ++++++++++++-------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 0e8c2a59ea241..baf78c525fbfc 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -536,6 +536,15 @@ static int csiphy_init_formats(struct v4l2_subdev *sd,
 	return csiphy_set_format(sd, fh ? fh->state : NULL, &format);
 }
 
+static bool csiphy_match_clock_name(const char *clock_name, const char *format,
+				    int index)
+{
+	char name[CAMSS_RES_MAX];
+
+	snprintf(name, sizeof(name), format, index);
+	return !strcmp(clock_name, name);
+}
+
 /*
  * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
  * @csiphy: CSIPHY device
@@ -550,7 +559,7 @@ int msm_csiphy_subdev_init(struct camss *camss,
 {
 	struct device *dev = camss->dev;
 	struct platform_device *pdev = to_platform_device(dev);
-	int i, j;
+	int i, j, k;
 	int ret;
 
 	csiphy->camss = camss;
@@ -666,19 +675,19 @@ int msm_csiphy_subdev_init(struct camss *camss,
 		for (j = 0; j < clock->nfreqs; j++)
 			clock->freq[j] = res->clock_rate[i][j];
 
-		if (!strcmp(clock->name, "csiphy0_timer") ||
-		    !strcmp(clock->name, "csiphy1_timer") ||
-		    !strcmp(clock->name, "csiphy2_timer") ||
-		    !strcmp(clock->name, "csiphy3_timer") ||
-		    !strcmp(clock->name, "csiphy4_timer") ||
-		    !strcmp(clock->name, "csiphy5_timer"))
-			csiphy->rate_set[i] = true;
-
-		if (camss->res->version == CAMSS_660 &&
-		    (!strcmp(clock->name, "csi0_phy") ||
-		     !strcmp(clock->name, "csi1_phy") ||
-		     !strcmp(clock->name, "csi2_phy")))
-			csiphy->rate_set[i] = true;
+		for (k = 0; k < camss->res->csiphy_num; k++) {
+			csiphy->rate_set[i] = csiphy_match_clock_name(clock->name,
+								      "csiphy%d_timer", k);
+			if (csiphy->rate_set[i])
+				break;
+
+			if (camss->res->version == CAMSS_660) {
+				csiphy->rate_set[i] = csiphy_match_clock_name(clock->name,
+									      "csi%d_phy", k);
+				if (csiphy->rate_set[i])
+					break;
+			}
+		}
 	}
 
 	return 0;
-- 
2.41.0

