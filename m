Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68605134AC8
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 19:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730227AbgAHSq1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 13:46:27 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59836 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729318AbgAHSq0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jan 2020 13:46:26 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 93FE82912EE
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-rockchip@lists.infradead.org
Cc:     mark.rutland@arm.com, devicetree@vger.kernel.org,
        eddie.cai.linux@gmail.com, mchehab@kernel.org, heiko@sntech.de,
        gregkh@linuxfoundation.org, andrey.konovalov@linaro.org,
        linux-kernel@vger.kernel.org, tfiga@chromium.org,
        robh+dt@kernel.org, hans.verkuil@cisco.com,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        joacim.zetterling@gmail.com, kernel@collabora.com,
        ezequiel@collabora.com, linux-media@vger.kernel.org,
        jacob-chen@iotwrt.com, linux-arm-kernel@lists.infradead.org,
        Helen Koike <helen.koike@collabora.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v13 08/11] media: staging: dt-bindings: add Rockchip ISP1 yaml bindings
Date:   Wed,  8 Jan 2020 15:44:51 -0300
Message-Id: <20200108184454.825725-9-helen.koike@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200108184454.825725-1-helen.koike@collabora.com>
References: <20200108184454.825725-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add yaml DT bindings for Rockchip ISP1.

This was tested and verified with:
mv drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml Documentation/devicetree/bindings/media/
make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-isp1.yaml
make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/media/rockchip-isp1.yaml

Signed-off-by: Helen Koike <helen.koike@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---

Changes in v13:
- improve clock descriptions
- fixed typo
- add description to port@0
- remove unecessary description in reg

Changes in v12:
- The commit replaces the following commit in previous series named
media: staging: dt-bindings: Document the Rockchip ISP1 bindings
This new patch adds yaml binding and was verified with
make dtbs_check and make dt_binding_check

Changes in v11:
- add clock-names values

Changes in v10:
- unsquash

Changes in v9:
- squash
- move to staging

Changes in v8:
- fix title division style

Changes in v7:
- update document with new design and tested example

 .../bindings/media/rockchip-isp1.yaml         | 192 ++++++++++++++++++
 1 file changed, 192 insertions(+)
 create mode 100644 drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml

diff --git a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
new file mode 100644
index 000000000000..af246b71eac6
--- /dev/null
+++ b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
@@ -0,0 +1,192 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip SoC Image Signal Processing unit v1
+
+maintainers:
+  - Helen Koike <helen.koike@collabora.com>
+
+description: |
+  Rockchip ISP1 is the Camera interface for the Rockchip series of SoCs
+  which contains image processing, scaling, and compression functions.
+
+properties:
+  compatible:
+    const: rockchip,rk3399-cif-isp
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+    description: phandle for the PHY port
+
+  phy-names:
+    const: dphy
+
+  clocks:
+    items:
+      - description: ISP clock
+      - description: ISP AXI clock clock
+      - description: ISP AXI clock  wrapper clock
+      - description: ISP AHB clock clock
+      - description: ISP AHB wrapper clock
+
+  clock-names:
+    items:
+      - const: clk_isp
+      - const: aclk_isp
+      - const: aclk_isp_wrap
+      - const: hclk_isp
+      - const: hclk_isp_wrap
+
+  # See ./video-interfaces.txt for details
+  ports:
+    type: object
+    additionalProperties: false
+
+    properties:
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      port@0:
+        type: object
+        description: connection point for sensors at MIPI-DPHY RX0
+        additionalProperties: false
+
+        properties:
+          "#address-cells":
+            const: 1
+
+          "#size-cells":
+            const: 0
+
+          reg:
+            const: 0
+
+        patternProperties:
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            properties:
+              reg:
+                maxItems: 1
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              remote-endpoint: true
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - iommus
+  - phys
+  - phy-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+
+    #include <dt-bindings/clock/rk3399-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/rk3399-power.h>
+
+    parent0: parent@0 {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp0: isp0@ff910000 {
+            compatible = "rockchip,rk3399-cif-isp";
+            reg = <0x0 0xff910000 0x0 0x4000>;
+            interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH 0>;
+            clocks = <&cru SCLK_ISP0>,
+                     <&cru ACLK_ISP0>, <&cru ACLK_ISP0_WRAPPER>,
+                     <&cru HCLK_ISP0>, <&cru HCLK_ISP0_WRAPPER>;
+            clock-names = "clk_isp",
+                          "aclk_isp", "aclk_isp_wrap",
+                          "hclk_isp", "hclk_isp_wrap";
+            power-domains = <&power RK3399_PD_ISP0>;
+            iommus = <&isp0_mmu>;
+            phys = <&dphy>;
+            phy-names = "dphy";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    reg = <0>;
+
+                    mipi_in_wcam: endpoint@0 {
+                        reg = <0>;
+                        remote-endpoint = <&wcam_out>;
+                        data-lanes = <1 2>;
+                    };
+
+                    mipi_in_ucam: endpoint@1 {
+                        reg = <1>;
+                        remote-endpoint = <&ucam_out>;
+                        data-lanes = <1>;
+                    };
+                };
+            };
+        };
+
+        i2c7: i2c@ff160000 {
+            clock-frequency = <400000>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            wcam: camera@36 {
+                compatible = "ovti,ov5695";
+                reg = <0x36>;
+
+                port {
+                    wcam_out: endpoint {
+                        remote-endpoint = <&mipi_in_wcam>;
+                        data-lanes = <1 2>;
+                    };
+                };
+            };
+
+            ucam: camera@3c {
+                compatible = "ovti,ov2685";
+                reg = <0x3c>;
+
+                  port {
+                      ucam_out: endpoint {
+                          remote-endpoint = <&mipi_in_ucam>;
+                          data-lanes = <1>;
+                      };
+                  };
+            };
+        };
+    };
-- 
2.24.0

