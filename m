Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 148CD30258C
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 14:37:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728948AbhAYNeC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 08:34:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728902AbhAYNbe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 08:31:34 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEF17C06178A
        for <linux-media@vger.kernel.org>; Mon, 25 Jan 2021 05:27:48 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 03411634C96;
        Mon, 25 Jan 2021 15:25:58 +0200 (EET)
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
Subject: [PATCH 12/14] media: Clarify v4l2-async subdevice addition API
Date:   Mon, 25 Jan 2021 15:22:13 +0200
Message-Id: <20210125132230.6600-12-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125132230.6600-1-sakari.ailus@linux.intel.com>
References: <20210125132230.6600-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ezequiel Garcia <ezequiel@collabora.com>

Now that most users of v4l2_async_notifier_add_subdev have
been converted, let's fix the documentation so it's more clear
how the v4l2-async API should be used.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../driver-api/media/v4l2-subdev.rst          | 38 ++++++++++++++++---
 include/media/v4l2-async.h                    | 15 ++++++--
 2 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index 0e82c77cf3e2..490dd212345d 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -201,11 +201,39 @@ Before registering the notifier, bridge drivers must do two things:
 first, the notifier must be initialized using the
 :c:func:`v4l2_async_notifier_init`. Second, bridge drivers can then
 begin to form a list of subdevice descriptors that the bridge device
-needs for its operation. Subdevice descriptors are added to the notifier
-using the :c:func:`v4l2_async_notifier_add_subdev` call. This function
-takes two arguments: a pointer to struct :c:type:`v4l2_async_notifier`,
-and a pointer to the subdevice descripter, which is of type struct
-:c:type:`v4l2_async_subdev`.
+needs for its operation. Several functions are available, to add subdevice
+descriptors to a notifier, depending on the type of device:
+:c:func:`v4l2_async_notifier_add_fwnode_subdev`,
+:c:func:`v4l2_async_notifier_add_fwnode_remote_subdev` or
+:c:func:`v4l2_async_notifier_add_i2c_subdev`.
+
+These functions allocate a subdevice descriptor, which is of
+type struct :c:type:`v4l2_async_subdev`, and take a size argument
+which can be used to embed the descriptor in a driver-specific
+async subdevice struct. The &struct :c:type:`v4l2_async_subdev`
+shall be the first member of this struct:
+
+.. code-block:: c
+
+	struct my_async_subdev {
+		struct v4l2_async_subdev asd;
+		...
+	};
+
+	struct my_async_subdev *my_asd;
+	struct v4l2_async_subdev *asd;
+	struct fwnode_handle *ep;
+
+	...
+
+	asd = v4l2_async_notifier_add_fwnode_subdev(
+			&notifier, ep, sizeof(*my_asd));
+	fwnode_handle_put(ep);
+
+	if (IS_ERR(asd))
+		return PTR_ERR(asd);
+
+	my_asd = container_of(asd, struct my_async_subdev, asd);
 
 The V4L2 core will then use these descriptors to match asynchronously
 registered subdevices to them. If a match is detected the ``.bound()``
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index f2cac0931372..25c9ebd3f963 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -128,7 +128,12 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
  * @notifier: pointer to &struct v4l2_async_notifier
  *
  * This function initializes the notifier @asd_list. It must be called
- * before the first call to @v4l2_async_notifier_add_subdev.
+ * before adding a subdevice to a notifier, using one of:
+ * @v4l2_async_notifier_add_fwnode_subdev,
+ * @v4l2_async_register_subdev_sensor_common,
+ * @v4l2_async_notifier_add_i2c_subdev,
+ * @v4l2_async_notifier_add_subdev or
+ * @v4l2_async_notifier_parse_fwnode_endpoints.
  */
 void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier);
 
@@ -248,9 +253,11 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier);
  * sub-devices allocated for the purposes of the notifier but not the notifier
  * itself. The user is responsible for calling this function to clean up the
  * notifier after calling
- * @v4l2_async_notifier_add_subdev,
- * @v4l2_async_notifier_parse_fwnode_endpoints or
- * @v4l2_async_register_subdev_sensor_common.
+ * @v4l2_async_notifier_add_fwnode_subdev,
+ * @v4l2_async_register_subdev_sensor_common,
+ * @v4l2_async_notifier_add_i2c_subdev,
+ * @v4l2_async_notifier_add_subdev or
+ * @v4l2_async_notifier_parse_fwnode_endpoints.
  *
  * There is no harm from calling v4l2_async_notifier_cleanup in other
  * cases as long as its memory has been zeroed after it has been
-- 
2.29.2

