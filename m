Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 049553AB9A8
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 18:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232588AbhFQQaR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 12:30:17 -0400
Received: from gloria.sntech.de ([185.11.138.130]:38174 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231484AbhFQQaJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 12:30:09 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1ltus0-00057p-Jw; Thu, 17 Jun 2021 18:27:56 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     ezequiel@collabora.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, Laurent.pinchart@ideasonboard.com,
        linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
        heiko@sntech.de, robh+dt@kernel.org, devicetree@vger.kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH v5 09/10] dt-bindings: media: rkisp1: document px30 isp compatible
Date:   Thu, 17 Jun 2021 18:27:44 +0200
Message-Id: <20210617162745.4080975-10-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210617162745.4080975-1-heiko@sntech.de>
References: <20210617162745.4080975-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Add the compatible for the px30-variant of the rkisp

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 .../bindings/media/rockchip-isp1.yaml         | 66 ++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
index 14ac5730b377..3f1c060c655e 100644
--- a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
@@ -15,7 +15,9 @@ description: |
 
 properties:
   compatible:
-    const: rockchip,rk3399-cif-isp
+    enum:
+      - rockchip,px30-cif-isp
+      - rockchip,rk3399-cif-isp
 
   reg:
     maxItems: 1
@@ -200,3 +202,65 @@ examples:
             };
         };
     };
+
+  - |
+
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/px30-power.h>
+
+    parent1: parent {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp: isp@ff4a0000 {
+            compatible = "rockchip,px30-cif-isp";
+            reg = <0x0 0xff4a0000 0x0 0x8000>;
+            interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "isp", "mi", "mipi";
+            clocks = <&cru SCLK_ISP0>,
+                     <&cru ACLK_ISP0_WRAPPER>,
+                     <&cru HCLK_ISP0_WRAPPER>,
+                     <&cru PCLK_ISP1_WRAPPER>;
+            clock-names = "isp", "aclk", "hclk", "pclk";
+            iommus = <&isp_mmu>;
+            phys = <&csi_dphy>;
+            phy-names = "dphy";
+            power-domains = <&power PX30_PD_VI>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    mipi_in_ucam1: endpoint@0 {
+                        reg = <0>;
+                        remote-endpoint = <&ucam1_out>;
+                        data-lanes = <1 2>;
+                    };
+                };
+            };
+        };
+
+        i2c2: i2c {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ov5695: camera@36 {
+                compatible = "ovti,ov5695";
+                reg = <0x36>;
+
+                port {
+                    ucam1_out: endpoint {
+                        remote-endpoint = <&mipi_in_ucam1>;
+                        data-lanes = <1 2>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.29.2

