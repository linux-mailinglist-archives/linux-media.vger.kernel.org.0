Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C341D215E7F
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729875AbgGFSho (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:37:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729866AbgGFShn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:37:43 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4073F1968;
        Mon,  6 Jul 2020 20:37:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060659;
        bh=VZt6Ecz31PgMhsNVNGsOJ19+J3oeCLWbJB/zMSKqaSU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XPWh4rarx2EBMFzwT+rsgEugUgq0BSbWA2OAa7B67pf1mhgmZlll41RvFREGU19vm
         98hq8MPwsmILpGUtBkR+jLZys6UneTXDku6gNUW+P6C5ajvEkkX7j/37zWuKU3jKdp
         vzMvS1+g5URSisLYPjCNxw9ZL3iZTZe+Ai6utAO8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 016/108] media: ti-vpe: cal: Store PHY regmap fields in struct cc_data
Date:   Mon,  6 Jul 2020 21:35:37 +0300
Message-Id: <20200706183709.12238-17-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The PHY regmap fields are created dynamically at runtime. They don't
belong to the platform data that should be constant. Move them to the
cc_data structure.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 90 +++++++++++++++--------------
 1 file changed, 46 insertions(+), 44 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index ff2afcfdff01..3df97708e044 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -215,13 +215,6 @@ struct cal_dmaqueue {
 	int			ini_jiffies;
 };
 
-struct cc_data {
-	void __iomem		*base;
-	struct resource		*res;
-
-	struct platform_device *pdev;
-};
-
 /* CTRL_CORE_CAMERRX_CONTROL register field id */
 enum cal_camerarx_field {
 	F_CTRLCLKEN,
@@ -232,8 +225,17 @@ enum cal_camerarx_field {
 	F_MAX_FIELDS,
 };
 
+struct cc_data {
+	void __iomem		*base;
+	struct resource		*res;
+	struct platform_device	*pdev;
+
+	struct {
+		struct regmap_field *fields[F_MAX_FIELDS];
+	} phy;
+};
+
 struct cal_csi2_phy {
-	struct regmap_field *fields[F_MAX_FIELDS];
 	struct {
 		unsigned int lsb;
 		unsigned int msb;
@@ -477,37 +479,37 @@ static u32 cal_data_get_num_csi2_phy(struct cal_dev *dev)
 	return dev->data->num_csi2_phy;
 }
 
-static int cal_camerarx_regmap_init(struct cal_dev *dev)
+static int cal_camerarx_regmap_init(struct cal_dev *dev, struct cc_data *cc,
+				    unsigned int idx)
 {
-	struct cal_csi2_phy *phy;
-	unsigned int i, j;
+	const struct cal_csi2_phy *phy;
+	unsigned int i;
 
 	if (!dev->data)
 		return -EINVAL;
 
-	for (i = 0; i < cal_data_get_num_csi2_phy(dev); i++) {
-		phy = &dev->data->csi2_phy_core[i];
-		for (j = 0; j < F_MAX_FIELDS; j++) {
-			struct reg_field field = {
-				.reg = dev->syscon_camerrx_offset,
-				.lsb = phy->base_fields[j].lsb,
-				.msb = phy->base_fields[j].msb,
-			};
+	phy = &dev->data->csi2_phy_core[idx];
 
-			/*
-			 * Here we update the reg offset with the
-			 * value found in DT
-			 */
-			phy->fields[j] =
-				devm_regmap_field_alloc(&dev->pdev->dev,
-							dev->syscon_camerrx,
-							field);
-			if (IS_ERR(phy->fields[j])) {
-				cal_err(dev, "Unable to allocate regmap fields\n");
-				return PTR_ERR(phy->fields[j]);
-			}
+	for (i = 0; i < F_MAX_FIELDS; i++) {
+		struct reg_field field = {
+			.reg = dev->syscon_camerrx_offset,
+			.lsb = phy->base_fields[i].lsb,
+			.msb = phy->base_fields[i].msb,
+		};
+
+		/*
+		 * Here we update the reg offset with the
+		 * value found in DT
+		 */
+		cc->phy.fields[i] = devm_regmap_field_alloc(&dev->pdev->dev,
+							    dev->syscon_camerrx,
+							    field);
+		if (IS_ERR(cc->phy.fields[i])) {
+			cal_err(dev, "Unable to allocate regmap fields\n");
+			return PTR_ERR(cc->phy.fields[i]);
 		}
 	}
+
 	return 0;
 }
 
@@ -554,28 +556,26 @@ static struct regmap *cal_get_camerarx_regmap(struct cal_dev *dev)
  */
 static void camerarx_phy_enable(struct cal_ctx *ctx)
 {
-	struct cal_csi2_phy *phy;
 	u32 phy_id = ctx->csi2_port;
+	struct cc_data *cc = ctx->dev->cc[phy_id];
 	u32 max_lanes;
 
-	phy = &ctx->dev->data->csi2_phy_core[phy_id];
-	regmap_field_write(phy->fields[F_CAMMODE], 0);
+	regmap_field_write(cc->phy.fields[F_CAMMODE], 0);
 	/* Always enable all lanes at the phy control level */
 	max_lanes = (1 << cal_data_get_phy_max_lanes(ctx)) - 1;
-	regmap_field_write(phy->fields[F_LANEENABLE], max_lanes);
+	regmap_field_write(cc->phy.fields[F_LANEENABLE], max_lanes);
 	/* F_CSI_MODE is not present on every architecture */
-	if (phy->fields[F_CSI_MODE])
-		regmap_field_write(phy->fields[F_CSI_MODE], 1);
-	regmap_field_write(phy->fields[F_CTRLCLKEN], 1);
+	if (cc->phy.fields[F_CSI_MODE])
+		regmap_field_write(cc->phy.fields[F_CSI_MODE], 1);
+	regmap_field_write(cc->phy.fields[F_CTRLCLKEN], 1);
 }
 
 static void camerarx_phy_disable(struct cal_ctx *ctx)
 {
-	struct cal_csi2_phy *phy;
 	u32 phy_id = ctx->csi2_port;
+	struct cc_data *cc = ctx->dev->cc[phy_id];
 
-	phy = &ctx->dev->data->csi2_phy_core[phy_id];
-	regmap_field_write(phy->fields[F_CTRLCLKEN], 0);
+	regmap_field_write(cc->phy.fields[F_CTRLCLKEN], 0);
 }
 
 /*
@@ -585,6 +585,7 @@ static struct cc_data *cc_create(struct cal_dev *dev, unsigned int core)
 {
 	struct platform_device *pdev = dev->pdev;
 	struct cc_data *cc;
+	int ret;
 
 	cc = devm_kzalloc(&pdev->dev, sizeof(*cc), GFP_KERNEL);
 	if (!cc)
@@ -604,6 +605,10 @@ static struct cc_data *cc_create(struct cal_dev *dev, unsigned int core)
 	cal_dbg(1, dev, "ioresource %s at %pa - %pa\n",
 		cc->res->name, &cc->res->start, &cc->res->end);
 
+	ret = cal_camerarx_regmap_init(dev, cc, core);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return cc;
 }
 
@@ -2322,9 +2327,6 @@ static int cal_probe(struct platform_device *pdev)
 
 	dev->syscon_camerrx = syscon_camerrx;
 	dev->syscon_camerrx_offset = syscon_camerrx_offset;
-	ret = cal_camerarx_regmap_init(dev);
-	if (ret)
-		return ret;
 
 	dev->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 						"cal_top");
-- 
Regards,

Laurent Pinchart

