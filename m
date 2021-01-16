Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D01002F8E28
	for <lists+linux-media@lfdr.de>; Sat, 16 Jan 2021 18:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727197AbhAPRFo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 16 Jan 2021 12:05:44 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49524 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727079AbhAPQla (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 16 Jan 2021 11:41:30 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id ED79B1F4584C
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v3] media: imx6-mipi-csi2: Call remote subdev get_mbus_config to get active lanes
Date:   Sat, 16 Jan 2021 13:40:38 -0300
Message-Id: <20210116164038.11875-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, the CSI2 subdevice is using the data-lanes from the
neareast endpoint to config the CSI2 lanes.

While this may work, the proper way to configure the hardware is
to obtain the remote subdevice in v4l2_async_notifier_operations.bound(),
and then call get_mbus_config using the remote subdevice to get
the active lanes.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 108 ++++++++++++++++++---
 1 file changed, 96 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 94d87d27d389..6b58899dcefe 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -42,7 +42,10 @@ struct csi2_dev {
 	struct clk             *pllref_clk;
 	struct clk             *pix_clk; /* what is this? */
 	void __iomem           *base;
-	struct v4l2_fwnode_bus_mipi_csi2 bus;
+
+	struct v4l2_subdev	*remote;
+	unsigned int		remote_pad;
+	unsigned short		data_lanes;
 
 	/* lock to protect all members below */
 	struct mutex lock;
@@ -138,10 +141,8 @@ static void csi2_enable(struct csi2_dev *csi2, bool enable)
 	}
 }
 
-static void csi2_set_lanes(struct csi2_dev *csi2)
+static void csi2_set_lanes(struct csi2_dev *csi2, unsigned int lanes)
 {
-	int lanes = csi2->bus.num_data_lanes;
-
 	writel(lanes - 1, csi2->base + CSI2_N_LANES);
 }
 
@@ -250,13 +251,12 @@ static int __maybe_unused csi2_dphy_wait_ulp(struct csi2_dev *csi2)
 }
 
 /* Waits for low-power LP-11 state on data and clock lanes. */
-static void csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
+static void csi2_dphy_wait_stopstate(struct csi2_dev *csi2, unsigned int lanes)
 {
 	u32 mask, reg;
 	int ret;
 
-	mask = PHY_STOPSTATECLK | (((1 << csi2->bus.num_data_lanes) - 1) <<
-				   PHY_STOPSTATEDATA_BIT);
+	mask = PHY_STOPSTATECLK | (((1 << lanes) - 1) << PHY_STOPSTATEDATA_BIT);
 
 	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
 				 (reg & mask) == mask, 0, 500000);
@@ -300,8 +300,65 @@ static void csi2ipu_gasket_init(struct csi2_dev *csi2)
 	writel(reg, csi2->base + CSI2IPU_GASKET);
 }
 
+static int csi2_get_active_lanes(struct csi2_dev *csi2, unsigned int *lanes)
+{
+	struct v4l2_mbus_config mbus_config = { 0 };
+	unsigned int num_lanes = UINT_MAX;
+	int ret;
+
+	*lanes = csi2->data_lanes;
+
+	ret = v4l2_subdev_call(csi2->remote, pad, get_mbus_config,
+			       csi2->remote_pad, &mbus_config);
+	if (ret == -ENOIOCTLCMD) {
+		dev_dbg(csi2->dev, "No remote mbus configuration available\n");
+		return 0;
+	}
+
+	if (ret) {
+		dev_err(csi2->dev, "Failed to get remote mbus configuration\n");
+		return ret;
+	}
+
+	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
+		dev_err(csi2->dev, "Unsupported media bus type %u\n",
+			mbus_config.type);
+		return -EINVAL;
+	}
+
+	switch (mbus_config.flags & V4L2_MBUS_CSI2_LANES) {
+	case V4L2_MBUS_CSI2_1_LANE:
+		num_lanes = 1;
+		break;
+	case V4L2_MBUS_CSI2_2_LANE:
+		num_lanes = 2;
+		break;
+	case V4L2_MBUS_CSI2_3_LANE:
+		num_lanes = 3;
+		break;
+	case V4L2_MBUS_CSI2_4_LANE:
+		num_lanes = 4;
+		break;
+	default:
+		num_lanes = csi2->data_lanes;
+		break;
+	}
+
+	if (num_lanes > csi2->data_lanes) {
+		dev_err(csi2->dev,
+			"Unsupported mbus config: too many data lanes %u\n",
+			num_lanes);
+		return -EINVAL;
+	}
+
+	*lanes = num_lanes;
+
+	return 0;
+}
+
 static int csi2_start(struct csi2_dev *csi2)
 {
+	unsigned int lanes;
 	int ret;
 
 	ret = clk_prepare_enable(csi2->pix_clk);
@@ -316,12 +373,16 @@ static int csi2_start(struct csi2_dev *csi2)
 	if (ret)
 		goto err_disable_clk;
 
+	ret = csi2_get_active_lanes(csi2, &lanes);
+	if (ret)
+		goto err_disable_clk;
+
 	/* Step 4 */
-	csi2_set_lanes(csi2);
+	csi2_set_lanes(csi2, lanes);
 	csi2_enable(csi2, true);
 
 	/* Step 5 */
-	csi2_dphy_wait_stopstate(csi2);
+	csi2_dphy_wait_stopstate(csi2, lanes);
 
 	/* Step 6 */
 	ret = v4l2_subdev_call(csi2->src_sd, video, s_stream, 1);
@@ -544,12 +605,35 @@ static int csi2_notify_bound(struct v4l2_async_notifier *notifier,
 {
 	struct csi2_dev *csi2 = notifier_to_dev(notifier);
 	struct media_pad *sink = &csi2->sd.entity.pads[CSI2_SINK_PAD];
+	int pad;
+
+	pad = media_entity_get_fwnode_pad(&sd->entity, asd->match.fwnode,
+					  MEDIA_PAD_FL_SOURCE);
+	if (pad < 0) {
+		dev_err(csi2->dev, "Failed to find pad for %s\n", sd->name);
+		return pad;
+	}
+
+	csi2->remote = sd;
+	csi2->remote_pad = pad;
+
+	dev_dbg(csi2->dev, "Bound %s pad: %d\n", sd->name, pad);
 
 	return v4l2_create_fwnode_links_to_pad(sd, sink);
 }
 
+static void csi2_notify_unbind(struct v4l2_async_notifier *notifier,
+			       struct v4l2_subdev *sd,
+			       struct v4l2_async_subdev *asd)
+{
+	struct csi2_dev *csi2 = notifier_to_dev(notifier);
+
+	csi2->remote = NULL;
+}
+
 static const struct v4l2_async_notifier_operations csi2_notify_ops = {
 	.bound = csi2_notify_bound,
+	.unbind = csi2_notify_unbind,
 };
 
 static int csi2_async_register(struct csi2_dev *csi2)
@@ -572,10 +656,10 @@ static int csi2_async_register(struct csi2_dev *csi2)
 	if (ret)
 		goto err_parse;
 
-	csi2->bus = vep.bus.mipi_csi2;
+	csi2->data_lanes = vep.bus.mipi_csi2.num_data_lanes;
 
-	dev_dbg(csi2->dev, "data lanes: %d\n", csi2->bus.num_data_lanes);
-	dev_dbg(csi2->dev, "flags: 0x%08x\n", csi2->bus.flags);
+	dev_dbg(csi2->dev, "data lanes: %d\n", vep.bus.mipi_csi2.num_data_lanes);
+	dev_dbg(csi2->dev, "flags: 0x%08x\n", vep.bus.mipi_csi2.flags);
 
 	asd = kzalloc(sizeof(*asd), GFP_KERNEL);
 	if (!asd) {
-- 
2.29.2

