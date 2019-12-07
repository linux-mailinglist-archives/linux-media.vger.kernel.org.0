Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1622C115F14
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2019 23:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbfLGWZE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Dec 2019 17:25:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:37272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726480AbfLGWZD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 7 Dec 2019 17:25:03 -0500
Received: from ziggy.de (unknown [95.169.229.25])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0BA972467A;
        Sat,  7 Dec 2019 22:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575757502;
        bh=auWyY9ONWyopnTa7jwZEHJgz7lHXT4cKj+bG2jBUqvU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o2cYWX7XYwqfasgRwBzONZXnGSG79B7RJcVEYVIuszy/TFDcXPT1rcAZ0y+gZfEq0
         aViL0R5MtDtN3RwE2tC4t73mCKE6ZSeVb5PfQoOqzXroHT2BrO5Ot5rF47vJIW0Orq
         XnH+BckYHxugym2U9RzAfKVCwtzgiFYIvPWXdPbk=
From:   matthias.bgg@kernel.org
To:     robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
        p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
        sboyd@codeaurora.org, ulrich.hecht+renesas@gmail.com,
        laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Cc:     sean.wang@mediatek.com, sean.wang@kernel.org,
        rdunlap@infradead.org, wens@csie.org, hsinyi@chromium.org,
        frank-w@public-files.de, drinkcat@chromium.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, mbrugger@suse.com
Subject: [PATCH v6 07/12] clk: mediatek: mt2712e: switch to platform device probing
Date:   Sat,  7 Dec 2019 23:23:44 +0100
Message-Id: <20191207222349.23161-8-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207222349.23161-1-matthias.bgg@kernel.org>
References: <20191207222349.23161-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Matthias Brugger <mbrugger@suse.com>

Switch probing for the MMSYS to support invocation to a
plain paltform device. The driver will be probed by the DRM subsystem.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 drivers/clk/mediatek/clk-mt2712-mm.c | 39 +++++++++++++++++++---------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2712-mm.c b/drivers/clk/mediatek/clk-mt2712-mm.c
index 1c5948be35f3..d018db568263 100644
--- a/drivers/clk/mediatek/clk-mt2712-mm.c
+++ b/drivers/clk/mediatek/clk-mt2712-mm.c
@@ -4,14 +4,20 @@
  * Author: Weiyi Lu <weiyi.lu@mediatek.com>
  */
 
+#include <linux/module.h>
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "clk-mtk.h"
 #include "clk-gate.h"
 
 #include <dt-bindings/clock/mt2712-clk.h>
 
+struct clk_mt2712_mm_priv {
+	struct clk_onecell_data *clk_data;
+};
+
 static const struct mtk_gate_regs mm0_cg_regs = {
 	.set_ofs = 0x104,
 	.clr_ofs = 0x108,
@@ -128,16 +134,22 @@ static const struct mtk_gate mm_clks[] = {
 
 static int clk_mt2712_mm_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
 	int r;
-	struct device_node *node = pdev->dev.of_node;
+	struct device_node *node = pdev->dev.parent->of_node;
+	struct clk_mt2712_mm_priv *private;
+
+	private = devm_kzalloc(&pdev->dev, sizeof(*private), GFP_KERNEL);
+	if (!private)
+		return -ENOMEM;
 
-	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
+	private->clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
+	platform_set_drvdata(pdev, private);
 
 	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
-			clk_data);
+			private->clk_data);
 
-	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	r = of_clk_add_provider(node, of_clk_src_onecell_get,
+			private->clk_data);
 
 	if (r != 0)
 		pr_err("%s(): could not register clock provider: %d\n",
@@ -146,17 +158,20 @@ static int clk_mt2712_mm_probe(struct platform_device *pdev)
 	return r;
 }
 
-static const struct of_device_id of_match_clk_mt2712_mm[] = {
-	{ .compatible = "mediatek,mt2712-mmsys", },
-	{}
-};
+static int clk_mt2712_mm_remove(struct platform_device *pdev)
+{
+	struct clk_mt2712_mm_priv *private = platform_get_drvdata(pdev);
+
+	kfree(private->clk_data);
+
+	return 0;
+}
 
 static struct platform_driver clk_mt2712_mm_drv = {
 	.probe = clk_mt2712_mm_probe,
+	.remove = clk_mt2712_mm_remove,
 	.driver = {
 		.name = "clk-mt2712-mm",
-		.of_match_table = of_match_clk_mt2712_mm,
 	},
 };
-
-builtin_platform_driver(clk_mt2712_mm_drv);
+module_platform_driver(clk_mt2712_mm_drv);
-- 
2.24.0

