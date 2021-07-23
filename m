Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1F653D3551
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 09:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233392AbhGWGv7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 02:51:59 -0400
Received: from gloria.sntech.de ([185.11.138.130]:43364 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233215AbhGWGv6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 02:51:58 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1m6pfZ-0003dj-32; Fri, 23 Jul 2021 09:32:29 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     ezequiel@collabora.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, Laurent.pinchart@ideasonboard.com,
        linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
        heiko@sntech.de, robh+dt@kernel.org, devicetree@vger.kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v7 09/10] dt-bindings: media: rkisp1: document px30 isp compatible
Date:   Fri, 23 Jul 2021 09:32:20 +0200
Message-Id: <20210723073221.1276358-10-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210723073221.1276358-1-heiko@sntech.de>
References: <20210723073221.1276358-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Add the compatible for the px30-variant of the rkisp

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/rockchip-isp1.yaml         | 67 ++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
index 14ac5730b377..d1489b177331 100644
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
@@ -200,3 +202,66 @@ examples:
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
+                compatible = "ovti,ov5647";
+                reg = <0x36>;
+                clocks = <&cru SCLK_CIF_OUT>;
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

