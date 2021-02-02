Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF5CD30CAB3
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 19:59:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239102AbhBBS51 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 13:57:27 -0500
Received: from retiisi.eu ([95.216.213.190]:45562 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233517AbhBBOBg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 09:01:36 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 3A789634CA5;
        Tue,  2 Feb 2021 15:56:09 +0200 (EET)
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
Subject: [PATCH v5 08/13] media: renesas-ceu: Use v4l2_async_notifier_add_*_subdev
Date:   Tue,  2 Feb 2021 15:56:06 +0200
Message-Id: <20210202135611.13920-9-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202135611.13920-1-sakari.ailus@linux.intel.com>
References: <20210202135611.13920-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ezequiel Garcia <ezequiel@collabora.com>

The use of v4l2_async_notifier_add_subdev will be discouraged.
Drivers are instead encouraged to use a helper such as
v4l2_async_notifier_add_i2c_subdev.

This fixes a misuse of the API, as v4l2_async_notifier_add_subdev
should get a kmalloc'ed struct v4l2_async_subdev,
removing some boilerplate code while at it.

Use the appropriate helper: v4l2_async_notifier_add_i2c_subdev
or v4l2_async_notifier_add_fwnode_remote_subdev, which handles
the needed setup, instead of open-coding it.

Using v4l2-async to allocate the driver-specific structs,
requires to change struct ceu_subdev so the embedded
struct v4l2_async_subdev is now the first element.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/renesas-ceu.c | 60 +++++++++++++---------------
 1 file changed, 27 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/renesas-ceu.c b/drivers/media/platform/renesas-ceu.c
index 4a633ad0e8fa..0298d08b39e4 100644
--- a/drivers/media/platform/renesas-ceu.c
+++ b/drivers/media/platform/renesas-ceu.c
@@ -152,8 +152,8 @@ static inline struct ceu_buffer *vb2_to_ceu(struct vb2_v4l2_buffer *vbuf)
  * ceu_subdev - Wraps v4l2 sub-device and provides async subdevice.
  */
 struct ceu_subdev {
-	struct v4l2_subdev *v4l2_sd;
 	struct v4l2_async_subdev asd;
+	struct v4l2_subdev *v4l2_sd;
 
 	/* per-subdevice mbus configuration options */
 	unsigned int mbus_flags;
@@ -174,7 +174,7 @@ struct ceu_device {
 	struct v4l2_device	v4l2_dev;
 
 	/* subdevices descriptors */
-	struct ceu_subdev	*subdevs;
+	struct ceu_subdev	**subdevs;
 	/* the subdevice currently in use */
 	struct ceu_subdev	*sd;
 	unsigned int		sd_index;
@@ -1195,7 +1195,7 @@ static int ceu_enum_input(struct file *file, void *priv,
 	if (inp->index >= ceudev->num_sd)
 		return -EINVAL;
 
-	ceusd = &ceudev->subdevs[inp->index];
+	ceusd = ceudev->subdevs[inp->index];
 
 	inp->type = V4L2_INPUT_TYPE_CAMERA;
 	inp->std = 0;
@@ -1230,7 +1230,7 @@ static int ceu_s_input(struct file *file, void *priv, unsigned int i)
 		return 0;
 
 	ceu_sd_old = ceudev->sd;
-	ceudev->sd = &ceudev->subdevs[i];
+	ceudev->sd = ceudev->subdevs[i];
 
 	/*
 	 * Make sure we can generate output image formats and apply
@@ -1423,7 +1423,7 @@ static int ceu_notify_complete(struct v4l2_async_notifier *notifier)
 	 * ceu formats.
 	 */
 	if (!ceudev->sd) {
-		ceudev->sd = &ceudev->subdevs[0];
+		ceudev->sd = ceudev->subdevs[0];
 		ceudev->sd_index = 0;
 	}
 
@@ -1467,8 +1467,8 @@ static const struct v4l2_async_notifier_operations ceu_notify_ops = {
 
 /*
  * ceu_init_async_subdevs() - Initialize CEU subdevices and async_subdevs in
- *			      ceu device. Both DT and platform data parsing use
- *			      this routine.
+ *                           ceu device. Both DT and platform data parsing use
+ *                           this routine.
  *
  * Returns 0 for success, -ENOMEM for failure.
  */
@@ -1495,6 +1495,7 @@ static int ceu_parse_platform_data(struct ceu_device *ceudev,
 				   const struct ceu_platform_data *pdata)
 {
 	const struct ceu_async_subdev *async_sd;
+	struct v4l2_async_subdev *asd;
 	struct ceu_subdev *ceu_sd;
 	unsigned int i;
 	int ret;
@@ -1510,21 +1511,17 @@ static int ceu_parse_platform_data(struct ceu_device *ceudev,
 
 		/* Setup the ceu subdevice and the async subdevice. */
 		async_sd = &pdata->subdevs[i];
-		ceu_sd = &ceudev->subdevs[i];
-
-		INIT_LIST_HEAD(&ceu_sd->asd.list);
-
-		ceu_sd->mbus_flags	= async_sd->flags;
-		ceu_sd->asd.match_type	= V4L2_ASYNC_MATCH_I2C;
-		ceu_sd->asd.match.i2c.adapter_id = async_sd->i2c_adapter_id;
-		ceu_sd->asd.match.i2c.address = async_sd->i2c_address;
-
-		ret = v4l2_async_notifier_add_subdev(&ceudev->notifier,
-						     &ceu_sd->asd);
-		if (ret) {
+		asd = v4l2_async_notifier_add_i2c_subdev(&ceudev->notifier,
+				async_sd->i2c_adapter_id,
+				async_sd->i2c_address,
+				sizeof(*ceu_sd));
+		if (IS_ERR(asd)) {
 			v4l2_async_notifier_cleanup(&ceudev->notifier);
-			return ret;
+			return PTR_ERR(asd);
 		}
+		ceu_sd = to_ceu_subdev(asd);
+		ceu_sd->mbus_flags = async_sd->flags;
+		ceudev->subdevs[i] = ceu_sd;
 	}
 
 	return pdata->num_subdevs;
@@ -1536,7 +1533,8 @@ static int ceu_parse_platform_data(struct ceu_device *ceudev,
 static int ceu_parse_dt(struct ceu_device *ceudev)
 {
 	struct device_node *of = ceudev->dev->of_node;
-	struct device_node *ep, *remote;
+	struct device_node *ep;
+	struct v4l2_async_subdev *asd;
 	struct ceu_subdev *ceu_sd;
 	unsigned int i;
 	int num_ep;
@@ -1578,20 +1576,16 @@ static int ceu_parse_dt(struct ceu_device *ceudev)
 		}
 
 		/* Setup the ceu subdevice and the async subdevice. */
-		ceu_sd = &ceudev->subdevs[i];
-		INIT_LIST_HEAD(&ceu_sd->asd.list);
-
-		remote = of_graph_get_remote_port_parent(ep);
-		ceu_sd->mbus_flags = fw_ep.bus.parallel.flags;
-		ceu_sd->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
-		ceu_sd->asd.match.fwnode = of_fwnode_handle(remote);
-
-		ret = v4l2_async_notifier_add_subdev(&ceudev->notifier,
-						     &ceu_sd->asd);
-		if (ret) {
-			of_node_put(remote);
+		asd = v4l2_async_notifier_add_fwnode_remote_subdev(
+				&ceudev->notifier, of_fwnode_handle(ep),
+				sizeof(*ceu_sd));
+		if (IS_ERR(asd)) {
+			ret = PTR_ERR(asd);
 			goto error_cleanup;
 		}
+		ceu_sd = to_ceu_subdev(asd);
+		ceu_sd->mbus_flags = fw_ep.bus.parallel.flags;
+		ceudev->subdevs[i] = ceu_sd;
 
 		of_node_put(ep);
 	}
-- 
2.29.2

