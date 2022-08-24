Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA36759F7CE
	for <lists+linux-media@lfdr.de>; Wed, 24 Aug 2022 12:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236347AbiHXKca (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Aug 2022 06:32:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236101AbiHXKc2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Aug 2022 06:32:28 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A3237F106
        for <linux-media@vger.kernel.org>; Wed, 24 Aug 2022 03:32:25 -0700 (PDT)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1oQngN-00033A-85; Wed, 24 Aug 2022 12:32:23 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v2] media: imx: Use get_mbus_config instead of parsing upstream DT endpoints
Date:   Wed, 24 Aug 2022 12:32:10 +0200
Message-Id: <20220824103210.3950198-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Stop parsing upstream neighbors' device-tree endpoints to retrieve the
media bus configuration. Instead use the get_mbus_config op and throw an
error if the upstream subdevice does not implement it.

Also drop the corresponding TODO entry and the now unused
imx_media_get_pad_fwnode() function.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
Tested-by: Marco Felsch <m.felsch@pengutronix.de>
---
Changes since v1:
 - drop unnecessary IS_ENABLED(CONFIG_OF) check
 - update error messages
---
 drivers/staging/media/imx/TODO              |  12 --
 drivers/staging/media/imx/imx-media-csi.c   | 135 +++++++++-----------
 drivers/staging/media/imx/imx-media-utils.c |  33 -----
 drivers/staging/media/imx/imx-media.h       |   1 -
 4 files changed, 63 insertions(+), 118 deletions(-)

diff --git a/drivers/staging/media/imx/TODO b/drivers/staging/media/imx/TODO
index 5d3a337c8702..62d0426445c2 100644
--- a/drivers/staging/media/imx/TODO
+++ b/drivers/staging/media/imx/TODO
@@ -2,18 +2,6 @@
 - The Frame Interval Monitor could be exported to v4l2-core for
   general use.
 
-- The CSI subdevice parses its nearest upstream neighbor's device-tree
-  bus config in order to setup the CSI. Laurent Pinchart argues that
-  instead the CSI subdev should call its neighbor's g_mbus_config op
-  (which should be propagated if necessary) to get this info. However
-  Hans Verkuil is planning to remove the g_mbus_config op. For now this
-  driver uses the parsed DT bus config method until this issue is
-  resolved.
-
-  2020-06: g_mbus has been removed in favour of the get_mbus_config pad
-  operation which should be used to avoid parsing the remote endpoint
-  configuration.
-
 - This media driver supports inheriting V4L2 controls to the
   video capture devices, from the subdevices in the capture device's
   pipeline. The controls for each capture device are updated in the
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index b2b1f4dd41d7..5c3cc7de209d 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -97,8 +97,8 @@ struct csi_priv {
 	/* the mipi virtual channel number at link validate */
 	int vc_num;
 
-	/* the upstream endpoint CSI is receiving from */
-	struct v4l2_fwnode_endpoint upstream_ep;
+	/* media bus config of the upstream subdevice CSI is receiving from */
+	struct v4l2_mbus_config mbus_cfg;
 
 	spinlock_t irqlock; /* protect eof_irq handler */
 	struct timer_list eof_timeout_timer;
@@ -125,14 +125,14 @@ static inline struct csi_priv *notifier_to_dev(struct v4l2_async_notifier *n)
 	return container_of(n, struct csi_priv, notifier);
 }
 
-static inline bool is_parallel_bus(struct v4l2_fwnode_endpoint *ep)
+static inline bool is_parallel_bus(struct v4l2_mbus_config *mbus_cfg)
 {
-	return ep->bus_type != V4L2_MBUS_CSI2_DPHY;
+	return mbus_cfg->type != V4L2_MBUS_CSI2_DPHY;
 }
 
-static inline bool is_parallel_16bit_bus(struct v4l2_fwnode_endpoint *ep)
+static inline bool is_parallel_16bit_bus(struct v4l2_mbus_config *mbus_cfg)
 {
-	return is_parallel_bus(ep) && ep->bus.parallel.bus_width >= 16;
+	return is_parallel_bus(mbus_cfg) && mbus_cfg->bus.parallel.bus_width >= 16;
 }
 
 /*
@@ -145,36 +145,31 @@ static inline bool is_parallel_16bit_bus(struct v4l2_fwnode_endpoint *ep)
  * - the CSI is receiving from an 8-bit parallel bus and the incoming
  *   media bus format is other than UYVY8_2X8/YUYV8_2X8.
  */
-static inline bool requires_passthrough(struct v4l2_fwnode_endpoint *ep,
+static inline bool requires_passthrough(struct v4l2_mbus_config *mbus_cfg,
 					struct v4l2_mbus_framefmt *infmt,
 					const struct imx_media_pixfmt *incc)
 {
-	if (ep->bus_type == V4L2_MBUS_BT656) // including BT.1120
+	if (mbus_cfg->type == V4L2_MBUS_BT656) // including BT.1120
 		return false;
 
-	return incc->bayer || is_parallel_16bit_bus(ep) ||
-		(is_parallel_bus(ep) &&
+	return incc->bayer || is_parallel_16bit_bus(mbus_cfg) ||
+		(is_parallel_bus(mbus_cfg) &&
 		 infmt->code != MEDIA_BUS_FMT_UYVY8_2X8 &&
 		 infmt->code != MEDIA_BUS_FMT_YUYV8_2X8);
 }
 
 /*
- * Parses the fwnode endpoint from the source pad of the entity
- * connected to this CSI. This will either be the entity directly
- * upstream from the CSI-2 receiver, directly upstream from the
- * video mux, or directly upstream from the CSI itself. The endpoint
- * is needed to determine the bus type and bus config coming into
- * the CSI.
+ * Queries the media bus config of the upstream entity that provides data to
+ * the CSI. This will either be the entity directly upstream from the CSI-2
+ * receiver, directly upstream from a video mux, or directly upstream from
+ * the CSI itself.
  */
-static int csi_get_upstream_endpoint(struct csi_priv *priv,
-				     struct v4l2_fwnode_endpoint *ep)
+static int csi_get_upstream_mbus_config(struct csi_priv *priv,
+					struct v4l2_mbus_config *mbus_cfg)
 {
-	struct fwnode_handle *endpoint;
-	struct v4l2_subdev *sd;
-	struct media_pad *pad;
-
-	if (!IS_ENABLED(CONFIG_OF))
-		return -ENXIO;
+	struct v4l2_subdev *sd, *remote_sd;
+	struct media_pad *remote_pad;
+	int ret;
 
 	if (!priv->src_sd)
 		return -EPIPE;
@@ -206,19 +201,21 @@ static int csi_get_upstream_endpoint(struct csi_priv *priv,
 	}
 
 	/* get source pad of entity directly upstream from sd */
-	pad = imx_media_pipeline_pad(&sd->entity, 0, 0, true);
-	if (!pad)
-		return -ENODEV;
-
-	endpoint = imx_media_get_pad_fwnode(pad);
-	if (IS_ERR(endpoint))
-		return PTR_ERR(endpoint);
+	remote_pad = media_entity_remote_pad_unique(&sd->entity,
+						    MEDIA_PAD_FL_SOURCE);
+	if (IS_ERR(remote_pad))
+		return PTR_ERR(remote_pad);
 
-	v4l2_fwnode_endpoint_parse(endpoint, ep);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
 
-	fwnode_handle_put(endpoint);
+	ret = v4l2_subdev_call(remote_sd, pad, get_mbus_config,
+			       remote_pad->index, mbus_cfg);
+	if (ret == -ENOIOCTLCMD)
+		v4l2_err(&priv->sd,
+			 "entity %s does not implement get_mbus_config()\n",
+			 remote_pad->entity->name);
 
-	return 0;
+	return ret;
 }
 
 static void csi_idmac_put_ipu_resources(struct csi_priv *priv)
@@ -435,7 +432,7 @@ static int csi_idmac_setup_channel(struct csi_priv *priv)
 	image.phys0 = phys[0];
 	image.phys1 = phys[1];
 
-	passthrough = requires_passthrough(&priv->upstream_ep, infmt, incc);
+	passthrough = requires_passthrough(&priv->mbus_cfg, infmt, incc);
 	passthrough_cycles = 1;
 
 	/*
@@ -708,7 +705,6 @@ static int csi_setup(struct csi_priv *priv)
 {
 	struct v4l2_mbus_framefmt *infmt, *outfmt;
 	const struct imx_media_pixfmt *incc;
-	struct v4l2_mbus_config mbus_cfg;
 	struct v4l2_mbus_framefmt if_fmt;
 	struct v4l2_rect crop;
 
@@ -716,13 +712,6 @@ static int csi_setup(struct csi_priv *priv)
 	incc = priv->cc[CSI_SINK_PAD];
 	outfmt = &priv->format_mbus[priv->active_output_pad];
 
-	/* compose mbus_config from the upstream endpoint */
-	mbus_cfg.type = priv->upstream_ep.bus_type;
-	if (is_parallel_bus(&priv->upstream_ep))
-		mbus_cfg.bus.parallel = priv->upstream_ep.bus.parallel;
-	else
-		mbus_cfg.bus.mipi_csi2 = priv->upstream_ep.bus.mipi_csi2;
-
 	if_fmt = *infmt;
 	crop = priv->crop;
 
@@ -730,7 +719,7 @@ static int csi_setup(struct csi_priv *priv)
 	 * if cycles is set, we need to handle this over multiple cycles as
 	 * generic/bayer data
 	 */
-	if (is_parallel_bus(&priv->upstream_ep) && incc->cycles) {
+	if (is_parallel_bus(&priv->mbus_cfg) && incc->cycles) {
 		if_fmt.width *= incc->cycles;
 		crop.width *= incc->cycles;
 	}
@@ -741,7 +730,7 @@ static int csi_setup(struct csi_priv *priv)
 			     priv->crop.width == 2 * priv->compose.width,
 			     priv->crop.height == 2 * priv->compose.height);
 
-	ipu_csi_init_interface(priv->csi, &mbus_cfg, &if_fmt, outfmt);
+	ipu_csi_init_interface(priv->csi, &priv->mbus_cfg, &if_fmt, outfmt);
 
 	ipu_csi_set_dest(priv->csi, priv->dest);
 
@@ -769,7 +758,7 @@ static int csi_start(struct csi_priv *priv)
 		return ret;
 
 	/* Skip first few frames from a BT.656 source */
-	if (priv->upstream_ep.bus_type == V4L2_MBUS_BT656) {
+	if (priv->mbus_cfg.type == V4L2_MBUS_BT656) {
 		u32 delay_usec, bad_frames = 20;
 
 		delay_usec = DIV_ROUND_UP_ULL((u64)USEC_PER_SEC *
@@ -1118,7 +1107,7 @@ static int csi_link_validate(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_format *sink_fmt)
 {
 	struct csi_priv *priv = v4l2_get_subdevdata(sd);
-	struct v4l2_fwnode_endpoint upstream_ep = { .bus_type = 0 };
+	struct v4l2_mbus_config mbus_cfg = { .type = 0 };
 	bool is_csi2;
 	int ret;
 
@@ -1127,16 +1116,17 @@ static int csi_link_validate(struct v4l2_subdev *sd,
 	if (ret)
 		return ret;
 
-	ret = csi_get_upstream_endpoint(priv, &upstream_ep);
+	ret = csi_get_upstream_mbus_config(priv, &mbus_cfg);
 	if (ret) {
-		v4l2_err(&priv->sd, "failed to find upstream endpoint\n");
+		v4l2_err(&priv->sd,
+			 "failed to get upstream media bus configuration\n");
 		return ret;
 	}
 
 	mutex_lock(&priv->lock);
 
-	priv->upstream_ep = upstream_ep;
-	is_csi2 = !is_parallel_bus(&upstream_ep);
+	priv->mbus_cfg = mbus_cfg;
+	is_csi2 = !is_parallel_bus(&mbus_cfg);
 	if (is_csi2) {
 		/*
 		 * NOTE! It seems the virtual channels from the mipi csi-2
@@ -1192,7 +1182,7 @@ static void csi_try_crop(struct csi_priv *priv,
 			 struct v4l2_rect *crop,
 			 struct v4l2_subdev_state *sd_state,
 			 struct v4l2_mbus_framefmt *infmt,
-			 struct v4l2_fwnode_endpoint *upstream_ep)
+			 struct v4l2_mbus_config *mbus_cfg)
 {
 	u32 in_height;
 
@@ -1216,7 +1206,7 @@ static void csi_try_crop(struct csi_priv *priv,
 	 * sync, so fix it to NTSC/PAL active lines. NTSC contains
 	 * 2 extra lines of active video that need to be cropped.
 	 */
-	if (upstream_ep->bus_type == V4L2_MBUS_BT656 &&
+	if (mbus_cfg->type == V4L2_MBUS_BT656 &&
 	    (V4L2_FIELD_HAS_BOTH(infmt->field) ||
 	     infmt->field == V4L2_FIELD_ALTERNATE)) {
 		crop->height = in_height;
@@ -1233,7 +1223,7 @@ static int csi_enum_mbus_code(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_mbus_code_enum *code)
 {
 	struct csi_priv *priv = v4l2_get_subdevdata(sd);
-	struct v4l2_fwnode_endpoint upstream_ep = { .bus_type = 0 };
+	struct v4l2_mbus_config mbus_cfg = { .type = 0 };
 	const struct imx_media_pixfmt *incc;
 	struct v4l2_mbus_framefmt *infmt;
 	int ret = 0;
@@ -1250,13 +1240,14 @@ static int csi_enum_mbus_code(struct v4l2_subdev *sd,
 		break;
 	case CSI_SRC_PAD_DIRECT:
 	case CSI_SRC_PAD_IDMAC:
-		ret = csi_get_upstream_endpoint(priv, &upstream_ep);
+		ret = csi_get_upstream_mbus_config(priv, &mbus_cfg);
 		if (ret) {
-			v4l2_err(&priv->sd, "failed to find upstream endpoint\n");
+			v4l2_err(&priv->sd,
+				 "failed to get upstream media bus configuration\n");
 			goto out;
 		}
 
-		if (requires_passthrough(&upstream_ep, infmt, incc)) {
+		if (requires_passthrough(&mbus_cfg, infmt, incc)) {
 			if (code->index != 0) {
 				ret = -EINVAL;
 				goto out;
@@ -1426,7 +1417,7 @@ static void csi_try_field(struct csi_priv *priv,
 }
 
 static void csi_try_fmt(struct csi_priv *priv,
-			struct v4l2_fwnode_endpoint *upstream_ep,
+			struct v4l2_mbus_config *mbus_cfg,
 			struct v4l2_subdev_state *sd_state,
 			struct v4l2_subdev_format *sdformat,
 			struct v4l2_rect *crop,
@@ -1447,7 +1438,7 @@ static void csi_try_fmt(struct csi_priv *priv,
 		sdformat->format.width = compose->width;
 		sdformat->format.height = compose->height;
 
-		if (requires_passthrough(upstream_ep, infmt, incc)) {
+		if (requires_passthrough(mbus_cfg, infmt, incc)) {
 			sdformat->format.code = infmt->code;
 			*cc = incc;
 		} else {
@@ -1497,8 +1488,7 @@ static void csi_try_fmt(struct csi_priv *priv,
 		crop->height = sdformat->format.height;
 		if (sdformat->format.field == V4L2_FIELD_ALTERNATE)
 			crop->height *= 2;
-		csi_try_crop(priv, crop, sd_state, &sdformat->format,
-			     upstream_ep);
+		csi_try_crop(priv, crop, sd_state, &sdformat->format, mbus_cfg);
 		compose->left = 0;
 		compose->top = 0;
 		compose->width = crop->width;
@@ -1516,7 +1506,7 @@ static int csi_set_fmt(struct v4l2_subdev *sd,
 		       struct v4l2_subdev_format *sdformat)
 {
 	struct csi_priv *priv = v4l2_get_subdevdata(sd);
-	struct v4l2_fwnode_endpoint upstream_ep = { .bus_type = 0 };
+	struct v4l2_mbus_config mbus_cfg = { .type = 0 };
 	const struct imx_media_pixfmt *cc;
 	struct v4l2_mbus_framefmt *fmt;
 	struct v4l2_rect *crop, *compose;
@@ -1525,9 +1515,10 @@ static int csi_set_fmt(struct v4l2_subdev *sd,
 	if (sdformat->pad >= CSI_NUM_PADS)
 		return -EINVAL;
 
-	ret = csi_get_upstream_endpoint(priv, &upstream_ep);
+	ret = csi_get_upstream_mbus_config(priv, &mbus_cfg);
 	if (ret) {
-		v4l2_err(&priv->sd, "failed to find upstream endpoint\n");
+		v4l2_err(&priv->sd,
+			 "failed to get upstream media bus configuration\n");
 		return ret;
 	}
 
@@ -1541,8 +1532,7 @@ static int csi_set_fmt(struct v4l2_subdev *sd,
 	crop = __csi_get_crop(priv, sd_state, sdformat->which);
 	compose = __csi_get_compose(priv, sd_state, sdformat->which);
 
-	csi_try_fmt(priv, &upstream_ep, sd_state, sdformat, crop, compose,
-		    &cc);
+	csi_try_fmt(priv, &mbus_cfg, sd_state, sdformat, crop, compose, &cc);
 
 	fmt = __csi_get_fmt(priv, sd_state, sdformat->pad, sdformat->which);
 	*fmt = sdformat->format;
@@ -1559,8 +1549,8 @@ static int csi_set_fmt(struct v4l2_subdev *sd,
 			format.pad = pad;
 			format.which = sdformat->which;
 			format.format = sdformat->format;
-			csi_try_fmt(priv, &upstream_ep, sd_state, &format,
-				    NULL, compose, &outcc);
+			csi_try_fmt(priv, &mbus_cfg, sd_state, &format, NULL,
+				    compose, &outcc);
 
 			outfmt = __csi_get_fmt(priv, sd_state, pad,
 					       sdformat->which);
@@ -1648,7 +1638,7 @@ static int csi_set_selection(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_selection *sel)
 {
 	struct csi_priv *priv = v4l2_get_subdevdata(sd);
-	struct v4l2_fwnode_endpoint upstream_ep = { .bus_type = 0 };
+	struct v4l2_mbus_config mbus_cfg = { .type = 0 };
 	struct v4l2_mbus_framefmt *infmt;
 	struct v4l2_rect *crop, *compose;
 	int pad, ret;
@@ -1656,9 +1646,10 @@ static int csi_set_selection(struct v4l2_subdev *sd,
 	if (sel->pad != CSI_SINK_PAD)
 		return -EINVAL;
 
-	ret = csi_get_upstream_endpoint(priv, &upstream_ep);
+	ret = csi_get_upstream_mbus_config(priv, &mbus_cfg);
 	if (ret) {
-		v4l2_err(&priv->sd, "failed to find upstream endpoint\n");
+		v4l2_err(&priv->sd,
+			 "failed to get upstream media bus configuration\n");
 		return ret;
 	}
 
@@ -1687,7 +1678,7 @@ static int csi_set_selection(struct v4l2_subdev *sd,
 			goto out;
 		}
 
-		csi_try_crop(priv, &sel->r, sd_state, infmt, &upstream_ep);
+		csi_try_crop(priv, &sel->r, sd_state, infmt, &mbus_cfg);
 
 		*crop = sel->r;
 
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 294c808b2ebe..70dc89d6503b 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -813,39 +813,6 @@ imx_media_pipeline_video_device(struct media_entity *start_entity,
 }
 EXPORT_SYMBOL_GPL(imx_media_pipeline_video_device);
 
-/*
- * Find a fwnode endpoint that maps to the given subdevice's pad.
- * If there are multiple endpoints that map to the pad, only the
- * first endpoint encountered is returned.
- *
- * On success the refcount of the returned fwnode endpoint is
- * incremented.
- */
-struct fwnode_handle *imx_media_get_pad_fwnode(struct media_pad *pad)
-{
-	struct fwnode_handle *endpoint;
-	struct v4l2_subdev *sd;
-
-	if (!is_media_entity_v4l2_subdev(pad->entity))
-		return ERR_PTR(-ENODEV);
-
-	sd = media_entity_to_v4l2_subdev(pad->entity);
-
-	fwnode_graph_for_each_endpoint(dev_fwnode(sd->dev), endpoint) {
-		int pad_idx = media_entity_get_fwnode_pad(&sd->entity,
-							  endpoint,
-							  pad->flags);
-		if (pad_idx < 0)
-			continue;
-
-		if (pad_idx == pad->index)
-			return endpoint;
-	}
-
-	return ERR_PTR(-ENODEV);
-}
-EXPORT_SYMBOL_GPL(imx_media_get_pad_fwnode);
-
 /*
  * Turn current pipeline streaming on/off starting from entity.
  */
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index f263fc3adbb9..f679249d82e4 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -219,7 +219,6 @@ imx_media_pipeline_subdev(struct media_entity *start_entity, u32 grp_id,
 struct video_device *
 imx_media_pipeline_video_device(struct media_entity *start_entity,
 				enum v4l2_buf_type buftype, bool upstream);
-struct fwnode_handle *imx_media_get_pad_fwnode(struct media_pad *pad);
 
 struct imx_media_dma_buf {
 	void          *virt;

base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
-- 
2.30.2

