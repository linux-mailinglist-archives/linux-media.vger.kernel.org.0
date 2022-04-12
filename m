Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8DBF4FDD15
	for <lists+linux-media@lfdr.de>; Tue, 12 Apr 2022 13:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356957AbiDLK4i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Apr 2022 06:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356975AbiDLKpr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Apr 2022 06:45:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F8CB5F279
        for <linux-media@vger.kernel.org>; Tue, 12 Apr 2022 02:43:29 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D24FD02;
        Tue, 12 Apr 2022 11:43:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1649756605;
        bh=iEdOcx/9tf5trnHyobdsO0lXbhy46ZfHhzL8jeRRobU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WaSMVgHT8J63WCshpD78Wxi8uSz6A0bQ7/Ih/yJdrWB3mpHhhkqJyCQc46Xl+/UVI
         0VyufwxyqKEakJlcQrVESyQc/mTg+0j6CCNcmamhl6RKROiSHs1A7nbrdqjCu81nVw
         lrQf52PX/XlpgpLNtuPTTLwy3k1LfhtNbKtyJl3g=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>, satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v8 07/10] media: subdev: add subdev state locking
Date:   Tue, 12 Apr 2022 12:42:46 +0300
Message-Id: <20220412094249.695754-8-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412094249.695754-1-tomi.valkeinen@ideasonboard.com>
References: <20220412094249.695754-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_FILL_THIS_FORM_SHORT,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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

However, active-state locking is complicated by the fact that currently
the real active-state of a subdev is split into multiple parts: the new
v4l2_subdev_state, subdev control state, and subdev's internal state.

In the future all these three states should be combined into one state
(the v4l2_subdev_state), and then a single lock for the state should be
sufficient.

But to solve the current split-state situation we need to share locks
between the three states. This is accomplished by using the same lock
management as the control handler does: we use a pointer to a mutex,
allowing the driver to override the default mutex. Thus the driver can
do e.g.:

sd->state_lock = sd->ctrl_handler->lock;

before calling v4l2_subdev_init_finalize(), resulting in sharing the
same lock between the states and the controls.

The locking model for active-state is such that any subdev op that gets
the state as a parameter expects the state to be already locked by the
caller, and expects the caller to release the lock.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../platform/renesas/rcar-vin/rcar-v4l2.c     |   3 +-
 .../media/platform/renesas/vsp1/vsp1_entity.c |   4 +-
 drivers/media/v4l2-core/v4l2-subdev.c         |  63 ++++++---
 drivers/staging/media/tegra-video/vi.c        |   4 +-
 include/media/v4l2-subdev.h                   | 133 +++++++++++++++++-
 5 files changed, 181 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
index da88f968c31a..3759f4619a77 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
@@ -255,6 +255,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 {
 	struct v4l2_subdev *sd = vin_to_source(vin);
 	struct v4l2_subdev_state *sd_state;
+	static struct lock_class_key key;
 	struct v4l2_subdev_format format = {
 		.which = which,
 		.pad = vin->parallel.source_pad,
@@ -267,7 +268,7 @@ static int rvin_try_format(struct rvin_dev *vin, u32 which,
 	 * FIXME: Drop this call, drivers are not supposed to use
 	 * __v4l2_subdev_state_alloc().
 	 */
-	sd_state = __v4l2_subdev_state_alloc(sd);
+	sd_state = __v4l2_subdev_state_alloc(sd, "rvin:state->lock", &key);
 	if (IS_ERR(sd_state))
 		return PTR_ERR(sd_state);
 
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index c82b3fb7b89a..a116a3362f9e 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -613,6 +613,7 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
 		     const char *name, unsigned int num_pads,
 		     const struct v4l2_subdev_ops *ops, u32 function)
 {
+	static struct lock_class_key key;
 	struct v4l2_subdev *subdev;
 	unsigned int i;
 	int ret;
@@ -679,7 +680,8 @@ int vsp1_entity_init(struct vsp1_device *vsp1, struct vsp1_entity *entity,
 	 * FIXME: Drop this call, drivers are not supposed to use
 	 * __v4l2_subdev_state_alloc().
 	 */
-	entity->config = __v4l2_subdev_state_alloc(&entity->subdev);
+	entity->config = __v4l2_subdev_state_alloc(&entity->subdev,
+						   "vsp1:config->lock", &key);
 	if (IS_ERR(entity->config)) {
 		media_entity_cleanup(&entity->subdev.entity);
 		return PTR_ERR(entity->config);
diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 8f09b1175ef9..47d480786f03 100644
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
 
@@ -379,21 +380,18 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
 
 	return which == V4L2_SUBDEV_FORMAT_TRY ?
 			     subdev_fh->state :
-			     v4l2_subdev_get_active_state(sd);
+			     v4l2_subdev_get_unlocked_active_state(sd);
 }
 
-static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
+static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
+			    struct v4l2_subdev_state *state)
 {
 	struct video_device *vdev = video_devdata(file);
 	struct v4l2_subdev *sd = vdev_to_v4l2_subdev(vdev);
 	struct v4l2_fh *vfh = file->private_data;
-	struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
 	bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
-	struct v4l2_subdev_state *state;
 	int rval;
 
-	state = subdev_ioctl_get_state(sd, subdev_fh, cmd, arg);
-
 	switch (cmd) {
 	case VIDIOC_SUBDEV_QUERYCAP: {
 		struct v4l2_subdev_capability *cap = arg;
@@ -706,8 +704,24 @@ static long subdev_do_ioctl_lock(struct file *file, unsigned int cmd, void *arg)
 
 	if (lock && mutex_lock_interruptible(lock))
 		return -ERESTARTSYS;
-	if (video_is_registered(vdev))
-		ret = subdev_do_ioctl(file, cmd, arg);
+
+	if (video_is_registered(vdev)) {
+		struct v4l2_subdev *sd = vdev_to_v4l2_subdev(vdev);
+		struct v4l2_fh *vfh = file->private_data;
+		struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
+		struct v4l2_subdev_state *state;
+
+		state = subdev_ioctl_get_state(sd, subdev_fh, cmd, arg);
+
+		if (state)
+			v4l2_subdev_lock_state(state);
+
+		ret = subdev_do_ioctl(file, cmd, arg, state);
+
+		if (state)
+			v4l2_subdev_unlock_state(state);
+	}
+
 	if (lock)
 		mutex_unlock(lock);
 	return ret;
@@ -861,13 +875,10 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
 	if (is_media_entity_v4l2_subdev(pad->entity)) {
 		struct v4l2_subdev *sd =
 			media_entity_to_v4l2_subdev(pad->entity);
-		struct v4l2_subdev_state *state;
-
-		state = v4l2_subdev_get_active_state(sd);
 
 		fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
 		fmt->pad = pad->index;
-		return v4l2_subdev_call(sd, pad, get_fmt, state, fmt);
+		return v4l2_subdev_call_state_active(sd, pad, get_fmt, fmt);
 	}
 
 	WARN(pad->entity->function != MEDIA_ENT_F_IO_V4L,
@@ -905,7 +916,9 @@ int v4l2_subdev_link_validate(struct media_link *link)
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
 
-struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd)
+struct v4l2_subdev_state *
+__v4l2_subdev_state_alloc(struct v4l2_subdev *sd, const char *lock_name,
+			  struct lock_class_key *lock_key)
 {
 	struct v4l2_subdev_state *state;
 	int ret;
@@ -914,6 +927,12 @@ struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd)
 	if (!state)
 		return ERR_PTR(-ENOMEM);
 
+	__mutex_init(&state->_lock, lock_name, lock_key);
+	if (sd->state_lock)
+		state->lock = sd->state_lock;
+	else
+		state->lock = &state->_lock;
+
 	if (sd->entity.num_pads) {
 		state->pads = kvmalloc_array(sd->entity.num_pads,
 					     sizeof(*state->pads),
@@ -924,7 +943,14 @@ struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd)
 		}
 	}
 
+	/*
+	 * There can be no race at this point, but we lock the state anyway to
+	 * satisfy lockdep checks.
+	 */
+	v4l2_subdev_lock_state(state);
 	ret = v4l2_subdev_call(sd, pad, init_cfg, state);
+	v4l2_subdev_unlock_state(state);
+
 	if (ret < 0 && ret != -ENOIOCTLCMD)
 		goto err;
 
@@ -945,16 +971,19 @@ void __v4l2_subdev_state_free(struct v4l2_subdev_state *state)
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
 
@@ -962,7 +991,7 @@ int v4l2_subdev_init_finalize(struct v4l2_subdev *sd)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(v4l2_subdev_init_finalize);
+EXPORT_SYMBOL_GPL(__v4l2_subdev_init_finalize);
 
 void v4l2_subdev_cleanup(struct v4l2_subdev *sd)
 {
diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 07d368f345cd..8e184aa4c252 100644
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
@@ -511,7 +512,8 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	 * FIXME: Drop this call, drivers are not supposed to use
 	 * __v4l2_subdev_state_alloc().
 	 */
-	sd_state = __v4l2_subdev_state_alloc(subdev);
+	sd_state = __v4l2_subdev_state_alloc(subdev, "tegra:state->lock",
+					     &key);
 	if (IS_ERR(sd_state))
 		return PTR_ERR(sd_state);
 	/*
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index eab8e4342613..f967c27e41c3 100644
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
 
@@ -888,6 +893,9 @@ struct v4l2_subdev_platform_data {
  * @subdev_notifier: A sub-device notifier implicitly registered for the sub-
  *		     device using v4l2_async_register_subdev_sensor().
  * @pdata: common part of subdevice platform data
+ * @state_lock: A pointer to a lock used for all the subdev's states, set by the
+ *		driver. This is	optional. If NULL, each state instance will get
+ *		a lock of its own.
  * @active_state: Active state for the subdev (NULL for subdevs tracking the
  *		  state internally). Initialized by calling
  *		  v4l2_subdev_init_finalize().
@@ -922,6 +930,7 @@ struct v4l2_subdev {
 	struct v4l2_async_notifier *notifier;
 	struct v4l2_async_notifier *subdev_notifier;
 	struct v4l2_subdev_platform_data *pdata;
+	struct mutex *state_lock;
 
 	/*
 	 * The fields below are private, and should only be accessed via
@@ -1157,12 +1166,16 @@ int v4l2_subdev_link_validate(struct media_link *link);
  * __v4l2_subdev_state_alloc - allocate v4l2_subdev_state
  *
  * @sd: pointer to &struct v4l2_subdev for which the state is being allocated.
+ * @lock_name: name of the state lock
+ * @key: lock_class_key for the lock
  *
  * Must call __v4l2_subdev_state_free() when state is no longer needed.
  *
  * Not to be called directly by the drivers.
  */
-struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd);
+struct v4l2_subdev_state *__v4l2_subdev_state_alloc(struct v4l2_subdev *sd,
+						    const char *lock_name,
+						    struct lock_class_key *key);
 
 /**
  * __v4l2_subdev_state_free - free a v4l2_subdev_state
@@ -1187,7 +1200,16 @@ void __v4l2_subdev_state_free(struct v4l2_subdev_state *state);
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
@@ -1199,16 +1221,85 @@ int v4l2_subdev_init_finalize(struct v4l2_subdev *sd);
 void v4l2_subdev_cleanup(struct v4l2_subdev *sd);
 
 /**
- * v4l2_subdev_get_active_state() - Returns the active subdev state for
- *				    subdevice
+ * v4l2_subdev_lock_state() - Locks the subdev state
+ * @state: The subdevice state
+ *
+ * Locks the given subdev state.
+ *
+ * The state must be unlocked with v4l2_subdev_unlock_state() after use.
+ */
+static inline void v4l2_subdev_lock_state(struct v4l2_subdev_state *state)
+{
+	mutex_lock(state->lock);
+}
+
+/**
+ * v4l2_subdev_unlock_state() - Unlocks the subdev state
+ * @state: The subdevice state
+ *
+ * Unlocks the given subdev state.
+ */
+static inline void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state)
+{
+	mutex_unlock(state->lock);
+}
+
+/**
+ * v4l2_subdev_get_unlocked_active_state() - Checks that the active subdev state
+ *					     is unlocked and returns it
+ * @sd: The subdevice
+ *
+ * Returns the active state for the subdevice, or NULL if the subdev does not
+ * support active state. If the state is not NULL, calls
+ * lockdep_assert_not_held() to issue a warning if the state is locked.
+ *
+ * This function is to be used e.g. when getting the active state for the sole
+ * purpose of passing it forward, without accessing the state fields.
+ */
+static inline struct v4l2_subdev_state *
+v4l2_subdev_get_unlocked_active_state(struct v4l2_subdev *sd)
+{
+	if (sd->active_state)
+		lockdep_assert_not_held(sd->active_state->lock);
+	return sd->active_state;
+}
+
+/**
+ * v4l2_subdev_get_locked_active_state() - Checks that the active subdev state
+ *					   is locked and returns it
+ *
  * @sd: The subdevice
  *
  * Returns the active state for the subdevice, or NULL if the subdev does not
- * support active state.
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
+	return sd->active_state;
+}
+
+/**
+ * v4l2_subdev_lock_and_get_active_state() - Locks and returns the active subdev
+ *					     state for the subdevice
+ * @sd: The subdevice
+ *
+ * Returns the locked active state for the subdevice, or NULL if the subdev
+ * does not support active state.
+ *
+ * The state must be unlocked with v4l2_subdev_unlock_state() after use.
  */
 static inline struct v4l2_subdev_state *
-v4l2_subdev_get_active_state(struct v4l2_subdev *sd)
+v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
 {
+	if (sd->active_state)
+		v4l2_subdev_lock_state(sd->active_state);
 	return sd->active_state;
 }
 
@@ -1255,6 +1346,36 @@ extern const struct v4l2_subdev_ops v4l2_subdev_call_wrappers;
 		__result;						\
 	})
 
+/**
+ * v4l2_subdev_call_state_active - call an operation of a v4l2_subdev which
+ *				   takes state as a parameter, passing the
+ *				   subdev its active state.
+ *
+ * @sd: pointer to the &struct v4l2_subdev
+ * @o: name of the element at &struct v4l2_subdev_ops that contains @f.
+ *     Each element there groups a set of callbacks functions.
+ * @f: callback function to be called.
+ *     The callback functions are defined in groups, according to
+ *     each element at &struct v4l2_subdev_ops.
+ * @args: arguments for @f.
+ *
+ * This is similar to v4l2_subdev_call(), except that this version can only be
+ * used for ops that take a subdev state as a parameter. The macro will get the
+ * active state, lock it before calling the op and unlock it after the call.
+ */
+#define v4l2_subdev_call_state_active(sd, o, f, args...)		\
+	({								\
+		int __result;						\
+		struct v4l2_subdev_state *state;			\
+		state = v4l2_subdev_get_unlocked_active_state(sd);	\
+		if (state)						\
+			v4l2_subdev_lock_state(state);			\
+		__result = v4l2_subdev_call(sd, o, f, state, ##args);	\
+		if (state)						\
+			v4l2_subdev_unlock_state(state);		\
+		__result;						\
+	})
+
 /**
  * v4l2_subdev_has_op - Checks if a subdev defines a certain operation.
  *
-- 
2.25.1

