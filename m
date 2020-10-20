Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1043E2942A4
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 21:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437890AbgJTTBe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 15:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390864AbgJTTBd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 15:01:33 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 510A9C0613CE;
        Tue, 20 Oct 2020 12:01:32 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id n6so3542964wrm.13;
        Tue, 20 Oct 2020 12:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ugm6/vQLOS9NE/9xqZYIqQtzl6U+6a3UdZf0AL0JY0c=;
        b=YtjkFdY8ubQ657apeQgei589CxXwKcSYwQEOG+IV9UQsWWObsivpw93Q83idAsHoMz
         uenJl2DC78SXYYBXTJwY/aRXNX9E/eSHNrWRIAdFKevSntwoAgZOcd9awaXMlvMoxiDC
         /tE8dg0A0Ec6CvWsHgpt+ih3iQ6T+tbGXefLofef7VMfTQLXfFWxxtpF9nCEgWyAmV7H
         mdLfLLjDRN9b3pljP3t34IoxIsXJbvXo3puh/83ykXtW3sKLiIwpMcoVXjMVUpEjqOMs
         fNwWD6ZZChBdi+lAIoBiYSbZOZRGcr5gcOamzVuD75FVDr/GQXn8yNypvhodppEn5Ila
         xOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ugm6/vQLOS9NE/9xqZYIqQtzl6U+6a3UdZf0AL0JY0c=;
        b=cdKG0Rym9yRJzqbuXRE0tWw5sJCFwbJM7RQMhAX8u5Ks7vSX4CwHbP67iFbH4hOWgs
         9LuWmJ8FYN3vnGv++DUF8eZg8+femsxC04Gmr6FROSvSHspuRSDHCaR5dCqrxmfg0UyM
         XFJjn+s/BY5VlwRanXCez8BQMq9Zjg4900KOWSb9cWld9TdcfI/AbqiS+ZWzVZhGj6TP
         8qu5TZVNWcqwZGkBGdJs6TWaxp0xZA5OnLGZqgbK4VN+EYkQWLdC3vNp/L6kk3wHDGXp
         zjnSnCKqPdvl94xuncrmuiNcO/NFDkmQGY7syUV3PQ561ADjD0Hl/587cMr9Dv3R/8Uf
         36fg==
X-Gm-Message-State: AOAM532Zi+m885z4UzypPE3rIItiHyIGAzG0dg8Q5n01nH5Fq77/F1r0
        wARafXf73bA+Za3duSWO670=
X-Google-Smtp-Source: ABdhPJz6gOMWd9X3csb6phvaypV8roqO4gfXYwxpjp0pi2r2K4FgxaD2H2cgyTpxEcMqLdjYnWW+zQ==
X-Received: by 2002:a5d:678d:: with SMTP id v13mr5247860wru.148.1603220491043;
        Tue, 20 Oct 2020 12:01:31 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id c18sm4279289wrq.5.2020.10.20.12.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 12:01:30 -0700 (PDT)
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, sakari.ailus@linux.intel.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v5 1/3] dt-bindings: ov2680: convert bindings to yaml
Date:   Tue, 20 Oct 2020 20:00:49 +0100
Message-Id: <20201020190051.1852778-2-rmfrfs@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020190051.1852778-1-rmfrfs@gmail.com>
References: <20201020190051.1852778-1-rmfrfs@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert ov2680 sensor bindings documentation to yaml schema, remove
the textual bindings document and update MAINTAINERS entry.

Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../devicetree/bindings/media/i2c/ov2680.txt  | 46 ---------
 .../bindings/media/i2c/ovti,ov2680.yaml       | 99 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 100 insertions(+), 47 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/ov2680.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml

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
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
new file mode 100644
index 000000000000..43bf749807e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov2680.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov2680.yaml#
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
+  interface. The OV2680 has an image array capable of operating at up to 30
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
+    const: xvclk
+
+  reset-gpios:
+    description:
+      The phandle and specifier for the GPIO that controls sensor reset.
+      This corresponds to the hardware pin XSHUTDOWN which is physically
+      active low.
+    maxItems: 1
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
+    description:
+      A node containing an output port node with an endpoint definition
+      as documented in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
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
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index f2757c6068e3..2cb2a5c60a1d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12781,7 +12781,7 @@ M:	Rui Miguel Silva <rmfrfs@gmail.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/i2c/ov2680.txt
+F:	Documentation/devicetree/bindings/media/i2c/ov2680.yaml
 F:	drivers/media/i2c/ov2680.c
 
 OMNIVISION OV2685 SENSOR DRIVER
-- 
2.28.0

