Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBD9BEB116
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2019 14:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbfJaNXY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Oct 2019 09:23:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51786 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbfJaNXY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Oct 2019 09:23:24 -0400
Received: from pendragon.ideasonboard.com (lmontsouris-658-1-103-151.w92-154.abo.wanadoo.fr [92.154.14.151])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 99D38320;
        Thu, 31 Oct 2019 14:23:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1572528200;
        bh=Ggt9CVg3gnTabiH93jhO/GJ4FhCLOHM9XVA9Oq6l720=;
        h=From:To:Cc:Subject:Date:From;
        b=hGa6y6Njcv39dXksQlXHRT77DqUXd6oaVNXWJ7Dr/VHxLL0rW6XNrOkyG8gXcZEJn
         9el/FaLP9e5GpWCTlrGeXbX8F/M/v3S5CG6XoRSx0Nc7ArPhFtlKdPsKuXSaWAnm+K
         jk9Ldn+92dS6RosQVLQv+KVNotO8vo2DU50jL0yQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH] media: i2c: IMX296 camera sensor driver
Date:   Thu, 31 Oct 2019 15:23:09 +0200
Message-Id: <20191031132309.10965-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IMX296LLR is a monochrome 1.60MP CMOS sensor from Sony. The driver
supports cropping and binning (but not both at the same time due to
hardware limitations) and exposure, gain, vertical blanking and test
pattern controls.

Preliminary support is also included for the color IMX296LQR sensor.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
This driver is a parallel implementation of IMX296 support, compatible
with the DT bindings submitted by Mani in
https://lore.kernel.org/linux-media/20191030094902.32582-1-manivannan.sadhasivam@linaro.org/.

 drivers/media/i2c/Kconfig  |   12 +
 drivers/media/i2c/Makefile |    1 +
 drivers/media/i2c/imx296.c | 1026 ++++++++++++++++++++++++++++++++++++
 3 files changed, 1039 insertions(+)
 create mode 100644 drivers/media/i2c/imx296.c

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 79ce9ec6fc1b..0a2a3f145cdf 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -595,6 +595,18 @@ config VIDEO_IMX274
 	  This is a V4L2 sensor driver for the Sony IMX274
 	  CMOS image sensor.
 
+config VIDEO_IMX296
+	tristate "Sony IMX296 sensor support"
+	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on MEDIA_CAMERA_SUPPORT
+	select V4L2_FWNODE
+	---help---
+	  This is a Video4Linux2 sensor driver for the Sony
+	  IMX296 camera.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called imx296.
+
 config VIDEO_IMX319
 	tristate "Sony IMX319 sensor support"
 	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index fd4ea86dedd5..9489ee36aa52 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -111,6 +111,7 @@ obj-$(CONFIG_VIDEO_TC358743)	+= tc358743.o
 obj-$(CONFIG_VIDEO_IMX214)	+= imx214.o
 obj-$(CONFIG_VIDEO_IMX258)	+= imx258.o
 obj-$(CONFIG_VIDEO_IMX274)	+= imx274.o
+obj-$(CONFIG_VIDEO_IMX296)	+= imx296.o
 obj-$(CONFIG_VIDEO_IMX319)	+= imx319.o
 obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
 obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
new file mode 100644
index 000000000000..4140637983fd
--- /dev/null
+++ b/drivers/media/i2c/imx296.c
@@ -0,0 +1,1026 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for IMX296 CMOS Image Sensor from Sony
+ *
+ * Copyright 2019 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+#include <linux/videodev2.h>
+
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+#define IMX296_PIXEL_ARRAY_WIDTH			1456
+#define IMX296_PIXEL_ARRAY_HEIGHT			1088
+
+#define IMX296_REG_8BIT(n)				((1 << 16) | (n))
+#define IMX296_REG_16BIT(n)				((2 << 16) | (n))
+#define IMX296_REG_24BIT(n)				((3 << 16) | (n))
+#define IMX296_REG_SIZE_SHIFT				16
+#define IMX296_REG_ADDR_MASK				0xffff
+
+#define IMX296_CTRL00					IMX296_REG_8BIT(0x3000)
+#define IMX296_CTRL00_STANDBY				BIT(0)
+#define IMX296_CTRL08					IMX296_REG_8BIT(0x3008)
+#define IMX296_CTRL08_REGHOLD				BIT(0)
+#define IMX296_CTRL0A					IMX296_REG_8BIT(0x300a)
+#define IMX296_CTRL0A_XMSTA				BIT(0)
+#define IMX296_CTRL0B					IMX296_REG_8BIT(0x300b)
+#define IMX296_CTRL0B_TRIGEN				BIT(0)
+#define IMX296_CTRL0D					IMX296_REG_8BIT(0x300d)
+#define IMX296_CTRL0D_WINMODE_ALL			(0 << 0)
+#define IMX296_CTRL0D_WINMODE_FD_BINNING		(2 << 0)
+#define IMX296_CTRL0D_HADD_ON_BINNING			BIT(5)
+#define IMX296_CTRL0D_SAT_CNT				BIT(6)
+#define IMX296_CTRL0E					IMX296_REG_8BIT(0x300e)
+#define IMX296_CTRL0E_VREVERSE				BIT(0)
+#define IMX296_CTRL0E_HREVERSE				BIT(1)
+#define IMX296_VMAX					IMX296_REG_24BIT(0x3010)
+#define IMX296_HMAX					IMX296_REG_16BIT(0x3014)
+#define IMX296_TMDCTRL					IMX296_REG_8BIT(0x301d)
+#define IMX296_TMDCTRL_LATCH				BIT(0)
+#define IMX296_TMDOUT					IMX296_REG_16BIT(0x301e)
+#define IMX296_TMDOUT_MASK				0x3ff
+#define IMX296_WDSEL					IMX296_REG_8BIT(0x3021)
+#define IMX296_WDSEL_NORMAL				(0 << 0)
+#define IMX296_WDSEL_MULTI_2				(1 << 0)
+#define IMX296_WDSEL_MULTI_4				(3 << 0)
+#define IMX296_BLKLEVELAUTO				IMX296_REG_8BIT(0x3022)
+#define IMX296_BLKLEVELAUTO_ON				0x01
+#define IMX296_BLKLEVELAUTO_OFF				0xf0
+#define IMX296_SST					IMX296_REG_8BIT(0x3024)
+#define IMX296_SST_EN					BIT(0)
+#define IMX296_CTRLTOUT					IMX296_REG_8BIT(0x3026)
+#define IMX296_CTRLTOUT_TOUT1SEL_LOW			(0 << 0)
+#define IMX296_CTRLTOUT_TOUT1SEL_PULSE			(3 << 0)
+#define IMX296_CTRLTOUT_TOUT2SEL_LOW			(0 << 2)
+#define IMX296_CTRLTOUT_TOUT2SEL_PULSE			(3 << 2)
+#define IMX296_CTRLTRIG					IMX296_REG_8BIT(0x3029)
+#define IMX296_CTRLTRIG_TOUT1_SEL_LOW			(0 << 0)
+#define IMX296_CTRLTRIG_TOUT1_SEL_PULSE1		(1 << 0)
+#define IMX296_CTRLTRIG_TOUT2_SEL_LOW			(0 << 4)
+#define IMX296_CTRLTRIG_TOUT2_SEL_PULSE2		(2 << 4)
+#define IMX296_SYNCSEL					IMX296_REG_8BIT(0x3036)
+#define IMX296_SYNCSEL_NORMAL				0xc0
+#define IMX296_SYNCSEL_HIZ				0xf0
+#define IMX296_PULSE1					IMX296_REG_8BIT(0x306d)
+#define IMX296_PULSE1_EN_NOR				BIT(0)
+#define IMX296_PULSE1_EN_TRIG				BIT(1)
+#define IMX296_PULSE1_POL_HIGH				(0 << 2)
+#define IMX296_PULSE1_POL_LOW				(1 << 2)
+#define IMX296_PULSE1_UP				IMX296_REG_24BIT(0x3070)
+#define IMX296_PULSE1_DN				IMX296_REG_24BIT(0x3074)
+#define IMX296_PULSE2					IMX296_REG_8BIT(0x3079)
+#define IMX296_PULSE2_EN_NOR				BIT(0)
+#define IMX296_PULSE2_EN_TRIG				BIT(1)
+#define IMX296_PULSE2_POL_HIGH				(0 << 2)
+#define IMX296_PULSE2_POL_LOW				(1 << 2)
+#define IMX296_PULSE2_UP				IMX296_REG_24BIT(0x307c)
+#define IMX296_PULSE2_DN				IMX296_REG_24BIT(0x3080)
+#define IMX296_INCKSEL(n)				IMX296_REG_8BIT(0x3089 + (n))
+#define IMX296_SHS1					IMX296_REG_24BIT(0x308d)
+#define IMX296_SHS2					IMX296_REG_24BIT(0x3090)
+#define IMX296_SHS3					IMX296_REG_24BIT(0x3094)
+#define IMX296_SHS4					IMX296_REG_24BIT(0x3098)
+#define IMX296_VBLANKLP					IMX296_REG_8BIT(0x309c)
+#define IMX296_VBLANKLP_NORMAL				0x04
+#define IMX296_VBLANKLP_LOW_POWER			0x2c
+#define IMX296_EXP_CNT					IMX296_REG_8BIT(0x30a3)
+#define IMX296_EXP_CNT_RESET				BIT(0)
+#define IMX296_EXP_MAX					IMX296_REG_16BIT(0x30a6)
+#define IMX296_VINT					IMX296_REG_8BIT(0x30aa)
+#define IMX296_VINT_EN					BIT(0)
+#define IMX296_LOWLAGTRG				IMX296_REG_8BIT(0x30ae)
+#define IMX296_LOWLAGTRG_FAST				BIT(0)
+#define IMX296_I2CCTRL					IMX296_REG_8BIT(0x30ef)
+#define IMX296_I2CCTRL_I2CACKEN				BIT(0)
+
+#define IMX296_SENSOR_INFO				IMX296_REG_16BIT(0x3148)
+#define IMX296_SENSOR_INFO_MONO				BIT(15)
+#define IMX296_S_SHSA					IMX296_REG_16BIT(0x31ca)
+#define IMX296_S_SHSB					IMX296_REG_16BIT(0x31d2)
+/*
+ * Registers 0x31c8 to 0x31cd, 0x31d0 to 0x31d5, 0x31e2, 0x31e3, 0x31ea and
+ * 0x31eb are related to exposure mode but otherwise not documented.
+ */
+
+#define IMX296_GAINCTRL					IMX296_REG_8BIT(0x3200)
+#define IMX296_GAINCTRL_WD_GAIN_MODE_NORMAL		0x01
+#define IMX296_GAINCTRL_WD_GAIN_MODE_MULTI		0x41
+#define IMX296_GAIN					IMX296_REG_16BIT(0x3204)
+#define IMX296_GAIN_MIN					0
+#define IMX296_GAIN_MAX					480
+#define IMX296_GAIN1					IMX296_REG_16BIT(0x3208)
+#define IMX296_GAIN2					IMX296_REG_16BIT(0x320c)
+#define IMX296_GAIN3					IMX296_REG_16BIT(0x3210)
+#define IMX296_GAINDLY					IMX296_REG_8BIT(0x3212)
+#define IMX296_GAINDLY_NONE				0x08
+#define IMX296_GAINDLY_1FRAME				0x09
+#define IMX296_PGCTRL					IMX296_REG_8BIT(0x3238)
+#define IMX296_PGCTRL_REGEN				BIT(0)
+#define IMX296_PGCTRL_THRU				BIT(1)
+#define IMX296_PGCTRL_CLKEN				BIT(2)
+#define IMX296_PGCTRL_MODE(n)				((n) << 3)
+#define IMX296_PGHPOS					IMX296_REG_16BIT(0x3239)
+#define IMX296_PGVPOS					IMX296_REG_16BIT(0x323c)
+#define IMX296_PGHPSTEP					IMX296_REG_8BIT(0x323e)
+#define IMX296_PGVPSTEP					IMX296_REG_8BIT(0x323f)
+#define IMX296_PGHPNUM					IMX296_REG_8BIT(0x3240)
+#define IMX296_PGVPNUM					IMX296_REG_8BIT(0x3241)
+#define IMX296_PGDATA1					IMX296_REG_16BIT(0x3244)
+#define IMX296_PGDATA2					IMX296_REG_16BIT(0x3246)
+#define IMX296_PGHGSTEP					IMX296_REG_8BIT(0x3249)
+#define IMX296_BLKLEVEL					IMX296_REG_16BIT(0x3254)
+
+#define IMX296_FID0_ROI					IMX296_REG_8BIT(0x3300)
+#define IMX296_FID0_ROIH1ON				BIT(0)
+#define IMX296_FID0_ROIV1ON				BIT(1)
+#define IMX296_FID0_ROIPH1				IMX296_REG_16BIT(0x3310)
+#define IMX296_FID0_ROIPV1				IMX296_REG_16BIT(0x3312)
+#define IMX296_FID0_ROIWH1				IMX296_REG_16BIT(0x3314)
+#define IMX296_FID0_ROIWH1_MIN				80
+#define IMX296_FID0_ROIWV1				IMX296_REG_16BIT(0x3316)
+#define IMX296_FID0_ROIWV1_MIN				4
+
+#define IMX296_CM_HSST_STARTTMG				IMX296_REG_16BIT(0x4018)
+#define IMX296_CM_HSST_ENDTMG				IMX296_REG_16BIT(0x401a)
+#define IMX296_DA_HSST_STARTTMG				IMX296_REG_16BIT(0x404d)
+#define IMX296_DA_HSST_ENDTMG				IMX296_REG_16BIT(0x4050)
+#define IMX296_LM_HSST_STARTTMG				IMX296_REG_16BIT(0x4094)
+#define IMX296_LM_HSST_ENDTMG				IMX296_REG_16BIT(0x4096)
+#define IMX296_SST_SIEASTA1_SET				IMX296_REG_8BIT(0x40c9)
+#define IMX296_SST_SIEASTA1PRE_1U			IMX296_REG_16BIT(0x40cc)
+#define IMX296_SST_SIEASTA1PRE_1D			IMX296_REG_16BIT(0x40ce)
+#define IMX296_SST_SIEASTA1PRE_2U			IMX296_REG_16BIT(0x40d0)
+#define IMX296_SST_SIEASTA1PRE_2D			IMX296_REG_16BIT(0x40d2)
+#define IMX296_HSST					IMX296_REG_8BIT(0x40dc)
+#define IMX296_HSST_EN					BIT(2)
+
+#define IMX296_CKREQSEL					IMX296_REG_8BIT(0x4101)
+#define IMX296_CKREQSEL_HS				BIT(2)
+#define IMX296_GTTABLENUM				IMX296_REG_8BIT(0x4114)
+#define IMX296_CTRL418C					IMX296_REG_8BIT(0x418c)
+
+struct imx296_clk_params {
+	unsigned int freq;
+	u8 incksel[4];
+	u8 ctrl418c;
+};
+
+static const struct imx296_clk_params imx296_clk_params[] = {
+	{ 37125000, { 0x80, 0x0b, 0x80, 0x08 }, 116 },
+	{ 54000000, { 0xb0, 0x0f, 0xb0, 0x0c }, 168 },
+	{ 74250000, { 0x80, 0x0f, 0x80, 0x0c }, 232 },
+};
+
+struct imx296 {
+	struct device *dev;
+	struct clk *clk;
+	struct regulator *supply;
+	struct gpio_desc *reset;
+	struct regmap *regmap;
+
+	const struct imx296_clk_params *clk_params;
+	bool mono;
+
+	int power_count;		/* Protected by ctrls.lock */
+
+	struct v4l2_subdev subdev;
+	struct media_pad pad;
+
+	struct v4l2_ctrl_handler ctrls;
+	struct v4l2_ctrl *vblank;
+
+	struct v4l2_mbus_framefmt format;
+	struct v4l2_rect crop;
+};
+
+static inline struct imx296 *to_imx296(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct imx296, subdev);
+}
+
+static int imx296_read(struct imx296 *imx, u32 addr)
+{
+	u8 data[3] = { 0, 0, 0 };
+	int ret;
+
+	ret = regmap_raw_read(imx->regmap, addr & IMX296_REG_ADDR_MASK, data,
+			      (addr >> IMX296_REG_SIZE_SHIFT) & 3);
+	if (ret < 0)
+		return ret;
+
+	return (data[2] << 16) | (data[1] << 8) | data[0];
+}
+
+static int imx296_write(struct imx296 *imx, u32 addr, u32 value, int *err)
+{
+	u8 data[3] = { value & 0xff, (value >> 8) & 0xff, value >> 16 };
+	int ret;
+
+	if (err && *err)
+		return *err;
+
+	ret = regmap_raw_write(imx->regmap, addr & IMX296_REG_ADDR_MASK, data,
+			       (addr >> IMX296_REG_SIZE_SHIFT) & 3);
+	if (ret < 0) {
+		dev_dbg(imx->dev, "%u-bit write to 0x%04x failed: %d\n",
+			((addr >> IMX296_REG_SIZE_SHIFT) & 0x18) * 8,
+			addr & IMX296_REG_ADDR_MASK, ret);
+		if (err)
+			*err = ret;
+	}
+
+	return ret;
+}
+
+/* -----------------------------------------------------------------------------
+ * Controls
+ */
+
+static const char * const imx296_test_pattern_menu[] = {
+	"Disabled",
+	"Multiple Pixels",
+	"Sequence 1",
+	"Sequence 2",
+	"Gradient",
+	"Row",
+	"Column",
+	"Cross",
+	"Stripe",
+	"Checks",
+};
+
+static int imx296_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct imx296 *imx = container_of(ctrl->handler, struct imx296, ctrls);
+	unsigned int vmax;
+	int ret = 0;
+
+	if (!imx->power_count)
+		return 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_EXPOSURE:
+		/* Clamp the exposure value to VMAX. */
+		vmax = imx->format.height + imx->vblank->cur.val;
+		ctrl->val = min_t(int, ctrl->val, vmax);
+		imx296_write(imx, IMX296_SHS1, vmax - ctrl->val, &ret);
+		break;
+
+	case V4L2_CID_GAIN:
+		imx296_write(imx, IMX296_GAIN, ctrl->val, &ret);
+		break;
+
+	case V4L2_CID_VBLANK:
+		imx296_write(imx, IMX296_VMAX,
+			     imx->format.height + ctrl->val, &ret);
+		break;
+
+	case V4L2_CID_TEST_PATTERN:
+		if (ctrl->val) {
+			imx296_write(imx, IMX296_PGHPOS, 8, &ret);
+			imx296_write(imx, IMX296_PGVPOS, 8, &ret);
+			imx296_write(imx, IMX296_PGHPSTEP, 8, &ret);
+			imx296_write(imx, IMX296_PGVPSTEP, 8, &ret);
+			imx296_write(imx, IMX296_PGHPNUM, 100, &ret);
+			imx296_write(imx, IMX296_PGVPNUM, 100, &ret);
+			imx296_write(imx, IMX296_PGDATA1, 0x300, &ret);
+			imx296_write(imx, IMX296_PGDATA2, 0x100, &ret);
+			imx296_write(imx, IMX296_PGHGSTEP, 0, &ret);
+			imx296_write(imx, IMX296_BLKLEVEL, 0, &ret);
+			imx296_write(imx, IMX296_BLKLEVELAUTO,
+				     IMX296_BLKLEVELAUTO_OFF, &ret);
+			imx296_write(imx, IMX296_PGCTRL,
+				     IMX296_PGCTRL_REGEN |
+				     IMX296_PGCTRL_THRU |
+				     IMX296_PGCTRL_CLKEN |
+				     IMX296_PGCTRL_MODE(ctrl->val), &ret);
+		} else {
+			imx296_write(imx, IMX296_PGCTRL, 0, &ret);
+			imx296_write(imx, IMX296_BLKLEVEL, 0x3c, &ret);
+			imx296_write(imx, IMX296_BLKLEVELAUTO,
+				     IMX296_BLKLEVELAUTO_ON, &ret);
+		}
+		break;
+
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops imx296_ctrl_ops = {
+	.s_ctrl = imx296_s_ctrl,
+};
+
+static int imx296_ctrls_init(struct imx296 *imx)
+{
+	v4l2_ctrl_handler_init(&imx->ctrls, 4);
+
+	v4l2_ctrl_new_std(&imx->ctrls, &imx296_ctrl_ops,
+			  V4L2_CID_EXPOSURE, 1, 1048575, 1, 1104);
+	v4l2_ctrl_new_std(&imx->ctrls, &imx296_ctrl_ops,
+			  V4L2_CID_GAIN, IMX296_GAIN_MIN,
+			  IMX296_GAIN_MAX, 1, IMX296_GAIN_MIN);
+	imx->vblank = v4l2_ctrl_new_std(&imx->ctrls, &imx296_ctrl_ops,
+					V4L2_CID_VBLANK, 30,
+					1048575 - IMX296_PIXEL_ARRAY_HEIGHT,
+					1, 30);
+	/*
+	 * The sensor calculates the MIPI timings internally to achieve a bit
+	 * rate between 1122 and 1198 Mbps. The exact value is unfortunately not
+	 * reported, at least according to the documentation. Report a nominal
+	 * rate of 1188 Mbps as that is used by the datasheet in multiple
+	 * examples.
+	 */
+	v4l2_ctrl_new_std(&imx->ctrls, NULL, V4L2_CID_PIXEL_RATE,
+			  1122000000 / 10, 1198000000 / 10, 1, 1188000000 / 10);
+	v4l2_ctrl_new_std_menu_items(&imx->ctrls, &imx296_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(imx296_test_pattern_menu) - 1,
+				     0, 0, imx296_test_pattern_menu);
+
+	if (imx->ctrls.error) {
+		dev_err(imx->dev, "failed to add controls (%d)\n",
+			imx->ctrls.error);
+		v4l2_ctrl_handler_free(&imx->ctrls);
+		return imx->ctrls.error;
+	}
+
+	imx->subdev.ctrl_handler = &imx->ctrls;
+
+	return 0;
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2 Subdev Operations
+ */
+
+/*
+ * This table is extracted from vendor data that is entirely undocumented. The
+ * first register write is required to activate the CSI-2 output. The other
+ * entries may or may not be optional?
+ */
+static const struct {
+	unsigned int reg;
+	unsigned int value;
+} imx296_init_table[] = {
+	{ IMX296_REG_8BIT(0x3005), 0xf0 },
+	{ IMX296_REG_8BIT(0x309e), 0x04 },
+	{ IMX296_REG_8BIT(0x30a0), 0x04 },
+	{ IMX296_REG_8BIT(0x30a1), 0x3c },
+	{ IMX296_REG_8BIT(0x30a4), 0x5f },
+	{ IMX296_REG_8BIT(0x30a8), 0x91 },
+	{ IMX296_REG_8BIT(0x30ac), 0x28 },
+	{ IMX296_REG_8BIT(0x30af), 0x09 },
+	{ IMX296_REG_8BIT(0x30df), 0x00 },
+	{ IMX296_REG_8BIT(0x3165), 0x00 },
+	{ IMX296_REG_8BIT(0x3169), 0x10 },
+	{ IMX296_REG_8BIT(0x316a), 0x02 },
+	{ IMX296_REG_8BIT(0x31c8), 0xf3 },	/* Exposure-related */
+	{ IMX296_REG_8BIT(0x31d0), 0xf4 },	/* Exposure-related */
+	{ IMX296_REG_8BIT(0x321a), 0x00 },
+	{ IMX296_REG_8BIT(0x3226), 0x02 },
+	{ IMX296_REG_8BIT(0x3256), 0x01 },
+	{ IMX296_REG_8BIT(0x3541), 0x72 },
+	{ IMX296_REG_8BIT(0x3516), 0x77 },
+	{ IMX296_REG_8BIT(0x350b), 0x7f },
+	{ IMX296_REG_8BIT(0x3758), 0xa3 },
+	{ IMX296_REG_8BIT(0x3759), 0x00 },
+	{ IMX296_REG_8BIT(0x375a), 0x85 },
+	{ IMX296_REG_8BIT(0x375b), 0x00 },
+	{ IMX296_REG_8BIT(0x3832), 0xf5 },
+	{ IMX296_REG_8BIT(0x3833), 0x00 },
+	{ IMX296_REG_8BIT(0x38a2), 0xf6 },
+	{ IMX296_REG_8BIT(0x38a3), 0x00 },
+	{ IMX296_REG_8BIT(0x3a00), 0x80 },
+	{ IMX296_REG_8BIT(0x3d48), 0xa3 },
+	{ IMX296_REG_8BIT(0x3d49), 0x00 },
+	{ IMX296_REG_8BIT(0x3d4a), 0x85 },
+	{ IMX296_REG_8BIT(0x3d4b), 0x00 },
+	{ IMX296_REG_8BIT(0x400e), 0x58 },
+	{ IMX296_REG_8BIT(0x4014), 0x1c },
+	{ IMX296_REG_8BIT(0x4041), 0x2a },
+	{ IMX296_REG_8BIT(0x40a2), 0x06 },
+	{ IMX296_REG_8BIT(0x40c1), 0xf6 },
+	{ IMX296_REG_8BIT(0x40c7), 0x0f },
+	{ IMX296_REG_8BIT(0x40c8), 0x00 },
+	{ IMX296_REG_8BIT(0x4174), 0x00 },
+};
+
+static int imx296_setup(struct imx296 *imx)
+{
+	const struct v4l2_mbus_framefmt *format = &imx->format;
+	const struct v4l2_rect *crop = &imx->crop;
+	unsigned int i;
+	int ret = 0;
+
+	for (i = 0; i < ARRAY_SIZE(imx296_init_table); ++i)
+		imx296_write(imx, imx296_init_table[i].reg,
+			     imx296_init_table[i].value, &ret);
+
+	if (crop->width != IMX296_PIXEL_ARRAY_WIDTH ||
+	    crop->height != IMX296_PIXEL_ARRAY_HEIGHT) {
+		imx296_write(imx, IMX296_FID0_ROI,
+			     IMX296_FID0_ROIH1ON | IMX296_FID0_ROIV1ON, &ret);
+		imx296_write(imx, IMX296_FID0_ROIPH1, crop->left, &ret);
+		imx296_write(imx, IMX296_FID0_ROIPV1, crop->top, &ret);
+		imx296_write(imx, IMX296_FID0_ROIWH1, crop->width, &ret);
+		imx296_write(imx, IMX296_FID0_ROIWV1, crop->height, &ret);
+	} else {
+		imx296_write(imx, IMX296_FID0_ROI, 0, &ret);
+	}
+
+	imx296_write(imx, IMX296_CTRL0D,
+		     (crop->width != format->width ?
+		      IMX296_CTRL0D_HADD_ON_BINNING : 0) |
+		     (crop->height != format->height ?
+		      IMX296_CTRL0D_WINMODE_FD_BINNING : 0),
+		     &ret);
+
+	/*
+	 * HMAX and VMAX configure horizontal and vertical blanking by
+	 * specifying the total line time and frame time respectively. The line
+	 * time is specified in operational clock units (which appears to be the
+	 * output of an internal PLL, fixed at 74.25 MHz regardless of the
+	 * exernal clock frequency), while the frame time is specified as a
+	 * number of lines.
+	 *
+	 * In the vertical direction the sensor outputs the following:
+	 *
+	 * - one line for the FS packet
+	 * - two lines of embedded data (DT 0x12)
+	 * - six null lines (DT 0x10)
+	 * - four lines of vertical effective optical black (DT 0x37)
+	 * - 8 to 1088 lines of active image data (RAW10, DT 0x2b)
+	 * - one line for the FE packet
+	 * - 16 or more lines of vertical blanking
+	 */
+	imx296_write(imx, IMX296_HMAX, 1100, &ret);
+	imx296_write(imx, IMX296_VMAX, format->height + imx->vblank->cur.val,
+		     &ret);
+
+	for (i = 0; i < 4; ++i)
+		imx296_write(imx, IMX296_INCKSEL(i),
+			     imx->clk_params->incksel[i], &ret);
+	imx296_write(imx, IMX296_GTTABLENUM, 0xc5, &ret);
+	imx296_write(imx, IMX296_CTRL418C,
+		     imx->clk_params->ctrl418c, &ret);
+
+	imx296_write(imx, IMX296_GAINDLY, IMX296_GAINDLY_NONE, &ret);
+	imx296_write(imx, IMX296_BLKLEVEL, 0x03c, &ret);
+
+	if (ret < 0)
+		return ret;
+
+	return __v4l2_ctrl_handler_setup(&imx->ctrls);
+}
+
+static int imx296_power_on(struct imx296 *imx)
+{
+	int ret;
+
+	ret = regulator_enable(imx->supply);
+	if (ret < 0)
+		return ret;
+
+	udelay(1);
+
+	ret = gpiod_direction_output(imx->reset, 0);
+	if (ret < 0)
+		goto err_supply;
+
+	udelay(1);
+
+	ret = clk_prepare_enable(imx->clk);
+	if (ret < 0)
+		goto err_reset;
+
+	/*
+	 * The documentation doesn't explicitly say how much time is required
+	 * after providing a clock and before starting I2C communication. It
+	 * mentions a delay of 20µs in 4-wire mode, but tests showed that a
+	 * delay of 100µs resulted in I2C communication failures, while 500µs
+	 * seems to be enough. Be conservative.
+	 */
+	usleep_range(1000, 2000);
+
+	return 0;
+
+err_reset:
+	gpiod_direction_output(imx->reset, 1);
+err_supply:
+	regulator_disable(imx->supply);
+	return ret;
+}
+
+static void imx296_power_off(struct imx296 *imx)
+{
+	clk_disable_unprepare(imx->clk);
+	gpiod_direction_output(imx->reset, 1);
+	regulator_disable(imx->supply);
+}
+
+static int imx296_s_power(struct v4l2_subdev *sd, int on)
+{
+	struct imx296 *imx = to_imx296(sd);
+	int ret = 0;
+
+	mutex_lock(imx->ctrls.lock);
+
+	if (imx->power_count == !on) {
+		if (on) {
+			ret = imx296_power_on(imx);
+			if (ret < 0)
+				goto done;
+			ret = imx296_setup(imx);
+			if (ret < 0) {
+				imx296_power_off(imx);
+				goto done;
+			}
+		} else {
+			imx296_power_off(imx);
+		}
+	}
+
+	/* Update the power count. */
+	imx->power_count += on ? 1 : -1;
+	WARN_ON(imx->power_count < 0);
+
+done:
+	mutex_unlock(imx->ctrls.lock);
+	return ret;
+}
+
+static int imx296_stream_on(struct imx296 *imx)
+{
+	int ret = 0;
+
+	imx296_write(imx, IMX296_CTRL00, 0, &ret);
+	usleep_range(2000, 5000);
+	imx296_write(imx, IMX296_CTRL0A, 0, &ret);
+
+	return ret;
+}
+
+static int imx296_stream_off(struct imx296 *imx)
+{
+	int ret = 0;
+
+	imx296_write(imx, IMX296_CTRL0A, IMX296_CTRL0A_XMSTA, &ret);
+	imx296_write(imx, IMX296_CTRL00, IMX296_CTRL00_STANDBY, &ret);
+
+	return ret;
+}
+
+static int imx296_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct imx296 *imx = to_imx296(sd);
+
+	return enable ? imx296_stream_on(imx) : imx296_stream_off(imx);
+}
+
+static int imx296_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_pad_config *cfg,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct imx296 *imx = to_imx296(sd);
+
+	if (code->index != 0)
+		return -EINVAL;
+
+	code->code = imx->mono ? MEDIA_BUS_FMT_Y10_1X10
+		   : MEDIA_BUS_FMT_SBGGR10_1X10;
+
+	return 0;
+}
+
+static int imx296_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct imx296 *imx = to_imx296(sd);
+
+	if (fse->index >= 2 || fse->code != imx->format.code)
+		return -EINVAL;
+
+	fse->min_width = IMX296_PIXEL_ARRAY_WIDTH / (fse->index + 1);
+	fse->max_width = fse->min_width;
+	fse->min_height = IMX296_PIXEL_ARRAY_HEIGHT / (fse->index + 1);
+	fse->max_height = fse->min_height;
+
+	return 0;
+}
+
+static struct v4l2_mbus_framefmt *
+imx296_get_pad_format(struct imx296 *imx, struct v4l2_subdev_pad_config *cfg,
+		      unsigned int pad, u32 which)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		return v4l2_subdev_get_try_format(&imx->subdev, cfg, pad);
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		return &imx->format;
+	default:
+		return NULL;
+	}
+}
+
+static struct v4l2_rect *
+imx296_get_pad_crop(struct imx296 *imx, struct v4l2_subdev_pad_config *cfg,
+		    unsigned int pad, u32 which)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		return v4l2_subdev_get_try_crop(&imx->subdev, cfg, pad);
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		return &imx->crop;
+	default:
+		return NULL;
+	}
+}
+
+static int imx296_set_format(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_format *fmt)
+{
+	struct imx296 *imx = to_imx296(sd);
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect *crop;
+
+	crop = imx296_get_pad_crop(imx, cfg, fmt->pad, fmt->which);
+	format = imx296_get_pad_format(imx, cfg, fmt->pad, fmt->which);
+
+	/*
+	 * Binning is only allowed when cropping is disabled according to the
+	 * documentation. This should be double-checked.
+	 */
+	if (crop->width == IMX296_PIXEL_ARRAY_WIDTH &&
+	    crop->height == IMX296_PIXEL_ARRAY_HEIGHT) {
+		unsigned int width;
+		unsigned int height;
+		unsigned int hratio;
+		unsigned int vratio;
+
+		/* Clamp the width and height to avoid dividing by zero. */
+		width = clamp_t(unsigned int, fmt->format.width,
+				crop->width / 2, crop->width);
+		height = clamp_t(unsigned int, fmt->format.height,
+				 crop->height / 2, crop->height);
+
+		hratio = DIV_ROUND_CLOSEST(crop->width, width);
+		vratio = DIV_ROUND_CLOSEST(crop->height, height);
+
+		format->width = crop->width / hratio;
+		format->height = crop->height / vratio;
+	} else {
+		format->width = crop->width;
+		format->height = crop->height;
+	}
+
+	format->code = imx->mono ? MEDIA_BUS_FMT_Y10_1X10
+		     : MEDIA_BUS_FMT_SBGGR10_1X10;
+	fmt->format = *format;
+
+	return 0;
+}
+
+static int imx296_get_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_selection *sel)
+{
+	struct imx296 *imx = to_imx296(sd);
+
+	if (sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	sel->r = *imx296_get_pad_crop(imx, cfg, sel->pad, sel->which);
+
+	return 0;
+}
+
+static int imx296_set_selection(struct v4l2_subdev *sd,
+				struct v4l2_subdev_pad_config *cfg,
+				struct v4l2_subdev_selection *sel)
+{
+	struct imx296 *imx = to_imx296(sd);
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect *crop;
+	struct v4l2_rect rect;
+
+	if (sel->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	/*
+	 * Clamp the crop rectangle boundaries and align them to a multiple of 4
+	 * pixels to satisfy hardware requirements.
+	 */
+	rect.left = clamp(ALIGN(sel->r.left, 4), 0,
+			  IMX296_PIXEL_ARRAY_WIDTH - IMX296_FID0_ROIWH1_MIN);
+	rect.top = clamp(ALIGN(sel->r.top, 4), 0,
+			  IMX296_PIXEL_ARRAY_HEIGHT - IMX296_FID0_ROIWV1_MIN);
+	rect.width = clamp_t(unsigned int, ALIGN(sel->r.width, 4),
+			     IMX296_FID0_ROIWH1_MIN, IMX296_PIXEL_ARRAY_WIDTH);
+	rect.height = clamp_t(unsigned int, ALIGN(sel->r.height, 4),
+			      IMX296_FID0_ROIWV1_MIN, IMX296_PIXEL_ARRAY_HEIGHT);
+
+	rect.width = min_t(unsigned int, rect.width,
+			   IMX296_PIXEL_ARRAY_WIDTH - rect.left);
+	rect.height = min_t(unsigned int, rect.height,
+			    IMX296_PIXEL_ARRAY_HEIGHT - rect.top);
+
+	crop = imx296_get_pad_crop(imx, cfg, sel->pad, sel->which);
+
+	if (rect.width != crop->width || rect.height != crop->height) {
+		/*
+		 * Reset the output image size if the crop rectangle size has
+		 * been modified.
+		 */
+		format = imx296_get_pad_format(imx, cfg, sel->pad, sel->which);
+		format->width = rect.width;
+		format->height = rect.height;
+	}
+
+	*crop = rect;
+	sel->r = rect;
+
+	return 0;
+}
+
+static int imx296_get_format(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_pad_config *cfg,
+			     struct v4l2_subdev_format *fmt)
+{
+	struct imx296 *imx = to_imx296(sd);
+
+	fmt->format = *imx296_get_pad_format(imx, cfg, fmt->pad, fmt->which);
+
+	return 0;
+}
+
+static int imx296_init_cfg(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_pad_config *cfg)
+{
+	struct v4l2_subdev_selection sel = { 0 };
+	struct v4l2_subdev_format format = { 0 };
+
+	sel.target = V4L2_SEL_TGT_CROP;
+	sel.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
+	sel.r.width = IMX296_PIXEL_ARRAY_WIDTH;
+	sel.r.height = IMX296_PIXEL_ARRAY_HEIGHT;
+
+	imx296_set_selection(sd, cfg, &sel);
+
+	format.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE;
+	format.format.width = IMX296_PIXEL_ARRAY_WIDTH;
+	format.format.height = IMX296_PIXEL_ARRAY_HEIGHT;
+
+	imx296_set_format(sd, cfg, &format);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_core_ops imx296_subdev_core_ops = {
+	.s_power = imx296_s_power,
+};
+
+static const struct v4l2_subdev_video_ops imx296_subdev_video_ops = {
+	.s_stream = imx296_s_stream,
+};
+
+static const struct v4l2_subdev_pad_ops imx296_subdev_pad_ops = {
+	.enum_mbus_code = imx296_enum_mbus_code,
+	.enum_frame_size = imx296_enum_frame_size,
+	.get_fmt = imx296_get_format,
+	.set_fmt = imx296_set_format,
+	.get_selection = imx296_get_selection,
+	.set_selection = imx296_set_selection,
+	.init_cfg = imx296_init_cfg,
+};
+
+static const struct v4l2_subdev_ops imx296_subdev_ops = {
+	.core = &imx296_subdev_core_ops,
+	.video = &imx296_subdev_video_ops,
+	.pad = &imx296_subdev_pad_ops,
+};
+
+/* -----------------------------------------------------------------------------
+ * Probe & Remove
+ */
+
+static int imx296_identify_model(struct imx296 *imx)
+{
+	unsigned int model;
+	int ret;
+
+	ret = imx296_power_on(imx);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * While most registers can be read when the sensor is in standby, this
+	 * is not the case of the sensor info register :-(
+	 */
+	ret = imx296_write(imx, IMX296_CTRL00, 0, NULL);
+	if (ret < 0) {
+		dev_err(imx->dev, "failed to get sensor out of standby (%d)\n",
+			ret);
+		goto done;
+	}
+
+	ret = imx296_read(imx, IMX296_SENSOR_INFO);
+	if (ret < 0) {
+		dev_err(imx->dev, "failed to read sensor information (%d)\n",
+			ret);
+		goto done;
+	}
+
+	model = (ret >> 6) & 0x1ff;
+
+	switch (model) {
+	case 296:
+		imx->mono = ret & IMX296_SENSOR_INFO_MONO;
+		dev_info(imx->dev, "found IMX%u%s\n", model,
+			 imx->mono ? "LL" : "LQ");
+		ret = 0;
+		break;
+	/*
+	 * The IMX297 seems to share features with the IMX296, it may be
+	 * possible to support it in the same driver.
+	 */
+	case 297:
+	default:
+		dev_err(imx->dev, "invalid device model 0x%04x\n", ret);
+		ret = -ENODEV;
+		break;
+	}
+
+done:
+	imx296_write(imx, IMX296_CTRL00, IMX296_CTRL00_STANDBY, NULL);
+	imx296_power_off(imx);
+	return ret;
+}
+
+static const struct regmap_config imx296_regmap_config = {
+	.reg_bits = 16,
+	.val_bits = 8,
+
+	.wr_table = &(const struct regmap_access_table) {
+		.no_ranges = (const struct regmap_range[]) {
+			{
+				.range_min = IMX296_SENSOR_INFO & 0xffff,
+				.range_max = (IMX296_SENSOR_INFO & 0xffff) + 1,
+			},
+		},
+		.n_no_ranges = 1,
+	},
+};
+
+static int imx296_probe(struct i2c_client *client,
+			const struct i2c_device_id *did)
+{
+	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
+	unsigned long clk_rate;
+	struct imx296 *imx;
+	unsigned int i;
+	int ret;
+
+	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA)) {
+		dev_warn(&adapter->dev,
+			 "I2C-Adapter doesn't support I2C_FUNC_SMBUS_BYTE\n");
+		return -EIO;
+	}
+
+	imx = devm_kzalloc(&client->dev, sizeof(*imx), GFP_KERNEL);
+	if (!imx)
+		return -ENOMEM;
+
+	imx->dev = &client->dev;
+
+	imx->supply = devm_regulator_get(&client->dev, "vddd");
+	if (IS_ERR(imx->supply)) {
+		if (PTR_ERR(imx->supply) != -EPROBE_DEFER)
+			dev_err(&client->dev, "failed to get supply (%ld)\n",
+				PTR_ERR(imx->supply));
+		return PTR_ERR(imx->supply);
+	}
+
+	imx->reset = devm_gpiod_get_optional(&client->dev, "reset",
+					     GPIOD_OUT_HIGH);
+	if (IS_ERR(imx->reset)) {
+		if (PTR_ERR(imx->reset) != -EPROBE_DEFER)
+			dev_err(&client->dev, "failed to get xclr gpio (%ld)\n",
+				PTR_ERR(imx->reset));
+		return PTR_ERR(imx->reset);
+	}
+
+	imx->clk = devm_clk_get(&client->dev, "inck");
+	if (IS_ERR(imx->clk)) {
+		if (PTR_ERR(imx->clk) != -EPROBE_DEFER)
+			dev_err(&client->dev, "failed to get clock (%ld)\n",
+				PTR_ERR(imx->clk));
+		return PTR_ERR(imx->clk);
+	}
+
+	clk_rate = clk_get_rate(imx->clk);
+	for (i = 0; i < ARRAY_SIZE(imx296_clk_params); ++i) {
+		if (clk_rate == imx296_clk_params[i].freq) {
+			imx->clk_params = &imx296_clk_params[i];
+			break;
+		}
+	}
+
+	if (!imx->clk_params) {
+		dev_err(&client->dev, "unsupported clock rate %lu\n", clk_rate);
+		return -EINVAL;
+	}
+
+	imx->regmap = devm_regmap_init_i2c(client, &imx296_regmap_config);
+	if (IS_ERR(imx->regmap))
+		return PTR_ERR(imx->regmap);
+
+	ret = imx296_identify_model(imx);
+	if (ret < 0)
+		return ret;
+
+	v4l2_i2c_subdev_init(&imx->subdev, client, &imx296_subdev_ops);
+
+	ret = imx296_ctrls_init(imx);
+	if (ret < 0)
+		return ret;
+
+	imx->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	imx->pad.flags = MEDIA_PAD_FL_SOURCE;
+	imx->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	ret = media_entity_pads_init(&imx->subdev.entity, 1, &imx->pad);
+	if (ret < 0)
+		goto err_ctrls;
+
+	imx296_init_cfg(&imx->subdev, NULL);
+
+	ret = v4l2_async_register_subdev(&imx->subdev);
+	if (ret < 0)
+		goto err_entity;
+
+	return 0;
+
+err_entity:
+	media_entity_cleanup(&imx->subdev.entity);
+err_ctrls:
+	v4l2_ctrl_handler_free(&imx->ctrls);
+	return ret;
+}
+
+static int imx296_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
+	struct imx296 *imx = to_imx296(subdev);
+
+	v4l2_async_unregister_subdev(subdev);
+	media_entity_cleanup(&subdev->entity);
+	v4l2_ctrl_handler_free(&imx->ctrls);
+
+	return 0;
+}
+
+#if IS_ENABLED(CONFIG_OF)
+static const struct of_device_id imx296_of_match[] = {
+	{ .compatible = "sony,imx296" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, imx296_of_match);
+#endif
+
+static const struct i2c_device_id imx296_i2c_id[] = {
+	{ "imx296", 0 },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(i2c, imx296_i2c_id);
+
+static struct i2c_driver imx296_i2c_driver = {
+	.driver = {
+		.of_match_table = of_match_ptr(imx296_of_match),
+		.name = "imx296",
+	},
+	.probe = imx296_probe,
+	.remove = imx296_remove,
+	.id_table = imx296_i2c_id,
+};
+
+module_i2c_driver(imx296_i2c_driver);
+
+MODULE_DESCRIPTION("Sony IMX969 Camera driver");
+MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
+MODULE_LICENSE("GPL v2");
-- 
Regards,

Laurent Pinchart

