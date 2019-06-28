Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABA2D59876
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 12:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbfF1Kd6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 06:33:58 -0400
Received: from retiisi.org.uk ([95.216.213.190]:60354 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726524AbfF1Kd5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 06:33:57 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id EE5B7634C7F;
        Fri, 28 Jun 2019 13:33:39 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        jacopo@jmondi.org, niklas.soderlund@ragnatech.se
Subject: [PATCH v3 2/8] v4l2-async: Get fwnode reference when putting it to the notifier's list
Date:   Fri, 28 Jun 2019 13:33:48 +0300
Message-Id: <20190628103354.5340-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190628103354.5340-1-sakari.ailus@linux.intel.com>
References: <20190628103354.5340-1-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2_async_notifier_add_fwnode_subdev() did not take a reference of
the added fwnode, relying on the caller to handle that instead, in essence
putting the fwnode to be added if there was an error.

As the reference is eventually released during the notifier cleanup, this
is not intuitive nor logical. Improve this by always getting a reference
when the function succeeds, and the caller releasing the reference when it
does not *itself* need it anymore.

Luckily, perhaps, there were just a handful of callers using the function.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c   |  5 ++---
 drivers/media/platform/davinci/vpif_capture.c | 13 ++++++-------
 drivers/media/platform/qcom/camss/camss.c     |  2 +-
 drivers/media/platform/xilinx/xilinx-vipp.c   |  2 +-
 drivers/media/v4l2-core/v4l2-async.c          |  3 ++-
 drivers/media/v4l2-core/v4l2-fwnode.c         | 23 ++++++-----------------
 include/media/v4l2-async.h                    |  5 +++--
 7 files changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index fe7b937eb5f2..f6220e3e1f22 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -2505,10 +2505,9 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
 		pdata->asd[i] = v4l2_async_notifier_add_fwnode_subdev(
 			&vpfe->notifier, of_fwnode_handle(rem),
 			sizeof(struct v4l2_async_subdev));
-		if (IS_ERR(pdata->asd[i])) {
-			of_node_put(rem);
+		of_node_put(rem);
+		if (IS_ERR(pdata->asd[i]))
 			goto cleanup;
-		}
 	}
 
 	of_node_put(endpoint);
diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
index 394202c28b1a..091682305f37 100644
--- a/drivers/media/platform/davinci/vpif_capture.c
+++ b/drivers/media/platform/davinci/vpif_capture.c
@@ -1511,6 +1511,7 @@ static struct vpif_capture_config *
 vpif_capture_get_pdata(struct platform_device *pdev)
 {
 	struct device_node *endpoint = NULL;
+	struct device_node *rem = NULL;
 	struct vpif_capture_config *pdata;
 	struct vpif_subdev_info *sdinfo;
 	struct vpif_capture_chan_config *chan;
@@ -1541,7 +1542,6 @@ vpif_capture_get_pdata(struct platform_device *pdev)
 
 	for (i = 0; i < VPIF_CAPTURE_NUM_CHANNELS; i++) {
 		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
-		struct device_node *rem;
 		unsigned int flags;
 		int err;
 
@@ -1563,10 +1563,8 @@ vpif_capture_get_pdata(struct platform_device *pdev)
 					    VPIF_CAPTURE_NUM_CHANNELS,
 					    sizeof(*chan->inputs),
 					    GFP_KERNEL);
-		if (!chan->inputs) {
-			of_node_put(rem);
+		if (!chan->inputs)
 			goto err_cleanup;
-		}
 
 		chan->input_count++;
 		chan->inputs[i].input.type = V4L2_INPUT_TYPE_CAMERA;
@@ -1598,10 +1596,10 @@ vpif_capture_get_pdata(struct platform_device *pdev)
 		pdata->asd[i] = v4l2_async_notifier_add_fwnode_subdev(
 			&vpif_obj.notifier, of_fwnode_handle(rem),
 			sizeof(struct v4l2_async_subdev));
-		if (IS_ERR(pdata->asd[i])) {
-			of_node_put(rem);
+		if (IS_ERR(pdata->asd[i]))
 			goto err_cleanup;
-		}
+
+		of_node_put(rem);
 	}
 
 done:
@@ -1613,6 +1611,7 @@ vpif_capture_get_pdata(struct platform_device *pdev)
 	return pdata;
 
 err_cleanup:
+	of_node_put(rem);
 	of_node_put(endpoint);
 	v4l2_async_notifier_cleanup(&vpif_obj.notifier);
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 63da18773d24..3fdc9f964a3c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -486,9 +486,9 @@ static int camss_of_parse_ports(struct camss *camss)
 		asd = v4l2_async_notifier_add_fwnode_subdev(
 			&camss->notifier, of_fwnode_handle(remote),
 			sizeof(*csd));
+		of_node_put(remote);
 		if (IS_ERR(asd)) {
 			ret = PTR_ERR(asd);
-			of_node_put(remote);
 			goto err_cleanup;
 		}
 
diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
index edce0402155d..cc2856efea59 100644
--- a/drivers/media/platform/xilinx/xilinx-vipp.c
+++ b/drivers/media/platform/xilinx/xilinx-vipp.c
@@ -385,9 +385,9 @@ static int xvip_graph_parse_one(struct xvip_composite_device *xdev,
 		asd = v4l2_async_notifier_add_fwnode_subdev(
 			&xdev->notifier, remote,
 			sizeof(struct xvip_graph_entity));
+		fwnode_handle_put(remote);
 		if (IS_ERR(asd)) {
 			ret = PTR_ERR(asd);
-			fwnode_handle_put(remote);
 			goto err_notifier_cleanup;
 		}
 	}
diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 15b0c44a76e7..27d7ed3d5177 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -596,10 +596,11 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
 		return ERR_PTR(-ENOMEM);
 
 	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
-	asd->match.fwnode = fwnode;
+	asd->match.fwnode = fwnode_handle_get(fwnode);
 
 	ret = v4l2_async_notifier_add_subdev(notifier, asd);
 	if (ret) {
+		fwnode_handle_put(fwnode);
 		kfree(asd);
 		return ERR_PTR(ret);
 	}
diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 7e740d332a54..1647f72fb665 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -777,23 +777,17 @@ static int v4l2_fwnode_reference_parse(struct device *dev,
 		asd = v4l2_async_notifier_add_fwnode_subdev(notifier,
 							    args.fwnode,
 							    sizeof(*asd));
+		fwnode_handle_put(args.fwnode);
 		if (IS_ERR(asd)) {
-			ret = PTR_ERR(asd);
 			/* not an error if asd already exists */
-			if (ret == -EEXIST) {
-				fwnode_handle_put(args.fwnode);
+			if (PTR_ERR(asd) == -EEXIST)
 				continue;
-			}
 
-			goto error;
+			return PTR_ERR(asd);
 		}
 	}
 
 	return 0;
-
-error:
-	fwnode_handle_put(args.fwnode);
-	return ret;
 }
 
 /*
@@ -1083,23 +1077,18 @@ v4l2_fwnode_reference_parse_int_props(struct device *dev,
 
 		asd = v4l2_async_notifier_add_fwnode_subdev(notifier, fwnode,
 							    sizeof(*asd));
+		fwnode_handle_put(fwnode);
 		if (IS_ERR(asd)) {
 			ret = PTR_ERR(asd);
 			/* not an error if asd already exists */
-			if (ret == -EEXIST) {
-				fwnode_handle_put(fwnode);
+			if (ret == -EEXIST)
 				continue;
-			}
 
-			goto error;
+			return PTR_ERR(asd);
 		}
 	}
 
 	return !fwnode || PTR_ERR(fwnode) == -ENOENT ? 0 : PTR_ERR(fwnode);
-
-error:
-	fwnode_handle_put(fwnode);
-	return ret;
 }
 
 int v4l2_async_notifier_parse_fwnode_sensor_common(struct device *dev,
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 1497bda66c3b..b9141ffa188a 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -175,8 +175,9 @@ int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
  *		     the driver's async sub-device struct, i.e. both
  *		     begin at the same memory address.
  *
- * Allocate a fwnode-matched asd of size asd_struct_size, and add it
- * to the notifiers @asd_list.
+ * Allocate a fwnode-matched asd of size asd_struct_size, and add it to the
+ * notifiers @asd_list. The function also gets a reference of the fwnode which
+ * is released later at notifier cleanup time.
  */
 struct v4l2_async_subdev *
 v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
-- 
2.11.0

