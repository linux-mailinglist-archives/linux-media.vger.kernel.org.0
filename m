Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B40086938DA
	for <lists+linux-media@lfdr.de>; Sun, 12 Feb 2023 17:51:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbjBLQvI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Feb 2023 11:51:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjBLQvH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Feb 2023 11:51:07 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 355108A49;
        Sun, 12 Feb 2023 08:51:06 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id rp23so26579600ejb.7;
        Sun, 12 Feb 2023 08:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGNTzKThLFC+ICzqVFt9Ik75F3U4hNDrBu6zDf2ISVg=;
        b=drLnqeLTpoSXKGe3WC6T0PCKD64Mlcf32TEyMOROS9x3KmCDynx32ACRFeWSwWPNqe
         /AksMPeyU1M2y/iZ9BC6yJy+vFG9T+iCyzr6CXfZBhlpTZaDaw6XYpHZiUXCfapWjOQ8
         dB9quCF598ekszB3j5N80rcqnBePcxLQEBR00EpXv3c8jWblX42qDzS4u+l50Ru4p3GH
         ZwvrTuZAII0nLq1wyd5W77SfZr/yvjocAJOnyOP9tK/a/sjbVSDmjP8JJmqoQ3aAPjpN
         q3Lyp+7QX4fCtLUEdNZCCeKgw1qgoY+gZDe8oGhsbSDkiI8+zReGw5nG15gTCtojNjdS
         Ulmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LGNTzKThLFC+ICzqVFt9Ik75F3U4hNDrBu6zDf2ISVg=;
        b=fWUctBBBHMV4s8hUmqP3jtA+95IutbyS/r65XDOHypqzV2qMc4K2NvDJ4+o3HBpxEo
         9R91e9vqgbi4I257f/dBckkm6fadKuLLY/Zvh2dTzWqyOy3TabPUbC88IAWDC5a9tJEH
         gtHepTAGpVXfTva2f352Kf76AZ+geJCiVfTFQSTimXSV1guUz8H0O39PzxRKdk6OJJ4Y
         QDqftHPC8XXiIz0gPQOhwMIQp/NHf+f15cl/kMoXeO8o2iQy/vL5UuojvcEX69Z8Fe+S
         jAzc5HMbO7Kz24/+O19URrInxFdIHcd01o/OWOS2ZEH0IyZmmMXp29lLtuMyB2LvXPSh
         k5HA==
X-Gm-Message-State: AO0yUKVTfnKnjKQ8bhjG7rElR6K7H5rOuwpMdvwhUKY+evwKgVw1k87B
        0eKoFfLRV6uD/PyidL28kxEHSNTEZ0Q=
X-Google-Smtp-Source: AK7set8rJ7aNoHxwHiQIZDi/NL64TSR8L4pfjrQAbsLtdkCgLc8kkYkwMg+orpzAWrEb0tAnMrj1mQ==
X-Received: by 2002:a17:906:d92:b0:88a:a09d:e673 with SMTP id m18-20020a1709060d9200b0088aa09de673mr20328585eji.31.1676220664607;
        Sun, 12 Feb 2023 08:51:04 -0800 (PST)
Received: from ?IPV6:2a01:c23:bdd2:4300:1932:303f:b63a:5a0e? (dynamic-2a01-0c23-bdd2-4300-1932-303f-b63a-5a0e.c23.pool.telefonica.de. [2a01:c23:bdd2:4300:1932:303f:b63a:5a0e])
        by smtp.googlemail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm5588297ejg.177.2023.02.12.08.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Feb 2023 08:51:03 -0800 (PST)
Message-ID: <a91e3a8e-7ef1-70bb-f6be-01a9a90c0e05@gmail.com>
Date:   Sun, 12 Feb 2023 17:51:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] dt-bindings: media: meson-ir: Convert Amlogic Meson IR
 controller binding
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-media@vger.kernel.org,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert Amlogic Meson IR controller binding to yaml.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 .../devicetree/bindings/media/meson-ir.txt    | 20 ---------
 .../devicetree/bindings/media/meson-ir.yaml   | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/meson-ir.txt
 create mode 100644 Documentation/devicetree/bindings/media/meson-ir.yaml

diff --git a/Documentation/devicetree/bindings/media/meson-ir.txt b/Documentation/devicetree/bindings/media/meson-ir.txt
deleted file mode 100644
index efd9d29a8..000000000
--- a/Documentation/devicetree/bindings/media/meson-ir.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-* Amlogic Meson IR remote control receiver
-
-Required properties:
- - compatible	: depending on the platform this should be one of:
-		  - "amlogic,meson6-ir"
-		  - "amlogic,meson8b-ir"
-		  - "amlogic,meson-gxbb-ir"
- - reg		: physical base address and length of the device registers
- - interrupts	: a single specifier for the interrupt from the device
-
-Optional properties:
- - linux,rc-map-name:	see rc.txt file in the same directory.
-
-Example:
-
-	ir-receiver@c8100480 {
-		compatible= "amlogic,meson6-ir";
-		reg = <0xc8100480 0x20>;
-		interrupts = <0 15 1>;
-	};
diff --git a/Documentation/devicetree/bindings/media/meson-ir.yaml b/Documentation/devicetree/bindings/media/meson-ir.yaml
new file mode 100644
index 000000000..8d3c7acfa
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/meson-ir.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/meson-ir.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Meson IR remote control receiver
+
+maintainers:
+  - Heiner Kallweit <hkallweit1@gmail.com>
+
+allOf:
+  - $ref: rc.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - amlogic,meson6-ir
+          - amlogic,meson8b-ir
+          - amlogic,meson-gxbb-ir
+      - items:
+          - const: amlogic,meson-gx-ir
+          - const: amlogic,meson-gxbb-ir
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ir-receiver@c8100480 {
+      compatible= "amlogic,meson6-ir";
+      reg = <0xc8100480 0x20>;
+      interrupts = <0 15 1>;
+    };
-- 
2.39.1


