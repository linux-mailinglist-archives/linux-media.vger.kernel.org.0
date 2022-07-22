Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBC6757E4C8
	for <lists+linux-media@lfdr.de>; Fri, 22 Jul 2022 18:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235919AbiGVQtu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jul 2022 12:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235935AbiGVQth (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jul 2022 12:49:37 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5EE639B570;
        Fri, 22 Jul 2022 09:49:33 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,186,1654527600"; 
   d="scan'208";a="127050403"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Jul 2022 01:49:30 +0900
Received: from localhost.localdomain (unknown [10.226.92.254])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0A06240A2707;
        Sat, 23 Jul 2022 01:49:26 +0900 (JST)
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
Subject: [PATCH v12 4/5] media: renesas: vsp1: Add VSP1_HAS_NON_ZERO_LBA feature bit
Date:   Fri, 22 Jul 2022 17:49:06 +0100
Message-Id: <20220722164907.16587-5-biju.das.jz@bp.renesas.com>
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

As per HW manual V3M and RZ/G2L SoCs has nonzero LIF buffer
attributes. So, introduce a feature bit for handling the same.

This patch also adds separate device info structure for V3M and V3H
SoCs, as both these SoCs share the same model ID, but V3H does not
have VSP1_HAS_NON_ZERO_LBA feature bit.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v11->v12:
 * No change
v10->v11:
 * No change
v9->v10:
 * No change
v8->v9:
 * Used generic check for matching SoCs with LBA feature.
v8:
 * New patch
---
 drivers/media/platform/renesas/vsp1/vsp1.h     |  1 +
 drivers/media/platform/renesas/vsp1/vsp1_drv.c | 18 +++++++++++++++++-
 drivers/media/platform/renesas/vsp1/vsp1_lif.c |  3 +--
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1.h b/drivers/media/platform/renesas/vsp1/vsp1.h
index ff4435705abb..2f6f0c6ae555 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1.h
+++ b/drivers/media/platform/renesas/vsp1/vsp1.h
@@ -55,6 +55,7 @@ struct vsp1_uif;
 #define VSP1_HAS_HGT		BIT(8)
 #define VSP1_HAS_BRS		BIT(9)
 #define VSP1_HAS_EXT_DL		BIT(10)
+#define VSP1_HAS_NON_ZERO_LBA	BIT(11)
 
 struct vsp1_device_info {
 	u32 version;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
index 9558586e9d73..bc0ce5614841 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
@@ -788,6 +788,7 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 	}, {
 		.version = VI6_IP_VERSION_MODEL_VSPD_V3,
 		.model = "VSP2-D",
+		.soc = VI6_IP_VERSION_SOC_V3H,
 		.gen = 3,
 		.features = VSP1_HAS_BRS | VSP1_HAS_BRU,
 		.lif_count = 1,
@@ -795,6 +796,17 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
 		.uif_count = 1,
 		.wpf_count = 1,
 		.num_bru_inputs = 5,
+	}, {
+		.version = VI6_IP_VERSION_MODEL_VSPD_V3,
+		.model = "VSP2-D",
+		.soc = VI6_IP_VERSION_SOC_V3M,
+		.gen = 3,
+		.features = VSP1_HAS_BRS | VSP1_HAS_BRU | VSP1_HAS_NON_ZERO_LBA,
+		.lif_count = 1,
+		.rpf_count = 5,
+		.uif_count = 1,
+		.wpf_count = 1,
+		.num_bru_inputs = 5,
 	}, {
 		.version = VI6_IP_VERSION_MODEL_VSPDL_GEN3,
 		.model = "VSP2-DL",
@@ -838,8 +850,12 @@ static const struct vsp1_device_info *vsp1_lookup_info(struct vsp1_device *vsp1)
 	for (i = 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
 		info = &vsp1_device_infos[i];
 
-		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) == info->version)
+		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) == info->version) {
+			if (info->soc &&
+			    ((vsp1->version & VI6_IP_VERSION_SOC_MASK) != info->soc))
+				continue;
 			return info;
+		}
 	}
 
 	dev_err(vsp1->dev, "unsupported IP version 0x%08x\n", vsp1->version);
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_lif.c b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
index 6a6857ac9327..9adb892edcdc 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_lif.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
@@ -135,8 +135,7 @@ static void lif_configure_stream(struct vsp1_entity *entity,
 	 * may appear on the output). The value required by the manual is not
 	 * explained but is likely a buffer size or threshold.
 	 */
-	if ((entity->vsp1->version & VI6_IP_VERSION_MASK) ==
-	    (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M))
+	if (vsp1_feature(entity->vsp1, VSP1_HAS_NON_ZERO_LBA))
 		vsp1_lif_write(lif, dlb, VI6_LIF_LBA,
 			       VI6_LIF_LBA_LBA0 |
 			       (1536 << VI6_LIF_LBA_LBA1_SHIFT));
-- 
2.25.1

