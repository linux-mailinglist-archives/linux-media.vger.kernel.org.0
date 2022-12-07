Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78CE1645795
	for <lists+linux-media@lfdr.de>; Wed,  7 Dec 2022 11:23:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbiLGKXL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Dec 2022 05:23:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230418AbiLGKXG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Dec 2022 05:23:06 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3028E1571A
        for <linux-media@vger.kernel.org>; Wed,  7 Dec 2022 02:23:05 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id p8so27936664lfu.11
        for <linux-media@vger.kernel.org>; Wed, 07 Dec 2022 02:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5ptnyM8tU9KK9vuHrqJhLp9kBHzmtP8NOjNL98W6O0=;
        b=kwnECpHYYs2dljETpxBP82ebzWcB8+wP08KcpTW0mTbgigX6RffI70K/KhpLO/YDC2
         6DwfcxArNz6QB+WP8rHiDiRyFxCJlWR4KIL0b5P82ylwXg++5M3rZhjXdHiiXenylfhh
         WHGDlw16wENi7DG/Sin7l0bUZZT73PHBprW595DmdPO4nQRLmk9Hzom9bLKpofnmbhu1
         7eeohVs98jGdxiVle7XGMFdI+y4jxV+npBwZjmRSfJFJNx67uycw7h98J5ThbGjBDaJg
         KFTspp95uosj6pXTZxb2sC4/FEUjUWOCO/8FUs5ZSXmYLlNvJY4ndBIiWMWqIYdxGArH
         cL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d5ptnyM8tU9KK9vuHrqJhLp9kBHzmtP8NOjNL98W6O0=;
        b=Cs2L6p4jH1oJjr8VjckxHGDkf3034LY3JXLywep6tT8CGrzu5LDZyl9rgNG6QoHxO2
         TP2GU9PX+VcuTPjCooKL16ZGYcT9Dg6OeP5ETYvKb74JM9tlZE+ybTXPJc2/nvPZdiXw
         TBf7nT6eUCuH546hiSSEva5cxa2V7ooxsYKHFX5j0ksQTwEF9B9w9gf18KYUyx1sF47C
         ECtLqHaNQsSWxwxKTeMF15h4g48t7PV0RagOwmGyyYSvLdR3j3izHoxWvomcRgHpK+ee
         yt1NREOYc0cIeNTLOAj05whw5iYLhG3mkoQe3VJMEOn/r2PBIMxm6t91xYywaiZtIB4L
         TPuw==
X-Gm-Message-State: ANoB5plDBK+8w7lvpeHbTvJTJ3fXO3+UFeOXLNkiQ15GJAJBhTly3cv6
        Kb1rNXudbksw18kSzT97H7aBSw==
X-Google-Smtp-Source: AA0mqf4r7f2xeXn7yaYoPkPuO7SMWpWfTPrwG1RH+SDYe9rX4EhYS8TzE8+PgGnMNg3pkiB3apXW2A==
X-Received: by 2002:ac2:5e8e:0:b0:4b5:9370:d084 with SMTP id b14-20020ac25e8e000000b004b59370d084mr573180lfq.527.1670408584717;
        Wed, 07 Dec 2022 02:23:04 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bu31-20020a056512169f00b00499b27a329esm1953183lfb.300.2022.12.07.02.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 02:23:04 -0800 (PST)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 5/9] media: dt-bindings: chrontel,ch7322: reference common CEC properties
Date:   Wed,  7 Dec 2022 11:22:49 +0100
Message-Id: <20221207102253.26663-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
References: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
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
Reviewed-by: Rob Herring <robh@kernel.org>

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

