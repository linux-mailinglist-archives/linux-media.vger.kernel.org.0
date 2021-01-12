Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF4B2F319A
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 14:26:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727395AbhALNZI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 08:25:08 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40430 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbhALNZI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 08:25:08 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id AF6491F451E4
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 13/13] media: v4l2-async: Discourage use of v4l2_async_notifier_add_subdev
Date:   Tue, 12 Jan 2021 10:23:39 -0300
Message-Id: <20210112132339.5621-14-ezequiel@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112132339.5621-1-ezequiel@collabora.com>
References: <20210112132339.5621-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Most -if not all- use-cases are expected to be covered by one of:
v4l2_async_notifier_add_fwnode_subdev,
v4l2_async_notifier_add_fwnode_remote_subdev,
v4l2_async_notifier_add_i2c_subdev or
v4l2_async_notifier_add_devname_subdev.

We'd like to discourage drivers from using v4l2_async_notifier_add_subdev,
so rename it as __v4l2_async_notifier_add_subdev. This is
typically a good hint for drivers to avoid using the function.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/v4l2-core/v4l2-async.c  | 10 +++++-----
 drivers/media/v4l2-core/v4l2-fwnode.c |  2 +-
 include/media/v4l2-async.h            | 10 ++++++++--
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index b325bacddff4..e8e690280922 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -630,7 +630,7 @@ void v4l2_async_notifier_cleanup(struct v4l2_async_notifier *notifier)
 }
 EXPORT_SYMBOL_GPL(v4l2_async_notifier_cleanup);
 
-int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
+int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_subdev *asd)
 {
 	int ret;
@@ -647,7 +647,7 @@ int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
 	mutex_unlock(&list_lock);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(v4l2_async_notifier_add_subdev);
+EXPORT_SYMBOL_GPL(__v4l2_async_notifier_add_subdev);
 
 struct v4l2_async_subdev *
 v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
@@ -664,7 +664,7 @@ v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
 	asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
 	asd->match.fwnode = fwnode_handle_get(fwnode);
 
-	ret = v4l2_async_notifier_add_subdev(notifier, asd);
+	ret = __v4l2_async_notifier_add_subdev(notifier, asd);
 	if (ret) {
 		fwnode_handle_put(fwnode);
 		kfree(asd);
@@ -714,7 +714,7 @@ v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
 	asd->match.i2c.adapter_id = adapter_id;
 	asd->match.i2c.address = address;
 
-	ret = v4l2_async_notifier_add_subdev(notifier, asd);
+	ret = __v4l2_async_notifier_add_subdev(notifier, asd);
 	if (ret) {
 		kfree(asd);
 		return ERR_PTR(ret);
@@ -739,7 +739,7 @@ v4l2_async_notifier_add_devname_subdev(struct v4l2_async_notifier *notifier,
 	asd->match_type = V4L2_ASYNC_MATCH_DEVNAME;
 	asd->match.device_name = device_name;
 
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
index 1278f98355a7..9cf83f1ecca6 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -161,17 +161,23 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
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
+ * @v4l2_async_notifier_add_fwnode_remote_subdev,
+ * @v4l2_async_notifier_add_i2c_subdev or
+ * @v4l2_async_notifier_add_devname_subdev.
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

