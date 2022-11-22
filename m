Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 853E86344AF
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 20:34:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234384AbiKVTe3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 14:34:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232341AbiKVTe1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 14:34:27 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 117DC2528F;
        Tue, 22 Nov 2022 11:34:25 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,184,1665414000"; 
   d="scan'208";a="143577054"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Nov 2022 04:34:25 +0900
Received: from localhost.localdomain (unknown [10.226.92.123])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2710640A6A18;
        Wed, 23 Nov 2022 04:34:21 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 2/2] media: dt-bindings: media: renesas,fcp: Document RZ/{G2L,V2L} FCPVD bindings
Date:   Tue, 22 Nov 2022 19:34:15 +0000
Message-Id: <20221122193415.1873179-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221122193415.1873179-1-biju.das.jz@bp.renesas.com>
References: <20221122193415.1873179-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document FCPVD found in RZ/G2L alike SoCs. FCPVD block is similar to
FCP for VSP found on R-Car SoC's . It has 3 clocks compared to 1
clock on fcpv. Introduce new compatibles renesas,r9a07g044-fcpvd
for RZ/G2{L,LC} and renesas,r9a07g054-fcpvd for RZ/V2L to handle this
difference.

The 3 clocks are shared between du, vspd and fcpvd. No driver changes
are required as generic compatible string "renesas,fcpv" will be used
as a fallback.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v3->v4:
 * Added Rb tag from Rob.
v2->v3:
 * Updated the compatibles by replacing items->enum as
   it is just one item.
v1->v2:
 * Documented RZ/{G2,V2}L FCPVD bindings
 * Introduces new compatibles renesas,r9a07g0{44,54}-fcpvd
 * Added clock-names property
 * described clocks.
---
 .../bindings/media/renesas,fcp.yaml           | 45 ++++++++++++++++---
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index 43f2fed8cd33..c6abe719881b 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -21,15 +21,22 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - renesas,fcpv # FCP for VSP
-      - renesas,fcpf # FCP for FDP
+    oneOf:
+      - enum:
+          - renesas,fcpv # FCP for VSP
+          - renesas,fcpf # FCP for FDP
+      - items:
+          - enum:
+              - renesas,r9a07g044-fcpvd # RZ/G2{L,LC}
+              - renesas,r9a07g054-fcpvd # RZ/V2L
+          - const: renesas,fcpv         # Generic FCP for VSP fallback
 
   reg:
     maxItems: 1
 
-  clocks:
-    maxItems: 1
+  clocks: true
+
+  clock-names: true
 
   iommus:
     maxItems: 1
@@ -49,6 +56,34 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a07g044-fcpvd
+              - renesas,r9a07g054-fcpvd
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
+
 examples:
   # R8A7795 (R-Car H3) FCP for VSP-D1
   - |
-- 
2.25.1

