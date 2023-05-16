Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B2947049DC
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 11:56:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232266AbjEPJ4y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 05:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232253AbjEPJ4c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 05:56:32 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F203A3C0C
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 02:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684230989; x=1715766989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FGuIOLC7EBjppOz7cQuTnhyRnGzP8E6N8f8F8dGE9bM=;
  b=Lv2k/eOAO0iJR1AEPfwpYRrF+DTOy6SQJa6drwgGrvfjRms2AOAv1nHE
   GycDzYvwWmLTPjHSduts2OfYGgFGZY5D0d2SBT5uWJ18iOUSZRuoPWx+3
   79aWG1BqTO/jVvPrNSBVFN/6f6kW14t/JdcPif8KWI8KwRhvOy47x5+JC
   D6KlJLHlFJHjfjhRjcBPjD66CrDTZHzrkwhP9VumuT+N+TN+92xwZHYU/
   XTBzHH9kPSJBX+P5tWdxhJPhXHF1oXdcCdFx6I/4ekQjeFp6HnNk/gtiD
   Ro5HRS/QLnzquSieZ2HVOYtjqfuR4gU7OLmh9Cl6FYqNguL7DadSctFEI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="354601571"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="354601571"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="731931872"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="731931872"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 02:55:48 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 4AE2B122EEF;
        Tue, 16 May 2023 12:55:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.94.2)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1pyrOy-002ZAY-9z; Tue, 16 May 2023 12:55:28 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com
Subject: [PATCH v2 17/31] media: v4l: async: Obtain async connection based on sub-device
Date:   Tue, 16 May 2023 12:55:03 +0300
Message-Id: <20230516095517.611711-18-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
References: <20230516095517.611711-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add v4l2_async_connection_unique() function for obtaining a struct
v4l2_async_connection, typically allocated by drivers together with their
own information on an external sub-device.

The relation between connections and sub-devices still remains 1:1 but
this code becomes more complex when the relation soon changes.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../media/platform/rockchip/rkisp1/rkisp1-csi.c   |  7 ++++++-
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c   |  8 ++++++--
 drivers/media/platform/ti/omap3isp/isp.c          | 11 +++++++++--
 drivers/media/platform/ti/omap3isp/isp.h          | 13 +++++++++++--
 drivers/media/platform/ti/omap3isp/ispccdc.c      | 13 +++++++++++--
 drivers/media/platform/ti/omap3isp/ispccp2.c      |  2 ++
 drivers/media/platform/ti/omap3isp/ispcsi2.c      |  2 ++
 drivers/media/platform/ti/omap3isp/ispcsiphy.c    | 15 ++++++++++++---
 drivers/media/v4l2-core/v4l2-async.c              |  7 +++++++
 include/media/v4l2-async.h                        | 11 +++++++++++
 10 files changed, 77 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index d7acc94e10f8d..fdff3d0da4e50 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
@@ -381,6 +381,7 @@ static int rkisp1_csi_s_stream(struct v4l2_subdev *sd, int enable)
 	struct rkisp1_csi *csi = to_rkisp1_csi(sd);
 	struct rkisp1_device *rkisp1 = csi->rkisp1;
 	struct rkisp1_sensor_async *source_asd;
+	struct v4l2_async_connection *asc;
 	struct media_pad *source_pad;
 	struct v4l2_subdev *source;
 	int ret;
@@ -406,7 +407,11 @@ static int rkisp1_csi_s_stream(struct v4l2_subdev *sd, int enable)
 		return -EPIPE;
 	}
 
-	source_asd = container_of(source->asd, struct rkisp1_sensor_async, asd);
+	asc = v4l2_async_connection_unique(source);
+	if (!asc)
+		return -EPIPE;
+
+	source_asd = container_of(asc, struct rkisp1_sensor_async, asd);
 	if (source_asd->mbus_type != V4L2_MBUS_CSI2_DPHY)
 		return -EINVAL;
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 585cf3f534692..07fbb77ce2349 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -868,9 +868,13 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 		mbus_flags = 0;
 	} else {
 		const struct rkisp1_sensor_async *asd;
+		struct v4l2_async_connection *asc;
 
-		asd = container_of(rkisp1->source->asd,
-				   struct rkisp1_sensor_async, asd);
+		asc = v4l2_async_connection_unique(rkisp1->source);
+		if (!asc)
+			return -EPIPE;
+
+		asd = container_of(asc, struct rkisp1_sensor_async, asd);
 
 		mbus_type = asd->mbus_type;
 		mbus_flags = asd->mbus_flags;
diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index f3aaa9e76492e..73d5084dce8b9 100644
--- a/drivers/media/platform/ti/omap3isp/isp.c
+++ b/drivers/media/platform/ti/omap3isp/isp.c
@@ -2039,11 +2039,18 @@ static int isp_subdev_notifier_complete(struct v4l2_async_notifier *async)
 	}
 
 	list_for_each_entry(sd, &v4l2_dev->subdevs, list) {
+		struct isp_bus_cfg *bus_cfg;
+
 		if (sd->notifier != &isp->notifier)
 			continue;
 
-		ret = isp_link_entity(isp, &sd->entity,
-				      v4l2_subdev_to_bus_cfg(sd)->interface);
+		bus_cfg = v4l2_subdev_to_bus_cfg(sd);
+		if (!bus_cfg) {
+			mutex_unlock(&isp->media_dev.graph_mutex);
+			return -EINVAL;
+		}
+
+		ret = isp_link_entity(isp, &sd->entity, bus_cfg->interface);
 		if (ret < 0) {
 			mutex_unlock(&isp->media_dev.graph_mutex);
 			return ret;
diff --git a/drivers/media/platform/ti/omap3isp/isp.h b/drivers/media/platform/ti/omap3isp/isp.h
index 32ea70c8d2f9b..b4793631ad975 100644
--- a/drivers/media/platform/ti/omap3isp/isp.h
+++ b/drivers/media/platform/ti/omap3isp/isp.h
@@ -224,8 +224,17 @@ struct isp_async_subdev {
 	struct isp_bus_cfg bus;
 };
 
-#define v4l2_subdev_to_bus_cfg(sd) \
-	(&container_of((sd)->asd, struct isp_async_subdev, asd)->bus)
+static inline struct isp_bus_cfg *
+v4l2_subdev_to_bus_cfg(struct v4l2_subdev *sd)
+{
+	struct v4l2_async_connection *asc;
+
+	asc = v4l2_async_connection_unique(sd);
+	if (!asc)
+		return NULL;
+
+	return &container_of(asc, struct isp_async_subdev, asd)->bus;
+}
 
 #define v4l2_dev_to_isp_device(dev) \
 	container_of(dev, struct isp_device, v4l2_dev)
diff --git a/drivers/media/platform/ti/omap3isp/ispccdc.c b/drivers/media/platform/ti/omap3isp/ispccdc.c
index fdcdffe5fecb5..2fe42aa918004 100644
--- a/drivers/media/platform/ti/omap3isp/ispccdc.c
+++ b/drivers/media/platform/ti/omap3isp/ispccdc.c
@@ -1140,8 +1140,13 @@ static void ccdc_configure(struct isp_ccdc_device *ccdc)
 	if (ccdc->input == CCDC_INPUT_PARALLEL) {
 		struct v4l2_subdev *sd =
 			to_isp_pipeline(&ccdc->subdev.entity)->external;
+		struct isp_bus_cfg *bus_cfg;
 
-		parcfg = &v4l2_subdev_to_bus_cfg(sd)->bus.parallel;
+		bus_cfg = v4l2_subdev_to_bus_cfg(sd);
+		if (WARN_ON(!bus_cfg))
+			return;
+
+		parcfg = &bus_cfg->bus.parallel;
 		ccdc->bt656 = parcfg->bt656;
 	}
 
@@ -2436,7 +2441,11 @@ static int ccdc_link_validate(struct v4l2_subdev *sd,
 	if (ccdc->input == CCDC_INPUT_PARALLEL) {
 		struct v4l2_subdev *sd =
 			media_entity_to_v4l2_subdev(link->source->entity);
-		struct isp_bus_cfg *bus_cfg = v4l2_subdev_to_bus_cfg(sd);
+		struct isp_bus_cfg *bus_cfg;
+
+		bus_cfg = v4l2_subdev_to_bus_cfg(sd);
+		if (WARN_ON(!bus_cfg))
+			return -EPIPE;
 
 		parallel_shift = bus_cfg->bus.parallel.data_lane_shift;
 	} else {
diff --git a/drivers/media/platform/ti/omap3isp/ispccp2.c b/drivers/media/platform/ti/omap3isp/ispccp2.c
index fc90ff88464fd..da5f0176ec789 100644
--- a/drivers/media/platform/ti/omap3isp/ispccp2.c
+++ b/drivers/media/platform/ti/omap3isp/ispccp2.c
@@ -360,6 +360,8 @@ static int ccp2_if_configure(struct isp_ccp2_device *ccp2)
 	pad = media_pad_remote_pad_first(&ccp2->pads[CCP2_PAD_SINK]);
 	sensor = media_entity_to_v4l2_subdev(pad->entity);
 	buscfg = v4l2_subdev_to_bus_cfg(pipe->external);
+	if (WARN_ON(!buscfg))
+		return -EPIPE;
 
 	ret = ccp2_phyif_config(ccp2, &buscfg->bus.ccp2);
 	if (ret < 0)
diff --git a/drivers/media/platform/ti/omap3isp/ispcsi2.c b/drivers/media/platform/ti/omap3isp/ispcsi2.c
index 6870980a2fa9e..0f9a54b11f983 100644
--- a/drivers/media/platform/ti/omap3isp/ispcsi2.c
+++ b/drivers/media/platform/ti/omap3isp/ispcsi2.c
@@ -564,6 +564,8 @@ static int csi2_configure(struct isp_csi2_device *csi2)
 	pad = media_pad_remote_pad_first(&csi2->pads[CSI2_PAD_SINK]);
 	sensor = media_entity_to_v4l2_subdev(pad->entity);
 	buscfg = v4l2_subdev_to_bus_cfg(pipe->external);
+	if (WARN_ON(!buscfg))
+		return -EPIPE;
 
 	csi2->frame_skip = 0;
 	v4l2_subdev_call(sensor, sensor, g_skip_frames, &csi2->frame_skip);
diff --git a/drivers/media/platform/ti/omap3isp/ispcsiphy.c b/drivers/media/platform/ti/omap3isp/ispcsiphy.c
index 1bde76c0adbee..29a84d8ca0df1 100644
--- a/drivers/media/platform/ti/omap3isp/ispcsiphy.c
+++ b/drivers/media/platform/ti/omap3isp/ispcsiphy.c
@@ -163,13 +163,17 @@ static int csiphy_set_power(struct isp_csiphy *phy, u32 power)
 static int omap3isp_csiphy_config(struct isp_csiphy *phy)
 {
 	struct isp_pipeline *pipe = to_isp_pipeline(phy->entity);
-	struct isp_bus_cfg *buscfg = v4l2_subdev_to_bus_cfg(pipe->external);
+	struct isp_bus_cfg *buscfg;
 	struct isp_csiphy_lanes_cfg *lanes;
 	int csi2_ddrclk_khz;
 	unsigned int num_data_lanes, used_lanes = 0;
 	unsigned int i;
 	u32 reg;
 
+	buscfg = v4l2_subdev_to_bus_cfg(pipe->external);
+	if (WARN_ON(!buscfg))
+		return -EPIPE;
+
 	if (buscfg->interface == ISP_INTERFACE_CCP2B_PHY1
 	    || buscfg->interface == ISP_INTERFACE_CCP2B_PHY2) {
 		lanes = &buscfg->bus.ccp2.lanecfg;
@@ -306,8 +310,13 @@ void omap3isp_csiphy_release(struct isp_csiphy *phy)
 	mutex_lock(&phy->mutex);
 	if (phy->entity) {
 		struct isp_pipeline *pipe = to_isp_pipeline(phy->entity);
-		struct isp_bus_cfg *buscfg =
-			v4l2_subdev_to_bus_cfg(pipe->external);
+		struct isp_bus_cfg *buscfg;
+
+		buscfg = v4l2_subdev_to_bus_cfg(pipe->external);
+		if (WARN_ON(!buscfg)) {
+			mutex_unlock(&phy->mutex);
+			return;
+		}
 
 		csiphy_routing_cfg(phy, buscfg->interface, false,
 				   buscfg->bus.ccp2.phy_layer);
diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index a11d6c075ad25..c70d87931ebb6 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -751,6 +751,13 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier, int adapter_id,
 }
 EXPORT_SYMBOL_GPL(__v4l2_async_nf_add_i2c);
 
+struct v4l2_async_connection *
+v4l2_async_connection_unique(struct v4l2_subdev *sd)
+{
+	return sd->asd;
+}
+EXPORT_SYMBOL_GPL(v4l2_async_connection_unique);
+
 int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 {
 	struct v4l2_async_notifier *subdev_notifier;
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 56b7238e2cbe2..6e0f9a4965aa5 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -209,6 +209,17 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier,
 	((type *)__v4l2_async_nf_add_i2c(notifier, adapter, address, \
 					 sizeof(type)))
 
+/**
+ * v4l2_async_connection_unique - return a unique &struct v4l2_async_connection
+ *				  for a sub-device
+ * @sd: the sub-device
+ *
+ * Return an async connection for a sub-device, when there is a single
+ * one only.
+ */
+struct v4l2_async_connection *
+v4l2_async_connection_unique(struct v4l2_subdev *sd);
+
 /**
  * v4l2_async_nf_register - registers a subdevice asynchronous notifier
  *
-- 
2.30.2

