Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3F962E894B
	for <lists+linux-media@lfdr.de>; Sun,  3 Jan 2021 00:17:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbhABXQB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Jan 2021 18:16:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbhABXQA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 Jan 2021 18:16:00 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E0EDC0613CF
        for <linux-media@vger.kernel.org>; Sat,  2 Jan 2021 15:15:20 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id y19so55875683lfa.13
        for <linux-media@vger.kernel.org>; Sat, 02 Jan 2021 15:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9u5iq0kakVYuhYGTXnHBQdkf9ffgnEBS99aL91HMqDo=;
        b=MUFfk9CS9fx2VjHaXZWTy6GR3mmpUKsZ5EOCcU2em3GuTF62+u03OyZ8n5rYX3Hzo9
         lMkp8FmS2/40hEJL66NEf/IA+tOLSdKwcKhGNLEvjeOmwb1PQqbxi0VKYMiL2YHfIEnN
         PWCdaDLldw4Ao+FmunpMXDc1VF3vbJZKiUnQ/5etxu55/0PXOUBeq6iGji91OZomG7Jv
         hNbrNVyy8wO6WusIow2dhDGiXURbZRH4374scdT7XygMpZEUU9UVONV2CgWx1nI4kYLV
         CelvX2H7QL8ahpjzopZ2lRgRp9dvin+xT574GLTy1I4rUpHKxCIxxzCJCctdGbZFsfGm
         APUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9u5iq0kakVYuhYGTXnHBQdkf9ffgnEBS99aL91HMqDo=;
        b=OqU93/6n9QnoJWm2mVEGAJolJNGa9Gs6rzvyYhCENLmG2nODIrGz8eIO/YrflKxg2z
         8hlKuPJ45BhXyfCjlULLiav4COapysz79Kw+LuyBG7QzY6BQcM0vrWTrFLL0UZMw2udb
         kgs3B+dla9VaRLKja9ZhRTpA0KhYFdUb1k6LPMWPVNI7bibP3RktKM07M0dPmwCynh/Y
         u5+T0dqwssUjNcXeY8/jI/ot/S7r8LU/VXeKetvx3AxnqXqD65W+wuPuuUtyMHTJigzv
         awSb5WqjZZaGcQFZVo3TwhWPvMHJGipyIMwFddE4hqphN9tGvhTx9tG7Thcv5E/KiMBp
         3D2Q==
X-Gm-Message-State: AOAM5334vm3sbgpIYHAbHXNmuTiIgdK7OwDYsknHkbM/RRdA+tWXteyO
        DBI+VLsmNC/pz/lYYvI2ZOQufA==
X-Google-Smtp-Source: ABdhPJxmzHUIr58FJHaHzsPt+OG8rCwS6vmlqmBDuEodSdZcFJDmb+pcc+K/jwAABr3P/dGaPUkZ2g==
X-Received: by 2002:a19:6901:: with SMTP id e1mr28116772lfc.335.1609629318794;
        Sat, 02 Jan 2021 15:15:18 -0800 (PST)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id 204sm6833732lfj.269.2021.01.02.15.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 15:15:18 -0800 (PST)
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
Subject: [PATCH 1/2 v9] dt-bindings: leds: Add DT binding for Richtek RT8515
Date:   Sun,  3 Jan 2021 00:15:09 +0100
Message-Id: <20210102231510.2068851-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
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
ChangeLog v8->v9:
- No changes, resend with the driver.
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
2.29.2

