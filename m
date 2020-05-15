Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8F8E1D42E5
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 03:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728287AbgEOBYz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 21:24:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54678 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728228AbgEOBYy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 21:24:54 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 871339C5;
        Fri, 15 May 2020 03:24:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589505888;
        bh=ar8B5Xez/Hz/EUg7PRIHf5/uMtm6g8ntgLFGbVcFHWs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=E4s5IF0QvJhsBjelrC0qxPcnnhCstfRgzkJGmQsrpmzSCtUNc4UcZF/DkKXXcRUI6
         rQGf7zQsCNCj7rVfWrrQWtt3SWrIkcoZv73rHUijrH93hQJAijQoWsDboy1Qm98map
         CfyR9UUj6WCjURzpI52gu1QySFHsMMRYAk9KuKRo=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 8/8] dt-bindings: media: renesas,vsp1: Add power-domains and resets
Date:   Fri, 15 May 2020 04:24:32 +0300
Message-Id: <20200515012432.31326-9-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200515012432.31326-1-laurent.pinchart+renesas@ideasonboard.com>
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
---
 .../devicetree/bindings/media/renesas,vsp1.yaml    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
index 54b130de3ae2..ed52888baa4d 100644
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

