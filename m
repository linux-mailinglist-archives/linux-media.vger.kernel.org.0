Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 915534D5FDA
	for <lists+linux-media@lfdr.de>; Fri, 11 Mar 2022 11:38:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348042AbiCKKjR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Mar 2022 05:39:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239718AbiCKKjQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Mar 2022 05:39:16 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1FEBD117C87;
        Fri, 11 Mar 2022 02:38:12 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,173,1643641200"; 
   d="scan'208";a="113220915"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Mar 2022 19:38:12 +0900
Received: from localhost.localdomain (unknown [10.226.93.53])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 76CFB40062CC;
        Fri, 11 Mar 2022 19:38:09 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/3] media: dt-bindings: media: renesas,vsp1: Document RZ/{G2L,V2L} VSPD bindings
Date:   Fri, 11 Mar 2022 10:38:01 +0000
Message-Id: <20220311103803.25239-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220311103803.25239-1-biju.das.jz@bp.renesas.com>
References: <20220311103803.25239-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document VSPD found in RZ/G2L and RZ/V2L family SoC's. VSPD block is
similar to VSP2-D found on R-Car SoC's, but it does not have a version
register and it has 3 clocks compared to 1 clock on vsp1 and vsp2.

This patch introduces a new compatible 'renesas,rzg2l-vsp2' to handle
these differences.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
v2->v3:
 * Added Rb tag from Krzysztof.
v1->v2:
 * Changed compatible from vsp2-rzg2l->rzg2l-vsp2
RFC->v1:
 * Updated commit description
 * Changed compatible from vsp2-r9a07g044->vsp2-rzg2l
 * Defined the clocks
 * Clock max Items is based on SoC Compatible string
RFC:
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-20-biju.das.jz@bp.renesas.com/
---
 .../bindings/media/renesas,vsp1.yaml          | 52 ++++++++++++++-----
 1 file changed, 39 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
index 990e9c1dbc43..2696a4582251 100644
--- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - renesas,vsp1 # R-Car Gen2 and RZ/G1
       - renesas,vsp2 # R-Car Gen3 and RZ/G2
+      - renesas,rzg2l-vsp2 # RZ/G2L and RZ/V2L
 
   reg:
     maxItems: 1
@@ -26,8 +27,8 @@ properties:
   interrupts:
     maxItems: 1
 
-  clocks:
-    maxItems: 1
+  clocks: true
+  clock-names: true
 
   power-domains:
     maxItems: 1
@@ -50,17 +51,42 @@ required:
 
 additionalProperties: false
 
-if:
-  properties:
-    compatible:
-      items:
-        - const: renesas,vsp1
-then:
-  properties:
-    renesas,fcp: false
-else:
-  required:
-    - renesas,fcp
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,vsp1
+    then:
+      properties:
+        renesas,fcp: false
+    else:
+      required:
+        - renesas,fcp
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,rzg2l-vsp2
+    then:
+      properties:
+        clocks:
+          items:
+            - description: LCDC Main clock
+            - description: LCDC Register Access Clock
+            - description: LCDC Video Clock
+        clock-names:
+          items:
+            - const: du.0
+            - const: pclk
+            - const: vclk
+      required:
+        - clock-names
+    else:
+      properties:
+        clocks:
+          maxItems: 1
 
 examples:
   # R8A7790 (R-Car H2) VSP1-S
-- 
2.17.1

