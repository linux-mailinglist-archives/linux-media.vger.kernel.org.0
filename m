Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A27D1F8B82
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728122AbgFOAAm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728102AbgFOAAl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:41 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F0DD2146;
        Mon, 15 Jun 2020 02:00:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179222;
        bh=ONZ/7W78WlPbZMJiFFYT/YaIXQcipIg6HAG24iZlBME=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VHR78+uWtxseITIP71Ffh7WWBMjNtU5QlUofRwYe85fc9g/8XLcqXrpIQUmswWCKy
         ffNdwiJZURtpfgyJXkvgEWVf0FhYPQR2MV3uzljPe3mWTO0lWo+On2ntiGO7uGPcyf
         MEL4iIZEm6mBNNmt37XssbBby/l5Pbc5X872hAZ4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 028/107] media: ti-vpe: cal: Remove internal phy structure from cal_camerarx
Date:   Mon, 15 Jun 2020 02:58:25 +0300
Message-Id: <20200614235944.17716-29-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cal_camerarx structure describes the PHY, there's no need for an
internal structure named phy. Removed that level of indirection.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 8864a00a22b0..9b905b61148f 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -324,10 +324,7 @@ struct cal_camerarx {
 	void __iomem		*base;
 	struct resource		*res;
 	struct platform_device	*pdev;
-
-	struct {
-		struct regmap_field *fields[F_MAX_FIELDS];
-	} phy;
+	struct regmap_field	*fields[F_MAX_FIELDS];
 };
 
 struct cal_dev {
@@ -491,12 +488,12 @@ static int cal_camerarx_regmap_init(struct cal_dev *cal,
 		 * Here we update the reg offset with the
 		 * value found in DT
 		 */
-		phy->phy.fields[i] = devm_regmap_field_alloc(&cal->pdev->dev,
-							     cal->syscon_camerrx,
-							     field);
-		if (IS_ERR(phy->phy.fields[i])) {
+		phy->fields[i] = devm_regmap_field_alloc(&cal->pdev->dev,
+							 cal->syscon_camerrx,
+							 field);
+		if (IS_ERR(phy->fields[i])) {
 			cal_err(cal, "Unable to allocate regmap fields\n");
-			return PTR_ERR(phy->phy.fields[i]);
+			return PTR_ERR(phy->fields[i]);
 		}
 	}
 
@@ -543,14 +540,14 @@ static void camerarx_phy_enable(struct cal_ctx *ctx)
 	struct cal_camerarx *phy = ctx->cal->phy[phy_id];
 	u32 max_lanes;
 
-	regmap_field_write(phy->phy.fields[F_CAMMODE], 0);
+	regmap_field_write(phy->fields[F_CAMMODE], 0);
 	/* Always enable all lanes at the phy control level */
 	max_lanes = (1 << cal_data_get_phy_max_lanes(ctx)) - 1;
-	regmap_field_write(phy->phy.fields[F_LANEENABLE], max_lanes);
+	regmap_field_write(phy->fields[F_LANEENABLE], max_lanes);
 	/* F_CSI_MODE is not present on every architecture */
-	if (phy->phy.fields[F_CSI_MODE])
-		regmap_field_write(phy->phy.fields[F_CSI_MODE], 1);
-	regmap_field_write(phy->phy.fields[F_CTRLCLKEN], 1);
+	if (phy->fields[F_CSI_MODE])
+		regmap_field_write(phy->fields[F_CSI_MODE], 1);
+	regmap_field_write(phy->fields[F_CTRLCLKEN], 1);
 }
 
 static void camerarx_phy_disable(struct cal_ctx *ctx)
@@ -558,7 +555,7 @@ static void camerarx_phy_disable(struct cal_ctx *ctx)
 	u32 phy_id = ctx->csi2_port;
 	struct cal_camerarx *phy = ctx->cal->phy[phy_id];
 
-	regmap_field_write(phy->phy.fields[F_CTRLCLKEN], 0);
+	regmap_field_write(phy->fields[F_CTRLCLKEN], 0);
 }
 
 /*
-- 
Regards,

Laurent Pinchart

