Return-Path: <linux-media+bounces-38401-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ED4B10CF6
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 16:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D5413ABACE
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 14:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333132EA475;
	Thu, 24 Jul 2025 14:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eflzKinz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DF82E9EBA;
	Thu, 24 Jul 2025 14:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366260; cv=none; b=eAym+bHrCetYIGzSTSSqX3vgxTG/PfIAVI67/E6PFrlikWEExHqgncUiNlWA7tNVbWwhqgQqAIgM1arQrHeSa+5waZozPyvoVybVKK3pp4PM3I0VZSADBnuKm8tSXJHINmVN3VEUuhpH2tQEZxEQaEA1Q0arjBtGmtwhTxCqHJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366260; c=relaxed/simple;
	bh=LTlCiL6fmmVVuL8bKDmzSBOA/E25dmRY67EoUr9sHTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tNcfgxW7q4dvz+SKlzfGHSvszwhchup3gqBQvTMt8IjKhfss2o8WIwGGC+/LIqUjYEkBi6WQzy8NxlFkNXCUxCD0Gw5jybomAm9UvJnLKkMz3bcXzxmm4d/sUq47UY98j6Rkl6xAEWAhIcQqq965VoJHRYiJOaJ1tkrKH/f1Bzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eflzKinz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B44A2C79;
	Thu, 24 Jul 2025 16:10:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366208;
	bh=LTlCiL6fmmVVuL8bKDmzSBOA/E25dmRY67EoUr9sHTM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eflzKinzcge3uNK6Yy71BC8PHhXpTWj2kEbEr9oWIREWTg6irW8FYgaC8MAM9wHa8
	 Fv2O5M4BMsi9kI2Hp9ykUzS5Fc91KKj0H34h6eBNQqJlh1diou9IcNRavRj7lmYEx4
	 Eb6gbVOBjx4V9dpNE6cHImYyeS7ISuURAZdD6+Ko=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:23 +0200
Subject: [PATCH v2 16/27] media: v4l2-subdev: Add subdev state accessor
 helpers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-16-c9b316773486@ideasonboard.com>
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10156;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=LTlCiL6fmmVVuL8bKDmzSBOA/E25dmRY67EoUr9sHTM=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7QjdzL4huWoPQWt9hdYUH28WTHaaCsqpjeU
 qna2kZzuD6JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+0AAKCRByNAaPFqFW
 PGOyD/0SmIsZq5YVWnS8yOYo+Js9CALdRiBwlS1FU+yS7Wah+l/YMy5QZ1c+pvSGbDEexB1IRLB
 Pke0D0N6TmmHG1aXW5ATpJoruhITQ18ZqTGAmguMPvSaJewWfi6nFQ1mt1fDPm4Vnk60cdW+xWI
 GCNb/jqBiJbjAnILhpEN2peDig8jSSM3WPtAeFCaD5y9Jr/oK4Tb7Kgs/itZdwvlZqwXHWJhURw
 QXtWM6PF42A+J3vM3zwcwvMQ4KSL07YfFQDyjP9ai8Xg7d2pLNKx5EvdeH1fqopHM6ZCDt4Cz81
 U1RA9W8W/Lwq2d8ICw6yrn5GUfsh0ySeSlrejapD/96zV+1VW6jenjf04IN4V83N4CHWOJKGL8z
 RJpSloDiHE+8o9+rU3dwWA2AzoslILnPdWyoutRp00T3y32tHYy/yni9c/s+ASoT740dq7enqVl
 geoUDi+v8Qz7uRoh3MJHeW+FvfOtxO6tK+utrj9GpStNIuGcEVYUe7p4C+5KZHGODMPaNHq4ufc
 GIMHQCsdvvE7hm86iaV0nwI6PBD9d6E6vPjdW9Z169PSDrk88wNOEoiOoG9ku1G580l2KFnL08A
 C5wHL6XTGz+NEGuYQwJZC3EGtI0O+20m5RvdBiCFDEpTMvYD3YqnOng4gOY+lz3mCG24zbSfqS+
 u4yXvcT7CyDuhtQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

The v4l2-subdev.c file offers three helpers to access the subdevice
active state from a v4l2_subdev pointer:

- v4l2_subdev_get_unlocked_active_state(sd)
- v4l2_subdev_get_locked_active_state(sd)
- v4l2_subdev_lock_and_get_active_state(sd)

With the introduction of struct v4l2_subdev_context which contains a
subdev_state as well, the actual "active" state is stored in three
possible places:
- A context associated with a v4l2_subdev_fh for context aware drivers
  operated by context aware userspace
- The default subdevice context for context aware drivers operated by
  non-context aware userspace
- The subdevice active state for non-context aware drivers

Provide helpers similar in spirit the existing ones but accept as
argument either a subdevice the context itself and retrieve the active
state from the correct place.

Helpers will be used in following patches for link validation.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 101 +++++++++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           | 104 +++++++++++++++++++---------------
 2 files changed, 159 insertions(+), 46 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 438f51980e5ac0f092ba6b0a979a376133968ddf..7372f61127c871cec44a3d1900e2b8bef34632b9 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -20,6 +20,7 @@
 #include <linux/version.h>
 #include <linux/videodev2.h>
 
+#include <media/media-device.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -189,6 +190,106 @@ static inline int check_pad(struct v4l2_subdev *sd, u32 pad)
 	return 0;
 }
 
+/* subdev state accessor helpers */
+
+/*
+ * Access the state from the subdevice.
+ *
+ * If the driver is context-aware use the state stored in the default context
+ * otherwise use the active state stored in the subdevice.
+ */
+
+struct v4l2_subdev_state *
+v4l2_subdev_get_unlocked_active_state_from_sd(struct v4l2_subdev *sd)
+{
+	if (!sd)
+		return NULL;
+
+	if (sd->default_context) {
+		lockdep_assert_not_held(sd->default_context->state->lock);
+
+		return sd->default_context->state;
+	}
+
+	if (sd->active_state)
+		lockdep_assert_not_held(sd->active_state->lock);
+	return sd->active_state;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_unlocked_active_state_from_sd);
+
+struct v4l2_subdev_state *
+v4l2_subdev_get_locked_active_state_from_sd(struct v4l2_subdev *sd)
+{
+	if (!sd)
+		return NULL;
+
+	if (sd->default_context) {
+		lockdep_assert_held(sd->default_context->state->lock);
+
+		return sd->default_context->state;
+	}
+
+	if (sd->active_state)
+		lockdep_assert_held(sd->active_state->lock);
+	return sd->active_state;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_locked_active_state_from_sd);
+
+struct v4l2_subdev_state *
+v4l2_subdev_lock_and_get_active_state_from_sd(struct v4l2_subdev *sd)
+{
+	if (!sd)
+		return NULL;
+
+	if (sd->default_context) {
+		v4l2_subdev_lock_state(sd->default_context->state);
+
+		return sd->default_context->state;
+	}
+
+	if (sd->active_state)
+		v4l2_subdev_lock_state(sd->active_state);
+	return sd->active_state;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_lock_and_get_active_state_from_sd);
+
+/* Access the subdevice state from a subdvice context. */
+struct v4l2_subdev_state *
+v4l2_subdev_get_unlocked_active_state_from_ctx(struct v4l2_subdev_context *ctx)
+{
+	if (!ctx)
+		return NULL;
+
+	if (ctx->state)
+		lockdep_assert_not_held(ctx->state->lock);
+	return ctx->state;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_unlocked_active_state_from_ctx);
+
+struct v4l2_subdev_state *
+v4l2_subdev_get_locked_active_state_from_ctx(struct v4l2_subdev_context *ctx)
+{
+	if (!ctx)
+		return NULL;
+
+	if (ctx->state)
+		lockdep_assert_held(ctx->state->lock);
+	return ctx->state;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_get_locked_active_state_from_ctx);
+
+struct v4l2_subdev_state *
+v4l2_subdev_lock_and_get_active_state_from_ctx(struct v4l2_subdev_context *ctx)
+{
+	if (!ctx)
+		return NULL;
+
+	if (ctx->state)
+		v4l2_subdev_lock_state(ctx->state);
+	return ctx->state;
+}
+EXPORT_SYMBOL_GPL(v4l2_subdev_lock_and_get_active_state_from_ctx);
+
 static int check_state(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
 		       u32 which, u32 pad, u32 stream)
 {
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 1fa42a9f322be0be44fc9308744f4f4ae0cf1606..8087c0ae3bc0a0a95512b4b0ff5257522a104ca0 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -29,16 +29,17 @@
 
 #define	V4L2_DEVICE_NOTIFY_EVENT		_IOW('v', 2, struct v4l2_event)
 
-struct v4l2_device;
+struct led_classdev;
+struct media_device_context;
+struct tuner_setup;
 struct v4l2_ctrl_handler;
+struct v4l2_device;
 struct v4l2_event;
 struct v4l2_event_subscription;
 struct v4l2_fh;
+struct v4l2_mbus_frame_desc;
 struct v4l2_subdev;
 struct v4l2_subdev_fh;
-struct tuner_setup;
-struct v4l2_mbus_frame_desc;
-struct led_classdev;
 
 /**
  * struct v4l2_decode_vbi_line - used to decode_vbi_line
@@ -1968,64 +1969,75 @@ static inline void v4l2_subdev_unlock_states(struct v4l2_subdev_state *state1,
 		mutex_unlock(state2->lock);
 }
 
+struct v4l2_subdev_state *
+v4l2_subdev_get_unlocked_active_state_from_sd(struct v4l2_subdev *sd);
+struct v4l2_subdev_state *
+v4l2_subdev_get_locked_active_state_from_sd(struct v4l2_subdev *sd);
+struct v4l2_subdev_state *
+v4l2_subdev_lock_and_get_active_state_from_sd(struct v4l2_subdev *sd);
+
+struct v4l2_subdev_state *
+v4l2_subdev_get_unlocked_active_state_from_ctx(struct v4l2_subdev_context *ctx);
+struct v4l2_subdev_state *
+v4l2_subdev_get_locked_active_state_from_ctx(struct v4l2_subdev_context *ctx);
+struct v4l2_subdev_state *
+v4l2_subdev_lock_and_get_active_state_from_ctx(struct v4l2_subdev_context *ctx);
+
 /**
- * v4l2_subdev_get_unlocked_active_state() - Checks that the active subdev state
- *					     is unlocked and returns it
- * @sd: The subdevice
+ * v4l2_subdev_get_unlocked_active_state() - Checks that the subdev state is
+ *					     unlocked and returns it
+ * @sdctx: The subdevice, or the subdevice context
  *
- * Returns the active state for the subdevice, or NULL if the subdev does not
- * support active state. If the state is not NULL, calls
- * lockdep_assert_not_held() to issue a warning if the state is locked.
+ * Returns the subdevice state, or NULL if it is not valid. If the state is
+ * not NULL, calls lockdep_assert_not_held() to issue a warning if the state
+ * is locked.
  *
- * This function is to be used e.g. when getting the active state for the sole
- * purpose of passing it forward, without accessing the state fields.
+ * This function is to be used e.g. when getting the state for the sole purpose
+ * of passing it forward, without accessing the state fields.
  */
-static inline struct v4l2_subdev_state *
-v4l2_subdev_get_unlocked_active_state(struct v4l2_subdev *sd)
-{
-	if (sd->active_state)
-		lockdep_assert_not_held(sd->active_state->lock);
-	return sd->active_state;
-}
+#define v4l2_subdev_get_unlocked_active_state(sdctx)				\
+	_Generic((sdctx),							\
+		struct v4l2_subdev *: 						\
+			v4l2_subdev_get_unlocked_active_state_from_sd,		\
+		struct v4l2_subdev_context *:					\
+			v4l2_subdev_get_unlocked_active_state_from_ctx)		\
+	(sdctx)
 
 /**
- * v4l2_subdev_get_locked_active_state() - Checks that the active subdev state
- *					   is locked and returns it
- *
- * @sd: The subdevice
+ * v4l2_subdev_get_locked_active_state() - Checks that the subdev state is
+ *					   locked and returns it
+ * @sdctx: The subdevice, or the subdevice context
  *
- * Returns the active state for the subdevice, or NULL if the subdev does not
- * support active state. If the state is not NULL, calls lockdep_assert_held()
- * to issue a warning if the state is not locked.
+ * Returns the subdevice state, or NULL is not valid. If the state is not NULL,
+ * calls lockdep_assert_held() to issue a warning if the state is not locked.
  *
- * This function is to be used when the caller knows that the active state is
+ * This function is to be used when the caller knows that the context state is
  * already locked.
  */
-static inline struct v4l2_subdev_state *
-v4l2_subdev_get_locked_active_state(struct v4l2_subdev *sd)
-{
-	if (sd->active_state)
-		lockdep_assert_held(sd->active_state->lock);
-	return sd->active_state;
-}
+#define v4l2_subdev_get_locked_active_state(sdctx)				\
+	_Generic((sdctx),							\
+		struct v4l2_subdev *:						\
+			v4l2_subdev_get_locked_active_state_from_sd,		\
+		struct v4l2_subdev_context *:					\
+			v4l2_subdev_get_locked_active_state_from_ctx)		\
+	(sdctx)
 
 /**
- * v4l2_subdev_lock_and_get_active_state() - Locks and returns the active subdev
- *					     state for the subdevice
- * @sd: The subdevice
+ * v4l2_subdev_lock_and_get_active_state_from_ctx() - Locks and returns the
+ *						      subdevice state
+ * @sdctx: The subdevice, or the subdevice context
  *
- * Returns the locked active state for the subdevice, or NULL if the subdev
- * does not support active state.
+ * Returns the locked subdevice state, or NULL if it is not valid.
  *
  * The state must be unlocked with v4l2_subdev_unlock_state() after use.
  */
-static inline struct v4l2_subdev_state *
-v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
-{
-	if (sd->active_state)
-		v4l2_subdev_lock_state(sd->active_state);
-	return sd->active_state;
-}
+#define v4l2_subdev_lock_and_get_active_state(sdctx)				\
+	_Generic((sdctx),							\
+		struct v4l2_subdev *:						\
+			v4l2_subdev_lock_and_get_active_state_from_sd,		\
+		struct v4l2_subdev_context *:					\
+			v4l2_subdev_get_locked_active_state_from_ctx)		\
+	(sdctx)
 
 /**
  * v4l2_subdev_init - initializes the sub-device struct

-- 
2.49.0


