Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1E8A215EAA
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729952AbgGFSi0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729945AbgGFSiZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:25 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 823E8214E;
        Mon,  6 Jul 2020 20:38:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060683;
        bh=ab8PJnnPhXEUzgBzOQ7ESXme+UoeFEKiMr8ocuAFMno=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NUP6EzC2aKfnI5CVo81xmAm2puHQltXzewYUaa1S0zL9YZnvzCKsXHZ36u/H035aN
         rSEIIDdj2NaTY8elmGFaak1AhnUf7MYqhFAIcDWZyvMx68QmlmRp0xow2b6/30Vikh
         voh02N1mER9h77m6mInUCkS7MXytJkbiY6a8Q2qw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 058/108] media: ti-vpe: cal: Move DT parsing to CAMERARX
Date:   Mon,  6 Jul 2020 21:36:19 +0300
Message-Id: <20200706183709.12238-59-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The DT port nodes corresponding to the CSI-2 inputs belong to the
CAMERARX instances. Move parsing of the DT properties to a new
cal_camerarx_parse_dt() function, called by cal_camerarx_create().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
Changes since v1:

- Don't fail probe if one of the CAMERARX instances isn't connected in
  DT
- Return an error if the sensor DT node can't be found
---
 drivers/media/platform/ti-vpe/cal.c | 189 +++++++++++++++++-----------
 1 file changed, 113 insertions(+), 76 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 492141f07d69..a2c245ad23be 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -269,6 +269,7 @@ struct cal_camerarx {
 	unsigned int		instance;
 
 	struct v4l2_fwnode_endpoint	endpoint;
+	struct device_node	*sensor_node;
 	struct v4l2_subdev	*sensor;
 	unsigned int		external_rate;
 };
@@ -925,6 +926,73 @@ static int cal_camerarx_regmap_init(struct cal_dev *cal,
 	return 0;
 }
 
+static int cal_camerarx_parse_dt(struct cal_camerarx *phy)
+{
+	struct v4l2_fwnode_endpoint *endpoint = &phy->endpoint;
+	struct platform_device *pdev = phy->cal->pdev;
+	struct device_node *ep_node;
+	char data_lanes[V4L2_FWNODE_CSI2_MAX_DATA_LANES * 2];
+	unsigned int i;
+	int ret;
+
+	/*
+	 * Find the endpoint node for the port corresponding to the PHY
+	 * instance, and parse its CSI-2-related properties.
+	 */
+	ep_node = of_graph_get_endpoint_by_regs(pdev->dev.of_node,
+						phy->instance, 0);
+	if (!ep_node) {
+		/*
+		 * The endpoint is not mandatory, not all PHY instances need to
+		 * be connected in DT.
+		 */
+		phy_dbg(3, phy, "Port has no endpoint\n");
+		return 0;
+	}
+
+	endpoint->bus_type = V4L2_MBUS_CSI2_DPHY;
+	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep_node), endpoint);
+	if (ret < 0) {
+		phy_err(phy, "Failed to parse endpoint\n");
+		goto done;
+	}
+
+	for (i = 0; i < endpoint->bus.mipi_csi2.num_data_lanes; i++) {
+		unsigned int lane = endpoint->bus.mipi_csi2.data_lanes[i];
+
+		if (lane > 4) {
+			phy_err(phy, "Invalid position %u for data lane %u\n",
+				lane, i);
+			ret = -EINVAL;
+			goto done;
+		}
+
+		data_lanes[i*2] = '0' + lane;
+		data_lanes[i*2+1] = ' ';
+	}
+
+	data_lanes[i*2-1] = '\0';
+
+	phy_dbg(3, phy,
+		"CSI-2 bus: clock lane <%u>, data lanes <%s>, flags 0x%08x\n",
+		endpoint->bus.mipi_csi2.clock_lane, data_lanes,
+		endpoint->bus.mipi_csi2.flags);
+
+	/* Retrieve the connected device and store it for later use. */
+	phy->sensor_node = of_graph_get_remote_port_parent(ep_node);
+	if (!phy->sensor_node) {
+		phy_dbg(3, phy, "Can't get remote parent\n");
+		ret = -EINVAL;
+		goto done;
+	}
+
+	phy_dbg(1, phy, "Found connected device %pOFn\n", phy->sensor_node);
+
+done:
+	of_node_put(ep_node);
+	return ret;
+}
+
 static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 						unsigned int instance)
 {
@@ -958,6 +1026,10 @@ static struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
 	if (ret)
 		goto error;
 
+	ret = cal_camerarx_parse_dt(phy);
+	if (ret)
+		goto error;
+
 	return phy;
 
 error:
@@ -970,6 +1042,7 @@ static void cal_camerarx_destroy(struct cal_camerarx *phy)
 	if (!phy)
 		return;
 
+	of_node_put(phy->sensor_node);
 	kfree(phy);
 }
 
@@ -1972,7 +2045,7 @@ static void cal_ctx_v4l2_cleanup(struct cal_ctx *ctx)
 }
 
 /* ------------------------------------------------------------------
- *	Initialization and module stuff
+ *	Asynchronous V4L2 subdev binding
  * ------------------------------------------------------------------
  */
 
@@ -2071,87 +2144,37 @@ static const struct v4l2_async_notifier_operations cal_async_ops = {
 
 static int of_cal_create_instance(struct cal_ctx *ctx, int inst)
 {
-	struct platform_device *pdev = ctx->cal->pdev;
-	struct device_node *ep_node, *sensor_node;
-	struct v4l2_fwnode_endpoint *endpoint;
 	struct v4l2_async_subdev *asd;
-	int ret = -EINVAL, lane;
-
-	endpoint = &ctx->phy->endpoint;
-
-	ctx_dbg(3, ctx, "Getting endpoint for port@%d\n", inst);
-	ep_node = of_graph_get_endpoint_by_regs(pdev->dev.of_node, inst, 0);
-	if (!ep_node) {
-		ctx_dbg(3, ctx, "Can't get endpoint\n");
-		return -EINVAL;
-	}
-
-	sensor_node = of_graph_get_remote_port_parent(ep_node);
-	if (!sensor_node) {
-		ctx_dbg(3, ctx, "Can't get remote parent\n");
-		goto cleanup_exit;
-	}
-
-	endpoint->bus_type = V4L2_MBUS_CSI2_DPHY;
-	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep_node), endpoint);
-	if (ret < 0) {
-		ctx_err(ctx, "Failed to parse endpoint\n");
-		goto cleanup_exit;
-	}
-
-	ctx_dbg(3, ctx, "Port:%d v4l2-endpoint: CSI2\n", inst);
-	ctx_dbg(3, ctx, "flags=0x%08x\n", endpoint->bus.mipi_csi2.flags);
-	ctx_dbg(3, ctx, "clock_lane=%d\n", endpoint->bus.mipi_csi2.clock_lane);
-	ctx_dbg(3, ctx, "num_data_lanes=%d\n",
-		endpoint->bus.mipi_csi2.num_data_lanes);
-	ctx_dbg(3, ctx, "data_lanes= <\n");
-	for (lane = 0; lane < endpoint->bus.mipi_csi2.num_data_lanes; lane++)
-		ctx_dbg(3, ctx, "\t%d\n",
-			endpoint->bus.mipi_csi2.data_lanes[lane]);
-	ctx_dbg(3, ctx, "\t>\n");
-
-	ctx_dbg(1, ctx, "Port: %d found sub-device %pOFn\n",
-		inst, sensor_node);
+	struct fwnode_handle *fwnode;
+	int ret;
 
 	v4l2_async_notifier_init(&ctx->notifier);
-
-	asd = kzalloc(sizeof(*asd), GFP_KERNEL);
-	if (!asd)
-		goto cleanup_exit;
-
-	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
-	asd->match.fwnode = of_fwnode_handle(sensor_node);
-
-	ret = v4l2_async_notifier_add_subdev(&ctx->notifier, asd);
-	if (ret) {
-		ctx_err(ctx, "Error adding asd\n");
-		kfree(asd);
-		goto cleanup_exit;
-	}
-
 	ctx->notifier.ops = &cal_async_ops;
+
+	fwnode = of_fwnode_handle(ctx->phy->sensor_node);
+	asd = v4l2_async_notifier_add_fwnode_subdev(&ctx->notifier, fwnode,
+						    sizeof(*asd));
+	if (IS_ERR(asd)) {
+		ctx_err(ctx, "Failed to add subdev to notifier\n");
+		return PTR_ERR(asd);
+	}
+
 	ret = v4l2_async_notifier_register(&ctx->cal->v4l2_dev,
 					   &ctx->notifier);
 	if (ret) {
 		ctx_err(ctx, "Error registering async notifier\n");
 		v4l2_async_notifier_cleanup(&ctx->notifier);
-		ret = -EINVAL;
+		return ret;
 	}
 
-	/*
-	 * On success we need to keep reference on sensor_node, or
-	 * if notifier_cleanup was called above, sensor_node was
-	 * already put.
-	 */
-	sensor_node = NULL;
-
-cleanup_exit:
-	of_node_put(sensor_node);
-	of_node_put(ep_node);
-
-	return ret;
+	return 0;
 }
 
+/* ------------------------------------------------------------------
+ *	Initialization and module stuff
+ * ------------------------------------------------------------------
+ */
+
 static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 {
 	struct cal_ctx *ctx;
@@ -2219,6 +2242,7 @@ static int cal_probe(struct platform_device *pdev)
 {
 	struct cal_dev *cal;
 	struct cal_ctx *ctx;
+	bool connected = false;
 	unsigned int i;
 	int ret;
 	int irq;
@@ -2271,6 +2295,15 @@ static int cal_probe(struct platform_device *pdev)
 			cal->phy[i] = NULL;
 			goto error_camerarx;
 		}
+
+		if (cal->phy[i]->sensor_node)
+			connected = true;
+	}
+
+	if (!connected) {
+		cal_err(cal, "Neither port is configured, no point in staying up\n");
+		ret = -ENODEV;
+		goto error_camerarx;
 	}
 
 	/* Register the V4L2 device. */
@@ -2281,13 +2314,16 @@ static int cal_probe(struct platform_device *pdev)
 	}
 
 	/* Create contexts. */
-	for (i = 0; i < cal->data->num_csi2_phy; ++i)
+	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
+		if (!cal->phy[i]->sensor_node)
+			continue;
+
 		cal->ctx[i] = cal_ctx_create(cal, i);
-
-	if (!cal->ctx[0] && !cal->ctx[1]) {
-		cal_err(cal, "Neither port is configured, no point in staying up\n");
-		ret = -ENODEV;
-		goto error_v4l2;
+		if (!cal->ctx[i]) {
+			cal_err(cal, "Failed to create context %u\n", i);
+			ret = -ENODEV;
+			goto error_context;
+		}
 	}
 
 	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
@@ -2307,6 +2343,8 @@ static int cal_probe(struct platform_device *pdev)
 	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
 
 	pm_runtime_disable(&pdev->dev);
+
+error_context:
 	for (i = 0; i < CAL_NUM_CONTEXT; i++) {
 		ctx = cal->ctx[i];
 		if (ctx) {
@@ -2316,7 +2354,6 @@ static int cal_probe(struct platform_device *pdev)
 		}
 	}
 
-error_v4l2:
 	v4l2_device_unregister(&cal->v4l2_dev);
 
 error_camerarx:
-- 
Regards,

Laurent Pinchart

