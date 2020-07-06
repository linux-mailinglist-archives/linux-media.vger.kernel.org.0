Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B423C215E8A
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729898AbgGFShy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:37:54 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729897AbgGFShy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:37:54 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B75DE37;
        Mon,  6 Jul 2020 20:37:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060665;
        bh=6f57A6B6+GUbab33GPUWr3a7IhA22KkaMD0fyjAC7Rs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IUyIjbH42AOvS1Q5eX4IPDXFU+Ndp927OyNgdY2UKRVz+Ycex5ptEybcTqhE7vnyj
         1BgDj+hUBBxS6oihlyWptfZevuhXNZeYsi9LsK/EZilwFTw28VB2TXUibmtpFtSSIa
         J/eA6n7WgWcLXXERvk4grMkGWfm8BGejl10dfwC8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 027/108] media: ti-vpe: cal: Name all cal_camerarx pointers consistently
Date:   Mon,  6 Jul 2020 21:35:48 +0300
Message-Id: <20200706183709.12238-28-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Name all variables that point to a cal_camerax instance 'phy' instead of
'cc'. The name 'cc' refers to Camera Core, but is not commonly used in
the driver or in datasheets.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 102 ++++++++++++++--------------
 1 file changed, 51 insertions(+), 51 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index f0e06a4699fc..d376cdd32f72 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -312,7 +312,8 @@ static const struct cal_data am654_cal_data = {
  * the CAMERARX instances. Instances of struct cal_dev are named cal through the
  * driver.
  *
- * The cal_camerarx structure represents one CAMERARX instance.
+ * The cal_camerarx structure represents one CAMERARX instance. Instances of
+ * cal_camerarx are named phy through the driver.
  *
  * The cal_ctx structure represents the combination of one CSI-2 context, one
  * processing context and one DMA context. Instance of struct cal_ctx are named
@@ -344,7 +345,7 @@ struct cal_dev {
 	u32			syscon_camerrx_offset;
 
 	/* Camera Core Module handle */
-	struct cal_camerarx	*cc[CAL_NUM_CSI2_PORTS];
+	struct cal_camerarx	*phy[CAL_NUM_CSI2_PORTS];
 
 	struct cal_ctx		*ctx[CAL_NUM_CONTEXT];
 };
@@ -361,7 +362,7 @@ struct cal_ctx {
 	struct v4l2_fwnode_endpoint	endpoint;
 
 	struct cal_dev		*cal;
-	struct cal_camerarx	*cc;
+	struct cal_camerarx	*phy;
 
 	/* v4l2_ioctl mutex */
 	struct mutex		mutex;
@@ -468,7 +469,7 @@ static u32 cal_data_get_num_csi2_phy(struct cal_dev *cal)
 }
 
 static int cal_camerarx_regmap_init(struct cal_dev *cal,
-				    struct cal_camerarx *cc,
+				    struct cal_camerarx *phy,
 				    unsigned int idx)
 {
 	const struct cal_camerarx_data *phy_data;
@@ -490,12 +491,12 @@ static int cal_camerarx_regmap_init(struct cal_dev *cal,
 		 * Here we update the reg offset with the
 		 * value found in DT
 		 */
-		cc->phy.fields[i] = devm_regmap_field_alloc(&cal->pdev->dev,
-							    cal->syscon_camerrx,
-							    field);
-		if (IS_ERR(cc->phy.fields[i])) {
+		phy->phy.fields[i] = devm_regmap_field_alloc(&cal->pdev->dev,
+							     cal->syscon_camerrx,
+							     field);
+		if (IS_ERR(phy->phy.fields[i])) {
 			cal_err(cal, "Unable to allocate regmap fields\n");
-			return PTR_ERR(cc->phy.fields[i]);
+			return PTR_ERR(phy->phy.fields[i]);
 		}
 	}
 
@@ -539,25 +540,25 @@ static struct regmap *cal_get_camerarx_regmap(struct cal_dev *cal)
 static void camerarx_phy_enable(struct cal_ctx *ctx)
 {
 	u32 phy_id = ctx->csi2_port;
-	struct cal_camerarx *cc = ctx->cal->cc[phy_id];
+	struct cal_camerarx *phy = ctx->cal->phy[phy_id];
 	u32 max_lanes;
 
-	regmap_field_write(cc->phy.fields[F_CAMMODE], 0);
+	regmap_field_write(phy->phy.fields[F_CAMMODE], 0);
 	/* Always enable all lanes at the phy control level */
 	max_lanes = (1 << cal_data_get_phy_max_lanes(ctx)) - 1;
-	regmap_field_write(cc->phy.fields[F_LANEENABLE], max_lanes);
+	regmap_field_write(phy->phy.fields[F_LANEENABLE], max_lanes);
 	/* F_CSI_MODE is not present on every architecture */
-	if (cc->phy.fields[F_CSI_MODE])
-		regmap_field_write(cc->phy.fields[F_CSI_MODE], 1);
-	regmap_field_write(cc->phy.fields[F_CTRLCLKEN], 1);
+	if (phy->phy.fields[F_CSI_MODE])
+		regmap_field_write(phy->phy.fields[F_CSI_MODE], 1);
+	regmap_field_write(phy->phy.fields[F_CTRLCLKEN], 1);
 }
 
 static void camerarx_phy_disable(struct cal_ctx *ctx)
 {
 	u32 phy_id = ctx->csi2_port;
-	struct cal_camerarx *cc = ctx->cal->cc[phy_id];
+	struct cal_camerarx *phy = ctx->cal->phy[phy_id];
 
-	regmap_field_write(cc->phy.fields[F_CTRLCLKEN], 0);
+	regmap_field_write(phy->phy.fields[F_CTRLCLKEN], 0);
 }
 
 /*
@@ -566,32 +567,31 @@ static void camerarx_phy_disable(struct cal_ctx *ctx)
 static struct cal_camerarx *cc_create(struct cal_dev *cal, unsigned int core)
 {
 	struct platform_device *pdev = cal->pdev;
-	struct cal_camerarx *cc;
+	struct cal_camerarx *phy;
 	int ret;
 
-	cc = devm_kzalloc(&pdev->dev, sizeof(*cc), GFP_KERNEL);
-	if (!cc)
+	phy = devm_kzalloc(&pdev->dev, sizeof(*phy), GFP_KERNEL);
+	if (!phy)
 		return ERR_PTR(-ENOMEM);
 
-	cc->res = platform_get_resource_byname(pdev,
-					       IORESOURCE_MEM,
-					       (core == 0) ?
+	phy->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+						(core == 0) ?
 						"cal_rx_core0" :
 						"cal_rx_core1");
-	cc->base = devm_ioremap_resource(&pdev->dev, cc->res);
-	if (IS_ERR(cc->base)) {
+	phy->base = devm_ioremap_resource(&pdev->dev, phy->res);
+	if (IS_ERR(phy->base)) {
 		cal_err(cal, "failed to ioremap\n");
-		return ERR_CAST(cc->base);
+		return ERR_CAST(phy->base);
 	}
 
 	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
-		cc->res->name, &cc->res->start, &cc->res->end);
+		phy->res->name, &phy->res->start, &phy->res->end);
 
-	ret = cal_camerarx_regmap_init(cal, cc, core);
+	ret = cal_camerarx_regmap_init(cal, phy, core);
 	if (ret)
 		return ERR_PTR(ret);
 
-	return cc;
+	return phy;
 }
 
 /*
@@ -632,12 +632,12 @@ static void cal_get_hwinfo(struct cal_dev *cal)
  */
 static void i913_errata(struct cal_dev *cal, unsigned int port)
 {
-	u32 reg10 = reg_read(cal->cc[port], CAL_CSI2_PHY_REG10);
+	u32 reg10 = reg_read(cal->phy[port], CAL_CSI2_PHY_REG10);
 
 	set_field(&reg10, 1, CAL_CSI2_PHY_REG10_I933_LDO_DISABLE_MASK);
 
 	cal_dbg(1, cal, "CSI2_%d_REG10 = 0x%08x\n", port, reg10);
-	reg_write(cal->cc[port], CAL_CSI2_PHY_REG10, reg10);
+	reg_write(cal->phy[port], CAL_CSI2_PHY_REG10, reg10);
 }
 
 static void cal_quickdump_regs(struct cal_dev *cal)
@@ -649,19 +649,19 @@ static void cal_quickdump_regs(struct cal_dev *cal)
 
 	if (cal->ctx[0]) {
 		cal_info(cal, "CSI2 Core 0 Registers @ %pa:\n",
-			 &cal->ctx[0]->cc->res->start);
+			 &cal->ctx[0]->phy->res->start);
 		print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 4,
-			       (__force const void *)cal->ctx[0]->cc->base,
-			       resource_size(cal->ctx[0]->cc->res),
+			       (__force const void *)cal->ctx[0]->phy->base,
+			       resource_size(cal->ctx[0]->phy->res),
 			       false);
 	}
 
 	if (cal->ctx[1]) {
 		cal_info(cal, "CSI2 Core 1 Registers @ %pa:\n",
-			 &cal->ctx[1]->cc->res->start);
+			 &cal->ctx[1]->phy->res->start);
 		print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 4,
-			       (__force const void *)cal->ctx[1]->cc->base,
-			       resource_size(cal->ctx[1]->cc->res),
+			       (__force const void *)cal->ctx[1]->phy->base,
+			       resource_size(cal->ctx[1]->phy->res),
 			       false);
 	}
 }
@@ -781,23 +781,23 @@ static void csi2_phy_config(struct cal_ctx *ctx)
 	ths_settle = (105 * csi2_ddrclk_khz / 1000000) + 4;
 	ctx_dbg(1, ctx, "ths_settle: %d (0x%02x)\n", ths_settle, ths_settle);
 
-	reg0 = reg_read(ctx->cc, CAL_CSI2_PHY_REG0);
+	reg0 = reg_read(ctx->phy, CAL_CSI2_PHY_REG0);
 	set_field(&reg0, CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_DISABLE,
 		  CAL_CSI2_PHY_REG0_HSCLOCKCONFIG_MASK);
 	set_field(&reg0, ths_term, CAL_CSI2_PHY_REG0_THS_TERM_MASK);
 	set_field(&reg0, ths_settle, CAL_CSI2_PHY_REG0_THS_SETTLE_MASK);
 
 	ctx_dbg(1, ctx, "CSI2_%d_REG0 = 0x%08x\n", ctx->csi2_port, reg0);
-	reg_write(ctx->cc, CAL_CSI2_PHY_REG0, reg0);
+	reg_write(ctx->phy, CAL_CSI2_PHY_REG0, reg0);
 
-	reg1 = reg_read(ctx->cc, CAL_CSI2_PHY_REG1);
+	reg1 = reg_read(ctx->phy, CAL_CSI2_PHY_REG1);
 	set_field(&reg1, TCLK_TERM, CAL_CSI2_PHY_REG1_TCLK_TERM_MASK);
 	set_field(&reg1, 0xb8, CAL_CSI2_PHY_REG1_DPHY_HS_SYNC_PATTERN_MASK);
 	set_field(&reg1, TCLK_MISS, CAL_CSI2_PHY_REG1_CTRLCLK_DIV_FACTOR_MASK);
 	set_field(&reg1, TCLK_SETTLE, CAL_CSI2_PHY_REG1_TCLK_SETTLE_MASK);
 
 	ctx_dbg(1, ctx, "CSI2_%d_REG1 = 0x%08x\n", ctx->csi2_port, reg1);
-	reg_write(ctx->cc, CAL_CSI2_PHY_REG1, reg1);
+	reg_write(ctx->phy, CAL_CSI2_PHY_REG1, reg1);
 }
 
 static void csi2_phy_init(struct cal_ctx *ctx)
@@ -834,7 +834,7 @@ static void csi2_phy_init(struct cal_ctx *ctx)
 		reg_read(ctx->cal, CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port)));
 
 	/* Dummy read to allow SCP reset to complete */
-	reg_read(ctx->cc, CAL_CSI2_PHY_REG0);
+	reg_read(ctx->phy, CAL_CSI2_PHY_REG0);
 
 	/* 3.A. Program Phy Timing Parameters */
 	csi2_phy_config(ctx);
@@ -926,7 +926,7 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
 	csi2_wait_stop_state(ctx);
 
 	ctx_dbg(1, ctx, "CSI2_%d_REG1 = 0x%08x (Bit(31,28) should be set!)\n",
-		ctx->csi2_port, reg_read(ctx->cc, CAL_CSI2_PHY_REG1));
+		ctx->csi2_port, reg_read(ctx->phy, CAL_CSI2_PHY_REG1));
 }
 
 static void csi2_phy_deinit(struct cal_ctx *ctx)
@@ -2192,7 +2192,7 @@ static struct cal_ctx *cal_create_instance(struct cal_dev *cal, int inst)
 	ctx->v4l2_dev.ctrl_handler = hdl;
 
 	/* Make sure Camera Core H/W register area is available */
-	ctx->cc = cal->cc[inst];
+	ctx->phy = cal->phy[inst];
 
 	/* Store the instance id */
 	ctx->csi2_port = inst;
@@ -2315,16 +2315,16 @@ static int cal_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, cal);
 
-	cal->cc[0] = cc_create(cal, 0);
-	if (IS_ERR(cal->cc[0]))
-		return PTR_ERR(cal->cc[0]);
+	cal->phy[0] = cc_create(cal, 0);
+	if (IS_ERR(cal->phy[0]))
+		return PTR_ERR(cal->phy[0]);
 
 	if (cal_data_get_num_csi2_phy(cal) > 1) {
-		cal->cc[1] = cc_create(cal, 1);
-		if (IS_ERR(cal->cc[1]))
-			return PTR_ERR(cal->cc[1]);
+		cal->phy[1] = cc_create(cal, 1);
+		if (IS_ERR(cal->phy[1]))
+			return PTR_ERR(cal->phy[1]);
 	} else {
-		cal->cc[1] = NULL;
+		cal->phy[1] = NULL;
 	}
 
 	cal->ctx[0] = NULL;
-- 
Regards,

Laurent Pinchart

