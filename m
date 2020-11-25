Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 930CA2C4597
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 17:45:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732108AbgKYQpb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 11:45:31 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:1429 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732104AbgKYQpa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 11:45:30 -0500
X-Halon-ID: 9dfd1678-2f3d-11eb-a78a-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p4fca2458.dip0.t-ipconnect.de [79.202.36.88])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 9dfd1678-2f3d-11eb-a78a-0050569116f7;
        Wed, 25 Nov 2020 17:45:26 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/5] rcar-vin: Only dynamically allocate v4l2_async_subdev
Date:   Wed, 25 Nov 2020 17:44:46 +0100
Message-Id: <20201125164450.2056963-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201125164450.2056963-1-niklas.soderlund+renesas@ragnatech.se>
References: <20201125164450.2056963-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In preparation of removing the usage of the old helper
v4l2_async_notifier_parse_fwnode_endpoints_by_port() do not dynamically
allocate the whole structure containing the parameters for the parallel
interface, instead only allocate the v4l2_async_subdev structure. There
is no functional change.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 45 ++++++++++-----------
 drivers/media/platform/rcar-vin/rcar-dma.c  | 16 ++++----
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 12 +++---
 drivers/media/platform/rcar-vin/rcar-vin.h  |  6 +--
 4 files changed, 39 insertions(+), 40 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 518813456194e8b3..07f250bfc0051135 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -185,8 +185,8 @@ static int rvin_group_link_notify(struct media_link *link, u32 flags,
 		 */
 		sd = media_entity_to_v4l2_subdev(link->source->entity);
 		for (i = 0; i < RCAR_VIN_NUM; i++) {
-			if (group->vin[i] && group->vin[i]->parallel &&
-			    group->vin[i]->parallel->subdev == sd) {
+			if (group->vin[i] &&
+			    group->vin[i]->parallel.subdev == sd) {
 				group->vin[i]->is_csi = false;
 				ret = 0;
 				goto out;
@@ -440,20 +440,20 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
 	ret = rvin_find_pad(subdev, MEDIA_PAD_FL_SOURCE);
 	if (ret < 0)
 		return ret;
-	vin->parallel->source_pad = ret;
+	vin->parallel.source_pad = ret;
 
 	ret = rvin_find_pad(subdev, MEDIA_PAD_FL_SINK);
-	vin->parallel->sink_pad = ret < 0 ? 0 : ret;
+	vin->parallel.sink_pad = ret < 0 ? 0 : ret;
 
 	if (vin->info->use_mc) {
-		vin->parallel->subdev = subdev;
+		vin->parallel.subdev = subdev;
 		return 0;
 	}
 
 	/* Find compatible subdevices mbus format */
 	vin->mbus_code = 0;
 	code.index = 0;
-	code.pad = vin->parallel->source_pad;
+	code.pad = vin->parallel.source_pad;
 	while (!vin->mbus_code &&
 	       !v4l2_subdev_call(subdev, pad, enum_mbus_code, NULL, &code)) {
 		code.index++;
@@ -512,7 +512,7 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
 
 	vin->vdev.ctrl_handler = &vin->ctrl_handler;
 
-	vin->parallel->subdev = subdev;
+	vin->parallel.subdev = subdev;
 
 	return 0;
 }
@@ -520,7 +520,7 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
 static void rvin_parallel_subdevice_detach(struct rvin_dev *vin)
 {
 	rvin_v4l2_unregister(vin);
-	vin->parallel->subdev = NULL;
+	vin->parallel.subdev = NULL;
 
 	if (!vin->info->use_mc) {
 		v4l2_ctrl_handler_free(&vin->ctrl_handler);
@@ -551,11 +551,11 @@ static int rvin_parallel_notify_complete(struct v4l2_async_notifier *notifier)
 		return 0;
 
 	/* If we're running with media-controller, link the subdevs. */
-	source = &vin->parallel->subdev->entity;
+	source = &vin->parallel.subdev->entity;
 	sink = &vin->vdev.entity;
 
-	ret = media_create_pad_link(source, vin->parallel->source_pad,
-				    sink, vin->parallel->sink_pad, 0);
+	ret = media_create_pad_link(source, vin->parallel.source_pad,
+				    sink, vin->parallel.sink_pad, 0);
 	if (ret)
 		vin_err(vin, "Error adding link from %s to %s: %d\n",
 			source->name, sink->name, ret);
@@ -592,8 +592,8 @@ static int rvin_parallel_notify_bound(struct v4l2_async_notifier *notifier,
 	v4l2_set_subdev_hostdata(subdev, vin);
 
 	vin_dbg(vin, "bound subdev %s source pad: %u sink pad: %u\n",
-		subdev->name, vin->parallel->source_pad,
-		vin->parallel->sink_pad);
+		subdev->name, vin->parallel.source_pad,
+		vin->parallel.sink_pad);
 
 	return 0;
 }
@@ -609,28 +609,27 @@ static int rvin_parallel_parse_v4l2(struct device *dev,
 				    struct v4l2_async_subdev *asd)
 {
 	struct rvin_dev *vin = dev_get_drvdata(dev);
-	struct rvin_parallel_entity *rvpe =
-		container_of(asd, struct rvin_parallel_entity, asd);
 
 	if (vep->base.port || vep->base.id)
 		return -ENOTCONN;
 
-	vin->parallel = rvpe;
-	vin->parallel->mbus_type = vep->bus_type;
+	vin->parallel.mbus_type = vep->bus_type;
 
-	switch (vin->parallel->mbus_type) {
+	switch (vin->parallel.mbus_type) {
 	case V4L2_MBUS_PARALLEL:
 	case V4L2_MBUS_BT656:
 		vin_dbg(vin, "Found %s media bus\n",
-			vin->parallel->mbus_type == V4L2_MBUS_PARALLEL ?
+			vin->parallel.mbus_type == V4L2_MBUS_PARALLEL ?
 			"PARALLEL" : "BT656");
-		vin->parallel->bus = vep->bus.parallel;
+		vin->parallel.bus = vep->bus.parallel;
 		break;
 	default:
 		vin_err(vin, "Unknown media bus type\n");
 		return -EINVAL;
 	}
 
+	vin->parallel.asd = asd;
+
 	return 0;
 }
 
@@ -641,17 +640,17 @@ static int rvin_parallel_init(struct rvin_dev *vin)
 	v4l2_async_notifier_init(&vin->notifier);
 
 	ret = v4l2_async_notifier_parse_fwnode_endpoints_by_port(
-		vin->dev, &vin->notifier, sizeof(struct rvin_parallel_entity),
+		vin->dev, &vin->notifier, sizeof(*vin->parallel.asd),
 		0, rvin_parallel_parse_v4l2);
 	if (ret)
 		return ret;
 
 	/* If using mc, it's fine not to have any input registered. */
-	if (!vin->parallel)
+	if (!vin->parallel.asd)
 		return vin->info->use_mc ? 0 : -ENODEV;
 
 	vin_dbg(vin, "Found parallel subdevice %pOF\n",
-		to_of_node(vin->parallel->asd.match.fwnode));
+		to_of_node(vin->parallel.asd->match.fwnode));
 
 	vin->notifier.ops = &rvin_parallel_notify_ops;
 	ret = v4l2_async_notifier_register(&vin->v4l2_dev, &vin->notifier);
diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 5a5f0e5007478c8d..95b7828ee35231c6 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -672,7 +672,7 @@ static int rvin_setup(struct rvin_dev *vin)
 	case MEDIA_BUS_FMT_UYVY8_2X8:
 		/* BT.656 8bit YCbCr422 or BT.601 8bit YCbCr422 */
 		if (!vin->is_csi &&
-		    vin->parallel->mbus_type == V4L2_MBUS_BT656)
+		    vin->parallel.mbus_type == V4L2_MBUS_BT656)
 			vnmc |= VNMC_INF_YUV8_BT656;
 		else
 			vnmc |= VNMC_INF_YUV8_BT601;
@@ -685,7 +685,7 @@ static int rvin_setup(struct rvin_dev *vin)
 	case MEDIA_BUS_FMT_UYVY10_2X10:
 		/* BT.656 10bit YCbCr422 or BT.601 10bit YCbCr422 */
 		if (!vin->is_csi &&
-		    vin->parallel->mbus_type == V4L2_MBUS_BT656)
+		    vin->parallel.mbus_type == V4L2_MBUS_BT656)
 			vnmc |= VNMC_INF_YUV10_BT656;
 		else
 			vnmc |= VNMC_INF_YUV10_BT601;
@@ -710,21 +710,21 @@ static int rvin_setup(struct rvin_dev *vin)
 
 	if (!vin->is_csi) {
 		/* Hsync Signal Polarity Select */
-		if (!(vin->parallel->bus.flags & V4L2_MBUS_HSYNC_ACTIVE_LOW))
+		if (!(vin->parallel.bus.flags & V4L2_MBUS_HSYNC_ACTIVE_LOW))
 			dmr2 |= VNDMR2_HPS;
 
 		/* Vsync Signal Polarity Select */
-		if (!(vin->parallel->bus.flags & V4L2_MBUS_VSYNC_ACTIVE_LOW))
+		if (!(vin->parallel.bus.flags & V4L2_MBUS_VSYNC_ACTIVE_LOW))
 			dmr2 |= VNDMR2_VPS;
 
 		/* Data Enable Polarity Select */
-		if (vin->parallel->bus.flags & V4L2_MBUS_DATA_ENABLE_LOW)
+		if (vin->parallel.bus.flags & V4L2_MBUS_DATA_ENABLE_LOW)
 			dmr2 |= VNDMR2_CES;
 
 		switch (vin->mbus_code) {
 		case MEDIA_BUS_FMT_UYVY8_2X8:
-			if (vin->parallel->bus.bus_width == 8 &&
-			    vin->parallel->bus.data_shift == 8)
+			if (vin->parallel.bus.bus_width == 8 &&
+			    vin->parallel.bus.data_shift == 8)
 				dmr2 |= VNDMR2_YDS;
 			break;
 		default:
@@ -1203,7 +1203,7 @@ static int rvin_set_stream(struct rvin_dev *vin, int on)
 
 	/* No media controller used, simply pass operation to subdevice. */
 	if (!vin->info->use_mc) {
-		ret = v4l2_subdev_call(vin->parallel->subdev, video, s_stream,
+		ret = v4l2_subdev_call(vin->parallel.subdev, video, s_stream,
 				       on);
 
 		return ret == -ENOIOCTLCMD ? 0 : ret;
diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 3e7a3ae2a6b97045..e6ea2b7991b8dcb3 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -205,7 +205,7 @@ static int rvin_reset_format(struct rvin_dev *vin)
 {
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-		.pad = vin->parallel->source_pad,
+		.pad = vin->parallel.source_pad,
 	};
 	int ret;
 
@@ -246,7 +246,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 	struct v4l2_subdev_pad_config *pad_cfg;
 	struct v4l2_subdev_format format = {
 		.which = which,
-		.pad = vin->parallel->source_pad,
+		.pad = vin->parallel.source_pad,
 	};
 	enum v4l2_field field;
 	u32 width, height;
@@ -632,7 +632,7 @@ static int rvin_enum_dv_timings(struct file *file, void *priv_fh,
 	if (timings->pad)
 		return -EINVAL;
 
-	timings->pad = vin->parallel->sink_pad;
+	timings->pad = vin->parallel.sink_pad;
 
 	ret = v4l2_subdev_call(sd, pad, enum_dv_timings, timings);
 
@@ -684,7 +684,7 @@ static int rvin_dv_timings_cap(struct file *file, void *priv_fh,
 	if (cap->pad)
 		return -EINVAL;
 
-	cap->pad = vin->parallel->sink_pad;
+	cap->pad = vin->parallel.sink_pad;
 
 	ret = v4l2_subdev_call(sd, pad, dv_timings_cap, cap);
 
@@ -702,7 +702,7 @@ static int rvin_g_edid(struct file *file, void *fh, struct v4l2_edid *edid)
 	if (edid->pad)
 		return -EINVAL;
 
-	edid->pad = vin->parallel->sink_pad;
+	edid->pad = vin->parallel.sink_pad;
 
 	ret = v4l2_subdev_call(sd, pad, get_edid, edid);
 
@@ -720,7 +720,7 @@ static int rvin_s_edid(struct file *file, void *fh, struct v4l2_edid *edid)
 	if (edid->pad)
 		return -EINVAL;
 
-	edid->pad = vin->parallel->sink_pad;
+	edid->pad = vin->parallel.sink_pad;
 
 	ret = v4l2_subdev_call(sd, pad, set_edid, edid);
 
diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
index 4539bd53d9d41e9c..34e3979acf931b67 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -101,7 +101,7 @@ struct rvin_video_format {
  *
  */
 struct rvin_parallel_entity {
-	struct v4l2_async_subdev asd;
+	struct v4l2_async_subdev *asd;
 	struct v4l2_subdev *subdev;
 
 	enum v4l2_mbus_type mbus_type;
@@ -213,7 +213,7 @@ struct rvin_dev {
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct v4l2_async_notifier notifier;
 
-	struct rvin_parallel_entity *parallel;
+	struct rvin_parallel_entity parallel;
 
 	struct rvin_group *group;
 	unsigned int id;
@@ -248,7 +248,7 @@ struct rvin_dev {
 	unsigned int alpha;
 };
 
-#define vin_to_source(vin)		((vin)->parallel->subdev)
+#define vin_to_source(vin)		((vin)->parallel.subdev)
 
 /* Debug */
 #define vin_dbg(d, fmt, arg...)		dev_dbg(d->dev, fmt, ##arg)
-- 
2.29.2

