Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75E47229C30
	for <lists+linux-media@lfdr.de>; Wed, 22 Jul 2020 17:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733205AbgGVP4M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 11:56:12 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35784 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733194AbgGVP4K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 11:56:10 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id DD6B0297600
From:   Helen Koike <helen.koike@collabora.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@collabora.com, mark.rutland@arm.com,
        karthik.poduval@gmail.com, jbx6244@gmail.com, tfiga@chromium.org,
        eddie.cai.linux@gmail.com, zhengsq@rock-chips.com,
        robin.murphy@arm.com
Subject: [PATCH v5 5/9] media: staging: rkisp1: remove unecessary clocks
Date:   Wed, 22 Jul 2020 12:55:29 -0300
Message-Id: <20200722155533.252844-6-helen.koike@collabora.com>
X-Mailer: git-send-email 2.28.0.rc1
In-Reply-To: <20200722155533.252844-1-helen.koike@collabora.com>
References: <20200722155533.252844-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

aclk_isp_wrap is a child of aclk_isp, and hclk_isp_wrap is a child of
hclk_isp, thus we can remove parents from the list.

Also, for the isp0, we only need the ISP clock, ACLK and HCLK.
In the future we'll need a pixel clock for RK3288 and RK3399, and a JPEG
clock for RK3288.

So with the goal to cleanup the dt-bindings and remove it from staging,
simplify clock names to isp, aclk and hclk.

Assigned clocks are meant to refer to the full path in the clock tree,
i.e. the leaf in the tree.
For instance, in RK3399, the clock responsible for ACLK (ISP AXI CLOCK)
is aclk_isp0_wrapper.

For reference, this is the isp clock topology on RK3399:

 xin24m
    pll_npll
       npll
          clk_isp1
          clk_isp0
    pll_cpll
       cpll
          aclk_isp1
             aclk_isp1_noc
             hclk_isp1
                aclk_isp1_wrapper
                hclk_isp1_noc
          aclk_isp0
             hclk_isp1_wrapper
             aclk_isp0_wrapper
             aclk_isp0_noc
             hclk_isp0
                hclk_isp0_wrapper
                hclk_isp0_noc
 pclkin_isp1_wrapper

Signed-off-by: Helen Koike <helen.koike@collabora.com>

---
Changes in V5:
- Use if/then schema as suggested by Rob Herring on
https://patchwork.linuxtv.org/project/linux-media/patch/20200702191322.2639681-6-helen.koike@collabora.com/#119729

Changes in V4:
- update binding according to suggestion by Robin Murphy
on https://patchwork.kernel.org/patch/11475007/

Changes in V3:
- this is a new patch in the series
---
 .../bindings/media/rockchip-isp1.yaml         | 50 ++++++++++++-------
 drivers/staging/media/rkisp1/rkisp1-dev.c     |  8 ++-
 2 files changed, 36 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
index 62a6b9c959498..23c677d15037a 100644
--- a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
+++ b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
@@ -24,20 +24,10 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: ISP clock
-      - description: ISP AXI clock clock
-      - description: ISP AXI clock  wrapper clock
-      - description: ISP AHB clock clock
-      - description: ISP AHB wrapper clock
+    minItems: 3
 
   clock-names:
-    items:
-      - const: clk_isp
-      - const: aclk_isp
-      - const: aclk_isp_wrap
-      - const: hclk_isp
-      - const: hclk_isp_wrap
+    minItems: 3
 
   iommus:
     maxItems: 1
@@ -116,6 +106,34 @@ required:
   - power-domains
   - ports
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: rockchip,rk3399-cif-isp
+then:
+  properties:
+    clocks:
+      maxItems: 4
+      minItems: 3
+      items:
+        # isp0 and isp1
+        - description: ISP clock
+        - description: ISP AXI clock
+        - description: ISP AHB clock
+        # only for isp1
+        - description: ISP Pixel clock
+    clock-names:
+      maxItems: 4
+      minItems: 3
+      items:
+        # isp0 and isp1
+        - const: isp
+        - const: aclk
+        - const: hclk
+        # only for isp1
+        - const: pclk_isp
+
 additionalProperties: false
 
 examples:
@@ -134,11 +152,9 @@ examples:
             reg = <0x0 0xff910000 0x0 0x4000>;
             interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH 0>;
             clocks = <&cru SCLK_ISP0>,
-                     <&cru ACLK_ISP0>, <&cru ACLK_ISP0_WRAPPER>,
-                     <&cru HCLK_ISP0>, <&cru HCLK_ISP0_WRAPPER>;
-            clock-names = "clk_isp",
-                          "aclk_isp", "aclk_isp_wrap",
-                          "hclk_isp", "hclk_isp_wrap";
+                     <&cru ACLK_ISP0_WRAPPER>,
+                     <&cru HCLK_ISP0_WRAPPER>;
+            clock-names = "isp", "aclk", "hclk";
             iommus = <&isp0_mmu>;
             phys = <&dphy>;
             phy-names = "dphy";
diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
index a0eb8f08708b9..1ebf10a6f188c 100644
--- a/drivers/staging/media/rkisp1/rkisp1-dev.c
+++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
@@ -406,11 +406,9 @@ static irqreturn_t rkisp1_isr(int irq, void *ctx)
 }
 
 static const char * const rk3399_isp_clks[] = {
-	"clk_isp",
-	"aclk_isp",
-	"hclk_isp",
-	"aclk_isp_wrap",
-	"hclk_isp_wrap",
+	"isp",
+	"aclk",
+	"hclk",
 };
 
 static const struct rkisp1_match_data rk3399_isp_clk_data = {
-- 
2.28.0.rc1

