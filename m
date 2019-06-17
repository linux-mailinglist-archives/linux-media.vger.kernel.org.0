Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6C349215
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 23:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbfFQVKB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 17:10:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41562 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728057AbfFQVKA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 17:10:00 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 75F1D120A;
        Mon, 17 Jun 2019 23:09:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560805794;
        bh=yL+6oclHjQiqkSoIjsFaHo3x81rVWwwP0zTyIDZf0iE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AajAoR9wl1gTDwoibtkta+jCZHwbumig2ThK6bgeqQ0kVvJDkKj9CWvbRdgcLS4xI
         cR1NEql9qYOdn5ty0vXBwtnu37h80zPX87lf34av61CU4+rAsY90v0Z2Fa45axKeF0
         LwvCM2VUEbjmc5M1tX0jPDaXQvlygTFdNDldW4A0=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v3 06/10] drm: rcar-du: Handle CRTC configuration from commit tail handler
Date:   Tue, 18 Jun 2019 00:09:26 +0300
Message-Id: <20190617210930.6054-7-laurent.pinchart+renesas@ideasonboard.com>
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

The CRTC mode setting and routing configuration are performed at the
earliest of atomic enable and atomic begin, to ensure that a valid
configuration is applied to the hardware before the CRTC gets enabled
and before planes are setup (the latter being required in particular by
the VSP). This requires the rcar_du_crtc structure to track the CRTC
enabled state.

Simplify the code and remove the manual state tracking by moving CRTC
setup to a new rcar_du_crtc_atomic_modeset() function, called directly
from the commit tail handler. The function iterates over all CRTCs in
the state transaction and performs CRTC mode setting, routing
configuration and VSP configuration.

drm_crtc_vblank_on() has to be called from the atomic begin handler, to
ensure that vertical blanking reporting is enabled before the call to
drm_crtc_vblank_get() in the atomic flush handler. As the
drm_crtc_vblank_on() and drm_crtc_vblank_off() calls don't need to be
balanced this is not an issue. A balanced alternative would have been to
call drm_crtc_vblank_on() and drm_crtc_vblank_off() from the CRTC exit
and enter standby handlers respectively, but
drm_atomic_helper_commit_modeset_disables() complains if
drm_crtc_vblank_off() hasn't been called by the atomic disable handler.

As a result, the vsp1_du_atomic_flush() operation can be called with the
DRM pipeline disabled. Correct operation has been ensured by "media:
vsp1: drm: Don't configure hardware when the pipeline is disabled".

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v2:

- Deconstruct rcar_du_crtc_setup() completely
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 89 +++++++++++---------------
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h |  4 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c  |  1 +
 3 files changed, 42 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 23f4bdef0e3a..d11a474f6f72 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -478,22 +478,6 @@ static void rcar_du_crtc_wait_page_flip(struct rcar_du_crtc *rcrtc)
  * Start/Stop and Suspend/Resume
  */
 
-static void rcar_du_crtc_setup(struct rcar_du_crtc *rcrtc)
-{
-	/* Configure display timings and output routing */
-	rcar_du_crtc_set_display_timing(rcrtc);
-	rcar_du_group_set_routing(rcrtc->group);
-
-	/* Enable the VSP compositor. */
-	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE)) {
-		rcar_du_vsp_modeset(rcrtc);
-		rcar_du_vsp_enable(rcrtc);
-	}
-
-	/* Turn vertical blanking interrupt reporting on. */
-	drm_crtc_vblank_on(&rcrtc->crtc);
-}
-
 static int rcar_du_crtc_exit_standby(struct rcar_du_crtc *rcrtc)
 {
 	int ret;
@@ -534,24 +518,6 @@ static void rcar_du_crtc_enter_standby(struct rcar_du_crtc *rcrtc)
 	clk_disable_unprepare(rcrtc->clock);
 }
 
-static void rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
-{
-	/*
-	 * Guard against double-get, as the function is called from both the
-	 * .atomic_enable() and .atomic_begin() handlers.
-	 */
-	if (rcrtc->initialized)
-		return;
-
-	rcar_du_crtc_setup(rcrtc);
-	rcrtc->initialized = true;
-}
-
-static void rcar_du_crtc_put(struct rcar_du_crtc *rcrtc)
-{
-	rcrtc->initialized = false;
-}
-
 static void rcar_du_crtc_start(struct rcar_du_crtc *rcrtc)
 {
 	bool interlaced;
@@ -716,6 +682,40 @@ int rcar_du_crtc_atomic_enter_standby(struct drm_device *dev,
 	return 0;
 }
 
+/*
+ * Configure the mode for all CRTCs that require it. For now we only handle mode
+ * set on the VSP, CRTC configuration will be handled later.
+ */
+int rcar_du_crtc_atomic_modeset(struct drm_device *dev,
+				struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	unsigned int i;
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+
+		/*
+		 * Skip commits that don't change the mode. We manually skip
+		 * inactive CRTCs as disabling a CRTC is considered as a mode
+		 * set by drm_atomic_crtc_needs_modeset().
+		 */
+		if (!drm_atomic_crtc_needs_modeset(crtc_state) ||
+		    !crtc_state->active)
+			continue;
+
+		/* Configure display timings and output routing. */
+		rcar_du_crtc_set_display_timing(rcrtc);
+		rcar_du_group_set_routing(rcrtc->group);
+
+		if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
+			rcar_du_vsp_modeset(rcrtc);
+	}
+
+	return 0;
+}
+
 static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 				       struct drm_crtc_state *old_state)
 {
@@ -723,8 +723,6 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct rcar_du_crtc_state *rstate = to_rcar_crtc_state(crtc->state);
 	struct rcar_du_device *rcdu = rcrtc->dev;
 
-	rcar_du_crtc_get(rcrtc);
-
 	/*
 	 * On D3/E3 the dot clock is provided by the LVDS encoder attached to
 	 * the DU channel. We need to enable its clock output explicitly if
@@ -741,6 +739,9 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 				     mode->clock * 1000);
 	}
 
+	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
+		rcar_du_vsp_enable(rcrtc);
+
 	rcar_du_crtc_start(rcrtc);
 }
 
@@ -752,7 +753,6 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
 	struct rcar_du_device *rcdu = rcrtc->dev;
 
 	rcar_du_crtc_stop(rcrtc);
-	rcar_du_crtc_put(rcrtc);
 
 	if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index) &&
 	    rstate->outputs == BIT(RCAR_DU_OUTPUT_DPAD0)) {
@@ -781,19 +781,8 @@ static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
 
 	WARN_ON(!crtc->state->enable);
 
-	/*
-	 * If a mode set is in progress we can be called with the CRTC disabled.
-	 * We thus need to first get and setup the CRTC in order to configure
-	 * planes. We must *not* put the CRTC in .atomic_flush(), as it must be
-	 * kept awake until the .atomic_enable() call that will follow. The get
-	 * operation in .atomic_enable() will in that case be a no-op, and the
-	 * CRTC will be put later in .atomic_disable().
-	 *
-	 * If a mode set is not in progress the CRTC is enabled, and the
-	 * following get call will be a no-op. There is thus no need to balance
-	 * it in .atomic_flush() either.
-	 */
-	rcar_du_crtc_get(rcrtc);
+	/* Turn vertical blanking interrupt reporting on. */
+	drm_crtc_vblank_on(&rcrtc->crtc);
 
 	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
 		rcar_du_vsp_atomic_begin(rcrtc);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 3ce7610793b2..61d79aa7c8e8 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -30,7 +30,6 @@ struct rcar_du_vsp;
  * @extclock: external pixel dot clock (optional)
  * @mmio_offset: offset of the CRTC registers in the DU MMIO block
  * @index: CRTC hardware index
- * @initialized: whether the CRTC has been initialized and clocks enabled
  * @dsysr: cached value of the DSYSR register
  * @vblank_enable: whether vblank events are enabled on this CRTC
  * @event: event to post when the pending page flip completes
@@ -51,7 +50,6 @@ struct rcar_du_crtc {
 	struct clk *extclock;
 	unsigned int mmio_offset;
 	unsigned int index;
-	bool initialized;
 
 	u32 dsysr;
 
@@ -111,6 +109,8 @@ int rcar_du_crtc_atomic_exit_standby(struct drm_device *dev,
 				     struct drm_atomic_state *state);
 int rcar_du_crtc_atomic_enter_standby(struct drm_device *dev,
 				      struct drm_atomic_state *state);
+int rcar_du_crtc_atomic_modeset(struct drm_device *dev,
+				struct drm_atomic_state *state);
 
 void rcar_du_crtc_dsysr_clr_set(struct rcar_du_crtc *rcrtc, u32 clr, u32 set);
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 59680de271cc..144c0c1b1591 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -412,6 +412,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 	rcar_du_crtc_atomic_exit_standby(dev, old_state);
 
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
+	rcar_du_crtc_atomic_modeset(dev, old_state);
 	drm_atomic_helper_commit_planes(dev, old_state,
 					DRM_PLANE_COMMIT_ACTIVE_ONLY);
 	drm_atomic_helper_commit_modeset_enables(dev, old_state);
-- 
Regards,

Laurent Pinchart

