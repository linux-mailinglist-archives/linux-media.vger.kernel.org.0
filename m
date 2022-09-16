Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 146C45BAECD
	for <lists+linux-media@lfdr.de>; Fri, 16 Sep 2022 16:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231977AbiIPOCu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Sep 2022 10:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231872AbiIPOC1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Sep 2022 10:02:27 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18442AB1A0
        for <linux-media@vger.kernel.org>; Fri, 16 Sep 2022 07:02:20 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id n40-20020a05600c3ba800b003b49aefc35fso6667677wms.5
        for <linux-media@vger.kernel.org>; Fri, 16 Sep 2022 07:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=mQ+WNR4+ZoBFRpRt6BX4yAkPkUqFNL1hRrx7xYLMtk8=;
        b=fCQJznlKOHViX/ZDbZiZ/7cc3Rwjl2TsfaCeOteu63mykK9+lyIu4xBwIQsLGW/roi
         QTklzYtLTHBZgR9y53g7RXYWAgkWnC+d5AKfd+0dY6ITfpN45ihpSqioFsJq8wd2YYdn
         IJ00QjUhsKJqGlH8N9GT/iiVgFC75BCfTcQ4/xz8Z10dgWgqpKjyNxErqvwI2IuEjea2
         xoZC/hEuM2GP6plZDw4ClrlUODKSaA8N9vK8Fh8A3t0P7fS8pXWnBgOFqM95dkOT9Bf3
         cG8GMWo4b4343EinDCt8W9vNQT7GehVA+BvMGjiHOZmVGsBPCk4jag5E3QwJE8+jA7z+
         WK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=mQ+WNR4+ZoBFRpRt6BX4yAkPkUqFNL1hRrx7xYLMtk8=;
        b=5MOryhX4HkE+9dey4fEqFrobHgTFsjr0la4/jyoAeeLGfyil9b07/uC50ZcrJeLzj6
         su57zEcxphYGfAus4koKsJevaSdzn04NahT5/s8dYLUPLPOD8OI+1aJTzCfpcp0DIaRS
         DAnsXg3uwAg9xBMGS8IR1xvPBRfE9iW7/omiWwaWUfnN3LrNO3zfi2QhRZEyE6zGlZyJ
         yOg0B4Ju3IkJ+sP87iSQahW4uFvWMMoU7sZY4z2c4cyZw/xwib5fqpuje4+QqCHhW2Ew
         AXOEWqFHYPWxQv8T2MRwxeaW2UfTv9lfI3RVZP6NQlGdG9yO+RRv7e99pRZe3DURdBW7
         STvQ==
X-Gm-Message-State: ACgBeo0/VcsNbeHRlPVVZ4zzj3VeJ0ossmZEgtwLbDQJu7bnzSb7wTAd
        ApSScSqyPd+9XWyrKjiw0jBKPg==
X-Google-Smtp-Source: AA6agR5PnVesYavB8nqBWI4nA2t/SP+djKujIC9/7/y36XCHBtBzmKmo/3ajtq3fguizRthtQGpvBg==
X-Received: by 2002:a7b:cc10:0:b0:3b4:4944:5013 with SMTP id f16-20020a7bcc10000000b003b449445013mr10361546wmh.8.1663336939262;
        Fri, 16 Sep 2022 07:02:19 -0700 (PDT)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f17-20020a1cc911000000b003a61306d79dsm2615041wmb.41.2022.09.16.07.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 07:02:18 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v4 1/3] media: dt-bindings: imx412: Extend compatible strings
Date:   Fri, 16 Sep 2022 15:02:11 +0100
Message-Id: <20220916140213.1310304-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916140213.1310304-1-bryan.odonoghue@linaro.org>
References: <20220916140213.1310304-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add compatible bindings for imx477 and imx577 both of which use the
same silicon enabling reference code from Sony in the available examples
provided.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/media/i2c/sony,imx412.yaml          | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
index 26d1807d0bb6..ebb649c5e4c5 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
@@ -19,7 +19,11 @@ description:
 
 properties:
   compatible:
-    const: sony,imx412
+    items:
+      - enum:
+          - sony,imx412
+          - sony,imx477
+          - sony,imx577
   reg:
     description: I2C address
     maxItems: 1
-- 
2.34.1

