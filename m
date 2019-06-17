Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B62A49218
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 23:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbfFQVKD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 17:10:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41562 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728040AbfFQVKC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 17:10:02 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7F751217;
        Mon, 17 Jun 2019 23:09:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560805796;
        bh=09tZsVSx072b7Ql590jhy7bvmtHSpCR6J3rF+0Dhypo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DFI49PEZyLKX0TsHJePcfOSDZiPX0rPBA4VnLL7ULo5M4VYHc1KiI6nW9BlP1hPBK
         E8Xu2i7xEEdJov67vNs0K6zmqRyLHze6tLPW3J97HVgXtXVCK7kR02CC8qfgh6AZK+
         u6TM/e7hDvo0DQISAoHbZE7kMQ0cxPg5dQgJ2VDE=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v3 09/10] drm: rcar-du: Perform group setup from the atomic tail handler
Date:   Tue, 18 Jun 2019 00:09:29 +0300
Message-Id: <20190617210930.6054-10-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190617210930.6054-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190617210930.6054-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Create rcar_du_group_atomic_check() and rcar_du_group_atomic_setup()
functions to track and apply group state through the DRM atomic state.
The use_count field is moved from the rcar_du_group structure to an
enabled field in the rcar_du_group_state structure.

This allows separating group setup from the configuration of the CRTCs
that are part of the group, simplifying the CRTC code and improving
overall readability. The existing rcar_du_group_{get,put}() functions
are now redundant and removed.

The groups share clocking with the CRTCs within the group, and so are
accessible only when one of its CRTCs has been powered through
rcar_du_crtc_atomic_exit_standby().

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v2:

- Simplify error handling in rcar_du_crtc_enable()
- Rename rcar_du_group_atomic_pre_commit() to
  rcar_du_group_atomic_setup() and turn it into a void function
- Remove rcar_du_group_atomic_post_commit()
- Replace group state use_count field by enabled
- Rename group state variable from rstate to gstate

Changes since v1:

- All register sequences now maintained.
- Clock management is no longer handled by the group
  (_crtc_{exit,enter}_standby handles this for us)
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 18 ++---
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 91 ++++++++++++++++---------
 drivers/gpu/drm/rcar-du/rcar_du_group.h | 12 ++--
 drivers/gpu/drm/rcar-du/rcar_du_kms.c   |  5 ++
 4 files changed, 76 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index d11a474f6f72..ab5c288f9d09 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -487,12 +487,10 @@ static int rcar_du_crtc_exit_standby(struct rcar_du_crtc *rcrtc)
 		return ret;
 
 	ret = clk_prepare_enable(rcrtc->extclock);
-	if (ret < 0)
-		goto error_clock;
-
-	ret = rcar_du_group_get(rcrtc->group);
-	if (ret < 0)
-		goto error_group;
+	if (ret < 0) {
+		clk_disable_unprepare(rcrtc->clock);
+		return ret;
+	}
 
 	/* Set display off and background to black. */
 	rcar_du_crtc_write(rcrtc, DOOR, DOOR_RGB(0, 0, 0));
@@ -502,18 +500,10 @@ static int rcar_du_crtc_exit_standby(struct rcar_du_crtc *rcrtc)
 	rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? DS2PR : DS1PR, 0);
 
 	return 0;
-
-error_group:
-	clk_disable_unprepare(rcrtc->extclock);
-error_clock:
-	clk_disable_unprepare(rcrtc->clock);
-	return ret;
 }
 
 static void rcar_du_crtc_enter_standby(struct rcar_du_crtc *rcrtc)
 {
-	rcar_du_group_put(rcrtc->group);
-
 	clk_disable_unprepare(rcrtc->extclock);
 	clk_disable_unprepare(rcrtc->clock);
 }
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index 8e12bd42890e..7c9145778567 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -24,6 +24,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/err.h>
 #include <linux/io.h>
 #include <linux/slab.h>
 
@@ -173,38 +174,6 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 	mutex_unlock(&rgrp->lock);
 }
 
-/*
- * rcar_du_group_get - Acquire a reference to the DU channels group
- *
- * Acquiring the first reference setups core registers. A reference must be held
- * before accessing any hardware registers.
- *
- * This function must be called with the DRM mode_config lock held.
- *
- * Return 0 in case of success or a negative error code otherwise.
- */
-int rcar_du_group_get(struct rcar_du_group *rgrp)
-{
-	if (rgrp->use_count)
-		goto done;
-
-	rcar_du_group_setup(rgrp);
-
-done:
-	rgrp->use_count++;
-	return 0;
-}
-
-/*
- * rcar_du_group_put - Release a reference to the DU
- *
- * This function must be called with the DRM mode_config lock held.
- */
-void rcar_du_group_put(struct rcar_du_group *rgrp)
-{
-	--rgrp->use_count;
-}
-
 static void __rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start)
 {
 	struct rcar_du_device *rcdu = rgrp->dev;
@@ -389,6 +358,23 @@ static const struct drm_private_state_funcs rcar_du_group_state_funcs = {
 	.atomic_destroy_state = rcar_du_group_atomic_destroy_state,
 };
 
+#define for_each_oldnew_group_in_state(__state, __obj, __old_state, __new_state, __i) \
+	for_each_oldnew_private_obj_in_state((__state), (__obj), (__old_state), (__new_state), (__i)) \
+		for_each_if((__obj)->funcs == &rcar_du_group_state_funcs)
+
+static struct rcar_du_group_state *
+rcar_du_get_group_state(struct drm_atomic_state *state,
+			struct rcar_du_group *rgrp)
+{
+	struct drm_private_state *pstate;
+
+	pstate = drm_atomic_get_private_obj_state(state, &rgrp->private);
+	if (IS_ERR(pstate))
+		return ERR_CAST(pstate);
+
+	return to_rcar_group_state(pstate);
+}
+
 /**
  * rcar_du_get_old_group_state - get old group state, if it exists
  * @state: global atomic state object
@@ -441,6 +427,47 @@ rcar_du_get_new_group_state(struct drm_atomic_state *state,
 	return NULL;
 }
 
+int rcar_du_group_atomic_check(struct drm_device *dev,
+			       struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	unsigned int i;
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+		struct rcar_du_group_state *gstate;
+
+		gstate = rcar_du_get_group_state(state, rcrtc->group);
+		if (IS_ERR(gstate))
+			return PTR_ERR(gstate);
+
+		if (crtc_state->active)
+			gstate->enabled = true;
+	}
+
+	return 0;
+}
+
+void rcar_du_group_atomic_setup(struct drm_device *dev,
+				struct drm_atomic_state *state)
+{
+	struct drm_private_state *old_pstate, *new_pstate;
+	struct drm_private_obj *obj;
+	unsigned int i;
+
+	for_each_oldnew_group_in_state(state, obj, old_pstate, new_pstate, i) {
+		struct rcar_du_group *rgrp = to_rcar_group(obj);
+		struct rcar_du_group_state *old_state, *new_state;
+
+		old_state = to_rcar_group_state(old_pstate);
+		new_state = to_rcar_group_state(new_pstate);
+
+		if (!old_state->enabled && new_state->enabled)
+			rcar_du_group_setup(rgrp);
+	}
+}
+
 /* -----------------------------------------------------------------------------
  * Init and Cleanup
  */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.h b/drivers/gpu/drm/rcar-du/rcar_du_group.h
index f9961f89fd97..20efd2251ec4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.h
@@ -26,7 +26,6 @@ struct rcar_du_device;
  * @index: group index
  * @channels_mask: bitmask of populated DU channels in this group
  * @num_crtcs: number of CRTCs in this group (1 or 2)
- * @use_count: number of users of the group (rcar_du_group_(get|put))
  * @used_crtcs: number of CRTCs currently in use
  * @lock: protects the dptsr_planes field and the DPTSR register
  * @dptsr_planes: bitmask of planes driven by dot-clock and timing generator 1
@@ -43,7 +42,6 @@ struct rcar_du_group {
 
 	unsigned int channels_mask;
 	unsigned int num_crtcs;
-	unsigned int use_count;
 	unsigned int used_crtcs;
 
 	struct mutex lock;
@@ -59,9 +57,12 @@ struct rcar_du_group {
 /**
  * struct rcar_du_group_state - Driver-specific group state
  * @state: base DRM private state
+ * @enabled: true if at least one CRTC in the group is enabled
  */
 struct rcar_du_group_state {
 	struct drm_private_state state;
+
+	bool enabled;
 };
 
 #define to_rcar_group_state(s) \
@@ -70,8 +71,6 @@ struct rcar_du_group_state {
 u32 rcar_du_group_read(struct rcar_du_group *rgrp, u32 reg);
 void rcar_du_group_write(struct rcar_du_group *rgrp, u32 reg, u32 data);
 
-int rcar_du_group_get(struct rcar_du_group *rgrp);
-void rcar_du_group_put(struct rcar_du_group *rgrp);
 void rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start);
 void rcar_du_group_restart(struct rcar_du_group *rgrp);
 int rcar_du_group_set_routing(struct rcar_du_group *rgrp);
@@ -85,6 +84,11 @@ struct rcar_du_group_state *
 rcar_du_get_new_group_state(struct drm_atomic_state *state,
 			    struct rcar_du_group *rgrp);
 
+int rcar_du_group_atomic_check(struct drm_device *dev,
+			       struct drm_atomic_state *state);
+void rcar_du_group_atomic_setup(struct drm_device *dev,
+				struct drm_atomic_state *state);
+
 int rcar_du_group_init(struct rcar_du_device *rcdu, struct rcar_du_group *rgrp,
 		       unsigned int index);
 void rcar_du_group_cleanup(struct rcar_du_group *rgrp);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index f57a035a94ee..65396134fba1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -377,6 +377,10 @@ static int rcar_du_atomic_check(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	ret = rcar_du_group_atomic_check(dev, state);
+	if (ret)
+		return ret;
+
 	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE))
 		return 0;
 
@@ -411,6 +415,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 
 	/* Apply the atomic update. */
 	rcar_du_crtc_atomic_exit_standby(dev, old_state);
+	rcar_du_group_atomic_setup(dev, old_state);
 
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
 	rcar_du_crtc_atomic_modeset(dev, old_state);
-- 
Regards,

Laurent Pinchart

