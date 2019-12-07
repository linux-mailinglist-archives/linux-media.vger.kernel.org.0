Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B214115F98
	for <lists+linux-media@lfdr.de>; Sat,  7 Dec 2019 23:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbfLGWtA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Dec 2019 17:49:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:44672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726421AbfLGWs7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 7 Dec 2019 17:48:59 -0500
Received: from ziggy.de (unknown [95.169.229.25])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E7D402467B;
        Sat,  7 Dec 2019 22:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575758938;
        bh=JSPEnmIDkobd2bvgU/0fVPQfLB35GOvh84DoJ03YQtA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xRNWDRcrxBWatU0mYCZ/bQCA2Sx1J9ELv0b+8QQIDYu/2iRklhA6BHVCwFCkLtABm
         f4U9Ni/4irWC2wton2yVqNXQnWFuJptWlKr2+j4HOVO0UymtSMpQEBPRHsxpxEAVki
         0QZ36lLj/pSLZzpmE5y1sKBhQQt0zxeQJm+M1p7A=
From:   matthias.bgg@kernel.org
To:     robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
        p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
        sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
        laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Cc:     sean.wang@mediatek.com, sean.wang@kernel.org,
        rdunlap@infradead.org, wens@csie.org, hsinyi@chromium.org,
        frank-w@public-files.de, drinkcat@chromium.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, mbrugger@suse.com,
        matthias.bgg@kernel.org
Subject: [resend PATCH v6 11/12] clk: mediatek: mt8173: switch mmsys to platform device probing
Date:   Sat,  7 Dec 2019 23:47:39 +0100
Message-Id: <20191207224740.24536-12-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207224740.24536-1-matthias.bgg@kernel.org>
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
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
 drivers/clk/mediatek/clk-mt8173.c | 51 ++++++++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 537a7f49b0f7..1e6a390534e4 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -5,8 +5,11 @@
  */
 
 #include <linux/clk.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "clk-mtk.h"
 #include "clk-gate.h"
@@ -783,7 +786,7 @@ static const struct mtk_gate_regs mm1_cg_regs __initconst = {
 		.ops = &mtk_clk_gate_ops_setclr,		\
 	}
 
-static const struct mtk_gate mm_clks[] __initconst = {
+static const struct mtk_gate mm_clks[] = {
 	/* MM0 */
 	GATE_MM0(CLK_MM_SMI_COMMON, "mm_smi_common", "mm_sel", 0),
 	GATE_MM0(CLK_MM_SMI_LARB0, "mm_smi_larb0", "mm_sel", 1),
@@ -1144,22 +1147,56 @@ static void __init mtk_imgsys_init(struct device_node *node)
 }
 CLK_OF_DECLARE(mtk_imgsys, "mediatek,mt8173-imgsys", mtk_imgsys_init);
 
-static void __init mtk_mmsys_init(struct device_node *node)
-{
+struct mtk_mmsys_priv {
 	struct clk_onecell_data *clk_data;
+};
+
+static int mtk_mmsys_probe(struct platform_device *pdev)
+{
 	int r;
+	struct device_node *node;
+	struct mtk_mmsys_priv *private;
+
+	node = pdev->dev.parent->of_node;
 
-	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
+	private = devm_kzalloc(&pdev->dev, sizeof(*private), GFP_KERNEL);
+	if (!private)
+		return -ENOMEM;
+
+	private->clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
+
+	platform_set_drvdata(pdev, private);
 
 	mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
-						clk_data);
+					private->clk_data);
 
-	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	r = of_clk_add_provider(node, of_clk_src_onecell_get,
+					private->clk_data);
 	if (r)
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
+
+	return r;
+}
+
+static int mtk_mmsys_remove(struct platform_device *pdev)
+{
+	struct mtk_mmsys_priv *private;
+	private = platform_get_drvdata(pdev);
+
+	kfree(private->clk_data);
+
+	return 0;
 }
-CLK_OF_DECLARE(mtk_mmsys, "mediatek,mt8173-mmsys", mtk_mmsys_init);
+
+static struct platform_driver clk_mt8173_mm_drv = {
+	.probe = mtk_mmsys_probe,
+	.remove = mtk_mmsys_remove,
+	.driver = {
+		.name = "clk-mt8173-mm",
+	},
+};
+module_platform_driver(clk_mt8173_mm_drv);
 
 static void __init mtk_vdecsys_init(struct device_node *node)
 {
-- 
2.24.0

