Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78BC935E523
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 19:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbhDMRjA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 13:39:00 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:57029 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232433AbhDMRis (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 13:38:48 -0400
X-Halon-ID: 0b67b9b0-9c7f-11eb-a9ab-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 0b67b9b0-9c7f-11eb-a9ab-0050569116f7;
        Tue, 13 Apr 2021 19:38:26 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: dt-bindings: media: renesas,vin: Add r8a779a0 support
Date:   Tue, 13 Apr 2021 19:38:10 +0200
Message-Id: <20210413173810.2561909-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document support for the VIN module in the Renesas V3U (r8a779a0) SoC.
The V3U is different from other SoCs as it have 32 instead of 16 VIN
instances. The VIN instances are also connected to a new IP the R-Car
ISP Channel Selector.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../bindings/media/renesas,vin.yaml           | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
index fe7c4cbfe4ba960c..67459b94aeaaafed 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
@@ -51,6 +51,7 @@ properties:
               - renesas,vin-r8a77980 # R-Car V3H
               - renesas,vin-r8a77990 # R-Car E3
               - renesas,vin-r8a77995 # R-Car D3
+              - renesas,vin-r8a779a0 # R-Car V3U
 
   reg:
     maxItems: 1
@@ -111,7 +112,7 @@ properties:
     description: VIN channel number
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
-    maximum: 15
+    maximum: 31
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -187,6 +188,29 @@ properties:
           - required:
               - endpoint@3
 
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port node, multiple endpoints describing all the R-Car ISP
+          modules connected the VIN.
+
+        properties:
+          endpoint@0:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description: Endpoint connected to ISP0.
+
+          endpoint@1:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description: Endpoint connected to ISP1.
+
+          endpoint@2:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description: Endpoint connected to ISP2.
+
+          endpoint@3:
+            $ref: /schemas/graph.yaml#/properties/endpoint
+            description: Endpoint connected to ISP3.
+
 required:
   - compatible
   - reg
-- 
2.31.1

