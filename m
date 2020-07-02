Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91986212A7F
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 18:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgGBQyt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 12:54:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgGBQyt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 12:54:49 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1DFBC08C5C1;
        Thu,  2 Jul 2020 09:54:48 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 52CFD2A5FA3
From:   Helen Koike <helen.koike@collabora.com>
To:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        robh+dt@kernel.org, heiko@sntech.de, hverkuil-cisco@xs4all.nl,
        kernel@collabora.com, dafna.hirschfeld@collabora.com,
        ezequiel@collabora.com, mark.rutland@arm.com,
        karthik.poduval@gmail.com, jbx6244@gmail.com, kishon@ti.com,
        tfiga@chromium.org, eddie.cai.linux@gmail.com,
        zhengsq@rock-chips.com
Subject: [PATCH v3 5/9] media: staging: rkisp1: remove unecessary clocks
Date:   Thu,  2 Jul 2020 13:54:06 -0300
Message-Id: <20200702165410.2583375-6-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200702165410.2583375-1-helen.koike@collabora.com>
References: <20200702165410.2583375-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

aclk_isp_wrap is a child of aclk_isp, and hclk_isp_wrap is a child of
hclk_isp, thus we can remove parents from the list, with the goal to
cleanup the dt-bindings and remove it from staging.

For reference, this is the isp clock topology:

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
Changes in V3:
- this is a new patch in the series
---
 .../bindings/media/rockchip-isp1.yaml         | 33 ++++++++++---------
 drivers/staging/media/rkisp1/rkisp1-dev.c     |  2 --
 2 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
index 4d111ef2e89c7..f806820eb8153 100644
--- a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
+++ b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
@@ -24,20 +24,21 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: ISP clock
-      - description: ISP AXI clock clock
-      - description: ISP AXI clock  wrapper clock
-      - description: ISP AHB clock clock
-      - description: ISP AHB wrapper clock
+    maxItems: 5
+    minItems: 3
+    description:
+      rk3399 isp0 clocks
+        ISP clock
+        ISP AXI wrapper clock
+        ISP AHB wrapper clock
 
   clock-names:
-    items:
-      - const: clk_isp
-      - const: aclk_isp
-      - const: aclk_isp_wrap
-      - const: hclk_isp
-      - const: hclk_isp_wrap
+    oneOf:
+      # rk3399 isp0 clocks
+      - items:
+        - const: clk_isp
+        - const: aclk_isp_wrap
+        - const: hclk_isp_wrap
 
   iommus:
     maxItems: 1
@@ -135,11 +136,11 @@ examples:
             reg = <0x0 0xff910000 0x0 0x4000>;
             interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH 0>;
             clocks = <&cru SCLK_ISP0>,
-                     <&cru ACLK_ISP0>, <&cru ACLK_ISP0_WRAPPER>,
-                     <&cru HCLK_ISP0>, <&cru HCLK_ISP0_WRAPPER>;
+                     <&cru ACLK_ISP0_WRAPPER>,
+                     <&cru HCLK_ISP0_WRAPPER>;
             clock-names = "clk_isp",
-                          "aclk_isp", "aclk_isp_wrap",
-                          "hclk_isp", "hclk_isp_wrap";
+                          "aclk_isp_wrap",
+                          "hclk_isp_wrap";
             iommus = <&isp0_mmu>;
             phys = <&dphy>;
             phy-names = "dphy";
diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
index f38801fea10d9..36f5f3b97a9b9 100644
--- a/drivers/staging/media/rkisp1/rkisp1-dev.c
+++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
@@ -407,8 +407,6 @@ static irqreturn_t rkisp1_isr(int irq, void *ctx)
 
 static const char * const rk3399_isp_clks[] = {
 	"clk_isp",
-	"aclk_isp",
-	"hclk_isp",
 	"aclk_isp_wrap",
 	"hclk_isp_wrap",
 };
-- 
2.26.0

