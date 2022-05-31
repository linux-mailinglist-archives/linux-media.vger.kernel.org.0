Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45398539304
	for <lists+linux-media@lfdr.de>; Tue, 31 May 2022 16:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233343AbiEaOUO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 May 2022 10:20:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345223AbiEaOUL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 May 2022 10:20:11 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 60F2A70364;
        Tue, 31 May 2022 07:20:09 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,265,1647270000"; 
   d="scan'208";a="121464433"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 31 May 2022 23:20:09 +0900
Received: from localhost.localdomain (unknown [10.226.92.53])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id F0C6C4004BBF;
        Tue, 31 May 2022 23:20:04 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v11 1/5] media: dt-bindings: media: renesas,vsp1: Document RZ/G2L VSPD bindings
Date:   Tue, 31 May 2022 15:19:54 +0100
Message-Id: <20220531141958.575616-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220531141958.575616-1-biju.das.jz@bp.renesas.com>
References: <20220531141958.575616-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document VSPD found in RZ/G2L SoC. VSPD block is similar to VSP2-D
found on R-Car SoC's, but it does not have a version register and
it has 3 clocks compared to 1 clock on vsp1 and vsp2.

This patch introduces a new compatible 'renesas,r9a07g044-vsp2' to
handle these differences.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v10->v11:
 * No change
v9->v10:
 * No change
v8->v9:
 * No change
v7->v8:
 * Added Clock-names to false for Non RZ/G2L SoC's
 * Replaced compatble 'renesas,rzg2l-vsp2'->'renesas,r9a07g044-vsp2'
 * Removed RZ/V2L SoC, will be added later after testing it.
 * Added Rb tag from Laurent.
v6->v7:
 * No change
v5->v6:
 * Removed LCDC reference clock description
 * Changed the clock name from du.0->aclk
v4->v5:
 * No change
v3->v4:
 * No change
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
 .../bindings/media/renesas,vsp1.yaml          | 53 ++++++++++++++-----
 1 file changed, 40 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
index 990e9c1dbc43..7a8f32473852 100644
--- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
@@ -17,6 +17,7 @@ description:
 properties:
   compatible:
     enum:
+      - renesas,r9a07g044-vsp2 # RZ/G2L
       - renesas,vsp1 # R-Car Gen2 and RZ/G1
       - renesas,vsp2 # R-Car Gen3 and RZ/G2
 
@@ -26,8 +27,8 @@ properties:
   interrupts:
     maxItems: 1
 
-  clocks:
-    maxItems: 1
+  clocks: true
+  clock-names: true
 
   power-domains:
     maxItems: 1
@@ -50,17 +51,43 @@ required:
 
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
+            const: renesas,r9a07g044-vsp2
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Main clock
+            - description: Register access clock
+            - description: Video clock
+        clock-names:
+          items:
+            - const: aclk
+            - const: pclk
+            - const: vclk
+      required:
+        - clock-names
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names: false
 
 examples:
   # R8A7790 (R-Car H2) VSP1-S
-- 
2.25.1

