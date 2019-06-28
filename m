Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4203C59875
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 12:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbfF1Kd5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 06:33:57 -0400
Received: from retiisi.org.uk ([95.216.213.190]:60364 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726550AbfF1Kd5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 06:33:57 -0400
Received: from lanttu.localdomain (unknown [IPv6:2a01:4f9:c010:4572::e1:1002])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 251DA634C80;
        Fri, 28 Jun 2019 13:33:40 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        jacopo@jmondi.org, niklas.soderlund@ragnatech.se
Subject: [PATCH v3 3/8] v4l2-async: Add v4l2_async_notifier_add_fwnode_remote_subdev
Date:   Fri, 28 Jun 2019 13:33:49 +0300
Message-Id: <20190628103354.5340-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190628103354.5340-1-sakari.ailus@linux.intel.com>
References: <20190628103354.5340-1-sakari.ailus@linux.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

v4l2_async_notifier_add_fwnode_remote_subdev is a convenience function for
parsing information on V4L2 fwnode subdevs.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 23 +++++++++++++++++++++++
 include/media/v4l2-async.h           | 25 +++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 27d7ed3d5177..ac686125354a 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -609,6 +609,29 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
 }
 EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_fwnode_subdev);
 
+int
+v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
+					     struct fwnode_handle *endpoint,
+					     struct v4l2_async_subdev *asd)
+{
+	struct fwnode_handle *remote;
+	int ret;
+
+	remote = fwnode_graph_get_remote_port_parent(endpoint);
+	if (!remote)
+		return -ENOTCONN;
+
+	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
+	asd->match.fwnode = remote;
+
+	ret = v4l2_async_notifier_add_subdev(notif, asd);
+	if (ret)
+		fwnode_handle_put(remote);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_fwnode_remote_subdev);
+
 struct v4l2_async_subdev *
 v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
 				   int adapter_id, unsigned short address,
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index b9141ffa188a..55ce3c1672a4 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -185,6 +185,31 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
 				      unsigned int asd_struct_size);
 
 /**
+ * v4l2_async_notifier_add_fwnode_remote_subdev - Allocate and add a fwnode
+ *						  remote async subdev to the
+ *						  notifier's master asd_list.
+ *
+ * @notif: pointer to &struct v4l2_async_notifier
+ * @endpoint: local endpoint the remote sub-device to be matched
+ * @asd: Async sub-device struct allocated by the caller. The &struct
+ *	 v4l2_async_subdev shall be the first member of the driver's async
+ *	 sub-device struct, i.e. both begin at the same memory address.
+ *
+ * Gets the remote endpoint of a given local endpoint, set it up for fwnode
+ * matching and add the async sub-device to the notifier's @asd_list. The
+ * function also gets a reference of the fwnode which is released later at
+ * notifier cleanup time.
+ *
+ * This is just like @v4l2_async_notifier_add_fwnode_subdev, but with the
+ * exception that the fwnode refers to a local endpoint, not the remote one, and
+ * the function relies on the caller to allocate the async sub-device struct.
+ */
+int
+v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif,
+					     struct fwnode_handle *endpoint,
+					     struct v4l2_async_subdev *asd);
+
+/**
  * v4l2_async_notifier_add_i2c_subdev - Allocate and add an i2c async
  *				subdev to the notifier's master asd_list.
  *
-- 
2.11.0

