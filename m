Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4FE29F33C
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 18:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727277AbgJ2R3z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 13:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgJ2R3y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 13:29:54 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27DE3C0613D6;
        Thu, 29 Oct 2020 10:29:54 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id y12so3672471wrp.6;
        Thu, 29 Oct 2020 10:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b8xtaYZtF6tBNMSiTaNwsHNLtKPePHMoGLnn9Qilxp8=;
        b=Jg9dI0DWQx+EPMcDotJ/S9UkqAOzqU3a24V8hivOx8bS4R3dTwkWJFeH5H6azvXArq
         QH3o47ZtiDCy0G26d0CrT67GyyRmh0WlDNY2fzDtmm+3g/9WQFm+g0aaNIJdtrP9dvH9
         00/PSYB9xmJQ2z43fLaek6/RnVObxNUmKmnlS2VOO64A2neVylYHpFXcS1+xKBAyuuFs
         AVOMFKBISgZ0dyWW3U9C3ptyQbdggYC9Os16rZSqJWQs0B+Egx38PlDNhz8eKuAKNvgv
         G1j+GS+Y5JedZsQOKwPvRATJj5ca3QEU0ouAcpg7rg/YFUCD+L1geLIzB/yWG0ww4ySL
         I+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b8xtaYZtF6tBNMSiTaNwsHNLtKPePHMoGLnn9Qilxp8=;
        b=Q7/VZP6ZmgNFRU97dC4U1+f6661jPMjAsRek+lvJDrAFVaU63i/66ZcYMJZ9yHeqbB
         RHC+IOqpRwSSoQuQ0yAx0dE70tvURmfXOui9UjGkVSS/4PxmVb/sRrJRfx0e9NoTsVNT
         8UwGRr0j0JdM6B2DDyUcvXFrs7AcFwcEMtGDkKOIx9oT4YnVaxA5w1G3K8xePQFiU31t
         ZoNEsSMtVd6ul5xJwBICZ/6VioUqybGrRT25+4idlGtTroZ0h5z9PqS6T6yk1dbgnm68
         AG2fvhMfVi1UPzgi6L9Fzzz/JSJAsu+VPwOyOL4icqPK1CCd8e9LMkNERD/qVbPnngvj
         SOfw==
X-Gm-Message-State: AOAM5323O2kUJt/pU1QayIaS9W8WHI50yB434hMV/5Ctky6HpxhX+a7k
        VMekQyGrWP0bpZF3sSVDcdQ=
X-Google-Smtp-Source: ABdhPJybn/uhkktHVvjTIvdGWKBIHtvbNmYS9LtHLs0YBj4cKb6hVmsBuCMvfzl5ZgDENZJRS7sDWw==
X-Received: by 2002:adf:f20e:: with SMTP id p14mr6748810wro.376.1603992592717;
        Thu, 29 Oct 2020 10:29:52 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id e11sm5866054wrj.75.2020.10.29.10.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 10:29:52 -0700 (PDT)
From:   kholk11@gmail.com
To:     mchehab@kernel.org
Cc:     robh+dt@kernel.org, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH v2 2/2] media: dt-bindings: media: i2c: Add IMX300 CMOS sensor binding
Date:   Thu, 29 Oct 2020 18:29:47 +0100
Message-Id: <20201029172947.34315-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029172947.34315-1-kholk11@gmail.com>
References: <20201029172947.34315-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Add YAML device tree binding for IMX300 CMOS image sensor, and
the relevant MAINTAINERS entries.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 .../bindings/media/i2c/sony,imx300.yaml       | 112 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
new file mode 100644
index 000000000000..8f1d795f8072
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx300.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony 1/2.3-Inch 8Mpixel Stacked CMOS Digital Image Sensor
+
+maintainers:
+  - AngeloGioacchino Del Regno <kholk11@gmail.com>
+
+description: |-
+  The Sony IMX300 is a 1/2.3-inch Stacked CMOS (Exmor-RS) digital image
+  sensor with a pixel size of 1.08um and an active array size of
+  5948H x 4140V. It is programmable through I2C interface at address 0x10.
+  Image data is sent through MIPI CSI-2, which is configured as either 2 or
+  4 data lanes.
+
+properties:
+  compatible:
+    const: sony,imx300
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  vdig-supply:
+    description:
+      Digital I/O voltage supply, 1.15-1.20 volts
+
+  vana-supply:
+    description:
+      Analog voltage supply, 2.2 volts
+
+  vddl-supply:
+    description:
+      Digital core voltage supply, 1.8 volts
+
+  reset-gpios:
+    description: |-
+      Reference to the GPIO connected to the xclr pin, if any.
+      Must be released (set high) after all supplies are applied.
+
+  # See ../video-interfaces.txt for more details
+  port:
+    type: object
+    properties:
+      endpoint:
+        type: object
+
+        properties:
+          data-lanes:
+            description: |-
+              The sensor supports either two-lane, or four-lane operation,
+              but the driver currently supports only four-lane.
+            items:
+              - const: 0
+              - const: 1
+              - const: 2
+              - const: 3
+
+          clock-noncontinuous: true
+
+          link-frequencies:
+            $ref: /schemas/types.yaml#/definitions/uint64-array
+            description:
+              Allowed data bus frequencies. The driver currently needs
+              to switch between 780000000 and 480000000 Hz in order to
+              guarantee functionality of all modes.
+
+        required:
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - vana-supply
+  - vdig-supply
+  - vddl-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        imx300: sensor@10 {
+            compatible = "sony,imx300";
+            reg = <0x10>;
+            clocks = <&imx300_xclk>;
+            vana-supply = <&imx300_vana>;   /* 2.2v */
+            vdig-supply = <&imx300_vdig>;   /* 1.2v */
+            vddl-supply = <&imx300_vddl>;   /* 1.8v */
+
+            port {
+                imx300_0: endpoint {
+                    remote-endpoint = <&csi1_ep>;
+                    data-lanes = <0 1 2 3>;
+                    clock-noncontinuous;
+                    link-frequencies = /bits/ 64 <780000000 480000000>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index c66710dd7e0a..21ba41db0063 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16279,6 +16279,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/imx290.txt
 F:	drivers/media/i2c/imx290.c
 
+SONY IMX300 SENSOR DRIVER
+M:	AngeloGioacchino Del Regno <kholk11@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx300.yaml
+F:	drivers/media/i2c/imx300.c
+
 SONY IMX319 SENSOR DRIVER
 M:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
-- 
2.28.0

