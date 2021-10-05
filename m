Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEA3E422164
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 10:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233071AbhJEJAJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 05:00:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60730 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232985AbhJEJAI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 05:00:08 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 872EFB91;
        Tue,  5 Oct 2021 10:58:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633424296;
        bh=ytf3wt7FU0kzb62GmoTfHFfUI8ijCEz3n9IlUWELszA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b44QEl21oyeYOGeEsKt4Q2SdMYfMJ4SPMbqW03EYgnmZgO7FZ2K8BTLQJSyp3eLyZ
         lxdV9Ya0mZdOyaxWj+vY86CMSVPpWl+p3NE0MP6TEU0QV6DEM6uHpCvJDfLVXsezsi
         CFkKcB3nXyYa6hiBBSQX8+UKkRUWCFwVopmZNnus=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH v9 02/36] media: subdev: add active state to struct v4l2_subdev
Date:   Tue,  5 Oct 2021 11:57:16 +0300
Message-Id: <20211005085750.138151-3-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a new 'state' field to struct v4l2_subdev to which we can store the
active state of a subdev. This will place the subdev configuration into
a known place, allowing us to use the state directly from the v4l2
framework, thus simplifying the drivers.

Also add functions v4l2_subdev_init_finalize() and
v4l2_subdev_cleanup(), which will allocate and free the active state.
The functions are named in a generic way so that they can be also used
for other subdev initialization work.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 21 +++++++++++
 include/media/v4l2-subdev.h           | 51 +++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index fe49c86a9b02..bcaf66a1e3d9 100644
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
+	sd->state = state;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_init_finalize);
+
+void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
+{
+	__v4l2_subdev_state_free(sd->state);
+	sd->state = NULL;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index e52bf508c75b..3aaa7146e5ff 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -898,6 +898,8 @@ struct v4l2_subdev_platform_data {
  * @subdev_notifier: A sub-device notifier implicitly registered for the sub-
  *		     device using v4l2_async_register_subdev_sensor().
  * @pdata: common part of subdevice platform data
+ * @state: active state for the subdev (NULL for subdevs tracking the state
+ *	   internally)
  *
  * Each instance of a subdev driver should create this struct, either
  * stand-alone or embedded in a larger struct.
@@ -929,6 +931,19 @@ struct v4l2_subdev {
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
+	struct v4l2_subdev_state *state;
 };
 
 
@@ -1217,4 +1232,40 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
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
+	return sd->state;
+}
+
 #endif
-- 
2.25.1

