Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71A885A3CA9
	for <lists+linux-media@lfdr.de>; Sun, 28 Aug 2022 10:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231923AbiH1IRZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Aug 2022 04:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233603AbiH1IQL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Aug 2022 04:16:11 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 17FF6222B9;
        Sun, 28 Aug 2022 01:16:09 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,270,1654527600"; 
   d="scan'208";a="132818723"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 28 Aug 2022 17:16:09 +0900
Received: from localhost.localdomain (unknown [10.226.92.45])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id F41E441DF0A5;
        Sun, 28 Aug 2022 17:16:05 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v14 5/5] media: renesas: vsp1: Add support for RZ/G2L VSPD
Date:   Sun, 28 Aug 2022 09:16:02 +0100
Message-Id: <20220828081602.30219-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The RZ/G2L VSPD provides a single VSPD instance. It has the following
sub modules MAU, CTU, RPF, DPR, LUT, BRS, WPF and LIF.

The VSPD block on RZ/G2L SoCs does not have a version register, so
added a new compatible string "renesas,r9a07g044-vsp2" with a data
pointer containing the info structure. Also the reset line is shared
with the DU module.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v13->v14:
 * Added Rb tag from Laurent.
v12->v13:
 * No change
v11->v12:
 * No change
v10->v11:
 * No change.
v9->v10:
 * No change.
v8->v9:
 * Replaced the code comments RZ/G2L {SoC's,SoC} with RZ/G2L SoCs.
v7->v8:
 * Split the patch for adding s/w version, feature bit and RZ/G2L support
 * Added feature bit VSP1_HAS_NON_ZERO_LBA to device_info
 * Added .soc for RZ/G2L
 * Replaced the compatible "renesas,rzg2l-vsp2" -> "renesas,r9a07g044-vsp2"
v6->v7:
 * Added Rb tag from Kieran
 * Added a quirk to handle LIF0 buffer attribute related
   changes for V3M and G2L.
 * Removed the macro for VSP HW version
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
 drivers/media/platform/renesas/vsp1/vsp1_drv.c  | 13 +++++++++++++
 drivers/media/platform/renesas/vsp1/vsp1_lif.c  |  9 +++++----
 drivers/media/platform/renesas/vsp1/vsp1_regs.h |  4 ++++
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 8ab5b2b37524..c260d318d298 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -830,6 +830,18 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 	},
 };
 
+static const struct vsp1_device_info rzg2l_vsp2_device_info = {
+	.version = VI6_IP_VERSION_MODEL_VSPD_RZG2L,
+	.model = "VSP2-D",
+	.soc = VI6_IP_VERSION_SOC_RZG2L,
+	.gen = 3,
+	.features = VSP1_HAS_BRS | VSP1_HAS_WPF_VFLIP | VSP1_HAS_EXT_DL
+		  | VSP1_HAS_NON_ZERO_LBA,
+	.lif_count = 1,
+	.rpf_count = 2,
+	.wpf_count = 1,
+};
+
 static const struct vsp1_device_info *vsp1_lookup_info(struct vsp1_device *vsp1)
 {
 	const struct vsp1_device_info *info;
@@ -980,6 +992,7 @@ static int vsp1_remove(struct platform_device *pdev)
 static const struct of_device_id vsp1_of_match[] = {
 	{ .compatible = "renesas,vsp1" },
 	{ .compatible = "renesas,vsp2" },
+	{ .compatible = "renesas,r9a07g044-vsp2", .data = &rzg2l_vsp2_device_info },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, vsp1_of_match);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lif.c b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
index 9adb892edcdc..186a5730e1e3 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_lif.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
@@ -107,6 +107,7 @@ static void lif_configure_stream(struct vsp1_entity *entity,
 
 	case VI6_IP_VERSION_MODEL_VSPDL_GEN3:
 	case VI6_IP_VERSION_MODEL_VSPD_V3:
+	case VI6_IP_VERSION_MODEL_VSPD_RZG2L:
 		hbth = 0;
 		obth = 1500;
 		lbth = 0;
@@ -130,10 +131,10 @@ static void lif_configure_stream(struct vsp1_entity *entity,
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
 	if (vsp1_feature(entity->vsp1, VSP1_HAS_NON_ZERO_LBA))
 		vsp1_lif_write(lif, dlb, VI6_LIF_LBA,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
index 4286d13eca32..8928f4c6bb55 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
@@ -767,6 +767,8 @@
 #define VI6_IP_VERSION_MODEL_VSPDL_GEN3	(0x19 << 8)
 #define VI6_IP_VERSION_MODEL_VSPBS_GEN3	(0x1a << 8)
 #define VI6_IP_VERSION_MODEL_VSPD_V3U	(0x1c << 8)
+/* RZ/G2L SoCs have no version register, So use 0x80 as the model version */
+#define VI6_IP_VERSION_MODEL_VSPD_RZG2L	(0x80 << 8)
 
 #define VI6_IP_VERSION_SOC_MASK		(0xff << 0)
 #define VI6_IP_VERSION_SOC_H2		(0x01 << 0)
@@ -780,6 +782,8 @@
 #define VI6_IP_VERSION_SOC_M3N		(0x04 << 0)
 #define VI6_IP_VERSION_SOC_E3		(0x04 << 0)
 #define VI6_IP_VERSION_SOC_V3U		(0x05 << 0)
+/* RZ/G2L SoCs have no version register, So use 0x80 for SoC Identification */
+#define VI6_IP_VERSION_SOC_RZG2L	(0x80 << 0)
 
 #define VI6_IP_VERSION_VSP_SW		(0xfffe << 16) /* SW VSP version */
 
-- 
2.25.1

