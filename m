Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F26E92B1B46
	for <lists+linux-media@lfdr.de>; Fri, 13 Nov 2020 13:42:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbgKMMms (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Nov 2020 07:42:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbgKMMmr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Nov 2020 07:42:47 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D50BC0617A7
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 04:42:44 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id z21so13572809lfe.12
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2020 04:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q+8Hrzon9gesumLfOBGrHFfOxhLMmIMscN3ufv1mMIk=;
        b=o20RNJa6gK0J4ZDdRnpd60Mtk3r3Pr6RCtn2LpeDEbx8HJXFL/R22fVzuP1ZhgiD4x
         ryFG/DFVPAyTm1fV5+OUTYAunz8LhoViSdJviPFvMfqP43tKEo6mdXOK5ZwmR6mS1H1B
         fVl2iYCgNklxVqWjI1UP4mF/ngkBHfyCJ6ZQwGnYPbd9YgVkn+D3j7ozvw+rcsutTDlr
         ZwaLj2wYPpmkQX9tdTMEUbuh3h1KUTTveI6qtSmOHfk7sCtQCQOVovjNAnvf0FD0Axxc
         Ur1uMnT+8pV6bHuMRdHkJ5Tb6ORmnUGFjQ1ily8Nz1me8Izuh6fLDAZmTtbXru+r10bq
         S52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=q+8Hrzon9gesumLfOBGrHFfOxhLMmIMscN3ufv1mMIk=;
        b=F8ihNj8mtJVTN6s1w9LVZXkCpt1UTVWueOobCcz5gr0UBt17ni2L29HBQvPkPCme91
         YE/lE8bxdfWgJFqKQdXFOPeNKp7jdain/4rkTw2ngAyuUNseCVPXIVs3/Hcu7zpIA2av
         cGdQerU6oOOLB+aFkTLHiYrs3eEEQ8iHxzvQqzJP94b7xsO7hDCKri4E6YJDsqu/hO42
         afS0g8Lfp/g5bJydJ9okBNCq3F4qmUv+9FF6yf/drNyJBKooXOvunLyTdddTKXGSXO8A
         5hCkSgXn+oxN1PCViYpovTPFtoB0O8xUQBd/Jgb6OA5HWmUCITMycne6sPmruuqDhMBp
         Masw==
X-Gm-Message-State: AOAM530d5271E3rlNJpry7GeZP3gPo1OSixgg2qw6gCl1HGkPH7yNnrr
        HWQ/sp9D9mlyWsTwPw/meJi4DA==
X-Google-Smtp-Source: ABdhPJwWTYyHKLQ2S5RnKgMIccFk2vHvNeOmnwygc2t7E2CGjEXYVBO8JU6HUxB10o7umlVipLkH8w==
X-Received: by 2002:ac2:46ce:: with SMTP id p14mr752605lfo.590.1605271361582;
        Fri, 13 Nov 2020 04:42:41 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id j127sm1537599lfd.34.2020.11.13.04.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 04:42:40 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>,
        phone-devel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2 v5] dt-bindings: leds: Add DT binding for Richtek RT8515
Date:   Fri, 13 Nov 2020 13:42:38 +0100
Message-Id: <20201113124239.2667502-1-linus.walleij@linaro.org>
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
 .../bindings/leds/richtek,rt8515.yaml         | 111 ++++++++++++++++++
 2 files changed, 117 insertions(+)
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
index 000000000000..b1f69277c5d3
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
+  richtek,rfs:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 7680
+    maximum: 367000
+    description: The resistance value of the RFS resistor. This
+      resistors limits the maximum flash current. This must be set
+      for the property flash-max-microamp to work, the RFS resistor
+      defines the range of the dimmer setting (brightness) of the
+      flash LED.
+
+  richtek,rts:
+    $ref: /schemas/types.yaml#/definitions/uint32
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
+        richtek,rfs = <16000>;
+        richtek,rts = <100000>;
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

