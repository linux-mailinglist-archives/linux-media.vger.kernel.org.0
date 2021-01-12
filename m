Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E02EE2F3193
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 14:26:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728013AbhALNYk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 08:24:40 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40348 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbhALNYk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 08:24:40 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 5C0A61F451D9
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 04/13] media: exynos4-is: Use v4l2_async_notifier_add_fwnode_remote_subdev
Date:   Tue, 12 Jan 2021 10:23:30 -0300
Message-Id: <20210112132339.5621-5-ezequiel@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112132339.5621-1-ezequiel@collabora.com>
References: <20210112132339.5621-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The use of v4l2_async_notifier_add_subdev is discouraged.
Drivers are instead encouraged to use a helper such as
v4l2_async_notifier_add_fwnode_remote_subdev.

This fixes a misuse of the API, as v4l2_async_notifier_add_subdev
should get a kmalloc'ed struct v4l2_async_subdev,
removing some boilerplate code while at it.

Use the appropriate helper v4l2_async_notifier_add_fwnode_remote_subdev,
which handles the needed setup, instead of open-coding it.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/platform/exynos4-is/media-dev.c | 25 +++++++++----------
 drivers/media/platform/exynos4-is/media-dev.h |  2 +-
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index e636c33e847b..196166a9a4e5 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -401,6 +401,7 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
 	int index = fmd->num_sensors;
 	struct fimc_source_info *pd = &fmd->sensor[index].pdata;
 	struct device_node *rem, *np;
+	struct v4l2_async_subdev *asd;
 	struct v4l2_fwnode_endpoint endpoint = { .bus_type = 0 };
 	int ret;
 
@@ -418,7 +419,6 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
 	pd->mux_id = (endpoint.base.port - 1) & 0x1;
 
 	rem = of_graph_get_remote_port_parent(ep);
-	of_node_put(ep);
 	if (rem == NULL) {
 		v4l2_info(&fmd->v4l2_dev, "Remote device at %pOF not found\n",
 							ep);
@@ -450,6 +450,7 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
 	 * checking parent's node name.
 	 */
 	np = of_get_parent(rem);
+	of_node_put(rem);
 
 	if (of_node_name_eq(np, "i2c-isp"))
 		pd->fimc_bus_type = FIMC_BUS_TYPE_ISP_WRITEBACK;
@@ -457,21 +458,18 @@ static int fimc_md_parse_one_endpoint(struct fimc_md *fmd,
 		pd->fimc_bus_type = pd->sensor_bus_type;
 	of_node_put(np);
 
-	if (WARN_ON(index >= ARRAY_SIZE(fmd->sensor))) {
-		of_node_put(rem);
+	if (WARN_ON(index >= ARRAY_SIZE(fmd->sensor)))
 		return -EINVAL;
-	}
 
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
@@ -1381,7 +1379,8 @@ static int subdev_notifier_bound(struct v4l2_async_notifier *notifier,
 
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

