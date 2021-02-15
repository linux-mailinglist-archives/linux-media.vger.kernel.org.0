Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFD1F31B4CB
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 05:39:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbhBOEiy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 23:38:54 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45928 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbhBOEit (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 23:38:49 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39AF8743;
        Mon, 15 Feb 2021 05:28:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613363337;
        bh=zbyWW51wp6N4gVAbEmcAFDgfMaAFokmVToglG8dBvIA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mdVReQuMyTxvtQtGqwQkEwFvecJSwjd8PStasQJlmkIMdfmQtP94KSjkQSZtRYDwi
         gbWzjHPyFYWyqaygKw0pmOG1bNryfX2eRMkwEQiLGijGGJq3Ie3jSht4FIOrbYFL2j
         hSRKHK9VW73Csp3B11RE8Q6BS7Jdu37ZFob6JBxg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 60/77] dt-bindings: media: nxp,imx7-mipi-csi2: Indent example with 4 spaces
Date:   Mon, 15 Feb 2021 06:27:24 +0200
Message-Id: <20210215042741.28850-61-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
References: <20210215042741.28850-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DT bindings examples are customarily indented with 4 spaces.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../bindings/media/nxp,imx7-mipi-csi2.yaml    | 54 +++++++++----------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
index 74ff92b5baa3..76fcc8d80ee3 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx7-mipi-csi2.yaml
@@ -122,41 +122,41 @@ examples:
     #include <dt-bindings/reset/imx7-reset.h>
 
     mipi_csi: mipi-csi@30750000 {
-            compatible = "fsl,imx7-mipi-csi2";
-            reg = <0x30750000 0x10000>;
-            interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        compatible = "fsl,imx7-mipi-csi2";
+        reg = <0x30750000 0x10000>;
+        interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 
-            clocks = <&clks IMX7D_IPG_ROOT_CLK>,
-                     <&clks IMX7D_MIPI_CSI_ROOT_CLK>,
-                     <&clks IMX7D_MIPI_DPHY_ROOT_CLK>;
-            clock-names = "pclk", "wrap", "phy";
-            clock-frequency = <166000000>;
+        clocks = <&clks IMX7D_IPG_ROOT_CLK>,
+                 <&clks IMX7D_MIPI_CSI_ROOT_CLK>,
+                 <&clks IMX7D_MIPI_DPHY_ROOT_CLK>;
+        clock-names = "pclk", "wrap", "phy";
+        clock-frequency = <166000000>;
 
-            power-domains = <&pgc_mipi_phy>;
-            phy-supply = <&reg_1p0d>;
-            resets = <&src IMX7_RESET_MIPI_PHY_MRST>;
+        power-domains = <&pgc_mipi_phy>;
+        phy-supply = <&reg_1p0d>;
+        resets = <&src IMX7_RESET_MIPI_PHY_MRST>;
 
-            ports {
-                    #address-cells = <1>;
-                    #size-cells = <0>;
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
 
-                    port@0 {
-                            reg = <0>;
+            port@0 {
+                reg = <0>;
 
-                            mipi_from_sensor: endpoint {
-                                    remote-endpoint = <&ov2680_to_mipi>;
-                                    data-lanes = <1>;
-                            };
-                    };
+                mipi_from_sensor: endpoint {
+                    remote-endpoint = <&ov2680_to_mipi>;
+                    data-lanes = <1>;
+                };
+            };
 
-                    port@1 {
-                            reg = <1>;
+            port@1 {
+                reg = <1>;
 
-                            mipi_vc0_to_csi_mux: endpoint {
-                                    remote-endpoint = <&csi_mux_from_mipi_vc0>;
-                            };
-                    };
+                mipi_vc0_to_csi_mux: endpoint {
+                    remote-endpoint = <&csi_mux_from_mipi_vc0>;
+                };
             };
+        };
     };
 
 ...
-- 
Regards,

Laurent Pinchart

