Return-Path: <linux-media+bounces-12975-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E6390484D
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 03:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F4551F24484
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 01:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E6B4A0A;
	Wed, 12 Jun 2024 01:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="q5E3+nol"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003394696;
	Wed, 12 Jun 2024 01:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718155280; cv=none; b=IYXZvoXM4847eNJT4q8Kn4mGoK40OYKXZBzwweGXR929FI5j6c0nOK9EE7T9ve6tJ8OVNyLJ/nd+Joo+L9qoHJAbrLU9bWhe07Ie76knx+Ooe0pYbUE3M0DpZB+cpHMz5TMrJsv2itKKfTGxnPdlb8b4yk1VIXQ6tzwMpfTKLho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718155280; c=relaxed/simple;
	bh=6ziPJhnVL0eAaDt37WYy4IHioawmjX1wjC/m7wI++Cg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HEfYfeTUUwDZ9ZqDSGdOtrpYuSl3oqu4XesJcIt25DCMafBbdgo9V7DyDmyraKgxGRX0Z7eYDqn/uNPE5cWCI+6z6a+mCV2IUCiNSHB4xuvrK6Y6TpTyOTGq/qmDf7iMKmlne+eTZsgqYJmq9bEL9YrUNWPRsgchZ7xbaVHxE4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=q5E3+nol; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 0b2e3e06285a11efa22eafcdcd04c131-20240612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ffRulny4vgDi0nVyFzV6vjEQL14X2dtE96SJnoGAa24=;
	b=q5E3+noltPeRyaorsBQepSSmzmEaMozzYGgM5EowOQp41UoidlHDFPyx6SpRKCGXFEFPv3U8Oqtx2svH0w4DsXLQk+5ffwj+bneItAjOgpAfFo5J2EM9D1cgoeHBZ/Vu7Efq8kCmVJQPUu+Q2GIJA9RJTGCSA49CUz3/ZmHjHRQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:0147ea96-9a05-4e9c-9b55-af8852591fc8,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:393d96e,CLOUDID:0731f984-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0b2e3e06285a11efa22eafcdcd04c131-20240612
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1080805115; Wed, 12 Jun 2024 09:21:07 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 12 Jun 2024 09:21:04 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 12 Jun 2024 09:21:03 +0800
From: Zhi Mao <zhi.mao@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Zhi Mao <zhi.mao@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Heiko Stuebner
	<heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, Alain Volmat
	<alain.volmat@foss.st.com>, Paul Elder <paul.elder@ideasonboard.com>, "Mehdi
 Djait" <mehdi.djait@bootlin.com>, Andy Shevchenko
	<andy.shevchenko@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <shengnan.wang@mediatek.com>,
	<yaya.chang@mediatek.com>, <yunkec@chromium.org>, <10572168@qq.com>
Subject: [PATCH v3 2/3] media: i2c: Add GT97xx VCM driver
Date: Wed, 12 Jun 2024 09:20:18 +0800
Message-ID: <20240612012019.19078-3-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240612012019.19078-1-zhi.mao@mediatek.com>
References: <20240612012019.19078-1-zhi.mao@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.187700-8.000000
X-TMASE-MatchedRID: AH+13/h3BteuhCBFl/b63m3NvezwBrVmK2i9pofGVSvvSbc8qoHu0V/2
	zKXxjR59dilmHfdk4Tzvl3F3WAnK8EgYkh+Pnbt/uIwLnB3Aqp2WHGENdT+VP8SiwizsgluQEXF
	HklABLo4L/rn9cjOlgV7bEojljVTyWELDcKwGO25AwvZYEy8IBQeCHewokHM/vDa284z78ydw/+
	ihHRzmFb15S5EvoJigtauPEYeMK/UWS/lqyBekk5A6S0SjvcYUO69hrW/YgWFFDR0AKGX+XLwpt
	VrHh+Adp7efYlhEjtp+WREjl9udEraFzPn1CONWbT3mGmWPpNe1X9aaML89nAAheUymmndfy8c6
	MKvt/YFGwPwv8DvB4fmpHsnYKi0GMxtmVplmiEJ1e7Xbb6Im2rqGBW9J0YqjH1bhq4z+yfQHn+R
	aCrVBsxSfg36pk/y2AnalUMYc0As6khM4kbcJpWwbuvhCHs3cfS0Ip2eEHnz3IzXlXlpamPoLR4
	+zsDTtyMdyHKes7lu2OGUOke/w9/4LRe2Jwj39kb0e1ezQRJz2KjbmbVY7bQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.187700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	5FF69B637B02E76214D4EC8258953E6ECB4BC3F86640935CC8A9F9B2E3674D952000:8
X-MTK: N

Add a V4L2 sub-device driver for Giantec GT97xx VCM.

Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
---
 drivers/media/i2c/Kconfig  |  13 ++
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/gt97xx.c | 436 +++++++++++++++++++++++++++++++++++++
 3 files changed, 450 insertions(+)
 create mode 100644 drivers/media/i2c/gt97xx.c

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 5498128773c7..9976f02575a3 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -772,6 +772,19 @@ config VIDEO_DW9807_VCM
 	  capability. This is designed for linear control of
 	  voice coil motors, controlled via I2C serial interface.
 
+config VIDEO_GT97XX
+	tristate "GT97xx lens voice coil support"
+	depends on I2C && VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_FWNODE
+	select V4L2_CCI_I2C
+	help
+	  This is a driver for the GT97xx camera lens voice coil.
+	  GT97xx is a 10 bit DAC with 100mA output current sink
+	  capability. It is designed for linear control of
+	  voice coil motors, controlled via I2C serial interface.
+
 endmenu
 
 menu "Flash devices"
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index d1403e3273ca..0009d3d6d6af 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_VIDEO_DW9807_VCM) += dw9807-vcm.o
 obj-$(CONFIG_VIDEO_ET8EK8) += et8ek8/
 obj-$(CONFIG_VIDEO_GC0308) += gc0308.o
 obj-$(CONFIG_VIDEO_GC2145) += gc2145.o
+obj-$(CONFIG_VIDEO_GT97XX) += gt97xx.o
 obj-$(CONFIG_VIDEO_HI556) += hi556.o
 obj-$(CONFIG_VIDEO_HI846) += hi846.o
 obj-$(CONFIG_VIDEO_HI847) += hi847.o
diff --git a/drivers/media/i2c/gt97xx.c b/drivers/media/i2c/gt97xx.c
new file mode 100644
index 000000000000..ccae190ffba6
--- /dev/null
+++ b/drivers/media/i2c/gt97xx.c
@@ -0,0 +1,436 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for Giantec gt97xx VCM lens device
+ *
+ * Copyright 2024 MediaTek
+ *
+ * Zhi Mao <zhi.mao@mediatek.com>
+ */
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/container_of.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/pm_runtime.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+/* gt97xx chip info register and name */
+#define GT97XX_IC_INFO_REG CCI_REG8(0x00)
+#define GT9768_ID 0xE9
+#define GT9769_ID 0xE1
+#define GT97XX_NAME "gt97xx"
+
+/*
+ * Ring control and Power control register
+ * Bit[1] RING_EN
+ * 0: Direct mode
+ * 1: AAC mode (ringing control mode)
+ * Bit[0] PD
+ * 0: Normal operation mode
+ * 1: Power down mode
+ * requires waiting time after PD reset takes place.
+ */
+#define GT97XX_RING_PD_CONTROL_REG CCI_REG8(0x02)
+#define GT97XX_PD_MODE_OFF 0x00
+#define GT97XX_PD_MODE_EN BIT(0)
+#define GT97XX_AAC_MODE_EN BIT(1)
+
+/*
+ * DAC is a 10bit address to control the VCM position.
+ * DAC_MSB: D[9:8] (ADD: 0x03)
+ * DAC_LSB: D[7:0] (ADD: 0x04)
+ */
+#define GT97XX_DAC_ADDR_REG CCI_REG16(0x03)
+
+#define GT97XX_MOVE_STEPS 16
+#define GT97XX_MAX_FOCUS_POS (BIT(10) - 1)
+
+#define GT97XX_SLEEP_US (1 * USEC_PER_MSEC)
+
+enum vcm_giantec_reg_desc {
+	GT_IC_INFO_REG,
+	GT_RING_PD_CONTROL_REG,
+	GT_DAC_ADDR_REG,
+	GT_MAX_REG
+};
+
+struct vcm_giantec_of_data {
+	unsigned int id;
+	unsigned int regs[GT_MAX_REG];
+};
+
+static const char *const gt97xx_supply_names[] = {
+	"vin",
+	"vdd",
+};
+
+/* gt97xx device structure */
+struct gt97xx {
+	struct v4l2_subdev sd;
+
+	struct regulator_bulk_data supplies[ARRAY_SIZE(gt97xx_supply_names)];
+
+	struct v4l2_ctrl_handler ctrls;
+	struct v4l2_ctrl *focus;
+
+	struct regmap *regmap;
+
+	const struct vcm_giantec_of_data *chip;
+};
+
+static inline struct gt97xx *sd_to_gt97xx(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct gt97xx, sd);
+}
+
+struct regval_list {
+	u8 reg_num;
+	u8 value;
+};
+
+static int gt97xx_set_dac(struct gt97xx *gt97xx, u16 val)
+{
+	/* Write VCM position to registers */
+	return cci_write(gt97xx->regmap,
+			 gt97xx->chip->regs[GT_DAC_ADDR_REG], val, NULL);
+}
+
+static int gt97xx_identify_module(struct gt97xx *gt97xx)
+{
+	int ret;
+	u64 ic_id;
+	struct i2c_client *client = v4l2_get_subdevdata(&gt97xx->sd);
+
+	ret = cci_read(gt97xx->regmap, gt97xx->chip->regs[GT_IC_INFO_REG],
+		       &ic_id, NULL);
+	if (ret < 0)
+		return ret;
+
+	if (ic_id != gt97xx->chip->id) {
+		dev_err(&client->dev, "chip id mismatch: 0x%x!=0x%llx",
+			gt97xx->chip->id, ic_id);
+		return -1;
+	}
+
+	return 0;
+}
+
+static int gt97xx_init(struct gt97xx *gt97xx)
+{
+	int ret, val;
+
+	ret = gt97xx_identify_module(gt97xx);
+	if (ret < 0)
+		return ret;
+
+	/* Reset PD_CONTROL */
+	ret = cci_write(gt97xx->regmap,
+			gt97xx->chip->regs[GT_RING_PD_CONTROL_REG],
+			GT97XX_PD_MODE_OFF, NULL);
+	if (ret < 0)
+		return ret;
+
+	/* Need waiting delay time after PD reset */
+	fsleep(GT97XX_SLEEP_US);
+
+	/* Enable ACC mode */
+	ret = cci_write(gt97xx->regmap,
+			gt97xx->chip->regs[GT_RING_PD_CONTROL_REG],
+			GT97XX_AAC_MODE_EN, NULL);
+	if (ret < 0)
+		return ret;
+
+	for (val = gt97xx->focus->val % GT97XX_MOVE_STEPS;
+	     val <= gt97xx->focus->val; val += GT97XX_MOVE_STEPS) {
+		ret = gt97xx_set_dac(gt97xx, val);
+		if (ret)
+			return ret;
+
+		fsleep(GT97XX_SLEEP_US);
+	}
+
+	return 0;
+}
+
+static int gt97xx_release(struct gt97xx *gt97xx)
+{
+	int ret, val;
+
+	val = round_down(gt97xx->focus->val, GT97XX_MOVE_STEPS);
+	for (; val >= 0; val -= GT97XX_MOVE_STEPS) {
+		ret = gt97xx_set_dac(gt97xx, val);
+		if (ret)
+			return ret;
+
+		fsleep(GT97XX_SLEEP_US);
+	}
+
+	return 0;
+}
+
+static int gt97xx_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct gt97xx *gt97xx = sd_to_gt97xx(sd);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(gt97xx_supply_names),
+				    gt97xx->supplies);
+	if (ret < 0)
+		dev_err(dev, "failed to enable regulators\n");
+
+	return ret;
+}
+
+static int gt97xx_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct gt97xx *gt97xx = sd_to_gt97xx(sd);
+	int ret;
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(gt97xx_supply_names),
+				     gt97xx->supplies);
+	if (ret < 0)
+		dev_err(dev, "failed to disable regulators\n");
+
+	return ret;
+}
+
+static int gt97xx_runtime_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct gt97xx *gt97xx = sd_to_gt97xx(sd);
+
+	gt97xx_release(gt97xx);
+	gt97xx_power_off(dev);
+
+	return 0;
+}
+
+static int gt97xx_runtime_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct gt97xx *gt97xx = sd_to_gt97xx(sd);
+	int ret;
+
+	ret = gt97xx_power_on(dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to power_on\n");
+		return ret;
+	}
+
+	/* Need waited before sending I2C commands after power-up */
+	fsleep(GT97XX_SLEEP_US);
+
+	ret = gt97xx_init(gt97xx);
+	if (ret < 0)
+		goto disable_power;
+
+	return 0;
+
+disable_power:
+	gt97xx_power_off(dev);
+
+	return ret;
+}
+
+static int gt97xx_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct gt97xx *gt97xx =
+		container_of(ctrl->handler, struct gt97xx, ctrls);
+
+	if (ctrl->id == V4L2_CID_FOCUS_ABSOLUTE)
+		return gt97xx_set_dac(gt97xx, ctrl->val);
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops gt97xx_ctrl_ops = {
+	.s_ctrl = gt97xx_set_ctrl,
+};
+
+static int gt97xx_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	return pm_runtime_resume_and_get(sd->dev);
+}
+
+static int gt97xx_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	return pm_runtime_put(sd->dev);
+}
+
+static const struct v4l2_subdev_internal_ops gt97xx_int_ops = {
+	.open = gt97xx_open,
+	.close = gt97xx_close,
+};
+
+static const struct v4l2_subdev_core_ops gt97xx_core_ops = {
+	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
+	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_ops gt97xx_ops = {
+	.core = &gt97xx_core_ops,
+};
+
+static int gt97xx_init_controls(struct gt97xx *gt97xx)
+{
+	struct v4l2_ctrl_handler *hdl = &gt97xx->ctrls;
+	const struct v4l2_ctrl_ops *ops = &gt97xx_ctrl_ops;
+
+	v4l2_ctrl_handler_init(hdl, 1);
+
+	gt97xx->focus = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FOCUS_ABSOLUTE, 0,
+					  GT97XX_MAX_FOCUS_POS,
+					  1, 0);
+
+	if (hdl->error)
+		return hdl->error;
+
+	gt97xx->sd.ctrl_handler = hdl;
+
+	return 0;
+}
+
+static int gt97xx_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct gt97xx *gt97xx;
+	unsigned int i;
+	int ret;
+
+	gt97xx = devm_kzalloc(dev, sizeof(*gt97xx), GFP_KERNEL);
+	if (!gt97xx)
+		return -ENOMEM;
+
+	gt97xx->regmap = devm_cci_regmap_init_i2c(client, 8);
+	if (IS_ERR(gt97xx->regmap))
+		return dev_err_probe(dev, PTR_ERR(gt97xx->regmap),
+				     "failed to init CCI\n");
+
+	/* Initialize subdev */
+	v4l2_i2c_subdev_init(&gt97xx->sd, client, &gt97xx_ops);
+
+	gt97xx->chip = device_get_match_data(dev);
+
+	for (i = 0; i < ARRAY_SIZE(gt97xx_supply_names); i++)
+		gt97xx->supplies[i].supply = gt97xx_supply_names[i];
+
+	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(gt97xx_supply_names),
+				      gt97xx->supplies);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "failed to get regulators\n");
+
+	/* Initialize controls */
+	ret = gt97xx_init_controls(gt97xx);
+	if (ret)
+		goto err_free_handler;
+
+	/* Initialize subdev */
+	gt97xx->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	gt97xx->sd.internal_ops = &gt97xx_int_ops;
+	gt97xx->sd.entity.function = MEDIA_ENT_F_LENS;
+
+	ret = media_entity_pads_init(&gt97xx->sd.entity, 0, NULL);
+	if (ret < 0)
+		goto err_free_handler;
+
+	/* Power on and initialize hardware */
+	ret = gt97xx_runtime_resume(dev);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "failed to power on\n");
+		goto err_clean_entity;
+	}
+
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_idle(dev);
+
+	ret = v4l2_async_register_subdev(&gt97xx->sd);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "failed to register V4L2 subdev\n");
+		goto err_power_off;
+	}
+
+	return 0;
+
+err_power_off:
+	pm_runtime_disable(dev);
+err_clean_entity:
+	media_entity_cleanup(&gt97xx->sd.entity);
+err_free_handler:
+	v4l2_ctrl_handler_free(&gt97xx->ctrls);
+
+	return ret;
+}
+
+static void gt97xx_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct gt97xx *gt97xx = sd_to_gt97xx(sd);
+
+	v4l2_async_unregister_subdev(&gt97xx->sd);
+	v4l2_ctrl_handler_free(&gt97xx->ctrls);
+	media_entity_cleanup(&gt97xx->sd.entity);
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		gt97xx_runtime_suspend(&client->dev);
+	pm_runtime_set_suspended(&client->dev);
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(gt97xx_pm_ops,
+				 gt97xx_runtime_suspend,
+				 gt97xx_runtime_resume,
+				 NULL);
+
+static const struct vcm_giantec_of_data gt9768_data = {
+	.id = GT9768_ID,
+	.regs[GT_IC_INFO_REG] = GT97XX_IC_INFO_REG,
+	.regs[GT_RING_PD_CONTROL_REG] = GT97XX_RING_PD_CONTROL_REG,
+	.regs[GT_DAC_ADDR_REG] = GT97XX_DAC_ADDR_REG,
+};
+
+static const struct vcm_giantec_of_data gt9769_data = {
+	.id = GT9769_ID,
+	.regs[GT_IC_INFO_REG] = GT97XX_IC_INFO_REG,
+	.regs[GT_RING_PD_CONTROL_REG] = GT97XX_RING_PD_CONTROL_REG,
+	.regs[GT_DAC_ADDR_REG] = GT97XX_DAC_ADDR_REG,
+};
+
+static const struct of_device_id gt97xx_of_table[] = {
+	{ .compatible = "giantec,gt9768", .data = &gt9768_data },
+	{ .compatible = "giantec,gt9769", .data = &gt9769_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, gt97xx_of_table);
+
+static struct i2c_driver gt97xx_i2c_driver = {
+	.driver = {
+		.name = GT97XX_NAME,
+		.pm = pm_ptr(&gt97xx_pm_ops),
+		.of_match_table = gt97xx_of_table,
+	},
+	.probe = gt97xx_probe,
+	.remove = gt97xx_remove,
+};
+module_i2c_driver(gt97xx_i2c_driver);
+
+MODULE_AUTHOR("Zhi Mao <zhi.mao@mediatek.com>");
+MODULE_DESCRIPTION("GT97xx VCM driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


