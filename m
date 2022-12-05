Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48752642B5B
	for <lists+linux-media@lfdr.de>; Mon,  5 Dec 2022 16:19:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbiLEPTZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Dec 2022 10:19:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231895AbiLEPS6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Dec 2022 10:18:58 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6205E1A21B
        for <linux-media@vger.kernel.org>; Mon,  5 Dec 2022 07:18:57 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id z4so13900923ljq.6
        for <linux-media@vger.kernel.org>; Mon, 05 Dec 2022 07:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tw1N36hf4S18yma0Kn3UCRfKqglTZ6hLE0qAVoDvnuw=;
        b=solQ7lAy3lhvUXrIWcKhVEaQbsA5oV+r/OiP9U6OAxx6kULu+Bp+8RoBVzUc0OfQzG
         4T+1JOWKm+0Whmo4am/GRnHGsKTPyXjm4QV0atCZShzCAXhJ6GzU58z7qUf3lvWZImTa
         gFbYRmird/MeQCahfp8U/Nc1TPwqX5VjOSNPzO3661gr5FiUtdDEyQnPX3x0yAErCgu6
         /y+hkyyFpx5Ki730T9AYYKDd8rqtLf65jqzf+HUdqLDHw8R9gOE4KWHc/xCC9eI0MQ9Z
         zh+MuV4pShjkiHzzNmiGsWpRL1yfW+UGae30zDBCL3CY7wB7kAPc32SoZJ3CPZDwNn4k
         kaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tw1N36hf4S18yma0Kn3UCRfKqglTZ6hLE0qAVoDvnuw=;
        b=3gR5XymyYTDFI/C+Z3HVTT7A5UULUxWbW2bNPko4BcELODB4SWhE6mcxBNUHIVgIZE
         Zra9CWcxCJTzgt/Ax4nuElDSRXDo+OcU1U6dO6OGVPO3odIkqRIWl0w0f31ROkE5kxut
         aeQ0B3AFovRf9hb845gh3yKHbn+SsJOVNIDX37aXry9/qC7Vj0nCifKlAjVeHkNwoqxd
         DKNJWn6soeog+WnOOADFXa79YPHGdDIrCzJ4RaLb4npq4AXMDgK/bSc2VkKzQ30oS6qF
         x0npQZv7qnJcezXWu/5CzIcTsD3k6WHgM+vUGVo05HYEVqjS4bnZaBqjei4tdNXVEDXK
         U/Yg==
X-Gm-Message-State: ANoB5plBzSAGjP9P07SSrG0fLGI4HuSIKj+pmt/crf74DdMBlHeF8PmR
        D2Q9VaQPCNiOVXyt/awl0rRdtw==
X-Google-Smtp-Source: AA0mqf5n7I3QT7lFRtdIRCvpgaFCa37U4K1ljngooWxay49uGqEYDkoh5mcR3TsHLb9OJcHSiojIlA==
X-Received: by 2002:a05:651c:2002:b0:27a:8ce:45be with SMTP id s2-20020a05651c200200b0027a08ce45bemr476662ljo.76.1670253535692;
        Mon, 05 Dec 2022 07:18:55 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w26-20020a05651204da00b004b55f60c65asm1012470lfq.284.2022.12.05.07.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 07:18:55 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Joe Tessler <jrt@google.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 5/9] media: dt-bindings: chrontel,ch7322: reference common CEC properties
Date:   Mon,  5 Dec 2022 16:18:41 +0100
Message-Id: <20221205151845.21618-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
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

Reference common HDMI CEC adapter properties to simplify the binding and
have only one place of definition for common properties.  The common CEC
binding expects also node name to be 'cec'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Fix node name to cec.
---
 .../bindings/media/i2c/chrontel,ch7322.yaml           | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml b/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
index 63e5b89d2e0b..af8ada55b3f2 100644
--- a/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
@@ -13,6 +13,9 @@ description:
   The Chrontel CH7322 is a discrete HDMI-CEC controller. It is
   programmable through I2C and drives a single CEC line.
 
+allOf:
+  - $ref: /schemas/media/cec/cec-common.yaml#
+
 properties:
   compatible:
     const: chrontel,ch7322
@@ -40,16 +43,12 @@ properties:
       if in auto mode.
     maxItems: 1
 
-  # see ../cec.txt
-  hdmi-phandle:
-    description: phandle to the HDMI controller
-
 required:
   - compatible
   - reg
   - interrupts
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -58,7 +57,7 @@ examples:
     i2c {
       #address-cells = <1>;
       #size-cells = <0>;
-      ch7322@75 {
+      cec@75 {
         compatible = "chrontel,ch7322";
         reg = <0x75>;
         interrupts = <47 IRQ_TYPE_EDGE_RISING>;
-- 
2.34.1

