Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 652C6A9BA6
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 09:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731951AbfIEHWJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 03:22:09 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:39472 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730778AbfIEHWJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 03:22:09 -0400
X-UUID: a9710492a62f4a8fb75fdeab93f96c7c-20190905
X-UUID: a9710492a62f4a8fb75fdeab93f96c7c-20190905
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 684319468; Thu, 05 Sep 2019 15:22:01 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Sep 2019 15:21:58 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 5 Sep 2019 15:21:57 +0800
From:   <dongchun.zhu@mediatek.com>
To:     <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <sakari.ailus@linux.intel.com>, <drinkcat@chromium.org>,
        <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
        <bingbu.cao@intel.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <sam.hung@mediatek.com>, <shengnan.wang@mediatek.com>,
        <dongchun.zhu@mediatek.com>
Subject: [V2, 2/2] media: i2c: Add DW9768 VCM driver
Date:   Thu, 5 Sep 2019 15:21:42 +0800
Message-ID: <20190905072142.14606-3-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20190905072142.14606-1-dongchun.zhu@mediatek.com>
References: <20190905072142.14606-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dongchun Zhu <dongchun.zhu@mediatek.com>

This patch adds a V4L2 sub-device driver for DW9768 lens voice coil,
and provides control to set the desired focus.

The DW9768 is a 10 bit DAC with 100mA output current sink capability
from Dongwoon, designed for linear control of voice coil motor,
and controlled via I2C serial interface.

Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
---
 MAINTAINERS                |   1 +
 drivers/media/i2c/Kconfig  |  10 ++
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/dw9768.c | 349 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 361 insertions(+)
 create mode 100644 drivers/media/i2c/dw9768.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 192a671..c5c9a0e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4976,6 +4976,7 @@ M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
 L:	linux-media@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
+F:	drivers/media/i2c/dw9768.c
 F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.txt
 
 DONGWOON DW9807 LENS VOICE COIL DRIVER
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 79ce9ec..dfb665c 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1016,6 +1016,16 @@ config VIDEO_DW9714
 	  capability. This is designed for linear control of
 	  voice coil motors, controlled via I2C serial interface.
 
+config VIDEO_DW9768
+	tristate "DW9768 lens voice coil support"
+	depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
+	depends on VIDEO_V4L2_SUBDEV_API
+	help
+	  This is a driver for the DW9768 camera lens voice coil.
+	  DW9768 is a 10 bit DAC with 100mA output current sink
+	  capability. This is designed for linear control of
+	  voice coil motors, controlled via I2C serial interface.
+
 config VIDEO_DW9807_VCM
 	tristate "DW9807 lens voice coil support"
 	depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index fd4ea86..2561239 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_VIDEO_SAA6752HS) += saa6752hs.o
 obj-$(CONFIG_VIDEO_AD5820)  += ad5820.o
 obj-$(CONFIG_VIDEO_AK7375)  += ak7375.o
 obj-$(CONFIG_VIDEO_DW9714)  += dw9714.o
+obj-$(CONFIG_VIDEO_DW9768)  += dw9768.o
 obj-$(CONFIG_VIDEO_DW9807_VCM)  += dw9807-vcm.o
 obj-$(CONFIG_VIDEO_ADV7170) += adv7170.o
 obj-$(CONFIG_VIDEO_ADV7175) += adv7175.o
diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
new file mode 100644
index 0000000..66d1712
--- /dev/null
+++ b/drivers/media/i2c/dw9768.c
@@ -0,0 +1,349 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019 MediaTek Inc.
+
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+#include <linux/pm_runtime.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-subdev.h>
+
+#define DW9768_NAME				"dw9768"
+#define DW9768_MAX_FOCUS_POS			1023
+/*
+ * This sets the minimum granularity for the focus positions.
+ * A value of 1 gives maximum accuracy for a desired focus position
+ */
+#define DW9768_FOCUS_STEPS			1
+/*
+ * DW9768 separates two registers to control the VCM position.
+ * One for MSB value, another is LSB value.
+ */
+#define DW9768_REG_MASK_MSB			0x03
+#define DW9768_REG_MASK_LSB			0xff
+#define DW9768_SET_POSITION_ADDR                0x03
+
+#define DW9768_CMD_DELAY			0xff
+#define DW9768_CTRL_DELAY_US			5000
+
+#define DW9768_DAC_SHIFT			8
+
+/* dw9768 device structure */
+struct dw9768 {
+	struct v4l2_ctrl_handler ctrls;
+	struct v4l2_subdev sd;
+	struct regulator *vin;
+	struct regulator *vdd;
+};
+
+static inline struct dw9768 *to_dw9768_vcm(struct v4l2_ctrl *ctrl)
+{
+	return container_of(ctrl->handler, struct dw9768, ctrls);
+}
+
+static inline struct dw9768 *sd_to_dw9768_vcm(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct dw9768, sd);
+}
+
+struct regval_list {
+	unsigned char reg_num;
+	unsigned char value;
+};
+
+static struct regval_list dw9768_init_regs[] = {
+	{0x02, 0x02},
+	{DW9768_CMD_DELAY, DW9768_CMD_DELAY},
+	{0x06, 0x41},
+	{0x07, 0x39},
+	{DW9768_CMD_DELAY, DW9768_CMD_DELAY},
+};
+
+static struct regval_list dw9768_release_regs[] = {
+	{0x02, 0x00},
+	{DW9768_CMD_DELAY, DW9768_CMD_DELAY},
+	{0x01, 0x00},
+	{DW9768_CMD_DELAY, DW9768_CMD_DELAY},
+};
+
+static int dw9768_write_smbus(struct dw9768 *dw9768, unsigned char reg,
+			      unsigned char value)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
+	int ret;
+
+	if (reg == DW9768_CMD_DELAY  && value == DW9768_CMD_DELAY)
+		usleep_range(DW9768_CTRL_DELAY_US,
+			     DW9768_CTRL_DELAY_US + 100);
+	else
+		ret = i2c_smbus_write_byte_data(client, reg, value);
+	return ret;
+}
+
+static int dw9768_write_array(struct dw9768 *dw9768, struct regval_list *vals,
+			      u32 len)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < len; i++) {
+		ret = dw9768_write_smbus(dw9768, vals->reg_num, vals->value);
+		if (ret < 0)
+			return ret;
+	}
+	return 0;
+}
+
+static int dw9768_set_position(struct dw9768 *dw9768, u16 val)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
+	u8 addr[2];
+
+	addr[0] = (val >> DW9768_DAC_SHIFT) & DW9768_REG_MASK_MSB;
+	addr[1] = val & DW9768_REG_MASK_LSB;
+
+	return i2c_smbus_write_block_data(client, DW9768_SET_POSITION_ADDR,
+					  ARRAY_SIZE(addr), addr);
+}
+
+static int dw9768_release(struct dw9768 *dw9768)
+{
+	return dw9768_write_array(dw9768, dw9768_release_regs,
+				  ARRAY_SIZE(dw9768_release_regs));
+}
+
+static int dw9768_init(struct dw9768 *dw9768)
+{
+	return dw9768_write_array(dw9768, dw9768_init_regs,
+				  ARRAY_SIZE(dw9768_init_regs));
+}
+
+/* Power handling */
+static int dw9768_power_off(struct dw9768 *dw9768)
+{
+	struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
+	int ret;
+
+	ret = dw9768_release(dw9768);
+	if (ret)
+		dev_err(&client->dev, "dw9768 release failed!\n");
+
+	ret = regulator_disable(dw9768->vin);
+	if (ret)
+		return ret;
+
+	return regulator_disable(dw9768->vdd);
+}
+
+static int dw9768_power_on(struct dw9768 *dw9768)
+{
+	int ret;
+
+	ret = regulator_enable(dw9768->vin);
+	if (ret < 0)
+		return ret;
+
+	ret = regulator_enable(dw9768->vdd);
+	if (ret < 0)
+		return ret;
+
+	ret = dw9768_init(dw9768);
+	if (ret < 0)
+		goto fail;
+
+	return 0;
+
+fail:
+	regulator_disable(dw9768->vin);
+	regulator_disable(dw9768->vdd);
+
+	return ret;
+}
+
+static int dw9768_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct dw9768 *dw9768 = to_dw9768_vcm(ctrl);
+
+	if (ctrl->id == V4L2_CID_FOCUS_ABSOLUTE)
+		return dw9768_set_position(dw9768, ctrl->val);
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops dw9768_vcm_ctrl_ops = {
+	.s_ctrl = dw9768_set_ctrl,
+};
+
+static int dw9768_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	int ret;
+
+	ret = pm_runtime_get_sync(sd->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(sd->dev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dw9768_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	pm_runtime_put(sd->dev);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_internal_ops dw9768_int_ops = {
+	.open = dw9768_open,
+	.close = dw9768_close,
+};
+
+static const struct v4l2_subdev_ops dw9768_ops = { };
+
+static void dw9768_subdev_cleanup(struct dw9768 *dw9768)
+{
+	v4l2_async_unregister_subdev(&dw9768->sd);
+	v4l2_ctrl_handler_free(&dw9768->ctrls);
+	media_entity_cleanup(&dw9768->sd.entity);
+}
+
+static int dw9768_init_controls(struct dw9768 *dw9768)
+{
+	struct v4l2_ctrl_handler *hdl = &dw9768->ctrls;
+	const struct v4l2_ctrl_ops *ops = &dw9768_vcm_ctrl_ops;
+
+	v4l2_ctrl_handler_init(hdl, 1);
+
+	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FOCUS_ABSOLUTE,
+			  0, DW9768_MAX_FOCUS_POS, DW9768_FOCUS_STEPS, 0);
+
+	if (hdl->error)
+		return hdl->error;
+
+	dw9768->sd.ctrl_handler = hdl;
+
+	return 0;
+}
+
+static int dw9768_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct dw9768 *dw9768;
+	int ret;
+
+	dw9768 = devm_kzalloc(dev, sizeof(*dw9768), GFP_KERNEL);
+	if (!dw9768)
+		return -ENOMEM;
+
+	dw9768->vin = devm_regulator_get(dev, "vin");
+	if (IS_ERR(dw9768->vin)) {
+		ret = PTR_ERR(dw9768->vin);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "cannot get vin regulator\n");
+		return ret;
+	}
+
+	dw9768->vdd = devm_regulator_get(dev, "vdd");
+	if (IS_ERR(dw9768->vdd)) {
+		ret = PTR_ERR(dw9768->vdd);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "cannot get vdd regulator\n");
+		return ret;
+	}
+
+	v4l2_i2c_subdev_init(&dw9768->sd, client, &dw9768_ops);
+	dw9768->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	dw9768->sd.internal_ops = &dw9768_int_ops;
+
+	ret = dw9768_init_controls(dw9768);
+	if (ret)
+		goto err_cleanup;
+
+	ret = media_entity_pads_init(&dw9768->sd.entity, 0, NULL);
+	if (ret < 0)
+		goto err_cleanup;
+
+	dw9768->sd.entity.function = MEDIA_ENT_F_LENS;
+
+	ret = v4l2_async_register_subdev(&dw9768->sd);
+	if (ret < 0)
+		goto err_cleanup;
+
+	pm_runtime_enable(dev);
+
+	return 0;
+
+err_cleanup:
+	dw9768_subdev_cleanup(dw9768);
+	return ret;
+}
+
+static int dw9768_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct dw9768 *dw9768 = sd_to_dw9768_vcm(sd);
+
+	dw9768_subdev_cleanup(dw9768);
+	pm_runtime_disable(&client->dev);
+	if (!pm_runtime_status_suspended(&client->dev))
+		dw9768_power_off(dw9768);
+	pm_runtime_set_suspended(&client->dev);
+
+	return 0;
+}
+
+static int __maybe_unused dw9768_vcm_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct dw9768 *dw9768 = sd_to_dw9768_vcm(sd);
+
+	return dw9768_power_off(dw9768);
+}
+
+static int __maybe_unused dw9768_vcm_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct dw9768 *dw9768 = sd_to_dw9768_vcm(sd);
+
+	return dw9768_power_on(dw9768);
+}
+
+static const struct i2c_device_id dw9768_id_table[] = {
+	{ DW9768_NAME, 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, dw9768_id_table);
+
+static const struct of_device_id dw9768_of_table[] = {
+	{ .compatible = "dongwoon,dw9768" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, dw9768_of_table);
+
+static const struct dev_pm_ops dw9768_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+	SET_RUNTIME_PM_OPS(dw9768_vcm_suspend, dw9768_vcm_resume, NULL)
+};
+
+static struct i2c_driver dw9768_i2c_driver = {
+	.driver = {
+		.name = DW9768_NAME,
+		.pm = &dw9768_pm_ops,
+		.of_match_table = dw9768_of_table,
+	},
+	.probe_new  = dw9768_probe,
+	.remove = dw9768_remove,
+	.id_table = dw9768_id_table,
+};
+
+module_i2c_driver(dw9768_i2c_driver);
+
+MODULE_AUTHOR("Dongchun Zhu <dongchun.zhu@mediatek.com>");
+MODULE_DESCRIPTION("DW9768 VCM driver");
+MODULE_LICENSE("GPL v2");
-- 
2.9.2

