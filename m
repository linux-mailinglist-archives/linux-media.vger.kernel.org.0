Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEA1F6344AC
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 20:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232993AbiKVTeY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 14:34:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232341AbiKVTeX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 14:34:23 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2687E2714C;
        Tue, 22 Nov 2022 11:34:22 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,184,1665414000"; 
   d="scan'208";a="140905988"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Nov 2022 04:34:21 +0900
Received: from localhost.localdomain (unknown [10.226.92.123])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4443E40A6A16;
        Wed, 23 Nov 2022 04:34:18 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v4 1/2] media: dt-bindings: media: renesas,vsp1: Document RZ/V2L VSPD bindings
Date:   Tue, 22 Nov 2022 19:34:14 +0000
Message-Id: <20221122193415.1873179-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document VSPD found in RZ/V2L SoC. The VSPD block is identical to RZ/G2L
SoC and therefore use RZ/G2L fallback to avoid any driver changes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
* New patch
---
 .../devicetree/bindings/media/renesas,vsp1.yaml     | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
index 7a8f32473852..3265e922647c 100644
--- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
@@ -16,10 +16,15 @@ description:
 
 properties:
   compatible:
-    enum:
-      - renesas,r9a07g044-vsp2 # RZ/G2L
-      - renesas,vsp1 # R-Car Gen2 and RZ/G1
-      - renesas,vsp2 # R-Car Gen3 and RZ/G2
+    oneOf:
+      - enum:
+          - renesas,r9a07g044-vsp2 # RZ/G2L
+          - renesas,vsp1 # R-Car Gen2 and RZ/G1
+          - renesas,vsp2 # R-Car Gen3 and RZ/G2
+      - items:
+          - enum:
+              - renesas,r9a07g054-vsp2    # RZ/V2L
+          - const: renesas,r9a07g044-vsp2 # RZ/G2L fallback
 
   reg:
     maxItems: 1
-- 
2.25.1

