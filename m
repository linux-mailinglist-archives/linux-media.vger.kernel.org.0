Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A35B82F3199
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 14:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729506AbhALNY7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 08:24:59 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40420 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727395AbhALNY6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 08:24:58 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 557E51F451D7
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 12/13] media: Clarify v4l2-async subdevice addition API
Date:   Tue, 12 Jan 2021 10:23:38 -0300
Message-Id: <20210112132339.5621-13-ezequiel@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112132339.5621-1-ezequiel@collabora.com>
References: <20210112132339.5621-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that most users of v4l2_async_notifier_add_subdev have
been converted, let's fix the documentation so it's more clear
how the v4l2-async API should be used.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 .../driver-api/media/v4l2-subdev.rst          | 38 ++++++++++++++++---
 include/media/v4l2-async.h                    | 12 +++++-
 2 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index bb5b1a7cdfd9..5ddf9de4fcf7 100644
--- a/Documentation/driver-api/media/v4l2-subdev.rst
+++ b/Documentation/driver-api/media/v4l2-subdev.rst
@@ -204,11 +204,39 @@ Before registering the notifier, bridge drivers must do two things:
 first, the notifier must be initialized using the
 :c:func:`v4l2_async_notifier_init`. Second, bridge drivers can then
 begin to form a list of subdevice descriptors that the bridge device
-needs for its operation. Subdevice descriptors are added to the notifier
-using the :c:func:`v4l2_async_notifier_add_subdev` call. This function
-takes two arguments: a pointer to struct :c:type:`v4l2_async_notifier`,
-and a pointer to the subdevice descripter, which is of type struct
-:c:type:`v4l2_async_subdev`.
+needs for its operation. Several functions are available, to
+add subdevice descriptors to a notifier, depending on the type of device:
+:c:func:`v4l2_async_notifier_add_devname_subdev`,
+:c:func:`v4l2_async_notifier_add_fwnode_subdev` or
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
index 2429ac55be1c..1278f98355a7 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -151,7 +151,12 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
  * @notifier: pointer to &struct v4l2_async_notifier
  *
  * This function initializes the notifier @asd_list. It must be called
- * before the first call to @v4l2_async_notifier_add_subdev.
+ * before adding a subdevice to a notifier, using one of:
+ * @v4l2_async_notifier_add_fwnode_subdev,
+ * @v4l2_async_notifier_add_fwnode_remote_subdev,
+ * @v4l2_async_notifier_add_i2c_subdev,
+ * @v4l2_async_notifier_add_devname_subdev or
+ * @v4l2_async_notifier_parse_fwnode_endpoints.
  */
 void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier);
 
@@ -290,7 +295,10 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier);
  * sub-devices allocated for the purposes of the notifier but not the notifier
  * itself. The user is responsible for calling this function to clean up the
  * notifier after calling
- * @v4l2_async_notifier_add_subdev or
+ * @v4l2_async_notifier_add_fwnode_subdev,
+ * @v4l2_async_notifier_add_fwnode_remote_subdev,
+ * @v4l2_async_notifier_add_i2c_subdev,
+ * @v4l2_async_notifier_add_devname_subdev or
  * @v4l2_async_notifier_parse_fwnode_endpoints.
  *
  * There is no harm from calling v4l2_async_notifier_cleanup in other
-- 
2.29.2

