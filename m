Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6E25011CE
	for <lists+linux-media@lfdr.de>; Thu, 14 Apr 2022 17:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343960AbiDNOZH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 10:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349428AbiDNOUI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 10:20:08 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79660A27D4
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 07:11:13 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id m14so7101525wrb.6
        for <linux-media@vger.kernel.org>; Thu, 14 Apr 2022 07:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k3gcIDeCZ4FNN7UJi4DooXXT3wAgGZnORf6hg3bDQ7g=;
        b=pyYP5jTZGe1iIdHDva19cy+FXngavEB3nCuwJeLMONWVdDmXn0E8RKrg+0rOq0u3tW
         d0JxgTsu84DPkeNL91wMOiRqMerMqGQqqJqb52XEIxh7FQ0PhWL5UZwNnNnVUWZ3V4EA
         1JsqvSS5rGl+OBMZulolrTIV1s+Dj98XZpaKtntpE3dFyRfv7QHIUPs+ZOy+fYhRuXFC
         QYoA+42MaRKLVc/Ou/CVFzuwLCWyGleWt/t4ubPVFMYYdB2kWYC9PaEYDiqSQkSiXHX0
         xnm1IBIjDzR10x03a7FraNHA+10hzWX+h5BuC6scYa+iLx/PoraVGtC2EvuT2KMcFNBM
         XWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k3gcIDeCZ4FNN7UJi4DooXXT3wAgGZnORf6hg3bDQ7g=;
        b=TZJP+Xc4Ik/WKOVG4aF5rNYVTK0ryZPhKfo8xJ8qASdoFgCfSDKCPzod3/n2zWRCj2
         DS95hyNhV2ZST90WIrJd3tqp5YyHqo5bbjzJDTAXySEL/0eIIDKY4xw/WNJf2wS2zR7M
         ZnQqg0hz4yiUn3hte3ygf+kvvHJ0LfOtFTdiTNz1XyE56cWgEanta17KYtC8noZgu3fW
         1wb/Tc6WPhBj+Pd5ZcRkzjAeRqNLe0HX+XGmxFrG3V6PcknMhMu6+Isbk00q1z0N9o9v
         5iVzjy71JpJrvT3R75nwrFgqoqsASJZlGUwJ4VsbWpYgDPfDzsw2EozzHJBwavkl6yAy
         bOyA==
X-Gm-Message-State: AOAM532i/YG9ASObnZ4C+LKh/o+XG0KBDf+QLLmgZs+O/Y2K2QigNM5V
        kibFDmRf2F8xKFauxo8wES5ymA==
X-Google-Smtp-Source: ABdhPJzd87u4VitFe0hrj8sBPdroXixiqIUTNvmbFlySF6f6F5CRIzf/Iv3BIk/sb2XQY5K0qxBF3A==
X-Received: by 2002:adf:f98e:0:b0:207:9eed:60d8 with SMTP id f14-20020adff98e000000b002079eed60d8mr2304802wrr.566.1649945471907;
        Thu, 14 Apr 2022 07:11:11 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 61-20020adf8043000000b00205e1d92a41sm1934551wrk.74.2022.04.14.07.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 07:11:11 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robert.foss@linaro.org, hfink@snap.com, jgrahsl@snap.com,
        dmitry.baryshkov@linaro.org, vladimir.zapolskiy@linaro.org,
        bryan.odonoghue@linaro.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/3] media: dt-bindings: imx412: Add regulator descriptions
Date:   Thu, 14 Apr 2022 15:11:06 +0100
Message-Id: <20220414141108.1365476-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414141108.1365476-1-bryan.odonoghue@linaro.org>
References: <20220414141108.1365476-1-bryan.odonoghue@linaro.org>
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

The imx412 like many I2C camera sensors has three voltage rails which
depending on platform may be necessary to switch power onto directly.

Add in as optional rails so as not to break anything for existing users.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/media/i2c/sony,imx412.yaml       | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
index afcf70947f7e..26d1807d0bb6 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
@@ -32,6 +32,15 @@ properties:
     description: Clock frequency 6MHz, 12MHz, 18MHz, 24MHz or 27MHz
     maxItems: 1
 
+  dovdd-supply:
+    description: Interface power supply.
+
+  avdd-supply:
+    description: Analog power supply.
+
+  dvdd-supply:
+    description: Digital power supply.
+
   reset-gpios:
     description: Reference to the GPIO connected to the XCLR pin, if any.
     maxItems: 1
-- 
2.35.1

