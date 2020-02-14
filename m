Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7868315D5CD
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 11:31:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387447AbgBNKbs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 05:31:48 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:34854 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729092AbgBNKbs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 05:31:48 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B968A2A;
        Fri, 14 Feb 2020 11:31:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1581676303;
        bh=uLSnYP7mx04k0pCz0oUY6+nzZLyOlX6Vzte+yLt8/8g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wlJIyVeMb+DPrZY9MKU0wHrHJu/tW8xBtPFzwQeolOR+nNWiKOcTM5EQWnNfztxI2
         88PmuLxye3RNSuz1WR95zK50KlFEfYYf6+JPeK5keLYDFtQdYIBdkvrXkDpHXk5Nxk
         AaTM/wTVrbNBm9VyarO9y22aTm9/Mo1fv8raBjGw=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hyun Kwon <hyunk@xilinx.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, sakari.ailus@iki.fi,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v7 2/2] media: i2c: Add MAX9286 driver
Date:   Fri, 14 Feb 2020 10:31:36 +0000
Message-Id: <20200214103136.12526-3-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214103136.12526-1-kieran.bingham+renesas@ideasonboard.com>
References: <20200214103136.12526-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MAX9286 is a 4-channel GMSL deserializer with coax or STP input and
CSI-2 output. The device supports multicamera streaming applications,
and features the ability to synchronise the attached cameras.

CSI-2 output can be configured with 1 to 4 lanes, and a control channel
is supported over I2C, which implements an I2C mux to facilitate
communications with connected cameras across the reverse control
channel.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

--
v2:
 - Fix MAINTAINERS entry

This posting is released with the following modifications to work
without Sakari's VC developments:
 - max9286_g_mbus_config() re-instated
 - max9286_get_frame_desc() is not bus/csi aware
 - max9286_{get,set}_routing() removed

v3:
 - Initialise notifier with v4l2_async_notifier_init
 - Update for new mbus csi2 format V4L2_MBUS_CSI2_DPHY

v4: - Re-introduce required code to function with the VC series.

 - Implement max9286_get_routing, max9286_set_routing
 - Remove max9286_g_mbus_config

v5: (internal release)
 - Fix printk formatting for hex value
 - max9286->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE (add |)
 - MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER -> MEDIA_ENT_F_VID_IF_BRIDGE
 - Remove 'device is bound' workaround

v6:
 - v4l2_subdev_krouting instead of v4l2_subdev_routing separated
   to allow integration without the VC/V4L2-Mux series.
 - convert sd_to_max9286 to inline function
 - rename max9286_device to max9286_priv
 - Cleanup the v4l2_async_notifier
 - Extend MODULE_AUTHOR
 - Replace of_graph_get_endpoint_by_regs with fwnode_graph_get_endpoint_by_id
 - Pass default bus type when parsing fwnode endpoint (Manivannan Sadhasivam)
 - Use new YAML file reference in MAINTAINERS
 - Parse new i2c-mux node in max9286_get_i2c_by_id
   (This could/should be refactored to parse these separately first)
 - Spelling and calculation fixes in the FSYNC_LOCKED check comments
 - Identify each enabled i2c-mux channel in a single pass
 - max9286: Improve mux-state readbility [v2]
 - Fix frame sync lock durations
 - Add comment to describe /why/ we must open the mux in s_stream
 - use -EXDEV as return code for failed link synchronisation.
 - Fix reference counting of the dt nodeS
 - Convert to probe_new for I2C
 - Remove redundant max9286_i2c_mux_state
 - Provide optional enable-gpio (max9286-pwdn)

v7:
 [Kieran]
 - Ensure powerdown lines are optional
 - Add a 4ms power-up delay
 - Add max9286_check_config_link() to core
 - Add GPIO chip controller for GPIO0OUT and GPIO1OUT
 - Fix GPIO registration
 - max9286: Split out async registration
   (fixes regulator -EPROBE_DEFERs failures)
 - Collect all V4L2 registrations
 - balance v4l2_async refcnting
 - Rename max9286_v4l2_async_ => max9286_v4l2_notifier_

 [Jacopo]
 - Remove redundanct MAXIM_I2C_SPEED macros
 - Move notifiers operations
 - Add delay after reverse channel reconfiguration
 - Move link setup to completion
 - Fix up max9286_check_config_link() implementation
 - Remove redundant dual configuration of reverse channel

 MAINTAINERS                 |   10 +
 drivers/media/i2c/Kconfig   |   11 +
 drivers/media/i2c/Makefile  |    1 +
 drivers/media/i2c/max9286.c | 1278 +++++++++++++++++++++++++++++++++++
 4 files changed, 1300 insertions(+)
 create mode 100644 drivers/media/i2c/max9286.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 983d3c97edd1..148706353d25 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10033,6 +10033,16 @@ F:	Documentation/devicetree/bindings/hwmon/max6697.txt
 F:	drivers/hwmon/max6697.c
 F:	include/linux/platform_data/max6697.h
 
+MAX9286 QUAD GMSL DESERIALIZER DRIVER
+M:	Jacopo Mondi <jacopo+renesas@jmondi.org>
+M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
+M:	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+M:	Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+F:	drivers/media/i2c/max9286.c
+
 MAX9860 MONO AUDIO VOICE CODEC DRIVER
 M:	Peter Rosin <peda@axentia.se>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index c68e002d26ea..32a4deb90617 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -442,6 +442,17 @@ config VIDEO_VPX3220
 	  To compile this driver as a module, choose M here: the
 	  module will be called vpx3220.
 
+config VIDEO_MAX9286
+	tristate "Maxim MAX9286 GMSL deserializer support"
+	depends on I2C && I2C_MUX
+	depends on VIDEO_V4L2_SUBDEV_API && MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	help
+	  This driver supports the Maxim MAX9286 GMSL deserializer.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called max9286.
+
 comment "Video and audio decoders"
 
 config VIDEO_SAA717X
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index c147bb9d28db..8896cf8bfc4f 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -117,5 +117,6 @@ obj-$(CONFIG_VIDEO_IMX290)	+= imx290.o
 obj-$(CONFIG_VIDEO_IMX319)	+= imx319.o
 obj-$(CONFIG_VIDEO_IMX355)	+= imx355.o
 obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
+obj-$(CONFIG_VIDEO_MAX9286)	+= max9286.o
 
 obj-$(CONFIG_SDR_MAX2175) += max2175.o
diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
new file mode 100644
index 000000000000..a20829297ef6
--- /dev/null
+++ b/drivers/media/i2c/max9286.c
@@ -0,0 +1,1278 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Maxim MAX9286 GMSL Deserializer Driver
+ *
+ * Copyright (C) 2017-2019 Jacopo Mondi
+ * Copyright (C) 2017-2019 Kieran Bingham
+ * Copyright (C) 2017-2019 Laurent Pinchart
+ * Copyright (C) 2017-2019 Niklas Söderlund
+ * Copyright (C) 2016 Renesas Electronics Corporation
+ * Copyright (C) 2015 Cogent Embedded, Inc.
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/fwnode.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/i2c.h>
+#include <linux/i2c-mux.h>
+#include <linux/module.h>
+#include <linux/of_graph.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+
+#include <media/v4l2-async.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+/* Register 0x00 */
+#define MAX9286_MSTLINKSEL_AUTO		(7 << 5)
+#define MAX9286_MSTLINKSEL(n)		((n) << 5)
+#define MAX9286_EN_VS_GEN		BIT(4)
+#define MAX9286_LINKEN(n)		(1 << (n))
+/* Register 0x01 */
+#define MAX9286_FSYNCMODE_ECU		(3 << 6)
+#define MAX9286_FSYNCMODE_EXT		(2 << 6)
+#define MAX9286_FSYNCMODE_INT_OUT	(1 << 6)
+#define MAX9286_FSYNCMODE_INT_HIZ	(0 << 6)
+#define MAX9286_GPIEN			BIT(5)
+#define MAX9286_ENLMO_RSTFSYNC		BIT(2)
+#define MAX9286_FSYNCMETH_AUTO		(2 << 0)
+#define MAX9286_FSYNCMETH_SEMI_AUTO	(1 << 0)
+#define MAX9286_FSYNCMETH_MANUAL	(0 << 0)
+#define MAX9286_REG_FSYNC_PERIOD_L	0x06
+#define MAX9286_REG_FSYNC_PERIOD_M	0x07
+#define MAX9286_REG_FSYNC_PERIOD_H	0x08
+/* Register 0x0a */
+#define MAX9286_FWDCCEN(n)		(1 << ((n) + 4))
+#define MAX9286_REVCCEN(n)		(1 << (n))
+/* Register 0x0c */
+#define MAX9286_HVEN			BIT(7)
+#define MAX9286_EDC_6BIT_HAMMING	(2 << 5)
+#define MAX9286_EDC_6BIT_CRC		(1 << 5)
+#define MAX9286_EDC_1BIT_PARITY		(0 << 5)
+#define MAX9286_DESEL			BIT(4)
+#define MAX9286_INVVS			BIT(3)
+#define MAX9286_INVHS			BIT(2)
+#define MAX9286_HVSRC_D0		(2 << 0)
+#define MAX9286_HVSRC_D14		(1 << 0)
+#define MAX9286_HVSRC_D18		(0 << 0)
+/* Register 0x0f */
+#define MAX9286_0X0F_RESERVED		BIT(3)
+/* Register 0x12 */
+#define MAX9286_CSILANECNT(n)		(((n) - 1) << 6)
+#define MAX9286_CSIDBL			BIT(5)
+#define MAX9286_DBL			BIT(4)
+#define MAX9286_DATATYPE_USER_8BIT	(11 << 0)
+#define MAX9286_DATATYPE_USER_YUV_12BIT	(10 << 0)
+#define MAX9286_DATATYPE_USER_24BIT	(9 << 0)
+#define MAX9286_DATATYPE_RAW14		(8 << 0)
+#define MAX9286_DATATYPE_RAW11		(7 << 0)
+#define MAX9286_DATATYPE_RAW10		(6 << 0)
+#define MAX9286_DATATYPE_RAW8		(5 << 0)
+#define MAX9286_DATATYPE_YUV422_10BIT	(4 << 0)
+#define MAX9286_DATATYPE_YUV422_8BIT	(3 << 0)
+#define MAX9286_DATATYPE_RGB555		(2 << 0)
+#define MAX9286_DATATYPE_RGB565		(1 << 0)
+#define MAX9286_DATATYPE_RGB888		(0 << 0)
+/* Register 0x15 */
+#define MAX9286_VC(n)			((n) << 5)
+#define MAX9286_VCTYPE			BIT(4)
+#define MAX9286_CSIOUTEN		BIT(3)
+#define MAX9286_0X15_RESV		(3 << 0)
+/* Register 0x1b */
+#define MAX9286_SWITCHIN(n)		(1 << ((n) + 4))
+#define MAX9286_ENEQ(n)			(1 << (n))
+/* Register 0x27 */
+#define MAX9286_LOCKED			BIT(7)
+/* Register 0x31 */
+#define MAX9286_FSYNC_LOCKED		BIT(6)
+/* Register 0x34 */
+#define MAX9286_I2CLOCACK		BIT(7)
+#define MAX9286_I2CSLVSH_1046NS_469NS	(3 << 5)
+#define MAX9286_I2CSLVSH_938NS_352NS	(2 << 5)
+#define MAX9286_I2CSLVSH_469NS_234NS	(1 << 5)
+#define MAX9286_I2CSLVSH_352NS_117NS	(0 << 5)
+#define MAX9286_I2CMSTBT_837KBPS	(7 << 2)
+#define MAX9286_I2CMSTBT_533KBPS	(6 << 2)
+#define MAX9286_I2CMSTBT_339KBPS	(5 << 2)
+#define MAX9286_I2CMSTBT_173KBPS	(4 << 2)
+#define MAX9286_I2CMSTBT_105KBPS	(3 << 2)
+#define MAX9286_I2CMSTBT_84KBPS		(2 << 2)
+#define MAX9286_I2CMSTBT_28KBPS		(1 << 2)
+#define MAX9286_I2CMSTBT_8KBPS		(0 << 2)
+#define MAX9286_I2CSLVTO_NONE		(3 << 0)
+#define MAX9286_I2CSLVTO_1024US		(2 << 0)
+#define MAX9286_I2CSLVTO_256US		(1 << 0)
+#define MAX9286_I2CSLVTO_64US		(0 << 0)
+/* Register 0x3b */
+#define MAX9286_REV_TRF(n)		((n) << 4)
+#define MAX9286_REV_AMP(n)		((((n) - 30) / 10) << 1) /* in mV */
+#define MAX9286_REV_AMP_X		BIT(0)
+/* Register 0x3f */
+#define MAX9286_EN_REV_CFG		BIT(6)
+#define MAX9286_REV_FLEN(n)		((n) - 20)
+/* Register 0x49 */
+#define MAX9286_VIDEO_DETECT_MASK	0x0f
+/* Register 0x69 */
+#define MAX9286_LFLTBMONMASKED		BIT(7)
+#define MAX9286_LOCKMONMASKED		BIT(6)
+#define MAX9286_AUTOCOMBACKEN		BIT(5)
+#define MAX9286_AUTOMASKEN		BIT(4)
+#define MAX9286_MASKLINK(n)		((n) << 0)
+
+#define MAX9286_NUM_GMSL		4
+#define MAX9286_N_SINKS			4
+#define MAX9286_N_PADS			5
+#define MAX9286_SRC_PAD			4
+
+struct max9286_source {
+	struct v4l2_async_subdev asd;
+	struct v4l2_subdev *sd;
+	struct fwnode_handle *fwnode;
+};
+
+#define asd_to_max9286_source(_asd) \
+	container_of(_asd, struct max9286_source, asd)
+
+struct max9286_priv {
+	struct i2c_client *client;
+	struct gpio_desc *gpiod_pwdn;
+	struct v4l2_subdev sd;
+	struct media_pad pads[MAX9286_N_PADS];
+	struct regulator *regulator;
+	bool poc_enabled;
+
+	struct gpio_chip gpio;
+	u8 gpio_state;
+
+	struct i2c_mux_core *mux;
+	unsigned int mux_channel;
+	bool mux_open;
+
+	struct v4l2_ctrl_handler ctrls;
+
+	struct v4l2_mbus_framefmt fmt[MAX9286_N_SINKS];
+
+	unsigned int nsources;
+	unsigned int source_mask;
+	unsigned int route_mask;
+	unsigned int bound_sources;
+	unsigned int csi2_data_lanes;
+	struct max9286_source sources[MAX9286_NUM_GMSL];
+	struct v4l2_async_notifier notifier;
+};
+
+static struct max9286_source *next_source(struct max9286_priv *priv,
+					  struct max9286_source *source)
+{
+	if (!source)
+		source = &priv->sources[0];
+	else
+		source++;
+
+	for (; source < &priv->sources[MAX9286_NUM_GMSL]; source++) {
+		if (source->fwnode)
+			return source;
+	}
+
+	return NULL;
+}
+
+#define for_each_source(priv, source) \
+	for ((source) = NULL; ((source) = next_source((priv), (source))); )
+
+#define to_index(priv, source) ((source) - &(priv)->sources[0])
+
+static inline struct max9286_priv *sd_to_max9286(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct max9286_priv, sd);
+}
+
+/* -----------------------------------------------------------------------------
+ * I2C IO
+ */
+
+static int max9286_read(struct max9286_priv *priv, u8 reg)
+{
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(priv->client, reg);
+	if (ret < 0)
+		dev_err(&priv->client->dev,
+			"%s: register 0x%02x read failed (%d)\n",
+			__func__, reg, ret);
+
+	return ret;
+}
+
+static int max9286_write(struct max9286_priv *priv, u8 reg, u8 val)
+{
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(priv->client, reg, val);
+	if (ret < 0)
+		dev_err(&priv->client->dev,
+			"%s: register 0x%02x write failed (%d)\n",
+			__func__, reg, ret);
+
+	return ret;
+}
+
+/* -----------------------------------------------------------------------------
+ * I2C Multiplexer
+ */
+
+static void max9286_i2c_mux_configure(struct max9286_priv *priv, u8 conf)
+{
+	max9286_write(priv, 0x0a, conf);
+
+	/*
+	 * We must sleep after any change to the forward or reverse channel
+	 * configuration.
+	 */
+	usleep_range(3000, 5000);
+}
+
+static void max9286_i2c_mux_open(struct max9286_priv *priv)
+{
+	/* Open all channels on the MAX9286 */
+	max9286_i2c_mux_configure(priv, 0xff);
+
+	priv->mux_open = true;
+}
+
+static void max9286_i2c_mux_close(struct max9286_priv *priv)
+{
+	/*
+	 * Ensure that both the forward and reverse channel are disabled on the
+	 * mux, and that the channel ID is invalidated to ensure we reconfigure
+	 * on the next max9286_i2c_mux_select() call.
+	 */
+	max9286_i2c_mux_configure(priv, 0x00);
+
+	priv->mux_open = false;
+	priv->mux_channel = -1;
+}
+
+static int max9286_i2c_mux_select(struct i2c_mux_core *muxc, u32 chan)
+{
+	struct max9286_priv *priv = i2c_mux_priv(muxc);
+
+	/* Channel select is disabled when configured in the opened state. */
+	if (priv->mux_open)
+		return 0;
+
+	if (priv->mux_channel == chan)
+		return 0;
+
+	priv->mux_channel = chan;
+
+	max9286_i2c_mux_configure(priv,
+				  MAX9286_FWDCCEN(chan) |
+				  MAX9286_REVCCEN(chan));
+
+	return 0;
+}
+
+static int max9286_i2c_mux_init(struct max9286_priv *priv)
+{
+	struct max9286_source *source;
+	int ret;
+
+	if (!i2c_check_functionality(priv->client->adapter,
+				     I2C_FUNC_SMBUS_WRITE_BYTE_DATA))
+		return -ENODEV;
+
+	priv->mux = i2c_mux_alloc(priv->client->adapter, &priv->client->dev,
+				  priv->nsources, 0, I2C_MUX_LOCKED,
+				  max9286_i2c_mux_select, NULL);
+	if (!priv->mux)
+		return -ENOMEM;
+
+	priv->mux->priv = priv;
+
+	for_each_source(priv, source) {
+		unsigned int index = to_index(priv, source);
+
+		ret = i2c_mux_add_adapter(priv->mux, 0, index, 0);
+		if (ret < 0)
+			goto error;
+	}
+
+	return 0;
+
+error:
+	i2c_mux_del_adapters(priv->mux);
+	return ret;
+}
+
+static void max9286_configure_i2c(struct max9286_priv *priv, bool localack)
+{
+	u8 config = MAX9286_I2CSLVSH_469NS_234NS | MAX9286_I2CSLVTO_1024US |
+		    MAX9286_I2CMSTBT_105KBPS;
+
+	if (localack)
+		config |= MAX9286_I2CLOCACK;
+
+	max9286_write(priv, 0x34, config);
+	usleep_range(3000, 5000);
+}
+
+/*
+ * max9286_check_video_links() - Make sure video links are detected and locked
+ *
+ * Performs safety checks on video link status. Make sure they are detected
+ * and all enabled links are locked.
+ *
+ * Returns 0 for success, -EIO for errors.
+ */
+static int max9286_check_video_links(struct max9286_priv *priv)
+{
+	unsigned int i;
+	int ret;
+
+	/*
+	 * Make sure valid video links are detected.
+	 * The delay is not characterized in de-serializer manual, wait up
+	 * to 5 ms.
+	 */
+	for (i = 0; i < 10; i++) {
+		ret = max9286_read(priv, 0x49);
+		if (ret < 0)
+			return -EIO;
+
+		if ((ret & MAX9286_VIDEO_DETECT_MASK) == priv->source_mask)
+			break;
+
+		usleep_range(350, 500);
+	}
+
+	if (i == 10) {
+		dev_err(&priv->client->dev,
+			"Unable to detect video links: 0x%02x\n", ret);
+		return -EIO;
+	}
+
+	/* Make sure all enabled links are locked (4ms max). */
+	for (i = 0; i < 10; i++) {
+		ret = max9286_read(priv, 0x27);
+		if (ret < 0)
+			return -EIO;
+
+		if (ret & MAX9286_LOCKED)
+			break;
+
+		usleep_range(350, 450);
+	}
+
+	if (i == 10) {
+		dev_err(&priv->client->dev, "Not all enabled links locked\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+/*
+ * max9286_check_config_link() - Detect and wait for configuration links
+ *
+ * Determine if the configuration channel is up and settled for a link.
+ *
+ * Returns 0 for success, -EIO for errors.
+ */
+static int max9286_check_config_link(struct max9286_priv *priv,
+				     unsigned int source_mask)
+{
+	unsigned int conflink_mask = (source_mask & 0x0f) << 4;
+	unsigned int i;
+	int ret;
+
+	/*
+	 * Make sure requested configuration links are detected.
+	 * The delay is not characterized in the chip manual: wait up
+	 * to 5 milliseconds.
+	 */
+	for (i = 0; i < 10; i++) {
+		ret = max9286_read(priv, 0x49) & 0xf0;
+		if (ret < 0)
+			return -EIO;
+
+		if (ret == conflink_mask)
+			break;
+
+		usleep_range(350, 500);
+	}
+
+	if (ret != conflink_mask) {
+		dev_err(&priv->client->dev,
+			"Unable to detect configuration links: 0x%02x expected 0x%02x\n",
+			ret, conflink_mask);
+		return -EIO;
+	}
+
+	dev_info(&priv->client->dev,
+		 "Successfully detected configuration links after %u loops: 0x%02x\n",
+		 i, conflink_mask);
+
+	return 0;
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2 Subdev
+ */
+
+static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
+				struct v4l2_subdev *subdev,
+				struct v4l2_async_subdev *asd)
+{
+	struct max9286_priv *priv = sd_to_max9286(notifier->sd);
+	struct max9286_source *source = asd_to_max9286_source(asd);
+	unsigned int index = to_index(priv, source);
+	unsigned int src_pad;
+	int ret;
+
+	ret = media_entity_get_fwnode_pad(&subdev->entity,
+					  source->fwnode,
+					  MEDIA_PAD_FL_SOURCE);
+	if (ret < 0) {
+		dev_err(&priv->client->dev,
+			"Failed to find pad for %s\n", subdev->name);
+		return ret;
+	}
+
+	priv->bound_sources |= BIT(index);
+	source->sd = subdev;
+	src_pad = ret;
+
+	ret = media_create_pad_link(&source->sd->entity, src_pad,
+				    &priv->sd.entity, index,
+				    MEDIA_LNK_FL_ENABLED |
+				    MEDIA_LNK_FL_IMMUTABLE);
+	if (ret) {
+		dev_err(&priv->client->dev,
+			"Unable to link %s:%u -> %s:%u\n",
+			source->sd->name, src_pad, priv->sd.name, index);
+		return ret;
+	}
+
+	dev_dbg(&priv->client->dev, "Bound %s pad: %u on index %u\n",
+		subdev->name, src_pad, index);
+
+	/*
+	 * We can only register v4l2_async_notifiers which do not provide a
+	 * means to register a complete callback. bound_sources allows us to
+	 * identify when all remove serializers have completed their probe.
+	 */
+	if (priv->bound_sources != priv->source_mask)
+		return 0;
+
+	/*
+	 * All enabled sources have probed and enabled their reverse control
+	 * channels:
+	 *
+	 * - Verify all configuration links are properly detected
+	 * - Disable auto-ack as communication on the control channel are now
+	 *   stable.
+	 */
+	max9286_check_config_link(priv, priv->source_mask);
+
+	/*
+	 * Re-configure I2C with local acknowledge disabled after cameras have
+	 * probed.
+	 */
+	max9286_configure_i2c(priv, false);
+
+	return 0;
+}
+
+static void max9286_notify_unbind(struct v4l2_async_notifier *notifier,
+				  struct v4l2_subdev *subdev,
+				  struct v4l2_async_subdev *asd)
+{
+	struct max9286_source *source = asd_to_max9286_source(asd);
+
+	source->sd = NULL;
+}
+
+static const struct v4l2_async_notifier_operations max9286_notify_ops = {
+	.bound = max9286_notify_bound,
+	.unbind = max9286_notify_unbind,
+};
+
+static int max9286_v4l2_notifier_register(struct max9286_priv *priv)
+{
+	struct device *dev = &priv->client->dev;
+	struct max9286_source *source = NULL;
+	int ret;
+
+	if (!priv->nsources)
+		return 0;
+
+	v4l2_async_notifier_init(&priv->notifier);
+
+	for_each_source(priv, source) {
+		unsigned int i = to_index(priv, source);
+
+		source->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
+		source->asd.match.fwnode = source->fwnode;
+
+		ret = v4l2_async_notifier_add_subdev(&priv->notifier,
+						     &source->asd);
+		if (ret) {
+			dev_err(dev, "Failed to add subdev for source %d", i);
+			v4l2_async_notifier_cleanup(&priv->notifier);
+			return ret;
+		}
+
+		/*
+		 * Balance the reference counting handled through
+		 * v4l2_async_notifier_cleanup()
+		 */
+		fwnode_handle_get(source->fwnode);
+	}
+
+	priv->notifier.ops = &max9286_notify_ops;
+
+	ret = v4l2_async_subdev_notifier_register(&priv->sd, &priv->notifier);
+	if (ret) {
+		dev_err(dev, "Failed to register subdev_notifier");
+		v4l2_async_notifier_cleanup(&priv->notifier);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void max9286_v4l2_notifier_unregister(struct max9286_priv *priv)
+{
+	if (!priv->nsources)
+		return;
+
+	v4l2_async_notifier_unregister(&priv->notifier);
+	v4l2_async_notifier_cleanup(&priv->notifier);
+}
+
+static int max9286_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct max9286_priv *priv = sd_to_max9286(sd);
+	struct max9286_source *source;
+	unsigned int i;
+	bool sync = false;
+	int ret;
+
+	if (enable) {
+		/*
+		 * The frame sync between cameras is transmitted across the
+		 * reverse channel as GPIO. We must open all channels while
+		 * streaming to allow this synchronisation signal to be shared.
+		 */
+		max9286_i2c_mux_open(priv);
+
+		/* Start all cameras. */
+		for_each_source(priv, source) {
+			ret = v4l2_subdev_call(source->sd, video, s_stream, 1);
+			if (ret)
+				return ret;
+		}
+
+		ret = max9286_check_video_links(priv);
+		if (ret)
+			return ret;
+
+		/*
+		 * Wait until frame synchronization is locked.
+		 *
+		 * Manual says frame sync locking should take ~6 VTS.
+		 * From practical experience at least 8 are required. Give
+		 * 12 complete frames time (~400ms at 30 fps) to achieve frame
+		 * locking before returning error.
+		 */
+		for (i = 0; i < 40; i++) {
+			if (max9286_read(priv, 0x31) & MAX9286_FSYNC_LOCKED) {
+				sync = true;
+				break;
+			}
+			usleep_range(9000, 11000);
+		}
+
+		if (!sync) {
+			dev_err(&priv->client->dev,
+				"Failed to get frame synchronization\n");
+			return -EXDEV; /* Invalid cross-device link */
+		}
+
+		/*
+		 * Enable CSI output, VC set according to link number.
+		 * Bit 7 must be set (chip manual says it's 0 and reserved).
+		 */
+		max9286_write(priv, 0x15, 0x80 | MAX9286_VCTYPE |
+			      MAX9286_CSIOUTEN | MAX9286_0X15_RESV);
+	} else {
+		max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);
+
+		/* Stop all cameras. */
+		for_each_source(priv, source)
+			v4l2_subdev_call(source->sd, video, s_stream, 0);
+
+		max9286_i2c_mux_close(priv);
+	}
+
+	return 0;
+}
+
+static int max9286_enum_mbus_code(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_pad_config *cfg,
+				  struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->pad || code->index > 0)
+		return -EINVAL;
+
+	code->code = MEDIA_BUS_FMT_UYVY8_2X8;
+
+	return 0;
+}
+
+static struct v4l2_mbus_framefmt *
+max9286_get_pad_format(struct max9286_priv *priv,
+		       struct v4l2_subdev_pad_config *cfg,
+		       unsigned int pad, u32 which)
+{
+	switch (which) {
+	case V4L2_SUBDEV_FORMAT_TRY:
+		return v4l2_subdev_get_try_format(&priv->sd, cfg, pad);
+	case V4L2_SUBDEV_FORMAT_ACTIVE:
+		return &priv->fmt[pad];
+	default:
+		return NULL;
+	}
+}
+
+static int max9286_set_fmt(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_format *format)
+{
+	struct max9286_priv *priv = sd_to_max9286(sd);
+	struct v4l2_mbus_framefmt *cfg_fmt;
+
+	if (format->pad >= MAX9286_SRC_PAD)
+		return -EINVAL;
+
+	/* Refuse non YUV422 formats as we hardcode DT to 8 bit YUV422 */
+	switch (format->format.code) {
+	case MEDIA_BUS_FMT_UYVY8_2X8:
+	case MEDIA_BUS_FMT_VYUY8_2X8:
+	case MEDIA_BUS_FMT_YUYV8_2X8:
+	case MEDIA_BUS_FMT_YVYU8_2X8:
+		break;
+	default:
+		format->format.code = MEDIA_BUS_FMT_YUYV8_2X8;
+		break;
+	}
+
+	cfg_fmt = max9286_get_pad_format(priv, cfg, format->pad, format->which);
+	if (!cfg_fmt)
+		return -EINVAL;
+
+	*cfg_fmt = format->format;
+
+	return 0;
+}
+
+static int max9286_get_fmt(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_pad_config *cfg,
+			   struct v4l2_subdev_format *format)
+{
+	struct max9286_priv *priv = sd_to_max9286(sd);
+	struct v4l2_mbus_framefmt *cfg_fmt;
+
+	if (format->pad >= MAX9286_SRC_PAD)
+		return -EINVAL;
+
+	cfg_fmt = max9286_get_pad_format(priv, cfg, format->pad, format->which);
+	if (!cfg_fmt)
+		return -EINVAL;
+
+	format->format = *cfg_fmt;
+
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops max9286_video_ops = {
+	.s_stream	= max9286_s_stream,
+};
+
+static const struct v4l2_subdev_pad_ops max9286_pad_ops = {
+	.enum_mbus_code = max9286_enum_mbus_code,
+	.get_fmt	= max9286_get_fmt,
+	.set_fmt	= max9286_set_fmt,
+};
+
+static const struct v4l2_subdev_ops max9286_subdev_ops = {
+	.video		= &max9286_video_ops,
+	.pad		= &max9286_pad_ops,
+};
+
+static void max9286_init_format(struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->width		= 1280;
+	fmt->height		= 800;
+	fmt->code		= MEDIA_BUS_FMT_UYVY8_2X8;
+	fmt->colorspace		= V4L2_COLORSPACE_SRGB;
+	fmt->field		= V4L2_FIELD_NONE;
+	fmt->ycbcr_enc		= V4L2_YCBCR_ENC_DEFAULT;
+	fmt->quantization	= V4L2_QUANTIZATION_DEFAULT;
+	fmt->xfer_func		= V4L2_XFER_FUNC_DEFAULT;
+}
+
+static int max9286_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
+{
+	struct v4l2_mbus_framefmt *format;
+	unsigned int i;
+
+	for (i = 0; i < MAX9286_N_SINKS; i++) {
+		format = v4l2_subdev_get_try_format(subdev, fh->pad, i);
+		max9286_init_format(format);
+	}
+
+	return 0;
+}
+
+static const struct v4l2_subdev_internal_ops max9286_subdev_internal_ops = {
+	.open = max9286_open,
+};
+
+static int max9286_v4l2_register(struct max9286_priv *priv)
+{
+	struct device *dev = &priv->client->dev;
+	struct fwnode_handle *ep;
+	int ret;
+	int i;
+
+	/* Register v4l2 async notifiers for connected Camera subdevices */
+	ret = max9286_v4l2_notifier_register(priv);
+	if (ret) {
+		dev_err(dev, "Unable to register V4L2 async notifiers\n");
+		return ret;
+	}
+
+	/* Configure V4L2 for the MAX9286 itself */
+
+	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max9286_subdev_ops);
+	priv->sd.internal_ops = &max9286_subdev_internal_ops;
+	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+
+	v4l2_ctrl_handler_init(&priv->ctrls, 1);
+	/*
+	 * FIXME: Compute the real pixel rate. The 50 MP/s value comes from the
+	 * hardcoded frequency in the BSP CSI-2 receiver driver.
+	 */
+	v4l2_ctrl_new_std(&priv->ctrls, NULL, V4L2_CID_PIXEL_RATE,
+			  50000000, 50000000, 1, 50000000);
+	priv->sd.ctrl_handler = &priv->ctrls;
+	ret = priv->ctrls.error;
+	if (ret)
+		goto err_async;
+
+	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+
+	priv->pads[MAX9286_SRC_PAD].flags = MEDIA_PAD_FL_SOURCE;
+	for (i = 0; i < MAX9286_SRC_PAD; i++)
+		priv->pads[i].flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&priv->sd.entity, MAX9286_N_PADS,
+				     priv->pads);
+	if (ret)
+		goto err_async;
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), MAX9286_SRC_PAD,
+					     0, 0);
+	if (!ep) {
+		dev_err(dev, "Unable to retrieve endpoint on \"port@4\"\n");
+		ret = -ENOENT;
+		goto err_async;
+	}
+	priv->sd.fwnode = ep;
+
+	ret = v4l2_async_register_subdev(&priv->sd);
+	if (ret < 0) {
+		dev_err(dev, "Unable to register subdevice\n");
+		goto err_put_node;
+	}
+
+	return 0;
+
+err_put_node:
+	fwnode_handle_put(ep);
+err_async:
+	max9286_v4l2_notifier_unregister(priv);
+
+	return ret;
+}
+
+static void max9286_v4l2_unregister(struct max9286_priv *priv)
+{
+	fwnode_handle_put(priv->sd.fwnode);
+	v4l2_async_unregister_subdev(&priv->sd);
+	max9286_v4l2_notifier_unregister(priv);
+}
+
+/* -----------------------------------------------------------------------------
+ * Probe/Remove
+ */
+
+static int max9286_setup(struct max9286_priv *priv)
+{
+	/*
+	 * Link ordering values for all enabled links combinations. Orders must
+	 * be assigned sequentially from 0 to the number of enabled links
+	 * without leaving any hole for disabled links. We thus assign orders to
+	 * enabled links first, and use the remaining order values for disabled
+	 * links are all links must have a different order value;
+	 */
+	static const u8 link_order[] = {
+		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* xxxx */
+		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* xxx0 */
+		(3 << 6) | (2 << 4) | (0 << 2) | (1 << 0), /* xx0x */
+		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* xx10 */
+		(3 << 6) | (0 << 4) | (2 << 2) | (1 << 0), /* x0xx */
+		(3 << 6) | (1 << 4) | (2 << 2) | (0 << 0), /* x1x0 */
+		(3 << 6) | (1 << 4) | (0 << 2) | (2 << 0), /* x10x */
+		(3 << 6) | (1 << 4) | (1 << 2) | (0 << 0), /* x210 */
+		(0 << 6) | (3 << 4) | (2 << 2) | (1 << 0), /* 0xxx */
+		(1 << 6) | (3 << 4) | (2 << 2) | (0 << 0), /* 1xx0 */
+		(1 << 6) | (3 << 4) | (0 << 2) | (2 << 0), /* 1x0x */
+		(2 << 6) | (3 << 4) | (1 << 2) | (0 << 0), /* 2x10 */
+		(1 << 6) | (0 << 4) | (3 << 2) | (2 << 0), /* 10xx */
+		(2 << 6) | (1 << 4) | (3 << 2) | (0 << 0), /* 21x0 */
+		(2 << 6) | (1 << 4) | (0 << 2) | (3 << 0), /* 210x */
+		(3 << 6) | (2 << 4) | (1 << 2) | (0 << 0), /* 3210 */
+	};
+
+	/*
+	 * Set the I2C bus speed.
+	 *
+	 * Enable I2C Local Acknowledge during the probe sequences of the camera
+	 * only. This should be disabled after the mux is initialised.
+	 */
+	max9286_configure_i2c(priv, true);
+
+	/*
+	 * Reverse channel setup.
+	 *
+	 * - Enable custom reverse channel configuration (through register 0x3f)
+	 *   and set the first pulse length to 35 clock cycles.
+	 * - Increase the reverse channel amplitude to 170mV to accommodate the
+	 *   high threshold enabled by the serializer driver.
+	 */
+	max9286_write(priv, 0x3f, MAX9286_EN_REV_CFG | MAX9286_REV_FLEN(35));
+	max9286_write(priv, 0x3b, MAX9286_REV_TRF(1) | MAX9286_REV_AMP(70) |
+		      MAX9286_REV_AMP_X);
+	usleep_range(2000, 2500);
+
+	/*
+	 * Enable GMSL links, mask unused ones and autodetect link
+	 * used as CSI clock source.
+	 */
+	max9286_write(priv, 0x00, MAX9286_MSTLINKSEL_AUTO | priv->route_mask);
+	max9286_write(priv, 0x0b, link_order[priv->route_mask]);
+	max9286_write(priv, 0x69, (0xf & ~priv->route_mask));
+
+	/*
+	 * Video format setup:
+	 * Disable CSI output, VC is set according to Link number.
+	 */
+	max9286_write(priv, 0x15, MAX9286_VCTYPE | MAX9286_0X15_RESV);
+
+	/* Enable CSI-2 Lane D0-D3 only, DBL mode, YUV422 8-bit. */
+	max9286_write(priv, 0x12, MAX9286_CSIDBL | MAX9286_DBL |
+		      MAX9286_CSILANECNT(priv->csi2_data_lanes) |
+		      MAX9286_DATATYPE_YUV422_8BIT);
+
+	/* Automatic: FRAMESYNC taken from the slowest Link. */
+	max9286_write(priv, 0x01, MAX9286_FSYNCMODE_INT_HIZ |
+		      MAX9286_FSYNCMETH_AUTO);
+
+	/* Enable HS/VS encoding, use D14/15 for HS/VS, invert VS. */
+	max9286_write(priv, 0x0c, MAX9286_HVEN | MAX9286_INVVS |
+		      MAX9286_HVSRC_D14);
+
+	/*
+	 * Wait for 2ms to allow the link to resynchronize after the
+	 * configuration change.
+	 */
+	usleep_range(2000, 5000);
+
+	return 0;
+}
+
+static const struct of_device_id max9286_dt_ids[] = {
+	{ .compatible = "maxim,max9286" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, max9286_dt_ids);
+
+static void max9286_gpio_set(struct gpio_chip *chip,
+			     unsigned int offset, int value)
+{
+	struct max9286_priv *priv = gpiochip_get_data(chip);
+
+	if (value)
+		priv->gpio_state |= BIT(offset);
+	else
+		priv->gpio_state &= ~BIT(offset);
+
+	max9286_write(priv, 0x0f, MAX9286_0X0F_RESERVED | priv->gpio_state);
+}
+
+static int max9286_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct max9286_priv *priv = gpiochip_get_data(chip);
+
+	return priv->gpio_state & BIT(offset);
+}
+
+static int max9286_gpio(struct max9286_priv *priv)
+{
+	struct device *dev = &priv->client->dev;
+	struct gpio_chip *gpio = &priv->gpio;
+	int ret;
+
+	static const char * const names[] = {
+		"GPIO0OUT",
+		"GPIO1OUT",
+	};
+
+	/* Configure the GPIO */
+	gpio->label = dev_name(dev);
+	gpio->parent = dev;
+	gpio->owner = THIS_MODULE;
+	gpio->of_node = dev->of_node;
+	gpio->ngpio = 2;
+	gpio->base = -1;
+	gpio->set = max9286_gpio_set;
+	gpio->get = max9286_gpio_get;
+	gpio->can_sleep = true;
+	gpio->names = names;
+
+	/* GPIO values default to high */
+	priv->gpio_state = BIT(0) | BIT(1);
+
+	ret = devm_gpiochip_add_data(dev, gpio, priv);
+	if (ret)
+		dev_err(dev, "Unable to create gpio_chip\n");
+
+	return ret;
+}
+
+static int max9286_init(struct device *dev)
+{
+	struct max9286_priv *priv;
+	struct i2c_client *client;
+	int ret;
+
+	/* Skip non-max9286 devices. */
+	if (!dev->of_node || !of_match_node(max9286_dt_ids, dev->of_node))
+		return 0;
+
+	client = to_i2c_client(dev);
+	priv = i2c_get_clientdata(client);
+
+	/* Enable the bus power. */
+	ret = regulator_enable(priv->regulator);
+	if (ret < 0) {
+		dev_err(&client->dev, "Unable to turn PoC on\n");
+		return ret;
+	}
+
+	priv->poc_enabled = true;
+
+	ret = max9286_setup(priv);
+	if (ret) {
+		dev_err(dev, "Unable to setup max9286\n");
+		goto err_regulator;
+	}
+
+	/*
+	 * Register all V4L2 interactions for the MAX9286 and notifiers for
+	 * any subdevices connected.
+	 */
+	ret = max9286_v4l2_register(priv);
+	if (ret) {
+		dev_err(dev, "Failed to register with V4L2\n");
+		goto err_regulator;
+	}
+
+	ret = max9286_i2c_mux_init(priv);
+	if (ret) {
+		dev_err(dev, "Unable to initialize I2C multiplexer\n");
+		goto err_v4l2_register;
+	}
+
+	/* Leave the mux channels disabled until they are selected. */
+	max9286_i2c_mux_close(priv);
+
+	return 0;
+
+err_v4l2_register:
+	max9286_v4l2_unregister(priv);
+err_regulator:
+	regulator_disable(priv->regulator);
+	priv->poc_enabled = false;
+
+	return ret;
+}
+
+static void max9286_cleanup_dt(struct max9286_priv *priv)
+{
+	struct max9286_source *source;
+
+	for_each_source(priv, source) {
+		fwnode_handle_put(source->fwnode);
+		source->fwnode = NULL;
+	}
+}
+
+static int max9286_parse_dt(struct max9286_priv *priv)
+{
+	struct device *dev = &priv->client->dev;
+	struct device_node *i2c_mux;
+	struct device_node *node = NULL;
+	unsigned int i2c_mux_mask = 0;
+
+	of_node_get(dev->of_node);
+	i2c_mux = of_find_node_by_name(dev->of_node, "i2c-mux");
+	if (!i2c_mux) {
+		dev_err(dev, "Failed to find i2c-mux node\n");
+		return -EINVAL;
+	}
+
+	/* Identify which i2c-mux channels are enabled */
+	for_each_child_of_node(i2c_mux, node) {
+		u32 id = 0;
+
+		of_property_read_u32(node, "reg", &id);
+		if (id >= MAX9286_NUM_GMSL)
+			continue;
+
+		if (!of_device_is_available(node)) {
+			dev_dbg(dev, "Skipping disabled I2C bus port %u\n",
+				id);
+			continue;
+		}
+
+		i2c_mux_mask |= BIT(id);
+	}
+	of_node_put(node);
+	of_node_put(i2c_mux);
+
+	/* Parse the endpoints */
+	for_each_endpoint_of_node(dev->of_node, node) {
+		struct max9286_source *source;
+		struct of_endpoint ep;
+
+		of_graph_parse_endpoint(node, &ep);
+		dev_dbg(dev, "Endpoint %pOF on port %d",
+			ep.local_node, ep.port);
+
+		if (ep.port > MAX9286_NUM_GMSL) {
+			dev_err(dev, "Invalid endpoint %s on port %d",
+				of_node_full_name(ep.local_node), ep.port);
+			continue;
+		}
+
+		/* For the source endpoint just parse the bus configuration. */
+		if (ep.port == MAX9286_SRC_PAD) {
+			struct v4l2_fwnode_endpoint vep = {
+				.bus_type = V4L2_MBUS_CSI2_DPHY
+			};
+			int ret;
+
+			ret = v4l2_fwnode_endpoint_parse(
+					of_fwnode_handle(node), &vep);
+			if (ret) {
+				of_node_put(node);
+				return ret;
+			}
+
+			if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
+				dev_err(dev,
+					"Media bus %u type not supported\n",
+					vep.bus_type);
+				v4l2_fwnode_endpoint_free(&vep);
+				of_node_put(node);
+				return -EINVAL;
+			}
+
+			priv->csi2_data_lanes =
+				vep.bus.mipi_csi2.num_data_lanes;
+			v4l2_fwnode_endpoint_free(&vep);
+
+			continue;
+		}
+
+		/* Skip if the corresponding GMSL link is unavailable. */
+		if (!(i2c_mux_mask & BIT(ep.port)))
+			continue;
+
+		if (priv->sources[ep.port].fwnode) {
+			dev_err(dev,
+				"Multiple port endpoints are not supported: %d",
+				ep.port);
+
+			continue;
+		}
+
+		source = &priv->sources[ep.port];
+		source->fwnode = fwnode_graph_get_remote_endpoint(
+						of_fwnode_handle(node));
+		if (!source->fwnode) {
+			dev_err(dev,
+				"Endpoint %pOF has no remote endpoint connection\n",
+				ep.local_node);
+
+			continue;
+		}
+
+		priv->source_mask |= BIT(ep.port);
+		priv->nsources++;
+	}
+	of_node_put(node);
+
+	priv->route_mask = priv->source_mask;
+
+	return 0;
+}
+
+static int max9286_probe(struct i2c_client *client)
+{
+	struct max9286_priv *priv;
+	unsigned int i;
+	int ret;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->client = client;
+	i2c_set_clientdata(client, priv);
+
+	for (i = 0; i < MAX9286_N_SINKS; i++)
+		max9286_init_format(&priv->fmt[i]);
+
+	ret = max9286_parse_dt(priv);
+	if (ret)
+		return ret;
+
+	priv->gpiod_pwdn = devm_gpiod_get_optional(&client->dev, "enable",
+						   GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->gpiod_pwdn))
+		return PTR_ERR(priv->gpiod_pwdn);
+
+	gpiod_set_consumer_name(priv->gpiod_pwdn, "max9286-pwdn");
+	gpiod_set_value_cansleep(priv->gpiod_pwdn, 1);
+
+	/* Wait at least 4ms before the I2C lines latch to the address */
+	if (priv->gpiod_pwdn)
+		usleep_range(4000, 5000);
+
+	ret = max9286_gpio(priv);
+	if (ret)
+		return ret;
+
+	priv->regulator = regulator_get(&client->dev, "poc");
+	if (IS_ERR(priv->regulator)) {
+		if (PTR_ERR(priv->regulator) != -EPROBE_DEFER)
+			dev_err(&client->dev,
+				"Unable to get PoC regulator (%ld)\n",
+				PTR_ERR(priv->regulator));
+		ret = PTR_ERR(priv->regulator);
+		priv->regulator = NULL;
+		goto err_free;
+	}
+
+	/*
+	 * We can have multiple MAX9286 instances on the same physical I2C
+	 * bus, and I2C children behind ports of separate MAX9286 instances
+	 * having the same I2C address. As the MAX9286 starts by default with
+	 * all ports enabled, we need to disable all ports on all MAX9286
+	 * instances before proceeding to further initialize the devices and
+	 * instantiate children.
+	 *
+	 * Start by just disabling all channels on the current device. Then,
+	 * if all other MAX9286 on the parent bus have been probed, proceed
+	 * to initialize them all, including the current one.
+	 */
+	max9286_i2c_mux_close(priv);
+
+	/*
+	 * The MAX9286 initialises with auto-acknowledge enabled by default.
+	 * This means that if multiple MAX9286 devices are connected to an I2C
+	 * bus, another MAX9286 could ack I2C transfers meant for a device on
+	 * the other side of the GMSL links for this MAX9286 (such as a
+	 * MAX9271). To prevent that disable auto-acknowledge early on; it
+	 * will be enabled later as needed.
+	 */
+	max9286_configure_i2c(priv, false);
+
+	ret = max9286_init(&client->dev);
+	if (ret < 0)
+		goto err_regulator;
+
+	return 0;
+
+err_regulator:
+	regulator_put(priv->regulator);
+	max9286_i2c_mux_close(priv);
+	max9286_configure_i2c(priv, false);
+err_free:
+	max9286_cleanup_dt(priv);
+	kfree(priv);
+
+	return ret;
+}
+
+static int max9286_remove(struct i2c_client *client)
+{
+	struct max9286_priv *priv = i2c_get_clientdata(client);
+
+	i2c_mux_del_adapters(priv->mux);
+
+	max9286_v4l2_unregister(priv);
+
+	if (priv->poc_enabled)
+		regulator_disable(priv->regulator);
+	regulator_put(priv->regulator);
+
+	max9286_cleanup_dt(priv);
+
+	gpiod_set_value_cansleep(priv->gpiod_pwdn, 0);
+
+	kfree(priv);
+
+	return 0;
+}
+
+static const struct i2c_device_id max9286_id[] = {
+	{ "max9286", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, max9286_id);
+
+static struct i2c_driver max9286_i2c_driver = {
+	.driver	= {
+		.name		= "max9286",
+		.of_match_table	= of_match_ptr(max9286_dt_ids),
+	},
+	.probe_new	= max9286_probe,
+	.remove		= max9286_remove,
+	.id_table	= max9286_id,
+};
+
+module_i2c_driver(max9286_i2c_driver);
+
+MODULE_DESCRIPTION("Maxim MAX9286 GMSL Deserializer Driver");
+MODULE_AUTHOR("Jacopo Mondi, Kieran Bingham, Laurent Pinchart, Niklas Söderlund, Vladimir Barinov");
+MODULE_LICENSE("GPL");
-- 
2.20.1

