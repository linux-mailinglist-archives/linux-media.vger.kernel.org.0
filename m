Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B60403FB432
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 13:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236415AbhH3LDI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 07:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235818AbhH3LDH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 07:03:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3301AC061575
        for <linux-media@vger.kernel.org>; Mon, 30 Aug 2021 04:02:14 -0700 (PDT)
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 807C9B7E;
        Mon, 30 Aug 2021 13:02:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630321332;
        bh=TqC8KE4m6EQXQb81jhWD4hKKuzOiVDbnOxQvEHkZcXI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vgIJnoBbQhY53dML8E+kTEvVsbXnYuUB8lPXdxQVVqeL97ZdNsYsdPPleyGQqdZdk
         9+RJcuxUCRpk58epvUk0ImyvSTKRw93FT1GJE/lQVPnkpo8IjBqcoC/kFr1ztkY4Wf
         KF2iKobkWNO20JkNfLjfVKeZWR11rKAZquDEPl1U=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v8 02/36] media: subdev: add active state to struct v4l2_subdev
Date:   Mon, 30 Aug 2021 14:00:42 +0300
Message-Id: <20210830110116.488338-3-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a new 'state' field to struct v4l2_subdev to which we can store the
active state of a subdev. This will place the subdev configuration into
a known place, allowing us to use the state directly from the v4l2
framework, thus simplifying the drivers.

We also add v4l2_subdev_alloc_state() and v4l2_subdev_free_state(),
which need to be used by the drivers that support subdev state in struct
v4l2_subdev.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 21 ++++++++++++++++
 include/media/v4l2-subdev.h           | 36 +++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 26a34a8e3d37..e1a794f69815 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -943,3 +943,24 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
 	v4l2_subdev_notify(sd, V4L2_DEVICE_NOTIFY_EVENT, (void *)ev);
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_notify_event);
+
+int v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
+{
+	struct v4l2_subdev_state *state;
+
+	state = v4l2_alloc_subdev_state(sd);
+	if (IS_ERR(state))
+		return PTR_ERR(state);
+
+	sd->state = state;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_alloc_state);
+
+void v4l2_subdev_free_state(struct v4l2_subdev *sd)
+{
+	v4l2_free_subdev_state(sd->state);
+	sd->state = NULL;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_free_state);
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 8701d2e7d893..ecaf040ead57 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -898,6 +898,8 @@ struct v4l2_subdev_platform_data {
  * @subdev_notifier: A sub-device notifier implicitly registered for the sub-
  *		     device using v4l2_async_register_subdev_sensor().
  * @pdata: common part of subdevice platform data
+ * @state: active state for the subdev (NULL for subdevs tracking the state
+ * 	   internally)
  *
  * Each instance of a subdev driver should create this struct, either
  * stand-alone or embedded in a larger struct.
@@ -929,6 +931,7 @@ struct v4l2_subdev {
 	struct v4l2_async_notifier *notifier;
 	struct v4l2_async_notifier *subdev_notifier;
 	struct v4l2_subdev_platform_data *pdata;
+	struct v4l2_subdev_state *state;
 };
 
 
@@ -1217,4 +1220,37 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
 void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
 			      const struct v4l2_event *ev);
 
+/**
+ * v4l2_subdev_alloc_state() - Allocate active subdev state for subdevice
+ * @sd: The subdev for which the state is allocated
+ *
+ * This will allocate a subdev state and store it to
+ * &struct v4l2_subdev->state.
+ *
+ * Must call v4l2_subdev_free_state() when the state is no longer needed.
+ */
+int v4l2_subdev_alloc_state(struct v4l2_subdev *sd);
+
+/**
+ * v4l2_subdev_free_state() - Free the active subdev state for subdevice
+ * @sd: The subdevice
+ *
+ * This will free the subdev's state and set
+ * &struct v4l2_subdev->state to NULL.
+ */
+void v4l2_subdev_free_state(struct v4l2_subdev *sd);
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

