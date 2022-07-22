Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2CD957E4C5
	for <lists+linux-media@lfdr.de>; Fri, 22 Jul 2022 18:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235987AbiGVQto (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jul 2022 12:49:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235899AbiGVQte (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jul 2022 12:49:34 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0ABB29C252;
        Fri, 22 Jul 2022 09:49:26 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,186,1654527600"; 
   d="scan'208";a="128803943"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Jul 2022 01:49:26 +0900
Received: from localhost.localdomain (unknown [10.226.92.254])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3DD2840A2707;
        Sat, 23 Jul 2022 01:49:22 +0900 (JST)
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
Subject: [PATCH v12 3/5] media: renesas: vsp1: Add support for VSP software version
Date:   Fri, 22 Jul 2022 17:49:05 +0100
Message-Id: <20220722164907.16587-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220722164907.16587-1-biju.das.jz@bp.renesas.com>
References: <20220722164907.16587-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The VSPD block on RZ/G2L SoCs does not have a version register.

This patch adds support for adding VSP software version based on
device match.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v11->v12:
 * No change
v10->v11:
 * No change
v9->v10:
 * No change
v8->v9:
 * Added Rb tag from Geert
 * Updated commit description RZ/G2L -> RZ/G2L SoCs.
 * Replaced break with return info in case a Model match is found and
   removed additional check for non-match case.
v8:
 * New patch
---
 drivers/media/platform/renesas/vsp1/vsp1.h    |  1 +
 .../media/platform/renesas/vsp1/vsp1_drv.c    | 43 +++++++++++++------
 .../media/platform/renesas/vsp1/vsp1_regs.h   |  2 +
 3 files changed, 33 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1.h b/drivers/media/platform/renesas/vsp1/vsp1.h
index baf898d577ec..ff4435705abb 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1.h
@@ -67,6 +67,7 @@ struct vsp1_device_info {
 	unsigned int uif_count;
 	unsigned int wpf_count;
 	unsigned int num_bru_inputs;
+	u8 soc;
 	bool uapi;
 };
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 89cb8080e13e..9558586e9d73 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -818,11 +818,39 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 	},
 };
 
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
+		vsp1->version = VI6_IP_VERSION_VSP_SW | info->version | info->soc;
+		return info;
+	}
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
 
@@ -878,19 +906,8 @@ static int vsp1_probe(struct platform_device *pdev)
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
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
index fae7286eb01e..4286d13eca32 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
@@ -781,6 +781,8 @@
 #define VI6_IP_VERSION_SOC_E3		(0x04 << 0)
 #define VI6_IP_VERSION_SOC_V3U		(0x05 << 0)
 
+#define VI6_IP_VERSION_VSP_SW		(0xfffe << 16) /* SW VSP version */
+
 /* -----------------------------------------------------------------------------
  * RPF CLUT Registers
  */
-- 
2.25.1

