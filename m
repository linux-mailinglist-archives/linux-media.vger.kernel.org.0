Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBBA71CD71F
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 13:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728808AbgEKLEO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 07:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729232AbgEKLD5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 07:03:57 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF4FC05BD0C
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 04:03:57 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id j5so10401539wrq.2
        for <linux-media@vger.kernel.org>; Mon, 11 May 2020 04:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DobvbOIJ0Ny/Azu4lbmYUEV5G36fxaAQJQNlH7Irv/k=;
        b=zE2VjVQPVoijUCn6QX26Z84S90RVPpRS8YArACMsFB/7rN+AxFUYwWLB8DTGtmt5AG
         Psmp9/HGzFtHaxmNCCm/hV+jCrT+7n2GKkjVtilmue2vupuTx9VeytZhdQd1Ix2b2qdA
         rHPIMh4hTWvjNE9a3PfB4fYgpOgi2jtfTONL+eBewkTuRE6zzD0jp6GVlzMC8tu48XFW
         qeTuMSPKJ3LNyYlcCNEJLgvGa/nuvGI9Ex6rnEzCd/qs0e5vdD+P2gnDC0SOVe+EkUWP
         svrqbc/dx7ESHWBkxS83Ics2i8Z8dpdyRaOsVlOGpV0GYKRs6mdVeQUGeId4dj5Kvs9Z
         5L6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DobvbOIJ0Ny/Azu4lbmYUEV5G36fxaAQJQNlH7Irv/k=;
        b=hgFG790ZHbTTllTL6dJPXm0DYVgrUf3Af3n+6etG7xVjY14ULs6O++pP3nb3OISGfu
         /CP+LgWepJX+cIUYxRdU7BN2aSQVlLxuUZzVgDHFdSEhYCWj3D1czkpqVfyCtyo5W11n
         ravTwk4BYW7UOuU/on0pvLJPZj1wmMB4O3XsuEgg1/KS9CMzia9R/vTGKjYRrZfSY4AX
         bUNVIHcqX5rd2rSvnVKoeeeYzO8RxYEF+VMH6bFX8Q7LT7NcFvwU5sikTEmDKYezfF+S
         atpYczGS/y7BK7SpBgyBeA8cCzCknsldPQ8tmjbofinSI4BU2kWXikQFIsVbenwMo/+G
         i2FA==
X-Gm-Message-State: AGi0PubTk78m3Vb2jHwM/DmJPglpTnFDjJf/5eDeBscRQDVFMW08j4dp
        aJNbXBBDIEVtkm62wf/Z6sEXTg==
X-Google-Smtp-Source: APiQypLOtdH5GRhhx9sdfUYBDCUzc0bjhEN3oi9FISPZzcC7spq4t9pT02r0wsZMkB8ho1Wb06AbAw==
X-Received: by 2002:adf:ff89:: with SMTP id j9mr18377360wrr.245.1589195036102;
        Mon, 11 May 2020 04:03:56 -0700 (PDT)
Received: from localhost.localdomain ([37.120.63.158])
        by smtp.gmail.com with ESMTPSA id z18sm7046584wmk.46.2020.05.11.04.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 04:03:55 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>, Ben Kao <ben.kao@intel.com>,
        Robert Foss <robert.foss@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v11 1/3] media: dt-bindings: ov8856: Document YAML bindings
Date:   Mon, 11 May 2020 13:03:48 +0200
Message-Id: <20200511110350.11565-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200511110350.11565-1-robert.foss@linaro.org>
References: <20200511110350.11565-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dongchun Zhu <dongchun.zhu@mediatek.com>

This patch adds documentation of device tree in YAML schema for the
OV8856 CMOS image sensor.

Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---

- Changes since v10:
  * Dongchun: Sort by maintainers entry by file name
  * Rob: Added r-b
  * Sakari: List Dongchun as the maintainer


- Changes since v9:
  * Remove remote-endpoint property
  * Marco: Make port property required again
  * Sakari: Remove Ben as a maintainer
  * Sakari: Replace data-lanes with const items
  * Sakari: Remove clock-lanes property
  * Sakari & Rob Herring: Change type of link-frequency
    work around dt-schema bug

- Changes since v8:
  * Maxime: Added r-b

- Changes since v7:
  * Marco: Make 'port' property optional
  * Maxime & Sakari: Add 'link-frequencies' property to dt binding
  * Rob: Improve description for 'port' property

- Changes since v6:
  * Marco: remove qcom specifics from DT example
   
- Changes since v5:
  * Add assigned-clocks and assigned-clock-rates
  * Rob: dt-schema errors

- Changes since v4:
  * Fabio: Change reset-gpio to GPIO_ACTIVE_LOW, explain in description
  * Add clock-lanes property to example
  * Rob: Fix syntax error in devicetree example

- Changes since v3:
  * robher: Fix syntax error
  * robher: Removed maxItems
  * Fixes yaml 'make dt-binding-check' errors

- Changes since v2:

- Changes since v1:
  Fixes comments from Sakari, Tomasz
  * Add clock-frequency and link-frequencies in DT

 .../devicetree/bindings/media/i2c/ov8856.yaml | 142 ++++++++++++++++++
 MAINTAINERS                                   |   3 +-
 2 files changed, 144 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
new file mode 100644
index 000000000000..d6af685ad3ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
@@ -0,0 +1,142 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2019 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision OV8856 CMOS Sensor Device Tree Bindings
+
+maintainers:
+  - Dongchun Zhu <dongchun.zhu@mediatek.com>
+
+description: |-
+  The Omnivision OV8856 is a high performance, 1/4-inch, 8 megapixel, CMOS
+  image sensor that delivers 3264x2448 at 30fps. It provides full-frame,
+  sub-sampled, and windowed 10-bit MIPI images in various formats via the
+  Serial Camera Control Bus (SCCB) interface. This chip is programmable
+  through I2C and two-wire SCCB. The sensor output is available via CSI-2
+  serial data output (up to 4-lane).
+
+properties:
+  compatible:
+    const: ovti,ov8856
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
+      - const: xvclk
+
+  clock-frequency:
+    description:
+      Frequency of the xvclk clock in Hertz.
+
+  dovdd-supply:
+    description:
+      Definition of the regulator used as interface power supply.
+
+  avdd-supply:
+    description:
+      Definition of the regulator used as analog power supply.
+
+  dvdd-supply:
+    description:
+      Definition of the regulator used as digital power supply.
+
+  reset-gpios:
+    description:
+      The phandle and specifier for the GPIO that controls sensor reset.
+      This corresponds to the hardware pin XSHUTDOWN which is physically
+      active low.
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
+
+        properties:
+          data-lanes:
+            description: |-
+              The driver only supports four-lane operation.
+            items:
+              - const: 1
+              - const: 2
+              - const: 3
+              - const: 4
+
+          link-frequencies:
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint64-array
+            description:
+              Allowed data bus frequencies. 360000000, 180000000 Hz or both
+              are supported by the driver.
+
+
+        required:
+          - link-frequencies
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
+  - dovdd-supply
+  - avdd-supply
+  - dvdd-supply
+  - reset-gpios
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
+        ov8856: camera@10 {
+            compatible = "ovti,ov8856";
+            reg = <0x10>;
+
+            reset-gpios = <&pio 111 GPIO_ACTIVE_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&clk_24m_cam>;
+
+            clocks = <&cam_osc>;
+            clock-names = "xvclk";
+            clock-frequency = <19200000>;
+
+            avdd-supply = <&mt6358_vcama2_reg>;
+            dvdd-supply = <&mt6358_vcamd_reg>;
+            dovdd-supply = <&mt6358_vcamio_reg>;
+
+            port {
+                wcam_out: endpoint {
+                    remote-endpoint = <&mipi_in_wcam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <360000000>;
+                };
+            };
+        };
+    };
+...
\ No newline at end of file
diff --git a/MAINTAINERS b/MAINTAINERS
index 26f281d9f32a..2bc8555a980e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12484,10 +12484,11 @@ F:	Documentation/devicetree/bindings/media/i2c/ov7740.txt
 F:	drivers/media/i2c/ov7740.c
 
 OMNIVISION OV8856 SENSOR DRIVER
-M:	Ben Kao <ben.kao@intel.com>
+M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/ov8856.yaml
 F:	drivers/media/i2c/ov8856.c
 
 OMNIVISION OV9640 SENSOR DRIVER
-- 
2.25.1

