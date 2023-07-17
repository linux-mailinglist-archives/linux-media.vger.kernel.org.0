Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEE5A75648A
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 15:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbjGQNWL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jul 2023 09:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbjGQNVk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jul 2023 09:21:40 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF17212D
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 06:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689600062; x=1721136062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yeaeF+gggh+g/JEpFDmNDRKvMHzzpSJya+C8U06Ynh8=;
  b=OulvCYGnPpHoUMMVqIWrAKUl7OlL3pZxjZ5vcmM4UhkEd+Pc4AbEVZ1u
   CKCkWcOZGAGSdVXy0cwXaxOPvdel88jg5jgTZ3ATLMfjomwunxUAOLAbx
   8cp+x4L1SZFBhA2q7pQECB43XORO7rlTiijzii9N4yjfEdv1/SNtLsqKK
   B6n2Z5Cf7YOTFBHWPkZP6TYUZRGiQy2Z5WIs+voaU5Xfn9VWfksON9cCQ
   Rug5zEWWcChDz/2EKetxV9NHUq5evW00fDr4WfQ5mzSBRu/mJjc/0dN4V
   a3Sa+mntLy0YQz+3NrgIFY/wBUqzQ0lJ2gDsMnp1zFS/KopHpZMIvUazD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432097685"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="432097685"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:20:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="726542028"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="726542028"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 06:20:36 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 3B040121068;
        Mon, 17 Jul 2023 16:20:16 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qLO8G-004s1c-1D;
        Mon, 17 Jul 2023 16:19:20 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v5 23/38] media: v4l: async: Obtain async connection based on sub-device
Date:   Mon, 17 Jul 2023 16:18:54 +0300
Message-Id: <20230717131909.1160787-24-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230717131909.1160787-1-sakari.ailus@linux.intel.com>
References: <20230717131909.1160787-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
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
Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
Tested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se> # rcar + adv746x
Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.MX6Q with TC358743
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Renesas RZ/G2L SMARC
---
 .../media/platform/rockchip/rkisp1/rkisp1-csi.c   |  7 ++++++-
 .../media/platform/rockchip/rkisp1/rkisp1-isp.c   |  8 ++++++--
 drivers/media/platform/ti/omap3isp/isp.h          | 13 +++++++++++--
 drivers/media/platform/ti/omap3isp/ispccdc.c      | 13 +++++++++++--
 drivers/media/platform/ti/omap3isp/ispccp2.c      |  2 ++
 drivers/media/platform/ti/omap3isp/ispcsi2.c      |  2 ++
 drivers/media/platform/ti/omap3isp/ispcsiphy.c    | 15 ++++++++++++---
 drivers/media/v4l2-core/v4l2-async.c              |  7 +++++++
 include/media/v4l2-async.h                        | 11 +++++++++++
 9 files changed, 68 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index d7acc94e10f8..fdff3d0da4e5 100644
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
index 585cf3f53469..07fbb77ce234 100644
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
diff --git a/drivers/media/platform/ti/omap3isp/isp.h b/drivers/media/platform/ti/omap3isp/isp.h
index 32ea70c8d2f9..b4793631ad97 100644
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
index fdcdffe5fecb..2fe42aa91800 100644
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
index fc90ff88464f..da5f0176ec78 100644
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
index 6870980a2fa9..0f9a54b11f98 100644
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
index 1bde76c0adbe..29a84d8ca0df 100644
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
index 95fecf39ba65..cb962b0fc2bc 100644
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
index c06b3b832228..5bc2efe720c2 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -210,6 +210,17 @@ __v4l2_async_nf_add_i2c(struct v4l2_async_notifier *notifier,
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
2.39.2

