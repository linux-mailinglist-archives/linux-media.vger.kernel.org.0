Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C23D28D139
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 17:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389389AbgJMP1H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 11:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389378AbgJMP1G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 11:27:06 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AAD7C0613D6
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 08:27:06 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id z22so211194wmi.0
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2020 08:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KdXDPzN9ufLcbzcaOMQEQHJjCL2OvCuHCwsHPA3iKvU=;
        b=ujhmPvu6i222VHcnYYVoVM3FjXkWcmWaCG9my0GXk1rk/tlnuZSfSQjXABKdDDb2J7
         bz3U7YXiCuwYw99K3pocLJQMK/15IZFFiYQpBAYJX8bF17IR6Mkh6p1hvpXYqgqSqMCH
         3OVyToMzGwXjTp4P/4G8Z5EfKzNzR2iyteehj3T8q53lCbasPGdyS6o/rq7SLMfrGmjb
         CD3LXm+vpS2hqwwzbo4e22oO0gmWoHnsPBCfdUh54cQFhRbpG+yRvOF9v1bx9z+pHbtJ
         8aarWyUC8mtTqj4N66WCudL7TpkO+VoMLyqG4esxzaGLNOS/pNOBpXLTnB77gRN1AUyI
         bjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KdXDPzN9ufLcbzcaOMQEQHJjCL2OvCuHCwsHPA3iKvU=;
        b=M27pwfNh/RdLiF2UwAug5AUbnVqulEKSmEhet7DyWjKi8sGzO1puCiq5th1yR74WJP
         c6Bl5evYidB5MzBUOitjuHxhijOaAuWPeNWoBc9Kl9r4NdlX8uasUwVatl8tF07v0+6L
         buMM/DoNIdLFaJ7N7NN4oV0wICxGI6Tp4DYfr6XpIMieXq9J0UE/0E4JMVZEOvyLUieC
         AZmUyJcJiL3Zf8/oLxrfEa1zY81SyJS8L/NecKJFsP3K8SYCav92vGDeyB8IPKwh9Jw5
         qrwpJ3W6kPtnJR/chARCvrlvrGWTWQyIK7aXaGA+oV4saE63wxzT8GmeRRVsp2HVfQh8
         /sYg==
X-Gm-Message-State: AOAM531pjI6X+kvCn8PYRZXb5dp0NIVJwW8qDSAI0tSTkDNs6tBTgoU8
        Btesk0f9hR3Jw17T0cuKX5FFNQ==
X-Google-Smtp-Source: ABdhPJyQ9E2ewRqPZIXqKm42eAHFDbovB0PeO5uYJAYzjhxT5Hgtaqo1WRMSI7Pf6WNf0LpTU+vuMQ==
X-Received: by 2002:a7b:c418:: with SMTP id k24mr434135wmi.118.1602602824558;
        Tue, 13 Oct 2020 08:27:04 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id z127sm111575wmc.2.2020.10.13.08.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 08:27:04 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: Rui Miguel Silva <rmfrfs@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, sakari.ailus@linux.intel.com,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 1/3] dt-bindings: ov2680: convert bindings to yaml
Date:   Tue, 13 Oct 2020 16:26:45 +0100
Message-Id: <20201013152647.537323-2-rmfrfs@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201013152647.537323-1-rmfrfs@gmail.com>
References: <20201013152647.537323-1-rmfrfs@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert ov2680 sensor bindings documentation to yaml schema, remove
the textual bindings document and update MAINTAINERS entry.

Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
 .../devicetree/bindings/media/i2c/ov2680.txt  |  46 ------
 .../devicetree/bindings/media/i2c/ov2680.yaml | 131 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 132 insertions(+), 47 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov2680.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov2680.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ov2680.txt b/Documentation/devicetree/bindings/media/i2c/ov2680.txt
deleted file mode 100644
index 11e925ed9dad..000000000000
--- a/Documentation/devicetree/bindings/media/i2c/ov2680.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-* Omnivision OV2680 MIPI CSI-2 sensor
-
-Required Properties:
-- compatible: should be "ovti,ov2680".
-- clocks: reference to the xvclk input clock.
-- clock-names: should be "xvclk".
-- DOVDD-supply: Digital I/O voltage supply.
-- DVDD-supply: Digital core voltage supply.
-- AVDD-supply: Analog voltage supply.
-
-Optional Properties:
-- reset-gpios: reference to the GPIO connected to the powerdown/reset pin,
-               if any. This is an active low signal to the OV2680.
-
-The device node must contain one 'port' child node for its digital output
-video port, and this port must have a single endpoint in accordance with
- the video interface bindings defined in
-Documentation/devicetree/bindings/media/video-interfaces.txt.
-
-Endpoint node required properties for CSI-2 connection are:
-- remote-endpoint: a phandle to the bus receiver's endpoint node.
-- clock-lanes: should be set to <0> (clock lane on hardware lane 0).
-- data-lanes: should be set to <1> (one CSI-2 lane supported).
-
-Example:
-
-&i2c2 {
-	ov2680: camera-sensor@36 {
-		compatible = "ovti,ov2680";
-		reg = <0x36>;
-		clocks = <&osc>;
-		clock-names = "xvclk";
-		reset-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
-		DOVDD-supply = <&sw2_reg>;
-		DVDD-supply = <&sw2_reg>;
-		AVDD-supply = <&reg_peri_3p15v>;
-
-		port {
-			ov2680_to_mipi: endpoint {
-				remote-endpoint = <&mipi_from_sensor>;
-				clock-lanes = <0>;
-				data-lanes = <1>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/media/i2c/ov2680.yaml b/Documentation/devicetree/bindings/media/i2c/ov2680.yaml
new file mode 100644
index 000000000000..2516215a511d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov2680.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ov2680.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision OV2680 CMOS Sensor
+
+maintainers:
+  - Rui Miguel Silva <rmfrfs@gmail.com>
+
+description: |-
+  The OV2680 color sensor is a low voltage, high performance 1/5 inch UXGA (2
+  megapixel) CMOS image sensor that provides a single-chip UXGA (1600 x 1200)
+  camera. It provides full-frame, sub-sampled, or windowed 10-bit images in
+  various formats via the control of the Serial Camera Control Bus (SCCB)
+  interface.  The OV2680 has an image array capable of operating at up to 30
+  frames per second (fps) in UXGA resolution.
+
+properties:
+  compatible:
+    const: ovti,ov2680
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
+  reset-gpios:
+    description:
+      The phandle and specifier for the GPIO that controls sensor reset.
+      This corresponds to the hardware pin XSHUTDOWN which is physically
+      active low.
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
+          remote-endpoint: true
+
+          data-lanes:
+            description: |-
+              The driver only supports one-lane operation.
+            items:
+              - const: 1
+
+          clock-lanes:
+            description: |-
+              The driver only supports one-lane operation.
+            items:
+              - const: 0
+
+        required:
+          - remote-endpoint
+          - data-lanes
+          - clock-lanes
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - dovdd-supply
+  - avdd-supply
+  - dvdd-supply
+  - reset-gpios
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ov2680: camera-sensor@36 {
+                compatible = "ovti,ov2680";
+                reg = <0x36>;
+                clocks = <&osc>;
+                clock-names = "xvclk";
+                reset-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
+
+                dovdd-supply = <&sw2_reg>;
+                dvdd-supply = <&sw2_reg>;
+                avdd-supply = <&reg_peri_3p15v>;
+
+                port {
+                        ov2680_to_mipi: endpoint {
+                                remote-endpoint = <&mipi_from_sensor>;
+                                clock-lanes = <0>;
+                                data-lanes = <1>;
+                        };
+                };
+        };
+    };
+...
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 2e85e114c9c3..926dcdc4794c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12775,7 +12775,7 @@ M:	Rui Miguel Silva <rmfrfs@gmail.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/i2c/ov2680.txt
+F:	Documentation/devicetree/bindings/media/i2c/ov2680.yaml
 F:	drivers/media/i2c/ov2680.c
 
 OMNIVISION OV2685 SENSOR DRIVER
-- 
2.28.0

