Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7FFC4C5EA5
	for <lists+linux-media@lfdr.de>; Sun, 27 Feb 2022 21:34:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231679AbiB0Uev (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Feb 2022 15:34:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231681AbiB0Ueu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Feb 2022 15:34:50 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D19FD5BE50;
        Sun, 27 Feb 2022 12:34:12 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 788F5993;
        Sun, 27 Feb 2022 21:34:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645994049;
        bh=3/kab66CzJbqHUmCUBv5VTquRogvdLAl6WZl739Fjw4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JIRSjrat9of2ikiLJWFRRWBiUGCnkawlMKpnVEEUECHgJStTjuQzKnKSmp7N8cTMt
         BjlJLt+6T2MD6hvGWjNt/wYCCvS1Okz6LCSxiclexKJLOuw8bd+zHFuzSQzfZsnd85
         NwySiNlU3uvgmaeAloqouVVTJ65R+vOV0CW9p2Gk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH 2/2] dt-bindings: Use new video interface bus type macros in examples
Date:   Sun, 27 Feb 2022 22:33:52 +0200
Message-Id: <20220227203352.17314-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220227203352.17314-1-laurent.pinchart@ideasonboard.com>
References: <20220227203352.17314-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that a header exists with macros for the media interface bus-type
values, replace hardcoding numerical constants with the corresponding
macros in the DT binding examples.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../devicetree/bindings/display/bridge/analogix,anx7625.yaml  | 3 ++-
 Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml     | 3 ++-
 Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml  | 3 ++-
 .../devicetree/bindings/media/marvell,mmp2-ccic.yaml          | 3 ++-
 Documentation/devicetree/bindings/media/microchip,xisc.yaml   | 3 ++-
 Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml    | 4 +++-
 6 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 1d3e88daca04..0e6c43a29491 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -130,6 +130,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interfaces.h>
 
     i2c0 {
         #address-cells = <1>;
@@ -155,7 +156,7 @@ examples:
                     reg = <0>;
                     anx7625_in: endpoint {
                         remote-endpoint = <&mipi_dsi>;
-                        bus-type = <5>;
+                        bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
                         data-lanes = <0 1 2 3>;
                     };
                 };
diff --git a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
index 39395ea8c318..edde4201116f 100644
--- a/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
@@ -104,6 +104,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interfaces.h>
 
     i2c2 {
         #address-cells = <1>;
@@ -124,7 +125,7 @@ examples:
                     remote-endpoint = <&csi2a_ep>;
                     link-frequencies = /bits/ 64 <199200000 210000000
                                                   499200000>;
-                    bus-type = <4>;
+                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
                 };
             };
         };
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
index 44529425ce3a..161e6d598e1c 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
@@ -105,6 +105,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/video-interfaces.h>
 
     i2c0 {
         #address-cells = <1>;
@@ -118,7 +119,7 @@ examples:
 
             port {
                 ov772x_0: endpoint {
-                    bus-type = <5>;
+                    bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
                     vsync-active = <0>;
                     hsync-active = <0>;
                     pclk-sample = <0>;
diff --git a/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
index b39b84c5f012..0e3478551e13 100644
--- a/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
+++ b/Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml
@@ -68,6 +68,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/marvell,mmp2.h>
+    #include <dt-bindings/media/video-interfaces.h>
     #include <dt-bindings/power/marvell,mmp2.h>
 
     camera@d420a000 {
@@ -83,7 +84,7 @@ examples:
       port {
         camera0_0: endpoint {
           remote-endpoint = <&ov7670_0>;
-          bus-type = <5>;      /* Parallel */
+          bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
           hsync-active = <1>;  /* Active high */
           vsync-active = <1>;  /* Active high */
           pclk-sample = <0>;   /* Falling */
diff --git a/Documentation/devicetree/bindings/media/microchip,xisc.yaml b/Documentation/devicetree/bindings/media/microchip,xisc.yaml
index 086e1430af4f..d13d16c710e2 100644
--- a/Documentation/devicetree/bindings/media/microchip,xisc.yaml
+++ b/Documentation/devicetree/bindings/media/microchip,xisc.yaml
@@ -106,6 +106,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/at91.h>
     #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/media/video-interfaces.h>
 
     xisc: xisc@e1408000 {
         compatible = "microchip,sama7g5-isc";
@@ -118,7 +119,7 @@ examples:
 
         port {
                 xisc_in: endpoint {
-                       bus-type = <5>; /* Parallel */
+                       bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
                        remote-endpoint = <&csi2dc_out>;
                        hsync-active = <1>;
                        vsync-active = <1>;
diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
index 9c1262a276b5..285c6075950a 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
@@ -90,7 +90,9 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/stm32mp1-clks.h>
+    #include <dt-bindings/media/video-interfaces.h>
     #include <dt-bindings/reset/stm32mp1-resets.h>
+    #
     dcmi: dcmi@4c006000 {
         compatible = "st,stm32-dcmi";
         reg = <0x4c006000 0x400>;
@@ -104,7 +106,7 @@ examples:
         port {
              dcmi_0: endpoint {
                    remote-endpoint = <&ov5640_0>;
-                   bus-type = <5>;
+                   bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
                    bus-width = <8>;
                    hsync-active = <0>;
                    vsync-active = <0>;
-- 
Regards,

Laurent Pinchart

