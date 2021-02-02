Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 320E730C086
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 15:02:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233393AbhBBOA1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 09:00:27 -0500
Received: from retiisi.eu ([95.216.213.190]:45388 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233486AbhBBN6D (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 08:58:03 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id C8263634C99;
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
Subject: [PATCH v5 04/13] media: exynos4-is: Use v4l2_async_notifier_add_fwnode_remote_subdev
Date:   Tue,  2 Feb 2021 15:56:02 +0200
Message-Id: <20210202135611.13920-5-sakari.ailus@linux.intel.com>
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
v4l2_async_notifier_add_fwnode_remote_subdev.

This fixes a misuse of the API, as v4l2_async_notifier_add_subdev
should get a kmalloc'ed struct v4l2_async_subdev,
removing some boilerplate code while at it.

Use the appropriate helper v4l2_async_notifier_add_fwnode_remote_subdev,
which handles the needed setup, instead of open-coding it.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/exynos4-is/media-dev.c | 24 ++++++++++---------
 drivers/media/platform/exynos4-is/media-dev.h |  2 +-
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index e636c33e847b..f4687b0cbd65 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -401,6 +401,7 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
 	int index = fmd->num_sensors;
 	struct fimc_source_info *pd = &fmd->sensor[index].pdata;
 	struct device_node *rem, *np;
+	struct v4l2_async_subdev *asd;
 	struct v4l2_fwnode_endpoint endpoint = { .bus_type = 0 };
 	int ret;
 
@@ -418,10 +419,10 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
 	pd->mux_id = (endpoint.base.port - 1) & 0x1;
 
 	rem = of_graph_get_remote_port_parent(ep);
-	of_node_put(ep);
 	if (rem == NULL) {
 		v4l2_info(&fmd->v4l2_dev, "Remote device at %pOF not found\n",
 							ep);
+		of_node_put(ep);
 		return 0;
 	}
 
@@ -450,6 +451,7 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
 	 * checking parent's node name.
 	 */
 	np = of_get_parent(rem);
+	of_node_put(rem);
 
 	if (of_node_name_eq(np, "i2c-isp"))
 		pd->fimc_bus_type = FIMC_BUS_TYPE_ISP_WRITEBACK;
@@ -458,20 +460,19 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
 	of_node_put(np);
 
 	if (WARN_ON(index >= ARRAY_SIZE(fmd->sensor))) {
-		of_node_put(rem);
+		of_node_put(ep);
 		return -EINVAL;
 	}
 
-	fmd->sensor[index].asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
-	fmd->sensor[index].asd.match.fwnode = of_fwnode_handle(rem);
+	asd = v4l2_async_notifier_add_fwnode_remote_subdev(
+		&fmd->subdev_notifier, of_fwnode_handle(ep), sizeof(*asd));
 
-	ret = v4l2_async_notifier_add_subdev(&fmd->subdev_notifier,
-					     &fmd->sensor[index].asd);
-	if (ret) {
-		of_node_put(rem);
-		return ret;
-	}
+	of_node_put(ep);
+
+	if (IS_ERR(asd))
+		return PTR_ERR(asd);
 
+	fmd->sensor[index].asd = asd;
 	fmd->num_sensors++;
 
 	return 0;
@@ -1381,7 +1382,8 @@ static int subdev_notifier_bound(struct v4l2_async_notifier *notifier,
 
 	/* Find platform data for this sensor subdev */
 	for (i = 0; i < ARRAY_SIZE(fmd->sensor); i++)
-		if (fmd->sensor[i].asd.match.fwnode ==
+		if (fmd->sensor[i].asd &&
+		    fmd->sensor[i].asd->match.fwnode ==
 		    of_fwnode_handle(subdev->dev->of_node))
 			si = &fmd->sensor[i];
 
diff --git a/drivers/media/platform/exynos4-is/media-dev.h b/drivers/media/platform/exynos4-is/media-dev.h
index 9447fafe23c6..a3876d668ea6 100644
--- a/drivers/media/platform/exynos4-is/media-dev.h
+++ b/drivers/media/platform/exynos4-is/media-dev.h
@@ -83,7 +83,7 @@ struct fimc_camclk_info {
  */
 struct fimc_sensor_info {
 	struct fimc_source_info pdata;
-	struct v4l2_async_subdev asd;
+	struct v4l2_async_subdev *asd;
 	struct v4l2_subdev *subdev;
 	struct fimc_dev *host;
 };
-- 
2.29.2

