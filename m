Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75A84304862
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 20:23:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388641AbhAZFpV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 00:45:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728924AbhAYNc7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 08:32:59 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF20C061351
        for <linux-media@vger.kernel.org>; Mon, 25 Jan 2021 05:29:54 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id B2657634CD2;
        Mon, 25 Jan 2021 15:25:59 +0200 (EET)
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
Subject: [PATCH v3 13/14] media: v4l2-async: Discourage use of v4l2_async_notifier_add_subdev
Date:   Mon, 25 Jan 2021 15:22:29 +0200
Message-Id: <20210125132230.6600-28-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125132230.6600-1-sakari.ailus@linux.intel.com>
References: <20210125132230.6600-1-sakari.ailus@linux.intel.com>
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
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-async.c  | 8 ++++----
 drivers/media/v4l2-core/v4l2-fwnode.c | 2 +-
 include/media/v4l2-async.h            | 9 +++++++--
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 1f2b7aa1fca6..bd1944c2d062 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -603,7 +603,7 @@ void v4l2_async_notifier_cleanup(struct v4l2_async_notifier *notifier)
 }
 EXPORT_SYMBOL_GPL(v4l2_async_notifier_cleanup);
 
-int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
+int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_subdev *asd)
 {
 	int ret;
@@ -620,7 +620,7 @@ int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
 	mutex_unlock(&list_lock);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_subdev);
+EXPORT_SYMBOL_GPL(__v4l2_async_notifier_add_subdev);
 
 struct v4l2_async_subdev *
 v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
@@ -637,7 +637,7 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
 	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
 	asd->match.fwnode = fwnode_handle_get(fwnode);
 
-	ret = v4l2_async_notifier_add_subdev(notifier, asd);
+	ret = __v4l2_async_notifier_add_subdev(notifier, asd);
 	if (ret) {
 		fwnode_handle_put(fwnode);
 		kfree(asd);
@@ -687,7 +687,7 @@ v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
 	asd->match.i2c.adapter_id = adapter_id;
 	asd->match.i2c.address = address;
 
-	ret = v4l2_async_notifier_add_subdev(notifier, asd);
+	ret = __v4l2_async_notifier_add_subdev(notifier, asd);
 	if (ret) {
 		kfree(asd);
 		return ERR_PTR(ret);
diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 5353e37eb950..919fde20032e 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -833,7 +833,7 @@ v4l2_async_notifier_fwnode_parse_endpoint(struct device *dev,
 	if (ret < 0)
 		goto out_err;
 
-	ret = v4l2_async_notifier_add_subdev(notifier, asd);
+	ret = __v4l2_async_notifier_add_subdev(notifier, asd);
 	if (ret < 0) {
 		/* not an error if asd already exists */
 		if (ret == -EEXIST)
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 25c9ebd3f963..ef4ac3559be9 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -138,17 +138,22 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
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

