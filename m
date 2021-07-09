Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2428A3C25E8
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 16:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232267AbhGIO3S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 10:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbhGIO3R (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 10:29:17 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95C74C0613DD
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 07:26:33 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id m2so1381077wrq.2
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 07:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dIjTTygeZbv7LtQc+CXznZBMY8ib1/JEXHAQGomqmb4=;
        b=UL25GC+7CLmiuJnX9dR2EdAxAzLbaB/3x8LUZLp4bagroHUG6pOwERyLwBu41NnaJ+
         iJzoGRPfkhVbPyZvjpvLrMiwt+rYvWoXifBeCD4Q4EODrlwqd8bW0FDnONQGJz/lq83c
         JfGZhAgBDja5z9TnIbpRdbKGAdMD3iu9q4Y7McV3pmaT0Kuz03VM2OdpMZRo6gfVx90P
         jt6RfLE9RVCbWh8Z/ebXWjfZp82l5VWxsur7Gfhi3aTWSDyojOsGiWoPANl0Jg6EsHbT
         OCdD9553x4kJV05TSGqg5JHwVdiZfxeA2OHhN0Qv4jK+3cy4Vd0DHL1zBmuyH2dF7woB
         VkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dIjTTygeZbv7LtQc+CXznZBMY8ib1/JEXHAQGomqmb4=;
        b=LizR2l9sTR2GP/bhBZZYj7tqhEdkIHcZREo4egmQfe0BxBn7wEt/iq8NmSwWx6MgzL
         T7Z7lho4pS7xXgCaApA8FEImDzIHC4GsZXvlZK2KCH1jKpksRxqm+YhjeOm26ENpytNn
         JfQ7xUf6v8x0iR3N9mBapvxIAYaG3q3GC4JrXnwHGrWmxLn8bAy3BETRKqxjwQ8+qUpe
         GaC8fAK7WZ+a+Z4pn+FHUa9Uv9GX1U/BCTJAx1qtFTNyMeNmHVsj2KZPF5SGT2sAeUKL
         BA4Fjr5KqZiEL8hnLyTUuJXf/DHAGc5gA6bTzTUjHUWEJckHyc9a53pnJ+T1b/Gyrdi4
         ZAKg==
X-Gm-Message-State: AOAM531nBRBeggK5Bnk90J7bQnH2GXPpGrE2bmg0eLng7WaTR9IOTBI4
        yYYKCHBePxmn4GmtJJDDXsMz7g==
X-Google-Smtp-Source: ABdhPJwvj2CVc25NMv1Z7BTdTj/pTk8SXWP/SiE2AhEwEIIAlxJnPRB6HNPpfBFHNc7ZnuhOnwVr4g==
X-Received: by 2002:a5d:48ce:: with SMTP id p14mr42795588wrs.170.1625840792107;
        Fri, 09 Jul 2021 07:26:32 -0700 (PDT)
Received: from bismarck.berto.se (p4fca2710.dip0.t-ipconnect.de. [79.202.39.16])
        by smtp.googlemail.com with ESMTPSA id f82sm11034245wmf.25.2021.07.09.07.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 07:26:31 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 05/11] rcar-vin: Rename array storing subdevice information
Date:   Fri,  9 Jul 2021 16:25:54 +0200
Message-Id: <20210709142600.651718-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709142600.651718-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210709142600.651718-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The VIN group have always been connected to CSI-2 receivers and this
have spilled over to the naming of the array storing the subdevice
information. In preparation for connecting other types of subdevices
rename the array to remotes.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 32 ++++++++++-----------
 drivers/media/platform/rcar-vin/rcar-vin.h  |  8 ++++--
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 674766be1ad590a7..a44cfa993ec8893d 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -49,16 +49,16 @@
  */
 
 /* group lock should be held when calling this function. */
-static int rvin_group_entity_to_csi_id(struct rvin_group *group,
-				       struct media_entity *entity)
+static int rvin_group_entity_to_remote_id(struct rvin_group *group,
+					  struct media_entity *entity)
 {
 	struct v4l2_subdev *sd;
 	unsigned int i;
 
 	sd = media_entity_to_v4l2_subdev(entity);
 
-	for (i = 0; i < RVIN_CSI_MAX; i++)
-		if (group->csi[i].subdev == sd)
+	for (i = 0; i < RVIN_REMOTES_MAX; i++)
+		if (group->remotes[i].subdev == sd)
 			return i;
 
 	return -ENODEV;
@@ -163,14 +163,14 @@ static int rvin_group_link_notify(struct media_link *link, u32 flags,
 		if (!csi_pad)
 			continue;
 
-		csi_id = rvin_group_entity_to_csi_id(group, csi_pad->entity);
+		csi_id = rvin_group_entity_to_remote_id(group, csi_pad->entity);
 		channel = rvin_group_csi_pad_to_channel(csi_pad->index);
 
 		mask &= rvin_group_get_mask(group->vin[i], csi_id, channel);
 	}
 
 	/* Add the new link to the existing mask and check if it works. */
-	csi_id = rvin_group_entity_to_csi_id(group, link->source->entity);
+	csi_id = rvin_group_entity_to_remote_id(group, link->source->entity);
 
 	if (csi_id == -ENODEV) {
 		struct v4l2_subdev *sd;
@@ -766,10 +766,10 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 			continue;
 
 		/* Check that CSI-2 is part of the group. */
-		if (!vin->group->csi[route->csi].subdev)
+		if (!vin->group->remotes[route->csi].subdev)
 			continue;
 
-		source = &vin->group->csi[route->csi].subdev->entity;
+		source = &vin->group->remotes[route->csi].subdev->entity;
 		source_idx = rvin_group_csi_channel_to_pad(route->channel);
 		source_pad = &source->pads[source_idx];
 
@@ -806,10 +806,10 @@ static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
 	mutex_lock(&vin->group->lock);
 
 	for (i = 0; i < RVIN_CSI_MAX; i++) {
-		if (vin->group->csi[i].asd != asd)
+		if (vin->group->remotes[i].asd != asd)
 			continue;
-		vin->group->csi[i].subdev = NULL;
-		vin_dbg(vin, "Unbind CSI-2 %s from slot %u\n", subdev->name, i);
+		vin->group->remotes[i].subdev = NULL;
+		vin_dbg(vin, "Unbind %s from slot %u\n", subdev->name, i);
 		break;
 	}
 
@@ -828,10 +828,10 @@ static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
 	mutex_lock(&vin->group->lock);
 
 	for (i = 0; i < RVIN_CSI_MAX; i++) {
-		if (vin->group->csi[i].asd != asd)
+		if (vin->group->remotes[i].asd != asd)
 			continue;
-		vin->group->csi[i].subdev = subdev;
-		vin_dbg(vin, "Bound CSI-2 %s to slot %u\n", subdev->name, i);
+		vin->group->remotes[i].subdev = subdev;
+		vin_dbg(vin, "Bound %s to slot %u\n", subdev->name, i);
 		break;
 	}
 
@@ -883,7 +883,7 @@ static int rvin_mc_parse_of(struct rvin_dev *vin, unsigned int id)
 		goto out;
 	}
 
-	vin->group->csi[vep.base.id].asd = asd;
+	vin->group->remotes[vep.base.id].asd = asd;
 
 	vin_dbg(vin, "Add group OF device %pOF to slot %u\n",
 		to_of_node(fwnode), vep.base.id);
@@ -928,7 +928,7 @@ static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
 			continue;
 
 		for (id = 0; id < RVIN_CSI_MAX; id++) {
-			if (vin->group->csi[id].asd)
+			if (vin->group->remotes[id].asd)
 				continue;
 
 			ret = rvin_mc_parse_of(vin->group->vin[i], id);
diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
index b263ead4db2bfb08..39207aaf39ef9391 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -48,6 +48,8 @@ enum rvin_csi_id {
 	RVIN_CSI_MAX,
 };
 
+#define RVIN_REMOTES_MAX RVIN_CSI_MAX
+
 /**
  * enum rvin_dma_state - DMA states
  * @STOPPED:   No operation in progress
@@ -267,8 +269,8 @@ struct rvin_dev {
  * @count:		number of enabled VIN instances found in DT
  * @notifier:		group notifier for CSI-2 async subdevices
  * @vin:		VIN instances which are part of the group
- * @csi:		array of pairs of fwnode and subdev pointers
- *			to all CSI-2 subdevices.
+ * @remotes:		array of pairs of fwnode and subdev pointers
+ *			to all remote subdevices.
  */
 struct rvin_group {
 	struct kref refcount;
@@ -283,7 +285,7 @@ struct rvin_group {
 	struct {
 		struct v4l2_async_subdev *asd;
 		struct v4l2_subdev *subdev;
-	} csi[RVIN_CSI_MAX];
+	} remotes[RVIN_REMOTES_MAX];
 };
 
 int rvin_dma_register(struct rvin_dev *vin, int irq);
-- 
2.32.0

