Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0224B15CC15
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 21:21:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728531AbgBMUUq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 15:20:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:35050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727893AbgBMUUp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 15:20:45 -0500
Received: from ziggy.cz (unknown [37.223.145.31])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 22A56246A8;
        Thu, 13 Feb 2020 20:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581625245;
        bh=bQVp1Al33e4cvhfDFNoZExbWlmh3HEV/Q7Ysm8oRPKQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r2dQED7EQ+nKFUaVHrgcOgfOknWdG2JCHgo0AlknsNesajApeGFMRWaHDI4e0C4Hf
         hlRqwLnovodSCCiOpxZFLJkW4t1FonPwORQSGYfi3WSl0isea/Gd4h7rmB21wZzrwu
         OpDt+TtKvaeHMS037xPc4imhZUK68eNqsYJv8F5g=
From:   matthias.bgg@kernel.org
To:     robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
        p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
        sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
        laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Cc:     devicetree@vger.kernel.org, drinkcat@chromium.org,
        frank-w@public-files.de, sean.wang@mediatek.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        wens@csie.org, linux-mediatek@lists.infradead.org,
        rdunlap@infradead.org, matthias.bgg@kernel.org,
        hsinyi@chromium.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Matthias Brugger <mbrugger@suse.com>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Richard Fontana <rfontana@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v7 08/13] clk: mediatek: mt2712e: switch to platform device probing
Date:   Thu, 13 Feb 2020 21:19:48 +0100
Message-Id: <20200213201953.15268-9-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213201953.15268-1-matthias.bgg@kernel.org>
References: <20200213201953.15268-1-matthias.bgg@kernel.org>
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

Changes in v7:
- free clk_data->clks as well
- get rid of private data structure

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/clk/mediatek/clk-mt2712-mm.c | 32 ++++++++++++++++++----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2712-mm.c b/drivers/clk/mediatek/clk-mt2712-mm.c
index 1c5948be35f3..2ab86262dc17 100644
--- a/drivers/clk/mediatek/clk-mt2712-mm.c
+++ b/drivers/clk/mediatek/clk-mt2712-mm.c
@@ -4,8 +4,10 @@
  * Author: Weiyi Lu <weiyi.lu@mediatek.com>
  */
 
+#include <linux/module.h>
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "clk-mtk.h"
 #include "clk-gate.h"
@@ -128,14 +130,18 @@ static const struct mtk_gate mm_clks[] = {
 
 static int clk_mt2712_mm_probe(struct platform_device *pdev)
 {
-	struct clk_onecell_data *clk_data;
 	int r;
-	struct device_node *node = pdev->dev.of_node;
+	struct device_node *node = pdev->dev.parent->of_node;
+	struct clk_onecell_data *clk_data;
+
+	clk_data = devm_kzalloc(&pdev->dev, sizeof(*clk_data), GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
 
 	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
+	platform_set_drvdata(pdev, clk_data);
 
-	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
-			clk_data);
+	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks), clk_data);
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 
@@ -146,17 +152,21 @@ static int clk_mt2712_mm_probe(struct platform_device *pdev)
 	return r;
 }
 
-static const struct of_device_id of_match_clk_mt2712_mm[] = {
-	{ .compatible = "mediatek,mt2712-mmsys", },
-	{}
-};
+static int clk_mt2712_mm_remove(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	kfree(clk_data->clks);
+	kfree(clk_data);
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
2.24.1

