Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BDD351AD78
	for <lists+linux-media@lfdr.de>; Wed,  4 May 2022 21:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377469AbiEDTKE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 15:10:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377464AbiEDTKC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 15:10:02 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E82B83A5F7;
        Wed,  4 May 2022 12:06:24 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,198,1647270000"; 
   d="scan'208";a="119951028"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 May 2022 04:06:24 +0900
Received: from localhost.localdomain (unknown [10.226.92.27])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 263B940D9534;
        Thu,  5 May 2022 04:06:20 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v10 2/5] media: renesas: vsp1: Add support to deassert/assert reset line
Date:   Wed,  4 May 2022 20:06:06 +0100
Message-Id: <20220504190609.94375-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504190609.94375-1-biju.das.jz@bp.renesas.com>
References: <20220504190609.94375-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As the resets DT property is mandatory, and is present in all .dtsi
in mainline, add support to perform deassert/assert using reference
counted reset handle.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v9->v10:
 * Moved {deassert,assert} calls to vsp1_pm_runtime_{resume,suspend}
v8->v9:
 * No change
v7->v8:
 * No Change
v6->v7:
 * No change
v5->v6:
 * Rebased to media_staging and updated commit header
 * Added Rb tag from Laurent
 * Added forward declaration for struct reset_control
 * Updated vsp1_device_get() with changes suggested by Laurent
 * Updated error message for reset_control_get form ctrl->control.
v4->v5:
 * Added Rb tag from Geert
v3->v4:
 * Restored error check for pm_runtime_resume_and_get and calls
   assert() in case of failure.
v2->v3:
 * Added Rb tag from Philipp
 * If reset_control_deassert() failed, return ret directly. 
v1->v2:
 * Used reference counted reset handle to perform deassert/assert
RFC->v1:
 * Added reset support as separate patch
 * Moved rstc just after the bus_master field in struct vsp1_device
RFC:
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-21-biju.das.jz@bp.renesas.com/
---
 drivers/media/platform/renesas/vsp1/vsp1.h     |  2 ++
 drivers/media/platform/renesas/vsp1/vsp1_drv.c | 17 ++++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1.h b/drivers/media/platform/renesas/vsp1/vsp1.h
index 37cf33c7e6ca..baf898d577ec 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1.h
@@ -22,6 +22,7 @@
 struct clk;
 struct device;
 struct rcar_fcp_device;
+struct reset_control;
 
 struct vsp1_drm;
 struct vsp1_entity;
@@ -79,6 +80,7 @@ struct vsp1_device {
 	void __iomem *mmio;
 	struct rcar_fcp_device *fcp;
 	struct device *bus_master;
+	struct reset_control *rstc;
 
 	struct vsp1_brx *brs;
 	struct vsp1_brx *bru;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 1f73c48eb738..2a18cd6ec538 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -16,6 +16,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/videodev2.h>
 
 #include <media/rcar-fcp.h>
@@ -622,6 +623,7 @@ static int __maybe_unused vsp1_pm_runtime_suspend(struct device *dev)
 	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
 
 	rcar_fcp_disable(vsp1->fcp);
+	reset_control_assert(vsp1->rstc);
 
 	return 0;
 }
@@ -631,13 +633,21 @@ static int __maybe_unused vsp1_pm_runtime_resume(struct device *dev)
 	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
 	int ret;
 
+	ret = reset_control_deassert(vsp1->rstc);
+	if (ret < 0)
+		return ret;
+
 	if (vsp1->info) {
 		ret = vsp1_device_init(vsp1);
 		if (ret < 0)
 			return ret;
 	}
 
-	return rcar_fcp_enable(vsp1->fcp);
+	ret = rcar_fcp_enable(vsp1->fcp);
+	if (ret < 0)
+		reset_control_assert(vsp1->rstc);
+
+	return ret;
 }
 
 static const struct dev_pm_ops vsp1_pm_ops = {
@@ -825,6 +835,11 @@ static int vsp1_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	vsp1->rstc = devm_reset_control_get_shared(&pdev->dev, NULL);
+	if (IS_ERR(vsp1->rstc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(vsp1->rstc),
+				     "failed to get reset control\n");
+
 	/* FCP (optional). */
 	fcp_node = of_parse_phandle(pdev->dev.of_node, "renesas,fcp", 0);
 	if (fcp_node) {
-- 
2.25.1

