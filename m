Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6B762027BE
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2020 02:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729122AbgFUAsN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Jun 2020 20:48:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60972 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729079AbgFUAsM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Jun 2020 20:48:12 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2FF90552;
        Sun, 21 Jun 2020 02:48:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592700486;
        bh=T2gCA4T8mtz1HoFQ2uWHrRsSxO+iWFnLgHfz0vIqZco=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Nbci1orAELj30VHuptm9yg3pkzxcWy6i5GZBfRrhLwIUSlEa1tYw44EhjxmgqAxuW
         8uDUVQvBcgFt8BR9Ts8H9ICP61E2mg9LnSN9McxoYTKZOs3dRt0jIm3jfUBoywO39M
         RM25JSwZ5C8q+0yTXSlcxjXoWHFBfKaYL5qQ4hus=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 8/8] dt-bindings: media: renesas,vsp1: Add power-domains and resets
Date:   Sun, 21 Jun 2020 03:47:34 +0300
Message-Id: <20200621004734.28602-9-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The power-domains and resets properties are used in all DT sources in
the kernel but are absent from the bindings. Document them and make them
mandatory.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/media/renesas,vsp1.yaml    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
index 65e8ee61ce90..990e9c1dbc43 100644
--- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
@@ -29,6 +29,12 @@ properties:
   clocks:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
   renesas,fcp:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -39,6 +45,8 @@ required:
   - reg
   - interrupts
   - clocks
+  - power-domains
+  - resets
 
 additionalProperties: false
 
@@ -59,24 +67,30 @@ examples:
   - |
     #include <dt-bindings/clock/renesas-cpg-mssr.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7790-sysc.h>
 
     vsp@fe928000 {
         compatible = "renesas,vsp1";
         reg = <0xfe928000 0x8000>;
         interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&cpg CPG_MOD 131>;
+        power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+        resets = <&cpg 131>;
     };
 
   # R8A77951 (R-Car H3) VSP2-BC
   - |
     #include <dt-bindings/clock/renesas-cpg-mssr.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7795-sysc.h>
 
     vsp@fe920000 {
         compatible = "renesas,vsp2";
         reg = <0xfe920000 0x8000>;
         interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&cpg CPG_MOD 624>;
+        power-domains = <&sysc R8A7795_PD_A3VP>;
+        resets = <&cpg 624>;
 
         renesas,fcp = <&fcpvb1>;
     };
-- 
Regards,

Laurent Pinchart

