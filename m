Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E308130C09B
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 15:03:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233722AbhBBOC5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 09:02:57 -0500
Received: from retiisi.eu ([95.216.213.190]:45570 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233533AbhBBOBi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 09:01:38 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 8533F634CBD;
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
Subject: [PATCH v5 11/13] media: v4l2-async: Discourage use of v4l2_async_notifier_add_subdev
Date:   Tue,  2 Feb 2021 15:56:09 +0200
Message-Id: <20210202135611.13920-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202135611.13920-1-sakari.ailus@linux.intel.com>
References: <20210202135611.13920-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ezequiel Garcia <ezequiel@collabora.com>

Most -if not all- use-cases are expected to be covered by one of:
v4l2_async_notifier_add_fwnode_subdev,
v4l2_async_notifier_add_fwnode_remote_subdev or
v4l2_async_notifier_add_i2c_subdev.

We'd like to discourage drivers from using v4l2_async_notifier_add_subdev,
so rename it as __v4l2_async_notifier_add_subdev. This is
typically a good hint for drivers to avoid using the function.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c  | 8 ++++----
 drivers/media/v4l2-core/v4l2-fwnode.c | 2 +-
 include/media/v4l2-async.h            | 9 +++++++--
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index ed603ae63cad..d848db962dc7 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -611,7 +611,7 @@ void v4l2_async_notifier_cleanup(struct v4l2_async_notifier *notifier)
 }
 EXPORT_SYMBOL_GPL(v4l2_async_notifier_cleanup);
 
-int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
+int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_subdev *asd)
 {
 	int ret;
@@ -628,7 +628,7 @@ int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
 	mutex_unlock(&list_lock);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_subdev);
+EXPORT_SYMBOL_GPL(__v4l2_async_notifier_add_subdev);
 
 struct v4l2_async_subdev *
 v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
@@ -645,7 +645,7 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
 	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
 	asd->match.fwnode = fwnode_handle_get(fwnode);
 
-	ret = v4l2_async_notifier_add_subdev(notifier, asd);
+	ret = __v4l2_async_notifier_add_subdev(notifier, asd);
 	if (ret) {
 		fwnode_handle_put(fwnode);
 		kfree(asd);
@@ -695,7 +695,7 @@ v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
 	asd->match.i2c.adapter_id = adapter_id;
 	asd->match.i2c.address = address;
 
-	ret = v4l2_async_notifier_add_subdev(notifier, asd);
+	ret = __v4l2_async_notifier_add_subdev(notifier, asd);
 	if (ret) {
 		kfree(asd);
 		return ERR_PTR(ret);
diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index c1c2b3060532..63be16c8eb83 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -822,7 +822,7 @@ v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
 	if (ret < 0)
 		goto out_err;
 
-	ret = v4l2_async_notifier_add_subdev(notifier, asd);
+	ret = __v4l2_async_notifier_add_subdev(notifier, asd);
 	if (ret < 0) {
 		/* not an error if asd already exists */
 		if (ret == -EEXIST)
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 8815e233677e..b113329582ff 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -133,17 +133,22 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
 void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier);
 
 /**
- * v4l2_async_notifier_add_subdev - Add an async subdev to the
+ * __v4l2_async_notifier_add_subdev - Add an async subdev to the
  *				notifier's master asd list.
  *
  * @notifier: pointer to &struct v4l2_async_notifier
  * @asd: pointer to &struct v4l2_async_subdev
  *
+ * \warning: Drivers should avoid using this function and instead use one of:
+ * @v4l2_async_notifier_add_fwnode_subdev,
+ * @v4l2_async_notifier_add_fwnode_remote_subdev or
+ * @v4l2_async_notifier_add_i2c_subdev.
+ *
  * Call this function before registering a notifier to link the provided @asd to
  * the notifiers master @asd_list. The @asd must be allocated with k*alloc() as
  * it will be freed by the framework when the notifier is destroyed.
  */
-int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
+int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_subdev *asd);
 
 /**
-- 
2.29.2

