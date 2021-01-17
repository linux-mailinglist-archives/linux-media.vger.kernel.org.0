Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 987AB2F94A6
	for <lists+linux-media@lfdr.de>; Sun, 17 Jan 2021 19:33:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730017AbhAQSdo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jan 2021 13:33:44 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59996 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729977AbhAQSdf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jan 2021 13:33:35 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id E14161F44A30
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mickael Guene <mickael.guene@st.com>,
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
Subject: [PATCH v2 12/14] media: Clarify v4l2-async subdevice addition API
Date:   Sun, 17 Jan 2021 15:29:54 -0300
Message-Id: <20210117182956.41298-23-ezequiel@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117182956.41298-1-ezequiel@collabora.com>
References: <20210117182956.41298-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that most users of v4l2_async_notifier_add_subdev have
been converted, let's fix the documentation so it's more clear
how the v4l2-async API should be used.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../driver-api/media/v4l2-subdev.rst          | 38 ++++++++++++++++---
 include/media/v4l2-async.h                    | 11 ++++--
 2 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
index bb5b1a7cdfd9..47a70538d758 100644
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
index d2af7a5aef4c..3622ea938360 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -128,7 +128,11 @@ void v4l2_async_debug_init(struct dentry *debugfs_dir);
  * @notifier: pointer to &struct v4l2_async_notifier
  *
  * This function initializes the notifier @asd_list. It must be called
- * before the first call to @v4l2_async_notifier_add_subdev.
+ * before adding a subdevice to a notifier, using one of:
+ * @v4l2_async_notifier_add_i2c_subdev,
+ * @v4l2_async_notifier_add_fwnode_subdev,
+ * @v4l2_async_notifier_add_fwnode_remote_subdev or
+ * @v4l2_async_notifier_parse_fwnode_sensor_common.
  */
 void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier);
 
@@ -248,8 +252,9 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier);
  * sub-devices allocated for the purposes of the notifier but not the notifier
  * itself. The user is responsible for calling this function to clean up the
  * notifier after calling
- * @v4l2_async_notifier_add_subdev,
- * @v4l2_async_notifier_parse_fwnode_endpoints or
+ * @v4l2_async_notifier_add_i2c_subdev,
+ * @v4l2_async_notifier_add_fwnode_subdev,
+ * @v4l2_async_notifier_add_fwnode_remote_subdev or
  * @v4l2_async_notifier_parse_fwnode_sensor_common.
  *
  * There is no harm from calling v4l2_async_notifier_cleanup in other
-- 
2.29.2

