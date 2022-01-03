Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2144834B4
	for <lists+linux-media@lfdr.de>; Mon,  3 Jan 2022 17:24:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234458AbiACQYb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 11:24:31 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:56406 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234320AbiACQYa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 11:24:30 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7536CC;
        Mon,  3 Jan 2022 17:24:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641227069;
        bh=IWVL94j/oRTqBTrmtmHvUj7uL5FFtisA9dMR1ZaeuM4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DjEXrsPcRm3/Eqy4kIeMdAhtQ+xeokm440u1+JBek5otL3zGEIi0EdlBjge7e2/ze
         AySPjJprFo4Oq0QLzdVXWKKCrrhVmSs+ULIGNWL7+YdGkmVvddQ/mMmDlCQmlMRfIO
         vWWgjJoqGmquBbxltGWizI7b7Q4yI4xmuLnBWSRQ=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Mats Randgaard <matrandg@cisco.com>,
        Robert Foss <robert.foss@linaro.org>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: [RFC PATCH 4/8] media: v4l2-fwnode: Move bus config structure to v4l2_mediabus.h
Date:   Mon,  3 Jan 2022 18:24:10 +0200
Message-Id: <20220103162414.27723-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To prepare for usage of the v4l2_fwnode_bus_* data structures to
describe bus configuration in the subdev .get_mbus_config() operation,
rename the structures with a v4l2_mbus_config_ prefix instead of
v4l2_fwnode_bus_, and move them to v4l2_mediabus.h.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/ov5648.c                    |  4 +-
 drivers/media/i2c/ov8865.c                    |  4 +-
 drivers/media/i2c/tc358743.c                  |  2 +-
 drivers/media/platform/qcom/camss/camss.c     |  2 +-
 drivers/media/platform/rcar-vin/rcar-vin.h    |  2 +-
 drivers/media/platform/stm32/stm32-dcmi.c     |  2 +-
 .../platform/sunxi/sun4i-csi/sun4i_csi.h      |  2 +-
 .../platform/sunxi/sun4i-csi/sun4i_dma.c      |  2 +-
 drivers/media/platform/ti-vpe/cal-camerarx.c  |  6 +-
 drivers/media/v4l2-core/v4l2-fwnode.c         | 12 ++--
 drivers/staging/media/imx/imx7-mipi-csis.c    |  2 +-
 drivers/staging/media/imx/imx8mq-mipi-csi2.c  |  2 +-
 drivers/staging/media/max96712/max96712.c     |  2 +-
 include/media/v4l2-fwnode.h                   | 61 ++-----------------
 include/media/v4l2-mediabus.h                 | 49 +++++++++++++++
 15 files changed, 77 insertions(+), 77 deletions(-)

diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index 947d437ed0ef..87f9b724cd7f 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -1112,7 +1112,7 @@ static int ov5648_pad_configure(struct ov5648_sensor *sensor)
 
 static int ov5648_mipi_configure(struct ov5648_sensor *sensor)
 {
-	struct v4l2_fwnode_bus_mipi_csi2 *bus_mipi_csi2 =
+	struct v4l2_mbus_config_mipi_csi2 *bus_mipi_csi2 =
 		&sensor->endpoint.bus.mipi_csi2;
 	unsigned int lanes_count = bus_mipi_csi2->num_data_lanes;
 	int ret;
@@ -1692,7 +1692,7 @@ static int ov5648_state_mipi_configure(struct ov5648_sensor *sensor,
 				       u32 mbus_code)
 {
 	struct ov5648_ctrls *ctrls = &sensor->ctrls;
-	struct v4l2_fwnode_bus_mipi_csi2 *bus_mipi_csi2 =
+	struct v4l2_mbus_config_mipi_csi2 *bus_mipi_csi2 =
 		&sensor->endpoint.bus.mipi_csi2;
 	unsigned long mipi_clk_rate;
 	unsigned int bits_per_sample;
diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index d9d016cfa9ac..2b18d8e54098 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -1471,7 +1471,7 @@ static int ov8865_charge_pump_configure(struct ov8865_sensor *sensor)
 
 static int ov8865_mipi_configure(struct ov8865_sensor *sensor)
 {
-	struct v4l2_fwnode_bus_mipi_csi2 *bus_mipi_csi2 =
+	struct v4l2_mbus_config_mipi_csi2 *bus_mipi_csi2 =
 		&sensor->endpoint.bus.mipi_csi2;
 	unsigned int lanes_count = bus_mipi_csi2->num_data_lanes;
 	int ret;
@@ -2241,7 +2241,7 @@ static int ov8865_state_mipi_configure(struct ov8865_sensor *sensor,
 				       u32 mbus_code)
 {
 	struct ov8865_ctrls *ctrls = &sensor->ctrls;
-	struct v4l2_fwnode_bus_mipi_csi2 *bus_mipi_csi2 =
+	struct v4l2_mbus_config_mipi_csi2 *bus_mipi_csi2 =
 		&sensor->endpoint.bus.mipi_csi2;
 	unsigned long mipi_clk_rate;
 	unsigned int bits_per_sample;
diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 3205cd8298dd..40512004afba 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -69,7 +69,7 @@ static const struct v4l2_dv_timings_cap tc358743_timings_cap = {
 
 struct tc358743_state {
 	struct tc358743_platform_data pdata;
-	struct v4l2_fwnode_bus_mipi_csi2 bus;
+	struct v4l2_mbus_config_mipi_csi2 bus;
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct v4l2_ctrl_handler hdl;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index be091c50a3c0..76bd3d4eabb6 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -832,7 +832,7 @@ static int camss_of_parse_endpoint_node(struct device *dev,
 					struct camss_async_subdev *csd)
 {
 	struct csiphy_lanes_cfg *lncfg = &csd->interface.csi2.lane_cfg;
-	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2;
+	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
 	struct v4l2_fwnode_endpoint vep = { { 0 } };
 	unsigned int i;
 
diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
index 6c06320174a2..7e86e35ca42b 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -118,7 +118,7 @@ struct rvin_parallel_entity {
 	struct v4l2_subdev *subdev;
 
 	enum v4l2_mbus_type mbus_type;
-	struct v4l2_fwnode_bus_parallel bus;
+	struct v4l2_mbus_config_parallel bus;
 
 	unsigned int source_pad;
 	unsigned int sink_pad;
diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index e1b17c05229c..7694ffef5c00 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -150,7 +150,7 @@ struct stm32_dcmi {
 	struct mutex			lock;
 	struct vb2_queue		queue;
 
-	struct v4l2_fwnode_bus_parallel	bus;
+	struct v4l2_mbus_config_parallel	bus;
 	enum v4l2_mbus_type		bus_type;
 	struct completion		complete;
 	struct clk			*mclk;
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
index a5f61ee0ec4d..8eeed87bfb13 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
@@ -124,7 +124,7 @@ struct sun4i_csi {
 		dma_addr_t		paddr;
 	} scratch;
 
-	struct v4l2_fwnode_bus_parallel	bus;
+	struct v4l2_mbus_config_parallel	bus;
 
 	/* Main Device */
 	struct v4l2_device		v4l;
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
index 2c39cd7f2862..0912a1b6d525 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c
@@ -226,7 +226,7 @@ static void return_all_buffers(struct sun4i_csi *csi,
 static int sun4i_csi_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct sun4i_csi *csi = vb2_get_drv_priv(vq);
-	struct v4l2_fwnode_bus_parallel *bus = &csi->bus;
+	struct v4l2_mbus_config_parallel *bus = &csi->bus;
 	const struct sun4i_csi_format *csi_fmt;
 	unsigned long href_pol, pclk_pol, vref_pol;
 	unsigned long flags;
diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
index 4bf7a8c2e711..6b43a1525b45 100644
--- a/drivers/media/platform/ti-vpe/cal-camerarx.c
+++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
@@ -47,7 +47,7 @@ static inline void camerarx_write(struct cal_camerarx *phy, u32 offset, u32 val)
 
 static s64 cal_camerarx_get_ext_link_freq(struct cal_camerarx *phy)
 {
-	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 = &phy->endpoint.bus.mipi_csi2;
+	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2 = &phy->endpoint.bus.mipi_csi2;
 	u32 num_lanes = mipi_csi2->num_data_lanes;
 	const struct cal_format_info *fmtinfo;
 	u32 bpp;
@@ -76,7 +76,7 @@ static void cal_camerarx_lane_config(struct cal_camerarx *phy)
 	u32 val = cal_read(phy->cal, CAL_CSI2_COMPLEXIO_CFG(phy->instance));
 	u32 lane_mask = CAL_CSI2_COMPLEXIO_CFG_CLOCK_POSITION_MASK;
 	u32 polarity_mask = CAL_CSI2_COMPLEXIO_CFG_CLOCK_POL_MASK;
-	struct v4l2_fwnode_bus_mipi_csi2 *mipi_csi2 =
+	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2 =
 		&phy->endpoint.bus.mipi_csi2;
 	int lane;
 
@@ -518,7 +518,7 @@ static int cal_camerarx_regmap_init(struct cal_dev *cal,
 static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
 {
 	struct v4l2_fwnode_endpoint *endpoint = &phy->endpoint;
-	char data_lanes[V4L2_FWNODE_CSI2_MAX_DATA_LANES * 2];
+	char data_lanes[V4L2_MBUS_CSI2_MAX_DATA_LANES * 2];
 	struct device_node *ep_node;
 	unsigned int i;
 	int ret;
diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 00457e1e93f6..9ff3ebb230e7 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -119,11 +119,11 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 					       struct v4l2_fwnode_endpoint *vep,
 					       enum v4l2_mbus_type bus_type)
 {
-	struct v4l2_fwnode_bus_mipi_csi2 *bus = &vep->bus.mipi_csi2;
+	struct v4l2_mbus_config_mipi_csi2 *bus = &vep->bus.mipi_csi2;
 	bool have_clk_lane = false, have_data_lanes = false,
 		have_lane_polarities = false;
 	unsigned int flags = 0, lanes_used = 0;
-	u32 array[1 + V4L2_FWNODE_CSI2_MAX_DATA_LANES];
+	u32 array[1 + V4L2_MBUS_CSI2_MAX_DATA_LANES];
 	u32 clock_lane = 0;
 	unsigned int num_data_lanes = 0;
 	bool use_default_lane_mapping = false;
@@ -136,7 +136,7 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 		use_default_lane_mapping = true;
 
 		num_data_lanes = min_t(u32, bus->num_data_lanes,
-				       V4L2_FWNODE_CSI2_MAX_DATA_LANES);
+				       V4L2_MBUS_CSI2_MAX_DATA_LANES);
 
 		clock_lane = bus->clock_lane;
 		if (clock_lane)
@@ -155,7 +155,7 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 	rval = fwnode_property_count_u32(fwnode, "data-lanes");
 	if (rval > 0) {
 		num_data_lanes =
-			min_t(int, V4L2_FWNODE_CSI2_MAX_DATA_LANES, rval);
+			min_t(int, V4L2_MBUS_CSI2_MAX_DATA_LANES, rval);
 
 		fwnode_property_read_u32_array(fwnode, "data-lanes", array,
 					       num_data_lanes);
@@ -263,7 +263,7 @@ v4l2_fwnode_endpoint_parse_parallel_bus(struct fwnode_handle *fwnode,
 					struct v4l2_fwnode_endpoint *vep,
 					enum v4l2_mbus_type bus_type)
 {
-	struct v4l2_fwnode_bus_parallel *bus = &vep->bus.parallel;
+	struct v4l2_mbus_config_parallel *bus = &vep->bus.parallel;
 	unsigned int flags = 0;
 	u32 v;
 
@@ -369,7 +369,7 @@ v4l2_fwnode_endpoint_parse_csi1_bus(struct fwnode_handle *fwnode,
 				    struct v4l2_fwnode_endpoint *vep,
 				    enum v4l2_mbus_type bus_type)
 {
-	struct v4l2_fwnode_bus_mipi_csi1 *bus = &vep->bus.mipi_csi1;
+	struct v4l2_mbus_config_mipi_csi1 *bus = &vep->bus.mipi_csi1;
 	u32 v;
 
 	if (!fwnode_property_read_u32(fwnode, "clock-inv", &v)) {
diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 2b73fa55c938..b7afa5351634 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -318,7 +318,7 @@ struct csi_state {
 	struct v4l2_async_notifier notifier;
 	struct v4l2_subdev *src_sd;
 
-	struct v4l2_fwnode_bus_mipi_csi2 bus;
+	struct v4l2_mbus_config_mipi_csi2 bus;
 	u32 clk_frequency;
 	u32 hs_settle;
 	u32 clk_settle;
diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
index 7adbdd14daa9..5facf1b140a3 100644
--- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
@@ -117,7 +117,7 @@ struct csi_state {
 	struct v4l2_async_notifier notifier;
 	struct v4l2_subdev *src_sd;
 
-	struct v4l2_fwnode_bus_mipi_csi2 bus;
+	struct v4l2_mbus_config_mipi_csi2 bus;
 
 	struct mutex lock; /* Protect csi2_fmt, format_mbus, state, hs_settle */
 	const struct csi2_pix_format *csi2_fmt;
diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 9bc72d9a858b..6b5abd958bff 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -30,7 +30,7 @@ struct max96712_priv {
 	struct regmap *regmap;
 	struct gpio_desc *gpiod_pwdn;
 
-	struct v4l2_fwnode_bus_mipi_csi2 mipi;
+	struct v4l2_mbus_config_mipi_csi2 mipi;
 
 	struct v4l2_subdev sd;
 	struct v4l2_ctrl_handler ctrl_handler;
diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index 9c97f1dbd1c6..feb132df45a3 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -25,68 +25,19 @@ struct fwnode_handle;
 struct v4l2_async_notifier;
 struct v4l2_async_subdev;
 
-#define V4L2_FWNODE_CSI2_MAX_DATA_LANES	8
-
-/**
- * struct v4l2_fwnode_bus_mipi_csi2 - MIPI CSI-2 bus data structure
- * @flags: media bus (V4L2_MBUS_*) flags
- * @data_lanes: an array of physical data lane indexes
- * @clock_lane: physical lane index of the clock lane
- * @num_data_lanes: number of data lanes
- * @lane_polarities: polarity of the lanes. The order is the same of
- *		   the physical lanes.
- */
-struct v4l2_fwnode_bus_mipi_csi2 {
-	unsigned int flags;
-	unsigned char data_lanes[V4L2_FWNODE_CSI2_MAX_DATA_LANES];
-	unsigned char clock_lane;
-	unsigned char num_data_lanes;
-	bool lane_polarities[1 + V4L2_FWNODE_CSI2_MAX_DATA_LANES];
-};
-
-/**
- * struct v4l2_fwnode_bus_parallel - parallel data bus data structure
- * @flags: media bus (V4L2_MBUS_*) flags
- * @bus_width: bus width in bits
- * @data_shift: data shift in bits
- */
-struct v4l2_fwnode_bus_parallel {
-	unsigned int flags;
-	unsigned char bus_width;
-	unsigned char data_shift;
-};
-
-/**
- * struct v4l2_fwnode_bus_mipi_csi1 - CSI-1/CCP2 data bus structure
- * @clock_inv: polarity of clock/strobe signal
- *	       false - not inverted, true - inverted
- * @strobe: false - data/clock, true - data/strobe
- * @lane_polarity: the polarities of the clock (index 0) and data lanes
- *		   index (1)
- * @data_lane: the number of the data lane
- * @clock_lane: the number of the clock lane
- */
-struct v4l2_fwnode_bus_mipi_csi1 {
-	unsigned char clock_inv:1;
-	unsigned char strobe:1;
-	bool lane_polarity[2];
-	unsigned char data_lane;
-	unsigned char clock_lane;
-};
-
 /**
  * struct v4l2_fwnode_endpoint - the endpoint data structure
  * @base: fwnode endpoint of the v4l2_fwnode
  * @bus_type: bus type
  * @bus: bus configuration data structure
- * @bus.parallel: embedded &struct v4l2_fwnode_bus_parallel.
+ * @bus.parallel: embedded &struct v4l2_mbus_config_parallel.
  *		  Used if the bus is parallel.
- * @bus.mipi_csi1: embedded &struct v4l2_fwnode_bus_mipi_csi1.
+ * @bus.mipi_csi1: embedded &struct v4l2_mbus_config_mipi_csi1.
  *		   Used if the bus is MIPI Alliance's Camera Serial
  *		   Interface version 1 (MIPI CSI1) or Standard
  *		   Mobile Imaging Architecture's Compact Camera Port 2
  *		   (SMIA CCP2).
- * @bus.mipi_csi2: embedded &struct v4l2_fwnode_bus_mipi_csi2.
+ * @bus.mipi_csi2: embedded &struct v4l2_mbus_config_mipi_csi2.
  *		   Used if the bus is MIPI Alliance's Camera Serial
  *		   Interface version 2 (MIPI CSI2).
  * @link_frequencies: array of supported link frequencies
@@ -100,9 +51,9 @@ struct v4l2_fwnode_endpoint {
 	 */
 	enum v4l2_mbus_type bus_type;
 	struct {
-		struct v4l2_fwnode_bus_parallel parallel;
-		struct v4l2_fwnode_bus_mipi_csi1 mipi_csi1;
-		struct v4l2_fwnode_bus_mipi_csi2 mipi_csi2;
+		struct v4l2_mbus_config_parallel parallel;
+		struct v4l2_mbus_config_mipi_csi1 mipi_csi1;
+		struct v4l2_mbus_config_mipi_csi2 mipi_csi2;
 	} bus;
 	u64 *link_frequencies;
 	unsigned int nr_of_link_frequencies;
diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
index 96af9cedacde..9c4970fbd8ea 100644
--- a/include/media/v4l2-mediabus.h
+++ b/include/media/v4l2-mediabus.h
@@ -92,6 +92,55 @@
 					 V4L2_MBUS_CSI2_CHANNEL_2 | \
 					 V4L2_MBUS_CSI2_CHANNEL_3)
 
+#define V4L2_MBUS_CSI2_MAX_DATA_LANES		8
+
+/**
+ * struct v4l2_mbus_config_mipi_csi2 - MIPI CSI-2 data bus configuration
+ * @flags: media bus (V4L2_MBUS_*) flags
+ * @data_lanes: an array of physical data lane indexes
+ * @clock_lane: physical lane index of the clock lane
+ * @num_data_lanes: number of data lanes
+ * @lane_polarities: polarity of the lanes. The order is the same of
+ *		   the physical lanes.
+ */
+struct v4l2_mbus_config_mipi_csi2 {
+	unsigned int flags;
+	unsigned char data_lanes[V4L2_MBUS_CSI2_MAX_DATA_LANES];
+	unsigned char clock_lane;
+	unsigned char num_data_lanes;
+	bool lane_polarities[1 + V4L2_MBUS_CSI2_MAX_DATA_LANES];
+};
+
+/**
+ * struct v4l2_mbus_config_parallel - parallel data bus configuration
+ * @flags: media bus (V4L2_MBUS_*) flags
+ * @bus_width: bus width in bits
+ * @data_shift: data shift in bits
+ */
+struct v4l2_mbus_config_parallel {
+	unsigned int flags;
+	unsigned char bus_width;
+	unsigned char data_shift;
+};
+
+/**
+ * struct v4l2_mbus_config_mipi_csi1 - CSI-1/CCP2 data bus configuration
+ * @clock_inv: polarity of clock/strobe signal
+ *	       false - not inverted, true - inverted
+ * @strobe: false - data/clock, true - data/strobe
+ * @lane_polarity: the polarities of the clock (index 0) and data lanes
+ *		   index (1)
+ * @data_lane: the number of the data lane
+ * @clock_lane: the number of the clock lane
+ */
+struct v4l2_mbus_config_mipi_csi1 {
+	unsigned char clock_inv:1;
+	unsigned char strobe:1;
+	bool lane_polarity[2];
+	unsigned char data_lane;
+	unsigned char clock_lane;
+};
+
 /**
  * enum v4l2_mbus_type - media bus type
  * @V4L2_MBUS_UNKNOWN:	unknown bus type, no V4L2 mediabus configuration
-- 
Regards,

Laurent Pinchart

