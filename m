Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA08215E8C
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729905AbgGFSh4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:37:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729788AbgGFShz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:37:55 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 26CF92123;
        Mon,  6 Jul 2020 20:37:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060665;
        bh=KxsaeZDE4u3Tlf3ta0vsD33G0oyei6M0sZnwRDYz9v8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=immJOa4O7z1r9U5UZ4eAebMDUO5fOwHmoRt/gH/JNqSKO+IuTiHZWTfFbcwnDYIjw
         tKgXRPxSMxlr3cmAVuBe2tmKXhM7ImLiv/TSdzRfVofy7MIWCQP/ZD97iBDJCiz3EV
         yGGcNspLqv1gRYVmDTxUkJRqKxZWIkSazxXcER0A=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 026/108] media: ti-vpe: cal: Name all cal_dev pointers consistently
Date:   Mon,  6 Jul 2020 21:35:47 +0300
Message-Id: <20200706183709.12238-27-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Name all variables pointing to a cal_dev instance 'cal', instead of a
combination of 'caldev' and 'dev'. 'caldev' is only used in a few places
and could have been renamed to 'dev', but 'dev' is confusing as it's
also used for struct device instances. This generates lots of changes,
but increases readability.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 368 ++++++++++++++--------------
 1 file changed, 186 insertions(+), 182 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index faf18980656e..f0e06a4699fc 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -53,12 +53,12 @@ static unsigned debug;
 module_param(debug, uint, 0644);
 MODULE_PARM_DESC(debug, "activates debug info");
 
-#define cal_dbg(level, caldev, fmt, arg...)	\
-		v4l2_dbg(level, debug, &caldev->v4l2_dev, fmt, ##arg)
-#define cal_info(caldev, fmt, arg...)	\
-		v4l2_info(&caldev->v4l2_dev, fmt, ##arg)
-#define cal_err(caldev, fmt, arg...)	\
-		v4l2_err(&caldev->v4l2_dev, fmt, ##arg)
+#define cal_dbg(level, cal, fmt, arg...)	\
+		v4l2_dbg(level, debug, &cal->v4l2_dev, fmt, ##arg)
+#define cal_info(cal, fmt, arg...)	\
+		v4l2_info(&cal->v4l2_dev, fmt, ##arg)
+#define cal_err(cal, fmt, arg...)	\
+		v4l2_err(&cal->v4l2_dev, fmt, ##arg)
 
 #define ctx_dbg(level, ctx, fmt, arg...)	\
 		v4l2_dbg(level, debug, &ctx->v4l2_dev, fmt, ##arg)
@@ -309,9 +309,14 @@ static const struct cal_data am654_cal_data = {
  * DMA contexts.
  *
  * The cal_dev structure represents the whole subsystem, including the CAL and
- * the CAMERARX instances. The cal_camerarx structure represents one CAMERARX
- * instance. The cal_ctx structure represents the combination of one CSI-2
- * context, one processing context and one DMA context.
+ * the CAMERARX instances. Instances of struct cal_dev are named cal through the
+ * driver.
+ *
+ * The cal_camerarx structure represents one CAMERARX instance.
+ *
+ * The cal_ctx structure represents the combination of one CSI-2 context, one
+ * processing context and one DMA context. Instance of struct cal_ctx are named
+ * ctx through the driver.
  */
 
 struct cal_camerarx {
@@ -355,7 +360,7 @@ struct cal_ctx {
 	struct v4l2_subdev	*sensor;
 	struct v4l2_fwnode_endpoint	endpoint;
 
-	struct cal_dev		*dev;
+	struct cal_dev		*cal;
 	struct cal_camerarx	*cc;
 
 	/* v4l2_ioctl mutex */
@@ -391,19 +396,19 @@ struct cal_ctx {
 	bool dma_act;
 };
 
-static inline u32 reg_read_field(struct cal_dev *dev, u32 offset, u32 mask)
+static inline u32 reg_read_field(struct cal_dev *cal, u32 offset, u32 mask)
 {
-	return FIELD_GET(mask, reg_read(dev, offset));
+	return FIELD_GET(mask, reg_read(cal, offset));
 }
 
-static inline void reg_write_field(struct cal_dev *dev, u32 offset, u32 value,
+static inline void reg_write_field(struct cal_dev *cal, u32 offset, u32 value,
 				   u32 mask)
 {
-	u32 val = reg_read(dev, offset);
+	u32 val = reg_read(cal, offset);
 
 	val &= ~mask;
 	val |= FIELD_PREP(mask, value);
-	reg_write(dev, offset, val);
+	reg_write(cal, offset, val);
 }
 
 static const struct cal_fmt *find_format_by_pix(struct cal_ctx *ctx,
@@ -452,32 +457,31 @@ static inline void set_field(u32 *valp, u32 field, u32 mask)
 
 static u32 cal_data_get_phy_max_lanes(struct cal_ctx *ctx)
 {
-	struct cal_dev *dev = ctx->dev;
 	u32 phy_id = ctx->csi2_port;
 
-	return dev->data->camerarx[phy_id].num_lanes;
+	return ctx->cal->data->camerarx[phy_id].num_lanes;
 }
 
-static u32 cal_data_get_num_csi2_phy(struct cal_dev *dev)
+static u32 cal_data_get_num_csi2_phy(struct cal_dev *cal)
 {
-	return dev->data->num_csi2_phy;
+	return cal->data->num_csi2_phy;
 }
 
-static int cal_camerarx_regmap_init(struct cal_dev *dev,
+static int cal_camerarx_regmap_init(struct cal_dev *cal,
 				    struct cal_camerarx *cc,
 				    unsigned int idx)
 {
 	const struct cal_camerarx_data *phy_data;
 	unsigned int i;
 
-	if (!dev->data)
+	if (!cal->data)
 		return -EINVAL;
 
-	phy_data = &dev->data->camerarx[idx];
+	phy_data = &cal->data->camerarx[idx];
 
 	for (i = 0; i < F_MAX_FIELDS; i++) {
 		struct reg_field field = {
-			.reg = dev->syscon_camerrx_offset,
+			.reg = cal->syscon_camerrx_offset,
 			.lsb = phy_data->fields[i].lsb,
 			.msb = phy_data->fields[i].msb,
 		};
@@ -486,11 +490,11 @@ static int cal_camerarx_regmap_init(struct cal_dev *dev,
 		 * Here we update the reg offset with the
 		 * value found in DT
 		 */
-		cc->phy.fields[i] = devm_regmap_field_alloc(&dev->pdev->dev,
-							    dev->syscon_camerrx,
+		cc->phy.fields[i] = devm_regmap_field_alloc(&cal->pdev->dev,
+							    cal->syscon_camerrx,
 							    field);
 		if (IS_ERR(cc->phy.fields[i])) {
-			cal_err(dev, "Unable to allocate regmap fields\n");
+			cal_err(cal, "Unable to allocate regmap fields\n");
 			return PTR_ERR(cc->phy.fields[i]);
 		}
 	}
@@ -498,9 +502,9 @@ static int cal_camerarx_regmap_init(struct cal_dev *dev,
 	return 0;
 }
 
-static struct regmap *cal_get_camerarx_regmap(struct cal_dev *dev)
+static struct regmap *cal_get_camerarx_regmap(struct cal_dev *cal)
 {
-	struct platform_device *pdev = dev->pdev;
+	struct platform_device *pdev = cal->pdev;
 	struct regmap_config config = { };
 	struct regmap *regmap;
 	void __iomem *base;
@@ -510,11 +514,11 @@ static struct regmap *cal_get_camerarx_regmap(struct cal_dev *dev)
 					   "camerrx_control");
 	base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(base)) {
-		cal_err(dev, "failed to ioremap\n");
+		cal_err(cal, "failed to ioremap\n");
 		return ERR_CAST(base);
 	}
 
-	cal_dbg(1, dev, "ioresource %s at %pa - %pa\n",
+	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
 		res->name, &res->start, &res->end);
 
 	config.reg_bits = 32;
@@ -535,7 +539,7 @@ static struct regmap *cal_get_camerarx_regmap(struct cal_dev *dev)
 static void camerarx_phy_enable(struct cal_ctx *ctx)
 {
 	u32 phy_id = ctx->csi2_port;
-	struct cal_camerarx *cc = ctx->dev->cc[phy_id];
+	struct cal_camerarx *cc = ctx->cal->cc[phy_id];
 	u32 max_lanes;
 
 	regmap_field_write(cc->phy.fields[F_CAMMODE], 0);
@@ -551,7 +555,7 @@ static void camerarx_phy_enable(struct cal_ctx *ctx)
 static void camerarx_phy_disable(struct cal_ctx *ctx)
 {
 	u32 phy_id = ctx->csi2_port;
-	struct cal_camerarx *cc = ctx->dev->cc[phy_id];
+	struct cal_camerarx *cc = ctx->cal->cc[phy_id];
 
 	regmap_field_write(cc->phy.fields[F_CTRLCLKEN], 0);
 }
@@ -559,9 +563,9 @@ static void camerarx_phy_disable(struct cal_ctx *ctx)
 /*
  * Camera Instance access block
  */
-static struct cal_camerarx *cc_create(struct cal_dev *dev, unsigned int core)
+static struct cal_camerarx *cc_create(struct cal_dev *cal, unsigned int core)
 {
-	struct platform_device *pdev = dev->pdev;
+	struct platform_device *pdev = cal->pdev;
 	struct cal_camerarx *cc;
 	int ret;
 
@@ -576,14 +580,14 @@ static struct cal_camerarx *cc_create(struct cal_dev *dev, unsigned int core)
 						"cal_rx_core1");
 	cc->base = devm_ioremap_resource(&pdev->dev, cc->res);
 	if (IS_ERR(cc->base)) {
-		cal_err(dev, "failed to ioremap\n");
+		cal_err(cal, "failed to ioremap\n");
 		return ERR_CAST(cc->base);
 	}
 
-	cal_dbg(1, dev, "ioresource %s at %pa - %pa\n",
+	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
 		cc->res->name, &cc->res->start, &cc->res->end);
 
-	ret = cal_camerarx_regmap_init(dev, cc, core);
+	ret = cal_camerarx_regmap_init(cal, cc, core);
 	if (ret)
 		return ERR_PTR(ret);
 
@@ -593,17 +597,17 @@ static struct cal_camerarx *cc_create(struct cal_dev *dev, unsigned int core)
 /*
  * Get Revision and HW info
  */
-static void cal_get_hwinfo(struct cal_dev *dev)
+static void cal_get_hwinfo(struct cal_dev *cal)
 {
 	u32 revision;
 	u32 hwinfo;
 
-	revision = reg_read(dev, CAL_HL_REVISION);
-	cal_dbg(3, dev, "CAL_HL_REVISION = 0x%08x (expecting 0x40000200)\n",
+	revision = reg_read(cal, CAL_HL_REVISION);
+	cal_dbg(3, cal, "CAL_HL_REVISION = 0x%08x (expecting 0x40000200)\n",
 		revision);
 
-	hwinfo = reg_read(dev, CAL_HL_HWINFO);
-	cal_dbg(3, dev, "CAL_HL_HWINFO = 0x%08x (expecting 0xA3C90469)\n",
+	hwinfo = reg_read(cal, CAL_HL_HWINFO);
+	cal_dbg(3, cal, "CAL_HL_HWINFO = 0x%08x (expecting 0xA3C90469)\n",
 		hwinfo);
 }
 
@@ -626,38 +630,38 @@ static void cal_get_hwinfo(struct cal_dev *dev)
  *		Core 0:  0x4845 B828 = 0x0000 0040
  *		Core 1:  0x4845 B928 = 0x0000 0040
  */
-static void i913_errata(struct cal_dev *dev, unsigned int port)
+static void i913_errata(struct cal_dev *cal, unsigned int port)
 {
-	u32 reg10 = reg_read(dev->cc[port], CAL_CSI2_PHY_REG10);
+	u32 reg10 = reg_read(cal->cc[port], CAL_CSI2_PHY_REG10);
 
 	set_field(&reg10, 1, CAL_CSI2_PHY_REG10_I933_LDO_DISABLE_MASK);
 
-	cal_dbg(1, dev, "CSI2_%d_REG10 = 0x%08x\n", port, reg10);
-	reg_write(dev->cc[port], CAL_CSI2_PHY_REG10, reg10);
+	cal_dbg(1, cal, "CSI2_%d_REG10 = 0x%08x\n", port, reg10);
+	reg_write(cal->cc[port], CAL_CSI2_PHY_REG10, reg10);
 }
 
-static void cal_quickdump_regs(struct cal_dev *dev)
+static void cal_quickdump_regs(struct cal_dev *cal)
 {
-	cal_info(dev, "CAL Registers @ 0x%pa:\n", &dev->res->start);
+	cal_info(cal, "CAL Registers @ 0x%pa:\n", &cal->res->start);
 	print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 4,
-		       (__force const void *)dev->base,
-		       resource_size(dev->res), false);
+		       (__force const void *)cal->base,
+		       resource_size(cal->res), false);
 
-	if (dev->ctx[0]) {
-		cal_info(dev, "CSI2 Core 0 Registers @ %pa:\n",
-			 &dev->ctx[0]->cc->res->start);
+	if (cal->ctx[0]) {
+		cal_info(cal, "CSI2 Core 0 Registers @ %pa:\n",
+			 &cal->ctx[0]->cc->res->start);
 		print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 4,
-			       (__force const void *)dev->ctx[0]->cc->base,
-			       resource_size(dev->ctx[0]->cc->res),
+			       (__force const void *)cal->ctx[0]->cc->base,
+			       resource_size(cal->ctx[0]->cc->res),
 			       false);
 	}
 
-	if (dev->ctx[1]) {
-		cal_info(dev, "CSI2 Core 1 Registers @ %pa:\n",
-			 &dev->ctx[1]->cc->res->start);
+	if (cal->ctx[1]) {
+		cal_info(cal, "CSI2 Core 1 Registers @ %pa:\n",
+			 &cal->ctx[1]->cc->res->start);
 		print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 4,
-			       (__force const void *)dev->ctx[1]->cc->base,
-			       resource_size(dev->ctx[1]->cc->res),
+			       (__force const void *)cal->ctx[1]->cc->base,
+			       resource_size(cal->ctx[1]->cc->res),
 			       false);
 	}
 }
@@ -676,24 +680,24 @@ static void enable_irqs(struct cal_ctx *ctx)
 		CAL_CSI2_COMPLEXIO_IRQ_ECC_NO_CORRECTION_MASK;
 
 	/* Enable CIO error irqs */
-	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(0),
+	reg_write(ctx->cal, CAL_HL_IRQENABLE_SET(0),
 		  CAL_HL_IRQ_CIO_MASK(ctx->csi2_port));
-	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_IRQENABLE(ctx->csi2_port),
+	reg_write(ctx->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(ctx->csi2_port),
 		  cio_err_mask);
 
 	/* Always enable OCPO error */
-	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(0), CAL_HL_IRQ_OCPO_ERR_MASK);
+	reg_write(ctx->cal, CAL_HL_IRQENABLE_SET(0), CAL_HL_IRQ_OCPO_ERR_MASK);
 
 	/* Enable IRQ_WDMA_END 0/1 */
 	val = 0;
 	set_field(&val, 1, CAL_HL_IRQ_MASK(ctx->csi2_port));
-	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(1), val);
+	reg_write(ctx->cal, CAL_HL_IRQENABLE_SET(1), val);
 	/* Enable IRQ_WDMA_START 0/1 */
 	val = 0;
 	set_field(&val, 1, CAL_HL_IRQ_MASK(ctx->csi2_port));
-	reg_write(ctx->dev, CAL_HL_IRQENABLE_SET(2), val);
+	reg_write(ctx->cal, CAL_HL_IRQENABLE_SET(2), val);
 	/* Todo: Add VC_IRQ and CSI2_COMPLEXIO_IRQ handling */
-	reg_write(ctx->dev, CAL_CSI2_VC_IRQENABLE(0), 0xFF000000);
+	reg_write(ctx->cal, CAL_CSI2_VC_IRQENABLE(0), 0xFF000000);
 }
 
 static void disable_irqs(struct cal_ctx *ctx)
@@ -701,21 +705,21 @@ static void disable_irqs(struct cal_ctx *ctx)
 	u32 val;
 
 	/* Disable CIO error irqs */
-	reg_write(ctx->dev, CAL_HL_IRQENABLE_CLR(0),
+	reg_write(ctx->cal, CAL_HL_IRQENABLE_CLR(0),
 		  CAL_HL_IRQ_CIO_MASK(ctx->csi2_port));
-	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_IRQENABLE(ctx->csi2_port),
+	reg_write(ctx->cal, CAL_CSI2_COMPLEXIO_IRQENABLE(ctx->csi2_port),
 		  0);
 
 	/* Disable IRQ_WDMA_END 0/1 */
 	val = 0;
 	set_field(&val, 1, CAL_HL_IRQ_MASK(ctx->csi2_port));
-	reg_write(ctx->dev, CAL_HL_IRQENABLE_CLR(1), val);
+	reg_write(ctx->cal, CAL_HL_IRQENABLE_CLR(1), val);
 	/* Disable IRQ_WDMA_START 0/1 */
 	val = 0;
 	set_field(&val, 1, CAL_HL_IRQ_MASK(ctx->csi2_port));
-	reg_write(ctx->dev, CAL_HL_IRQENABLE_CLR(2), val);
+	reg_write(ctx->cal, CAL_HL_IRQENABLE_CLR(2), val);
 	/* Todo: Add VC_IRQ and CSI2_COMPLEXIO_IRQ handling */
-	reg_write(ctx->dev, CAL_CSI2_VC_IRQENABLE(0), 0);
+	reg_write(ctx->cal, CAL_CSI2_VC_IRQENABLE(0), 0);
 }
 
 static void csi2_cio_power(struct cal_ctx *ctx, bool enable)
@@ -726,13 +730,13 @@ static void csi2_cio_power(struct cal_ctx *ctx, bool enable)
 	target_state = enable ? CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_ON :
 		       CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_STATE_OFF;
 
-	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
+	reg_write_field(ctx->cal, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
 			target_state, CAL_CSI2_COMPLEXIO_CFG_PWR_CMD_MASK);
 
 	for (i = 0; i < 10; i++) {
 		u32 current_state;
 
-		current_state = reg_read_field(ctx->dev,
+		current_state = reg_read_field(ctx->cal,
 					       CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
 					       CAL_CSI2_COMPLEXIO_CFG_PWR_STATUS_MASK);
 
@@ -822,12 +826,12 @@ static void csi2_phy_init(struct cal_ctx *ctx)
 	camerarx_phy_enable(ctx);
 
 	/* 2. Reset complex IO - Do not wait for reset completion */
-	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
+	reg_write_field(ctx->cal, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
 			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_OPERATIONAL,
 			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
 	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x De-assert Complex IO Reset\n",
 		ctx->csi2_port,
-		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)));
+		reg_read(ctx->cal, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)));
 
 	/* Dummy read to allow SCP reset to complete */
 	reg_read(ctx->cc, CAL_CSI2_PHY_REG0);
@@ -844,23 +848,23 @@ static void csi2_phy_init(struct cal_ctx *ctx)
 	 * Stop-state-timeout must be more than 100us as per CSI2 spec, so we
 	 * calculate a timeout that's 100us (rounding up).
 	 */
-	sscounter = DIV_ROUND_UP(clk_get_rate(ctx->dev->fclk), 10000 *  16 * 4);
+	sscounter = DIV_ROUND_UP(clk_get_rate(ctx->cal->fclk), 10000 *  16 * 4);
 
-	val = reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port));
+	val = reg_read(ctx->cal, CAL_CSI2_TIMING(ctx->csi2_port));
 	set_field(&val, 1, CAL_CSI2_TIMING_STOP_STATE_X16_IO1_MASK);
 	set_field(&val, 1, CAL_CSI2_TIMING_STOP_STATE_X4_IO1_MASK);
 	set_field(&val, sscounter, CAL_CSI2_TIMING_STOP_STATE_COUNTER_IO1_MASK);
-	reg_write(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port), val);
+	reg_write(ctx->cal, CAL_CSI2_TIMING(ctx->csi2_port), val);
 	ctx_dbg(3, ctx, "CAL_CSI2_TIMING(%d) = 0x%08x Stop States\n",
 		ctx->csi2_port,
-		reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port)));
+		reg_read(ctx->cal, CAL_CSI2_TIMING(ctx->csi2_port)));
 
 	/* 4. Force FORCERXMODE */
-	reg_write_field(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port),
+	reg_write_field(ctx->cal, CAL_CSI2_TIMING(ctx->csi2_port),
 			1, CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK);
 	ctx_dbg(3, ctx, "CAL_CSI2_TIMING(%d) = 0x%08x Force RXMODE\n",
 		ctx->csi2_port,
-		reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port)));
+		reg_read(ctx->cal, CAL_CSI2_TIMING(ctx->csi2_port)));
 
 	/* E. Power up the PHY using the complex IO */
 	csi2_cio_power(ctx, true);
@@ -872,7 +876,7 @@ static void csi2_wait_complexio_reset(struct cal_ctx *ctx)
 
 	timeout = jiffies + msecs_to_jiffies(750);
 	while (time_before(jiffies, timeout)) {
-		if (reg_read_field(ctx->dev,
+		if (reg_read_field(ctx->cal,
 				   CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
 				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
 		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
@@ -880,7 +884,7 @@ static void csi2_wait_complexio_reset(struct cal_ctx *ctx)
 		usleep_range(500, 5000);
 	}
 
-	if (reg_read_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
+	if (reg_read_field(ctx->cal, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
 			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) !=
 			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
 		ctx_err(ctx, "Timeout waiting for Complex IO reset done\n");
@@ -892,14 +896,14 @@ static void csi2_wait_stop_state(struct cal_ctx *ctx)
 
 	timeout = jiffies + msecs_to_jiffies(750);
 	while (time_before(jiffies, timeout)) {
-		if (reg_read_field(ctx->dev,
+		if (reg_read_field(ctx->cal,
 				   CAL_CSI2_TIMING(ctx->csi2_port),
 				   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) == 0)
 			break;
 		usleep_range(500, 5000);
 	}
 
-	if (reg_read_field(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port),
+	if (reg_read_field(ctx->cal, CAL_CSI2_TIMING(ctx->csi2_port),
 			   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) != 0)
 		ctx_err(ctx, "Timeout waiting for stop state\n");
 }
@@ -932,13 +936,13 @@ static void csi2_phy_deinit(struct cal_ctx *ctx)
 	csi2_cio_power(ctx, false);
 
 	/* Assert Comple IO Reset */
-	reg_write_field(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
+	reg_write_field(ctx->cal, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
 			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL,
 			CAL_CSI2_COMPLEXIO_CFG_RESET_CTRL_MASK);
 
 	/* Wait for power down completion */
 	for (i = 0; i < 10; i++) {
-		if (reg_read_field(ctx->dev,
+		if (reg_read_field(ctx->cal,
 				   CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
 				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
 		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETONGOING)
@@ -947,7 +951,7 @@ static void csi2_phy_deinit(struct cal_ctx *ctx)
 	}
 	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x Complex IO in Reset (%d) %s\n",
 		ctx->csi2_port,
-		reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)), i,
+		reg_read(ctx->cal, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)), i,
 		(i >= 10) ? "(timeout)" : "");
 
 	/* Disable the phy */
@@ -956,7 +960,7 @@ static void csi2_phy_deinit(struct cal_ctx *ctx)
 
 static void csi2_lane_config(struct cal_ctx *ctx)
 {
-	u32 val = reg_read(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port));
+	u32 val = reg_read(ctx->cal, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port));
 	u32 lane_mask = CAL_CSI2_COMPLEXIO_CFG_CLOCK_POSITION_MASK;
 	u32 polarity_mask = CAL_CSI2_COMPLEXIO_CFG_CLOCK_POL_MASK;
 	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 =
@@ -977,21 +981,21 @@ static void csi2_lane_config(struct cal_ctx *ctx)
 			  polarity_mask);
 	}
 
-	reg_write(ctx->dev, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port), val);
+	reg_write(ctx->cal, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port), val);
 	ctx_dbg(3, ctx, "CAL_CSI2_COMPLEXIO_CFG(%d) = 0x%08x\n",
 		ctx->csi2_port, val);
 }
 
 static void csi2_ppi_enable(struct cal_ctx *ctx)
 {
-	reg_write(ctx->dev, CAL_CSI2_PPI_CTRL(ctx->csi2_port), BIT(3));
-	reg_write_field(ctx->dev, CAL_CSI2_PPI_CTRL(ctx->csi2_port),
+	reg_write(ctx->cal, CAL_CSI2_PPI_CTRL(ctx->csi2_port), BIT(3));
+	reg_write_field(ctx->cal, CAL_CSI2_PPI_CTRL(ctx->csi2_port),
 			1, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
 }
 
 static void csi2_ppi_disable(struct cal_ctx *ctx)
 {
-	reg_write_field(ctx->dev, CAL_CSI2_PPI_CTRL(ctx->csi2_port),
+	reg_write_field(ctx->cal, CAL_CSI2_PPI_CTRL(ctx->csi2_port),
 			0, CAL_CSI2_PPI_CTRL_IF_EN_MASK);
 }
 
@@ -999,7 +1003,7 @@ static void csi2_ctx_config(struct cal_ctx *ctx)
 {
 	u32 val;
 
-	val = reg_read(ctx->dev, CAL_CSI2_CTX0(ctx->csi2_port));
+	val = reg_read(ctx->cal, CAL_CSI2_CTX0(ctx->csi2_port));
 	set_field(&val, ctx->cport, CAL_CSI2_CTX_CPORT_MASK);
 	/*
 	 * DT type: MIPI CSI-2 Specs
@@ -1016,9 +1020,9 @@ static void csi2_ctx_config(struct cal_ctx *ctx)
 	set_field(&val, CAL_CSI2_CTX_ATT_PIX, CAL_CSI2_CTX_ATT_MASK);
 	set_field(&val, CAL_CSI2_CTX_PACK_MODE_LINE,
 		  CAL_CSI2_CTX_PACK_MODE_MASK);
-	reg_write(ctx->dev, CAL_CSI2_CTX0(ctx->csi2_port), val);
+	reg_write(ctx->cal, CAL_CSI2_CTX0(ctx->csi2_port), val);
 	ctx_dbg(3, ctx, "CAL_CSI2_CTX0(%d) = 0x%08x\n", ctx->csi2_port,
-		reg_read(ctx->dev, CAL_CSI2_CTX0(ctx->csi2_port)));
+		reg_read(ctx->cal, CAL_CSI2_CTX0(ctx->csi2_port)));
 }
 
 static void pix_proc_config(struct cal_ctx *ctx)
@@ -1052,7 +1056,7 @@ static void pix_proc_config(struct cal_ctx *ctx)
 		 *
 		 * Instead of failing here just use 8 bpp as a default.
 		 */
-		dev_warn_once(&ctx->dev->pdev->dev,
+		dev_warn_once(&ctx->cal->pdev->dev,
 			      "%s:%d:%s: bpp:%d unsupported! Overwritten with 8.\n",
 			      __FILE__, __LINE__, __func__, ctx->fmt->bpp);
 		extract = CAL_PIX_PROC_EXTRACT_B8;
@@ -1060,16 +1064,16 @@ static void pix_proc_config(struct cal_ctx *ctx)
 		break;
 	}
 
-	val = reg_read(ctx->dev, CAL_PIX_PROC(ctx->csi2_port));
+	val = reg_read(ctx->cal, CAL_PIX_PROC(ctx->csi2_port));
 	set_field(&val, extract, CAL_PIX_PROC_EXTRACT_MASK);
 	set_field(&val, CAL_PIX_PROC_DPCMD_BYPASS, CAL_PIX_PROC_DPCMD_MASK);
 	set_field(&val, CAL_PIX_PROC_DPCME_BYPASS, CAL_PIX_PROC_DPCME_MASK);
 	set_field(&val, pack, CAL_PIX_PROC_PACK_MASK);
 	set_field(&val, ctx->cport, CAL_PIX_PROC_CPORT_MASK);
 	set_field(&val, 1, CAL_PIX_PROC_EN_MASK);
-	reg_write(ctx->dev, CAL_PIX_PROC(ctx->csi2_port), val);
+	reg_write(ctx->cal, CAL_PIX_PROC(ctx->csi2_port), val);
 	ctx_dbg(3, ctx, "CAL_PIX_PROC(%d) = 0x%08x\n", ctx->csi2_port,
-		reg_read(ctx->dev, CAL_PIX_PROC(ctx->csi2_port)));
+		reg_read(ctx->cal, CAL_PIX_PROC(ctx->csi2_port)));
 }
 
 static void cal_wr_dma_config(struct cal_ctx *ctx,
@@ -1077,7 +1081,7 @@ static void cal_wr_dma_config(struct cal_ctx *ctx,
 {
 	u32 val;
 
-	val = reg_read(ctx->dev, CAL_WR_DMA_CTRL(ctx->csi2_port));
+	val = reg_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->csi2_port));
 	set_field(&val, ctx->cport, CAL_WR_DMA_CTRL_CPORT_MASK);
 	set_field(&val, height, CAL_WR_DMA_CTRL_YSIZE_MASK);
 	set_field(&val, CAL_WR_DMA_CTRL_DTAG_PIX_DAT,
@@ -1087,22 +1091,22 @@ static void cal_wr_dma_config(struct cal_ctx *ctx,
 	set_field(&val, CAL_WR_DMA_CTRL_PATTERN_LINEAR,
 		  CAL_WR_DMA_CTRL_PATTERN_MASK);
 	set_field(&val, 1, CAL_WR_DMA_CTRL_STALL_RD_MASK);
-	reg_write(ctx->dev, CAL_WR_DMA_CTRL(ctx->csi2_port), val);
+	reg_write(ctx->cal, CAL_WR_DMA_CTRL(ctx->csi2_port), val);
 	ctx_dbg(3, ctx, "CAL_WR_DMA_CTRL(%d) = 0x%08x\n", ctx->csi2_port,
-		reg_read(ctx->dev, CAL_WR_DMA_CTRL(ctx->csi2_port)));
+		reg_read(ctx->cal, CAL_WR_DMA_CTRL(ctx->csi2_port)));
 
 	/*
 	 * width/16 not sure but giving it a whirl.
 	 * zero does not work right
 	 */
-	reg_write_field(ctx->dev,
+	reg_write_field(ctx->cal,
 			CAL_WR_DMA_OFST(ctx->csi2_port),
 			(width / 16),
 			CAL_WR_DMA_OFST_MASK);
 	ctx_dbg(3, ctx, "CAL_WR_DMA_OFST(%d) = 0x%08x\n", ctx->csi2_port,
-		reg_read(ctx->dev, CAL_WR_DMA_OFST(ctx->csi2_port)));
+		reg_read(ctx->cal, CAL_WR_DMA_OFST(ctx->csi2_port)));
 
-	val = reg_read(ctx->dev, CAL_WR_DMA_XSIZE(ctx->csi2_port));
+	val = reg_read(ctx->cal, CAL_WR_DMA_XSIZE(ctx->csi2_port));
 	/* 64 bit word means no skipping */
 	set_field(&val, 0, CAL_WR_DMA_XSIZE_XSKIP_MASK);
 	/*
@@ -1111,24 +1115,24 @@ static void cal_wr_dma_config(struct cal_ctx *ctx,
 	 * is detected automagically
 	 */
 	set_field(&val, (width / 8), CAL_WR_DMA_XSIZE_MASK);
-	reg_write(ctx->dev, CAL_WR_DMA_XSIZE(ctx->csi2_port), val);
+	reg_write(ctx->cal, CAL_WR_DMA_XSIZE(ctx->csi2_port), val);
 	ctx_dbg(3, ctx, "CAL_WR_DMA_XSIZE(%d) = 0x%08x\n", ctx->csi2_port,
-		reg_read(ctx->dev, CAL_WR_DMA_XSIZE(ctx->csi2_port)));
+		reg_read(ctx->cal, CAL_WR_DMA_XSIZE(ctx->csi2_port)));
 
-	val = reg_read(ctx->dev, CAL_CTRL);
+	val = reg_read(ctx->cal, CAL_CTRL);
 	set_field(&val, CAL_CTRL_BURSTSIZE_BURST128, CAL_CTRL_BURSTSIZE_MASK);
 	set_field(&val, 0xF, CAL_CTRL_TAGCNT_MASK);
 	set_field(&val, CAL_CTRL_POSTED_WRITES_NONPOSTED,
 		  CAL_CTRL_POSTED_WRITES_MASK);
 	set_field(&val, 0xFF, CAL_CTRL_MFLAGL_MASK);
 	set_field(&val, 0xFF, CAL_CTRL_MFLAGH_MASK);
-	reg_write(ctx->dev, CAL_CTRL, val);
-	ctx_dbg(3, ctx, "CAL_CTRL = 0x%08x\n", reg_read(ctx->dev, CAL_CTRL));
+	reg_write(ctx->cal, CAL_CTRL, val);
+	ctx_dbg(3, ctx, "CAL_CTRL = 0x%08x\n", reg_read(ctx->cal, CAL_CTRL));
 }
 
 static void cal_wr_dma_addr(struct cal_ctx *ctx, unsigned int dmaaddr)
 {
-	reg_write(ctx->dev, CAL_WR_DMA_ADDR(ctx->csi2_port), dmaaddr);
+	reg_write(ctx->cal, CAL_WR_DMA_ADDR(ctx->csi2_port), dmaaddr);
 }
 
 static int cal_get_external_info(struct cal_ctx *ctx)
@@ -1182,45 +1186,45 @@ static inline void cal_process_buffer_complete(struct cal_ctx *ctx)
 
 static irqreturn_t cal_irq(int irq_cal, void *data)
 {
-	struct cal_dev *dev = data;
+	struct cal_dev *cal = data;
 	struct cal_ctx *ctx;
 	struct cal_dmaqueue *dma_q;
 	u32 status;
 
-	status = reg_read(dev, CAL_HL_IRQSTATUS(0));
+	status = reg_read(cal, CAL_HL_IRQSTATUS(0));
 	if (status) {
 		unsigned int i;
 
-		reg_write(dev, CAL_HL_IRQSTATUS(0), status);
+		reg_write(cal, CAL_HL_IRQSTATUS(0), status);
 
 		if (status & CAL_HL_IRQ_OCPO_ERR_MASK)
-			dev_err_ratelimited(&dev->pdev->dev, "OCPO ERROR\n");
+			dev_err_ratelimited(&cal->pdev->dev, "OCPO ERROR\n");
 
 		for (i = 0; i < 2; ++i) {
 			if (status & CAL_HL_IRQ_CIO_MASK(i)) {
-				u32 cio_stat = reg_read(dev,
+				u32 cio_stat = reg_read(cal,
 							CAL_CSI2_COMPLEXIO_IRQSTATUS(i));
 
-				dev_err_ratelimited(&dev->pdev->dev,
+				dev_err_ratelimited(&cal->pdev->dev,
 						    "CIO%u error: %#08x\n", i, cio_stat);
 
-				reg_write(dev, CAL_CSI2_COMPLEXIO_IRQSTATUS(i),
+				reg_write(cal, CAL_CSI2_COMPLEXIO_IRQSTATUS(i),
 					  cio_stat);
 			}
 		}
 	}
 
 	/* Check which DMA just finished */
-	status = reg_read(dev, CAL_HL_IRQSTATUS(1));
+	status = reg_read(cal, CAL_HL_IRQSTATUS(1));
 	if (status) {
 		unsigned int i;
 
 		/* Clear Interrupt status */
-		reg_write(dev, CAL_HL_IRQSTATUS(1), status);
+		reg_write(cal, CAL_HL_IRQSTATUS(1), status);
 
 		for (i = 0; i < 2; ++i) {
 			if (isportirqset(status, i)) {
-				ctx = dev->ctx[i];
+				ctx = cal->ctx[i];
 
 				spin_lock(&ctx->slock);
 				ctx->dma_act = false;
@@ -1234,16 +1238,16 @@ static irqreturn_t cal_irq(int irq_cal, void *data)
 	}
 
 	/* Check which DMA just started */
-	status = reg_read(dev, CAL_HL_IRQSTATUS(2));
+	status = reg_read(cal, CAL_HL_IRQSTATUS(2));
 	if (status) {
 		unsigned int i;
 
 		/* Clear Interrupt status */
-		reg_write(dev, CAL_HL_IRQSTATUS(2), status);
+		reg_write(cal, CAL_HL_IRQSTATUS(2), status);
 
 		for (i = 0; i < 2; ++i) {
 			if (isportirqset(status, i)) {
-				ctx = dev->ctx[i];
+				ctx = cal->ctx[i];
 				dma_q = &ctx->vidq;
 
 				spin_lock(&ctx->slock);
@@ -1667,7 +1671,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 		goto err;
 	}
 
-	pm_runtime_get_sync(&ctx->dev->pdev->dev);
+	pm_runtime_get_sync(&ctx->cal->pdev->dev);
 
 	csi2_ctx_config(ctx);
 	pix_proc_config(ctx);
@@ -1682,7 +1686,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret) {
 		v4l2_subdev_call(ctx->sensor, core, s_power, 0);
 		ctx_err(ctx, "stream on failed in subdev\n");
-		pm_runtime_put_sync(&ctx->dev->pdev->dev);
+		pm_runtime_put_sync(&ctx->cal->pdev->dev);
 		goto err;
 	}
 
@@ -1691,7 +1695,7 @@ static int cal_start_streaming(struct vb2_queue *vq, unsigned int count)
 	csi2_ppi_enable(ctx);
 
 	if (debug >= 4)
-		cal_quickdump_regs(ctx->dev);
+		cal_quickdump_regs(ctx->cal);
 
 	return 0;
 
@@ -1762,7 +1766,7 @@ static void cal_stop_streaming(struct vb2_queue *vq)
 	ctx->next_frm = NULL;
 	spin_unlock_irqrestore(&ctx->slock, flags);
 
-	pm_runtime_put_sync(&ctx->dev->pdev->dev);
+	pm_runtime_put_sync(&ctx->cal->pdev->dev);
 }
 
 static const struct vb2_ops cal_video_qops = {
@@ -2037,7 +2041,7 @@ of_get_next_endpoint(const struct device_node *parent,
 
 static int of_cal_create_instance(struct cal_ctx *ctx, int inst)
 {
-	struct platform_device *pdev = ctx->dev->pdev;
+	struct platform_device *pdev = ctx->cal->pdev;
 	struct device_node *ep_node, *port, *sensor_node, *parent;
 	struct v4l2_fwnode_endpoint *endpoint;
 	struct v4l2_async_subdev *asd;
@@ -2160,22 +2164,22 @@ static int of_cal_create_instance(struct cal_ctx *ctx, int inst)
 	return ret;
 }
 
-static struct cal_ctx *cal_create_instance(struct cal_dev *dev, int inst)
+static struct cal_ctx *cal_create_instance(struct cal_dev *cal, int inst)
 {
 	struct cal_ctx *ctx;
 	struct v4l2_ctrl_handler *hdl;
 	int ret;
 
-	ctx = devm_kzalloc(&dev->pdev->dev, sizeof(*ctx), GFP_KERNEL);
+	ctx = devm_kzalloc(&cal->pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return NULL;
 
 	/* save the cal_dev * for future ref */
-	ctx->dev = dev;
+	ctx->cal = cal;
 
 	snprintf(ctx->v4l2_dev.name, sizeof(ctx->v4l2_dev.name),
 		 "%s-%03d", CAL_MODULE_NAME, inst);
-	ret = v4l2_device_register(&dev->pdev->dev, &ctx->v4l2_dev);
+	ret = v4l2_device_register(&cal->pdev->dev, &ctx->v4l2_dev);
 	if (ret)
 		goto err_exit;
 
@@ -2188,7 +2192,7 @@ static struct cal_ctx *cal_create_instance(struct cal_dev *dev, int inst)
 	ctx->v4l2_dev.ctrl_handler = hdl;
 
 	/* Make sure Camera Core H/W register area is available */
-	ctx->cc = dev->cc[inst];
+	ctx->cc = cal->cc[inst];
 
 	/* Store the instance id */
 	ctx->csi2_port = inst;
@@ -2232,7 +2236,7 @@ MODULE_DEVICE_TABLE(of, cal_of_match);
 
 static int cal_probe(struct platform_device *pdev)
 {
-	struct cal_dev *dev;
+	struct cal_dev *cal;
 	struct cal_ctx *ctx;
 	struct device_node *parent = pdev->dev.of_node;
 	struct regmap *syscon_camerrx;
@@ -2241,27 +2245,27 @@ static int cal_probe(struct platform_device *pdev)
 	int ret;
 	int irq;
 
-	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
-	if (!dev)
+	cal = devm_kzalloc(&pdev->dev, sizeof(*cal), GFP_KERNEL);
+	if (!cal)
 		return -ENOMEM;
 
-	dev->data = of_device_get_match_data(&pdev->dev);
-	if (!dev->data) {
+	cal->data = of_device_get_match_data(&pdev->dev);
+	if (!cal->data) {
 		dev_err(&pdev->dev, "Could not get feature data based on compatible version\n");
 		return -ENODEV;
 	}
 
 	/* set pseudo v4l2 device name so we can use v4l2_printk */
-	strscpy(dev->v4l2_dev.name, CAL_MODULE_NAME,
-		sizeof(dev->v4l2_dev.name));
+	strscpy(cal->v4l2_dev.name, CAL_MODULE_NAME,
+		sizeof(cal->v4l2_dev.name));
 
 	/* save pdev pointer */
-	dev->pdev = pdev;
+	cal->pdev = pdev;
 
-	dev->fclk = devm_clk_get(&pdev->dev, "fck");
-	if (IS_ERR(dev->fclk)) {
+	cal->fclk = devm_clk_get(&pdev->dev, "fck");
+	if (IS_ERR(cal->fclk)) {
 		dev_err(&pdev->dev, "cannot get CAL fclk\n");
-		return PTR_ERR(dev->fclk);
+		return PTR_ERR(cal->fclk);
 	}
 
 	syscon_camerrx = syscon_regmap_lookup_by_phandle(parent,
@@ -2279,7 +2283,7 @@ static int cal_probe(struct platform_device *pdev)
 		 * If syscon entry is not present then check if the
 		 * camerrx_control resource is present.
 		 */
-		syscon_camerrx = cal_get_camerarx_regmap(dev);
+		syscon_camerrx = cal_get_camerarx_regmap(cal);
 		if (IS_ERR(syscon_camerrx)) {
 			dev_err(&pdev->dev, "failed to get camerrx_control regmap\n");
 			return PTR_ERR(syscon_camerrx);
@@ -2290,47 +2294,47 @@ static int cal_probe(struct platform_device *pdev)
 		syscon_camerrx_offset = 0;
 	}
 
-	dev->syscon_camerrx = syscon_camerrx;
-	dev->syscon_camerrx_offset = syscon_camerrx_offset;
+	cal->syscon_camerrx = syscon_camerrx;
+	cal->syscon_camerrx_offset = syscon_camerrx_offset;
 
-	dev->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+	cal->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 						"cal_top");
-	dev->base = devm_ioremap_resource(&pdev->dev, dev->res);
-	if (IS_ERR(dev->base))
-		return PTR_ERR(dev->base);
+	cal->base = devm_ioremap_resource(&pdev->dev, cal->res);
+	if (IS_ERR(cal->base))
+		return PTR_ERR(cal->base);
 
-	cal_dbg(1, dev, "ioresource %s at %pa - %pa\n",
-		dev->res->name, &dev->res->start, &dev->res->end);
+	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
+		cal->res->name, &cal->res->start, &cal->res->end);
 
 	irq = platform_get_irq(pdev, 0);
-	cal_dbg(1, dev, "got irq# %d\n", irq);
+	cal_dbg(1, cal, "got irq# %d\n", irq);
 	ret = devm_request_irq(&pdev->dev, irq, cal_irq, 0, CAL_MODULE_NAME,
-			       dev);
+			       cal);
 	if (ret)
 		return ret;
 
-	platform_set_drvdata(pdev, dev);
+	platform_set_drvdata(pdev, cal);
 
-	dev->cc[0] = cc_create(dev, 0);
-	if (IS_ERR(dev->cc[0]))
-		return PTR_ERR(dev->cc[0]);
+	cal->cc[0] = cc_create(cal, 0);
+	if (IS_ERR(cal->cc[0]))
+		return PTR_ERR(cal->cc[0]);
 
-	if (cal_data_get_num_csi2_phy(dev) > 1) {
-		dev->cc[1] = cc_create(dev, 1);
-		if (IS_ERR(dev->cc[1]))
-			return PTR_ERR(dev->cc[1]);
+	if (cal_data_get_num_csi2_phy(cal) > 1) {
+		cal->cc[1] = cc_create(cal, 1);
+		if (IS_ERR(cal->cc[1]))
+			return PTR_ERR(cal->cc[1]);
 	} else {
-		dev->cc[1] = NULL;
+		cal->cc[1] = NULL;
 	}
 
-	dev->ctx[0] = NULL;
-	dev->ctx[1] = NULL;
+	cal->ctx[0] = NULL;
+	cal->ctx[1] = NULL;
 
-	dev->ctx[0] = cal_create_instance(dev, 0);
-	if (cal_data_get_num_csi2_phy(dev) > 1)
-		dev->ctx[1] = cal_create_instance(dev, 1);
-	if (!dev->ctx[0] && !dev->ctx[1]) {
-		cal_err(dev, "Neither port is configured, no point in staying up\n");
+	cal->ctx[0] = cal_create_instance(cal, 0);
+	if (cal_data_get_num_csi2_phy(cal) > 1)
+		cal->ctx[1] = cal_create_instance(cal, 1);
+	if (!cal->ctx[0] && !cal->ctx[1]) {
+		cal_err(cal, "Neither port is configured, no point in staying up\n");
 		return -ENODEV;
 	}
 
@@ -2343,7 +2347,7 @@ static int cal_probe(struct platform_device *pdev)
 		goto runtime_disable;
 
 	/* Just check we can actually access the module */
-	cal_get_hwinfo(dev);
+	cal_get_hwinfo(cal);
 
 	pm_runtime_put_sync(&pdev->dev);
 
@@ -2354,7 +2358,7 @@ static int cal_probe(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	for (i = 0; i < CAL_NUM_CONTEXT; i++) {
-		ctx = dev->ctx[i];
+		ctx = cal->ctx[i];
 		if (ctx) {
 			v4l2_async_notifier_unregister(&ctx->notifier);
 			v4l2_async_notifier_cleanup(&ctx->notifier);
@@ -2368,16 +2372,16 @@ static int cal_probe(struct platform_device *pdev)
 
 static int cal_remove(struct platform_device *pdev)
 {
-	struct cal_dev *dev = platform_get_drvdata(pdev);
+	struct cal_dev *cal = platform_get_drvdata(pdev);
 	struct cal_ctx *ctx;
 	unsigned int i;
 
-	cal_dbg(1, dev, "Removing %s\n", CAL_MODULE_NAME);
+	cal_dbg(1, cal, "Removing %s\n", CAL_MODULE_NAME);
 
 	pm_runtime_get_sync(&pdev->dev);
 
 	for (i = 0; i < CAL_NUM_CONTEXT; i++) {
-		ctx = dev->ctx[i];
+		ctx = cal->ctx[i];
 		if (ctx) {
 			ctx_dbg(1, ctx, "unregistering %s\n",
 				video_device_node_name(&ctx->vdev));
@@ -2400,15 +2404,15 @@ static int cal_remove(struct platform_device *pdev)
 
 static int cal_runtime_resume(struct device *dev)
 {
-	struct cal_dev *caldev = dev_get_drvdata(dev);
+	struct cal_dev *cal = dev_get_drvdata(dev);
 
-	if (caldev->data->flags & DRA72_CAL_PRE_ES2_LDO_DISABLE) {
+	if (cal->data->flags & DRA72_CAL_PRE_ES2_LDO_DISABLE) {
 		/*
 		 * Apply errata on both port everytime we (re-)enable
 		 * the clock
 		 */
-		i913_errata(caldev, 0);
-		i913_errata(caldev, 1);
+		i913_errata(cal, 0);
+		i913_errata(cal, 1);
 	}
 
 	return 0;
-- 
Regards,

Laurent Pinchart

