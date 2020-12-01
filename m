Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A012F2C9EE4
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 11:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729741AbgLAKOm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 05:14:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729572AbgLAKOm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Dec 2020 05:14:42 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 247A1C0613D3
        for <linux-media@vger.kernel.org>; Tue,  1 Dec 2020 02:13:56 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id r24so3017182lfm.8
        for <linux-media@vger.kernel.org>; Tue, 01 Dec 2020 02:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EpTyVObyidZ7afZe2Xs7DnnCx9ZUD9L2PJpxRCgQy1Q=;
        b=IQkH9IZFy0od+oQknsmtn3hLQBjVycftewD4WssFOmVU9SMKCDyZE0mnXDDgTjnPB0
         th10nWKszbWiGbUp0dg9ew1raNVi0pTzeu8mMj09PX0VAPeKPYRPS3H6uEcCEa7GqoHE
         s+vi6PLpngkTC8Lvh8o/AGse9LjOLGLz/Zu209gC42MeFDs9FEtEiX+mPM3Kk1iBSfMC
         v2ygK5TSPigrQplLCeqTa7N2i+YG5oTAZXsjGUXmxIk0oa/1bzYGJ/AaNSR4/Sm16pS+
         O/Jg1RXnzJP3Ek1BDMzxhhd9AfF3tYwK5XOiNIl9EoVj/Km0zU1m/PvKUsFrdghBi1eQ
         0LZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EpTyVObyidZ7afZe2Xs7DnnCx9ZUD9L2PJpxRCgQy1Q=;
        b=bgtZCUElr6ZV3+6LJQRkyAzpXRjA3qzPR7lKEegTDgZG3fZLi3fDTiT16VvBQtZ3tv
         k6bfcpIPQKkARvZ4AhHM1A+HYShAfbD6rBodQOd0sTF8YMBXPHQ1WhLTYNZF4bWGP3ir
         exfWSpUoToYIIk4muyDt3s6f1Csg4N8SKCugPYuxTmJOu9a0mV1Bpu/bsqqmTj02vXVk
         WySbJm/qmcSwdzZ2h11O8JxuTobp22VVKES7EPP2/Ej5acHts41v26S0q5XcmvWK0rfc
         cOp0q6ckCmbqnVpq+MZJYE1ZtscOfeqfDEKkgKpVcwP+9Nvr+EIdlxkrcbYlc2n5kEcK
         klSw==
X-Gm-Message-State: AOAM5305QB5ybhOupIsqOT8hpB3XqJDuSO5ANqr/r5InYDGB8Dw6XbL9
        JX3PdtZyDrAdNMYz+nCLfGneJw==
X-Google-Smtp-Source: ABdhPJxjWhIfTnswlk7jEvjzsccOqgYgmAk/RQdgUEbNmFrA+TVRdzgA1LYCwcT4oTFNwcmy1aTOnA==
X-Received: by 2002:a05:6512:3054:: with SMTP id b20mr927260lfb.45.1606817634498;
        Tue, 01 Dec 2020 02:13:54 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id z20sm151495ljh.86.2020.12.01.02.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 02:13:53 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>,
        phone-devel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH 1/2 v7] dt-bindings: leds: Add DT binding for Richtek RT8515
Date:   Tue,  1 Dec 2020 11:13:49 +0100
Message-Id: <20201201101350.1401956-1-linus.walleij@linaro.org>
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
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
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
 .../bindings/leds/richtek,rt8515.yaml         | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/richtek,rt8515.yaml

diff --git a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
new file mode 100644
index 000000000000..3190e4fcfdf2
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
@@ -0,0 +1,109 @@
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
+            torch-max-microamp = <25000>;
+        };
+    };
+
+...
-- 
2.26.2

