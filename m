Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02B824C8A16
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 11:56:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234267AbiCAK4x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 05:56:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbiCAK4x (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 05:56:53 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 341838AE5D
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 02:56:12 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D8EE8C4;
        Tue,  1 Mar 2022 11:56:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646132170;
        bh=le4VML06Po5Sg6D/Sk529oUZcYRA420KQTQ8MD4QXn4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NePkJqp6GnR58lgE2E47r3Me18U0agdmAOnDFCXd+mAJztmQKDcwA8BYOSdmQvUzs
         BTghunY9gYlOSuSFzGDohLqtQoch+3LqWtfnWeefKXURFAMvWK8lXctqlbap8F5Jb7
         973WAyfr2S+8EY4W2M3Z/JetGkD38JlIHqKuXlqs=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v5 2/6] media: subdev: add active state to struct v4l2_subdev
Date:   Tue,  1 Mar 2022 12:55:44 +0200
Message-Id: <20220301105548.305191-3-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301105548.305191-1-tomi.valkeinen@ideasonboard.com>
References: <20220301105548.305191-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 21 ++++++++++
 include/media/v4l2-subdev.h           | 58 +++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 376595954db0..11a06e0aca0c 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -907,6 +907,27 @@ void __v4l2_subdev_state_free(struct v4l2_subdev_state *state)
 }
 EXPORT_SYMBOL_GPL(__v4l2_subdev_state_free);
 
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
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 void v4l2_subdev_init(struct v4l2_subdev *sd, const struct v4l2_subdev_ops *ops)
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 5d6f56648ad6..1bbe4383966c 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -645,6 +645,9 @@ struct v4l2_subdev_ir_ops {
  * This structure only needs to be passed to the pad op if the 'which' field
  * of the main argument is set to %V4L2_SUBDEV_FORMAT_TRY. For
  * %V4L2_SUBDEV_FORMAT_ACTIVE it is safe to pass %NULL.
+ *
+ * Note: This struct is also used in active state, and the 'try' prefix is
+ * historical and to be removed.
  */
 struct v4l2_subdev_pad_config {
 	struct v4l2_mbus_framefmt try_fmt;
@@ -885,6 +888,9 @@ struct v4l2_subdev_platform_data {
  * @subdev_notifier: A sub-device notifier implicitly registered for the sub-
  *		     device using v4l2_async_register_subdev_sensor().
  * @pdata: common part of subdevice platform data
+ * @active_state: Active state for the subdev (NULL for subdevs tracking the
+ *		  state internally). Initialized by calling
+ *		  v4l2_subdev_init_finalize().
  *
  * Each instance of a subdev driver should create this struct, either
  * stand-alone or embedded in a larger struct.
@@ -916,6 +922,19 @@ struct v4l2_subdev {
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
+	 * TODO: active_state should most likely be changed from a pointer to an
+	 * embedded field. For the time being it's kept as a pointer to more
+	 * easily catch uses of active_state in the cases where the driver
+	 * doesn't support it.
+	 */
+	struct v4l2_subdev_state *active_state;
 };
 
 
@@ -1141,6 +1160,45 @@ struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd);
  */
 void __v4l2_subdev_state_free(struct v4l2_subdev_state *state);
 
+/**
+ * v4l2_subdev_init_finalize() - Finalizes the initialization of the subdevice
+ * @sd: The subdev
+ *
+ * This function finalizes the initialization of the subdev, including
+ * allocation of the active state for the subdev.
+ *
+ * This function must be called by the subdev drivers that use the centralized
+ * active state, after the subdev struct has been initialized and
+ * media_entity_pads_init() has been called, but before registering the
+ * subdev.
+ *
+ * The user must call v4l2_subdev_cleanup() when the subdev is being removed.
+ */
+int v4l2_subdev_init_finalize(struct v4l2_subdev *sd);
+
+/**
+ * v4l2_subdev_cleanup() - Releases the resources allocated by the subdevice
+ * @sd: The subdevice
+ *
+ * This function will release the resources allocated in
+ * v4l2_subdev_init_finalize.
+ */
+void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
+
+/**
+ * v4l2_subdev_get_active_state() - Returns the active subdev state for
+ *				    subdevice
+ * @sd: The subdevice
+ *
+ * Returns the active state for the subdevice, or NULL if the subdev does not
+ * support active state.
+ */
+static inline struct v4l2_subdev_state *
+v4l2_subdev_get_active_state(struct v4l2_subdev *sd)
+{
+	return sd->active_state;
+}
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 /**
-- 
2.25.1

