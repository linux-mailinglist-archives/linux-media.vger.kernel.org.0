Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4343FB435
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 13:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236453AbhH3LDR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 07:03:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43892 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236431AbhH3LDK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 07:03:10 -0400
Received: from deskari.lan (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 344051334;
        Mon, 30 Aug 2021 13:02:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630321334;
        bh=cKSN2obaXwMr9sCSMsqB3zSSV8if3KHpc6HmSQrLIgU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HETh2JDbAyJopwn+F9nV/If6TnGJpE00wInFbmQSkC7HEXdxY9pslIK8IrhbsXqtb
         NOlz6XZC/35SiUFjkMJNL/TgDCZI9+ItXofmThyFR/lA4jPjC0jec8Letg92p+tVFl
         XRiXsR/2mH0qS2FKaLeVl2panH4tdGRteZcN4XnI=
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
Subject: [PATCH v8 05/36] media: subdev: add subdev state locking
Date:   Mon, 30 Aug 2021 14:00:45 +0300
Message-Id: <20210830110116.488338-6-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2 subdevs have managed without centralized locking for the state
(previously pad_config), as the TRY state is supposedly safe (although I
believe two TRY ioctls for the same fd would race), and the ACTIVE
state, and its locking, is managed by the drivers internally.

We now have ACTIVE state in a centralized position, and need locking.
Strictly speaking the locking is only needed for new drivers that use
the new state, as the current drivers continue behaving as they used to.

Add a mutex to the struct v4l2_subdev_state, along with a few helper
functions for locking/unlocking.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 43 +++++++++++++++++----
 include/media/v4l2-subdev.h           | 55 +++++++++++++++++++++++++--
 2 files changed, 88 insertions(+), 10 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index b3637cddca58..b1e65488210d 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -26,9 +26,11 @@
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
 static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
 {
+	static struct lock_class_key __key;
 	struct v4l2_subdev_state *state;
 
-	state = v4l2_alloc_subdev_state(sd, V4L2_SUBDEV_FORMAT_TRY);
+	state = __v4l2_alloc_subdev_state(sd, V4L2_SUBDEV_FORMAT_TRY,
+					  "v4l2_subdev_fh->state", &__key);
 	if (IS_ERR(state))
 		return PTR_ERR(state);
 
@@ -924,8 +926,10 @@ int v4l2_subdev_link_validate(struct media_link *link)
 EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
 
 struct v4l2_subdev_state *
-v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
-			enum v4l2_subdev_format_whence which)
+__v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
+			  enum v4l2_subdev_format_whence which,
+			  const char *lock_name,
+			  struct lock_class_key *lock_key)
 {
 	struct v4l2_subdev_state *state;
 	int ret;
@@ -934,6 +938,8 @@ v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
 	if (!state)
 		return ERR_PTR(-ENOMEM);
 
+	__mutex_init(&state->lock, lock_name, lock_key);
+
 	state->which = which;
 
 	if (sd->entity.num_pads) {
@@ -960,13 +966,15 @@ v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
 
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_GPL(v4l2_alloc_subdev_state);
+EXPORT_SYMBOL_GPL(__v4l2_alloc_subdev_state);
 
 void v4l2_free_subdev_state(struct v4l2_subdev_state *state)
 {
 	if (!state)
 		return;
 
+	mutex_destroy(&state->lock);
+
 	kvfree(state->pads);
 	kfree(state);
 }
@@ -1001,11 +1009,12 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_notify_event);
 
-int v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
+int __v4l2_subdev_alloc_state(struct v4l2_subdev *sd, const char *name,
+			      struct lock_class_key *key)
 {
 	struct v4l2_subdev_state *state;
 
-	state = v4l2_alloc_subdev_state(sd, V4L2_SUBDEV_FORMAT_ACTIVE);
+	state = __v4l2_alloc_subdev_state(sd, V4L2_SUBDEV_FORMAT_ACTIVE, name, key);
 	if (IS_ERR(state))
 		return PTR_ERR(state);
 
@@ -1013,7 +1022,7 @@ int v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_alloc_state);
+EXPORT_SYMBOL_GPL(__v4l2_subdev_alloc_state);
 
 void v4l2_subdev_free_state(struct v4l2_subdev *sd)
 {
@@ -1021,3 +1030,23 @@ void v4l2_subdev_free_state(struct v4l2_subdev *sd)
 	sd->state = NULL;
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_free_state);
+
+struct v4l2_subdev_state *v4l2_subdev_lock_active_state(struct v4l2_subdev *sd)
+{
+	mutex_lock(&sd->state->lock);
+
+	return sd->state;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_lock_active_state);
+
+void v4l2_subdev_lock_state(struct v4l2_subdev_state *state)
+{
+	mutex_lock(&state->lock);
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_lock_state);
+
+void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state)
+{
+	mutex_unlock(&state->lock);
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_unlock_state);
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 5ec78ffda4f5..52a725281b23 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -655,6 +655,7 @@ struct v4l2_subdev_pad_config {
 /**
  * struct v4l2_subdev_state - Used for storing subdev state information.
  *
+ * @lock: mutex for the state
  * @which: state type (from enum v4l2_subdev_format_whence)
  * @pads: &struct v4l2_subdev_pad_config array
  *
@@ -663,6 +664,7 @@ struct v4l2_subdev_pad_config {
  * %V4L2_SUBDEV_FORMAT_ACTIVE it is safe to pass %NULL.
  */
 struct v4l2_subdev_state {
+	struct mutex lock;
 	u32 which;
 	struct v4l2_subdev_pad_config *pads;
 };
@@ -1147,9 +1149,18 @@ int v4l2_subdev_link_validate(struct media_link *link);
  *
  * Must call v4l2_free_subdev_state() when state is no longer needed.
  */
+#define v4l2_alloc_subdev_state(sd, which)                                     \
+	({                                                                     \
+		static struct lock_class_key __key;                            \
+		const char *name = KBUILD_BASENAME                             \
+			":" __stringify(__LINE__) ":sd->state->lock";          \
+		__v4l2_alloc_subdev_state(sd, which, name, &__key);            \
+	})
+
 struct v4l2_subdev_state *
-v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
-			enum v4l2_subdev_format_whence which);
+__v4l2_alloc_subdev_state(struct v4l2_subdev *sd,
+			  enum v4l2_subdev_format_whence which,
+			  const char *lock_name, struct lock_class_key *key);
 
 /**
  * v4l2_free_subdev_state - free a v4l2_subdev_state
@@ -1234,7 +1245,16 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
  *
  * Must call v4l2_subdev_free_state() when the state is no longer needed.
  */
-int v4l2_subdev_alloc_state(struct v4l2_subdev *sd);
+#define v4l2_subdev_alloc_state(sd)                                            \
+	({                                                                     \
+		static struct lock_class_key __key;                            \
+		const char *name = KBUILD_BASENAME                             \
+			":" __stringify(__LINE__) ":sd->state->lock";          \
+		__v4l2_subdev_alloc_state(sd, name, &__key);                   \
+	})
+
+int __v4l2_subdev_alloc_state(struct v4l2_subdev *sd, const char *name,
+			      struct lock_class_key *key);
 
 /**
  * v4l2_subdev_free_state() - Free the active subdev state for subdevice
@@ -1258,4 +1278,33 @@ v4l2_subdev_get_active_state(struct v4l2_subdev *sd)
 	return sd->state;
 }
 
+/**
+ * v4l2_subdev_lock_active_state() - Lock and return the active subdev state for subdevice
+ * @sd: The subdevice
+ *
+ * Return the locked active state for the subdevice, or NULL if the subdev
+ * does not support active state.
+ *
+ * Must be unlocked with v4l2_subdev_unlock_state() after use.
+ */
+struct v4l2_subdev_state *v4l2_subdev_lock_active_state(struct v4l2_subdev *sd);
+
+/**
+ * v4l2_subdev_lock_state() - Lock the subdev state
+ * @state: The subdevice state
+ *
+ * Lock the given subdev state.
+ *
+ * Must be unlocked with v4l2_subdev_unlock_state() after use.
+ */
+void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
+
+/**
+ * v4l2_subdev_unlock_state() - Unlock the subdev state
+ * @state: The subdevice state
+ *
+ * Unlock the given subdev state.
+ */
+void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);
+
 #endif
-- 
2.25.1

