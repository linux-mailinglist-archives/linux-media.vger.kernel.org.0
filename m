Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05C7F4D3A8E
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 20:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238010AbiCITqg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 14:46:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238003AbiCITqf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 14:46:35 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 55B878E;
        Wed,  9 Mar 2022 11:45:36 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,168,1643641200"; 
   d="scan'208";a="113002341"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Mar 2022 04:45:36 +0900
Received: from localhost.localdomain (unknown [10.226.92.47])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B99F740DD852;
        Thu, 10 Mar 2022 04:45:33 +0900 (JST)
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
Subject: [PATCH 3/3] media: vsp1: Add support for RZ/G2L VSPD
Date:   Wed,  9 Mar 2022 19:45:21 +0000
Message-Id: <20220309194521.7028-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220309194521.7028-1-biju.das.jz@bp.renesas.com>
References: <20220309194521.7028-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The RZ/G2L VSPD provides a single VSPD instance. It has the following
sub modules MAU, CTU, RPF, DPR, LUT, BRS, WPF and LIF.

The VSPD block on RZ/G2L does not have a version register, so added a
new compatible string "renesas,vsp2-rzg2l" with a data pointer containing
the info structure. Also the reset line is shared with the DU module
so devm_reset_control_get_shared() call is used in case of RZ/G2L.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
RFC->v1:
 * Used data pointer containing info structure to retrieve version information
RFC:
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-21-biju.das.jz@bp.renesas.com/
---
 drivers/media/platform/vsp1/vsp1_drv.c  | 32 +++++++++++++++++++------
 drivers/media/platform/vsp1/vsp1_lif.c  |  7 ++++--
 drivers/media/platform/vsp1/vsp1_regs.h |  1 +
 3 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
index 77da6a6732d8..40c6d9290681 100644
--- a/drivers/media/platform/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/vsp1/vsp1_drv.c
@@ -811,6 +811,14 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.uif_count = 2,
 		.wpf_count = 1,
 		.num_bru_inputs = 5,
+	}, {
+		.version = VI6_IP_VERSION_MODEL_VSPD_RZG2L,
+		.model = "VSP2-D",
+		.gen = 3,
+		.features = VSP1_HAS_BRS | VSP1_HAS_WPF_VFLIP | VSP1_HAS_EXT_DL,
+		.lif_count = 1,
+		.rpf_count = 2,
+		.wpf_count = 1,
 	},
 };
 
@@ -841,7 +849,14 @@ static int vsp1_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	vsp1->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	vsp1->info = of_device_get_match_data(&pdev->dev);
+	if (vsp1->info) {
+		vsp1->version = vsp1->info->version;
+		vsp1->rstc = devm_reset_control_get_shared(&pdev->dev, NULL);
+	} else {
+		vsp1->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	}
+
 	if (IS_ERR(vsp1->rstc))
 		return dev_err_probe(&pdev->dev, PTR_ERR(vsp1->rstc),
 				     "failed to get reset ctrl\n");
@@ -874,13 +889,15 @@ static int vsp1_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto done;
 
-	vsp1->version = vsp1_read(vsp1, VI6_IP_VERSION);
+	if (!vsp1->info) {
+		vsp1->version = vsp1_read(vsp1, VI6_IP_VERSION);
 
-	for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
-		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) ==
-		    vsp1_device_infos[i].version) {
-			vsp1->info = &vsp1_device_infos[i];
-			break;
+		for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
+			if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) ==
+			    vsp1_device_infos[i].version) {
+				vsp1->info = &vsp1_device_infos[i];
+				break;
+			}
 		}
 	}
 
@@ -943,6 +960,7 @@ static int vsp1_remove(struct platform_device *pdev)
 static const struct of_device_id vsp1_of_match[] = {
 	{ .compatible = "renesas,vsp1" },
 	{ .compatible = "renesas,vsp2" },
+	{ .compatible = "renesas,vsp2-rzg2l", .data = &vsp1_device_infos[14] },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, vsp1_of_match);
diff --git a/drivers/media/platform/vsp1/vsp1_lif.c b/drivers/media/platform/vsp1/vsp1_lif.c
index 6a6857ac9327..6e997653cfac 100644
--- a/drivers/media/platform/vsp1/vsp1_lif.c
+++ b/drivers/media/platform/vsp1/vsp1_lif.c
@@ -107,6 +107,7 @@ static void lif_configure_stream(struct vsp1_entity *entity,
 
 	case VI6_IP_VERSION_MODEL_VSPDL_GEN3:
 	case VI6_IP_VERSION_MODEL_VSPD_V3:
+	case VI6_IP_VERSION_MODEL_VSPD_RZG2L:
 		hbth = 0;
 		obth = 1500;
 		lbth = 0;
@@ -135,8 +136,10 @@ static void lif_configure_stream(struct vsp1_entity *entity,
 	 * may appear on the output). The value required by the manual is not
 	 * explained but is likely a buffer size or threshold.
 	 */
-	if ((entity->vsp1->version & VI6_IP_VERSION_MASK) ==
-	    (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M))
+	if (((entity->vsp1->version & VI6_IP_VERSION_MASK) ==
+	    (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M)) ||
+	    ((entity->vsp1->version & VI6_IP_VERSION_MASK) ==
+	     VI6_IP_VERSION_MODEL_VSPD_RZG2L))
 		vsp1_lif_write(lif, dlb, VI6_LIF_LBA,
 			       VI6_LIF_LBA_LBA0 |
 			       (1536 << VI6_LIF_LBA_LBA1_SHIFT));
diff --git a/drivers/media/platform/vsp1/vsp1_regs.h b/drivers/media/platform/vsp1/vsp1_regs.h
index fae7286eb01e..12c5b09885dc 100644
--- a/drivers/media/platform/vsp1/vsp1_regs.h
+++ b/drivers/media/platform/vsp1/vsp1_regs.h
@@ -766,6 +766,7 @@
 #define VI6_IP_VERSION_MODEL_VSPD_V3	(0x18 << 8)
 #define VI6_IP_VERSION_MODEL_VSPDL_GEN3	(0x19 << 8)
 #define VI6_IP_VERSION_MODEL_VSPBS_GEN3	(0x1a << 8)
+#define VI6_IP_VERSION_MODEL_VSPD_RZG2L	(0x1b << 8)
 #define VI6_IP_VERSION_MODEL_VSPD_V3U	(0x1c << 8)
 
 #define VI6_IP_VERSION_SOC_MASK		(0xff << 0)
-- 
2.17.1

