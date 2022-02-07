Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6196A4AC57F
	for <lists+linux-media@lfdr.de>; Mon,  7 Feb 2022 17:27:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343663AbiBGQVa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Feb 2022 11:21:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387354AbiBGQLf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Feb 2022 11:11:35 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A366EC0401CC
        for <linux-media@vger.kernel.org>; Mon,  7 Feb 2022 08:11:34 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F693119F;
        Mon,  7 Feb 2022 17:11:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644250287;
        bh=ziv2H30M7dLpCKcj+ubBaqXEIgsUmh2KG/Ey7YXHrQE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sSwqlaU97I+A5MwuSpG2/Xmsys5ZysYy7O7/lK4YbHzolzbhEZ8F7IWcHHocYfQ9N
         GZMtB+xv5AkmrsW17ZnQQRlmhRfsPqWDFlzMuC/6tFypm2pdgnn5hE9VviNWgA5ny6
         lfSwEHfVf5C0Cd9GaBfGYYbZWfcEY5G+49HEncw0=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v3 4/7] media: subdev: add subdev state locking
Date:   Mon,  7 Feb 2022 18:11:04 +0200
Message-Id: <20220207161107.1166376-5-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207161107.1166376-1-tomi.valkeinen@ideasonboard.com>
References: <20220207161107.1166376-1-tomi.valkeinen@ideasonboard.com>
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

The V4L2 subdevs have managed without centralized locking for the state
(previously pad_config), as the try-state is supposedly safe (although I
believe two TRY ioctls for the same fd would race), and the
active-state, and its locking, is managed by the drivers internally.

We now have active-state in a centralized position, and need locking.
Strictly speaking the locking is only needed for new drivers that use
the new state, as the current drivers continue behaving as they used to.

Add a mutex to the struct v4l2_subdev_state, along with a few helper
functions for locking/unlocking.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c |  7 +-
 drivers/media/platform/vsp1/vsp1_entity.c   |  8 +-
 drivers/media/v4l2-core/v4l2-subdev.c       | 39 ++++++++--
 drivers/staging/media/tegra-video/vi.c      |  8 +-
 include/media/v4l2-subdev.h                 | 81 ++++++++++++++++++++-
 5 files changed, 132 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 5aae01456c04..3759f4619a77 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -255,6 +255,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 {
 	struct v4l2_subdev *sd = vin_to_source(vin);
 	struct v4l2_subdev_state *sd_state;
+	static struct lock_class_key key;
 	struct v4l2_subdev_format format = {
 		.which = which,
 		.pad = vin->parallel.source_pad,
@@ -263,7 +264,11 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 	u32 width, height;
 	int ret;
 
-	sd_state = __v4l2_subdev_state_alloc(sd);
+	/*
+	 * FIXME: Drop this call, drivers are not supposed to use
+	 * __v4l2_subdev_state_alloc().
+	 */
+	sd_state = __v4l2_subdev_state_alloc(sd, "rvin:state->lock", &key);
 	if (IS_ERR(sd_state))
 		return PTR_ERR(sd_state);
 
diff --git a/drivers/media/platform/vsp1/vsp1_entity.c b/drivers/media/platform/vsp1/vsp1_entity.c
index 869cadc1468d..a116a3362f9e 100644
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
@@ -675,7 +676,12 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
 	 * Allocate the pad configuration to store formats and selection
 	 * rectangles.
 	 */
-	entity->config = __v4l2_subdev_state_alloc(&entity->subdev);
+	/*
+	 * FIXME: Drop this call, drivers are not supposed to use
+	 * __v4l2_subdev_state_alloc().
+	 */
+	entity->config = __v4l2_subdev_state_alloc(&entity->subdev,
+						   "vsp1:config->lock", &key);
 	if (IS_ERR(entity->config)) {
 		media_entity_cleanup(&entity->subdev.entity);
 		return PTR_ERR(entity->config);
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 32598d20fe35..a30e156d5303 100644
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
 
@@ -914,7 +915,9 @@ int v4l2_subdev_link_validate(struct media_link *link)
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
 
-struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd)
+struct v4l2_subdev_state *
+__v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
+			  struct lock_class_key *lock_key)
 {
 	struct v4l2_subdev_state *state;
 	int ret;
@@ -923,6 +926,9 @@ struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd)
 	if (!state)
 		return ERR_PTR(-ENOMEM);
 
+	__mutex_init(&state->_lock, lock_name, lock_key);
+	state->lock = &state->_lock;
+
 	if (sd->entity.num_pads) {
 		state->pads = kvmalloc_array(sd->entity.num_pads,
 					     sizeof(*state->pads),
@@ -954,16 +960,19 @@ void __v4l2_subdev_state_free(struct v4l2_subdev_state *state)
 	if (!state)
 		return;
 
+	mutex_destroy(&state->_lock);
+
 	kvfree(state->pads);
 	kfree(state);
 }
 EXPORT_SYMBOL_GPL(__v4l2_subdev_state_free);
 
-int v4l2_subdev_init_finalize(struct v4l2_subdev *sd)
+int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
+				struct lock_class_key *key)
 {
 	struct v4l2_subdev_state *state;
 
-	state = __v4l2_subdev_state_alloc(sd);
+	state = __v4l2_subdev_state_alloc(sd, name, key);
 	if (IS_ERR(state))
 		return PTR_ERR(state);
 
@@ -971,7 +980,7 @@ int v4l2_subdev_init_finalize(struct v4l2_subdev *sd)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_init_finalize);
+EXPORT_SYMBOL_GPL(__v4l2_subdev_init_finalize);
 
 void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
 {
@@ -980,6 +989,26 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_cleanup);
 
+struct v4l2_subdev_state *v4l2_subdev_lock_active_state(struct v4l2_subdev *sd)
+{
+	mutex_lock(sd->active_state->lock);
+
+	return sd->active_state;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_lock_active_state);
+
+void v4l2_subdev_lock_state(struct v4l2_subdev_state *state)
+{
+	mutex_lock(state->lock);
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_lock_state);
+
+void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state)
+{
+	mutex_unlock(state->lock);
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_unlock_state);
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 void v4l2_subdev_init(struct v4l2_subdev *sd, const struct v4l2_subdev_ops *ops)
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index dc16406ff7dc..8e184aa4c252 100644
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
@@ -507,7 +508,12 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	if (!subdev)
 		return -ENODEV;
 
-	sd_state = __v4l2_subdev_state_alloc(subdev);
+	/*
+	 * FIXME: Drop this call, drivers are not supposed to use
+	 * __v4l2_subdev_state_alloc().
+	 */
+	sd_state = __v4l2_subdev_state_alloc(subdev, "tegra:state->lock",
+					     &key);
 	if (IS_ERR(sd_state))
 		return PTR_ERR(sd_state);
 	/*
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index f481fafe8e4b..e9aa38dc6489 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -658,6 +658,8 @@ struct v4l2_subdev_pad_config {
 /**
  * struct v4l2_subdev_state - Used for storing subdev state information.
  *
+ * @_lock: default for 'lock'
+ * @lock: mutex for the state. May be replaced by the user.
  * @pads: &struct v4l2_subdev_pad_config array
  *
  * This structure only needs to be passed to the pad op if the 'which' field
@@ -665,6 +667,9 @@ struct v4l2_subdev_pad_config {
  * %V4L2_SUBDEV_FORMAT_ACTIVE it is safe to pass %NULL.
  */
 struct v4l2_subdev_state {
+	/* lock for the struct v4l2_subdev_state fields */
+	struct mutex _lock;
+	struct mutex *lock;
 	struct v4l2_subdev_pad_config *pads;
 };
 
@@ -1157,10 +1162,14 @@ int v4l2_subdev_link_validate(struct media_link *link);
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
@@ -1183,7 +1192,16 @@ void __v4l2_subdev_state_free(struct v4l2_subdev_state *state);
  *
  * The user must call v4l2_subdev_cleanup() when the subdev is being removed.
  */
-int v4l2_subdev_init_finalize(struct v4l2_subdev *sd);
+#define v4l2_subdev_init_finalize(sd)                                          \
+	({                                                                     \
+		static struct lock_class_key __key;                            \
+		const char *name = KBUILD_BASENAME                             \
+			":" __stringify(__LINE__) ":sd->active_state->lock";   \
+		__v4l2_subdev_init_finalize(sd, name, &__key);                 \
+	})
+
+int __v4l2_subdev_init_finalize(struct v4l2_subdev *sd, const char *name,
+				struct lock_class_key *key);
 
 /**
  * v4l2_subdev_cleanup() - Releases the resources allocated by the subdevice
@@ -1200,14 +1218,71 @@ void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
  * @sd: The subdevice
  *
  * Returns the active state for the subdevice, or NULL if the subdev does not
- * support active state.
+ * support active state. If the state is not NULL, calls
+ * lockdep_assert_not_held() to issue a warning if the state is locked.
+ *
+ * This function is to be used e.g. when getting the active state for the sole
+ * purpose of passing it forward, without accessing the state fields.
  */
 static inline struct v4l2_subdev_state *
 v4l2_subdev_get_active_state(struct v4l2_subdev *sd)
 {
+	if (sd->active_state)
+		lockdep_assert_not_held(sd->active_state->lock);
+	return sd->active_state;
+}
+
+/**
+ * v4l2_subdev_get_locked_active_state() - Checks that the active subdev state
+ *					   is locked and returns it
+ *
+ * @sd: The subdevice
+ *
+ * Returns the active state for the subdevice, or NULL if the subdev does not
+ * support active state. If the state is not NULL, calls lockdep_assert_held()
+ * to issue a warning if the state is not locked.
+ *
+ * This function is to be used when the caller knows that the active state is
+ * already locked.
+ */
+static inline struct v4l2_subdev_state *
+v4l2_subdev_get_locked_active_state(struct v4l2_subdev *sd)
+{
+	if (sd->active_state)
+		lockdep_assert_held(sd->active_state->lock);
 	return sd->active_state;
 }
 
+/**
+ * v4l2_subdev_lock_active_state() - Locks and returns the active subdev state
+ *				     for the subdevice
+ * @sd: The subdevice
+ *
+ * Returns the locked active state for the subdevice, or NULL if the subdev
+ * does not support active state.
+ *
+ * The state must be unlocked with v4l2_subdev_unlock_state() after use.
+ */
+struct v4l2_subdev_state *v4l2_subdev_lock_active_state(struct v4l2_subdev *sd);
+
+/**
+ * v4l2_subdev_lock_state() - Locks the subdev state
+ * @state: The subdevice state
+ *
+ * Locks the given subdev state.
+ *
+ * The state must be unlocked with v4l2_subdev_unlock_state() after use.
+ */
+void v4l2_subdev_lock_state(struct v4l2_subdev_state *state);
+
+/**
+ * v4l2_subdev_unlock_state() - Unlocks the subdev state
+ * @state: The subdevice state
+ *
+ * Unlocks the given subdev state.
+ */
+void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state);
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 /**
-- 
2.25.1

