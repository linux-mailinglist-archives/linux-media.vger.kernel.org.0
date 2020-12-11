Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 568F72D7A3D
	for <lists+linux-media@lfdr.de>; Fri, 11 Dec 2020 17:00:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405278AbgLKP6f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Dec 2020 10:58:35 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:54985 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393840AbgLKP6V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Dec 2020 10:58:21 -0500
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 1F9906000E;
        Fri, 11 Dec 2020 15:57:36 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-sunxi@googlegroups.com
Cc:     Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        kevin.lhopital@hotmail.com
Subject: [PATCH v3 07/15] media: sun6i-csi: Add support for MIPI CSI-2 bridge input
Date:   Fri, 11 Dec 2020 16:57:00 +0100
Message-Id: <20201211155708.154710-8-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211155708.154710-1-paul.kocialkowski@bootlin.com>
References: <20201211155708.154710-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The A31 CSI controller supports a MIPI CSI-2 bridge input, which has
its own dedicated port in the fwnode graph.

Support for this input is added with this change:
- two pads are defined for the media entity instead of one
  and only one needs to be connected at a time;
- the pads currently match the fwnode graph representation;
- links are created between our pads and the subdevs for each
  interface and are no longer immutable so that userspace can select
  which interface to use in case both are bound to a subdev;
- fwnode endpoints are parsed and stored for each interface;
- the active subdev (and fwnode endpoint) is retrieved when validating
  the media link at stream on time and cleared at stream off;
- an error is raised if both links are active at the same time;
- the MIPI interface bit is set if the MIPI CSI-2 bridge endpoint is
  active.

In the future, the media entity representation might evolve to:
- distinguish the internal parallel bridge and data formatter;
- represent each of the 4 internal channels that can exist between
  the parallel bridge (for BT656 time-multiplex) and MIPI CSI-2
  (internal channels can be mapped to virtual channels);
- connect the controller's output to the ISP instead of its
  DMA engine.

Finally note that the MIPI CSI-2 bridges should not be linked in
the fwnode graph unless they have a sensor subdev attached.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      | 123 ++++++++++++++----
 .../platform/sunxi/sun6i-csi/sun6i_csi.h      |   3 -
 .../platform/sunxi/sun6i-csi/sun6i_video.c    |  53 ++++----
 .../platform/sunxi/sun6i-csi/sun6i_video.h    |   7 +-
 4 files changed, 135 insertions(+), 51 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index f1150de94e98..481181038e1e 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -52,15 +52,16 @@ bool sun6i_csi_is_format_supported(struct sun6i_csi *csi,
 				   u32 pixformat, u32 mbus_code)
 {
 	struct sun6i_csi_dev *sdev = sun6i_csi_to_dev(csi);
+	struct v4l2_fwnode_endpoint *endpoint = sdev->csi.video.source_endpoint;
 
 	/*
 	 * Some video receivers have the ability to be compatible with
 	 * 8bit and 16bit bus width.
 	 * Identify the media bus format from device tree.
 	 */
-	if ((sdev->csi.v4l2_ep.bus_type == V4L2_MBUS_PARALLEL
-	     || sdev->csi.v4l2_ep.bus_type == V4L2_MBUS_BT656)
-	     && sdev->csi.v4l2_ep.bus.parallel.bus_width == 16) {
+	if ((endpoint->bus_type == V4L2_MBUS_PARALLEL
+	     || endpoint->bus_type == V4L2_MBUS_BT656)
+	     && endpoint->bus.parallel.bus_width == 16) {
 		switch (pixformat) {
 		case V4L2_PIX_FMT_HM12:
 		case V4L2_PIX_FMT_NV12:
@@ -373,7 +374,7 @@ static enum csi_input_seq get_csi_input_seq(struct sun6i_csi_dev *sdev,
 
 static void sun6i_csi_setup_bus(struct sun6i_csi_dev *sdev)
 {
-	struct v4l2_fwnode_endpoint *endpoint = &sdev->csi.v4l2_ep;
+	struct v4l2_fwnode_endpoint *endpoint = sdev->csi.video.source_endpoint;
 	struct sun6i_csi *csi = &sdev->csi;
 	unsigned char bus_width;
 	u32 flags;
@@ -459,6 +460,9 @@ static void sun6i_csi_setup_bus(struct sun6i_csi_dev *sdev)
 		if (flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
 			cfg |= CSI_IF_CFG_CLK_POL_FALLING_EDGE;
 		break;
+	case V4L2_MBUS_CSI2_DPHY:
+		cfg |= CSI_IF_CFG_MIPI_IF_MIPI;
+		break;
 	default:
 		dev_warn(sdev->dev, "Unsupported bus type: %d\n",
 			 endpoint->bus_type);
@@ -636,11 +640,11 @@ void sun6i_csi_set_stream(struct sun6i_csi *csi, bool enable)
  * Media Controller and V4L2
  */
 static int sun6i_csi_link_entity(struct sun6i_csi *csi,
+				 struct media_pad *sink_pad,
 				 struct media_entity *entity,
-				 struct fwnode_handle *fwnode)
+				 struct fwnode_handle *fwnode, bool enabled)
 {
 	struct media_entity *sink;
-	struct media_pad *sink_pad;
 	int src_pad_index;
 	int ret;
 
@@ -654,14 +658,12 @@ static int sun6i_csi_link_entity(struct sun6i_csi *csi,
 	src_pad_index = ret;
 
 	sink = &csi->video.vdev.entity;
-	sink_pad = &csi->video.pad;
 
 	dev_dbg(csi->dev, "creating %s:%u -> %s:%u link\n",
 		entity->name, src_pad_index, sink->name, sink_pad->index);
 	ret = media_create_pad_link(entity, src_pad_index, sink,
 				    sink_pad->index,
-				    MEDIA_LNK_FL_ENABLED |
-				    MEDIA_LNK_FL_IMMUTABLE);
+				    enabled ? MEDIA_LNK_FL_ENABLED : 0);
 	if (ret < 0) {
 		dev_err(csi->dev, "failed to create %s:%u -> %s:%u link\n",
 			entity->name, src_pad_index,
@@ -676,19 +678,67 @@ static int sun6i_subdev_notify_complete(struct v4l2_async_notifier *notifier)
 {
 	struct sun6i_csi *csi = container_of(notifier, struct sun6i_csi,
 					     notifier);
+	struct sun6i_video *video = &csi->video;
 	struct v4l2_device *v4l2_dev = &csi->v4l2_dev;
-	struct v4l2_subdev *sd;
+	struct v4l2_subdev *parallel_sd = NULL;
+	struct v4l2_subdev *mipi_csi2_bridge_sd = NULL;
+	struct fwnode_handle *handle = NULL;
 	int ret;
 
 	dev_dbg(csi->dev, "notify complete, all subdevs registered\n");
 
-	sd = list_first_entry(&v4l2_dev->subdevs, struct v4l2_subdev, list);
-	if (!sd)
-		return -EINVAL;
+	/* Find the subdevs that match our fwnode ports. */
+	while (1) {
+		struct v4l2_fwnode_link link;
+		struct v4l2_subdev *sd;
 
-	ret = sun6i_csi_link_entity(csi, &sd->entity, sd->fwnode);
-	if (ret < 0)
-		return ret;
+		handle = fwnode_graph_get_next_endpoint(dev_fwnode(csi->dev),
+							handle);
+		if (!handle)
+			break;
+
+		ret = v4l2_fwnode_parse_link(handle, &link);
+		if (ret)
+			break;
+
+		list_for_each_entry(sd, &v4l2_dev->subdevs, list) {
+			if (!sd->fwnode || link.remote_node != sd->fwnode)
+				continue;
+
+			switch (link.local_port) {
+			case 0:
+				parallel_sd = sd;
+				break;
+			case 1:
+				mipi_csi2_bridge_sd = sd;
+				break;
+			}
+		}
+
+		v4l2_fwnode_put_link(&link);
+	}
+
+	if (parallel_sd) {
+		dev_dbg(csi->dev, "linking parallel interface subdev\n");
+
+		ret = sun6i_csi_link_entity(csi, &video->pads[0],
+					    &parallel_sd->entity,
+					    parallel_sd->fwnode, true);
+		if (ret < 0)
+			return ret;
+	}
+
+	if (mipi_csi2_bridge_sd) {
+		dev_dbg(csi->dev, "linking MIPI CSI-2 bridge subdev\n");
+
+		/* Mark the link as disabled if a parallel subdev is there. */
+		ret = sun6i_csi_link_entity(csi, &video->pads[1],
+					    &mipi_csi2_bridge_sd->entity,
+					    mipi_csi2_bridge_sd->fwnode,
+					    parallel_sd ? false : true);
+		if (ret < 0)
+			return ret;
+	}
 
 	ret = v4l2_device_register_subdev_nodes(&csi->v4l2_dev);
 	if (ret < 0)
@@ -706,21 +756,44 @@ static int sun6i_csi_fwnode_parse(struct device *dev,
 				  struct v4l2_async_subdev *asd)
 {
 	struct sun6i_csi *csi = dev_get_drvdata(dev);
+	struct sun6i_video *video = &csi->video;
+	struct v4l2_fwnode_endpoint *endpoint = NULL;
+
+	switch (vep->base.port) {
+	case 0:
+		endpoint = &video->parallel_endpoint;
 
-	if (vep->base.port || vep->base.id) {
-		dev_warn(dev, "Only support a single port with one endpoint\n");
+		switch (vep->bus_type) {
+		case V4L2_MBUS_PARALLEL:
+		case V4L2_MBUS_BT656:
+			break;
+		default:
+			dev_err(dev, "Unsupported media bus type\n");
+			return -ENOTCONN;
+		}
+		break;
+	case 1:
+		endpoint = &video->mipi_csi2_bridge_endpoint;
+		break;
+	default:
+		dev_warn(dev, "Unsupported port at index %u\n", vep->base.port);
 		return -ENOTCONN;
 	}
 
-	switch (vep->bus_type) {
-	case V4L2_MBUS_PARALLEL:
-	case V4L2_MBUS_BT656:
-		csi->v4l2_ep = *vep;
-		return 0;
-	default:
-		dev_err(dev, "Unsupported media bus type\n");
+	if (vep->base.id) {
+		dev_warn(dev, "Unsupported endpoint at index %u for port %u\n",
+			 vep->base.id, vep->base.port);
 		return -ENOTCONN;
 	}
+
+	*endpoint = *vep;
+
+	if (vep->base.port == 1) {
+		/* Set this for our local convenience. */
+		endpoint->bus_type = V4L2_MBUS_CSI2_DPHY;
+	}
+
+	return 0;
 }
 
 static void sun6i_csi_v4l2_cleanup(struct sun6i_csi *csi)
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
index 092445f04c60..d7b15452ab3a 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
@@ -40,9 +40,6 @@ struct sun6i_csi {
 
 	struct v4l2_async_notifier	notifier;
 
-	/* video port settings */
-	struct v4l2_fwnode_endpoint	v4l2_ep;
-
 	struct sun6i_csi_config		config;
 
 	struct sun6i_video		video;
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
index b55de9ab64d8..5bb7c013f6bb 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
@@ -72,22 +72,6 @@ static bool is_pixformat_valid(unsigned int pixformat)
 	return false;
 }
 
-static struct v4l2_subdev *
-sun6i_video_remote_subdev(struct sun6i_video *video, u32 *pad)
-{
-	struct media_pad *remote;
-
-	remote = media_entity_remote_pad(&video->pad);
-
-	if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
-		return NULL;
-
-	if (pad)
-		*pad = remote->index;
-
-	return media_entity_to_v4l2_subdev(remote->entity);
-}
-
 static int sun6i_video_queue_setup(struct vb2_queue *vq,
 				   unsigned int *nbuffers,
 				   unsigned int *nplanes,
@@ -150,7 +134,7 @@ static int sun6i_video_start_streaming(struct vb2_queue *vq, unsigned int count)
 		goto stop_media_pipeline;
 	}
 
-	subdev = sun6i_video_remote_subdev(video, NULL);
+	subdev = video->source_subdev;
 	if (!subdev)
 		goto stop_media_pipeline;
 
@@ -206,6 +190,7 @@ static int sun6i_video_start_streaming(struct vb2_queue *vq, unsigned int count)
 	sun6i_csi_set_stream(video->csi, false);
 stop_media_pipeline:
 	media_pipeline_stop(&video->vdev.entity);
+	video->source_subdev = NULL;
 clear_dma_queue:
 	spin_lock_irqsave(&video->dma_queue_lock, flags);
 	list_for_each_entry(buf, &video->dma_queue, list)
@@ -223,13 +208,16 @@ static void sun6i_video_stop_streaming(struct vb2_queue *vq)
 	unsigned long flags;
 	struct sun6i_csi_buffer *buf;
 
-	subdev = sun6i_video_remote_subdev(video, NULL);
+	subdev = video->source_subdev;
 	if (subdev)
 		v4l2_subdev_call(subdev, video, s_stream, 0);
 
 	sun6i_csi_set_stream(video->csi, false);
 
-	media_pipeline_stop(&video->vdev.entity);
+	if (subdev)
+		media_pipeline_stop(&video->vdev.entity);
+
+	video->source_subdev = NULL;
 
 	/* Release all active buffers */
 	spin_lock_irqsave(&video->dma_queue_lock, flags);
@@ -550,16 +538,36 @@ static int sun6i_video_link_validate(struct media_link *link)
 						 struct video_device, entity);
 	struct sun6i_video *video = video_get_drvdata(vdev);
 	struct v4l2_subdev_format source_fmt;
+	struct v4l2_subdev *subdev;
 	int ret;
 
 	video->mbus_code = 0;
 
-	if (!media_entity_remote_pad(link->sink->entity->pads)) {
+	if (!link->source) {
 		dev_info(video->csi->dev,
 			 "video node %s pad not connected\n", vdev->name);
 		return -ENOLINK;
 	}
 
+	if (!is_media_entity_v4l2_subdev(link->source->entity))
+		return -ENODEV;
+
+	subdev = media_entity_to_v4l2_subdev(link->source->entity);
+
+	if (video->source_subdev) {
+		dev_err(video->csi->dev,
+			"unable to connect both parallel and MIPI CSI-2 bridge interfaces\n");
+		return -ENOLINK;
+	}
+
+	if (link->sink == &video->pads[0]) {
+		video->source_endpoint = &video->parallel_endpoint;
+		video->source_subdev = subdev;
+	} else if (link->sink == &video->pads[1]) {
+		video->source_endpoint = &video->mipi_csi2_bridge_endpoint;
+		video->source_subdev = subdev;
+	}
+
 	ret = sun6i_video_link_validate_get_format(link->source, &source_fmt);
 	if (ret < 0)
 		return ret;
@@ -603,9 +611,10 @@ int sun6i_video_init(struct sun6i_video *video, struct sun6i_csi *csi,
 	video->csi = csi;
 
 	/* Initialize the media entity... */
-	video->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
+	video->pads[0].flags = MEDIA_PAD_FL_SINK;
+	video->pads[1].flags = MEDIA_PAD_FL_SINK;
 	vdev->entity.ops = &sun6i_video_media_ops;
-	ret = media_entity_pads_init(&vdev->entity, 1, &video->pad);
+	ret = media_entity_pads_init(&vdev->entity, 2, video->pads);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.h
index b9cd919c24ac..30d56d98d5e9 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.h
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.h
@@ -15,11 +15,16 @@ struct sun6i_csi;
 
 struct sun6i_video {
 	struct video_device		vdev;
-	struct media_pad		pad;
+	struct media_pad		pads[2];
 	struct sun6i_csi		*csi;
 
 	struct mutex			lock;
 
+	struct v4l2_fwnode_endpoint	parallel_endpoint;
+	struct v4l2_fwnode_endpoint	mipi_csi2_bridge_endpoint;
+	struct v4l2_fwnode_endpoint	*source_endpoint;
+	struct v4l2_subdev		*source_subdev;
+
 	struct vb2_queue		vb2_vidq;
 	spinlock_t			dma_queue_lock;
 	struct list_head		dma_queue;
-- 
2.29.2

