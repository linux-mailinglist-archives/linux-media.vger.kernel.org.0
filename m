Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 686A62C74EC
	for <lists+linux-media@lfdr.de>; Sat, 28 Nov 2020 23:23:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgK1Vtj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Nov 2020 16:49:39 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:48620 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729162AbgK1SZ2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Nov 2020 13:25:28 -0500
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 921BD3ADFB2;
        Sat, 28 Nov 2020 14:29:26 +0000 (UTC)
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id DA71E4000F;
        Sat, 28 Nov 2020 14:29:03 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-sunxi@googlegroups.com
Cc:     Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kevin.lhopital@hotmail.com
Subject: [PATCH v2 06/19] dt-bindings: media: sun6i-a31-csi: Add MIPI CSI-2 input port
Date:   Sat, 28 Nov 2020 15:28:26 +0100
Message-Id: <20201128142839.517949-7-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201128142839.517949-1-paul.kocialkowski@bootlin.com>
References: <20201128142839.517949-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The A31 CSI controller supports two distinct input interfaces:
parallel and an external MIPI CSI-2 bridge. The parallel interface
is often connected to a set of hardware pins while the MIPI CSI-2
bridge is an internal FIFO-ish link. As a result, these two inputs
are distinguished as two different ports.

Note that only one of the two may be present on a controller instance.
For example, the V3s has one controller dedicated to MIPI-CSI2 and one
dedicated to parallel.

Update the binding with an explicit ports node that holds two distinct
port nodes: one for parallel input and one for MIPI CSI-2.

This is backward-compatible with the single-port approach that was
previously taken for representing the parallel interface port, which
stays enumerated as fwnode port 0. However, it is now marked as
deprecated and the multi-port approach should be preferred.

Note that additional ports may be added in the future, especially to
support feeding the CSI controller's output to the ISP.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../media/allwinner,sun6i-a31-csi.yaml        | 86 ++++++++++++++++---
 1 file changed, 73 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
index 1fd9b5532a21..3bcee2d44f3c 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
@@ -43,6 +43,7 @@ properties:
   # See ./video-interfaces.txt for details
   port:
     type: object
+    deprecated: true
 
     properties:
       endpoint:
@@ -67,6 +68,59 @@ properties:
 
     additionalProperties: false
 
+  ports:
+    type: object
+
+    properties:
+      port@0:
+        type: object
+        description: Parallel input port, connect to a parallel sensor
+
+        properties:
+          reg:
+            const: 0
+
+          endpoint:
+            type: object
+
+            properties:
+              remote-endpoint: true
+
+              bus-width:
+                enum: [ 8, 10, 12, 16 ]
+
+              pclk-sample: true
+              hsync-active: true
+              vsync-active: true
+
+            required:
+              - bus-width
+              - remote-endpoint
+
+        required:
+          - endpoint
+
+        additionalProperties: false
+
+      port@1:
+        type: object
+        description: MIPI CSI-2 bridge input port
+
+        properties:
+          reg:
+            const: 1
+
+          endpoint:
+            type: object
+
+            properties:
+              remote-endpoint: true
+
+            required:
+              - remote-endpoint
+
+        additionalProperties: false
+
 required:
   - compatible
   - reg
@@ -95,19 +149,25 @@ examples:
                       "ram";
         resets = <&ccu RST_BUS_CSI>;
 
-        port {
-            /* Parallel bus endpoint */
-            csi1_ep: endpoint {
-                remote-endpoint = <&adv7611_ep>;
-                bus-width = <16>;
-
-                /*
-                 * If hsync-active/vsync-active are missing,
-                 * embedded BT.656 sync is used.
-                 */
-                 hsync-active = <0>; /* Active low */
-                 vsync-active = <0>; /* Active low */
-                 pclk-sample = <1>;  /* Rising */
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                /* Parallel bus endpoint */
+                csi1_ep: endpoint {
+                    remote-endpoint = <&adv7611_ep>;
+                    bus-width = <16>;
+
+                    /*
+                     * If hsync-active/vsync-active are missing,
+                     * embedded BT.656 sync is used.
+                     */
+                     hsync-active = <0>; /* Active low */
+                     vsync-active = <0>; /* Active low */
+                     pclk-sample = <1>;  /* Rising */
+                };
             };
         };
     };
-- 
2.29.2

