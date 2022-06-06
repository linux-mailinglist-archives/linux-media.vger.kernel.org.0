Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1E453E657
	for <lists+linux-media@lfdr.de>; Mon,  6 Jun 2022 19:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238758AbiFFNUi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jun 2022 09:20:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238753AbiFFNUg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jun 2022 09:20:36 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB09E2A8918
        for <linux-media@vger.kernel.org>; Mon,  6 Jun 2022 06:20:35 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id x17so19846946wrg.6
        for <linux-media@vger.kernel.org>; Mon, 06 Jun 2022 06:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W3wjeDaBvPGE4xMwnHXdY2KlUy8cF2wtQvsUCvCLXBA=;
        b=Py9cJcsaLtm6/WeuftlwkjWLv6uOz1CrtWd2SmGQDPsZLaqRWYgf97faU3WhnvogAy
         DgL9XaAs1J4KJqRtzFDBKR1OWzvtFBIylfQjXqw2Td3H7Vo4qgE16jxzYGwHVl/+9UO2
         wdIzTCMefocOQPwSm/ldc4V847ovig5ttpk8gh5Wukx9Du4d+i3WwjwhUvvaHaWQeSSX
         80BajBGy6E9fVO5vk8pIVRZBOLkhGgnyu3YiyrbShGRQBNMqI4kXBVh2KaTUt2Ds93JO
         BQqjXP1o+m0SXSLT+sPp99aRKn7jR+o5QwoTfcyP5qDE0CYp+8I8a5OHZU0v0Sf3jipg
         RUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W3wjeDaBvPGE4xMwnHXdY2KlUy8cF2wtQvsUCvCLXBA=;
        b=mNyWg6wPeCgLifQyuaLiceqJGfXBtRmDNuarDNt7bz/PmgyaA1ZHVPKMrYywNRWiYp
         WFmyptx8vluPHe+/bs0RxbV1sSZv/S8NkYhCwqBZ6+i3eJO/KBsAV4hbfr8HTdChz8aI
         gpWPjOx4AUVT1zi/MVGexYzeXNZs7ABgH+q53hUvGWfM2d4aPxn8KOiCsVzaZD/XpZ/A
         qIwW+2f14ZWNjbRe5ynalaDJhnAPxu3APLy0b9De6Uwiwc161BzeReX0p2YCEl5MOSDD
         EwKoSwm3geAOY5ULNv9zT+axTNQV3QdVh/jw20uK7jPC2APbqbDLABlMXoE/gwAy/COX
         VJhQ==
X-Gm-Message-State: AOAM531S4EJWGKxHb4o01fWx0BkTjOClivCy8jhVeg4agwK33lz5klxs
        nJTgpPL9rYMc0vKD9mCGFkG7rQ==
X-Google-Smtp-Source: ABdhPJyDffxhjtcV+/L5kkTwmgxQbAgXW5U4W9vd/BO+6TOhJuN0xxCpXOgtLkDVf/+xbuD22wpuQQ==
X-Received: by 2002:a5d:5985:0:b0:218:410d:dc67 with SMTP id n5-20020a5d5985000000b00218410ddc67mr3756743wri.189.1654521634349;
        Mon, 06 Jun 2022 06:20:34 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id i12-20020a05600c354c00b0039765a7add4sm21077810wmq.29.2022.06.06.06.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 06:20:33 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, konrad.dybcio@somainline.org,
        bryan.odonoghue@linaro.org, stable@vger.kernel.org
Subject: [PATCH v3 1/5] i2c: qcom-cci: Fix ordering of pm_runtime_xx and i2c_add_adapter
Date:   Mon,  6 Jun 2022 14:20:25 +0100
Message-Id: <20220606132029.2221257-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606132029.2221257-1-bryan.odonoghue@linaro.org>
References: <20220606132029.2221257-1-bryan.odonoghue@linaro.org>
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

When we compile-in the CCI along with the imx412 driver and run on the RB5
we see that i2c_add_adapter() causes the probe of the imx412 driver to
happen.

This probe tries to perform an i2c xfer() and the xfer() in i2c-qcom-cci.c
fails on pm_runtime_get() because the i2c-qcom-cci.c::probe() function has
not completed to pm_runtime_enable(dev).

Fix this sequence by ensuring pm_runtime_xxx() calls happen prior to adding
the i2c adapter.

Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: <stable@vger.kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 5c7cc862f08f..8d078bdb5c1b 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -638,6 +638,11 @@ static int cci_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto error;
 
+	pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
 	for (i = 0; i < cci->data->num_masters; i++) {
 		if (!cci->master[i].cci)
 			continue;
@@ -649,14 +654,12 @@ static int cci_probe(struct platform_device *pdev)
 		}
 	}
 
-	pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
-
 	return 0;
 
 error_i2c:
+	pm_runtime_disable(dev);
+	pm_runtime_dont_use_autosuspend(dev);
+
 	for (--i ; i >= 0; i--) {
 		if (cci->master[i].cci) {
 			i2c_del_adapter(&cci->master[i].adap);
-- 
2.36.1

