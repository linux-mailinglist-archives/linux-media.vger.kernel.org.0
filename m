Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8C53B02C0
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 13:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbhFVLbM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 07:31:12 -0400
Received: from retiisi.eu ([95.216.213.190]:59750 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230057AbhFVLbL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 07:31:11 -0400
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 855A0634C8B;
        Tue, 22 Jun 2021 14:21:54 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH 2/6] Documentation: media: Fix v4l2-async kerneldoc syntax
Date:   Tue, 22 Jun 2021 14:21:56 +0300
Message-Id: <20210622112200.13914-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210622112200.13914-1-sakari.ailus@linux.intel.com>
References: <20210622112200.13914-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix kerneldoc syntax in v4l2-async. The references were not produced
correctly.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/media/v4l2-async.h | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 5b275a845c20..fa4901162663 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -129,11 +129,11 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
  *
  * This function initializes the notifier @asd_list. It must be called
  * before adding a subdevice to a notifier, using one of:
- * @v4l2_async_notifier_add_fwnode_remote_subdev,
- * @v4l2_async_notifier_add_fwnode_subdev,
- * @v4l2_async_notifier_add_i2c_subdev,
- * @__v4l2_async_notifier_add_subdev or
- * @v4l2_async_notifier_parse_fwnode_endpoints.
+ * v4l2_async_notifier_add_fwnode_remote_subdev(),
+ * v4l2_async_notifier_add_fwnode_subdev(),
+ * v4l2_async_notifier_add_i2c_subdev(),
+ * __v4l2_async_notifier_add_subdev() or
+ * v4l2_async_notifier_parse_fwnode_endpoints().
  */
 void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier);
 
@@ -145,9 +145,9 @@ void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier);
  * @asd: pointer to &struct v4l2_async_subdev
  *
  * \warning: Drivers should avoid using this function and instead use one of:
- * @v4l2_async_notifier_add_fwnode_subdev,
- * @v4l2_async_notifier_add_fwnode_remote_subdev or
- * @v4l2_async_notifier_add_i2c_subdev.
+ * v4l2_async_notifier_add_fwnode_subdev(),
+ * v4l2_async_notifier_add_fwnode_remote_subdev() or
+ * v4l2_async_notifier_add_i2c_subdev().
  *
  * Call this function before registering a notifier to link the provided @asd to
  * the notifiers master @asd_list. The @asd must be allocated with k*alloc() as
@@ -200,7 +200,7 @@ __v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif
  * function also gets a reference of the fwnode which is released later at
  * notifier cleanup time.
  *
- * This is just like @v4l2_async_notifier_add_fwnode_subdev, but with the
+ * This is just like v4l2_async_notifier_add_fwnode_subdev(), but with the
  * exception that the fwnode refers to a local endpoint, not the remote one.
  */
 #define v4l2_async_notifier_add_fwnode_remote_subdev(notifier, ep, type) \
@@ -265,13 +265,13 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier);
  * sub-devices allocated for the purposes of the notifier but not the notifier
  * itself. The user is responsible for calling this function to clean up the
  * notifier after calling
- * @v4l2_async_notifier_add_fwnode_remote_subdev,
- * @v4l2_async_notifier_add_fwnode_subdev,
- * @v4l2_async_notifier_add_i2c_subdev,
- * @__v4l2_async_notifier_add_subdev or
- * @v4l2_async_notifier_parse_fwnode_endpoints.
+ * v4l2_async_notifier_add_fwnode_remote_subdev(),
+ * v4l2_async_notifier_add_fwnode_subdev(),
+ * v4l2_async_notifier_add_i2c_subdev(),
+ * __v4l2_async_notifier_add_subdev() or
+ * v4l2_async_notifier_parse_fwnode_endpoints().
  *
- * There is no harm from calling v4l2_async_notifier_cleanup in other
+ * There is no harm from calling v4l2_async_notifier_cleanup() in other
  * cases as long as its memory has been zeroed after it has been
  * allocated.
  */
-- 
2.30.2

