Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7737715CC1D
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 21:21:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728687AbgBMUU4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 15:20:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:35408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727910AbgBMUU4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 15:20:56 -0500
Received: from ziggy.cz (unknown [37.223.145.31])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B763124703;
        Thu, 13 Feb 2020 20:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581625255;
        bh=jtRrIru+kdDTTzF2tWHdIdQGqmtU5Hrngco15amkEMw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NNX43v2DlSSfgTy1Pgta4dFH2jhsuWj90Jvk3wxpHWFWbLHNPYhKg8H3O7wi6J1yk
         miDfHls4E/jx5Rww7dVwQUGGRo3Z5CviJLSV1IU4BI8Z98CW0ILwjzqbipBrQ8Gu35
         Fr1X49TOu17uj21jcru6ZW+5Fzs2X24GJPKOsygo=
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Richard Fontana <rfontana@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v7 10/13] clk: mediatek: mt6797: switch to platform device probing
Date:   Thu, 13 Feb 2020 21:19:50 +0100
Message-Id: <20200213201953.15268-11-matthias.bgg@kernel.org>
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

 drivers/clk/mediatek/clk-mt6797-mm.c | 34 +++++++++++++++++++---------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6797-mm.c b/drivers/clk/mediatek/clk-mt6797-mm.c
index 8f05653b387d..6a3c54b6b793 100644
--- a/drivers/clk/mediatek/clk-mt6797-mm.c
+++ b/drivers/clk/mediatek/clk-mt6797-mm.c
@@ -4,8 +4,10 @@
  * Author: Kevin Chen <kevin-cw.chen@mediatek.com>
  */
 
+#include <linux/module.h>
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 #include <dt-bindings/clock/mt6797-clk.h>
 
 #include "clk-mtk.h"
@@ -92,23 +94,24 @@ static const struct mtk_gate mm_clks[] = {
 		 "clk26m", 3),
 };
 
-static const struct of_device_id of_match_clk_mt6797_mm[] = {
-	{ .compatible = "mediatek,mt6797-mmsys", },
-	{}
-};
-
 static int clk_mt6797_mm_probe(struct platform_device *pdev)
 {
 	struct clk_onecell_data *clk_data;
 	int r;
-	struct device_node *node = pdev->dev.of_node;
+	struct device *parent = pdev->dev.parent;
+
+	clk_data = devm_kzalloc(&pdev->dev, sizeof(*clk_data), GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
 
 	clk_data = mtk_alloc_clk_data(CLK_MM_NR);
+	platform_set_drvdata(pdev, clk_data);
 
-	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
+	mtk_clk_register_gates(parent->of_node, mm_clks, ARRAY_SIZE(mm_clks),
 			       clk_data);
 
-	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	r = of_clk_add_provider(parent->of_node, of_clk_src_onecell_get,
+				clk_data);
 	if (r)
 		dev_err(&pdev->dev,
 			"could not register clock provider: %s: %d\n",
@@ -117,12 +120,21 @@ static int clk_mt6797_mm_probe(struct platform_device *pdev)
 	return r;
 }
 
+static int clk_mt6797_mm_remove(struct platform_device *pdev)
+{
+	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	kfree(clk_data->clks);
+	kfree(clk_data);
+
+	return 0;
+}
+
 static struct platform_driver clk_mt6797_mm_drv = {
 	.probe = clk_mt6797_mm_probe,
+	.remove = clk_mt6797_mm_remove,
 	.driver = {
 		.name = "clk-mt6797-mm",
-		.of_match_table = of_match_clk_mt6797_mm,
 	},
 };
-
-builtin_platform_driver(clk_mt6797_mm_drv);
+module_platform_driver(clk_mt6797_mm_drv);
-- 
2.24.1

