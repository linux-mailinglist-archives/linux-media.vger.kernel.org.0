Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7481463656
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 15:16:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242101AbhK3OUN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 09:20:13 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41006 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242088AbhK3OT6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 09:19:58 -0500
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA3D414E2;
        Tue, 30 Nov 2021 15:16:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1638281796;
        bh=+lWAo3U4MoL31FoXh1DRpmSao4uSlJ3yMW01u1OW1Jk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WSK7Bcai50EpEF3TizVFAsWgiiWmHsGG3w0QP5cHoSrWm1tv6bKogZ6A+2en7HvEn
         CXX/wJcY9thS8UXhdM0aULMp+Uqd58KGFOAI8NPGWSgRE6rDHaDH27w5b02VSBo1Ly
         jPiCNiXZljqruSiNyCdWbnbxkv7OFo6vz0vbDWgY=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 04/38] media: subdev: add subdev state locking
Date:   Tue, 30 Nov 2021 16:15:02 +0200
Message-Id: <20211130141536.891878-5-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
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
 drivers/media/platform/rcar-vin/rcar-v4l2.c |  3 +-
 drivers/media/platform/vsp1/vsp1_entity.c   |  4 +-
 drivers/media/v4l2-core/v4l2-subdev.c       | 38 +++++++++++++---
 drivers/staging/media/tegra-video/vi.c      |  4 +-
 include/media/v4l2-subdev.h                 | 50 ++++++++++++++++++++-
 5 files changed, 89 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index ba1d16ab1651..e6bd94d63e4f 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -244,6 +244,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 {
 	struct v4l2_subdev *sd = vin_to_source(vin);
 	struct v4l2_subdev_state *sd_state;
+	static struct lock_class_key key;
 	struct v4l2_subdev_format format = {
 		.which = which,
 		.pad = vin->parallel.source_pad,
@@ -252,7 +253,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 	u32 width, height;
 	int ret;
 
-	sd_state = __v4l2_subdev_state_alloc(sd);
+	sd_state = __v4l2_subdev_state_alloc(sd, "rvin:state->lock", &key);
 	if (IS_ERR(sd_state))
 		return PTR_ERR(sd_state);
 
diff --git a/drivers/media/platform/vsp1/vsp1_entity.c b/drivers/media/platform/vsp1/vsp1_entity.c
index 869cadc1468d..e607c3ae2520 100644
--- a/drivers/media/platform/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/vsp1/vsp1_entity.c
@@ -613,6 +613,7 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
 		     const char *name, unsigned int num_pads,
 		     const struct v4l2_subdev_ops *ops, u32 function)
 {
+	static struct lock_class_key key;
 	struct v4l2_subdev *subdev;
 	unsigned int i;
 	int ret;
@@ -675,7 +676,8 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
 	 * Allocate the pad configuration to store formats and selection
 	 * rectangles.
 	 */
-	entity->config = __v4l2_subdev_state_alloc(&entity->subdev);
+	entity->config = __v4l2_subdev_state_alloc(&entity->subdev,
+						   "vsp1:config->lock", &key);
 	if (IS_ERR(entity->config)) {
 		media_entity_cleanup(&entity->subdev.entity);
 		return PTR_ERR(entity->config);
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 3289875d9ec1..2053fe1cd67d 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -27,8 +27,9 @@
 static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
 {
 	struct v4l2_subdev_state *state;
+	static struct lock_class_key key;
 
-	state = __v4l2_subdev_state_alloc(sd);
+	state = __v4l2_subdev_state_alloc(sd, "fh->state->lock", &key);
 	if (IS_ERR(state))
 		return PTR_ERR(state);
 
@@ -923,7 +924,9 @@ int v4l2_subdev_link_validate(struct media_link *link)
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
 
-struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd)
+struct v4l2_subdev_state *
+__v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
+			  struct lock_class_key *lock_key)
 {
 	struct v4l2_subdev_state *state;
 	int ret;
@@ -932,6 +935,8 @@ struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd)
 	if (!state)
 		return ERR_PTR(-ENOMEM);
 
+	__mutex_init(&state->lock, lock_name, lock_key);
+
 	if (sd->entity.num_pads) {
 		state->pads = kvmalloc_array(sd->entity.num_pads,
 					     sizeof(*state->pads),
@@ -963,6 +968,8 @@ void __v4l2_subdev_state_free(struct v4l2_subdev_state *state)
 	if (!state)
 		return;
 
+	mutex_destroy(&state->lock);
+
 	kvfree(state->pads);
 	kfree(state);
 }
@@ -997,11 +1004,12 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_notify_event);
 
-int v4l2_subdev_init_finalize(struct v4l2_subdev *sd)
+int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
+				struct lock_class_key *key)
 {
 	struct v4l2_subdev_state *state;
 
-	state = __v4l2_subdev_state_alloc(sd);
+	state = __v4l2_subdev_state_alloc(sd, name, key);
 	if (IS_ERR(state))
 		return PTR_ERR(state);
 
@@ -1009,7 +1017,7 @@ int v4l2_subdev_init_finalize(struct v4l2_subdev *sd)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_init_finalize);
+EXPORT_SYMBOL_GPL(__v4l2_subdev_init_finalize);
 
 void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
 {
@@ -1017,3 +1025,23 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
 	sd->active_state = NULL;
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
+
+struct v4l2_subdev_state *v4l2_subdev_lock_active_state(struct v4l2_subdev *sd)
+{
+	mutex_lock(&sd->active_state->lock);
+
+	return sd->active_state;
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
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 66b9ce160472..3516735f0cad 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -491,6 +491,7 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 				      struct v4l2_pix_format *pix)
 {
 	const struct tegra_video_format *fmtinfo;
+	static struct lock_class_key key;
 	struct v4l2_subdev *subdev;
 	struct v4l2_subdev_format fmt;
 	struct v4l2_subdev_state *sd_state;
@@ -507,7 +508,8 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	if (!subdev)
 		return -ENODEV;
 
-	sd_state = __v4l2_subdev_state_alloc(subdev);
+	sd_state = __v4l2_subdev_state_alloc(subdev, "tegra:state->lock",
+					     &key);
 	if (IS_ERR(sd_state))
 		return PTR_ERR(sd_state);
 	/*
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 87c3126b2754..1810dde9c7fc 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -658,6 +658,7 @@ struct v4l2_subdev_pad_config {
 /**
  * struct v4l2_subdev_state - Used for storing subdev state information.
  *
+ * @lock: mutex for the state
  * @pads: &struct v4l2_subdev_pad_config array
  *
  * This structure only needs to be passed to the pad op if the 'which' field
@@ -665,6 +666,8 @@ struct v4l2_subdev_pad_config {
  * %V4L2_SUBDEV_FORMAT_ACTIVE it is safe to pass %NULL.
  */
 struct v4l2_subdev_state {
+	/* lock for the struct v4l2_subdev_state fields */
+	struct mutex lock;
 	struct v4l2_subdev_pad_config *pads;
 };
 
@@ -1156,10 +1159,14 @@ int v4l2_subdev_link_validate(struct media_link *link);
  * __v4l2_subdev_state_alloc - allocate v4l2_subdev_state
  *
  * @sd: pointer to &struct v4l2_subdev for which the state is being allocated.
+ * @lock_name: name of the state lock
+ * @key: lock_class_key for the lock
  *
  * Must call __v4l2_subdev_state_free() when state is no longer needed.
  */
-struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd);
+struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd,
+						    const char *lock_name,
+						    struct lock_class_key *key);
 
 /**
  * __v4l2_subdev_state_free - free a v4l2_subdev_state
@@ -1248,7 +1255,16 @@ void v4l2_subdev_notify_event(struct v4l2_subdev *sd,
  *
  * Must call v4l2_subdev_cleanup() when the subdev is being removed.
  */
-int v4l2_subdev_init_finalize(struct v4l2_subdev *sd);
+#define v4l2_subdev_init_finalize(sd)                                          \
+	({                                                                     \
+		static struct lock_class_key __key;                            \
+		const char *name = KBUILD_BASENAME                             \
+			":" __stringify(__LINE__) ":subdev->state->lock";      \
+		__v4l2_subdev_init_finalize(sd, name, &__key);                 \
+	})
+
+int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
+				struct lock_class_key *key);
 
 /**
  * v4l2_subdev_cleanup() - Release the resources needed by the subdevice
@@ -1271,4 +1287,34 @@ v4l2_subdev_get_active_state(struct v4l2_subdev *sd)
 	return sd->active_state;
 }
 
+/**
+ * v4l2_subdev_lock_active_state() - Lock and return the active subdev state for
+ *				     subdevice
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

