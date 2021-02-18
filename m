Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7252331F04F
	for <lists+linux-media@lfdr.de>; Thu, 18 Feb 2021 20:51:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbhBRTqG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Feb 2021 14:46:06 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42612 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234301AbhBRTTw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Feb 2021 14:19:52 -0500
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:851a:1dfb:a143:80e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6113E1F454B8;
        Thu, 18 Feb 2021 19:19:09 +0000 (GMT)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, peng.fan@nxp.com,
        hverkuil-cisco@xs4all.nl, dan.carpenter@oracle.com
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 8/9] dt-bindings: media: nxp,imx8mq-vpu: Update bindings
Date:   Thu, 18 Feb 2021 20:18:43 +0100
Message-Id: <20210218191844.297869-9-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218191844.297869-1-benjamin.gaignard@collabora.com>
References: <20210218191844.297869-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The current bindings seem to make the assumption that the
two VPUs hardware blocks (G1 and G2) are only one set of
registers.
After implementing the VPU reset driver and G2 decoder driver
it shows that all the VPUs are independent and don't need to
know about the registers of the other blocks.
Remove from the bindings the need to set all blocks register
but keep reg-names property because removing it from the driver
may affect other variants.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
version 2:
- be more verbose about why I change the bindings
Keep in mind that series comes after: https://www.spinics.net/lists/arm-kernel/msg875766.html
without that review and ack it won't work

 .../bindings/media/nxp,imx8mq-vpu.yaml        | 54 ++++++++++++-------
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
index 762be3f96ce9..468435c70eef 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
@@ -15,24 +15,25 @@ description:
 
 properties:
   compatible:
-    const: nxp,imx8mq-vpu
+    enum:
+      - nxp,imx8mq-vpu
+      - nxp,imx8mq-vpu-g2
 
   reg:
-    maxItems: 3
+    maxItems: 1
 
   reg-names:
-    items:
-      - const: g1
-      - const: g2
-      - const: ctrl
+    enum:
+      - g1
+      - g2
 
   interrupts:
-    maxItems: 2
+    maxItems: 1
 
   interrupt-names:
-    items:
-      - const: g1
-      - const: g2
+    enum:
+      - g1
+      - g2
 
   clocks:
     maxItems: 3
@@ -46,6 +47,9 @@ properties:
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -54,6 +58,7 @@ required:
   - interrupt-names
   - clocks
   - clock-names
+  - resets
 
 additionalProperties: false
 
@@ -61,19 +66,32 @@ examples:
   - |
         #include <dt-bindings/clock/imx8mq-clock.h>
         #include <dt-bindings/interrupt-controller/arm-gic.h>
+        #include <dt-bindings/reset/imx8mq-vpu-reset.h>
 
-        vpu: video-codec@38300000 {
+        vpu_g1: video-codec@38300000 {
                 compatible = "nxp,imx8mq-vpu";
-                reg = <0x38300000 0x10000>,
-                      <0x38310000 0x10000>,
-                      <0x38320000 0x10000>;
-                reg-names = "g1", "g2", "ctrl";
-                interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
-                             <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
-                interrupt-names = "g1", "g2";
+                reg = <0x38300000 0x10000>;
+                reg-names = "g1";
+                interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+                interrupt-names = "g1";
+                clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
+                         <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
+                         <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
+                clock-names = "g1", "g2", "bus";
+                power-domains = <&pgc_vpu>;
+                resets = <&vpu_reset IMX8MQ_RESET_VPU_RESET_G1>;
+        };
+
+        vpu_g2: video-codec@38310000 {
+                compatible = "nxp,imx8mq-vpu-g2";
+                reg = <0x38310000 0x10000>;
+                reg-names = "g2";
+                interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+                interrupt-names = "g2";
                 clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
                          <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
                          <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
                 clock-names = "g1", "g2", "bus";
                 power-domains = <&pgc_vpu>;
+                resets = <&vpu_reset IMX8MQ_RESET_VPU_RESET_G2>;
         };
-- 
2.25.1

