Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06CBA2F977F
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 02:55:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730878AbhARBz3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Jan 2021 20:55:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730964AbhARBzZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Jan 2021 20:55:25 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE992C061574
        for <linux-media@vger.kernel.org>; Sun, 17 Jan 2021 17:54:44 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 1739D1F44A2E
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
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
Date:   Sun, 17 Jan 2021 22:52:56 -0300
Message-Id: <20210118015258.3993-13-ezequiel@collabora.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118015258.3993-1-ezequiel@collabora.com>
References: <20210118015258.3993-1-ezequiel@collabora.com>
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
index 2144502c95e0..7b45427aafb5 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -120,7 +120,11 @@ struct v4l2_async_notifier {
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
 
@@ -240,8 +244,9 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier);
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

