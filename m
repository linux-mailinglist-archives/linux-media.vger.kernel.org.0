Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8EF14FAEF7
	for <lists+linux-media@lfdr.de>; Sun, 10 Apr 2022 18:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243615AbiDJQiN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Apr 2022 12:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243609AbiDJQiK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Apr 2022 12:38:10 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCDCE3AA58
        for <linux-media@vger.kernel.org>; Sun, 10 Apr 2022 09:35:58 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id i20so6586270wrb.13
        for <linux-media@vger.kernel.org>; Sun, 10 Apr 2022 09:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nz+8z7lU6Hjr3OWaRn2W5qjAwAOaEVnr0lrLZw293X4=;
        b=iODvnRmO4vn/UJ4raGboPDiwjqUfs4FOwiNJcTEynxUz7cOOU0tewKaLpNyVbrxtY/
         HkMJTPxZsfayBJ+Vroio2FHH6T610hIo7nNla+qQLFEiymZ9Vh7ZIuoe46tYFD7rcI3s
         UE84Hr0KkSknV2pDTBq1vhS3NhkLf2hosUbRxwQJMXd9REaoQzBQYUvKrGmA7c4o07R9
         FsP6qcW8dmRXBJItMFPGxwCfeg5Evkxzp2Sa/etLvk1p5FxPNWIlXJOOzZT6usMRJOro
         yjKo6DGVFqmKURgjKNIP7FrinMJKwyULeMadXAlKSppuC9/1hpS4UI8mfJnbJyjaTYh0
         p7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nz+8z7lU6Hjr3OWaRn2W5qjAwAOaEVnr0lrLZw293X4=;
        b=XdgdfvvNElIE0N7EkcCg08ySJVzOigFlAlDOWmVMUAHCq2uCaI63QbaGYZJoB2UeDx
         nn3RYasWJCYw2rLRmkSTpt2k4361oizXXTxUO1w2S04IL1oJ4hirrN7w+tIY+8eNQZT5
         blqnIQgitfYbNFgc2fHEn6qrnn07hMy+9zQjejf/8jakJDQfNW5rHty/tIsUp5ui9F0B
         Z21rBdg4AT64dMDWSMu8q7mmoFbblVn5rTA2iL3CgvxXShpgGATBraZz2tjADdbwlwYa
         LF+UJjBXdKlX2IhVGk8b5cLBGRSpvY/gQcRawafzAcFrCx06oVcKdsOzC9Mo+xv9Ll69
         C+Pw==
X-Gm-Message-State: AOAM531ZN6Hf85FtUr1kc/+SPF2PfEa3keRoJFFl/hGY0LXUPeZexOm7
        FP6+sINio4xM14KHYL82DsnBbA==
X-Google-Smtp-Source: ABdhPJxffhH5nYuHtCQM7ScuPlYkKa1+NdI6Q2qKi+xi2jN7etWrShcktef9bZJo1kXSmqzqkRfVBg==
X-Received: by 2002:a5d:4d02:0:b0:207:a6e8:ef4a with SMTP id z2-20020a5d4d02000000b00207a6e8ef4amr743903wrt.245.1649608557379;
        Sun, 10 Apr 2022 09:35:57 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id a7-20020adffb87000000b00207982c7f4dsm6500126wrr.67.2022.04.10.09.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 09:35:56 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        mchehab@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     robert.foss@linaro.org, hfink@snap.com, jgrahsl@snap.com,
        dmitry.baryshkov@linaro.org, vladimir.zapolskiy@linaro.org,
        bryan.odonoghue@linaro.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [RESEND PATCH 1/2] media: dt-bindings: imx412: Add regulator descriptions
Date:   Sun, 10 Apr 2022 17:35:52 +0100
Message-Id: <20220410163553.3501938-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220410163553.3501938-1-bryan.odonoghue@linaro.org>
References: <20220410163553.3501938-1-bryan.odonoghue@linaro.org>
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
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/media/i2c/sony,imx412.yaml   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
index afcf70947f7e..16869a91ec9a 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
@@ -32,6 +32,18 @@ properties:
     description: Clock frequency 6MHz, 12MHz, 18MHz, 24MHz or 27MHz
     maxItems: 1
 
+  dovdd-supply:
+    description:
+      Definition of the regulator used as interface power supply.
+
+  avdd-supply:
+    description:
+      Definition of the regulator used as analog power supply.
+
+  dvdd-supply:
+    description:
+      Definition of the regulator used as digital power supply.
+
   reset-gpios:
     description: Reference to the GPIO connected to the XCLR pin, if any.
     maxItems: 1
-- 
2.35.1

