Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83A1E2F861D
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 21:06:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388472AbhAOUCq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 15:02:46 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:33155 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733215AbhAOUCo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 15:02:44 -0500
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id DF73F1C0008;
        Fri, 15 Jan 2021 20:01:59 +0000 (UTC)
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
        kevin.lhopital@hotmail.com,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH v5 04/16] media: sun6i-csi: Stop using the deprecated fwnode endpoint parser
Date:   Fri, 15 Jan 2021 21:01:29 +0100
Message-Id: <20210115200141.1397785-5-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210115200141.1397785-1-paul.kocialkowski@bootlin.com>
References: <20210115200141.1397785-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2_async_notifier_parse_fwnode_endpoints helper is getting
deprecated in favor of explicit parsing of the endpoints.

Implement it instead of using this deprecated function.

Since this was the last user of the helper, it should now be safe to
remove.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../platform/sunxi/sun6i-csi/sun6i_csi.c      | 69 ++++++++++++-------
 .../platform/sunxi/sun6i-csi/sun6i_csi.h      |  1 +
 2 files changed, 44 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
index c3b2f27b99d2..1a11a6174a17 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c
@@ -693,28 +693,6 @@ static const struct v4l2_async_notifier_operations sun6i_csi_async_ops = {
 	.complete = sun6i_subdev_notify_complete,
 };
 
-static int sun6i_csi_fwnode_parse(struct device *dev,
-				  struct v4l2_fwnode_endpoint *vep,
-				  struct v4l2_async_subdev *asd)
-{
-	struct sun6i_csi *csi = dev_get_drvdata(dev);
-
-	if (vep->base.port || vep->base.id) {
-		dev_warn(dev, "Only support a single port with one endpoint\n");
-		return -ENOTCONN;
-	}
-
-	switch (vep->bus_type) {
-	case V4L2_MBUS_PARALLEL:
-	case V4L2_MBUS_BT656:
-		csi->v4l2_ep = *vep;
-		return 0;
-	default:
-		dev_err(dev, "Unsupported media bus type\n");
-		return -ENOTCONN;
-	}
-}
-
 static void sun6i_csi_v4l2_cleanup(struct sun6i_csi *csi)
 {
 	media_device_unregister(&csi->media_dev);
@@ -726,6 +704,48 @@ static void sun6i_csi_v4l2_cleanup(struct sun6i_csi *csi)
 	media_device_cleanup(&csi->media_dev);
 }
 
+static int sun6i_csi_v4l2_fwnode_init(struct sun6i_csi *csi)
+{
+	struct v4l2_fwnode_endpoint *endpoint = NULL;
+	struct fwnode_handle *handle = NULL;
+	int ret;
+
+	/* Parallel */
+
+	endpoint = &csi->v4l2_ep;
+	handle = fwnode_graph_get_endpoint_by_id(dev_fwnode(csi->dev), 0, 0,
+						 FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!handle)
+		return 0;
+
+	ret = v4l2_fwnode_endpoint_parse(handle, endpoint);
+	if (ret)
+		goto error;
+
+	if (endpoint->bus_type != V4L2_MBUS_PARALLEL &&
+	    endpoint->bus_type != V4L2_MBUS_BT656) {
+		dev_err(csi->dev, "Unsupported parallel media bus type\n");
+		ret = -ENOTCONN;
+		goto error;
+	}
+
+	ret = v4l2_async_notifier_add_fwnode_remote_subdev(&csi->notifier,
+							   handle,
+							   &csi->subdev);
+	if (ret)
+		goto error;
+
+	fwnode_handle_put(handle);
+
+	return 0;
+
+error:
+	if (handle)
+		fwnode_handle_put(handle);
+
+	return ret;
+}
+
 static int sun6i_csi_v4l2_init(struct sun6i_csi *csi)
 {
 	int ret;
@@ -760,10 +780,7 @@ static int sun6i_csi_v4l2_init(struct sun6i_csi *csi)
 	if (ret)
 		goto unreg_v4l2;
 
-	ret = v4l2_async_notifier_parse_fwnode_endpoints(csi->dev,
-							 &csi->notifier,
-							 sizeof(struct v4l2_async_subdev),
-							 sun6i_csi_fwnode_parse);
+	ret = sun6i_csi_v4l2_fwnode_init(csi);
 	if (ret)
 		goto clean_video;
 
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
index c626821aaedb..7f3389c70794 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.h
@@ -38,6 +38,7 @@ struct sun6i_csi {
 	struct v4l2_device		v4l2_dev;
 	struct media_device		media_dev;
 
+	struct v4l2_async_subdev	subdev;
 	struct v4l2_async_notifier	notifier;
 
 	/* video port settings */
-- 
2.30.0

