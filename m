Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A85D30CBA2
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 20:32:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239695AbhBBTbT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 14:31:19 -0500
Received: from retiisi.eu ([95.216.213.190]:45360 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233483AbhBBN6D (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 08:58:03 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 75400634C96;
        Tue,  2 Feb 2021 15:56:08 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Yong Zhi <yong.zhi@intel.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Maxime Ripard <mripard@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v5 01/13] media: v4l2-async: Clean v4l2_async_notifier_add_fwnode_remote_subdev
Date:   Tue,  2 Feb 2021 15:55:59 +0200
Message-Id: <20210202135611.13920-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202135611.13920-1-sakari.ailus@linux.intel.com>
References: <20210202135611.13920-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ezequiel Garcia <ezequiel@collabora.com>

Change v4l2_async_notifier_add_fwnode_remote_subdev semantics
so it allocates the struct v4l2_async_subdev pointer.

This makes the API consistent: the v4l2-async subdevice addition
functions have now a unified usage model. This model is simpler,
as it makes v4l2-async responsible for the allocation and release
of the subdevice descriptor, and no longer something the driver
has to worry about.

On the user side, the change makes the API simpler for the drivers
to use and less error-prone.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 17 ++--
 drivers/media/platform/omap3isp/isp.c         | 79 ++++++++-----------
 .../platform/rockchip/rkisp1/rkisp1-dev.c     | 15 ++--
 .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  9 ++-
 .../platform/sunxi/sun4i-csi/sun4i_csi.h      |  1 -
 drivers/media/platform/video-mux.c            | 14 +---
 drivers/media/v4l2-core/v4l2-async.c          | 24 +++---
 drivers/staging/media/imx/imx-media-csi.c     | 14 +---
 drivers/staging/media/imx/imx6-mipi-csi2.c    | 19 ++---
 drivers/staging/media/imx/imx7-media-csi.c    | 16 ++--
 drivers/staging/media/imx/imx7-mipi-csis.c    | 15 ++--
 include/media/v4l2-async.h                    | 15 ++--
 12 files changed, 96 insertions(+), 142 deletions(-)

diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
index 3515df50f3e7..8fd311fee4e7 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
@@ -1464,7 +1464,8 @@ static int cio2_parse_firmware(struct cio2_device *cio2)
 		struct v4l2_fwnode_endpoint vep = {
 			.bus_type = V4L2_MBUS_CSI2_DPHY
 		};
-		struct sensor_async_subdev *s_asd = NULL;
+		struct sensor_async_subdev *s_asd;
+		struct v4l2_async_subdev *asd;
 		struct fwnode_handle *ep;
 
 		ep = fwnode_graph_get_endpoint_by_id(
@@ -1478,27 +1479,23 @@ static int cio2_parse_firmware(struct cio2_device *cio2)
 		if (ret)
 			goto err_parse;
 
-		s_asd = kzalloc(sizeof(*s_asd), GFP_KERNEL);
-		if (!s_asd) {
-			ret = -ENOMEM;
+		asd = v4l2_async_notifier_add_fwnode_remote_subdev(
+				&cio2->notifier, ep, sizeof(*s_asd));
+		if (IS_ERR(asd)) {
+			ret = PTR_ERR(asd);
 			goto err_parse;
 		}
 
+		s_asd = container_of(asd, struct sensor_async_subdev, asd);
 		s_asd->csi2.port = vep.base.port;
 		s_asd->csi2.lanes = vep.bus.mipi_csi2.num_data_lanes;
 
-		ret = v4l2_async_notifier_add_fwnode_remote_subdev(
-			&cio2->notifier, ep, &s_asd->asd);
-		if (ret)
-			goto err_parse;
-
 		fwnode_handle_put(ep);
 
 		continue;
 
 err_parse:
 		fwnode_handle_put(ep);
-		kfree(s_asd);
 		return ret;
 	}
 
diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
index b1fc4518e275..1311b4996ece 100644
--- a/drivers/media/platform/omap3isp/isp.c
+++ b/drivers/media/platform/omap3isp/isp.c
@@ -2126,21 +2126,6 @@ static void isp_parse_of_csi1_endpoint(struct device *dev,
 	buscfg->bus.ccp2.crc = 1;
 }
 
-static int isp_alloc_isd(struct isp_async_subdev **isd,
-			 struct isp_bus_cfg **buscfg)
-{
-	struct isp_async_subdev *__isd;
-
-	__isd = kzalloc(sizeof(*__isd), GFP_KERNEL);
-	if (!__isd)
-		return -ENOMEM;
-
-	*isd = __isd;
-	*buscfg = &__isd->bus;
-
-	return 0;
-}
-
 static struct {
 	u32 phy;
 	u32 csi2_if;
@@ -2156,7 +2141,7 @@ static int isp_parse_of_endpoints(struct isp_device *isp)
 {
 	struct fwnode_handle *ep;
 	struct isp_async_subdev *isd = NULL;
-	struct isp_bus_cfg *buscfg;
+	struct v4l2_async_subdev *asd;
 	unsigned int i;
 
 	ep = fwnode_graph_get_endpoint_by_id(
@@ -2174,20 +2159,15 @@ static int isp_parse_of_endpoints(struct isp_device *isp)
 		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 
 		if (!ret) {
-			ret = isp_alloc_isd(&isd, &buscfg);
-			if (ret)
-				return ret;
-		}
-
-		if (!ret) {
-			isp_parse_of_parallel_endpoint(isp->dev, &vep, buscfg);
-			ret = v4l2_async_notifier_add_fwnode_remote_subdev(
-				&isp->notifier, ep, &isd->asd);
+			asd = v4l2_async_notifier_add_fwnode_remote_subdev(
+				&isp->notifier, ep, sizeof(*isd));
+			if (!IS_ERR(asd)) {
+				isd = container_of(asd, struct isp_async_subdev, asd);
+				isp_parse_of_parallel_endpoint(isp->dev, &vep, &isd->bus);
+			}
 		}
 
 		fwnode_handle_put(ep);
-		if (ret)
-			kfree(isd);
 	}
 
 	for (i = 0; i < ARRAY_SIZE(isp_bus_interfaces); i++) {
@@ -2206,15 +2186,8 @@ static int isp_parse_of_endpoints(struct isp_device *isp)
 		dev_dbg(isp->dev, "parsing serial interface %u, node %pOF\n", i,
 			to_of_node(ep));
 
-		ret = isp_alloc_isd(&isd, &buscfg);
-		if (ret)
-			return ret;
-
 		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
-		if (!ret) {
-			buscfg->interface = isp_bus_interfaces[i].csi2_if;
-			isp_parse_of_csi2_endpoint(isp->dev, &vep, buscfg);
-		} else if (ret == -ENXIO) {
+		if (ret == -ENXIO) {
 			vep = (struct v4l2_fwnode_endpoint)
 				{ .bus_type = V4L2_MBUS_CSI1 };
 			ret = v4l2_fwnode_endpoint_parse(ep, &vep);
@@ -2224,21 +2197,35 @@ static int isp_parse_of_endpoints(struct isp_device *isp)
 					{ .bus_type = V4L2_MBUS_CCP2 };
 				ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 			}
-			if (!ret) {
-				buscfg->interface =
-					isp_bus_interfaces[i].csi1_if;
-				isp_parse_of_csi1_endpoint(isp->dev, &vep,
-							   buscfg);
-			}
 		}
 
-		if (!ret)
-			ret = v4l2_async_notifier_add_fwnode_remote_subdev(
-				&isp->notifier, ep, &isd->asd);
+		if (!ret) {
+			asd = v4l2_async_notifier_add_fwnode_remote_subdev(
+				&isp->notifier, ep, sizeof(*isd));
+
+			if (!IS_ERR(asd)) {
+				isd = container_of(asd, struct isp_async_subdev, asd);
+
+				switch (vep.bus_type) {
+				case V4L2_MBUS_CSI2_DPHY:
+					isd->bus.interface =
+						isp_bus_interfaces[i].csi2_if;
+					isp_parse_of_csi2_endpoint(isp->dev, &vep, &isd->bus);
+					break;
+				case V4L2_MBUS_CSI1:
+				case V4L2_MBUS_CCP2:
+					isd->bus.interface =
+						isp_bus_interfaces[i].csi1_if;
+					isp_parse_of_csi1_endpoint(isp->dev, &vep,
+								   &isd->bus);
+					break;
+				default:
+					break;
+				}
+			}
+		}
 
 		fwnode_handle_put(ep);
-		if (ret)
-			kfree(isd);
 	}
 
 	return 0;
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 68da1eed753d..daa1b6d22436 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -252,6 +252,7 @@ static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
 			.bus_type = V4L2_MBUS_CSI2_DPHY
 		};
 		struct rkisp1_sensor_async *rk_asd = NULL;
+		struct v4l2_async_subdev *asd;
 		struct fwnode_handle *ep;
 
 		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(rkisp1->dev),
@@ -264,21 +265,18 @@ static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
 		if (ret)
 			goto err_parse;
 
-		rk_asd = kzalloc(sizeof(*rk_asd), GFP_KERNEL);
-		if (!rk_asd) {
-			ret = -ENOMEM;
+		asd = v4l2_async_notifier_add_fwnode_remote_subdev(ntf, ep,
+							sizeof(*rk_asd));
+		if (IS_ERR(asd)) {
+			ret = PTR_ERR(asd);
 			goto err_parse;
 		}
 
+		rk_asd = container_of(asd, struct rkisp1_sensor_async, asd);
 		rk_asd->mbus_type = vep.bus_type;
 		rk_asd->mbus_flags = vep.bus.mipi_csi2.flags;
 		rk_asd->lanes = vep.bus.mipi_csi2.num_data_lanes;
 
-		ret = v4l2_async_notifier_add_fwnode_remote_subdev(ntf, ep,
-								   &rk_asd->asd);
-		if (ret)
-			goto err_parse;
-
 		dev_dbg(rkisp1->dev, "registered ep id %d with %d lanes\n",
 			vep.base.id, rk_asd->lanes);
 
@@ -289,7 +287,6 @@ static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
 		continue;
 err_parse:
 		fwnode_handle_put(ep);
-		kfree(rk_asd);
 		v4l2_async_notifier_cleanup(ntf);
 		return ret;
 	}
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
index ec46cff80fdb..3f94b8c966f3 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c
@@ -118,6 +118,7 @@ static int sun4i_csi_notifier_init(struct sun4i_csi *csi)
 	struct v4l2_fwnode_endpoint vep = {
 		.bus_type = V4L2_MBUS_PARALLEL,
 	};
+	struct v4l2_async_subdev *asd;
 	struct fwnode_handle *ep;
 	int ret;
 
@@ -134,10 +135,12 @@ static int sun4i_csi_notifier_init(struct sun4i_csi *csi)
 
 	csi->bus = vep.bus.parallel;
 
-	ret = v4l2_async_notifier_add_fwnode_remote_subdev(&csi->notifier,
-							   ep, &csi->asd);
-	if (ret)
+	asd = v4l2_async_notifier_add_fwnode_remote_subdev(&csi->notifier,
+							   ep, sizeof(*asd));
+	if (IS_ERR(asd)) {
+		ret = PTR_ERR(asd);
 		goto out;
+	}
 
 	csi->notifier.ops = &sun4i_csi_notify_ops;
 
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
index 0f67ff652c2e..a5f61ee0ec4d 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h
@@ -139,7 +139,6 @@ struct sun4i_csi {
 	struct v4l2_mbus_framefmt	subdev_fmt;
 
 	/* V4L2 Async variables */
-	struct v4l2_async_subdev	asd;
 	struct v4l2_async_notifier	notifier;
 	struct v4l2_subdev		*src_subdev;
 	int				src_pad;
diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index 53570250a25d..7b280dfca727 100644
--- a/drivers/media/platform/video-mux.c
+++ b/drivers/media/platform/video-mux.c
@@ -370,19 +370,13 @@ static int video_mux_async_register(struct video_mux *vmux,
 		if (!ep)
 			continue;
 
-		asd = kzalloc(sizeof(*asd), GFP_KERNEL);
-		if (!asd) {
-			fwnode_handle_put(ep);
-			return -ENOMEM;
-		}
-
-		ret = v4l2_async_notifier_add_fwnode_remote_subdev(
-			&vmux->notifier, ep, asd);
+		asd = v4l2_async_notifier_add_fwnode_remote_subdev(
+			&vmux->notifier, ep, sizeof(*asd));
 
 		fwnode_handle_put(ep);
 
-		if (ret) {
-			kfree(asd);
+		if (IS_ERR(asd)) {
+			ret = PTR_ERR(asd);
 			/* OK if asd already exists */
 			if (ret != -EEXIST)
 				return ret;
diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 221feb9a8f7b..ed603ae63cad 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -656,26 +656,26 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
 }
 EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_fwnode_subdev);
 
-int
+struct v4l2_async_subdev *
 v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
 					     struct fwnode_handle *endpoint,
-					     struct v4l2_async_subdev *asd)
+					     unsigned int asd_struct_size)
 {
+	struct v4l2_async_subdev *asd;
 	struct fwnode_handle *remote;
-	int ret;
 
 	remote = fwnode_graph_get_remote_port_parent(endpoint);
 	if (!remote)
-		return -ENOTCONN;
+		return ERR_PTR(-ENOTCONN);
 
-	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
-	asd->match.fwnode = remote;
-
-	ret = v4l2_async_notifier_add_subdev(notif, asd);
-	if (ret)
-		fwnode_handle_put(remote);
-
-	return ret;
+	asd = v4l2_async_notifier_add_fwnode_subdev(notif, remote,
+						    asd_struct_size);
+	/*
+	 * Calling v4l2_async_notifier_add_fwnode_subdev grabs a refcount,
+	 * so drop the one we got in fwnode_graph_get_remote_port_parent.
+	 */
+	fwnode_handle_put(remote);
+	return asd;
 }
 EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_fwnode_remote_subdev);
 
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index db77fef07654..6344389e6afa 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1922,19 +1922,13 @@ static int imx_csi_async_register(struct csi_priv *priv)
 					     port, 0,
 					     FWNODE_GRAPH_ENDPOINT_NEXT);
 	if (ep) {
-		asd = kzalloc(sizeof(*asd), GFP_KERNEL);
-		if (!asd) {
-			fwnode_handle_put(ep);
-			return -ENOMEM;
-		}
-
-		ret = v4l2_async_notifier_add_fwnode_remote_subdev(
-			&priv->notifier, ep, asd);
+		asd = v4l2_async_notifier_add_fwnode_remote_subdev(
+			&priv->notifier, ep, sizeof(*asd));
 
 		fwnode_handle_put(ep);
 
-		if (ret) {
-			kfree(asd);
+		if (IS_ERR(asd)) {
+			ret = PTR_ERR(asd);
 			/* OK if asd already exists */
 			if (ret != -EEXIST)
 				return ret;
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 6b58899dcefe..a79ab38158e2 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -641,7 +641,7 @@ static int csi2_async_register(struct csi2_dev *csi2)
 	struct v4l2_fwnode_endpoint vep = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
 	};
-	struct v4l2_async_subdev *asd = NULL;
+	struct v4l2_async_subdev *asd;
 	struct fwnode_handle *ep;
 	int ret;
 
@@ -661,19 +661,13 @@ static int csi2_async_register(struct csi2_dev *csi2)
 	dev_dbg(csi2->dev, "data lanes: %d\n", vep.bus.mipi_csi2.num_data_lanes);
 	dev_dbg(csi2->dev, "flags: 0x%08x\n", vep.bus.mipi_csi2.flags);
 
-	asd = kzalloc(sizeof(*asd), GFP_KERNEL);
-	if (!asd) {
-		ret = -ENOMEM;
-		goto err_parse;
-	}
-
-	ret = v4l2_async_notifier_add_fwnode_remote_subdev(
-		&csi2->notifier, ep, asd);
-	if (ret)
-		goto err_parse;
-
+	asd = v4l2_async_notifier_add_fwnode_remote_subdev(
+		&csi2->notifier, ep, sizeof(*asd));
 	fwnode_handle_put(ep);
 
+	if (IS_ERR(asd))
+		return PTR_ERR(asd);
+
 	csi2->notifier.ops = &csi2_notify_ops;
 
 	ret = v4l2_async_subdev_notifier_register(&csi2->sd,
@@ -685,7 +679,6 @@ static int csi2_async_register(struct csi2_dev *csi2)
 
 err_parse:
 	fwnode_handle_put(ep);
-	kfree(asd);
 	return ret;
 }
 
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index ac52b1daf991..6c59485291ca 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1191,7 +1191,7 @@ static const struct v4l2_async_notifier_operations imx7_csi_notify_ops = {
 
 static int imx7_csi_async_register(struct imx7_csi *csi)
 {
-	struct v4l2_async_subdev *asd = NULL;
+	struct v4l2_async_subdev *asd;
 	struct fwnode_handle *ep;
 	int ret;
 
@@ -1200,19 +1200,13 @@ static int imx7_csi_async_register(struct imx7_csi *csi)
 	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csi->dev), 0, 0,
 					     FWNODE_GRAPH_ENDPOINT_NEXT);
 	if (ep) {
-		asd = kzalloc(sizeof(*asd), GFP_KERNEL);
-		if (!asd) {
-			fwnode_handle_put(ep);
-			return -ENOMEM;
-		}
-
-		ret = v4l2_async_notifier_add_fwnode_remote_subdev(
-			&csi->notifier, ep, asd);
+		asd = v4l2_async_notifier_add_fwnode_remote_subdev(
+			&csi->notifier, ep, sizeof(*asd));
 
 		fwnode_handle_put(ep);
 
-		if (ret) {
-			kfree(asd);
+		if (IS_ERR(asd)) {
+			ret = PTR_ERR(asd);
 			/* OK if asd already exists */
 			if (ret != -EEXIST)
 				return ret;
diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 7612993cc1d6..1ba77e629e5b 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -1004,7 +1004,7 @@ static int mipi_csis_async_register(struct csi_state *state)
 	struct v4l2_fwnode_endpoint vep = {
 		.bus_type = V4L2_MBUS_CSI2_DPHY,
 	};
-	struct v4l2_async_subdev *asd = NULL;
+	struct v4l2_async_subdev *asd;
 	struct fwnode_handle *ep;
 	int ret;
 
@@ -1024,17 +1024,13 @@ static int mipi_csis_async_register(struct csi_state *state)
 	dev_dbg(state->dev, "data lanes: %d\n", state->bus.num_data_lanes);
 	dev_dbg(state->dev, "flags: 0x%08x\n", state->bus.flags);
 
-	asd = kzalloc(sizeof(*asd), GFP_KERNEL);
-	if (!asd) {
-		ret = -ENOMEM;
+	asd = v4l2_async_notifier_add_fwnode_remote_subdev(
+		&state->notifier, ep, sizeof(*asd));
+	if (IS_ERR(asd)) {
+		ret = PTR_ERR(asd);
 		goto err_parse;
 	}
 
-	ret = v4l2_async_notifier_add_fwnode_remote_subdev(
-		&state->notifier, ep, asd);
-	if (ret)
-		goto err_parse;
-
 	fwnode_handle_put(ep);
 
 	state->notifier.ops = &mipi_csis_notify_ops;
@@ -1048,7 +1044,6 @@ static int mipi_csis_async_register(struct csi_state *state)
 
 err_parse:
 	fwnode_handle_put(ep);
-	kfree(asd);
 
 	return ret;
 }
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 0ddc06e36c08..8815e233677e 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -174,9 +174,11 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
  *
  * @notif: pointer to &struct v4l2_async_notifier
  * @endpoint: local endpoint pointing to the remote sub-device to be matched
- * @asd: Async sub-device struct allocated by the caller. The &struct
- *	 v4l2_async_subdev shall be the first member of the driver's async
- *	 sub-device struct, i.e. both begin at the same memory address.
+ * @asd_struct_size: size of the driver's async sub-device struct, including
+ *		     sizeof(struct v4l2_async_subdev). The &struct
+ *		     v4l2_async_subdev shall be the first member of
+ *		     the driver's async sub-device struct, i.e. both
+ *		     begin at the same memory address.
  *
  * Gets the remote endpoint of a given local endpoint, set it up for fwnode
  * matching and adds the async sub-device to the notifier's @asd_list. The
@@ -184,13 +186,12 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
  * notifier cleanup time.
  *
  * This is just like @v4l2_async_notifier_add_fwnode_subdev, but with the
- * exception that the fwnode refers to a local endpoint, not the remote one, and
- * the function relies on the caller to allocate the async sub-device struct.
+ * exception that the fwnode refers to a local endpoint, not the remote one.
  */
-int
+struct v4l2_async_subdev *
 v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
 					     struct fwnode_handle *endpoint,
-					     struct v4l2_async_subdev *asd);
+					     unsigned int asd_struct_size);
 
 /**
  * v4l2_async_notifier_add_i2c_subdev - Allocate and add an i2c async
-- 
2.29.2

