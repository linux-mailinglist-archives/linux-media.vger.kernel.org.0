Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34B9077BB29
	for <lists+linux-media@lfdr.de>; Mon, 14 Aug 2023 16:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232083AbjHNOKs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Aug 2023 10:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231877AbjHNOKP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Aug 2023 10:10:15 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B47A194
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 07:10:14 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fe8242fc4dso35760075e9.1
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 07:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692022213; x=1692627013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRW3uVyacKVMz0n3X0Q3Lp2slVRo4x30QDLpyV/AFPs=;
        b=y5qonWQOj74q+4miQrLJ3794iiCdJAkuwQT8UPSLzik2G94eC7vqSmcxlM+LWZbbJh
         aGTXagyl3w3zF5+TC2SSrAMy9W9GdcstTCUMeBXDJfsse9dSkTCqp0h3WWpTTbSvxyq2
         1aVOt3bW6f4Pg0CNtNziXZA3kvcENup09KOPfkz0Lypfs6jWo4rOwXDySA3Y8yT8/nYQ
         gWaX//S+8J0NbDFnLC9a7ws9QiV56JJJ2U87FhClxf+WU5htN+ny2V5PZkaRncVdicRu
         FyQHDAF47LAk6X2veqAJ9OA368/GY421/EMIrW31s0UgxKWVOkGp07K4fpzOKAjvHcJY
         1hbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692022213; x=1692627013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRW3uVyacKVMz0n3X0Q3Lp2slVRo4x30QDLpyV/AFPs=;
        b=WRzalX1rFTqOoNNtcbHQ3m2XGDBx87HZFt/2dn6fVkqHITCvZTxKraDAdELNrNvm5P
         lIClne8Z8MGBbXiusmB8bkxrX8SMqUWZQ5uCYnD+K2jmCpH7V5HbQndl8JvGw0Btlqj+
         RYY0blPMverKU4dn144yjfQYAqisuND+1/OcxqqAxBRWG3GucosXtTFhEzwQmQ03sHWd
         Ji22jARojwKPEhYgiP5i6/I0qd6ZRULCEXT8xum0WUJhT/aJj3mPCIflGCZqgKHdYdZM
         gxssoJeL+/Um+3uqpeViY4aG+wJazLpQAviEcnUEUz7yoCYnAc0BAIV5q3+2I5sJVEfC
         NxdQ==
X-Gm-Message-State: AOJu0Yyy6TOkk4GWihrF/68kINTLu1ZZ6dmPhSm7t2UXC3ZGN7BGRPGB
        6LlvJUB6pDE/zKsMx4TsuPfq4g==
X-Google-Smtp-Source: AGHT+IElcvFhO4oc6hXDyWfIeD96YZsuBnOqteXXIU1uTizJIh8oDmCC8uiZ9wWrMjrI9OJNpVYtLw==
X-Received: by 2002:a1c:f707:0:b0:3fe:5501:d284 with SMTP id v7-20020a1cf707000000b003fe5501d284mr8140217wmh.11.1692022213145;
        Mon, 14 Aug 2023 07:10:13 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id p5-20020a1c7405000000b003fe1630a8f0sm17232749wmc.24.2023.08.14.07.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 07:10:12 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v0 1/9] media: qcom: camss: Fix pm_domain_on sequence in probe
Date:   Mon, 14 Aug 2023 15:09:59 +0100
Message-ID: <20230814141007.3721197-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814141007.3721197-1-bryan.odonoghue@linaro.org>
References: <20230814141007.3721197-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

