Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8EDF460047
	for <lists+linux-media@lfdr.de>; Sat, 27 Nov 2021 17:44:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234777AbhK0Qrf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Nov 2021 11:47:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233274AbhK0Qpc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Nov 2021 11:45:32 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB908C061748
        for <linux-media@vger.kernel.org>; Sat, 27 Nov 2021 08:42:15 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id y196so10742294wmc.3
        for <linux-media@vger.kernel.org>; Sat, 27 Nov 2021 08:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jp77MKE/U4T9c+FwNAWUTuF78plz492lxF0sUt5DL5w=;
        b=LXPH7JjwQXdBgbG0YwR/1WEauHe52AyQ6DmrBqulBAn9Lf3dVVAALwslKjA7COT6yB
         MULBlrE4UFbm7mwaZ6/Y7xznJPOhvyUNmF/V4/s3dH66tTgLcNujubcTEmgvDRbQUMRT
         uKa88/SnPBY3KqfLxdHDWiI6GkXTCX9XVG/ku0crNdbblSNj69jB8fwhVk/HWrr2Eoo4
         rx4Q5oN44Hh18Kw0GQlNiTWRaj9cxFywVMdLTU+onWnhmZbC3TzFOscEk+yGnU0oDnvC
         eUKEL1r9q2c6J+CuyGKr/Lm0nZ2cEjokemVJzBAZOFXvDhg2S0B0nvf3S/TmDSm4me06
         pozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jp77MKE/U4T9c+FwNAWUTuF78plz492lxF0sUt5DL5w=;
        b=ULWlO3ddfS/b7JtsDqhCv/7dJCBiLKeIcsvOarpVuOXWPyL5f+ohcn36b9wqLeRZv7
         +SPPfoBroaAJ5HXqu7qmZ0SLI+nVqQQEUsFXGGdMwpvCy8z9pu3QvO1Jj7D88c70fDO5
         BAm1OIVlAfAm3vT+Sj5CB1yjpnu7ihzd0aaTTNOJ2iQrUj8r3ULdG6zTrpQvFS6GaSro
         /KU+PtwBNMztf/kCnGT9s6RCVFK0ak2gCiPTXVZvRkDHXhW0NXko4QHIcOwzg6SHvW8T
         m4RGONiJyUU2OJpeT+YLw+vq+58ugDRsg98Y5dq0usnEawFwhBtzpUz+sB14D0YvFB/Q
         PdSg==
X-Gm-Message-State: AOAM532oTeBYQ8kHkHxKTtzk/HVvVhK/OplDmwjpeFMjcY58Yn9sudvk
        SAE/wuVyJrpXYY6l6vwL85uUXA==
X-Google-Smtp-Source: ABdhPJzDXEZznePExCfd/hxbrc9D9+67a6gSP54xWkC5SS/EPwpk/jj1yLB40pjECT+5K7xqDNYTxg==
X-Received: by 2002:a1c:f20e:: with SMTP id s14mr24320938wmc.186.1638031334197;
        Sat, 27 Nov 2021 08:42:14 -0800 (PST)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id u13sm2900104wmq.14.2021.11.27.08.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 08:42:13 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 1/3] media: rcar-vin: Refactor link notify
Date:   Sat, 27 Nov 2021 17:41:33 +0100
Message-Id: <20211127164135.2617686-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211127164135.2617686-1-niklas.soderlund+renesas@ragnatech.se>
References: <20211127164135.2617686-1-niklas.soderlund+renesas@ragnatech.se>
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
index 1d92cc8ede8f8a3e..4c3c092a7cb9476b 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -795,12 +795,10 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
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
@@ -821,38 +819,13 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
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
 
@@ -877,25 +850,54 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
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
2.34.0

