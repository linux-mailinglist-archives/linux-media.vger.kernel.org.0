Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6D7025B69B
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 00:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgIBWs2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 18:48:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbgIBWsV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 18:48:21 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D7C0C06124F
        for <linux-media@vger.kernel.org>; Wed,  2 Sep 2020 15:48:20 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id c15so994229wrs.11
        for <linux-media@vger.kernel.org>; Wed, 02 Sep 2020 15:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DSUUqflNM89hjEoS2I4y9vcCANSdclOkuUNrQ1yjm0A=;
        b=YnRGeZlOf5WRkMrLiwxfOTIOZrblf+8LvustYSwJjGwoiV+xkhkgZ5vR0vqd/E7tNU
         iLDk3apR1rm6cpIjFAWF8NUj54FDdNyfSCJWfXZ8EA2E/ESYqqgRoewLqBHMxXHBI6dj
         TfMbS6nXDV2vNL7LP7RgPwIacTPAGkkbZniHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DSUUqflNM89hjEoS2I4y9vcCANSdclOkuUNrQ1yjm0A=;
        b=s63483xJPsAC1PC3W8IsyfbRNhc3gBvPBjaehVAjjw8FLhLLSpGE64z3hyobNj4QYB
         UbkVV97yGFps6KnT45gnfnVq9OZQuucxSpRCOG3W+1DHv6yxoovgwJ1bAXIw5srqJJw2
         mQod6ILoSTatlW+xL3Wm3ElEbCbXWY/v0xagz+HJsprVebnVkaNXREOB85+tVzuD3nXJ
         RgFhyTED4BdVbYo9cQtTyt8kDtGhUgNB+Br6zvzo8bOLmU1vyAERVV+5wS+ERX+bRSTm
         SKgpdVWOkDZ9KFiV7e2I0z5gpWEcaKUkmSVx+JDvBImLehxfD2XoNTM70wpsNz2WAuP+
         o7UQ==
X-Gm-Message-State: AOAM531gLpRn1OwGXj6qH4+WASwhAZLq0o958iT01s1VGaUW+EnSdG3g
        83uDAuPMiwYYN/iSkhNCoeyaofsn9ABTsA==
X-Google-Smtp-Source: ABdhPJyl45V678eQ5ZC9Fv+EL/uZUE+NbzZKSZ3FYEDQoVT7GWMVpVHMyTNFuHDK4E7yfFBiMp/0wQ==
X-Received: by 2002:a5d:522d:: with SMTP id i13mr405043wra.296.1599086898980;
        Wed, 02 Sep 2020 15:48:18 -0700 (PDT)
Received: from tfiga.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id m125sm1557568wme.35.2020.09.02.15.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 15:48:18 -0700 (PDT)
From:   Tomasz Figa <tfiga@chromium.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hao He <hao.he@bitland.com.cn>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, drinkcat@chromium.org,
        Xingyu Wu <wuxy@bitland.com.cn>, dongchun.zhu@mediatek.com,
        sj.huang@mediatek.com, darfur_liu@gcoreinc.com, hao.he7@gmail.com,
        Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v4 2/4] media: dt-bindings: media: i2c: Add bindings for GC5035
Date:   Wed,  2 Sep 2020 22:48:11 +0000
Message-Id: <20200902224813.14283-3-tfiga@chromium.org>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
In-Reply-To: <20200902224813.14283-1-tfiga@chromium.org>
References: <20200902224813.14283-1-tfiga@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add YAML device tree bindings for Galaxycore Inc. GC5035 imaging sensor.

Signed-off-by: Tomasz Figa <tfiga@chromium.org>
---
 .../devicetree/bindings/media/i2c/gc5035.yaml | 142 ++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/gc5035.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/gc5035.yaml b/Documentation/devicetree/bindings/media/i2c/gc5035.yaml
new file mode 100644
index 000000000000..cf8cc3b581cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/gc5035.yaml
@@ -0,0 +1,142 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2019 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/gc5035.yaml
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Galaxycore Inc. GC5035 CMOS Sensor Device Tree Bindings
+
+maintainers:
+  - Tomasz Figa <tfiga@chromium.org>
+
+description: |-
+  The Galaxycore Inc. GC5035 is a 5 megapixel, 1/5 inch CMOS 10-bit Bayer image
+  sensor that delivers 2592x1944 at 30fps. This chip is programmable through
+  an I2C interface. The image output is available via a MIPI CSI-2 interface.
+
+properties:
+  compatible:
+    const: galaxycore,gc5035
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    description:
+      Input clock for the sensor.
+    items:
+      - const: inclk
+
+  clock-frequency:
+    description:
+      Frequency of the inclk clock in Hz.
+
+  iovdd-supply:
+    description:
+      Regulator driving the I/O power rail.
+
+  avdd28-supply:
+    description:
+      Regulator driving the analog power rail.
+
+  dvdd12-supply:
+    description:
+      Regulator driving the digital power rail.
+
+  resetb-gpios:
+    description:
+      The GPIO pin that drives the RESETB signal, controlling sensor reset.
+      The RESETB signal must be driven low to activate the reset, so the
+      GPIO_ACTIVE_LOW flag should be given by default.
+
+  pwdn-gpios:
+    description:
+      The GPIO pin that drives the PWDN signal, controlling sensor power-down
+      mode. The PWDN signal must be driven low to activate the power-down
+      mode, so the GPIO_ACTIVE_LOW flag should be given by default.
+
+  port:
+    type: object
+    additionalProperties: false
+    description:
+      A node containing an output port node with an endpoint definition
+      as documented in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+
+    properties:
+      endpoint:
+        type: object
+        additionalProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 1
+              - const: 2
+
+          link-frequencies: true
+          remote-endpoint: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+          - remote-endpoint
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - clock-frequency
+  - iovdd-supply
+  - avdd28-supply
+  - dvdd12-supply
+  - resetb-gpios
+  - pwdn-gpios
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gc5035: camera@10 {
+            compatible = "galaxycore,gc5035";
+            reg = <0x10>;
+
+            reset-gpios = <&pio 111 GPIO_ACTIVE_LOW>;
+            pwdn-gpios = <&pio 112 GPIO_ACTIVE_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&clk_24m_cam>;
+
+            clocks = <&cam_osc>;
+            clock-names = "inclk";
+            clock-frequency = <24000000>;
+
+            avdd28-supply = <&mt6358_vcama2_reg>;
+            dvdd12-supply = <&mt6358_vcamd_reg>;
+            iovdd-supply = <&mt6358_vcamio_reg>;
+
+            port {
+                wcam_out: endpoint {
+                    remote-endpoint = <&mipi_in_wcam>;
+                    data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <438000000>;
+                };
+            };
+        };
+    };
+...
+
-- 
2.28.0.402.g5ffc5be6b7-goog

