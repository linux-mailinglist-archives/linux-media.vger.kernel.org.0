Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88246181E61
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 17:54:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730375AbgCKQxt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 12:53:49 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60748 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730342AbgCKQxs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 12:53:48 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id A9F3B2930CF
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
        p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
        sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
        laurent.pinchart@ideasonboard.com
Cc:     Allison Randal <allison@lohutok.net>,
        Matthias Brugger <matthias.bgg@gmail.com>, wens@csie.org,
        linux-media@vger.kernel.org, sean.wang@mediatek.com,
        hsinyi@chromium.org, rdunlap@infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-kernel@lists.infradead.org, matthias.bgg@kernel.org,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        frank-w@public-files.de, devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        linux-kernel@vger.kernel.org, mtk01761 <wendell.lin@mediatek.com>,
        Richard Fontana <rfontana@redhat.com>
Subject: [PATCH v12 5/5] soc / drm: mediatek: Fix mediatek-drm device probing
Date:   Wed, 11 Mar 2020 17:53:22 +0100
Message-Id: <20200311165322.1594233-6-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311165322.1594233-1-enric.balletbo@collabora.com>
References: <20200311165322.1594233-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the actual implementation the same compatible string
"mediatek,<chip>-mmsys" is used to bind the clock drivers
(drivers/soc/mediatek) as well as to the gpu driver
(drivers/gpu/drm/mediatek/mtk_drm_drv.c). This ends with the problem
that the only probed driver is the clock driver and there is no display
at all.

In any case having the same compatible string for two drivers is not
correct and should be fixed. To fix this, and maintain backward
compatibility, we can consider that the mmsys driver is the top-level
entry point for the multimedia subsystem, so is not a pure clock
controller but a system controller, and the drm driver is instantiated
by that MMSYS driver.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Acked-by: CK Hu <ck.hu@mediatek.com>
---

Changes in v12: None
Changes in v10:
- Match driver data to get display routing.

Changes in v9:
- Do not move the display routing from the drm driver (CK)

Changes in v8:
- New patch introduced in this series.

Changes in v7: None

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 31 ++++++++++++++++----------
 drivers/soc/mediatek/mtk-mmsys.c       |  6 +++++
 2 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 208f9c5256ef..bb26e346750a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -422,9 +422,21 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	{ }
 };
 
+static const struct of_device_id mtk_drm_of_ids[] = {
+	{ .compatible = "mediatek,mt2701-mmsys",
+	  .data = &mt2701_mmsys_driver_data},
+	{ .compatible = "mediatek,mt2712-mmsys",
+	  .data = &mt2712_mmsys_driver_data},
+	{ .compatible = "mediatek,mt8173-mmsys",
+	  .data = &mt8173_mmsys_driver_data},
+	{ }
+};
+
 static int mtk_drm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *phandle = dev->parent->of_node;
+	const struct of_device_id *of_id;
 	struct mtk_drm_private *private;
 	struct device_node *node;
 	struct component_match *match = NULL;
@@ -442,8 +454,14 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	of_id = of_match_node(mtk_drm_of_ids, phandle);
+	if (!of_id)
+		return -ENODEV;
+
+	private->data = of_id->data;
+
 	/* Iterate over sibling DISP function blocks */
-	for_each_child_of_node(dev->of_node->parent, node) {
+	for_each_child_of_node(phandle->parent, node) {
 		const struct of_device_id *of_id;
 		enum mtk_ddp_comp_type comp_type;
 		int comp_id;
@@ -575,22 +593,11 @@ static int mtk_drm_sys_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(mtk_drm_pm_ops, mtk_drm_sys_suspend,
 			 mtk_drm_sys_resume);
 
-static const struct of_device_id mtk_drm_of_ids[] = {
-	{ .compatible = "mediatek,mt2701-mmsys",
-	  .data = &mt2701_mmsys_driver_data},
-	{ .compatible = "mediatek,mt2712-mmsys",
-	  .data = &mt2712_mmsys_driver_data},
-	{ .compatible = "mediatek,mt8173-mmsys",
-	  .data = &mt8173_mmsys_driver_data},
-	{ }
-};
-
 static struct platform_driver mtk_drm_platform_driver = {
 	.probe	= mtk_drm_probe,
 	.remove	= mtk_drm_remove,
 	.driver	= {
 		.name	= "mediatek-drm",
-		.of_match_table = mtk_drm_of_ids,
 		.pm     = &mtk_drm_pm_ops,
 	},
 };
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 4b286b525cd3..32a92ec447c5 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -285,6 +285,7 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	const struct mtk_mmsys_driver_data *data;
 	struct device *dev = &pdev->dev;
 	struct platform_device *clks;
+	struct platform_device *drm;
 	void __iomem *config_regs;
 	struct resource *mem;
 	int ret;
@@ -307,6 +308,11 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	if (IS_ERR(clks))
 		return PTR_ERR(clks);
 
+	drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
+					    PLATFORM_DEVID_AUTO, NULL, 0);
+	if (IS_ERR(drm))
+		return PTR_ERR(drm);
+
 	return 0;
 }
 
-- 
2.25.1

