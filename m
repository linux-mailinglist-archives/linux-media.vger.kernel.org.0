Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C05242F65DA
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 17:26:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbhANQZL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 11:25:11 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:54854 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbhANQZL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 11:25:11 -0500
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C78A91508;
        Thu, 14 Jan 2021 17:24:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610641449;
        bh=ZiaSi4ZIWMnQkmja46QYdDXMyRy892v7aQHp0ryTsOs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KG3s7gA+Xy/XClOU5kQw+8Zkf7d1TcsumlXMtrrSvfHE9WySUivfrJhIyRUUCWNSk
         0ToT9s6kb9STRI7Sl6omr6Zn5ozQ1+q/JEYIp6vJXjTvsa8m42ptRP1CAyQeGz5pWp
         SkVb45F2fd6j99BfDu9+idwqZksA84gAr7TQl13Y=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v4 07/10] drm: rcar-du: Provide for_each_group helper
Date:   Thu, 14 Jan 2021 16:22:52 +0000
Message-Id: <20210114162255.705868-8-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114162255.705868-1-kieran.bingham+renesas@ideasonboard.com>
References: <20210114162255.705868-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Refactoring of the group control code will soon require more iteration
over the available groups. Simplify this process by introducing a group
iteration helper.

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v2:

- Don't assign __group in the condition part of the for statement of the
  for_each_rcdu_group() macro

 drivers/gpu/drm/rcar-du/rcar_du_drv.h |  5 +++++
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 10 ++--------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 02ca2d0e1b55..e792ba7f5145 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -104,6 +104,11 @@ static inline struct rcar_du_device *to_rcar_du_device(struct drm_device *dev)
 	return container_of(dev, struct rcar_du_device, ddev);
 }
 
+#define for_each_rcdu_group(__rcdu, __group, __i) \
+	for ((__i) = 0, (__group) = &(__rcdu)->groups[0]; \
+	     (__i) < DIV_ROUND_UP((__rcdu)->num_crtcs, 2); \
+	     __i++, __group++)
+
 static inline bool rcar_du_has(struct rcar_du_device *rcdu,
 			       unsigned int feature)
 {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 3c10c329c81c..732aac342dab 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -771,9 +771,9 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 
 	struct drm_device *dev = &rcdu->ddev;
 	struct drm_encoder *encoder;
+	struct rcar_du_group *rgrp;
 	unsigned int dpad0_sources;
 	unsigned int num_encoders;
-	unsigned int num_groups;
 	unsigned int swindex;
 	unsigned int hwindex;
 	unsigned int i;
@@ -820,11 +820,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
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
@@ -866,8 +862,6 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 
 	/* Create the CRTCs. */
 	for (swindex = 0, hwindex = 0; swindex < rcdu->num_crtcs; ++hwindex) {
-		struct rcar_du_group *rgrp;
-
 		/* Skip unpopulated DU channels. */
 		if (!(rcdu->info->channels_mask & BIT(hwindex)))
 			continue;
-- 
2.25.1

