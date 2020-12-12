Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D58972D862F
	for <lists+linux-media@lfdr.de>; Sat, 12 Dec 2020 12:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407207AbgLLLLl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Dec 2020 06:11:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405831AbgLLLLd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Dec 2020 06:11:33 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23021C0613D3
        for <linux-media@vger.kernel.org>; Sat, 12 Dec 2020 03:10:53 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id l11so18058260lfg.0
        for <linux-media@vger.kernel.org>; Sat, 12 Dec 2020 03:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6D+Cc+FWzkuVAMuJyIf/5H2M4c00AdBlhTqbWNSCZm0=;
        b=GizqmZW/nzKIZu+I34FDCPOhLvRDExiud2qtvNWshB+8md8EdQN8CqOYwHDq/AhyKi
         YX+gAcM1So80rzozdxNbBrL2NqprgZz5KZdu3rhkUQQD0Y/jo+IVkdiCed9f73ydUl5e
         1ZiPxxgLaumyM0iTsfTmZ6I4pUjIN3DWFUwTtGe2o4IVGAHRrTImDMYvp9GysfNP+f6C
         Gr4QIy4y0Jt0ZGh2VYWhN0FWIuDM+RDNmbvE7oWHXrS1st8LTOqGpEznAK5EWNjXei2Y
         W35loXav2NFB973puS1Gj980pc6K3pLHxaPRFeYcMwyUCQAlUWGJIC4QzDmT17m1jHR+
         tgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6D+Cc+FWzkuVAMuJyIf/5H2M4c00AdBlhTqbWNSCZm0=;
        b=RJ76TbWD8e0J4xuK2ojPT5djJoGAIwZdvIP9YsYNXofinimWzINZQIWiMAlHKBHUqc
         WDcspnrlOGE+2dVTfpIToeBxCZkV2XhxEqCwcIDUmGnUGdyov35lDOvsgVbzw+XpHI7N
         i7P/9Wi7l18RnSX/EgdYJZVK8ccxNxdiT7H/szCZWDC35KyhTw25x25iauKQoWnsKI5S
         0MjOeOBrTQ/LJjlG/R/yBLxUm8//eUbQQ2K8QgZZV/XBM43F9zqK0WpFkUmGJcl/0Phj
         BaqFW46iw6YpSZV11jAEBMEfWEgNLFzZUVcw+cSwFgVtn218yBuB1iv/SXXAtGDNBpad
         QljA==
X-Gm-Message-State: AOAM533P6aqQpW+KRO+SkEvntaD9uBAbZRHAjaP1YJvVwA2RHDsp46R/
        Plnpe6KOoqs/EloOerSUU1SP3Q==
X-Google-Smtp-Source: ABdhPJyXfKgOEIjRFc92p6si3OoJuinKJU1r0rrGNBi5ah36legqEcPex6KMu7sSNuxEVjI8tEkVnw==
X-Received: by 2002:ac2:5d68:: with SMTP id h8mr6059551lft.448.1607771451504;
        Sat, 12 Dec 2020 03:10:51 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id u30sm1187835lfc.238.2020.12.12.03.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Dec 2020 03:10:50 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>,
        phone-devel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 1/2 v8] dt-bindings: leds: Add DT binding for Richtek RT8515
Date:   Sat, 12 Dec 2020 12:10:45 +0100
Message-Id: <20201212111046.2735002-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a YAML devicetree binding for the Richtek RT8515
dual channel flash/torch LED driver.

Cc: Sakari Ailus <sakari.ailus@iki.fi>
Cc: newbytee@protonmail.com
Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: phone-devel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v7->v8:
- Add additionalProperties: fals to the leds subnode
- Fix the bug in the example.
- Collect Rob's Reviewed-by.
ChangeLog v6->v7:
- Use led-max-microamp for the torch mode max current.
- Drop the torch-specific new property from common.yaml in
  favor of this property.
- Collect Sakari's review tag.
ChangeLog v5->v6:
- Use the suffix -ohms for the resistor values as this gets
  recognized by default by dtschema and is nominal.
ChangeLog v4->v5:
- Fix the RFS/RTS resistors to reference the u32 schema.
- Fix resisitor speling error.
ChangeLog v3->v4:
- Add DT attributes for the RFS and RTS resistors, so that
  the hardware-defined maximum current can be determined.
- Add torch-max-microamp to the common bindings so we can
  set an attribute for the max microamp in torch mode.
- Add flash-max-microamp and torch-max-microamp as optional
  to the LED node.
- Slot in some elabortative descriptions of the new
  properties and describe what the hardware is doing.
- Cc phone-devel@vger.kernel.org
ChangeLog v2->v3:
- Add Sakari to CC
- Resend
ChangeLog v1->v2:
- Explicitly inherit function, color and flash-max-timeout-us
  from common.yaml
- Add "led" node as required.
---
 .../bindings/leds/richtek,rt8515.yaml         | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/richtek,rt8515.yaml

diff --git a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
new file mode 100644
index 000000000000..68c328eec03b
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/richtek,rt8515.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Richtek RT8515 1.5A dual channel LED driver
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  The Richtek RT8515 is a dual channel (two mode) LED driver that
+  supports driving a white LED in flash or torch mode. The maximum
+  current for each mode is defined in hardware using two resistors
+  RFS and RTS.
+
+properties:
+  compatible:
+    const: richtek,rt8515
+
+  enf-gpios:
+    maxItems: 1
+    description: A connection to the 'ENF' (enable flash) pin.
+
+  ent-gpios:
+    maxItems: 1
+    description: A connection to the 'ENT' (enable torch) pin.
+
+  richtek,rfs-ohms:
+    minimum: 7680
+    maximum: 367000
+    description: The resistance value of the RFS resistor. This
+      resistors limits the maximum flash current. This must be set
+      for the property flash-max-microamp to work, the RFS resistor
+      defines the range of the dimmer setting (brightness) of the
+      flash LED.
+
+  richtek,rts-ohms:
+    minimum: 7680
+    maximum: 367000
+    description: The resistance value of the RTS resistor. This
+      resistors limits the maximum torch current. This must be set
+      for the property torch-max-microamp to work, the RTS resistor
+      defines the range of the dimmer setting (brightness) of the
+      torch LED.
+
+  led:
+    type: object
+    $ref: common.yaml#
+    properties:
+      function: true
+      color: true
+      flash-max-timeout-us: true
+
+      flash-max-microamp:
+        maximum: 700000
+        description: The maximum current for flash mode
+          is hardwired to the component using the RFS resistor to
+          ground. The maximum hardware current setting is calculated
+          according to the formula Imax = 5500 / RFS. The lowest
+          allowed resistance value is 7.86 kOhm giving an absolute
+          maximum current of 700mA. By setting this attribute in
+          the device tree, you can further restrict the maximum
+          current below the hardware limit. This requires the RFS
+          to be defined as it defines the maximum range.
+
+      led-max-microamp:
+        maximum: 700000
+        description: The maximum current for torch mode
+          is hardwired to the component using the RTS resistor to
+          ground. The maximum hardware current setting is calculated
+          according to the formula Imax = 5500 / RTS. The lowest
+          allowed resistance value is 7.86 kOhm giving an absolute
+          maximum current of 700mA. By setting this attribute in
+          the device tree, you can further restrict the maximum
+          current below the hardware limit. This requires the RTS
+          to be defined as it defines the maximum range.
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - ent-gpios
+  - enf-gpios
+  - led
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/leds/common.h>
+
+    led-controller {
+        compatible = "richtek,rt8515";
+        enf-gpios = <&gpio4 12 GPIO_ACTIVE_HIGH>;
+        ent-gpios = <&gpio4 13 GPIO_ACTIVE_HIGH>;
+        richtek,rfs-ohms = <16000>;
+        richtek,rts-ohms = <100000>;
+
+        led {
+            function = LED_FUNCTION_FLASH;
+            color = <LED_COLOR_ID_WHITE>;
+            flash-max-timeout-us = <250000>;
+            flash-max-microamp = <150000>;
+            led-max-microamp = <25000>;
+        };
+    };
+
+...
-- 
2.26.2

