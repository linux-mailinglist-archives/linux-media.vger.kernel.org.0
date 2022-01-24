Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2369E497FEB
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 13:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242611AbiAXMtZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 07:49:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240173AbiAXMtS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 07:49:18 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 275C6C061747
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 04:49:18 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id l35-20020a05600c1d2300b0034d477271c1so27480080wms.3
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 04:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=52u0tZE62QDqJHd6RAJM+bHVQgvF0Hoo7+nM5MfipMQ=;
        b=8BqFw4rNLLvjysNvXy9ntWDLJz64e7ggfM86ETJqO2/5Ctzokp08kFahCoat5RFgeb
         lUSFtiG1Ix24+RHjLHZ2CBG+RxB1yLUykGlVLzplR05Ikee+BQCUzrsnxb0oJFACe77n
         KqIHVpFqbFRV1jOgUjJRXoLYkmX/PIDgvLBhGRTxxmVl0EuNMxCgumPAI/boe6OOVX3h
         eLCN7kk4y8wz6j8Z4u3A/vEcQhbIE82sOxR8vAQKlZAdBUGZPRXYC/q+qeKPHh5ipwyj
         un4+uKCSi7sImPU1OGGCbJiiyVmiPz1uqPgVqKtAR1dvlXPSrPnAz0rL5duuDmqVmbsm
         5nlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=52u0tZE62QDqJHd6RAJM+bHVQgvF0Hoo7+nM5MfipMQ=;
        b=nZ5mKDrln6lTa+ez1jrf5oZayI9rtw8is9eLTyoGIaHN6hih3pfKzpaN8SWDEVXzet
         sZFLGOdPJZJnxxEntbPI4XEg0waae9f4NwvYhu5vDPGU2/E0j0rAPcnIpwbS4ztNAVwl
         74oKkyVA0uBXsf7B7lnIRdh0SJQ3H9ieTx7u5wTsM9QdAFijYHnFjDJHVxA4RzUUA7O5
         6v0QYPqGQpqMOaktUy3VbKOmYptcCIwqWxg8woDJW2ssG8Y1niw5IYC1R/O9oVgoiUPY
         wdupxlOorbx5tBv3qU52nzuVddZAE5vTdBtK+xlemadu9PSLQ9NyBaZXGtGaN4QCn7Vm
         jRHQ==
X-Gm-Message-State: AOAM530TQs+P9E/v2sj4B9Vax+OzAtdOgbCkiMbSefAYOHbDbYYiuZSk
        PpnEPEqo8fdUQbxbYREGbBjtyA==
X-Google-Smtp-Source: ABdhPJxwTLyhpSMzJyU9ayW0WqdChUo56vQljz4DZ0EcV0RhhCCThc+pqjfxxTVBTOMSQeij5iCJMg==
X-Received: by 2002:a7b:cb90:: with SMTP id m16mr1713202wmi.3.1643028556688;
        Mon, 24 Jan 2022 04:49:16 -0800 (PST)
Received: from bismarck.berto.se (p54ac53e2.dip0.t-ipconnect.de. [84.172.83.226])
        by smtp.googlemail.com with ESMTPSA id f14sm3040604wmq.36.2022.01.24.04.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 04:49:16 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 2/3] media: rcar-vin: Breakout media link creation
Date:   Mon, 24 Jan 2022 13:48:57 +0100
Message-Id: <20220124124858.571363-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124124858.571363-1-niklas.soderlund+renesas@ragnatech.se>
References: <20220124124858.571363-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In preparation of creating more links to allow for full Virtual Channel
routing within the CSI-2 block break out the link creation logic to a
helper function as the logic will grow in future work.

There is no functional change.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
* Changers since v1
- Rename rvin_csi2_add_route() to rvin_csi2_create_link().
- Restored comment about skipping links already created.
---
 drivers/media/platform/rcar-vin/rcar-core.c | 39 ++++++++++-----------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index a50bf65f37db6065..0fa330e02bd8437a 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -906,6 +906,23 @@ static const struct media_device_ops rvin_csi2_media_ops = {
 	.link_notify = rvin_csi2_link_notify,
 };
 
+static int rvin_csi2_create_link(struct rvin_group *group,
+				 const struct rvin_group_route *route)
+
+{
+	struct media_entity *source = &group->remotes[route->csi].subdev->entity;
+	unsigned int source_idx = rvin_group_csi_channel_to_pad(route->channel);
+	struct media_entity *sink = &group->vin[route->vin]->vdev.entity;
+	struct media_pad *source_pad = &source->pads[source_idx];
+	struct media_pad *sink_pad = &sink->pads[0];
+
+	/* Skip if link already exists. */
+	if (media_entity_find_link(source_pad, sink_pad))
+		return 0;
+
+	return media_create_pad_link(source, source_idx, sink, 0, 0);
+}
+
 static int rvin_csi2_setup_links(struct rvin_dev *vin)
 {
 	const struct rvin_group_route *route;
@@ -914,10 +931,6 @@ static int rvin_csi2_setup_links(struct rvin_dev *vin)
 	/* Create all media device links between VINs and CSI-2's. */
 	mutex_lock(&vin->group->lock);
 	for (route = vin->info->routes; route->mask; route++) {
-		struct media_pad *source_pad, *sink_pad;
-		struct media_entity *source, *sink;
-		unsigned int source_idx;
-
 		/* Check that VIN is part of the group. */
 		if (!vin->group->vin[route->vin])
 			continue;
@@ -930,23 +943,9 @@ static int rvin_csi2_setup_links(struct rvin_dev *vin)
 		if (!vin->group->remotes[route->csi].subdev)
 			continue;
 
-		source = &vin->group->remotes[route->csi].subdev->entity;
-		source_idx = rvin_group_csi_channel_to_pad(route->channel);
-		source_pad = &source->pads[source_idx];
-
-		sink = &vin->group->vin[route->vin]->vdev.entity;
-		sink_pad = &sink->pads[0];
-
-		/* Skip if link already exists. */
-		if (media_entity_find_link(source_pad, sink_pad))
-			continue;
-
-		ret = media_create_pad_link(source, source_idx, sink, 0, 0);
-		if (ret) {
-			vin_err(vin, "Error adding link from %s to %s\n",
-				source->name, sink->name);
+		ret = rvin_csi2_create_link(vin->group, route);
+		if (ret)
 			break;
-		}
 	}
 	mutex_unlock(&vin->group->lock);
 
-- 
2.34.1

