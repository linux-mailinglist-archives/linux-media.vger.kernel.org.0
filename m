Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3435A497FE8
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 13:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242267AbiAXMtW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 07:49:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242415AbiAXMtS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 07:49:18 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77AF2C061744
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 04:49:17 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id h29so10737155wrb.5
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 04:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dq5fOSrklIYCAF4CLJbybaiEZUoU2qw04ZyXliOHCLk=;
        b=7/0d153CwW61Hv73ImjqE/+eztRH/p2Av29ofRcUBPrUD9h538yrEIk8WspORRgEVT
         UBLDvcVAf9Pr5I8ZUcVxdhYEz3ZyhFbPwC00ub7UVB48bcj04C9yK4cbvCZBWhoiGcxj
         OUEqG+CZAxxKNtKafxrj9TpTTcvdN0Vk7CurgO2LK8dxJU7dmcc3ZYr9A+KiCOMzprLP
         WBv1A7Mkgf28vj3BsEULcBL8uqir2gJjPsjpjDyrHlkJxqzvH7xnGgEWA1V4BgxTEMOU
         QGOxzAU2e96XJJcO0lDJXqlSAO/Xiyp6hVFPVKFKEOxhrp7awyf4HL1fYwC319PoSefq
         A0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dq5fOSrklIYCAF4CLJbybaiEZUoU2qw04ZyXliOHCLk=;
        b=RDZfPJz3mGxJEag1q6BG9PirWIcDl7yfYu6/GsKSRowdyU/UJJGDG2wkULl/tP3Y4T
         8vkSesfo4LkALQa0kDiA6zA5NFVk2lo9BredSGEA574ljr4LYq+9UM3y+2wUrXWGOODl
         1VWvEEvtv9I9uTW1+b6b4km++3eEyBjtSb3WbR1BCWiLpLUccdNtR7oDCMFBZr3Rqqip
         tZNpec/ieP2Nb4QD8oKvwvvg3gniMdyCtRUDOPxRBNOMSgdaSvPnnUhyu39U7bFo2nIa
         dS03YHXAH8Gv4xxqkI7vb6zJ4XpcDzMkPc3akpboY3CygLD5ZE07slfAEiSmvl3fj8qx
         Ka/Q==
X-Gm-Message-State: AOAM533CgmbzUQw8RxpgMKjoENEnrovS9TvyMmRxm5sNOpK/gPGD7sB+
        uJq6qIzLfO1RWvDjOU4m2nJNtw==
X-Google-Smtp-Source: ABdhPJxX8HTrcONBEyeHptMb6Sp7HwDIettmXMrBfF9gXtq11uABDs+aNwymteRY2qH2dBnQ9S2a8w==
X-Received: by 2002:a5d:4ac2:: with SMTP id y2mr13910668wrs.587.1643028556045;
        Mon, 24 Jan 2022 04:49:16 -0800 (PST)
Received: from bismarck.berto.se (p54ac53e2.dip0.t-ipconnect.de. [84.172.83.226])
        by smtp.googlemail.com with ESMTPSA id f14sm3040604wmq.36.2022.01.24.04.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 04:49:15 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 1/3] media: rcar-vin: Refactor link notify
Date:   Mon, 24 Jan 2022 13:48:56 +0100
Message-Id: <20220124124858.571363-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124124858.571363-1-niklas.soderlund+renesas@ragnatech.se>
References: <20220124124858.571363-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The code has grown organically and a lot of checks are performed for
the CSI-2 use-case even if the link notify is for a subdevice connected
to the parallel interface.

Before reworking the CSI-2 routing logic split the CSI-2 and parallel
link notify code in two separate blocks to make it clearer. There is no
functional change.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
* Changers since v1
- Fix spelling in commit message.
- Removed extra blank line in rvin_csi2_link_notify().
- Move vdev and vin lookup outside the mutex.
---
 drivers/media/platform/rcar-vin/rcar-core.c | 90 +++++++++++----------
 1 file changed, 46 insertions(+), 44 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 0186ae235113bb8f..a50bf65f37db6065 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -793,12 +793,10 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
 {
 	struct rvin_group *group = container_of(link->graph_obj.mdev,
 						struct rvin_group, mdev);
-	unsigned int master_id, channel, mask_new, i;
-	unsigned int mask = ~0;
 	struct media_entity *entity;
 	struct video_device *vdev;
-	struct media_pad *csi_pad;
-	struct rvin_dev *vin = NULL;
+	struct rvin_dev *vin;
+	unsigned int i;
 	int csi_id, ret;
 
 	ret = v4l2_pipeline_link_notify(link, flags, notification);
@@ -819,38 +817,13 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
 		if (entity->stream_count)
 			return -EBUSY;
 
-	mutex_lock(&group->lock);
-
 	/* Find the master VIN that controls the routes. */
 	vdev = media_entity_to_video_device(link->sink->entity);
 	vin = container_of(vdev, struct rvin_dev, vdev);
-	master_id = rvin_group_id_to_master(vin->id);
 
-	if (WARN_ON(!group->vin[master_id])) {
-		ret = -ENODEV;
-		goto out;
-	}
+	mutex_lock(&group->lock);
 
-	/* Build a mask for already enabled links. */
-	for (i = master_id; i < master_id + 4; i++) {
-		if (!group->vin[i])
-			continue;
-
-		/* Get remote CSI-2, if any. */
-		csi_pad = media_entity_remote_pad(
-				&group->vin[i]->vdev.entity.pads[0]);
-		if (!csi_pad)
-			continue;
-
-		csi_id = rvin_group_entity_to_remote_id(group, csi_pad->entity);
-		channel = rvin_group_csi_pad_to_channel(csi_pad->index);
-
-		mask &= rvin_csi2_get_mask(group->vin[i], csi_id, channel);
-	}
-
-	/* Add the new link to the existing mask and check if it works. */
 	csi_id = rvin_group_entity_to_remote_id(group, link->source->entity);
-
 	if (csi_id == -ENODEV) {
 		struct v4l2_subdev *sd;
 
@@ -875,25 +848,54 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
 		vin_err(vin, "Subdevice %s not registered to any VIN\n",
 			link->source->entity->name);
 		ret = -ENODEV;
-		goto out;
-	}
+	} else {
+		unsigned int master_id, channel, mask_new;
+		unsigned int mask = ~0;
+		struct media_pad *csi_pad;
 
-	channel = rvin_group_csi_pad_to_channel(link->source->index);
-	mask_new = mask & rvin_csi2_get_mask(vin, csi_id, channel);
-	vin_dbg(vin, "Try link change mask: 0x%x new: 0x%x\n", mask, mask_new);
+		master_id = rvin_group_id_to_master(vin->id);
 
-	if (!mask_new) {
-		ret = -EMLINK;
-		goto out;
-	}
+		if (WARN_ON(!group->vin[master_id])) {
+			ret = -ENODEV;
+			goto out;
+		}
+
+		/* Build a mask for already enabled links. */
+		for (i = master_id; i < master_id + 4; i++) {
+			if (!group->vin[i])
+				continue;
+
+			/* Get remote CSI-2, if any. */
+			csi_pad = media_entity_remote_pad(
+					&group->vin[i]->vdev.entity.pads[0]);
+			if (!csi_pad)
+				continue;
 
-	/* New valid CHSEL found, set the new value. */
-	ret = rvin_set_channel_routing(group->vin[master_id], __ffs(mask_new));
-	if (ret)
-		goto out;
+			csi_id = rvin_group_entity_to_remote_id(group,
+								csi_pad->entity);
+			channel = rvin_group_csi_pad_to_channel(csi_pad->index);
 
-	vin->is_csi = true;
+			mask &= rvin_csi2_get_mask(group->vin[i], csi_id, channel);
+		}
 
+		channel = rvin_group_csi_pad_to_channel(link->source->index);
+		mask_new = mask & rvin_csi2_get_mask(vin, csi_id, channel);
+		vin_dbg(vin, "Try link change mask: 0x%x new: 0x%x\n", mask,
+			mask_new);
+
+		if (!mask_new) {
+			ret = -EMLINK;
+			goto out;
+		}
+
+		/* New valid CHSEL found, set the new value. */
+		ret = rvin_set_channel_routing(group->vin[master_id],
+					       __ffs(mask_new));
+		if (ret)
+			goto out;
+
+		vin->is_csi = true;
+	}
 out:
 	mutex_unlock(&group->lock);
 
-- 
2.34.1

