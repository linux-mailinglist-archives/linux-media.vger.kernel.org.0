Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8619F2942A8
	for <lists+linux-media@lfdr.de>; Tue, 20 Oct 2020 21:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437919AbgJTTBh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Oct 2020 15:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390864AbgJTTBh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Oct 2020 15:01:37 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A5D0C0613CE;
        Tue, 20 Oct 2020 12:01:37 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id j7so3540739wrt.9;
        Tue, 20 Oct 2020 12:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U4wNI9JFpYvzYb3idIIZ8E1r/6Vwfi1UxqOJWcIgtWs=;
        b=WDd66w/uQBLRZzdw2jq38ZihbY64DXF72lZd1T9I7volW4/JxFBE3iCwh5LO704Rf6
         d3WHRctuQ4Cj2HkwsTfzb25WtE6SGcC3tIwXtoCu1Beed32AgeoKYMMG4voLYQBzld3g
         d5mk/29juIO6GTteX/u71VroXl/Dy6HU4ifIvPHoauUIpUq2DewhR0E3aprCapHkjsSX
         kb40h5WBaTYWSjbDRRDPqxijzUGfa/3Woc2kgJWi01+BGSdpguOY9kBYbukgnzLhOy5z
         P+VgkplwE5DVlo4JM5XH/9hPth8uncBKv5zyC7/K+rG+W6fWM1uUt3VvQ3CEQzs791DZ
         I4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U4wNI9JFpYvzYb3idIIZ8E1r/6Vwfi1UxqOJWcIgtWs=;
        b=BvvaexSO5gHZWgldVZo6lNZXvDh3+1UXx26iWmOPujk5LdBTlIi3e21lMlGrjlL0VX
         goWHFa7w8dEmyI9r3dvTlrQI/bDBNn1w6UVSP/lrXk124/9+tDCpUm6IeWRjasRAEWGt
         pjK44jtuG70xhVXdhSBHGvidla6xy26ZikWumxzXUyI5j3svQYh4zKtMw7zLTlKi+wXr
         sFlvJ/a1G2fYI47jNMrTUwThIZe53sYAqGqurAnDPaSWKghaBxLn0lBLFqzW/nvcxAz+
         MmauUpUg2ybnHy7dlHY+VMAZAov81fmtJJiF0eP0Op5YQ/axtvGt9cRY2XKwtwKTqh8k
         xKnA==
X-Gm-Message-State: AOAM530DVuBawOAUPjBo9E3isUi6EnyAjWC6+gxoGZOMdvNHNzGmLyKI
        lY0Xy+1jG+l4O5yXvrrTLGU=
X-Google-Smtp-Source: ABdhPJzpp2X1mvSTTYp8zN9i9Xngrqt8k/fvTsLLKfL0uoMT+r5Mba4cuK81ubXJtukJG+n078Ld0w==
X-Received: by 2002:a5d:458c:: with SMTP id p12mr5043552wrq.329.1603220495709;
        Tue, 20 Oct 2020 12:01:35 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id c18sm4279289wrq.5.2020.10.20.12.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 12:01:35 -0700 (PDT)
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, sakari.ailus@linux.intel.com,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v5 3/3] dt-bindings: imx7-mipi-csi2: convert bindings to yaml
Date:   Tue, 20 Oct 2020 20:00:51 +0100
Message-Id: <20201020190051.1852778-4-rmfrfs@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201020190051.1852778-1-rmfrfs@gmail.com>
References: <20201020190051.1852778-1-rmfrfs@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert imx7 mipi csi2 bindings documentation to yaml schema, remove
the textual document and update MAINTAINERS entry.

Signed-off-by: Rui Miguel Silva <rmfrfs@gmail.com>
---

v4 -> v5:
  Rob Herring:
    https://lore.kernel.org/linux-media/20201020153044.GA875273@bogus/
    - fix indentation of oneOf items const

 .../bindings/media/imx7-mipi-csi2.txt         |  90 ---------
 .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 172 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 173 insertions(+), 91 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml

diff --git a/Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt b/Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
deleted file mode 100644
index 71fd74ed3ec8..000000000000
--- a/Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
+++ /dev/null
@@ -1,90 +0,0 @@
-Freescale i.MX7 Mipi CSI2
-=========================
-
-mipi_csi2 node
---------------
-
-This is the device node for the MIPI CSI-2 receiver core in i.MX7 SoC. It is
-compatible with previous version of Samsung D-phy.
-
-Required properties:
-
-- compatible    : "fsl,imx7-mipi-csi2";
-- reg           : base address and length of the register set for the device;
-- interrupts    : should contain MIPI CSIS interrupt;
-- clocks        : list of clock specifiers, see
-        Documentation/devicetree/bindings/clock/clock-bindings.txt for details;
-- clock-names   : must contain "pclk", "wrap" and "phy" entries, matching
-                  entries in the clock property;
-- power-domains : a phandle to the power domain, see
-          Documentation/devicetree/bindings/power/power_domain.txt for details.
-- reset-names   : should include following entry "mrst";
-- resets        : a list of phandle, should contain reset entry of
-                  reset-names;
-- phy-supply    : from the generic phy bindings, a phandle to a regulator that
-	          provides power to MIPI CSIS core;
-
-Optional properties:
-
-- clock-frequency : The IP's main (system bus) clock frequency in Hz, default
-		    value when this property is not specified is 166 MHz;
-- fsl,csis-hs-settle : differential receiver (HS-RX) settle time;
-
-The device node should contain two 'port' child nodes with one child 'endpoint'
-node, according to the bindings defined in:
- Documentation/devicetree/bindings/ media/video-interfaces.txt.
- The following are properties specific to those nodes.
-
-port node
----------
-
-- reg		  : (required) can take the values 0 or 1, where 0 shall be
-                     related to the sink port and port 1 shall be the source
-                     one;
-
-endpoint node
--------------
-
-- data-lanes    : (required) an array specifying active physical MIPI-CSI2
-		    data input lanes and their mapping to logical lanes; this
-                    shall only be applied to port 0 (sink port), the array's
-                    content is unused only its length is meaningful,
-                    in this case the maximum length supported is 2;
-
-example:
-
-        mipi_csi: mipi-csi@30750000 {
-                #address-cells = <1>;
-                #size-cells = <0>;
-
-                compatible = "fsl,imx7-mipi-csi2";
-                reg = <0x30750000 0x10000>;
-                interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
-                clocks = <&clks IMX7D_IPG_ROOT_CLK>,
-                                <&clks IMX7D_MIPI_CSI_ROOT_CLK>,
-                                <&clks IMX7D_MIPI_DPHY_ROOT_CLK>;
-                clock-names = "pclk", "wrap", "phy";
-                clock-frequency = <166000000>;
-                power-domains = <&pgc_mipi_phy>;
-                phy-supply = <&reg_1p0d>;
-                resets = <&src IMX7_RESET_MIPI_PHY_MRST>;
-                reset-names = "mrst";
-                fsl,csis-hs-settle = <3>;
-
-                port@0 {
-                        reg = <0>;
-
-                        mipi_from_sensor: endpoint {
-                                remote-endpoint = <&ov2680_to_mipi>;
-                                data-lanes = <1>;
-                        };
-                };
-
-                port@1 {
-                        reg = <1>;
-
-                        mipi_vc0_to_csi_mux: endpoint {
-                                remote-endpoint = <&csi_mux_from_mipi_vc0>;
-                        };
-                };
-        };
diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
new file mode 100644
index 000000000000..309af5805d74
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
@@ -0,0 +1,172 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/nxp,imx7-mipi-csi2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX7 Mipi CSI2
+
+maintainers:
+  - Rui Miguel Silva <rmfrfs@gmail.com>
+
+description: |
+  This is the device node for the mipi csi-2 receiver core in i.mx7 soc. It is
+  compatible with previous version of samsung d-phy.
+
+properties:
+  compatible:
+    const: fsl,imx7-mipi-csi2
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 3
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: wrap
+      - const: phy
+
+  power-domains:
+    maxItems: 1
+
+  phy-supply:
+    description:
+      Phandle to a regulator that provides power to the PHY. This
+      regulator will be managed during the PHY power on/off sequence.
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: mrst
+
+  clock-frequency:
+    description:
+      The IP main (system bus) clock frequency in Hertz
+    default: 166000000
+
+  fsl,csis-hs-settle:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Differential receiver (HS-RX) settle time
+
+  ports:
+    type: object
+    description:
+      A node containing input and output port nodes with endpoint definitions
+      as documented in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+      port@0:
+        type: object
+        description:
+          Input port node, single endpoint describing the CSI-2 transmitter.
+
+        properties:
+          reg:
+            const: 0
+
+          endpoint:
+            type: object
+
+            properties:
+              data-lanes:
+                $ref: /schemas/types.yaml#/definitions/uint32-array
+                description: See ../video-interfaces.txt
+                oneOf:
+                  - items:
+                      - const: 1
+                  - items:
+                      - const: 1
+                      - const: 2
+
+              remote-endpoint: true
+
+            required:
+              - data-lanes
+              - remote-endpoint
+
+            additionalProperties: false
+
+        additionalProperties: false
+
+      port@1:
+        type: object
+        description:
+          Output port node
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - phy-supply
+  - resets
+  - reset-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx7d-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/imx7-reset.h>
+
+    mipi_csi: mipi-csi@30750000 {
+            compatible = "fsl,imx7-mipi-csi2";
+            reg = <0x30750000 0x10000>;
+            interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+
+            clocks = <&clks IMX7D_IPG_ROOT_CLK>,
+                     <&clks IMX7D_MIPI_CSI_ROOT_CLK>,
+                     <&clks IMX7D_MIPI_DPHY_ROOT_CLK>;
+            clock-names = "pclk", "wrap", "phy";
+            clock-frequency = <166000000>;
+
+            power-domains = <&pgc_mipi_phy>;
+            phy-supply = <&reg_1p0d>;
+            resets = <&src IMX7_RESET_MIPI_PHY_MRST>;
+            reset-names = "mrst";
+            fsl,csis-hs-settle = <3>;
+
+            ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                            reg = <0>;
+
+                            mipi_from_sensor: endpoint {
+                                    remote-endpoint = <&ov2680_to_mipi>;
+                                    data-lanes = <1>;
+                            };
+                    };
+
+                    port@1 {
+                            reg = <1>;
+
+                            mipi_vc0_to_csi_mux: endpoint {
+                                    remote-endpoint = <&csi_mux_from_mipi_vc0>;
+                            };
+                    };
+            };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 557713b3ee95..34e53a1570aa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10779,8 +10779,8 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/admin-guide/media/imx7.rst
-F:	Documentation/devicetree/bindings/media/imx7-mipi-csi2.txt
 F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
+F:	Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
 F:	drivers/staging/media/imx/imx7-media-csi.c
 F:	drivers/staging/media/imx/imx7-mipi-csis.c
 
-- 
2.28.0

