Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3394A2B0484
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 12:57:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728227AbgKLL5U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 06:57:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728238AbgKLL4x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 06:56:53 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7B43C0617A6
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2020 03:56:52 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id i6so8006747lfd.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2020 03:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2QnFX94ue+MfUcZEh811vnO774W9JyKEs6qXHdD7T6s=;
        b=S22X0xD4Oq76x0B/GT0nueMl18VR4qJt2SNmPXKqeWc8UKg6kPL3fyGoaV2LWTK8jx
         dDTCl2gOYfvv8mwyyEaSvT5FAF20wj2en61DghZjYyglEM55lym3rOXo4DE3zwoLZfhu
         7kSJuORfsKSYTRGrqEQmfksmos1wCENuuS1rF0Usn+DM0CACglczSL8Xt0eZ5Cavq3Ue
         8R6JYFVqAAcpthrlwTWVXzo6SPGMEE3E2Uzns7hbHmmfotteVtbssTTq7dADQ9T+ChbO
         Pp2ZrzNOstE8jv5WZoF8/BBXM/343O21vdBgmPQFPHbg4WdP/q/XqdigwLPf8wXifRo7
         ZXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2QnFX94ue+MfUcZEh811vnO774W9JyKEs6qXHdD7T6s=;
        b=Ru2z6vSMaSrxkNSX3VLoxxhXz2xWPhZP0fHgahChVEob9v+mS7pc8PeOtwhFaS2Z9o
         CUg2bFmghFWttCv7iZoYGcOGdQuJujPtOO1wTqrOQmJww8kzd3Dn/7JLuqiCFaFGMcKY
         mCT8Xlow96SIRByW2nVB4/kTXIEVKNY42Lfd4L65FZiaQmVo6Ke9AOAlbDxRnIpODGLZ
         qRz9cq5C4SUVLlWmufaODWmNEhBBNVPEg4CsQ6+Cp0cniGvALyBFQBf8g932zGLBpu5v
         e70Rg9tPIRdmBkwyS1RVOlCaaTQPZe3CaofqdmV1OLXfk/XiQ6DXZRJSI8bbFl7iB9Xc
         O4+A==
X-Gm-Message-State: AOAM533ln0vpMu/YnBeyQCew4u+erxGonczy+vAB9aqaIOXC5T2EyB8Z
        46xtcA4C3xlX2BpEXyvaT3uBIA==
X-Google-Smtp-Source: ABdhPJzF529uyx3/2mb9dv20cuXcbVHoUUik5NdvECpoIC6r6k0i0Xwq9a+wk4XCbTohLgsxglVEUw==
X-Received: by 2002:a19:be13:: with SMTP id o19mr8527924lff.445.1605182211115;
        Thu, 12 Nov 2020 03:56:51 -0800 (PST)
Received: from localhost.bredbandsbolaget (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id v4sm534624lfa.309.2020.11.12.03.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 03:56:50 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>,
        phone-devel@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2 v4] dt-bindings: leds: Add DT binding for Richtek RT8515
Date:   Thu, 12 Nov 2020 12:56:45 +0100
Message-Id: <20201112115646.2562467-1-linus.walleij@linaro.org>
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
index 08b6700ca61e..28bdf09b4af4 100644
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
index 000000000000..5f65a20b997d
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
+    maxItems: 1
+    minimum: 7680
+    maximum: 367000
+    description: The resistance value of the RFS resisitor. This
+      resistors limits the maximum flash current. This must be set
+      for the property flash-max-microamp to work, the RFS resistor
+      defines the range of the dimmer setting (brightness) of the
+      flash LED.
+
+  richtek,rts:
+    maxItems: 1
+    minimum: 7680
+    maximum: 367000
+    description: The resistance value of the RTS resisitor. This
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

