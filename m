Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7013281421
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 15:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387777AbgJBNgU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 09:36:20 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:40402 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726090AbgJBNgU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Oct 2020 09:36:20 -0400
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 092DU2ct005614;
        Fri, 2 Oct 2020 09:36:06 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com with ESMTP id 33syg6ehb2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 02 Oct 2020 09:36:05 -0400
Received: from SCSQMBX10.ad.analog.com (scsqmbx10.ad.analog.com [10.77.17.5])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 092Da24Y013361
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
        Fri, 2 Oct 2020 09:36:03 -0400
Received: from SCSQMBX10.ad.analog.com (10.77.17.5) by SCSQMBX10.ad.analog.com
 (10.77.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Fri, 2 Oct 2020
 06:35:51 -0700
Received: from zeus.spd.analog.com (10.66.68.11) by SCSQMBX10.ad.analog.com
 (10.77.17.5) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Fri, 2 Oct 2020 06:35:51 -0700
Received: from btogorean-pc.ad.analog.com ([10.48.65.113])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 092DZks4022245;
        Fri, 2 Oct 2020 09:35:48 -0400
From:   Bogdan Togorean <bogdan.togorean@analog.com>
To:     <linux-media@vger.kernel.org>
CC:     Bogdan Togorean <bogdan.togorean@analog.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Shawn Tu <shawnx.tu@intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] media: i2c: Add driver for the Analog Devices ADDI9036 ToF front-end
Date:   Fri, 2 Oct 2020 16:35:16 +0300
Message-ID: <20201002133537.172379-1-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ADIRoutedOnPrem: True
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-02_06:2020-10-02,2020-10-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 mlxscore=0 clxscore=1011 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010020105
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ADDI9036 is a complete, 45 MHz, front-end solution for charge
coupled device (CCD) time of flight (TOF) imaging applications.

It has 2-lane MIPI CSI-2 RAW12 data output and i2c control interface.

The programming of calibration and firmware is performed by driver
using Linux Firmware API.

Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
---

v2: implemented reading of FW using Linux Firmware API
    removed custom controls for FW programming
    added custom control to select operating mode
    implemented V1 review remarks
    cleaned includes list
---
 MAINTAINERS                        |  10 +
 drivers/media/i2c/Kconfig          |  14 +
 drivers/media/i2c/Makefile         |   1 +
 drivers/media/i2c/addi9036.c       | 754 +++++++++++++++++++++++++++++
 include/uapi/linux/v4l2-controls.h |   6 +
 5 files changed, 785 insertions(+)
 create mode 100644 drivers/media/i2c/addi9036.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0d0862b19ce5..4e3878e6c0ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -477,6 +477,16 @@ W:	http://wiki.analog.com/AD7879
 W:	http://ez.analog.com/community/linux-device-drivers
 F:	drivers/input/touchscreen/ad7879.c
 
+ADDI9036 TOF FRONTEND DRIVER
+M:	Bogdan Togorean <bogdan.togorean@analog.com>
+L:	linux-media@vger.kernel.org
+S:	Supported
+W:	https://www.analog.com/en/products/addi9036.html
+W:	http://ez.analog.com/community/linux-device-drivers
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml
+F:	drivers/media/i2c/addi9036.c
+
 ADDRESS SPACE LAYOUT RANDOMIZATION (ASLR)
 M:	Jiri Kosina <jikos@kernel.org>
 S:	Maintained
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index c7ba76fee599..087dd307505d 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -725,6 +725,20 @@ config VIDEO_APTINA_PLL
 config VIDEO_SMIAPP_PLL
 	tristate
 
+config VIDEO_ADDI9036
+	tristate "Analog Devices ADDI9036 ToF front-end support"
+	depends on I2C && VIDEO_V4L2
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select V4L2_FWNODE
+	select REGMAP_I2C
+	help
+	  This is a Video4Linux2 driver for Analog Devices ADDI9036
+	  Time of Flight front-end.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called addi9036.
+
 config VIDEO_HI556
 	tristate "Hynix Hi-556 sensor support"
 	depends on I2C && VIDEO_V4L2
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index f0a77473979d..631a7c7612ca 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_VIDEO_AK7375)  += ak7375.o
 obj-$(CONFIG_VIDEO_DW9714)  += dw9714.o
 obj-$(CONFIG_VIDEO_DW9768)  += dw9768.o
 obj-$(CONFIG_VIDEO_DW9807_VCM)  += dw9807-vcm.o
+obj-$(CONFIG_VIDEO_ADDI9036) += addi9036.o
 obj-$(CONFIG_VIDEO_ADV7170) += adv7170.o
 obj-$(CONFIG_VIDEO_ADV7175) += adv7175.o
 obj-$(CONFIG_VIDEO_ADV7180) += adv7180.o
diff --git a/drivers/media/i2c/addi9036.c b/drivers/media/i2c/addi9036.c
new file mode 100644
index 000000000000..e38e70afd23d
--- /dev/null
+++ b/drivers/media/i2c/addi9036.c
@@ -0,0 +1,754 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for the Analog Devices ADDI9036 ToF camera sensor.
+ *
+ * Copyright (C) 2019-2020 Analog Devices, All Rights Reserved.
+ *
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/firmware.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+#define FW_FILE_NAME	"adi/addi9036-fw.bin"
+#define ADDI_MAGIC	"ADDI9036"
+
+struct addi9036_mode_info {
+	u32 width;
+	u32 height;
+	u32 pixel_rate;
+	u32 link_freq_idx;
+};
+
+struct addi9036_mode_fw_block {
+	const struct reg_sequence *mode_regs;
+	ssize_t regs_count;
+};
+
+struct addi9036_fw_header {
+	unsigned char magic[8];
+	__le32 modes_nr;
+} __packed;
+
+struct addi9036_mode_block {
+	__le32 mode_id;
+	__le32 size_bytes;
+	__le16 data[];
+} __packed;
+
+struct addi9036 {
+	struct regmap *regmap;
+	struct device *dev;
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct v4l2_fwnode_endpoint ep;
+	struct v4l2_mbus_framefmt fmt;
+	struct v4l2_rect crop;
+
+	const struct addi9036_mode_info *current_mode;
+
+	struct v4l2_ctrl_handler ctrls;
+	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *link_freq;
+	/* custom controls */
+	struct v4l2_ctrl *set_operating_range;
+
+	/* lock to protect power state */
+	struct mutex power_lock;
+	int power_count;
+	bool streaming;
+
+	struct gpio_desc *rst_gpio;
+
+	/* firmware blocks for each operating mode */
+	struct addi9036_mode_fw_block *mode_fw_blocks;
+	u8 curr_operating_mode;
+
+	const struct firmware *fw;
+};
+
+static inline struct addi9036 *to_addi9036(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct addi9036, sd);
+}
+
+#define V4L2_CID_ADDI9036_OPERATING_MODE  (V4L2_CID_USER_ADDI9036_BASE + 0)
+
+static const struct reg_sequence addi9036_powerup_setting[] = {
+	{ 0xc4c0, 0x001c },
+	{ 0xc4c3, 0x001c },
+	{ 0xc4d7, 0x0000 },
+	{ 0xc4d5, 0x0002 },
+	{ 0xc4da, 0x0001 },
+	{ 0xc4f0, 0x0000 },
+	{ 0xc427, 0x0003 },
+	{ 0xc427, 0x0001 },
+	{ 0xc427, 0x0000 },
+	{ 0xc426, 0x0030 },
+	{ 0xc426, 0x0010 },
+	{ 0xc426, 0x0000 },
+	{ 0xc423, 0x0080 },
+	{ 0xc431, 0x0080 },
+	{ 0x4001, 0x0007 },
+	{ 0x7c22, 0x0004 }
+};
+
+static const struct reg_sequence addi9036_powerdown_setting[] = {
+	{ 0xc022, 0x0001 },
+	{ 0x4001, 0x0006 },
+	{ 0x7c22, 0x0004 },
+	{ 0xc431, 0x0082 },
+	{ 0xc423, 0x0000 },
+	{ 0xc426, 0x0020 },
+	{ 0xc427, 0x0002 },
+	{ 0xc4c0, 0x003c },
+	{ 0xc4c3, 0x003c },
+	{ 0xc4d5, 0x0003 },
+	{ 0xc4da, 0x0000 },
+	{ 0xc4d7, 0x0001 },
+	{ 0xc4f0, 0x0001 }
+};
+
+static const s64 link_freq_tbl[] = {
+	110529000,
+	221184000,
+};
+
+/* Elements of the structure must be ordered ascending by width & height */
+static const struct addi9036_mode_info addi9036_mode_info_data[] = {
+	{
+		.width = 640,
+		.height = 480,
+		.pixel_rate = 36864000,
+		.link_freq_idx = 0 /* an index in link_freq_tbl[] */
+	},
+	{
+		.width = 640,
+		.height = 960,
+		.pixel_rate = 73728000,
+		.link_freq_idx = 1 /* an index in link_freq_tbl[] */
+	},
+};
+
+static bool addi9306_readable_register(struct device *dev, unsigned int reg)
+{
+	if (((reg >= 0x4000) && (reg <= 0x6fff)) ||
+	    ((reg >= 0x7c00) && (reg <= 0x7fff)) ||
+	    ((reg >= 0xc000) && (reg <= 0xc200)) ||
+	    ((reg >= 0xc300) && (reg <= 0xc6bf)))
+		return true;
+	else
+		return false;
+}
+
+static bool addi9306_writeable_register(struct device *dev, unsigned int reg)
+{
+	if (((reg >= 0x4000) && (reg <= 0x6fff)) ||
+	    ((reg >= 0x7c00) && (reg <= 0x7fff)) ||
+	    ((reg >= 0xc000) && (reg <= 0xc113)) ||
+	    ((reg >= 0xc300) && (reg <= 0xc7ff)))
+		return true;
+	else
+		return false;
+}
+
+static const struct regmap_config addi9036_i2c_regmap_config = {
+	.reg_bits = 16,
+	.val_bits = 16,
+	.max_register = 0xc7ff,
+	.writeable_reg = addi9306_writeable_register,
+	.readable_reg = addi9306_readable_register,
+	.cache_type = REGCACHE_NONE,
+};
+
+static int addi9036_set_power_on(struct addi9036 *addi9036)
+{
+	int ret;
+
+	if (addi9036->rst_gpio)
+		gpiod_set_value_cansleep(addi9036->rst_gpio, 0);
+
+	ret = regmap_register_patch(addi9036->regmap, addi9036_powerup_setting,
+				    ARRAY_SIZE(addi9036_powerup_setting));
+	if (ret)
+		dev_err(addi9036->dev, "Could not set power up registers\n");
+
+	return ret;
+}
+
+static int addi9036_set_power_off(struct addi9036 *addi9036)
+{
+	int ret;
+
+	ret = regmap_register_patch(addi9036->regmap,
+				    addi9036_powerdown_setting,
+				    ARRAY_SIZE(addi9036_powerdown_setting));
+	if (ret)
+		dev_err(addi9036->dev, "could not set power down registers\n");
+
+	if (addi9036->rst_gpio)
+		gpiod_set_value_cansleep(addi9036->rst_gpio, 1);
+
+	return ret;
+}
+
+static int addi9036_s_power(struct v4l2_subdev *sd, int on)
+{
+	struct addi9036 *addi9036 = to_addi9036(sd);
+	int ret = 0;
+
+	dev_dbg(addi9036->dev, "s_power: %d\n", on);
+
+	mutex_lock(&addi9036->power_lock);
+
+	/* If the power count is modified from 0 to != 0 or from != 0 to 0,
+	 * update the power state.
+	 */
+	if (addi9036->power_count == !on) {
+		if (on)
+			ret = addi9036_set_power_on(addi9036);
+		else
+			ret = addi9036_set_power_off(addi9036);
+	}
+
+	if (!ret) {
+		/* Update the power count. */
+		addi9036->power_count += on ? 1 : -1;
+		WARN(addi9036->power_count < 0, "Unbalanced power count\n");
+		WARN(addi9036->power_count > 1, "Duplicated s_power call\n");
+	}
+
+	mutex_unlock(&addi9036->power_lock);
+
+	return ret;
+}
+
+#ifdef CONFIG_VIDEO_ADV_DEBUG
+static int addi9036_g_register(struct v4l2_subdev *sd,
+			       struct v4l2_dbg_register *reg)
+{
+	struct addi9036 *addi9036 = to_addi9036(sd);
+	unsigned int read_val;
+	int ret;
+
+	reg->size = 2;
+	ret = regmap_read(addi9036->regmap, reg->reg, &read_val);
+	reg->val = read_val;
+
+	return ret;
+}
+
+static int addi9036_s_register(struct v4l2_subdev *sd,
+			       const struct v4l2_dbg_register *reg)
+{
+	struct addi9036 *addi9036 = to_addi9036(sd);
+
+	return regmap_write(addi9036->regmap, reg->reg, reg->val);
+}
+#endif
+
+static int addi9036_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct addi9036 *addi9036 = container_of(ctrl->handler,
+						 struct addi9036, ctrls);
+	int ret = 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_ADDI9036_OPERATING_MODE:
+		addi9036->curr_operating_mode = ctrl->val;
+		break;
+	case V4L2_CID_PIXEL_RATE:
+	case V4L2_CID_LINK_FREQ:
+		break;
+	default:
+		dev_err(addi9036->dev, "%s > Unhandled: %x  param=%x\n",
+			__func__, ctrl->id, ctrl->val);
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops addi9036_ctrl_ops = {
+	.s_ctrl = addi9036_s_ctrl,
+};
+
+static const struct v4l2_ctrl_config addi9036_ctrl_operating_mode = {
+	.ops		= &addi9036_ctrl_ops,
+	.id		= V4L2_CID_ADDI9036_OPERATING_MODE,
+	.name		= "Operating Mode",
+	.type		= V4L2_CTRL_TYPE_INTEGER,
+	.def		= 0,
+	.min		= 0,
+	.max		= 1,
+	.step		= 1,
+};
+
+static int addi9036_enum_mbus_code(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_pad_config *cfg,
+				   struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index > 0)
+		return -EINVAL;
+
+	code->code = MEDIA_BUS_FMT_SBGGR12_1X12;
+
+	return 0;
+}
+
+static int addi9036_enum_frame_size(struct v4l2_subdev *subdev,
+				    struct v4l2_subdev_pad_config *cfg,
+				    struct v4l2_subdev_frame_size_enum *fse)
+{
+	if (fse->code != MEDIA_BUS_FMT_SBGGR12_1X12)
+		return -EINVAL;
+
+	if (fse->index >= ARRAY_SIZE(addi9036_mode_info_data))
+		return -EINVAL;
+
+	fse->min_width = addi9036_mode_info_data[fse->index].width;
+	fse->max_width = addi9036_mode_info_data[fse->index].width;
+	fse->min_height = addi9036_mode_info_data[fse->index].height;
+	fse->max_height = addi9036_mode_info_data[fse->index].height;
+
+	return 0;
+}
+
+static struct v4l2_mbus_framefmt *
+addi9036_get_pad_format(struct addi9036 *addi9036,
+			struct v4l2_subdev_pad_config *cfg, unsigned int pad,
+			enum v4l2_subdev_format_whence which)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		return v4l2_subdev_get_try_format(&addi9036->sd, cfg, pad);
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		return &addi9036->fmt;
+	default:
+		return NULL;
+	}
+}
+
+static int addi9036_get_format(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_format *format)
+{
+	struct addi9036 *addi9036 = to_addi9036(sd);
+	struct v4l2_mbus_framefmt *pad_format;
+
+	pad_format = addi9036_get_pad_format(addi9036, cfg, format->pad,
+					     format->which);
+
+	if (!pad_format)
+		return -EINVAL;
+
+	format->format = *pad_format;
+
+	return 0;
+}
+
+static struct v4l2_rect *
+addi9036_get_pad_crop(struct addi9036 *addi9036,
+		      struct v4l2_subdev_pad_config *cfg,
+		      unsigned int pad, enum v4l2_subdev_format_whence which)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		return v4l2_subdev_get_try_crop(&addi9036->sd, cfg, pad);
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		return &addi9036->crop;
+	default:
+		return NULL;
+	}
+}
+
+static int addi9036_set_format(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_pad_config *cfg,
+			       struct v4l2_subdev_format *format)
+{
+	struct addi9036 *addi9036 = to_addi9036(sd);
+	struct v4l2_mbus_framefmt *framefmt;
+	struct v4l2_rect *crop;
+	const struct addi9036_mode_info *new_mode;
+	int ret;
+
+	dev_dbg(addi9036->dev, "set_fmt: %x %dx%d %d\n",
+		format->format.code, format->format.width,
+		format->format.height, format->which);
+
+	crop = addi9036_get_pad_crop(addi9036, cfg, format->pad,
+				     format->which);
+
+	if (!crop)
+		return -EINVAL;
+
+	new_mode = v4l2_find_nearest_size(addi9036_mode_info_data,
+					  ARRAY_SIZE(addi9036_mode_info_data),
+					  width, height, format->format.width,
+					  format->format.height);
+	crop->width = new_mode->width;
+	crop->height = new_mode->height;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		ret = v4l2_ctrl_s_ctrl_int64(addi9036->pixel_rate,
+					     new_mode->pixel_rate);
+		if (ret < 0)
+			return ret;
+
+		ret = v4l2_ctrl_s_ctrl(addi9036->link_freq,
+				       new_mode->link_freq_idx);
+		if (ret < 0)
+			return ret;
+
+		addi9036->current_mode = new_mode;
+	}
+
+	framefmt = addi9036_get_pad_format(addi9036, cfg, format->pad,
+					   format->which);
+	framefmt->width = crop->width;
+	framefmt->height = crop->height;
+	framefmt->code = MEDIA_BUS_FMT_SBGGR12_1X12;
+	framefmt->field = V4L2_FIELD_NONE;
+	framefmt->colorspace = V4L2_COLORSPACE_SRGB;
+
+	format->format = *framefmt;
+
+	return 0;
+}
+
+static int addi9036_entity_init_cfg(struct v4l2_subdev *subdev,
+				    struct v4l2_subdev_pad_config *cfg)
+{
+	struct v4l2_subdev_format fmt = { 0 };
+
+	fmt.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
+	fmt.format.width = addi9036_mode_info_data[1].width;
+	fmt.format.height = addi9036_mode_info_data[1].height;
+
+	addi9036_set_format(subdev, cfg, &fmt);
+
+	return 0;
+}
+
+static int addi9036_get_selection(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_selection *sel)
+{
+	struct addi9036 *addi9036 = to_addi9036(sd);
+
+	if (sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	sel->r = *addi9036_get_pad_crop(addi9036, cfg, sel->pad, sel->which);
+
+	return 0;
+}
+
+static int addi9036_s_stream(struct v4l2_subdev *subdev, int enable)
+{
+	struct addi9036 *addi9036 = to_addi9036(subdev);
+	uint8_t mode = addi9036->curr_operating_mode;
+	int ret = 0;
+
+	dev_dbg(addi9036->dev, "s_stream: %d\n", enable);
+
+	if (addi9036->streaming == enable)
+		return 0;
+
+	if (enable) {
+		if (addi9036->mode_fw_blocks[mode].mode_regs == NULL) {
+			dev_err(addi9036->dev, "Selected mode has no data\n");
+			return -EINVAL;
+		}
+
+		dev_dbg(addi9036->dev, "Applying mode: %u\n", mode);
+		ret = regmap_multi_reg_write(addi9036->regmap,
+				addi9036->mode_fw_blocks[mode].mode_regs,
+				addi9036->mode_fw_blocks[mode].regs_count);
+
+		dev_dbg(addi9036->dev, "Writen %lu registers\n",
+			addi9036->mode_fw_blocks[mode].regs_count);
+	}
+
+	addi9036->streaming = enable;
+	return ret;
+}
+
+static const struct v4l2_subdev_core_ops addi9036_core_ops = {
+	.s_power	= addi9036_s_power,
+#ifdef CONFIG_VIDEO_ADV_DEBUG
+	.g_register	= addi9036_g_register,
+	.s_register	= addi9036_s_register,
+#endif
+};
+
+static const struct v4l2_subdev_video_ops addi9036_video_ops = {
+	.s_stream	= addi9036_s_stream,
+};
+
+static const struct v4l2_subdev_pad_ops addi9036_subdev_pad_ops = {
+	.init_cfg		= addi9036_entity_init_cfg,
+	.enum_mbus_code		= addi9036_enum_mbus_code,
+	.enum_frame_size	= addi9036_enum_frame_size,
+	.get_fmt		= addi9036_get_format,
+	.set_fmt		= addi9036_set_format,
+	.get_selection		= addi9036_get_selection,
+};
+
+static const struct v4l2_subdev_ops addi9036_subdev_ops = {
+	.core	= &addi9036_core_ops,
+	.video	= &addi9036_video_ops,
+	.pad	= &addi9036_subdev_pad_ops,
+};
+
+static int addi9036_g_modes_from_firmware(struct v4l2_subdev *sd)
+{
+	struct addi9036 *addi9036 = to_addi9036(sd);
+	const struct firmware *fw = addi9036->fw;
+	const struct addi9036_fw_header *fw_head;
+	const struct addi9036_mode_block *mode_block;
+	unsigned int reg_nr, chunk_len, pos, modes_nr, i, j, k;
+	struct reg_sequence *reg_seq;
+
+	/*
+	 * Reject too small or unreasonable large files.
+	 */
+
+	if (fw->size < sizeof(struct addi9036_fw_header) ||
+	    fw->size >= 0x4000000) {
+		dev_err(addi9036->dev, "FW loading failed: Invalid size\n");
+		return -EINVAL;
+	}
+
+	fw_head = (struct addi9036_fw_header *)fw->data;
+
+	if (memcmp(fw_head->magic, ADDI_MAGIC, ARRAY_SIZE(fw_head->magic))) {
+		dev_err(addi9036->dev, "FW loading failed: Invalid magic\n");
+		return -EINVAL;
+	}
+
+	modes_nr = le32_to_cpu(fw_head->modes_nr);
+
+	if (modes_nr == 0) {
+		dev_err(addi9036->dev, "FW should contain at least 1 mode.\n");
+		return -EINVAL;
+	}
+
+	__v4l2_ctrl_modify_range(addi9036->set_operating_range,
+				 addi9036->set_operating_range->minimum,
+				 modes_nr - 1, 1, 0);
+
+	addi9036->mode_fw_blocks = devm_kzalloc(addi9036->dev,
+			      sizeof(struct addi9036_mode_fw_block) * modes_nr,
+			      GFP_KERNEL);
+	if (!addi9036->mode_fw_blocks)
+		return -ENOMEM;
+
+	pos = sizeof(struct addi9036_fw_header);
+
+	for (i = 0; i < modes_nr; i++) {
+		mode_block = (struct addi9036_mode_block *)(fw->data + pos);
+
+		chunk_len = le32_to_cpu(mode_block->size_bytes);
+		reg_nr = chunk_len / sizeof(uint16_t) / 2;
+
+		reg_seq = devm_kzalloc(addi9036->dev,
+				       sizeof(struct reg_sequence) * reg_nr,
+				       GFP_KERNEL);
+		if (!reg_seq)
+			return -ENOMEM;
+
+		k = 0;
+		for (j = 0; j < reg_nr * 2; j += 2) {
+			reg_seq[k].reg = le16_to_cpu(mode_block->data[j]);
+			reg_seq[k].def = le16_to_cpu(mode_block->data[j + 1]);
+			k++;
+		}
+
+		addi9036->mode_fw_blocks[i].mode_regs = reg_seq;
+		addi9036->mode_fw_blocks[i].regs_count = reg_nr;
+
+		pos += chunk_len + sizeof(struct addi9036_mode_block);
+	}
+	return 0;
+}
+
+static int addi9036_mode_firmware_load(struct v4l2_subdev *sd)
+{
+	struct addi9036 *addi9036 = to_addi9036(sd);
+	int ret;
+
+	ret = request_firmware(&addi9036->fw, FW_FILE_NAME, addi9036->dev);
+	if (ret < 0) {
+		dev_err(addi9036->dev, "FW request failed\n");
+		return ret;
+	}
+
+	ret = addi9036_g_modes_from_firmware(sd);
+
+	release_firmware(addi9036->fw);
+	if (ret < 0) {
+		dev_err(addi9036->dev, "FW parsing failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int addi9036_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct fwnode_handle *endpoint;
+	struct addi9036 *addi9036;
+	int ret;
+
+	dev_dbg(dev, "%s: i2c addr = 0x%x\n", __func__, client->addr);
+
+	addi9036 = devm_kzalloc(dev, sizeof(struct addi9036), GFP_KERNEL);
+	if (!addi9036)
+		return -ENOMEM;
+
+	addi9036->dev = dev;
+
+	addi9036->regmap = devm_regmap_init_i2c(client,
+						&addi9036_i2c_regmap_config);
+	if (IS_ERR(addi9036->regmap)) {
+		dev_err(dev, "Error initializing i2c regmap\n");
+		return PTR_ERR(addi9036->regmap);
+	}
+
+	mutex_init(&addi9036->power_lock);
+
+	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
+	if (!endpoint) {
+		dev_err(dev, "endpoint node not found\n");
+		return -EINVAL;
+	}
+
+	ret = v4l2_fwnode_endpoint_parse(endpoint, &addi9036->ep);
+	if (ret < 0) {
+		dev_err(dev, "parsing endpoint node failed\n");
+		return ret;
+	}
+	fwnode_handle_put(endpoint);
+
+	if (addi9036->ep.bus_type != V4L2_MBUS_CSI2_DPHY) {
+		dev_err(dev, "invalid bus type, must be MIPI CSI2\n");
+		return -EINVAL;
+	}
+
+	addi9036->rst_gpio = gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(addi9036->rst_gpio))
+		dev_info(dev, "Unable to get \"reset\" gpio\n");
+
+	v4l2_ctrl_handler_init(&addi9036->ctrls, 3);
+
+	addi9036->pixel_rate = v4l2_ctrl_new_std(&addi9036->ctrls,
+						  &addi9036_ctrl_ops,
+						  V4L2_CID_PIXEL_RATE,
+						  1, INT_MAX, 1, 1);
+	addi9036->link_freq = v4l2_ctrl_new_int_menu(&addi9036->ctrls,
+						     &addi9036_ctrl_ops,
+						     V4L2_CID_LINK_FREQ,
+						     ARRAY_SIZE(
+							     link_freq_tbl) - 1,
+						     0, link_freq_tbl);
+	if (addi9036->link_freq)
+		addi9036->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	addi9036->set_operating_range = v4l2_ctrl_new_custom(&addi9036->ctrls,
+						&addi9036_ctrl_operating_mode,
+						NULL);
+
+	ret = addi9036->ctrls.error;
+	if (ret) {
+		dev_err(dev, "%s: control initialization error %d\n",
+			__func__, ret);
+		goto free_ctrl;
+	}
+	addi9036->sd.ctrl_handler = &addi9036->ctrls;
+
+	v4l2_i2c_subdev_init(&addi9036->sd, client, &addi9036_subdev_ops);
+	addi9036->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	addi9036->pad.flags = MEDIA_PAD_FL_SOURCE;
+	addi9036->sd.dev = &client->dev;
+	addi9036->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+
+	ret = media_entity_pads_init(&addi9036->sd.entity, 1, &addi9036->pad);
+	if (ret < 0) {
+		dev_err(dev, "could not register media entity\n");
+		goto free_ctrl;
+	}
+
+	ret = addi9036_mode_firmware_load(&addi9036->sd);
+	if (ret < 0)
+		return ret;
+
+	addi9036_entity_init_cfg(&addi9036->sd, NULL);
+
+	ret = v4l2_async_register_subdev(&addi9036->sd);
+	if (ret < 0) {
+		dev_err(dev, "could not register v4l2 device\n");
+		goto free_entity;
+	}
+
+	return 0;
+
+free_entity:
+	media_entity_cleanup(&addi9036->sd.entity);
+free_ctrl:
+	v4l2_ctrl_handler_free(&addi9036->ctrls);
+	mutex_destroy(&addi9036->power_lock);
+
+	return ret;
+}
+
+static int addi9036_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct addi9036 *addi9036 = to_addi9036(sd);
+
+	v4l2_async_unregister_subdev(&addi9036->sd);
+	media_entity_cleanup(&addi9036->sd.entity);
+	if (addi9036->rst_gpio)
+		gpiod_put(addi9036->rst_gpio);
+	v4l2_ctrl_handler_free(&addi9036->ctrls);
+	mutex_destroy(&addi9036->power_lock);
+
+	return 0;
+}
+
+static const struct i2c_device_id addi9036_id[] = {
+	{ "addi9036", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, addi9036_id);
+
+static const struct of_device_id addi9036_of_match[] = {
+	{ .compatible = "adi,addi9036" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, addi9036_of_match);
+
+static struct i2c_driver addi9036_i2c_driver = {
+	.driver			= {
+		.of_match_table = addi9036_of_match,
+		.name		= "addi9036",
+	},
+	.probe_new		= addi9036_probe,
+	.remove			= addi9036_remove,
+	.id_table		= addi9036_id,
+};
+
+module_i2c_driver(addi9036_i2c_driver);
+
+MODULE_DESCRIPTION("Analog Devices ADDI9036 Camera Driver");
+MODULE_AUTHOR("Bogdan Togorean");
+MODULE_LICENSE("GPL v2");
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 62271418c1be..f88b56479bc1 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -198,6 +198,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_ATMEL_ISC_BASE		(V4L2_CID_USER_BASE + 0x10c0)
 
+/*
+ * The base for the addi9036 driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_ADDI9036_BASE		(V4L2_CID_USER_BASE + 0x10e0)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.28.0

