Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF0E19DB1C
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 18:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404161AbgDCQQP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 12:16:15 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58016 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727431AbgDCQQP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 12:16:15 -0400
Received: from floko.floko.floko (unknown [IPv6:2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8D730260560;
        Fri,  3 Apr 2020 17:16:08 +0100 (BST)
From:   Helen Koike <helen.koike@collabora.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@collabora.com, mark.rutland@arm.com,
        karthik.poduval@gmail.com, jbx6244@gmail.com, kishon@ti.com
Subject: [PATCH v2 3/9] media: staging: dt-bindings: rkisp1: re-order properties
Date:   Fri,  3 Apr 2020 13:15:32 -0300
Message-Id: <20200403161538.1375908-4-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200403161538.1375908-1-helen.koike@collabora.com>
References: <20200403161538.1375908-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Organize properties order in dt-binbings to move it out of staging.

On top: compatible, reg and interrupts.
Then alphabetical order, then properties starting with '#'.

Suggested-by: Johan Jonker <jbx6244@gmail.com>
Signed-off-by: Helen Koike <helen.koike@collabora.com>
---

V2:
- this is a new patch in the series
---
 .../bindings/media/rockchip-isp1.yaml         | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
index 8c7904845788d..e5b9c0574e352 100644
--- a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
+++ b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
@@ -23,19 +23,6 @@ properties:
   interrupts:
     maxItems: 1
 
-  iommus:
-    maxItems: 1
-
-  power-domains:
-    maxItems: 1
-
-  phys:
-    maxItems: 1
-    description: phandle for the PHY port
-
-  phy-names:
-    const: dphy
-
   clocks:
     items:
       - description: ISP clock
@@ -52,6 +39,19 @@ properties:
       - const: hclk_isp
       - const: hclk_isp_wrap
 
+  iommus:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+    description: phandle for the PHY port
+
+  phy-names:
+    const: dphy
+
+  power-domains:
+    maxItems: 1
+
   # See ./video-interfaces.txt for details
   ports:
     type: object
@@ -110,10 +110,10 @@ required:
   - interrupts
   - clocks
   - clock-names
-  - power-domains
   - iommus
   - phys
   - phy-names
+  - power-domains
   - ports
 
 additionalProperties: false
@@ -139,19 +139,19 @@ examples:
             clock-names = "clk_isp",
                           "aclk_isp", "aclk_isp_wrap",
                           "hclk_isp", "hclk_isp_wrap";
-            power-domains = <&power RK3399_PD_ISP0>;
             iommus = <&isp0_mmu>;
             phys = <&dphy>;
             phy-names = "dphy";
+            power-domains = <&power RK3399_PD_ISP0>;
 
             ports {
                 #address-cells = <1>;
                 #size-cells = <0>;
 
                 port@0 {
+                    reg = <0>;
                     #address-cells = <1>;
                     #size-cells = <0>;
-                    reg = <0>;
 
                     mipi_in_wcam: endpoint@0 {
                         reg = <0>;
-- 
2.26.0

