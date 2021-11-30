Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECA6B463654
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 15:16:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242085AbhK3OUK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 09:20:10 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41004 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242020AbhK3OT5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 09:19:57 -0500
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EA731447;
        Tue, 30 Nov 2021 15:16:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638281794;
        bh=L3kT7j7vU3hX8XEuyj0EMobNjrhCv0W0ff38uHUvGtA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aOYFpgIzhxtywhjgRRNP9ewO9uFtR+gz2I+LqIYxit6rcKOFUpS5vZGOGD136h7e2
         foFqWShFXebHnH3WnQ66MTipYvde7xnYonNXnfxoFZ4A+Cap0S6j/Hq79sguXcReo2
         FIEsoQe9vxqZAH6LcX2NowUdNSWP344o++Zm1ZDQ=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 02/38] media: subdev: add active state to struct v4l2_subdev
Date:   Tue, 30 Nov 2021 16:15:00 +0200
Message-Id: <20211130141536.891878-3-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a new 'active_state' field to struct v4l2_subdev to which we can
store the active state of a subdev. This will place the subdev
configuration into a known place, allowing us to use the state directly
from the v4l2 framework, thus simplifying the drivers.

Also add functions v4l2_subdev_init_finalize() and
v4l2_subdev_cleanup(), which will allocate and free the active state.
The functions are named in a generic way so that they can be also used
for other subdev initialization work.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 21 +++++++++++
 include/media/v4l2-subdev.h           | 54 +++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index fe49c86a9b02..de160140d63b 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -943,3 +943,24 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
 	v4l2_subdev_notify(sd, V4L2_DEVICE_NOTIFY_EVENT, (void *)ev);
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_notify_event);
+
+int v4l2_subdev_init_finalize(struct v4l2_subdev *sd)
+{
+	struct v4l2_subdev_state *state;
+
+	state = __v4l2_subdev_state_alloc(sd);
+	if (IS_ERR(state))
+		return PTR_ERR(state);
+
+	sd->active_state = state;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_init_finalize);
+
+void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
+{
+	__v4l2_subdev_state_free(sd->active_state);
+	sd->active_state = NULL;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index e52bf508c75b..87c3126b2754 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -645,6 +645,9 @@ struct v4l2_subdev_ir_ops {
  * This structure only needs to be passed to the pad op if the 'which' field
  * of the main argument is set to %V4L2_SUBDEV_FORMAT_TRY. For
  * %V4L2_SUBDEV_FORMAT_ACTIVE it is safe to pass %NULL.
+ *
+ * Note: This struct is also used in active state, and the try_ prefix is
+ * historical and to be removed.
  */
 struct v4l2_subdev_pad_config {
 	struct v4l2_mbus_framefmt try_fmt;
@@ -898,6 +901,8 @@ struct v4l2_subdev_platform_data {
  * @subdev_notifier: A sub-device notifier implicitly registered for the sub-
  *		     device using v4l2_async_register_subdev_sensor().
  * @pdata: common part of subdevice platform data
+ * @active_state: active state for the subdev (NULL for subdevs tracking the
+ *                state internally)
  *
  * Each instance of a subdev driver should create this struct, either
  * stand-alone or embedded in a larger struct.
@@ -929,6 +934,19 @@ struct v4l2_subdev {
 	struct v4l2_async_notifier *notifier;
 	struct v4l2_async_notifier *subdev_notifier;
 	struct v4l2_subdev_platform_data *pdata;
+
+	/*
+	 * The fields below are private, and should only be accessed via
+	 * appropriate functions.
+	 */
+
+	/*
+	 * TODO: state should most likely be changed from a pointer to an
+	 * embedded field. For the time being it's kept as a pointer to more
+	 * easily catch uses of state in the cases where the driver doesn't
+	 * support it.
+	 */
+	struct v4l2_subdev_state *active_state;
 };
 
 
@@ -1217,4 +1235,40 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
 void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
 			      const struct v4l2_event *ev);
 
+/**
+ * v4l2_subdev_init_finalize() - Finalize the initialization of the subdevice
+ * @sd: The subdev
+ *
+ * This finalizes the initialization of the subdev, including allocation of
+ * the active state for the subdev.
+ *
+ * This must be called by the subdev drivers that use the centralized active
+ * state, after the subdev struct has been initialized and
+ * media_entity_pads_init() has been called.
+ *
+ * Must call v4l2_subdev_cleanup() when the subdev is being removed.
+ */
+int v4l2_subdev_init_finalize(struct v4l2_subdev *sd);
+
+/**
+ * v4l2_subdev_cleanup() - Release the resources needed by the subdevice
+ * @sd: The subdevice
+ *
+ * This will release the resources allocated in v4l2_subdev_init_finalize.
+ */
+void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
+
+/**
+ * v4l2_subdev_get_active_state() - Return the active subdev state for subdevice
+ * @sd: The subdevice
+ *
+ * Return the active state for the subdevice, or NULL if the subdev does not
+ * support active state.
+ */
+static inline struct v4l2_subdev_state *
+v4l2_subdev_get_active_state(struct v4l2_subdev *sd)
+{
+	return sd->active_state;
+}
+
 #endif
-- 
2.25.1

