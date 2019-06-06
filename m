Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06BCE374C3
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 15:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728280AbfFFNCa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 09:02:30 -0400
Received: from retiisi.org.uk ([95.216.213.190]:49872 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728138AbfFFNC3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 09:02:29 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1001])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 7876E634C84;
        Thu,  6 Jun 2019 16:02:17 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        jacopo@jmondi.org, niklas.soderlund@ragnatech.se
Subject: [PATCH v2 5/9] omap3isp: Rework OF endpoint parsing
Date:   Thu,  6 Jun 2019 16:02:21 +0300
Message-Id: <20190606130225.10751-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190606130225.10751-1-sakari.ailus@linux.intel.com>
References: <20190606130225.10751-1-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rework OF endpoint parsing for the omap3isp driver. This does add some
lines of code. The benefits are still clear:

- the great complication related to callbacks in endpoint parsing is gone;
  instead endpoints are obtained port by port and

- endpoints may now have a default bus configuration which was not
  possible while using callbacks. This driver does not benefit from that
  feature, but as the omap3isp is one of the exemplary drivers, this works
  as an example for driver developers.

Depends-on: ("device property: Add fwnode_graph_get_endpoint_by_id")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/omap3isp/isp.c | 331 ++++++++++++++++++++--------------
 1 file changed, 197 insertions(+), 134 deletions(-)

diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
index 008933beebe0..5db4e3c8cd6a 100644
--- a/drivers/media/platform/omap3isp/isp.c
+++ b/drivers/media/platform/omap3isp/isp.c
@@ -2017,136 +2017,6 @@ enum isp_of_phy {
 	ISP_OF_PHY_CSIPHY2,
 };
 
-static int isp_fwnode_parse(struct device *dev,
-			    struct v4l2_fwnode_endpoint *vep,
-			    struct v4l2_async_subdev *asd)
-{
-	struct isp_async_subdev *isd =
-		container_of(asd, struct isp_async_subdev, asd);
-	struct isp_bus_cfg *buscfg = &isd->bus;
-	bool csi1 = false;
-	unsigned int i;
-
-	dev_dbg(dev, "parsing endpoint %pOF, interface %u\n",
-		to_of_node(vep->base.local_fwnode), vep->base.port);
-
-	switch (vep->base.port) {
-	case ISP_OF_PHY_PARALLEL:
-		buscfg->interface = ISP_INTERFACE_PARALLEL;
-		buscfg->bus.parallel.data_lane_shift =
-			vep->bus.parallel.data_shift;
-		buscfg->bus.parallel.clk_pol =
-			!!(vep->bus.parallel.flags
-			   & V4L2_MBUS_PCLK_SAMPLE_FALLING);
-		buscfg->bus.parallel.hs_pol =
-			!!(vep->bus.parallel.flags & V4L2_MBUS_VSYNC_ACTIVE_LOW);
-		buscfg->bus.parallel.vs_pol =
-			!!(vep->bus.parallel.flags & V4L2_MBUS_HSYNC_ACTIVE_LOW);
-		buscfg->bus.parallel.fld_pol =
-			!!(vep->bus.parallel.flags & V4L2_MBUS_FIELD_EVEN_LOW);
-		buscfg->bus.parallel.data_pol =
-			!!(vep->bus.parallel.flags & V4L2_MBUS_DATA_ACTIVE_LOW);
-		buscfg->bus.parallel.bt656 = vep->bus_type == V4L2_MBUS_BT656;
-		break;
-
-	case ISP_OF_PHY_CSIPHY1:
-	case ISP_OF_PHY_CSIPHY2:
-		switch (vep->bus_type) {
-		case V4L2_MBUS_CCP2:
-		case V4L2_MBUS_CSI1:
-			dev_dbg(dev, "CSI-1/CCP-2 configuration\n");
-			csi1 = true;
-			break;
-		case V4L2_MBUS_CSI2_DPHY:
-			dev_dbg(dev, "CSI-2 configuration\n");
-			csi1 = false;
-			break;
-		default:
-			dev_err(dev, "unsupported bus type %u\n",
-				vep->bus_type);
-			return -EINVAL;
-		}
-
-		switch (vep->base.port) {
-		case ISP_OF_PHY_CSIPHY1:
-			if (csi1)
-				buscfg->interface = ISP_INTERFACE_CCP2B_PHY1;
-			else
-				buscfg->interface = ISP_INTERFACE_CSI2C_PHY1;
-			break;
-		case ISP_OF_PHY_CSIPHY2:
-			if (csi1)
-				buscfg->interface = ISP_INTERFACE_CCP2B_PHY2;
-			else
-				buscfg->interface = ISP_INTERFACE_CSI2A_PHY2;
-			break;
-		}
-		if (csi1) {
-			buscfg->bus.ccp2.lanecfg.clk.pos =
-				vep->bus.mipi_csi1.clock_lane;
-			buscfg->bus.ccp2.lanecfg.clk.pol =
-				vep->bus.mipi_csi1.lane_polarity[0];
-			dev_dbg(dev, "clock lane polarity %u, pos %u\n",
-				buscfg->bus.ccp2.lanecfg.clk.pol,
-				buscfg->bus.ccp2.lanecfg.clk.pos);
-
-			buscfg->bus.ccp2.lanecfg.data[0].pos =
-				vep->bus.mipi_csi1.data_lane;
-			buscfg->bus.ccp2.lanecfg.data[0].pol =
-				vep->bus.mipi_csi1.lane_polarity[1];
-
-			dev_dbg(dev, "data lane polarity %u, pos %u\n",
-				buscfg->bus.ccp2.lanecfg.data[0].pol,
-				buscfg->bus.ccp2.lanecfg.data[0].pos);
-
-			buscfg->bus.ccp2.strobe_clk_pol =
-				vep->bus.mipi_csi1.clock_inv;
-			buscfg->bus.ccp2.phy_layer = vep->bus.mipi_csi1.strobe;
-			buscfg->bus.ccp2.ccp2_mode =
-				vep->bus_type == V4L2_MBUS_CCP2;
-			buscfg->bus.ccp2.vp_clk_pol = 1;
-
-			buscfg->bus.ccp2.crc = 1;
-		} else {
-			buscfg->bus.csi2.lanecfg.clk.pos =
-				vep->bus.mipi_csi2.clock_lane;
-			buscfg->bus.csi2.lanecfg.clk.pol =
-				vep->bus.mipi_csi2.lane_polarities[0];
-			dev_dbg(dev, "clock lane polarity %u, pos %u\n",
-				buscfg->bus.csi2.lanecfg.clk.pol,
-				buscfg->bus.csi2.lanecfg.clk.pos);
-
-			buscfg->bus.csi2.num_data_lanes =
-				vep->bus.mipi_csi2.num_data_lanes;
-
-			for (i = 0; i < buscfg->bus.csi2.num_data_lanes; i++) {
-				buscfg->bus.csi2.lanecfg.data[i].pos =
-					vep->bus.mipi_csi2.data_lanes[i];
-				buscfg->bus.csi2.lanecfg.data[i].pol =
-					vep->bus.mipi_csi2.lane_polarities[i + 1];
-				dev_dbg(dev,
-					"data lane %u polarity %u, pos %u\n", i,
-					buscfg->bus.csi2.lanecfg.data[i].pol,
-					buscfg->bus.csi2.lanecfg.data[i].pos);
-			}
-			/*
-			 * FIXME: now we assume the CRC is always there.
-			 * Implement a way to obtain this information from the
-			 * sensor. Frame descriptors, perhaps?
-			 */
-			buscfg->bus.csi2.crc = 1;
-		}
-		break;
-
-	default:
-		dev_warn(dev, "%pOF: invalid interface %u\n",
-			 to_of_node(vep->base.local_fwnode), vep->base.port);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static int isp_subdev_notifier_complete(struct v4l2_async_notifier *async)
 {
 	struct isp_device *isp = container_of(async, struct isp_device,
@@ -2176,6 +2046,201 @@ static int isp_subdev_notifier_complete(struct v4l2_async_notifier *async)
 	return media_device_register(&isp->media_dev);
 }
 
+static void isp_parse_of_parallel_endpoint(struct device *dev,
+					   struct v4l2_fwnode_endpoint *vep,
+					   struct isp_bus_cfg *buscfg)
+{
+	buscfg->interface = ISP_INTERFACE_PARALLEL;
+	buscfg->bus.parallel.data_lane_shift = vep->bus.parallel.data_shift;
+	buscfg->bus.parallel.clk_pol =
+		!!(vep->bus.parallel.flags & V4L2_MBUS_PCLK_SAMPLE_FALLING);
+	buscfg->bus.parallel.hs_pol =
+		!!(vep->bus.parallel.flags & V4L2_MBUS_VSYNC_ACTIVE_LOW);
+	buscfg->bus.parallel.vs_pol =
+		!!(vep->bus.parallel.flags & V4L2_MBUS_HSYNC_ACTIVE_LOW);
+	buscfg->bus.parallel.fld_pol =
+		!!(vep->bus.parallel.flags & V4L2_MBUS_FIELD_EVEN_LOW);
+	buscfg->bus.parallel.data_pol =
+		!!(vep->bus.parallel.flags & V4L2_MBUS_DATA_ACTIVE_LOW);
+	buscfg->bus.parallel.bt656 = vep->bus_type == V4L2_MBUS_BT656;
+}
+
+static void isp_parse_of_csi2_endpoint(struct device *dev,
+				       struct v4l2_fwnode_endpoint *vep,
+				       struct isp_bus_cfg *buscfg)
+{
+	unsigned int i;
+
+	buscfg->bus.csi2.lanecfg.clk.pos = vep->bus.mipi_csi2.clock_lane;
+	buscfg->bus.csi2.lanecfg.clk.pol =
+		vep->bus.mipi_csi2.lane_polarities[0];
+	dev_dbg(dev, "clock lane polarity %u, pos %u\n",
+		buscfg->bus.csi2.lanecfg.clk.pol,
+		buscfg->bus.csi2.lanecfg.clk.pos);
+
+	buscfg->bus.csi2.num_data_lanes = vep->bus.mipi_csi2.num_data_lanes;
+
+	for (i = 0; i < buscfg->bus.csi2.num_data_lanes; i++) {
+		buscfg->bus.csi2.lanecfg.data[i].pos =
+			vep->bus.mipi_csi2.data_lanes[i];
+		buscfg->bus.csi2.lanecfg.data[i].pol =
+			vep->bus.mipi_csi2.lane_polarities[i + 1];
+		dev_dbg(dev,
+			"data lane %u polarity %u, pos %u\n", i,
+			buscfg->bus.csi2.lanecfg.data[i].pol,
+			buscfg->bus.csi2.lanecfg.data[i].pos);
+	}
+	/*
+	 * FIXME: now we assume the CRC is always there. Implement a way to
+	 * obtain this information from the sensor. Frame descriptors, perhaps?
+	 */
+	buscfg->bus.csi2.crc = 1;
+}
+
+static void isp_parse_of_csi1_endpoint(struct device *dev,
+				       struct v4l2_fwnode_endpoint *vep,
+				       struct isp_bus_cfg *buscfg)
+{
+	buscfg->bus.ccp2.lanecfg.clk.pos = vep->bus.mipi_csi1.clock_lane;
+	buscfg->bus.ccp2.lanecfg.clk.pol = vep->bus.mipi_csi1.lane_polarity[0];
+	dev_dbg(dev, "clock lane polarity %u, pos %u\n",
+		buscfg->bus.ccp2.lanecfg.clk.pol,
+	buscfg->bus.ccp2.lanecfg.clk.pos);
+
+	buscfg->bus.ccp2.lanecfg.data[0].pos = vep->bus.mipi_csi1.data_lane;
+	buscfg->bus.ccp2.lanecfg.data[0].pol =
+		vep->bus.mipi_csi1.lane_polarity[1];
+
+	dev_dbg(dev, "data lane polarity %u, pos %u\n",
+		buscfg->bus.ccp2.lanecfg.data[0].pol,
+		buscfg->bus.ccp2.lanecfg.data[0].pos);
+
+	buscfg->bus.ccp2.strobe_clk_pol = vep->bus.mipi_csi1.clock_inv;
+	buscfg->bus.ccp2.phy_layer = vep->bus.mipi_csi1.strobe;
+	buscfg->bus.ccp2.ccp2_mode = vep->bus_type == V4L2_MBUS_CCP2;
+	buscfg->bus.ccp2.vp_clk_pol = 1;
+
+	buscfg->bus.ccp2.crc = 1;
+}
+
+static int isp_alloc_isd(struct isp_async_subdev **isd,
+			 struct isp_bus_cfg **buscfg)
+{
+	struct isp_async_subdev *__isd;
+
+	__isd = kzalloc(sizeof(*__isd), GFP_KERNEL);
+	if (!__isd)
+		return -ENOMEM;
+
+	*isd = __isd;
+	*buscfg = &__isd->bus;
+
+	return 0;
+}
+
+static struct {
+	u32 phy;
+	u32 csi2_if;
+	u32 csi1_if;
+} isp_bus_interfaces[2] = {
+	{ ISP_OF_PHY_CSIPHY1,
+	  ISP_INTERFACE_CSI2C_PHY1, ISP_INTERFACE_CCP2B_PHY1 },
+	{ ISP_OF_PHY_CSIPHY2,
+	  ISP_INTERFACE_CSI2A_PHY2, ISP_INTERFACE_CCP2B_PHY2 },
+};
+
+static int isp_parse_of_endpoints(struct isp_device *isp)
+{
+	struct fwnode_handle *ep;
+	struct isp_async_subdev *isd = NULL;
+	struct isp_bus_cfg *buscfg;
+	unsigned int i;
+
+	ep = fwnode_graph_get_endpoint_by_id(
+		dev_fwnode(isp->dev), ISP_OF_PHY_PARALLEL, 0,
+		FWNODE_GRAPH_ENDPOINT_NEXT);
+
+	if (ep) {
+		struct v4l2_fwnode_endpoint vep = {
+			.bus_type = V4L2_MBUS_PARALLEL
+		};
+		int ret;
+
+		dev_dbg(isp->dev, "parsing parallel interface\n");
+
+		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+
+		if (!ret) {
+			ret = isp_alloc_isd(&isd, &buscfg);
+			if (ret)
+				return ret;
+		}
+
+		if (!ret) {
+			isp_parse_of_parallel_endpoint(isp->dev, &vep, buscfg);
+			ret = v4l2_async_notifier_add_fwnode_remote_subdev(
+				&isp->notifier, ep, &isd->asd);
+		}
+
+		fwnode_handle_put(ep);
+		if (ret)
+			kfree(isd);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(isp_bus_interfaces); i++) {
+		struct v4l2_fwnode_endpoint vep = {
+			.bus_type = V4L2_MBUS_CSI2_DPHY
+		};
+		int ret;
+
+		ep = fwnode_graph_get_endpoint_by_id(
+			dev_fwnode(isp->dev), isp_bus_interfaces[i].phy, 0,
+			FWNODE_GRAPH_ENDPOINT_NEXT);
+
+		if (!ep)
+			continue;
+
+		dev_dbg(isp->dev, "parsing serial interface %u, node %pOF\n", i,
+			to_of_node(ep));
+
+		ret = isp_alloc_isd(&isd, &buscfg);
+		if (ret)
+			return ret;
+
+		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+		if (!ret) {
+			buscfg->interface = isp_bus_interfaces[i].csi2_if;
+			isp_parse_of_csi2_endpoint(isp->dev, &vep, buscfg);
+		} else if (ret == -ENXIO) {
+			vep = (struct v4l2_fwnode_endpoint)
+				{ .bus_type = V4L2_MBUS_CSI1 };
+			ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+
+			if (ret == -ENXIO) {
+				vep = (struct v4l2_fwnode_endpoint)
+					{ .bus_type = V4L2_MBUS_CCP2 };
+				ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+			}
+			if (!ret) {
+				buscfg->interface =
+					isp_bus_interfaces[i].csi1_if;
+				isp_parse_of_csi1_endpoint(isp->dev, &vep,
+							   buscfg);
+			}
+		}
+
+		if (!ret)
+			ret = v4l2_async_notifier_add_fwnode_remote_subdev(
+				&isp->notifier, ep, &isd->asd);
+
+		fwnode_handle_put(ep);
+		if (ret)
+			kfree(isd);
+	}
+
+	return 0;
+}
+
 static const struct v4l2_async_notifier_operations isp_subdev_notifier_ops = {
 	.complete = isp_subdev_notifier_complete,
 };
@@ -2226,14 +2291,12 @@ static int isp_probe(struct platform_device *pdev)
 	mutex_init(&isp->isp_mutex);
 	spin_lock_init(&isp->stat_lock);
 	v4l2_async_notifier_init(&isp->notifier);
+	isp->dev = &pdev->dev;
 
-	ret = v4l2_async_notifier_parse_fwnode_endpoints(
-		&pdev->dev, &isp->notifier, sizeof(struct isp_async_subdev),
-		isp_fwnode_parse);
+	ret = isp_parse_of_endpoints(isp);
 	if (ret < 0)
 		goto error;
 
-	isp->dev = &pdev->dev;
 	isp->ref_count = 0;
 
 	ret = dma_coerce_mask_and_coherent(isp->dev, DMA_BIT_MASK(32));
-- 
2.11.0

