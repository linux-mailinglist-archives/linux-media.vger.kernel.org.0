Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2121F8B8A
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbgFOAAy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:54 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728123AbgFOAAw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:52 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D87952147;
        Mon, 15 Jun 2020 02:00:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179225;
        bh=0zt4f4G4m8nKFLhQJrYTVyvSwuj1E0p0/sj8XFNmZNI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oCv5oRBoUmulJl71kSbiQwy5XaKVzbGHPoZQaS+ZHabat/obuoG7PPNwmPkik6UlI
         wLkCe/xhm8hfg6PWmD1/kq4bZh3Nf7qWlrH+4GTVRQJx9bzL9cu5BvYeFZkrC6DhmQ
         V/kAnGV/hX22LBPigFeeIc7YykbnvBADwKJxLf7M=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 034/107] media: ti-vpe: cal: Group CAMERARX-related functions together
Date:   Mon, 15 Jun 2020 02:58:31 +0300
Message-Id: <20200614235944.17716-35-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Group the CAMERARX functions together to make the overall driver
structure easier to navigate. This only moves functions around, no
functional change is included.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 339 ++++++++++++++--------------
 1 file changed, 169 insertions(+), 170 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 73254ebf8f9b..f995dabbed19 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -467,9 +467,30 @@ static inline void set_field(u32 *valp, u32 field, u32 mask)
 	*valp = val;
 }
 
-static u32 cal_camerarx_max_lanes(struct cal_camerarx *phy)
+static void cal_quickdump_regs(struct cal_dev *cal)
 {
-	return phy->cal->data->camerarx[phy->instance].num_lanes;
+	cal_info(cal, "CAL Registers @ 0x%pa:\n", &cal->res->start);
+	print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 4,
+		       (__force const void *)cal->base,
+		       resource_size(cal->res), false);
+
+	if (cal->ctx[0]) {
+		cal_info(cal, "CSI2 Core 0 Registers @ %pa:\n",
+			 &cal->ctx[0]->phy->res->start);
+		print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 4,
+			       (__force const void *)cal->ctx[0]->phy->base,
+			       resource_size(cal->ctx[0]->phy->res),
+			       false);
+	}
+
+	if (cal->ctx[1]) {
+		cal_info(cal, "CSI2 Core 1 Registers @ %pa:\n",
+			 &cal->ctx[1]->phy->res->start);
+		print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 4,
+			       (__force const void *)cal->ctx[1]->phy->base,
+			       resource_size(cal->ctx[1]->phy->res),
+			       false);
+	}
 }
 
 static u32 cal_data_get_num_csi2_phy(struct cal_dev *cal)
@@ -477,74 +498,16 @@ static u32 cal_data_get_num_csi2_phy(struct cal_dev *cal)
 	return cal->data->num_csi2_phy;
 }
 
-static int cal_camerarx_regmap_init(struct cal_dev *cal,
-				    struct cal_camerarx *phy)
-{
-	const struct cal_camerarx_data *phy_data;
-	unsigned int i;
-
-	if (!cal->data)
-		return -EINVAL;
-
-	phy_data = &cal->data->camerarx[phy->instance];
-
-	for (i = 0; i < F_MAX_FIELDS; i++) {
-		struct reg_field field = {
-			.reg = cal->syscon_camerrx_offset,
-			.lsb = phy_data->fields[i].lsb,
-			.msb = phy_data->fields[i].msb,
-		};
-
-		/*
-		 * Here we update the reg offset with the
-		 * value found in DT
-		 */
-		phy->fields[i] = devm_regmap_field_alloc(&cal->pdev->dev,
-							 cal->syscon_camerrx,
-							 field);
-		if (IS_ERR(phy->fields[i])) {
-			cal_err(cal, "Unable to allocate regmap fields\n");
-			return PTR_ERR(phy->fields[i]);
-		}
-	}
-
-	return 0;
-}
-
-static struct regmap *cal_get_camerarx_regmap(struct cal_dev *cal)
-{
-	struct platform_device *pdev = cal->pdev;
-	struct regmap_config config = { };
-	struct regmap *regmap;
-	void __iomem *base;
-	struct resource *res;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-					   "camerrx_control");
-	base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(base)) {
-		cal_err(cal, "failed to ioremap\n");
-		return ERR_CAST(base);
-	}
-
-	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
-		res->name, &res->start, &res->end);
-
-	config.reg_bits = 32;
-	config.reg_stride = 4;
-	config.val_bits = 32;
-	config.max_register = resource_size(res) - 4;
-
-	regmap = regmap_init_mmio(NULL, base, &config);
-	if (IS_ERR(regmap))
-		pr_err("regmap init failed\n");
-
-	return regmap;
-}
-
-/*
- * Control Module CAMERARX block access
+/* ------------------------------------------------------------------
+ *	CAMERARX Management
+ * ------------------------------------------------------------------
  */
+
+static u32 cal_camerarx_max_lanes(struct cal_camerarx *phy)
+{
+	return phy->cal->data->camerarx[phy->instance].num_lanes;
+}
+
 static void cal_camerarx_enable(struct cal_camerarx *phy)
 {
 	u32 max_lanes;
@@ -564,61 +527,6 @@ static void cal_camerarx_disable(struct cal_camerarx *phy)
 	regmap_field_write(phy->fields[F_CTRLCLKEN], 0);
 }
 
-/*
- * Camera Instance access block
- */
-static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
-						unsigned int instance)
-{
-	struct platform_device *pdev = cal->pdev;
-	struct cal_camerarx *phy;
-	int ret;
-
-	phy = devm_kzalloc(&pdev->dev, sizeof(*phy), GFP_KERNEL);
-	if (!phy)
-		return ERR_PTR(-ENOMEM);
-
-	phy->cal = cal;
-	phy->instance = instance;
-	phy->external_rate = 192000000;
-
-	phy->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						(instance == 0) ?
-						"cal_rx_core0" :
-						"cal_rx_core1");
-	phy->base = devm_ioremap_resource(&pdev->dev, phy->res);
-	if (IS_ERR(phy->base)) {
-		cal_err(cal, "failed to ioremap\n");
-		return ERR_CAST(phy->base);
-	}
-
-	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
-		phy->res->name, &phy->res->start, &phy->res->end);
-
-	ret = cal_camerarx_regmap_init(cal, phy);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return phy;
-}
-
-/*
- * Get Revision and HW info
- */
-static void cal_get_hwinfo(struct cal_dev *cal)
-{
-	u32 revision;
-	u32 hwinfo;
-
-	revision = reg_read(cal, CAL_HL_REVISION);
-	cal_dbg(3, cal, "CAL_HL_REVISION = 0x%08x (expecting 0x40000200)\n",
-		revision);
-
-	hwinfo = reg_read(cal, CAL_HL_HWINFO);
-	cal_dbg(3, cal, "CAL_HL_HWINFO = 0x%08x (expecting 0xA3C90469)\n",
-		hwinfo);
-}
-
 /*
  *   Errata i913: CSI2 LDO Needs to be disabled when module is powered on
  *
@@ -648,32 +556,6 @@ static void cal_camerarx_i913_errata(struct cal_camerarx *phy)
 	reg_write(phy, CAL_CSI2_PHY_REG10, reg10);
 }
 
-static void cal_quickdump_regs(struct cal_dev *cal)
-{
-	cal_info(cal, "CAL Registers @ 0x%pa:\n", &cal->res->start);
-	print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 4,
-		       (__force const void *)cal->base,
-		       resource_size(cal->res), false);
-
-	if (cal->ctx[0]) {
-		cal_info(cal, "CSI2 Core 0 Registers @ %pa:\n",
-			 &cal->ctx[0]->phy->res->start);
-		print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 4,
-			       (__force const void *)cal->ctx[0]->phy->base,
-			       resource_size(cal->ctx[0]->phy->res),
-			       false);
-	}
-
-	if (cal->ctx[1]) {
-		cal_info(cal, "CSI2 Core 1 Registers @ %pa:\n",
-			 &cal->ctx[1]->phy->res->start);
-		print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 4,
-			       (__force const void *)cal->ctx[1]->phy->base,
-			       resource_size(cal->ctx[1]->phy->res),
-			       false);
-	}
-}
-
 /*
  * Enable the expected IRQ sources
  */
@@ -1009,6 +891,126 @@ static void cal_camerarx_ppi_disable(struct cal_camerarx *phy)
 			0, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
 }
 
+static int cal_camerarx_get_external_info(struct cal_camerarx *phy)
+{
+	struct v4l2_ctrl *ctrl;
+
+	if (!phy->sensor)
+		return -ENODEV;
+
+	ctrl = v4l2_ctrl_find(phy->sensor->ctrl_handler, V4L2_CID_PIXEL_RATE);
+	if (!ctrl) {
+		phy_err(phy, "no pixel rate control in subdev: %s\n",
+			phy->sensor->name);
+		return -EPIPE;
+	}
+
+	phy->external_rate = v4l2_ctrl_g_ctrl_int64(ctrl);
+	phy_dbg(3, phy, "sensor Pixel Rate: %u\n", phy->external_rate);
+
+	return 0;
+}
+
+static int cal_camerarx_regmap_init(struct cal_dev *cal,
+				    struct cal_camerarx *phy)
+{
+	const struct cal_camerarx_data *phy_data;
+	unsigned int i;
+
+	if (!cal->data)
+		return -EINVAL;
+
+	phy_data = &cal->data->camerarx[phy->instance];
+
+	for (i = 0; i < F_MAX_FIELDS; i++) {
+		struct reg_field field = {
+			.reg = cal->syscon_camerrx_offset,
+			.lsb = phy_data->fields[i].lsb,
+			.msb = phy_data->fields[i].msb,
+		};
+
+		/*
+		 * Here we update the reg offset with the
+		 * value found in DT
+		 */
+		phy->fields[i] = devm_regmap_field_alloc(&cal->pdev->dev,
+							 cal->syscon_camerrx,
+							 field);
+		if (IS_ERR(phy->fields[i])) {
+			cal_err(cal, "Unable to allocate regmap fields\n");
+			return PTR_ERR(phy->fields[i]);
+		}
+	}
+
+	return 0;
+}
+
+static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
+						unsigned int instance)
+{
+	struct platform_device *pdev = cal->pdev;
+	struct cal_camerarx *phy;
+	int ret;
+
+	phy = devm_kzalloc(&pdev->dev, sizeof(*phy), GFP_KERNEL);
+	if (!phy)
+		return ERR_PTR(-ENOMEM);
+
+	phy->cal = cal;
+	phy->instance = instance;
+	phy->external_rate = 192000000;
+
+	phy->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+						(instance == 0) ?
+						"cal_rx_core0" :
+						"cal_rx_core1");
+	phy->base = devm_ioremap_resource(&pdev->dev, phy->res);
+	if (IS_ERR(phy->base)) {
+		cal_err(cal, "failed to ioremap\n");
+		return ERR_CAST(phy->base);
+	}
+
+	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
+		phy->res->name, &phy->res->start, &phy->res->end);
+
+	ret = cal_camerarx_regmap_init(cal, phy);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return phy;
+}
+
+static struct regmap *cal_get_camerarx_regmap(struct cal_dev *cal)
+{
+	struct platform_device *pdev = cal->pdev;
+	struct regmap_config config = { };
+	struct regmap *regmap;
+	void __iomem *base;
+	struct resource *res;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+					   "camerrx_control");
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base)) {
+		cal_err(cal, "failed to ioremap\n");
+		return ERR_CAST(base);
+	}
+
+	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
+		res->name, &res->start, &res->end);
+
+	config.reg_bits = 32;
+	config.reg_stride = 4;
+	config.val_bits = 32;
+	config.max_register = resource_size(res) - 4;
+
+	regmap = regmap_init_mmio(NULL, base, &config);
+	if (IS_ERR(regmap))
+		pr_err("regmap init failed\n");
+
+	return regmap;
+}
+
 static void csi2_ctx_config(struct cal_ctx *ctx)
 {
 	u32 val;
@@ -1145,26 +1147,6 @@ static void cal_wr_dma_addr(struct cal_ctx *ctx, unsigned int dmaaddr)
 	reg_write(ctx->cal, CAL_WR_DMA_ADDR(ctx->csi2_port), dmaaddr);
 }
 
-static int cal_camerarx_get_external_info(struct cal_camerarx *phy)
-{
-	struct v4l2_ctrl *ctrl;
-
-	if (!phy->sensor)
-		return -ENODEV;
-
-	ctrl = v4l2_ctrl_find(phy->sensor->ctrl_handler, V4L2_CID_PIXEL_RATE);
-	if (!ctrl) {
-		phy_err(phy, "no pixel rate control in subdev: %s\n",
-			phy->sensor->name);
-		return -EPIPE;
-	}
-
-	phy->external_rate = v4l2_ctrl_g_ctrl_int64(ctrl);
-	phy_dbg(3, phy, "sensor Pixel Rate: %u\n", phy->external_rate);
-
-	return 0;
-}
-
 static inline void cal_schedule_next_buffer(struct cal_ctx *ctx)
 {
 	struct cal_dmaqueue *dma_q = &ctx->vidq;
@@ -2238,6 +2220,23 @@ static const struct of_device_id cal_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, cal_of_match);
 
+/*
+ * Get Revision and HW info
+ */
+static void cal_get_hwinfo(struct cal_dev *cal)
+{
+	u32 revision;
+	u32 hwinfo;
+
+	revision = reg_read(cal, CAL_HL_REVISION);
+	cal_dbg(3, cal, "CAL_HL_REVISION = 0x%08x (expecting 0x40000200)\n",
+		revision);
+
+	hwinfo = reg_read(cal, CAL_HL_HWINFO);
+	cal_dbg(3, cal, "CAL_HL_HWINFO = 0x%08x (expecting 0xA3C90469)\n",
+		hwinfo);
+}
+
 static int cal_probe(struct platform_device *pdev)
 {
 	struct cal_dev *cal;
-- 
Regards,

Laurent Pinchart

