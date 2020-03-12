Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEB4A183554
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 16:46:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgCLPqg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 11:46:36 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44024 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727526AbgCLPqg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 11:46:36 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id DAF34296A85
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 2/2] media: staging: rkisp1: replace the call to v4l2_async_notifier_parse_fwnode_endpoints_by_port
Date:   Thu, 12 Mar 2020 16:46:04 +0100
Message-Id: <20200312154604.24996-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200312154604.24996-1-dafna.hirschfeld@collabora.com>
References: <20200312154604.24996-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

don't call 'v4l2_async_notifier_parse_fwnode_endpoints_by_port'
in order to register async subdevices. Instead call
'v4l2_fwnode_endpoint_parse' to parse the remote endpoints
and then register each async subdev with
'v4l2_async_notifier_add_fwnode_remote_subdev'

Also remove the relevant item in the TODO file

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/TODO         |  3 -
 drivers/staging/media/rkisp1/rkisp1-dev.c | 94 +++++++++++++----------
 2 files changed, 55 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
index 0aa9877dd64a..1aa3bb9fd6cb 100644
--- a/drivers/staging/media/rkisp1/TODO
+++ b/drivers/staging/media/rkisp1/TODO
@@ -1,6 +1,3 @@
-* Don't use v4l2_async_notifier_parse_fwnode_endpoints_by_port().
-e.g. isp_parse_of_endpoints in drivers/media/platform/omap3isp/isp.c
-cio2_parse_firmware in drivers/media/pci/intel/ipu3/ipu3-cio2.c.
 * Fix pad format size for statistics and parameters entities.
 * Use threaded interrupt for rkisp1_stats_isr(), remove work queue.
 * Fix checkpatch errors.
diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
index d2186856bb24..1035a39f3e49 100644
--- a/drivers/staging/media/rkisp1/rkisp1-dev.c
+++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
@@ -233,35 +233,6 @@ static int rkisp1_subdev_notifier_complete(struct v4l2_async_notifier *notifier)
 	return 0;
 }
 
-static int rkisp1_fwnode_parse(struct device *dev,
-			       struct v4l2_fwnode_endpoint *vep,
-			       struct v4l2_async_subdev *asd)
-{
-	struct rkisp1_sensor_async *s_asd =
-			container_of(asd, struct rkisp1_sensor_async, asd);
-
-	if (vep->bus_type != V4L2_MBUS_CSI2_DPHY) {
-		dev_err(dev, "Only CSI2 bus type is currently supported\n");
-		return -EINVAL;
-	}
-
-	if (vep->base.port != 0) {
-		dev_err(dev, "The ISP has only port 0\n");
-		return -EINVAL;
-	}
-
-	s_asd->mbus_type = vep->bus_type;
-	s_asd->lanes = vep->bus.mipi_csi2.num_data_lanes;
-
-	/* Parallel bus is currently not supported */
-	s_asd->parallel_bus_flags = 0;
-
-	if (s_asd->lanes < 1 || s_asd->lanes > 4)
-		return -EINVAL;
-
-	return 0;
-}
-
 static const struct v4l2_async_notifier_operations rkisp1_subdev_notifier_ops = {
 	.bound = rkisp1_subdev_notifier_bound,
 	.unbind = rkisp1_subdev_notifier_unbind,
@@ -271,23 +242,68 @@ static const struct v4l2_async_notifier_operations rkisp1_subdev_notifier_ops =
 static int rkisp1_subdev_notifier(struct rkisp1_device *rkisp1)
 {
 	struct v4l2_async_notifier *ntf = &rkisp1->notifier;
-	struct device *dev = rkisp1->dev;
+	int next_id = 0;
 	int ret;
 
 	v4l2_async_notifier_init(ntf);
 
-	ret = v4l2_async_notifier_parse_fwnode_endpoints_by_port(dev, ntf,
-					sizeof(struct rkisp1_sensor_async),
-					0, rkisp1_fwnode_parse);
-	if (ret)
-		return ret;
+	while (1) {
+		struct v4l2_fwnode_endpoint vep = {
+			.bus_type = V4L2_MBUS_CSI2_DPHY
+		};
+		struct rkisp1_sensor_async *rk_asd = NULL;
+		struct fwnode_handle *ep;
 
-	if (list_empty(&ntf->asd_list))
-		return -ENODEV;
+		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(rkisp1->dev),
+			0, next_id, FWNODE_GRAPH_ENDPOINT_NEXT);
 
-	ntf->ops = &rkisp1_subdev_notifier_ops;
+		if (!ep)
+			break;
+
+		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+		if (ret)
+			goto err_parse;
+
+		rk_asd = kzalloc(sizeof(*rk_asd), GFP_KERNEL);
+		if (!rk_asd) {
+			ret = -ENOMEM;
+			goto err_parse;
+		}
+
+		rk_asd->lanes = vep.bus.mipi_csi2.num_data_lanes;
+		rk_asd->mbus_type = vep.bus_type;
+
+		/* Parallel bus is currently not supported */
+		rk_asd->parallel_bus_flags = 0;
+		ret = v4l2_async_notifier_add_fwnode_remote_subdev(ntf, ep,
+								   &rk_asd->asd);
+		if (ret)
+			goto err_parse;
+
+		dev_dbg(rkisp1->dev, "registered ep id %d with %d lanes\n",
+			vep.base.id, rk_asd->lanes);
+
+		next_id = vep.base.id + 1;
+
+		fwnode_handle_put(ep);
 
-	return v4l2_async_notifier_register(&rkisp1->v4l2_dev, ntf);
+		continue;
+err_parse:
+		fwnode_handle_put(ep);
+		kfree(rk_asd);
+		v4l2_async_notifier_cleanup(ntf);
+		return ret;
+	}
+
+	if (next_id == 0)
+		dev_warn(rkisp1->dev, "no remote subdevice found\n");
+	ntf->ops = &rkisp1_subdev_notifier_ops;
+	ret = v4l2_async_notifier_register(&rkisp1->v4l2_dev, ntf);
+	if (ret) {
+		v4l2_async_notifier_cleanup(ntf);
+		return ret;
+	}
+	return 0;
 }
 
 /* ----------------------------------------------------------------------------
-- 
2.17.1

