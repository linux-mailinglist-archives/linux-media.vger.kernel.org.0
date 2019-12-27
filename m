Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76DEC12BAF2
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2019 21:02:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727400AbfL0UCg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Dec 2019 15:02:36 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46740 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727398AbfL0UCf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Dec 2019 15:02:35 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id CFF4C292885
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
        Helen Koike <helen.koike@collabora.com>
Subject: [PATCH v12 08/11] media: staging: dt-bindings: add Rockchip ISP1 yaml bindings
Date:   Fri, 27 Dec 2019 17:01:13 -0300
Message-Id: <20191227200116.2612137-9-helen.koike@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191227200116.2612137-1-helen.koike@collabora.com>
References: <20191227200116.2612137-1-helen.koike@collabora.com>
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

---

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

 .../bindings/media/rockchip-isp1.yaml         | 193 ++++++++++++++++++
 1 file changed, 193 insertions(+)
 create mode 100644 drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml

diff --git a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
new file mode 100644
index 000000000000..4d1b2c67a4cd
--- /dev/null
+++ b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
@@ -0,0 +1,193 @@
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
+  which contains image processing, scaling, and compression funcitons.
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
+      - description: ISP aclk clock
+      - description: ISP aclk wrapper clock
+      - description: ISP hclk clock
+      - description: ISP hclk wrapper clock
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
+            description: port identifier.
+
+        patternProperties:
+          endpoint:
+            type: object
+            additionalProperties: false
+
+            properties:
+              reg:
+                maxItems: 1
+                description: endpoint identifier.
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

