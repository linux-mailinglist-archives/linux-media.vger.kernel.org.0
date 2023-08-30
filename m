Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5CBD78D80D
	for <lists+linux-media@lfdr.de>; Wed, 30 Aug 2023 20:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbjH3S3T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Aug 2023 14:29:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245435AbjH3PQX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Aug 2023 11:16:23 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96AF41AE
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 08:16:20 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-401b3ea0656so51977995e9.0
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 08:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693408579; x=1694013379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOr+4Q4O8js5VPsFrpRsc5FODaqo2yqRB7TUWvv+VpU=;
        b=noBAXhEn3o98uPhUDQ1ZVei3wMoy3M8xK6oX1ujv5YrKlMyXzO0ycF2nO7pLvHZzQt
         v3OV9TNFHJa/8Yop6NzknEkjO5PqNjXpdj25bK4Gecx3HebahUYuECeaf+HD+iquV5lP
         Qswlj8ruVi90A2R/g79oc/PiiEMCKJO8A0BcIBrEXFqjZuMV6dECl3l7JwoPRY9Brqxc
         fw+cRFiQJrb5gWHbuY0t1TVLxCADgVdwLbf3RXxHiIoCQrcgbzJdXuyHjaOCy43ns+QK
         lWhkd1r96fHh161zijQyEhdcmoWWUzAyfE7E9G0QveAZbD81K2EPtaB7xVbeww58LNWd
         JPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693408579; x=1694013379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IOr+4Q4O8js5VPsFrpRsc5FODaqo2yqRB7TUWvv+VpU=;
        b=WkkHpyGU3yNwMfnrz9qqO0p9lex9Lw3m82TLBlcsmghkdBZKfDzsVtiRqAKQyl7eCr
         pwVMcV5Zy97QCEyfNJoQFl9G8a08UVubj/PIBe42uk4eA0mgB9+qczEDv56YY9Zpjnqn
         5fTnSOKJfqa6u6oiewj07EzotktrcyPSBcfmtSv9ZYyLzNSW348QsqA5e6uyrY1TDxBh
         vN50ddOjZpJmWSuIw8IPte/judK3bC7d32hcdco5CC8xc9x37f+n/Dm8dMdEqZOPetMN
         lwstHWmO7mgO5f6nRMoSUv5+tv4H0Gg5nXEhViKI0wZgL6vbSb5eUust+z3Qhu8PQDS9
         Mh8A==
X-Gm-Message-State: AOJu0YwFhg3nvu95IOAQRLmaoazniMD6iH4RP1bTemIJdJDcxwu+VmFv
        9hunTuWvUJ5+gcEzNQFqCUDsyQ==
X-Google-Smtp-Source: AGHT+IEKC6cOxtJYGq6gCbsSJ0Xm7p8iCIMIWMiCrClAhVF2NUHbJVoSqh/MG5NPh4r+YOmIm2Wtwg==
X-Received: by 2002:a05:600c:20d5:b0:401:b493:f7c0 with SMTP id y21-20020a05600c20d500b00401b493f7c0mr2197409wmm.2.1693408579146;
        Wed, 30 Aug 2023 08:16:19 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b16-20020a5d4d90000000b0030fd03e3d25sm16989961wru.75.2023.08.30.08.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 08:16:18 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v3 01/10] media: qcom: camss: Fix pm_domain_on sequence in probe
Date:   Wed, 30 Aug 2023 16:16:06 +0100
Message-ID: <20230830151615.3012325-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830151615.3012325-1-bryan.odonoghue@linaro.org>
References: <20230830151615.3012325-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We need to make sure camss_configure_pd() happens before
camss_register_entities() as the vfe_get() path relies on the pointer
provided by camss_configure_pd().

Fix the ordering sequence in probe to ensure the pointers vfe_get() demands
are present by the time camss_register_entities() runs.

In order to facilitate backporting to stable kernels I've moved the
configure_pd() call pretty early on the probe() function so that
irrespective of the existence of the old error handling jump labels this
patch should still apply to -next circa Aug 2023 to v5.13 inclusive.

Fixes: 2f6f8af67203 ("media: camss: Refactor VFE power domain toggling")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/qcom/camss/camss.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index f11dc59135a5a..75991d849b571 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1619,6 +1619,12 @@ static int camss_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_cleanup;
 
+	ret = camss_configure_pd(camss);
+	if (ret < 0) {
+		dev_err(dev, "Failed to configure power domains: %d\n", ret);
+		goto err_cleanup;
+	}
+
 	ret = camss_init_subdevices(camss);
 	if (ret < 0)
 		goto err_cleanup;
@@ -1678,12 +1684,6 @@ static int camss_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = camss_configure_pd(camss);
-	if (ret < 0) {
-		dev_err(dev, "Failed to configure power domains: %d\n", ret);
-		return ret;
-	}
-
 	pm_runtime_enable(dev);
 
 	return 0;
-- 
2.41.0

