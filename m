Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDA5D49210
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 23:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728102AbfFQVJ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 17:09:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41574 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728040AbfFQVJ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 17:09:59 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 095991200;
        Mon, 17 Jun 2019 23:09:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560805794;
        bh=h9TT31z7AozYsCJ9BWV0m8flK1mMwqN4iYMmzb8g2a0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NNSYt4L6qYiEP/YJqJwZi2XwHkgHiTVboMf7jGrgMKdul/ARfbTcZoLPJsEO6SQu8
         1d2xNG1sfkzMhTqe7ewCejvm1YRm4nwJgOA8X8shDq15VCVseyiYxQuxMyVhMdxTX3
         udmCmTFMPAB/eblfW0AQ8kgbuBtAvfLS3EwMTm44=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v3 05/10] drm: rcar-du: Handle CRTC standby from commit tail handler
Date:   Tue, 18 Jun 2019 00:09:25 +0300
Message-Id: <20190617210930.6054-6-laurent.pinchart+renesas@ideasonboard.com>
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

Manage the power state, and initial configuration of the CRTC from the
commit tail handler. CRTCs which need to be activated are taken out of
standby, and any deactivated CRTCs are put into standby.

This aims at removing CRTC state tracking from the rcar_du_crtc
structure. The initial configuration of the CRTC background colours and
disabling of all planes is taken out of rcar_du_crtc_setup() and moved
inline into rcar_du_crtc_enable(). rcar_du_crtc_get() and
rcar_du_crtc_put() are kept as they are needed to configure the VSP at
the correct time, this will be addressed in a separate change.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v2:

- Add more documentation
- Keep rcar_du_crtc_get() and rcar_du_crtc_put()
- Renamed rcar_du_crtc_enable() to rcar_du_crtc_exit_standby() and
  rcar_du_crtc_disable() to rcar_du_crtc_enter_standby()
- Reword commit message

Changes since v1:

- Registers sequence confirmed unchanged
- Re-ordered in the series to handle before groups
- Do not merge rcar_du_crtc_setup() (now handled by _crtc_pre_commit)
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 90 ++++++++++++++++++++------
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h |  5 ++
 drivers/gpu/drm/rcar-du/rcar_du_kms.c  |  4 ++
 3 files changed, 81 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index cccd6fe85749..23f4bdef0e3a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -480,17 +480,10 @@ static void rcar_du_crtc_wait_page_flip(struct rcar_du_crtc *rcrtc)
 
 static void rcar_du_crtc_setup(struct rcar_du_crtc *rcrtc)
 {
-	/* Set display off and background to black */
-	rcar_du_crtc_write(rcrtc, DOOR, DOOR_RGB(0, 0, 0));
-	rcar_du_crtc_write(rcrtc, BPOR, BPOR_RGB(0, 0, 0));
-
 	/* Configure display timings and output routing */
 	rcar_du_crtc_set_display_timing(rcrtc);
 	rcar_du_group_set_routing(rcrtc->group);
 
-	/* Start with all planes disabled. */
-	rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? DS2PR : DS1PR, 0);
-
 	/* Enable the VSP compositor. */
 	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE)) {
 		rcar_du_vsp_modeset(rcrtc);
@@ -501,17 +494,10 @@ static void rcar_du_crtc_setup(struct rcar_du_crtc *rcrtc)
 	drm_crtc_vblank_on(&rcrtc->crtc);
 }
 
-static int rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
+static int rcar_du_crtc_exit_standby(struct rcar_du_crtc *rcrtc)
 {
 	int ret;
 
-	/*
-	 * Guard against double-get, as the function is called from both the
-	 * .atomic_enable() and .atomic_begin() handlers.
-	 */
-	if (rcrtc->initialized)
-		return 0;
-
 	ret = clk_prepare_enable(rcrtc->clock);
 	if (ret < 0)
 		return ret;
@@ -524,8 +510,12 @@ static int rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
 	if (ret < 0)
 		goto error_group;
 
-	rcar_du_crtc_setup(rcrtc);
-	rcrtc->initialized = true;
+	/* Set display off and background to black. */
+	rcar_du_crtc_write(rcrtc, DOOR, DOOR_RGB(0, 0, 0));
+	rcar_du_crtc_write(rcrtc, BPOR, BPOR_RGB(0, 0, 0));
+
+	/* Start with all planes disabled. */
+	rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? DS2PR : DS1PR, 0);
 
 	return 0;
 
@@ -536,13 +526,29 @@ static int rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
 	return ret;
 }
 
-static void rcar_du_crtc_put(struct rcar_du_crtc *rcrtc)
+static void rcar_du_crtc_enter_standby(struct rcar_du_crtc *rcrtc)
 {
 	rcar_du_group_put(rcrtc->group);
 
 	clk_disable_unprepare(rcrtc->extclock);
 	clk_disable_unprepare(rcrtc->clock);
+}
 
+static void rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
+{
+	/*
+	 * Guard against double-get, as the function is called from both the
+	 * .atomic_enable() and .atomic_begin() handlers.
+	 */
+	if (rcrtc->initialized)
+		return;
+
+	rcar_du_crtc_setup(rcrtc);
+	rcrtc->initialized = true;
+}
+
+static void rcar_du_crtc_put(struct rcar_du_crtc *rcrtc)
+{
 	rcrtc->initialized = false;
 }
 
@@ -662,6 +668,54 @@ static int rcar_du_crtc_atomic_check(struct drm_crtc *crtc,
 	return 0;
 }
 
+/*
+ * Take all CRTCs that are made active in this commit out of standby.
+ * CRTCs that are deactivated by the commit are untouched and will be
+ * put in standby by rcar_du_crtc_atomic_enter_standby().
+ */
+int rcar_du_crtc_atomic_exit_standby(struct drm_device *dev,
+				     struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	unsigned int i;
+	int ret;
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+
+		if (crtc_state->active_changed && crtc_state->active) {
+			ret = rcar_du_crtc_exit_standby(rcrtc);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * Put all CRTCs that have been deactivated by this commit in standby.
+ * This shall be called at the end of the commit tail handler as the
+ * last operation that touches the CRTC hardware.
+ */
+int rcar_du_crtc_atomic_enter_standby(struct drm_device *dev,
+				      struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	unsigned int i;
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+
+		if (crtc_state->active_changed && !crtc_state->active)
+			rcar_du_crtc_enter_standby(rcrtc);
+	}
+
+	return 0;
+}
+
 static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 				       struct drm_crtc_state *old_state)
 {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 3b7fc668996f..3ce7610793b2 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -107,6 +107,11 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 
 void rcar_du_crtc_finish_page_flip(struct rcar_du_crtc *rcrtc);
 
+int rcar_du_crtc_atomic_exit_standby(struct drm_device *dev,
+				     struct drm_atomic_state *state);
+int rcar_du_crtc_atomic_enter_standby(struct drm_device *dev,
+				      struct drm_atomic_state *state);
+
 void rcar_du_crtc_dsysr_clr_set(struct rcar_du_crtc *rcrtc, u32 clr, u32 set);
 
 #endif /* __RCAR_DU_CRTC_H__ */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 2dc9caee8767..59680de271cc 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -409,11 +409,15 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 	}
 
 	/* Apply the atomic update. */
+	rcar_du_crtc_atomic_exit_standby(dev, old_state);
+
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
 	drm_atomic_helper_commit_planes(dev, old_state,
 					DRM_PLANE_COMMIT_ACTIVE_ONLY);
 	drm_atomic_helper_commit_modeset_enables(dev, old_state);
 
+	rcar_du_crtc_atomic_enter_standby(dev, old_state);
+
 	drm_atomic_helper_commit_hw_done(old_state);
 	drm_atomic_helper_wait_for_flip_done(dev, old_state);
 
-- 
Regards,

Laurent Pinchart

