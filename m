Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1605435458
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 22:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231683AbhJTUL5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 16:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231685AbhJTUL4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 16:11:56 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64709C061753
        for <linux-media@vger.kernel.org>; Wed, 20 Oct 2021 13:09:41 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id p21so20751515wmq.1
        for <linux-media@vger.kernel.org>; Wed, 20 Oct 2021 13:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ACNMzt+XqI0GZg8LopKtU2eJDMEjSdPTI0I6ZKO4Cns=;
        b=vjcsZM6eD3Qpe0+3RwoM+98+K0uxj+vguH1WrNQvxhw/bP0W2abH9yVLmygZVY2qR0
         SXFJLtlDEjfft0M6cC9WsvoQJNiHAFMqOjGJYkZm5n5ScpA/6KvLUBReDe5DAH0JpsL4
         rSqjzj7my8fJ3sG+CLLSIEjHPvDQHLimgi+gClm6A7xYrQ6zuclRCMexRFfurK/HXvHX
         NL7Xwq/i21tHzpK64OUUadQgDao0tOqBFScU4mTF0cJYml1x/zvwPI1dpcZPCsP0E1W1
         LdUrTR5eqHEMxoxgshvXNGPyCmJdeHYSXMOaIc2w57uMTzdZ++FTGUJ/Uv8dl0C+ZL7c
         tKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ACNMzt+XqI0GZg8LopKtU2eJDMEjSdPTI0I6ZKO4Cns=;
        b=MMQNw3v9LaiGMZiJVlM9VQFh8ifteRZkG4kyksMEjB/HUz+MGVbq9mHgAvyiiGHcK/
         y6PjUaxXPMjNciQ/t3kOSELjH6Oe6DXIN4eEwxqA5kxOx8ykg2lP1H1FEc9NjrpZtRjj
         M7brWk3+Wx5IsVF19n4orcQXMstxjy7qdghzKPn+tfsTVlv4cp+T7YZ6f464CsOLWrzx
         2fFY4aPNAGYhg0XlPW3UwzhGMvz92Em3ofCwZUgLd0GtL4FHxFJ2FQctlixcZBB17WFr
         tH6NfbdDa3Zxtm+6tZW1Ds1uiZvkzrqIg5mxvqsvlifs1Qb97FTSFkLOlO1rJvc2dvfL
         9ppg==
X-Gm-Message-State: AOAM531xqZvtRI5cq1VHh481Np0IdhiWXhDdRWbc7vDU+Hq9obU5N2yC
        eGMbrbZKJXBM+RnDSLFZMVXfVtMiZkxYMA==
X-Google-Smtp-Source: ABdhPJwtw8Vwzar98nVv7ZjfCCVNQVFmICcR2LXxZRrmXE44142u7aE28nOek99dUW2byTMa9hRNWA==
X-Received: by 2002:a1c:f213:: with SMTP id s19mr16018758wmc.169.1634760579925;
        Wed, 20 Oct 2021 13:09:39 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id x7sm2849904wrq.69.2021.10.20.13.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 13:09:39 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/3] media: rcar-vin: Refactor link notify
Date:   Wed, 20 Oct 2021 22:02:23 +0200
Message-Id: <20211020200225.1956048-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211020200225.1956048-1-niklas.soderlund+renesas@ragnatech.se>
References: <20211020200225.1956048-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The code have grown organically and a lot of checks are preformed for
the CSI-2 use-case even if the link notify is for a subdevice connected
to the parallel interface.

Before reworking the CSI-2 routing logic split the CSI-2 and parallel
link notify code in two separate blocks to make it clearer. There is no
functional change.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 87 +++++++++++----------
 1 file changed, 45 insertions(+), 42 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 1d92cc8ede8f8a3e..bd960c348ba5228c 100644
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
@@ -826,33 +824,9 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
 	/* Find the master VIN that controls the routes. */
 	vdev = media_entity_to_video_device(link->sink->entity);
 	vin = container_of(vdev, struct rvin_dev, vdev);
-	master_id = rvin_group_id_to_master(vin->id);
 
-	if (WARN_ON(!group->vin[master_id])) {
-		ret = -ENODEV;
-		goto out;
-	}
 
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
 
@@ -877,25 +851,54 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
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
2.33.1

