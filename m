Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 500474DAF47
	for <lists+linux-media@lfdr.de>; Wed, 16 Mar 2022 12:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355468AbiCPL5X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Mar 2022 07:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355172AbiCPL5V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Mar 2022 07:57:21 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 405DE5EDF8;
        Wed, 16 Mar 2022 04:56:06 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,186,1643641200"; 
   d="scan'208";a="114614169"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 16 Mar 2022 20:56:05 +0900
Received: from localhost.localdomain (unknown [10.226.92.179])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 38C424004BA9;
        Wed, 16 Mar 2022 20:56:03 +0900 (JST)
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
Subject: [PATCH v6 3/3] media: renesas: vsp1: Add support for RZ/G2L VSPD
Date:   Wed, 16 Mar 2022 11:55:51 +0000
Message-Id: <20220316115551.29222-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220316115551.29222-1-biju.das.jz@bp.renesas.com>
References: <20220316115551.29222-1-biju.das.jz@bp.renesas.com>
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
new compatible string "renesas,rzg2l-vsp2" with a data pointer containing
the info structure. Also the reset line is shared with the DU module.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5->v6:
 * Rebased to media_staging and updated commit header
 * Removed the extra tab from rzg2l_vsp2_device_info
 * Changed the function vsp1_lookup->vsp1_lookup_info and
   all info match related code moved here.
 * Add VI6_IP_VERSION_VSP and VI6_IP_VERSION_VSP_SW macros to
   distinguish HW & SW IP_VSP_Version.
 * Used 0x80 for RZG2L VSPD model and SoC identification
 * Updated Switch() for LIF0 buffer attribute handling.
v4->v5:
 * Fixed typo VI6_IP_VERSION_MODEL_MASK->VI6_IP_VERSION_MASK
 * To be consistent with other SoC's, introduced VI6_IP_VERSION_SOC_G2L
   for RZ/G2L SoC's.
v3->v4:
 * Added Rb tag from Geert
 * Add switch() for LIF0 buffer attribute handling for RZ/G2L and V3M
v2->v3:
 * Fixed version comparison in vsp1_lookup()
v1->v2:
 * Changed the compatible from vsp2-rzg2l->rzg2l-vsp2
 * Added standalone device info for rzg2l-vsp2.
 * Added vsp1_lookup helper function.
 * Updated comments for LIF0 buffer attribute register
 * Used last ID for rzg2l-vsp2.
RFC->v1:
 * Used data pointer containing info structure to retrieve version information
RFC:
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-21-biju.das.jz@bp.renesas.com/
---
 .../media/platform/renesas/vsp1/vsp1_drv.c    | 56 ++++++++++++++-----
 .../media/platform/renesas/vsp1/vsp1_lif.c    | 18 ++++--
 .../media/platform/renesas/vsp1/vsp1_regs.h   |  8 +++
 3 files changed, 62 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 159b68fa0829..f1f52c0c1c59 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -812,11 +812,47 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 	},
 };
 
+static const struct vsp1_device_info rzg2l_vsp2_device_info = {
+	.version = VI6_IP_VERSION_MODEL_VSPD_RZG2L,
+	.model = "VSP2-D",
+	.gen = 3,
+	.features = VSP1_HAS_BRS | VSP1_HAS_WPF_VFLIP | VSP1_HAS_EXT_DL,
+	.lif_count = 1,
+	.rpf_count = 2,
+	.wpf_count = 1,
+};
+
+static const struct vsp1_device_info *vsp1_lookup_info(struct vsp1_device *vsp1)
+{
+	const struct vsp1_device_info *info;
+	unsigned int i;
+
+	/*
+	 * Try the info stored in match data first for devices that don't have
+	 * a version register.
+	 */
+	info = of_device_get_match_data(vsp1->dev);
+	if (info)
+		return info;
+
+	vsp1->version = vsp1_read(vsp1, VI6_IP_VERSION);
+
+	for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
+		info = &vsp1_device_infos[i];
+
+		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) == info->version)
+			return info;
+	}
+
+	dev_err(vsp1->dev, "unsupported IP version 0x%08x\n", vsp1->version);
+
+	return NULL;
+}
+
 static int vsp1_probe(struct platform_device *pdev)
 {
 	struct vsp1_device *vsp1;
 	struct device_node *fcp_node;
-	unsigned int i;
 	int ret;
 	int irq;
 
@@ -872,25 +908,16 @@ static int vsp1_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto done;
 
-	vsp1->version = vsp1_read(vsp1, VI6_IP_VERSION);
-
-	for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
-		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) ==
-		    vsp1_device_infos[i].version) {
-			vsp1->info = &vsp1_device_infos[i];
-			break;
-		}
-	}
-
+	vsp1->info = vsp1_lookup_info(vsp1);
 	if (!vsp1->info) {
-		dev_err(&pdev->dev, "unsupported IP version 0x%08x\n",
-			vsp1->version);
 		vsp1_device_put(vsp1);
 		ret = -ENXIO;
 		goto done;
 	}
 
-	dev_dbg(&pdev->dev, "IP version 0x%08x\n", vsp1->version);
+	if ((vsp1->version & VI6_IP_VERSION_VSP_MASK) != VI6_IP_VERSION_VSP)
+		vsp1->version = VI6_IP_VERSION_VSP_SW | vsp1->info->version |
+				VI6_IP_VERSION_SOC_RZG2L;
 
 	/*
 	 * Previous use of the hardware (e.g. by the bootloader) could leave
@@ -941,6 +968,7 @@ static int vsp1_remove(struct platform_device *pdev)
 static const struct of_device_id vsp1_of_match[] = {
 	{ .compatible = "renesas,vsp1" },
 	{ .compatible = "renesas,vsp2" },
+	{ .compatible = "renesas,rzg2l-vsp2", .data = &rzg2l_vsp2_device_info },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, vsp1_of_match);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lif.c b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
index 6a6857ac9327..e36ed2d2b22b 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_lif.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
@@ -107,6 +107,7 @@ static void lif_configure_stream(struct vsp1_entity *entity,
 
 	case VI6_IP_VERSION_MODEL_VSPDL_GEN3:
 	case VI6_IP_VERSION_MODEL_VSPD_V3:
+	case VI6_IP_VERSION_MODEL_VSPD_RZG2L:
 		hbth = 0;
 		obth = 1500;
 		lbth = 0;
@@ -130,16 +131,21 @@ static void lif_configure_stream(struct vsp1_entity *entity,
 			VI6_LIF_CTRL_REQSEL | VI6_LIF_CTRL_LIF_EN);
 
 	/*
-	 * On R-Car V3M the LIF0 buffer attribute register has to be set to a
-	 * non-default value to guarantee proper operation (otherwise artifacts
-	 * may appear on the output). The value required by the manual is not
-	 * explained but is likely a buffer size or threshold.
+	 * On R-Car V3M and RZ/G2L the LIF0 buffer attribute register has to be
+	 * set to a non-default value to guarantee proper operation (otherwise
+	 * artifacts may appear on the output). The value required by the
+	 * manual is not explained but is likely a buffer size or threshold.
 	 */
-	if ((entity->vsp1->version & VI6_IP_VERSION_MASK) ==
-	    (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M))
+	switch (entity->vsp1->version) {
+	case (VI6_IP_VERSION_VSP | VI6_IP_VERSION_MODEL_VSPD_V3 |
+	      VI6_IP_VERSION_SOC_V3M):
+	case (VI6_IP_VERSION_VSP_SW | VI6_IP_VERSION_MODEL_VSPD_RZG2L |
+	      VI6_IP_VERSION_SOC_RZG2L):
 		vsp1_lif_write(lif, dlb, VI6_LIF_LBA,
 			       VI6_LIF_LBA_LBA0 |
 			       (1536 << VI6_LIF_LBA_LBA1_SHIFT));
+		break;
+	}
 }
 
 static const struct vsp1_entity_operations lif_entity_ops = {
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
index fae7286eb01e..e66553c42e50 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
@@ -767,6 +767,8 @@
 #define VI6_IP_VERSION_MODEL_VSPDL_GEN3	(0x19 << 8)
 #define VI6_IP_VERSION_MODEL_VSPBS_GEN3	(0x1a << 8)
 #define VI6_IP_VERSION_MODEL_VSPD_V3U	(0x1c << 8)
+/* RZ/G2L SoC's have no version register, So use 0x80 as the model version */
+#define VI6_IP_VERSION_MODEL_VSPD_RZG2L	(0x80 << 8)
 
 #define VI6_IP_VERSION_SOC_MASK		(0xff << 0)
 #define VI6_IP_VERSION_SOC_H2		(0x01 << 0)
@@ -780,6 +782,12 @@
 #define VI6_IP_VERSION_SOC_M3N		(0x04 << 0)
 #define VI6_IP_VERSION_SOC_E3		(0x04 << 0)
 #define VI6_IP_VERSION_SOC_V3U		(0x05 << 0)
+/* RZ/G2L SoC's have no version register, So use 0x80 for SoC Identification */
+#define VI6_IP_VERSION_SOC_RZG2L	(0x80 << 0)
+
+#define VI6_IP_VERSION_VSP_MASK		(0xffff << 16)
+#define VI6_IP_VERSION_VSP		(0x0101 << 16) /* HW VSP version */
+#define VI6_IP_VERSION_VSP_SW		(0xfffe << 16) /* SW VSP version */
 
 /* -----------------------------------------------------------------------------
  * RPF CLUT Registers
-- 
2.17.1

