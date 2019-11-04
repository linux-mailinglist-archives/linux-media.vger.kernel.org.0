Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F02E6EE86C
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 20:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729608AbfKDTb5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 14:31:57 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48724 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729587AbfKDTb4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 14:31:56 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA4JVs71104128;
        Mon, 4 Nov 2019 13:31:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572895914;
        bh=sArSqH5vs/DzI+wwyje3e3bPD2I+eZhJifFMI/OKtQU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=uF+KTG5w9JmbDrMiYMaQC5bZAWXX3lqZnmWOegjhu8HqdeHOeAkujOTSMFOtoD42x
         l86F5Cs07yTcgMXpIznmaONtw8JD4Yg/2KrJrQLtKMtY1DSy+4uzjkr6EYxLSCufOs
         8B237s47jd8aCIL4jIe+nYZb7VMc/46DhvPca6EI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4JVs9L024451;
        Mon, 4 Nov 2019 13:31:54 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 4 Nov
 2019 13:31:39 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 4 Nov 2019 13:31:39 -0600
Received: from ula0869644.dal.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA4JVmd2096934;
        Mon, 4 Nov 2019 13:31:53 -0600
From:   Benoit Parrot <bparrot@ti.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benoit Parrot <bparrot@ti.com>
Subject: [Patch v2 03/20] media: ti-vpe: cal: Add per platform data support
Date:   Mon, 4 Nov 2019 13:31:23 -0600
Message-ID: <20191104193140.31145-4-bparrot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191104193140.31145-1-bparrot@ti.com>
References: <20191104193140.31145-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

First this patch adds a method to access the CTRL_CORE_CAMERRX_CONTROL
register to use the syscon mechanism. For backward compatibility we also
handle using the existing camerrx_control "reg" entry if a syscon node
is not found.

In addition the register bit layout for the CTRL_CORE_CAMERRX_CONTROL
changes depending on the device. In order to support this we need to use
a register access scheme based on data configuration instead of using
static macro.

In this case we make use of the regmap facility and create data set
based on the various device and phy available.

Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 271 +++++++++++++++++++++-------
 1 file changed, 202 insertions(+), 69 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 223161f9c403..5d807b8f0f23 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -14,6 +14,8 @@
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
 #include <linux/videodev2.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
@@ -220,20 +222,66 @@ struct cal_dmaqueue {
 	int			ini_jiffies;
 };
 
-struct cm_data {
+struct cc_data {
 	void __iomem		*base;
 	struct resource		*res;
 
-	unsigned int		camerrx_control;
-
 	struct platform_device *pdev;
 };
 
-struct cc_data {
-	void __iomem		*base;
-	struct resource		*res;
+/* CTRL_CORE_CAMERRX_CONTROL register field id */
+enum cal_camerarx_field {
+	F_CTRLCLKEN,
+	F_CAMMODE,
+	F_LANEENABLE,
+	F_CSI_MODE,
 
-	struct platform_device *pdev;
+	F_MAX_FIELDS,
+};
+
+struct cal_csi2_phy {
+	struct regmap_field *fields[F_MAX_FIELDS];
+	struct reg_field *base_fields;
+	const int num_lanes;
+};
+
+struct cal_data {
+	const int num_csi2_phy;
+	struct cal_csi2_phy *csi2_phy_core;
+
+	const unsigned int flags;
+};
+
+static struct reg_field dra72x_ctrl_core_csi0_reg_fields[F_MAX_FIELDS] = {
+	[F_CTRLCLKEN] = REG_FIELD(0, 10, 10),
+	[F_CAMMODE] = REG_FIELD(0, 11, 12),
+	[F_LANEENABLE] = REG_FIELD(0, 13, 16),
+	[F_CSI_MODE] = REG_FIELD(0, 17, 17),
+};
+
+static struct reg_field dra72x_ctrl_core_csi1_reg_fields[F_MAX_FIELDS] = {
+	[F_CTRLCLKEN] = REG_FIELD(0, 0, 0),
+	[F_CAMMODE] = REG_FIELD(0, 1, 2),
+	[F_LANEENABLE] = REG_FIELD(0, 3, 4),
+	[F_CSI_MODE] = REG_FIELD(0, 5, 5),
+};
+
+static struct cal_csi2_phy dra72x_cal_csi_phy[] = {
+	{
+		.base_fields = dra72x_ctrl_core_csi0_reg_fields,
+		.num_lanes = 4,
+	},
+	{
+		.base_fields = dra72x_ctrl_core_csi1_reg_fields,
+		.num_lanes = 2,
+	},
+};
+
+static struct cal_data dra72x_cal_data = {
+	.csi2_phy_core = dra72x_cal_csi_phy,
+	.num_csi2_phy = ARRAY_SIZE(dra72x_cal_csi_phy),
+
+	.flags = 0,
 };
 
 /*
@@ -247,8 +295,15 @@ struct cal_dev {
 	struct platform_device	*pdev;
 	struct v4l2_device	v4l2_dev;
 
+	/* Controller flags for special cases */
+	unsigned int		flags;
+
+	const struct cal_data	*data;
+
 	/* Control Module handle */
-	struct cm_data		*cm;
+	struct regmap		*syscon_camerrx;
+	u32			syscon_camerrx_offset;
+
 	/* Camera Core Module handle */
 	struct cc_data		*cc[CAL_NUM_CSI2_PORTS];
 
@@ -359,73 +414,113 @@ static inline void set_field(u32 *valp, u32 field, u32 mask)
 	*valp = val;
 }
 
-/*
- * Control Module block access
- */
-static struct cm_data *cm_create(struct cal_dev *dev)
+static u32 cal_data_get_phy_max_lanes(struct cal_ctx *ctx)
 {
-	struct platform_device *pdev = dev->pdev;
-	struct cm_data *cm;
+	struct cal_dev *dev = ctx->dev;
+	u32 phy_id = ctx->csi2_port - 1;
 
-	cm = devm_kzalloc(&pdev->dev, sizeof(*cm), GFP_KERNEL);
-	if (!cm)
-		return ERR_PTR(-ENOMEM);
+	return dev->data->csi2_phy_core[phy_id].num_lanes;
+}
+
+static u32 cal_data_get_num_csi2_phy(struct cal_dev *dev)
+{
+	return dev->data->num_csi2_phy;
+}
+
+static int cal_camerarx_regmap_init(struct cal_dev *dev)
+{
+	struct reg_field *field;
+	struct cal_csi2_phy *phy;
+	int i, j;
+
+	if (!dev->data)
+		return -EINVAL;
+
+	for (i = 0; i < cal_data_get_num_csi2_phy(dev); i++) {
+		phy = &dev->data->csi2_phy_core[i];
+		for (j = 0; j < F_MAX_FIELDS; j++) {
+			field = &phy->base_fields[j];
+			/*
+			 * Here we update the reg offset with the
+			 * value found in DT
+			 */
+			field->reg = dev->syscon_camerrx_offset;
+			phy->fields[j] =
+				devm_regmap_field_alloc(&dev->pdev->dev,
+							dev->syscon_camerrx,
+							*field);
+			if (IS_ERR(phy->fields[j])) {
+				cal_err(dev, "Unable to allocate regmap fields\n");
+				return PTR_ERR(phy->fields[j]);
+			}
+		}
+	}
+	return 0;
+}
+
+static const struct regmap_config cal_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
 
-	cm->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						"camerrx_control");
-	cm->base = devm_ioremap_resource(&pdev->dev, cm->res);
-	if (IS_ERR(cm->base)) {
+static struct regmap *cal_get_camerarx_regmap(struct cal_dev *dev)
+{
+	struct platform_device *pdev = dev->pdev;
+	struct regmap *regmap;
+	void __iomem *base;
+	u32 reg_io_width;
+	struct regmap_config r_config = cal_regmap_config;
+	struct resource *res;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+					   "camerrx_control");
+	base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(base)) {
 		cal_err(dev, "failed to ioremap\n");
-		return ERR_CAST(cm->base);
+		return ERR_CAST(base);
 	}
 
 	cal_dbg(1, dev, "ioresource %s at %pa - %pa\n",
-		cm->res->name, &cm->res->start, &cm->res->end);
+		res->name, &res->start, &res->end);
+
+	reg_io_width = 4;
+	r_config.reg_stride = reg_io_width;
+	r_config.val_bits = reg_io_width * 8;
+	r_config.max_register = resource_size(res) - reg_io_width;
 
-	return cm;
+	regmap = regmap_init_mmio(NULL, base, &r_config);
+	if (IS_ERR(regmap))
+		pr_err("regmap init failed\n");
+
+	return regmap;
 }
 
+/*
+ * Control Module CAMERARX block access
+ */
 static void camerarx_phy_enable(struct cal_ctx *ctx)
 {
-	u32 val;
-
-	if (!ctx->dev->cm->base) {
-		ctx_err(ctx, "cm not mapped\n");
-		return;
-	}
-
-	val = reg_read(ctx->dev->cm, CM_CTRL_CORE_CAMERRX_CONTROL);
-	if (ctx->csi2_port == 1) {
-		set_field(&val, 1, CM_CAMERRX_CTRL_CSI0_CTRLCLKEN_MASK);
-		set_field(&val, 0, CM_CAMERRX_CTRL_CSI0_CAMMODE_MASK);
-		/* enable all lanes by default */
-		set_field(&val, 0xf, CM_CAMERRX_CTRL_CSI0_LANEENABLE_MASK);
-		set_field(&val, 1, CM_CAMERRX_CTRL_CSI0_MODE_MASK);
-	} else if (ctx->csi2_port == 2) {
-		set_field(&val, 1, CM_CAMERRX_CTRL_CSI1_CTRLCLKEN_MASK);
-		set_field(&val, 0, CM_CAMERRX_CTRL_CSI1_CAMMODE_MASK);
-		/* enable all lanes by default */
-		set_field(&val, 0x3, CM_CAMERRX_CTRL_CSI1_LANEENABLE_MASK);
-		set_field(&val, 1, CM_CAMERRX_CTRL_CSI1_MODE_MASK);
-	}
-	reg_write(ctx->dev->cm, CM_CTRL_CORE_CAMERRX_CONTROL, val);
+	struct cal_csi2_phy *phy;
+	u32 phy_id = ctx->csi2_port - 1;
+	u32 max_lanes;
+
+	phy = &ctx->dev->data->csi2_phy_core[phy_id];
+	regmap_field_write(phy->fields[F_CAMMODE], 0);
+	/* Always enable all lanes at the phy control level */
+	max_lanes = (1 << cal_data_get_phy_max_lanes(ctx)) - 1;
+	regmap_field_write(phy->fields[F_LANEENABLE], max_lanes);
+	regmap_field_write(phy->fields[F_CSI_MODE], 1);
+	regmap_field_write(phy->fields[F_CTRLCLKEN], 1);
 }
 
 static void camerarx_phy_disable(struct cal_ctx *ctx)
 {
-	u32 val;
+	struct cal_csi2_phy *phy;
+	u32 phy_id = ctx->csi2_port - 1;
 
-	if (!ctx->dev->cm->base) {
-		ctx_err(ctx, "cm not mapped\n");
-		return;
-	}
-
-	val = reg_read(ctx->dev->cm, CM_CTRL_CORE_CAMERRX_CONTROL);
-	if (ctx->csi2_port == 1)
-		set_field(&val, 0x0, CM_CAMERRX_CTRL_CSI0_CTRLCLKEN_MASK);
-	else if (ctx->csi2_port == 2)
-		set_field(&val, 0x0, CM_CAMERRX_CTRL_CSI1_CTRLCLKEN_MASK);
-	reg_write(ctx->dev->cm, CM_CTRL_CORE_CAMERRX_CONTROL, val);
+	phy = &ctx->dev->data->csi2_phy_core[phy_id];
+	regmap_field_write(phy->fields[F_CTRLCLKEN], 0);
 }
 
 /*
@@ -508,12 +603,6 @@ static void cal_quickdump_regs(struct cal_dev *dev)
 			       resource_size(dev->ctx[1]->cc->res),
 			       false);
 	}
-
-	cal_info(dev, "CAMERRX_Control Registers @ %pa:\n",
-		 &dev->cm->res->start);
-	print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 4,
-		       (__force const void *)dev->cm->base,
-		       resource_size(dev->cm->res), false);
 }
 
 /*
@@ -1804,10 +1893,15 @@ static struct cal_ctx *cal_create_instance(struct cal_dev *dev, int inst)
 	return NULL;
 }
 
+static const struct of_device_id cal_of_match[];
+
 static int cal_probe(struct platform_device *pdev)
 {
 	struct cal_dev *dev;
 	struct cal_ctx *ctx;
+	struct device_node *parent = pdev->dev.of_node;
+	struct regmap *syscon_camerrx = NULL;
+	u32 syscon_camerrx_offset = 0;
 	int ret;
 	int irq;
 	int i;
@@ -1816,6 +1910,14 @@ static int cal_probe(struct platform_device *pdev)
 	if (!dev)
 		return -ENOMEM;
 
+	dev->data = of_device_get_match_data(&pdev->dev);
+	if (!dev->data) {
+		dev_err(&pdev->dev, "Could not get feature data based on compatible version\n");
+		return -ENODEV;
+	}
+
+	dev->flags = dev->data->flags;
+
 	/* set pseudo v4l2 device name so we can use v4l2_printk */
 	strscpy(dev->v4l2_dev.name, CAL_MODULE_NAME,
 		sizeof(dev->v4l2_dev.name));
@@ -1823,6 +1925,38 @@ static int cal_probe(struct platform_device *pdev)
 	/* save pdev pointer */
 	dev->pdev = pdev;
 
+	syscon_camerrx = syscon_regmap_lookup_by_phandle(parent,
+							 "ti,camerrx-control");
+	ret = of_property_read_u32_index(parent, "ti,camerrx-control", 1,
+					 &syscon_camerrx_offset);
+	if (IS_ERR(syscon_camerrx))
+		ret = PTR_ERR(syscon_camerrx);
+	if (ret) {
+		dev_warn(&pdev->dev, "failed to get ti,camerrx-control: %d\n",
+			 ret);
+
+		/*
+		 * Backward DTS compatibility.
+		 * If syscon entry is not present then check if the
+		 * camerrx_control resource is present.
+		 */
+		syscon_camerrx = cal_get_camerarx_regmap(dev);
+		if (IS_ERR(syscon_camerrx)) {
+			dev_err(&pdev->dev, "failed to get camerrx_control regmap\n");
+			return PTR_ERR(syscon_camerrx);
+		}
+		/* In this case the base already point to the direct
+		 * CM register so no need for an offset
+		 */
+		syscon_camerrx_offset = 0;
+	}
+
+	dev->syscon_camerrx = syscon_camerrx;
+	dev->syscon_camerrx_offset = syscon_camerrx_offset;
+	ret = cal_camerarx_regmap_init(dev);
+	if (ret)
+		return ret;
+
 	dev->res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 						"cal_top");
 	dev->base = devm_ioremap_resource(&pdev->dev, dev->res);
@@ -1841,10 +1975,6 @@ static int cal_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, dev);
 
-	dev->cm = cm_create(dev);
-	if (IS_ERR(dev->cm))
-		return PTR_ERR(dev->cm);
-
 	dev->cc[0] = cc_create(dev, 0);
 	if (IS_ERR(dev->cc[0]))
 		return PTR_ERR(dev->cc[0]);
@@ -1924,7 +2054,10 @@ static int cal_remove(struct platform_device *pdev)
 
 #if defined(CONFIG_OF)
 static const struct of_device_id cal_of_match[] = {
-	{ .compatible = "ti,dra72-cal", },
+	{
+		.compatible = "ti,dra72-cal",
+		.data = (void *)&dra72x_cal_data,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, cal_of_match);
-- 
2.17.1

