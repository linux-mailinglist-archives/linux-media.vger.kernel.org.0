Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E83902F65D6
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 17:26:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726459AbhANQYw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 11:24:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbhANQYw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 11:24:52 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1CB7C0613C1;
        Thu, 14 Jan 2021 08:24:11 -0800 (PST)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0608EB77;
        Thu, 14 Jan 2021 17:24:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610641447;
        bh=DOQm06BQXPNUG2wcu5FWU2cy/C1+HUvEnc6VBcWLIbU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R3O/6B/r2zzdlvDZPpWHHKfI3hcTikEijg7UqOKpnLuJ6j4OJgWideIVKxHjatiQI
         fgtGnmv/wiO9Nub8DP4/gU+bKiKMlk5ps/W7IY4EiDkPmW0pYCHtnxhr8+NubceUUB
         zcb++uei5hu3OhHLvang4CjqreiSBLsjmMmIf/O8=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v4 03/10] drm: rcar-du: Convert to the new VSP atomic API
Date:   Thu, 14 Jan 2021 16:22:48 +0000
Message-Id: <20210114162255.705868-4-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114162255.705868-1-kieran.bingham+renesas@ideasonboard.com>
References: <20210114162255.705868-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The configuration API between the VSP and the DU has been updated to
provide finer grain control over modesetting, and enablement.

Split rcar_du_vsp_enable() into rcar_du_vsp_modeset() and
rcar_du_vsp_enable() accordingly, and update each function to use the
new VSP API.

There are no further users of the deprecated vsp1_du_setup_lif() which
can now be removed.

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v2:

- Minor formatting changes

Changes since v3:
- Minor formatting for checkpatch.pl --strict

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c |  4 +++-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c  | 20 ++++++++++++++------
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h  |  3 +++
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index ea7e39d03545..53838dde2f29 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -533,8 +533,10 @@ static void rcar_du_crtc_setup(struct rcar_du_crtc *rcrtc)
 	rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? DS2PR : DS1PR, 0);
 
 	/* Enable the VSP compositor. */
-	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
+	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE)) {
+		rcar_du_vsp_modeset(rcrtc);
 		rcar_du_vsp_enable(rcrtc);
+	}
 
 	/* Turn vertical blanking interrupt reporting on. */
 	drm_crtc_vblank_on(&rcrtc->crtc);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 53221d8473c1..b9e6b8531c96 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -46,16 +46,14 @@ static void rcar_du_vsp_complete(void *private, unsigned int status, u32 crc)
 	drm_crtc_add_crc_entry(&crtc->crtc, false, 0, &crc);
 }
 
-void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
+void rcar_du_vsp_modeset(struct rcar_du_crtc *crtc)
 {
 	const struct drm_display_mode *mode = &crtc->crtc.state->adjusted_mode;
 	struct rcar_du_device *rcdu = crtc->dev;
-	struct vsp1_du_lif_config cfg = {
+	struct vsp1_du_modeset_config cfg = {
 		.width = mode->hdisplay,
 		.height = mode->vdisplay,
 		.interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE,
-		.callback = rcar_du_vsp_complete,
-		.callback_data = crtc,
 	};
 	struct rcar_du_plane_state state = {
 		.state = {
@@ -92,12 +90,22 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
 	 */
 	crtc->group->need_restart = true;
 
-	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
+	vsp1_du_atomic_modeset(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
+}
+
+void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
+{
+	struct vsp1_du_enable_config cfg = {
+		.callback = rcar_du_vsp_complete,
+		.callback_data = crtc,
+	};
+
+	vsp1_du_atomic_enable(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
 }
 
 void rcar_du_vsp_disable(struct rcar_du_crtc *crtc)
 {
-	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, NULL);
+	vsp1_du_atomic_disable(crtc->vsp->vsp, crtc->vsp_pipe);
 }
 
 void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc)
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
index 9b4724159378..7c141523434d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
@@ -58,6 +58,7 @@ to_rcar_vsp_plane_state(struct drm_plane_state *state)
 #ifdef CONFIG_DRM_RCAR_VSP
 int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 		     unsigned int crtcs);
+void rcar_du_vsp_modeset(struct rcar_du_crtc *crtc);
 void rcar_du_vsp_enable(struct rcar_du_crtc *crtc);
 void rcar_du_vsp_disable(struct rcar_du_crtc *crtc);
 void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc);
@@ -73,6 +74,8 @@ static inline int rcar_du_vsp_init(struct rcar_du_vsp *vsp,
 {
 	return -ENXIO;
 }
+
+static inlinc void rcar_du_vsp_modeset(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_enable(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };
-- 
2.25.1

