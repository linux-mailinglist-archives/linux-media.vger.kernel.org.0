Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E87A77D55D
	for <lists+linux-media@lfdr.de>; Tue, 15 Aug 2023 23:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240306AbjHOVsJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Aug 2023 17:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240395AbjHOVsB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Aug 2023 17:48:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C4351FCB
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 14:48:00 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCDC06E0;
        Tue, 15 Aug 2023 23:46:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1692136006;
        bh=W85uvTZY/q1OTevdlQ6FWLkLe6OSQCA8FE4nMRgE85s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Bd4EW5KIey3QxtKJEn17DUwFQO3wsHISOHWHo/6X0M0ZRZCK+kOSP08p1qdU6V3Wy
         eOVZX39jHYlRJkvZNP7k0ov0ebpL+09xjZJZj7oWyluHaBQnRX37eBvDQtvHQDIwu1
         XfCiL3DQbn8F8cwDyeW6WTFr7tKK5KhFqzjcYkV8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v1 2/2] media: v4l2-fwnode: Replace pr_*() with dev_*()
Date:   Wed, 16 Aug 2023 00:48:01 +0300
Message-ID: <20230815214801.6420-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230815214801.6420-1-laurent.pinchart@ideasonboard.com>
References: <20230815214801.6420-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2-fwnode prints a large number of debug and warning messages without
linking them to a device context. Use the device pointer available to
the functions to replace the pr_*() calls with dev_*() in order to
indicate better which device the messages relate to.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 121 ++++++++++++++------------
 1 file changed, 63 insertions(+), 58 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index b65966641872..4e45235dd0c7 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -121,7 +121,8 @@ v4l2_fwnode_mbus_type_to_string(enum v4l2_mbus_type type)
 	return conv ? conv->name : "not found";
 }
 
-static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
+static int v4l2_fwnode_endpoint_parse_csi2_bus(struct device *dev,
+					       struct fwnode_handle *fwnode,
 					       struct v4l2_fwnode_endpoint *vep,
 					       enum v4l2_mbus_type bus_type)
 {
@@ -155,7 +156,7 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 		}
 
 		if (use_default_lane_mapping)
-			pr_debug("no lane mapping given, using defaults\n");
+			dev_dbg(dev, "no lane mapping given, using defaults\n");
 	}
 
 	rval = fwnode_property_count_u32(fwnode, "data-lanes");
@@ -168,7 +169,7 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 
 		have_data_lanes = true;
 		if (use_default_lane_mapping) {
-			pr_debug("data-lanes property exists; disabling default mapping\n");
+			dev_dbg(dev, "data-lanes property exists; disabling default mapping\n");
 			use_default_lane_mapping = false;
 		}
 	}
@@ -176,21 +177,21 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 	for (i = 0; i < num_data_lanes; i++) {
 		if (lanes_used & BIT(array[i])) {
 			if (have_data_lanes || !use_default_lane_mapping)
-				pr_warn("duplicated lane %u in data-lanes, using defaults\n",
-					array[i]);
+				dev_warn(dev, "duplicated lane %u in data-lanes, using defaults\n",
+					 array[i]);
 			use_default_lane_mapping = true;
 		}
 		lanes_used |= BIT(array[i]);
 
 		if (have_data_lanes)
-			pr_debug("lane %u position %u\n", i, array[i]);
+			dev_dbg(dev, "lane %u position %u\n", i, array[i]);
 	}
 
 	rval = fwnode_property_count_u32(fwnode, "lane-polarities");
 	if (rval > 0) {
 		if (rval != 1 + num_data_lanes /* clock+data */) {
-			pr_warn("invalid number of lane-polarities entries (need %u, got %u)\n",
-				1 + num_data_lanes, rval);
+			dev_warn(dev, "invalid number of lane-polarities entries (need %u, got %u)\n",
+				 1 + num_data_lanes, rval);
 			return -EINVAL;
 		}
 
@@ -199,20 +200,20 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 
 	if (!fwnode_property_read_u32(fwnode, "clock-lanes", &v)) {
 		clock_lane = v;
-		pr_debug("clock lane position %u\n", v);
+		dev_dbg(dev, "clock lane position %u\n", v);
 		have_clk_lane = true;
 	}
 
 	if (have_clk_lane && lanes_used & BIT(clock_lane) &&
 	    !use_default_lane_mapping) {
-		pr_warn("duplicated lane %u in clock-lanes, using defaults\n",
-			v);
+		dev_warn(dev, "duplicated lane %u in clock-lanes, using defaults\n",
+			 v);
 		use_default_lane_mapping = true;
 	}
 
 	if (fwnode_property_present(fwnode, "clock-noncontinuous")) {
 		flags |= V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
-		pr_debug("non-continuous clock\n");
+		dev_dbg(dev, "non-continuous clock\n");
 	}
 
 	if (bus_type == V4L2_MBUS_CSI2_DPHY ||
@@ -244,11 +245,11 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 
 			for (i = 0; i < 1 + num_data_lanes; i++) {
 				bus->lane_polarities[i] = array[i];
-				pr_debug("lane %u polarity %sinverted",
-					 i, array[i] ? "" : "not ");
+				dev_dbg(dev, "lane %u polarity %sinverted",
+					i, array[i] ? "" : "not ");
 			}
 		} else {
-			pr_debug("no lane polarities defined, assuming not inverted\n");
+			dev_dbg(dev, "no lane polarities defined, assuming not inverted\n");
 		}
 	}
 
@@ -263,7 +264,8 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
 			     V4L2_MBUS_FIELD_EVEN_LOW)
 
 static void
-v4l2_fwnode_endpoint_parse_parallel_bus(struct fwnode_handle *fwnode,
+v4l2_fwnode_endpoint_parse_parallel_bus(struct device *dev,
+					struct fwnode_handle *fwnode,
 					struct v4l2_fwnode_endpoint *vep,
 					enum v4l2_mbus_type bus_type)
 {
@@ -279,7 +281,7 @@ v4l2_fwnode_endpoint_parse_parallel_bus(struct fwnode_handle *fwnode,
 			   V4L2_MBUS_HSYNC_ACTIVE_LOW);
 		flags |= v ? V4L2_MBUS_HSYNC_ACTIVE_HIGH :
 			V4L2_MBUS_HSYNC_ACTIVE_LOW;
-		pr_debug("hsync-active %s\n", v ? "high" : "low");
+		dev_dbg(dev, "hsync-active %s\n", v ? "high" : "low");
 	}
 
 	if (!fwnode_property_read_u32(fwnode, "vsync-active", &v)) {
@@ -287,7 +289,7 @@ v4l2_fwnode_endpoint_parse_parallel_bus(struct fwnode_handle *fwnode,
 			   V4L2_MBUS_VSYNC_ACTIVE_LOW);
 		flags |= v ? V4L2_MBUS_VSYNC_ACTIVE_HIGH :
 			V4L2_MBUS_VSYNC_ACTIVE_LOW;
-		pr_debug("vsync-active %s\n", v ? "high" : "low");
+		dev_dbg(dev, "vsync-active %s\n", v ? "high" : "low");
 	}
 
 	if (!fwnode_property_read_u32(fwnode, "field-even-active", &v)) {
@@ -295,7 +297,7 @@ v4l2_fwnode_endpoint_parse_parallel_bus(struct fwnode_handle *fwnode,
 			   V4L2_MBUS_FIELD_EVEN_LOW);
 		flags |= v ? V4L2_MBUS_FIELD_EVEN_HIGH :
 			V4L2_MBUS_FIELD_EVEN_LOW;
-		pr_debug("field-even-active %s\n", v ? "high" : "low");
+		dev_dbg(dev, "field-even-active %s\n", v ? "high" : "low");
 	}
 
 	if (!fwnode_property_read_u32(fwnode, "pclk-sample", &v)) {
@@ -305,18 +307,18 @@ v4l2_fwnode_endpoint_parse_parallel_bus(struct fwnode_handle *fwnode,
 		switch (v) {
 		case 0:
 			flags |= V4L2_MBUS_PCLK_SAMPLE_FALLING;
-			pr_debug("pclk-sample low\n");
+			dev_dbg(dev, "pclk-sample low\n");
 			break;
 		case 1:
 			flags |= V4L2_MBUS_PCLK_SAMPLE_RISING;
-			pr_debug("pclk-sample high\n");
+			dev_dbg(dev, "pclk-sample high\n");
 			break;
 		case 2:
 			flags |= V4L2_MBUS_PCLK_SAMPLE_DUALEDGE;
-			pr_debug("pclk-sample dual edge\n");
+			dev_dbg(dev, "pclk-sample dual edge\n");
 			break;
 		default:
-			pr_warn("invalid argument for pclk-sample");
+			dev_warn(dev, "invalid argument for pclk-sample");
 			break;
 		}
 	}
@@ -326,11 +328,11 @@ v4l2_fwnode_endpoint_parse_parallel_bus(struct fwnode_handle *fwnode,
 			   V4L2_MBUS_DATA_ACTIVE_LOW);
 		flags |= v ? V4L2_MBUS_DATA_ACTIVE_HIGH :
 			V4L2_MBUS_DATA_ACTIVE_LOW;
-		pr_debug("data-active %s\n", v ? "high" : "low");
+		dev_dbg(dev, "data-active %s\n", v ? "high" : "low");
 	}
 
 	if (fwnode_property_present(fwnode, "slave-mode")) {
-		pr_debug("slave mode\n");
+		dev_dbg(dev, "slave mode\n");
 		flags &= ~V4L2_MBUS_MASTER;
 		flags |= V4L2_MBUS_SLAVE;
 	} else {
@@ -340,12 +342,12 @@ v4l2_fwnode_endpoint_parse_parallel_bus(struct fwnode_handle *fwnode,
 
 	if (!fwnode_property_read_u32(fwnode, "bus-width", &v)) {
 		bus->bus_width = v;
-		pr_debug("bus-width %u\n", v);
+		dev_dbg(dev, "bus-width %u\n", v);
 	}
 
 	if (!fwnode_property_read_u32(fwnode, "data-shift", &v)) {
 		bus->data_shift = v;
-		pr_debug("data-shift %u\n", v);
+		dev_dbg(dev, "data-shift %u\n", v);
 	}
 
 	if (!fwnode_property_read_u32(fwnode, "sync-on-green-active", &v)) {
@@ -353,7 +355,7 @@ v4l2_fwnode_endpoint_parse_parallel_bus(struct fwnode_handle *fwnode,
 			   V4L2_MBUS_VIDEO_SOG_ACTIVE_LOW);
 		flags |= v ? V4L2_MBUS_VIDEO_SOG_ACTIVE_HIGH :
 			V4L2_MBUS_VIDEO_SOG_ACTIVE_LOW;
-		pr_debug("sync-on-green-active %s\n", v ? "high" : "low");
+		dev_dbg(dev, "sync-on-green-active %s\n", v ? "high" : "low");
 	}
 
 	if (!fwnode_property_read_u32(fwnode, "data-enable-active", &v)) {
@@ -361,7 +363,7 @@ v4l2_fwnode_endpoint_parse_parallel_bus(struct fwnode_handle *fwnode,
 			   V4L2_MBUS_DATA_ENABLE_LOW);
 		flags |= v ? V4L2_MBUS_DATA_ENABLE_HIGH :
 			V4L2_MBUS_DATA_ENABLE_LOW;
-		pr_debug("data-enable-active %s\n", v ? "high" : "low");
+		dev_dbg(dev, "data-enable-active %s\n", v ? "high" : "low");
 	}
 
 	switch (bus_type) {
@@ -384,7 +386,8 @@ v4l2_fwnode_endpoint_parse_parallel_bus(struct fwnode_handle *fwnode,
 }
 
 static void
-v4l2_fwnode_endpoint_parse_csi1_bus(struct fwnode_handle *fwnode,
+v4l2_fwnode_endpoint_parse_csi1_bus(struct device *dev,
+				    struct fwnode_handle *fwnode,
 				    struct v4l2_fwnode_endpoint *vep,
 				    enum v4l2_mbus_type bus_type)
 {
@@ -393,22 +396,22 @@ v4l2_fwnode_endpoint_parse_csi1_bus(struct fwnode_handle *fwnode,
 
 	if (!fwnode_property_read_u32(fwnode, "clock-inv", &v)) {
 		bus->clock_inv = v;
-		pr_debug("clock-inv %u\n", v);
+		dev_dbg(dev, "clock-inv %u\n", v);
 	}
 
 	if (!fwnode_property_read_u32(fwnode, "strobe", &v)) {
 		bus->strobe = v;
-		pr_debug("strobe %u\n", v);
+		dev_dbg(dev, "strobe %u\n", v);
 	}
 
 	if (!fwnode_property_read_u32(fwnode, "data-lanes", &v)) {
 		bus->data_lane = v;
-		pr_debug("data-lanes %u\n", v);
+		dev_dbg(dev, "data-lanes %u\n", v);
 	}
 
 	if (!fwnode_property_read_u32(fwnode, "clock-lanes", &v)) {
 		bus->clock_lane = v;
-		pr_debug("clock-lanes %u\n", v);
+		dev_dbg(dev, "clock-lanes %u\n", v);
 	}
 
 	if (bus_type == V4L2_MBUS_CCP2)
@@ -417,31 +420,32 @@ v4l2_fwnode_endpoint_parse_csi1_bus(struct fwnode_handle *fwnode,
 		vep->bus_type = V4L2_MBUS_CSI1;
 }
 
-static int __v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
+static int __v4l2_fwnode_endpoint_parse(struct device *dev,
+					struct fwnode_handle *fwnode,
 					struct v4l2_fwnode_endpoint *vep)
 {
 	u32 bus_type = V4L2_FWNODE_BUS_TYPE_GUESS;
 	enum v4l2_mbus_type mbus_type;
 	int rval;
 
-	pr_debug("===== begin parsing endpoint %pfw\n", fwnode);
+	dev_dbg(dev, "===== begin parsing endpoint %pfw\n", fwnode);
 
 	fwnode_property_read_u32(fwnode, "bus-type", &bus_type);
-	pr_debug("fwnode video bus type %s (%u), mbus type %s (%u)\n",
-		 v4l2_fwnode_bus_type_to_string(bus_type), bus_type,
-		 v4l2_fwnode_mbus_type_to_string(vep->bus_type),
-		 vep->bus_type);
+	dev_dbg(dev, "fwnode video bus type %s (%u), mbus type %s (%u)\n",
+		v4l2_fwnode_bus_type_to_string(bus_type), bus_type,
+		v4l2_fwnode_mbus_type_to_string(vep->bus_type),
+		vep->bus_type);
 	mbus_type = v4l2_fwnode_bus_type_to_mbus(bus_type);
 	if (mbus_type == V4L2_MBUS_INVALID) {
-		pr_debug("unsupported bus type %u\n", bus_type);
+		dev_dbg(dev, "unsupported bus type %u\n", bus_type);
 		return -EINVAL;
 	}
 
 	if (vep->bus_type != V4L2_MBUS_UNKNOWN) {
 		if (mbus_type != V4L2_MBUS_UNKNOWN &&
 		    vep->bus_type != mbus_type) {
-			pr_debug("expecting bus type %s\n",
-				 v4l2_fwnode_mbus_type_to_string(vep->bus_type));
+			dev_dbg(dev, "expecting bus type %s\n",
+				v4l2_fwnode_mbus_type_to_string(vep->bus_type));
 			return -ENXIO;
 		}
 	} else {
@@ -450,28 +454,29 @@ static int __v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
 
 	switch (vep->bus_type) {
 	case V4L2_MBUS_UNKNOWN:
-		rval = v4l2_fwnode_endpoint_parse_csi2_bus(fwnode, vep,
+		rval = v4l2_fwnode_endpoint_parse_csi2_bus(dev, fwnode, vep,
 							   V4L2_MBUS_UNKNOWN);
 		if (rval)
 			return rval;
 
 		if (vep->bus_type == V4L2_MBUS_UNKNOWN)
-			v4l2_fwnode_endpoint_parse_parallel_bus(fwnode, vep,
+			v4l2_fwnode_endpoint_parse_parallel_bus(dev, fwnode, vep,
 								V4L2_MBUS_UNKNOWN);
 
-		pr_debug("assuming media bus type %s (%u)\n",
-			 v4l2_fwnode_mbus_type_to_string(vep->bus_type),
-			 vep->bus_type);
+		dev_dbg(dev, "assuming media bus type %s (%u)\n",
+			v4l2_fwnode_mbus_type_to_string(vep->bus_type),
+			vep->bus_type);
 
 		break;
 	case V4L2_MBUS_CCP2:
 	case V4L2_MBUS_CSI1:
-		v4l2_fwnode_endpoint_parse_csi1_bus(fwnode, vep, vep->bus_type);
+		v4l2_fwnode_endpoint_parse_csi1_bus(dev, fwnode, vep,
+						    vep->bus_type);
 
 		break;
 	case V4L2_MBUS_CSI2_DPHY:
 	case V4L2_MBUS_CSI2_CPHY:
-		rval = v4l2_fwnode_endpoint_parse_csi2_bus(fwnode, vep,
+		rval = v4l2_fwnode_endpoint_parse_csi2_bus(dev, fwnode, vep,
 							   vep->bus_type);
 		if (rval)
 			return rval;
@@ -479,12 +484,12 @@ static int __v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
 		break;
 	case V4L2_MBUS_PARALLEL:
 	case V4L2_MBUS_BT656:
-		v4l2_fwnode_endpoint_parse_parallel_bus(fwnode, vep,
+		v4l2_fwnode_endpoint_parse_parallel_bus(dev, fwnode, vep,
 							vep->bus_type);
 
 		break;
 	default:
-		pr_warn("unsupported bus type %u\n", mbus_type);
+		dev_warn(dev, "unsupported bus type %u\n", mbus_type);
 		return -EINVAL;
 	}
 
@@ -498,9 +503,9 @@ int v4l2_fwnode_endpoint_parse(struct device *dev, struct fwnode_handle *fwnode,
 {
 	int ret;
 
-	ret = __v4l2_fwnode_endpoint_parse(fwnode, vep);
+	ret = __v4l2_fwnode_endpoint_parse(dev, fwnode, vep);
 
-	pr_debug("===== end parsing endpoint %pfw\n", fwnode);
+	dev_dbg(dev, "===== end parsing endpoint %pfw\n", fwnode);
 
 	return ret;
 }
@@ -522,7 +527,7 @@ int v4l2_fwnode_endpoint_alloc_parse(struct device *dev,
 {
 	int rval;
 
-	rval = __v4l2_fwnode_endpoint_parse(fwnode, vep);
+	rval = __v4l2_fwnode_endpoint_parse(dev, fwnode, vep);
 	if (rval < 0)
 		return rval;
 
@@ -548,11 +553,11 @@ int v4l2_fwnode_endpoint_alloc_parse(struct device *dev,
 		}
 
 		for (i = 0; i < vep->nr_of_link_frequencies; i++)
-			pr_debug("link-frequencies %u value %llu\n", i,
-				 vep->link_frequencies[i]);
+			dev_dbg(dev, "link-frequencies %u value %llu\n", i,
+				vep->link_frequencies[i]);
 	}
 
-	pr_debug("===== end parsing endpoint %pfw\n", fwnode);
+	dev_dbg(dev, "===== end parsing endpoint %pfw\n", fwnode);
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart

