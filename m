Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82F81540040
	for <lists+linux-media@lfdr.de>; Tue,  7 Jun 2022 15:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244849AbiFGNlF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jun 2022 09:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243700AbiFGNlE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jun 2022 09:41:04 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 708E4BBCF4
        for <linux-media@vger.kernel.org>; Tue,  7 Jun 2022 06:41:03 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id l2-20020a05600c1d0200b0039c35ef94c4so7529513wms.4
        for <linux-media@vger.kernel.org>; Tue, 07 Jun 2022 06:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vPC6jxZnfPfgNm+MFhmEhunLFXf399c7vY0MUZYvuGU=;
        b=q/4xL/sdgvlK9gvRefdJknaYtO6jVRw+QgSII+KKedhvZ6gVfvufuqh6rkFUVMEDFu
         LQK4imouXb7W31iozQUeskBgOJnLtO5721jbjOpj4PAYGIZbE0d9/vJ5QASCX2EdDghk
         LyhSYt5Dzzu7CPz65GHJaySYWDWInrW3IA0L4FEsWVZhr3f6I7lHa7qDoN10WnQMRUW4
         xDzI9nMzfREJnsC4DE7GQL+0WtM/TYTzU3RpKtG/nsHm866AOJgtpxGL8orTvuLpMVsO
         HRpdLXXWR1Rgtp8/+c80un9QMQwCqtVUAJQjbyoDIe0asE4PXixFcmRDgwIlBLWeNOjb
         dgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vPC6jxZnfPfgNm+MFhmEhunLFXf399c7vY0MUZYvuGU=;
        b=b2wAAPxHhtLCCiEL7X7s2zqfdRIrvfDsHR14SzFKtIQejm04ot7wB5lnZy296iTtBF
         UsiuLs+MBAYq/LgIMW/Xe46U9ow5UFVPnmRSXaI1gT+tUAj0Uy6msiVwRmqzRK/EFklV
         Pjrb6lkalmlOKkYYmmc92TGZr/7dqR0f96iFPd8rJXtVPbf/ILPraGWEL8J7aIrxtHiv
         rRgOMLOPqjT16LDsC8SgAvS957gwdEA5kUca2uCVRGW+H2GgOpUQWRjfpGt0F2uVgzmK
         KWlU0aI8SjO8UVHIabEuPcjMqQm3hiJQ4WQ2efwKrY5cqI8vItRf3G1HzF07HoPbRZaV
         p2NQ==
X-Gm-Message-State: AOAM530lA0J6OIzvIYrDl0ja5UWbgplFq0PQ1OmUmjzf1YbmCAAwJbuJ
        pltEvgo6nNgR0lEuMZ/13jKnOTJKC7faIuBX
X-Google-Smtp-Source: ABdhPJz86TJAdibcSWQ0FCz127XuuMbcMfcUyOt/cqsyQ1mKDtqeJYR+8BNjfLLlb0vhI6s6TXNUmw==
X-Received: by 2002:a05:600c:1992:b0:397:8d3b:8a9b with SMTP id t18-20020a05600c199200b003978d3b8a9bmr53365160wmq.20.1654609261796;
        Tue, 07 Jun 2022 06:41:01 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k7-20020a5d6d47000000b0020e5e906e47sm17818792wri.75.2022.06.07.06.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 06:41:01 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     dmitry.baryshkov@linaro.org, konrad.dybcio@somainline.org,
        andrey.konovalov@linaro.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 1/2] media: dt-bindings: imx412: Add imx577 compatible string
Date:   Tue,  7 Jun 2022 14:40:56 +0100
Message-Id: <20220607134057.2427663-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607134057.2427663-1-bryan.odonoghue@linaro.org>
References: <20220607134057.2427663-1-bryan.odonoghue@linaro.org>
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

The Sony IMX577 uses the same silicon enabling reference code from Sony in
the available examples provided.

Add an imx577 compatible string to allow for chip differentiation and
accurate description of hardware in dts.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
index 26d1807d0bb6..d1561841ccbc 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
@@ -19,7 +19,10 @@ description:
 
 properties:
   compatible:
-    const: sony,imx412
+    items:
+      - enum:
+          - sony,imx412
+          - sony,imx577
   reg:
     description: I2C address
     maxItems: 1
-- 
2.36.1

