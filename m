Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9041332F368
	for <lists+linux-media@lfdr.de>; Fri,  5 Mar 2021 20:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbhCETCf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Mar 2021 14:02:35 -0500
Received: from retiisi.eu ([95.216.213.190]:42826 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229794AbhCETCY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Mar 2021 14:02:24 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 821A2634C89;
        Fri,  5 Mar 2021 21:00:02 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 1/3] v4l: fwnode: Rename and make static V4L2 async notifier helper
Date:   Fri,  5 Mar 2021 21:02:16 +0200
Message-Id: <20210305190218.28505-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210305190218.28505-1-sakari.ailus@linux.intel.com>
References: <20210305190218.28505-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rename v4l2_async_notifier_parse_fwnode_sensor_common() as
v4l2_async_notifier_parse_fwnode_sensor() and make the function static, as
it's not used by a driver and maybe never will.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 27 ++++++++++++++++++++++-----
 include/media/v4l2-async.h            |  2 +-
 include/media/v4l2-fwnode.h           | 21 ---------------------
 3 files changed, 23 insertions(+), 27 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 2283ff3b8e1d..9c1b38919491 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -1259,8 +1259,27 @@ v4l2_fwnode_reference_parse_int_props(struct device *dev,
 	return !fwnode || PTR_ERR(fwnode) == -ENOENT ? 0 : PTR_ERR(fwnode);
 }
 
-int v4l2_async_notifier_parse_fwnode_sensor_common(struct device *dev,
-						   struct v4l2_async_notifier *notifier)
+/**
+ * v4l2_async_notifier_parse_fwnode_sensor - parse common references on
+ *					     sensors for async sub-devices
+ * @dev: the device node the properties of which are parsed for references
+ * @notifier: the async notifier where the async subdevs will be added
+ *
+ * Parse common sensor properties for remote devices related to the
+ * sensor and set up async sub-devices for them.
+ *
+ * Any notifier populated using this function must be released with a call to
+ * v4l2_async_notifier_release() after it has been unregistered and the async
+ * sub-devices are no longer in use, even in the case the function returned an
+ * error.
+ *
+ * Return: 0 on success
+ *	   -ENOMEM if memory allocation failed
+ *	   -EINVAL if property parsing failed
+ */
+static int
+v4l2_async_notifier_parse_fwnode_sensor(struct device *dev,
+					struct v4l2_async_notifier *notifier)
 {
 	static const char * const led_props[] = { "led" };
 	static const struct v4l2_fwnode_int_props props[] = {
@@ -1288,7 +1307,6 @@ int v4l2_async_notifier_parse_fwnode_sensor_common(struct device *dev,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(v4l2_async_notifier_parse_fwnode_sensor_common);
 
 int v4l2_async_register_subdev_sensor_common(struct v4l2_subdev *sd)
 {
@@ -1304,8 +1322,7 @@ int v4l2_async_register_subdev_sensor_common(struct v4l2_subdev *sd)
 
 	v4l2_async_notifier_init(notifier);
 
-	ret = v4l2_async_notifier_parse_fwnode_sensor_common(sd->dev,
-							     notifier);
+	ret = v4l2_async_notifier_parse_fwnode_sensor(sd->dev, notifier);
 	if (ret < 0)
 		goto out_cleanup;
 
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index d28cbe8142b8..aee28c0e31ac 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -295,7 +295,7 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd);
  *
  * This function is just like v4l2_async_register_subdev() with the exception
  * that calling it will also parse firmware interfaces for remote references
- * using v4l2_async_notifier_parse_fwnode_sensor_common() and registers the
+ * using v4l2_async_notifier_parse_fwnode_sensor() and registers the
  * async sub-devices. The sub-device is similarly unregistered by calling
  * v4l2_async_unregister_subdev().
  *
diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index 80d21ad8d603..7ab033b819eb 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -510,27 +510,6 @@ v4l2_async_notifier_parse_fwnode_endpoints(struct device *dev,
 					   size_t asd_struct_size,
 					   parse_endpoint_func parse_endpoint);
 
-/**
- * v4l2_async_notifier_parse_fwnode_sensor_common - parse common references on
- *					       sensors for async sub-devices
- * @dev: the device node the properties of which are parsed for references
- * @notifier: the async notifier where the async subdevs will be added
- *
- * Parse common sensor properties for remote devices related to the
- * sensor and set up async sub-devices for them.
- *
- * Any notifier populated using this function must be released with a call to
- * v4l2_async_notifier_release() after it has been unregistered and the async
- * sub-devices are no longer in use, even in the case the function returned an
- * error.
- *
- * Return: 0 on success
- *	   -ENOMEM if memory allocation failed
- *	   -EINVAL if property parsing failed
- */
-int v4l2_async_notifier_parse_fwnode_sensor_common(struct device *dev,
-						   struct v4l2_async_notifier *notifier);
-
 /* Helper macros to access the connector links. */
 
 /** v4l2_connector_last_link - Helper macro to get the first
-- 
2.29.2

