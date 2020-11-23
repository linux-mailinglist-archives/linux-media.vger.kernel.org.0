Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 768AE2C17E6
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 22:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731080AbgKWVow (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 16:44:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729668AbgKWVov (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 16:44:51 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50283C0613CF
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 13:44:51 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id j10so7249707lja.5
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 13:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/YxkbAEJoDzP9KLF30Xn81dZ8K8UjGAlhsR7RpyDfp4=;
        b=v7A0H3RXtNZYr9EOXz4a+9Txd9mDTmUn0Nz0fBYinQdkwQKNtmz1OUA29Kxu7LEeav
         yhk1zGuY3AQ8R1aMBCiCB1eU4NoEMsrUEXJfJ64ShwRU4fzvt0rkLzjs+T2E1fte/2ei
         3p7rB1R15gD1G4sTBkE5uT16EDO04351pPeQyspRQUoPcOfBSoSqEzEfZjCMmdmyZPGd
         an8lzLkposEDFz2o638PFOjZL2vNcw8X4Gsy1jHZBovW7qO9AxpJDNIASrmZE7JlHNFt
         Usww6CiOgpx8DZvwncgn+MfUT++X2twH3AjJUXNxSflKJ+Ywz5sAecLdnNEWuqO08CxO
         Wgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/YxkbAEJoDzP9KLF30Xn81dZ8K8UjGAlhsR7RpyDfp4=;
        b=hIgpjNDuXUVj7aL88oEFaPa53zhbnSk8OebF4KgpNe2idFHjCuuGPDqdeF+7nMV2cs
         mRdnBx+Vo9IB+ea1LN0zo+ad22JZnFinQKNIuuY3wOl7sRp5oH8cEBndyLmXARTJ5vK2
         TIFXA/xj8SKMXDfK2qKLXeuN9yjBh+wVjTwEakqrYZxRl0lZI+w8H6DF0ZKMlMscu499
         95rPDN6jQQb+eEsJ59dII5lqMwUGUDnARD4TI4v+W8uLzaovTtDrYIdVQxBpxOLsIq6V
         KTKYB2eYK/xUstbQF1dzs1b8n3COeI0kb/u/Nb4HXi/1vna7SLQVljnSJBaWKizbMMwK
         7wqw==
X-Gm-Message-State: AOAM5321uOpoj5RG6Q5kA1sJrDTbL5/TWdp0Kqaous7d2+yoNUNt/n6y
        PsTu57seRySl9VV0gs241VnGuwjf2Osq8r94
X-Google-Smtp-Source: ABdhPJwJq7Dydid2AJirmmgacwoMih/CZLRw2/ZLIKoKDWz3WXp7Qtrm3uLTieGBZRCl54ZKlWN3+A==
X-Received: by 2002:a05:651c:299:: with SMTP id b25mr598045ljo.16.1606167889784;
        Mon, 23 Nov 2020 13:44:49 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id 16sm1505036lfk.186.2020.11.23.13.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 13:44:49 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>,
        phone-devel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2 v6] dt-bindings: leds: Add DT binding for Richtek RT8515
Date:   Mon, 23 Nov 2020 22:44:38 +0100
Message-Id: <20201123214439.1279464-1-linus.walleij@linaro.org>
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
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
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
 .../devicetree/bindings/leds/common.yaml      |   6 +
 .../bindings/leds/richtek,rt8515.yaml         | 109 ++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/richtek,rt8515.yaml

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index f1211e7045f1..92fa90b4a671 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -151,6 +151,12 @@ properties:
       Maximum flash LED supply current in microamperes. Required for flash LED
       nodes with configurable current.
 
+  torch-max-microamp:
+    description:
+      Maximum flash LED supply current in microamperes, when the flash LED is
+      used as a torch (flashlight). This is usually lower than the flash mode
+      maximum current, if the LED supports torch mode.
+
   flash-max-timeout-us:
     description:
       Maximum timeout in microseconds after which the flash LED is turned off.
diff --git a/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml b/Documentation/devicetree/bindings/leds/richtek,rt8515.yaml
new file mode 100644
index 000000000000..b2022cb3ee1c
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
+      torch-max-microamp:
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

