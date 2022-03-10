Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1D4B4D4F40
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 17:29:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243881AbiCJQ33 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 11:29:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239972AbiCJQ31 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 11:29:27 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 67D134C425;
        Thu, 10 Mar 2022 08:28:25 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,171,1643641200"; 
   d="scan'208";a="113985123"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 11 Mar 2022 01:28:25 +0900
Received: from localhost.localdomain (unknown [10.226.92.47])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CF92140A24DC;
        Fri, 11 Mar 2022 01:28:22 +0900 (JST)
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
Subject: [PATCH v2 2/3] media: vsp1: Add support to deassert/assert reset line
Date:   Thu, 10 Mar 2022 16:28:13 +0000
Message-Id: <20220310162814.22234-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220310162814.22234-1-biju.das.jz@bp.renesas.com>
References: <20220310162814.22234-1-biju.das.jz@bp.renesas.com>
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
---
v1->v2:
 * Used reference counted reset handle to perform deassert/assert
RFC->v1:
 * Added reset support as separate patch
 * Moved rstc just after the bus_master field in struct vsp1_device
RFC:
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-21-biju.das.jz@bp.renesas.com/
---
 drivers/media/platform/vsp1/vsp1.h     |  1 +
 drivers/media/platform/vsp1/vsp1_drv.c | 21 ++++++++++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/vsp1/vsp1.h b/drivers/media/platform/vsp1/vsp1.h
index 37cf33c7e6ca..c5da829c79b5 100644
--- a/drivers/media/platform/vsp1/vsp1.h
+++ b/drivers/media/platform/vsp1/vsp1.h
@@ -79,6 +79,7 @@ struct vsp1_device {
 	void __iomem *mmio;
 	struct rcar_fcp_device *fcp;
 	struct device *bus_master;
+	struct reset_control *rstc;
 
 	struct vsp1_brx *brs;
 	struct vsp1_brx *bru;
diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
index 502c7d9d6890..dbe90ceec327 100644
--- a/drivers/media/platform/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/vsp1/vsp1_drv.c
@@ -16,6 +16,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/videodev2.h>
 
 #include <media/rcar-fcp.h>
@@ -569,7 +570,19 @@ static void vsp1_mask_all_interrupts(struct vsp1_device *vsp1)
  */
 int vsp1_device_get(struct vsp1_device *vsp1)
 {
-	return pm_runtime_resume_and_get(vsp1->dev);
+	int ret = reset_control_deassert(vsp1->rstc);
+
+	if (ret < 0)
+		goto err;
+
+	ret = pm_runtime_resume_and_get(vsp1->dev);
+	if (ret < 0)
+		goto err;
+
+	return 0;
+err:
+	reset_control_assert(vsp1->rstc);
+	return ret;
 }
 
 /*
@@ -581,6 +594,7 @@ int vsp1_device_get(struct vsp1_device *vsp1)
 void vsp1_device_put(struct vsp1_device *vsp1)
 {
 	pm_runtime_put_sync(vsp1->dev);
+	reset_control_assert(vsp1->rstc);
 }
 
 /* -----------------------------------------------------------------------------
@@ -827,6 +841,11 @@ static int vsp1_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	vsp1->rstc = devm_reset_control_get_shared(&pdev->dev, NULL);
+	if (IS_ERR(vsp1->rstc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(vsp1->rstc),
+				     "failed to get reset ctrl\n");
+
 	/* FCP (optional). */
 	fcp_node = of_parse_phandle(pdev->dev.of_node, "renesas,fcp", 0);
 	if (fcp_node) {
-- 
2.17.1

