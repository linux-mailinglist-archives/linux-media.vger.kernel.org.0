Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C46C4FDCEB
	for <lists+linux-media@lfdr.de>; Tue, 12 Apr 2022 13:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352276AbiDLKsF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Apr 2022 06:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356964AbiDLKpr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Apr 2022 06:45:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A43A5F4EF
        for <linux-media@vger.kernel.org>; Tue, 12 Apr 2022 02:43:26 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6871741;
        Tue, 12 Apr 2022 11:43:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1649756602;
        bh=ycZ+9EvrhKxvhcLD7FGGkgrdRszuXNJkAc77xz5cgWQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vCSOiN42dOfDfol42BhfmM9qrq1fN7lrT4qrcPhjMTyObXOW/l/eljrerphCEW6B8
         0aXzbBHpU8GnuqnmvSytbskNrG9tExcMRV+FD2oO8IBTfXNPJCSmp64Y2DCTB1ijKf
         1ajR/25Df9qYAZCkJEScoRkkjcE1sLRJwnPy3C7M=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>, satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v8 04/10] media: subdev: add active state to struct v4l2_subdev
Date:   Tue, 12 Apr 2022 12:42:43 +0300
Message-Id: <20220412094249.695754-5-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412094249.695754-1-tomi.valkeinen@ideasonboard.com>
References: <20220412094249.695754-1-tomi.valkeinen@ideasonboard.com>
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
index a1494999352b..5ac447b3038c 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -906,6 +906,27 @@ void __v4l2_subdev_state_free(struct v4l2_subdev_state *state)
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
index ac3bcc54ea07..d0d0e4caf893 100644
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

