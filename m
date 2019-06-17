Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 131F249214
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 23:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728147AbfFQVKB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 17:10:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41574 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728115AbfFQVKA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 17:10:00 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E05292AF;
        Mon, 17 Jun 2019 23:09:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560805795;
        bh=jykX+GW5ELgx/3v26bE+LaTvqVLuHhmEi55L841++20=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mCMnqLJE0xVh/VRSNYmlBgafugZhCeWxgxAPgzx9mOdzPhjF8/ezaM5GSoyUANsfr
         AxVIcnRyNZBTyoDQsnQBzL2nLhwXebpvEdSzuzpLp/dllr1tWGSJcK/h6yYzAKXkmO
         c231wgNs/d2b3YEFWE2KV+mxpbi3RtIMMSkTHenw=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v3 07/10] drm: rcar-du: Provide for_each_group helper
Date:   Tue, 18 Jun 2019 00:09:27 +0300
Message-Id: <20190617210930.6054-8-laurent.pinchart+renesas@ideasonboard.com>
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

Refactoring of the group control code will soon require more iteration
over the available groups. Simplify this process by introducing a group
iteration helper.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v2:

- Don't assign __group in the condition part of the for statement of the
  for_each_rcdu_group() macro
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.h |  5 +++++
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 10 ++--------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 1327cd0df90a..0cc0984bf2ea 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -96,6 +96,11 @@ struct rcar_du_device {
 	unsigned int vspd1_sink;
 };
 
+#define for_each_rcdu_group(__rcdu, __group, __i) \
+	for ((__i) = 0, (__group) = &(__rcdu)->groups[0]; \
+	     (__i) < DIV_ROUND_UP((__rcdu)->num_crtcs, 2); \
+	     __i++, __group++)
+
 static inline bool rcar_du_has(struct rcar_du_device *rcdu,
 			       unsigned int feature)
 {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 144c0c1b1591..c04136674e58 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -627,9 +627,9 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 
 	struct drm_device *dev = rcdu->ddev;
 	struct drm_encoder *encoder;
+	struct rcar_du_group *rgrp;
 	unsigned int dpad0_sources;
 	unsigned int num_encoders;
-	unsigned int num_groups;
 	unsigned int swindex;
 	unsigned int hwindex;
 	unsigned int i;
@@ -670,11 +670,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 		return ret;
 
 	/* Initialize the groups. */
-	num_groups = DIV_ROUND_UP(rcdu->num_crtcs, 2);
-
-	for (i = 0; i < num_groups; ++i) {
-		struct rcar_du_group *rgrp = &rcdu->groups[i];
-
+	for_each_rcdu_group(rcdu, rgrp, i) {
 		mutex_init(&rgrp->lock);
 
 		rgrp->dev = rcdu;
@@ -711,8 +707,6 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 
 	/* Create the CRTCs. */
 	for (swindex = 0, hwindex = 0; swindex < rcdu->num_crtcs; ++hwindex) {
-		struct rcar_du_group *rgrp;
-
 		/* Skip unpopulated DU channels. */
 		if (!(rcdu->info->channels_mask & BIT(hwindex)))
 			continue;
-- 
Regards,

Laurent Pinchart

