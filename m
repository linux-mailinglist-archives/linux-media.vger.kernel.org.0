Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B47C55016B0
	for <lists+linux-media@lfdr.de>; Thu, 14 Apr 2022 17:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231651AbiDNPKI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 11:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353073AbiDNOfC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 10:35:02 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C7DCFDA6EC;
        Thu, 14 Apr 2022 07:26:24 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,259,1643641200"; 
   d="scan'208";a="116894229"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Apr 2022 23:26:24 +0900
Received: from localhost.localdomain (unknown [10.226.92.190])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 31E7842B069C;
        Thu, 14 Apr 2022 23:26:20 +0900 (JST)
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
Subject: [PATCH v7 3/3] media: renesas: vsp1: Add support for RZ/G2L VSPD
Date:   Thu, 14 Apr 2022 15:26:05 +0100
Message-Id: <20220414142605.26235-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414142605.26235-1-biju.das.jz@bp.renesas.com>
References: <20220414142605.26235-1-biju.das.jz@bp.renesas.com>
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

The RZ/G2L VSPD provides a single VSPD instance. It has the following
sub modules MAU, CTU, RPF, DPR, LUT, BRS, WPF and LIF.

The VSPD block on RZ/G2L does not have a version register, so added a
new compatible string "renesas,rzg2l-vsp2" with a data pointer containing
the info structure. Also the reset line is shared with the DU module.

Apart from this, added a quirk to handle LIF0 buffer attribute to fix
the artifacts on the output for both R-Car V3M and RZ/G2L alike SoC's.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
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
 drivers/media/platform/renesas/vsp1/vsp1.h    |  3 +
 .../media/platform/renesas/vsp1/vsp1_drv.c    | 64 ++++++++++++++-----
 .../media/platform/renesas/vsp1/vsp1_lif.c    | 13 ++--
 .../media/platform/renesas/vsp1/vsp1_lif.h    |  1 +
 .../media/platform/renesas/vsp1/vsp1_regs.h   |  7 ++
 5 files changed, 67 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1.h b/drivers/media/platform/renesas/vsp1/vsp1.h
index baf898d577ec..de3685cc89f3 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1.h
@@ -56,6 +56,8 @@ struct vsp1_uif;
 #define VSP1_HAS_BRS		BIT(9)
 #define VSP1_HAS_EXT_DL		BIT(10)
 
+#define LIF_BUF_ATTR_QUIRK	BIT(0)
+
 struct vsp1_device_info {
 	u32 version;
 	const char *model;
@@ -76,6 +78,7 @@ struct vsp1_device {
 	struct device *dev;
 	const struct vsp1_device_info *info;
 	u32 version;
+	u32 quirks;
 
 	void __iomem *mmio;
 	struct rcar_fcp_device *fcp;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 159b68fa0829..206fe18c3c09 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -812,11 +812,57 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
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
+	if (info) {
+		vsp1->quirks = LIF_BUF_ATTR_QUIRK;
+		vsp1->version = VI6_IP_VERSION_VSP_SW | info->version |
+				VI6_IP_VERSION_SOC_RZG2L;
+
+		return info;
+	}
+
+	vsp1->version = vsp1_read(vsp1, VI6_IP_VERSION);
+
+	for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
+		info = &vsp1_device_infos[i];
+
+		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) == info->version) {
+			if ((vsp1->version & VI6_IP_VERSION_MASK) ==
+			    (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M))
+				vsp1->quirks = LIF_BUF_ATTR_QUIRK;
+
+			return info;
+		}
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
 
@@ -872,26 +918,13 @@ static int vsp1_probe(struct platform_device *pdev)
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
-
 	/*
 	 * Previous use of the hardware (e.g. by the bootloader) could leave
 	 * some interrupts enabled and pending.
@@ -941,6 +974,7 @@ static int vsp1_remove(struct platform_device *pdev)
 static const struct of_device_id vsp1_of_match[] = {
 	{ .compatible = "renesas,vsp1" },
 	{ .compatible = "renesas,vsp2" },
+	{ .compatible = "renesas,rzg2l-vsp2", .data = &rzg2l_vsp2_device_info },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, vsp1_of_match);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lif.c b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
index 6a6857ac9327..e041871185d2 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_lif.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
@@ -107,6 +107,7 @@ static void lif_configure_stream(struct vsp1_entity *entity,
 
 	case VI6_IP_VERSION_MODEL_VSPDL_GEN3:
 	case VI6_IP_VERSION_MODEL_VSPD_V3:
+	case VI6_IP_VERSION_MODEL_VSPD_RZG2L:
 		hbth = 0;
 		obth = 1500;
 		lbth = 0;
@@ -130,13 +131,12 @@ static void lif_configure_stream(struct vsp1_entity *entity,
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
+	if (lif->quirks)
 		vsp1_lif_write(lif, dlb, VI6_LIF_LBA,
 			       VI6_LIF_LBA_LBA0 |
 			       (1536 << VI6_LIF_LBA_LBA1_SHIFT));
@@ -162,6 +162,7 @@ struct vsp1_lif *vsp1_lif_create(struct vsp1_device *vsp1, unsigned int index)
 	lif->entity.ops = &lif_entity_ops;
 	lif->entity.type = VSP1_ENTITY_LIF;
 	lif->entity.index = index;
+	lif->quirks = vsp1->quirks & LIF_BUF_ATTR_QUIRK;
 
 	/*
 	 * The LIF is never exposed to userspace, but media entity registration
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lif.h b/drivers/media/platform/renesas/vsp1/vsp1_lif.h
index 71a4eda9c2b2..f073784e429b 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_lif.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_lif.h
@@ -21,6 +21,7 @@ struct vsp1_device;
 
 struct vsp1_lif {
 	struct vsp1_entity entity;
+	u32 quirks;
 };
 
 static inline struct vsp1_lif *to_lif(struct v4l2_subdev *subdev)
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
index fae7286eb01e..41bea15597c9 100644
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
@@ -780,6 +782,11 @@
 #define VI6_IP_VERSION_SOC_M3N		(0x04 << 0)
 #define VI6_IP_VERSION_SOC_E3		(0x04 << 0)
 #define VI6_IP_VERSION_SOC_V3U		(0x05 << 0)
+/* RZ/G2L SoC's have no version register, So use 0x80 for SoC Identification */
+#define VI6_IP_VERSION_SOC_RZG2L	(0x80 << 0)
+
+#define VI6_IP_VERSION_VSP_MASK		(0xffff << 16)
+#define VI6_IP_VERSION_VSP_SW		(0xfffe << 16) /* SW VSP version */
 
 /* -----------------------------------------------------------------------------
  * RPF CLUT Registers
-- 
2.25.1

