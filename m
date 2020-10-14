Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2524728E228
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 16:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbgJNO2Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 10:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727468AbgJNO2P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 10:28:15 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C74BC061755;
        Wed, 14 Oct 2020 07:28:14 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id b8so4156404wrn.0;
        Wed, 14 Oct 2020 07:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/L0lmM0V7mH9x75pBweTPXSn/wsZBinpBT7AjhxTwGA=;
        b=dxg6crlv3Foc46Ocrd9svPizjzgO5LR+6b06E/8TwiLZHfpBVJEmeDj5pMTEpeyeTa
         R9cGme/+T0vnVf9EuC8YwQX4ZetKpLgYg6mgfoCdkQ+4SvZB0rkCLfmhD6/iWZhBWvTW
         T3RtckmiNNhFV3TVsyLI4gTrLh0Xy1sLCguW+vurGcjzSWLhpouDHrkAupieRVctU/IS
         IWYKwx1aEZ6cksEswOQULvqEA0l7p4uhwTx20RbnmPkUrydKalMoMeuWiTFRjbY97Krl
         14SI5US+cOL1rZYsfdBQZ9lHgGxDrQUgL6a8fGHfZyaCLASAiZUpWdXURTH5eoS2tF98
         JWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/L0lmM0V7mH9x75pBweTPXSn/wsZBinpBT7AjhxTwGA=;
        b=TjxWU4sGDATI3hdrcuf6ioBLOenefYlu/22KH8OrvOqHvPe5MgA89IaYd6+04+8M2+
         fjPrMBRP8APLdmjSDQzaq1FdO6A/LSxOu6zwKyB4GATWOcp92M0f1vBLBjUxmqldT2rG
         dcF7Kkvd5VfIXByHKiVe6S+l9ZgBdIxmj9TxSDUb6Vwbslw7uIfHlxGxyf1aqPF7z3t1
         rwQ54DbiQF0CnHTV4WQCoOr4+V0zIiWIF8nMBbegFo9NyZNvPJeB+yN2xOpyX8j+P/FJ
         Lr59+5Dh39T+nAnYTorP2hF18nyh4hzUKtLO+q4x1SovMhoOm/j2Ra2SoX3gTOxUE5DB
         DR1Q==
X-Gm-Message-State: AOAM533OMT3v0q6IGPpB3+wzp+/gx/TRfEfJn3VfnKLAKHAXVhFImD/b
        jmtJFTdY+dFB6lyrLSc+CUQ=
X-Google-Smtp-Source: ABdhPJyBb+xwmr+oV61wjKQ8SpZoUiKMuFJzdfQQjPnOgTADMx+KEBmbG3JPIRidi6vf6OTcShExjg==
X-Received: by 2002:adf:f584:: with SMTP id f4mr5611874wro.383.1602685692921;
        Wed, 14 Oct 2020 07:28:12 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id g5sm4068702wmi.4.2020.10.14.07.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 07:28:12 -0700 (PDT)
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, sakari.ailus@linux.intel.com,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: ov2680: convert bindings to yaml
Date:   Wed, 14 Oct 2020 15:27:57 +0100
Message-Id: <20201014142759.726823-2-rmfrfs@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201014142759.726823-1-rmfrfs@gmail.com>
References: <20201014142759.726823-1-rmfrfs@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert ov2680 sensor bindings documentation to yaml schema, remove
the textual bindings document and update MAINTAINERS entry.

Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
  
v1 -> v2:
  Sakari Ailus - Patch 1/3:
  https://lore.kernel.org/linux-media/20201013160908.GC13341@paasikivi.fi.intel.com/
  - omit remote-endpoint
  - remove not needed clock-lanes and data-lanes

 .../devicetree/bindings/media/i2c/ov2680.txt  |  46 --------
 .../devicetree/bindings/media/i2c/ov2680.yaml | 109 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 110 insertions(+), 47 deletions(-)
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
index 000000000000..ef2b45b03dcc
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov2680.yaml
@@ -0,0 +1,109 @@
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

