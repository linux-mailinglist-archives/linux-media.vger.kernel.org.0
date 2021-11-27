Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E291460048
	for <lists+linux-media@lfdr.de>; Sat, 27 Nov 2021 17:44:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237131AbhK0Qrg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Nov 2021 11:47:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233676AbhK0Qpc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Nov 2021 11:45:32 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40610C061756
        for <linux-media@vger.kernel.org>; Sat, 27 Nov 2021 08:42:16 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id t9so8917123wrx.7
        for <linux-media@vger.kernel.org>; Sat, 27 Nov 2021 08:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R3gkSM1pd5VakS31lqAU7GttEgDzPEtgx9VPbpSRfs4=;
        b=z/zRZQH4M05YWZ4wApL6+tp31PtKtv/WLoCF16aEnEgtfaHHYzq9WjG+ZMRQ8qsF5G
         lIqcxnuc7a5l5MXBGdartx2LgQarLwYWsilHqp3Ur7fvjUAYDXBJl1I2J2wjm0R55TX+
         Znnta+U6bSq2PkpQapdo6TW+suXQGtsdSF6TiVds6eine2PNJZLEgFvpSVGvmWvaG0KI
         zb3II74B96eikXPg+OGe/L4kHM2lgY61pUVZX2OxnbM4ETNV2Trt/dtG1qaJOjPMwGM0
         nKyrRx9fDlO+BSeZrk6UR8X9rF87QHWPcasTE3Fl5kG8Nt9hqoo5zCkN2kRrnnhcmmSI
         +i2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R3gkSM1pd5VakS31lqAU7GttEgDzPEtgx9VPbpSRfs4=;
        b=cF/8S7xitiMxwMryuhtIUimCKyYx+Y0LmMSslg4UsjKVa6bmKVsYyWLPW5IrflBgnb
         xhw+9SI5oqTgZkM/L9SRDKR7yCyz4+uN1VSxZ+HAPfpbxCCIhc6WhzAHj4mVt2WL1uw4
         KcrdrImGQcCzc0ZcsD8gHiWvIDsdaYNN3lOtama6QwnBb52W+nSChOkQQ1ONdrh02qiN
         BOmRj5FcIwFSMvKR3fuZI0ED3kJhteN8T7s0X+3ZYFlm5GxHjTh+2xn+M4RBxYBnrJGd
         d4Bteb/ooS8TOpQG4JIqONJcuBq+QM5Nk+rFICfuKY7s9oWMA8l1OJVktnvNP2s7vWF7
         gWWA==
X-Gm-Message-State: AOAM531hGDPC2QvuB+6a9JeaZshe7ltM6JzY2jhhTx+q2lF7SQqJkr9m
        RstCGJnQsOyiGOckEf37qoxzYw==
X-Google-Smtp-Source: ABdhPJxaNqjUSV9aUPHbIMoYC506awgl56soNYUIMbuS2YqlBVofCibbAvDc+rKAJPbcxLDjLcRx6Q==
X-Received: by 2002:a5d:648f:: with SMTP id o15mr21037223wri.381.1638031334784;
        Sat, 27 Nov 2021 08:42:14 -0800 (PST)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id u13sm2900104wmq.14.2021.11.27.08.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 08:42:14 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/3] media: rcar-vin: Breakout media link creation
Date:   Sat, 27 Nov 2021 17:41:34 +0100
Message-Id: <20211127164135.2617686-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211127164135.2617686-1-niklas.soderlund+renesas@ragnatech.se>
References: <20211127164135.2617686-1-niklas.soderlund+renesas@ragnatech.se>
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
- Restored comment about skipping links aready created.
---
 drivers/media/platform/rcar-vin/rcar-core.c | 39 ++++++++++-----------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 4c3c092a7cb9476b..278e55f6ff3da933 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -908,6 +908,23 @@ static const struct media_device_ops rvin_csi2_media_ops = {
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
@@ -916,10 +933,6 @@ static int rvin_csi2_setup_links(struct rvin_dev *vin)
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
@@ -932,23 +945,9 @@ static int rvin_csi2_setup_links(struct rvin_dev *vin)
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
2.34.0

