Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0D296D9E42
	for <lists+linux-media@lfdr.de>; Thu,  6 Apr 2023 19:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239281AbjDFRNh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Apr 2023 13:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239161AbjDFRNg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Apr 2023 13:13:36 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1DA6283F8;
        Thu,  6 Apr 2023 10:13:34 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,323,1673881200"; 
   d="scan'208";a="155126055"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 07 Apr 2023 02:13:34 +0900
Received: from localhost.localdomain (unknown [10.226.93.131])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D88D040380A5;
        Fri,  7 Apr 2023 02:13:30 +0900 (JST)
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
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND v4 2/2] media: dt-bindings: media: renesas,vsp1: Document RZ/V2L VSPD bindings
Date:   Thu,  6 Apr 2023 18:13:24 +0100
Message-Id: <20230406171324.837247-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230406171324.837247-1-biju.das.jz@bp.renesas.com>
References: <20230406171324.837247-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document VSPD found in RZ/V2L SoC. The VSPD block is identical to RZ/G2L
SoC and therefore use RZ/G2L fallback to avoid any driver changes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4->v4 Resend:
 * Rebased to next.
 * Added Rb tag from Geert and Ack tag from Krzysztof Kozlowski.
v4:
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

