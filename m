Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47454497FEE
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 13:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242586AbiAXMt0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 07:49:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242558AbiAXMtU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 07:49:20 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07724C06173D
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 04:49:19 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id e8so11603742wrc.0
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 04:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VEzmrBelBRYdmjlrwCmQOuGOgoXseNQtFzIrGgQLQ7A=;
        b=bvRgcEdUUXO+DsP1545DedciGrp21k6f1YamR9+XlpBgcDcD49lEoYxn1cRn4dPslS
         KQdcx1t/CKn8rtYmFDn0YddY8qlVuSzoh3+9F/nXjy32kg/fYLMlPRwCBz2htni6b11e
         3kimAM5iW0gb/RPtSOGdTQTWOk+4OsATQRGoQsTTW82d3T70qgP3ctSM8n1gmxwv+Vfh
         y+7GM4pC90/6vFvvcPr2+graXpabWJk2Dot9uW/8aPqwIxI17P8b2tkpIHqDiENOarSp
         PPxHpkO5QPu3jlbKXKZ9jc4e97XczExDLbI+aTXOht+bJaH8nuvE1OWA7S2H7SUQCvbR
         iIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VEzmrBelBRYdmjlrwCmQOuGOgoXseNQtFzIrGgQLQ7A=;
        b=43V1mdluSV9nb7qb+GuKDn3jQ1zZOE0u4JIMyQ2yZnN0IP/3ynnO8dApcK3uJrYtoo
         7C6RsTZt+peqHqdlfqS1U3GN7Cp1ea2qrppFjl9I5SsQb/bcf2fs57kfTgi1TiWQFn2y
         4/TB14KRSxm9DxreHeSExDycWAVI7w7Qsx9brROhO8WpG9guX7+pPiUVxfAH26J312gm
         oV3MrX6FhddQvZ1VL2HdEvaiYgbybsCnr3pohretSXwlLY+qzdCVg3LlcP1NEOGJIIIk
         8oHvyFtHxsTgTHTTzTiCSOZUoPEpYZefSaVQM0pCXSVPVIRQ/ShG8rTb3BSjq8q3Nk0N
         GZow==
X-Gm-Message-State: AOAM5306smwaGlr3up3bVeGQuZnW53l5gvO8lQoM4wlZn+ixKnooLxkI
        wWgF31Bv2B1UkARxeLJw2DAdkgbfJwtjPq+r
X-Google-Smtp-Source: ABdhPJziIg3l4hnwpF+4hrZGgVjvRHp5A+lbRyZTCtgcpHqGtwNv4jCZQmxMzujakIcVny4Auf8fng==
X-Received: by 2002:a05:6000:184c:: with SMTP id c12mr4023371wri.382.1643028557424;
        Mon, 24 Jan 2022 04:49:17 -0800 (PST)
Received: from bismarck.berto.se (p54ac53e2.dip0.t-ipconnect.de. [84.172.83.226])
        by smtp.googlemail.com with ESMTPSA id f14sm3040604wmq.36.2022.01.24.04.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 04:49:17 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 3/3] media: rcar-{csi2,vin}: Move to full Virtual Channel routing per CSI-2 IP
Date:   Mon, 24 Jan 2022 13:48:58 +0100
Message-Id: <20220124124858.571363-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124124858.571363-1-niklas.soderlund+renesas@ragnatech.se>
References: <20220124124858.571363-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When Gen3 support was first added to this R-Car VIN and CSI-2 driver the
routing was centred around the CHSEL register which multiplexes the
different parallel buses that sit between the CSI-2 receivers source
side and the VIN dma engines. This was a bad design as the multiplexing
do allow for only a few combinations and do not play nice with many
video streams in the system.

For example it's only possible for CSI-2 Virtual Channels 0 and 1 of any
given CSI-2 receiver to be used together with the scaler.

Later datasheets have expanded the documentation and it is now possible
to improve on this design by allowing any Virtual Channel to be routed
to any R-Car VIN instance, provided that there exists a parallel bus
between them. This increases the flexibility as all Virtual Channels can
now be used together with the scaler for example.

The redesign is not however perfect. While the new design allows for
many more routes, two constrains limit a small portion of routes that
was possible in the old design but are no more.

- It is no longer possible to route the same CSI-2 and VC to more then
  one VIN at a time. This was theoretically possible before if the
  specific SoC allowed for the same CSI-2 and VC to be routed to two
  different VIN capture groups.

- It is no longer possible to simultaneously mix links from two CSI-2 IP
  blocks to the same VIN capture group.

  For example if VIN2 is capturing from CSI40 then VIN{0,1,3} must also
  capture from CSI40. While VIN{4,5,6,7} is still free to capture from
  any other CSI-2 IP in the system. Once all VIN{0,1,2,3} links to CSI40
  are disabled that VIN capture group is free again to capture from any
  other CSI-2 IP it is connected to.

At the core of the redesign is greater cooperator of the R-Car VIN and
CSI-2 drivers in configuring the routing. The VIN driver is after this
change only responsible to configure the full VIN capture groups
parallel buses to be to a particular CSI-2 IP. While the configuration
of which CSI-2 Virtual Channel is outputted on which of the R-Car CSI-2
IP output ports is handled by the CSI-2 driver.

Before this change the CSI-2 Virtual Channel to output port was static
in the CSI-2 driver and the different links only manipulated the VIN
capture groups CHSEL register. With this change both the CHSEl register
and the CSI-2 routing VCDT registers are modified for greater
flexibility.

This change touches both the R-Car VIN and R-Car CSI-2 drivers in the
same commit as both drivers cooperate closely and one change without the
other would more or less break video capture.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
* Changers since v1
- Fix spelling in commit message.
- Fix incorrect routing table for r8a7795es1.
- Remove usage of BUG_ON() and recover instead.
---
 drivers/media/platform/rcar-vin/rcar-core.c | 320 +++++---------------
 drivers/media/platform/rcar-vin/rcar-csi2.c |  58 +++-
 drivers/media/platform/rcar-vin/rcar-dma.c  |   2 +-
 drivers/media/platform/rcar-vin/rcar-vin.h  |  18 +-
 4 files changed, 139 insertions(+), 259 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 0fa330e02bd8437a..ef8a12bd63cb80d8 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -743,27 +743,6 @@ static int rvin_parallel_init(struct rvin_dev *vin)
  * CSI-2
  */
 
-static unsigned int rvin_csi2_get_mask(struct rvin_dev *vin,
-				       enum rvin_csi_id csi_id,
-				       unsigned char channel)
-{
-	const struct rvin_group_route *route;
-	unsigned int mask = 0;
-
-	for (route = vin->info->routes; route->mask; route++) {
-		if (route->vin == vin->id &&
-		    route->csi == csi_id &&
-		    route->channel == channel) {
-			vin_dbg(vin,
-				"Adding route: vin: %d csi: %d channel: %d\n",
-				route->vin, route->csi, route->channel);
-			mask |= route->mask;
-		}
-	}
-
-	return mask;
-}
-
 /*
  * Link setup for the links between a VIN and a CSI-2 receiver is a bit
  * complex. The reason for this is that the register controlling routing
@@ -849,9 +828,9 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
 			link->source->entity->name);
 		ret = -ENODEV;
 	} else {
-		unsigned int master_id, channel, mask_new;
-		unsigned int mask = ~0;
-		struct media_pad *csi_pad;
+		const struct rvin_group_route *route;
+		unsigned int chsel = UINT_MAX;
+		unsigned int master_id;
 
 		master_id = rvin_group_id_to_master(vin->id);
 
@@ -860,8 +839,10 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
 			goto out;
 		}
 
-		/* Build a mask for already enabled links. */
+		/* Make sure group is connected to same CSI-2 */
 		for (i = master_id; i < master_id + 4; i++) {
+			struct media_pad *csi_pad;
+
 			if (!group->vin[i])
 				continue;
 
@@ -871,26 +852,28 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
 			if (!csi_pad)
 				continue;
 
-			csi_id = rvin_group_entity_to_remote_id(group,
-								csi_pad->entity);
-			channel = rvin_group_csi_pad_to_channel(csi_pad->index);
-
-			mask &= rvin_csi2_get_mask(group->vin[i], csi_id, channel);
+			if (csi_pad->entity != link->source->entity) {
+				vin_dbg(vin, "Already attached to %s\n",
+					csi_pad->entity->name);
+				ret = -EBUSY;
+				goto out;
+			}
 		}
 
-		channel = rvin_group_csi_pad_to_channel(link->source->index);
-		mask_new = mask & rvin_csi2_get_mask(vin, csi_id, channel);
-		vin_dbg(vin, "Try link change mask: 0x%x new: 0x%x\n", mask,
-			mask_new);
+		for (route = vin->info->routes; route->chsel; route++) {
+			if (route->master == master_id && route->csi == csi_id) {
+				chsel = route->chsel;
+				break;
+			}
+		}
 
-		if (!mask_new) {
-			ret = -EMLINK;
+		if (chsel == UINT_MAX) {
+			vin_err(vin, "No CHSEL value found\n");
+			ret = -EINVAL;
 			goto out;
 		}
 
-		/* New valid CHSEL found, set the new value. */
-		ret = rvin_set_channel_routing(group->vin[master_id],
-					       __ffs(mask_new));
+		ret = rvin_set_channel_routing(group->vin[master_id], chsel);
 		if (ret)
 			goto out;
 
@@ -906,47 +889,60 @@ static const struct media_device_ops rvin_csi2_media_ops = {
 	.link_notify = rvin_csi2_link_notify,
 };
 
-static int rvin_csi2_create_link(struct rvin_group *group,
-				 const struct rvin_group_route *route)
+static int rvin_csi2_create_link(struct rvin_group *group, unsigned int id,
+				const struct rvin_group_route *route)
 
 {
 	struct media_entity *source = &group->remotes[route->csi].subdev->entity;
-	unsigned int source_idx = rvin_group_csi_channel_to_pad(route->channel);
-	struct media_entity *sink = &group->vin[route->vin]->vdev.entity;
-	struct media_pad *source_pad = &source->pads[source_idx];
+	struct media_entity *sink = &group->vin[id]->vdev.entity;
 	struct media_pad *sink_pad = &sink->pads[0];
+	unsigned int channel;
+	int ret;
 
-	/* Skip if link already exists. */
-	if (media_entity_find_link(source_pad, sink_pad))
-		return 0;
+	for (channel = 0; channel < 4; channel++) {
+		unsigned int source_idx = rvin_group_csi_channel_to_pad(channel);
+		struct media_pad *source_pad = &source->pads[source_idx];
 
-	return media_create_pad_link(source, source_idx, sink, 0, 0);
+		/* Skip if link already exists. */
+		if (media_entity_find_link(source_pad, sink_pad))
+			continue;
+
+		ret = media_create_pad_link(source, source_idx, sink, 0, 0);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static int rvin_csi2_setup_links(struct rvin_dev *vin)
 {
 	const struct rvin_group_route *route;
+	unsigned int id;
 	int ret = -EINVAL;
 
 	/* Create all media device links between VINs and CSI-2's. */
 	mutex_lock(&vin->group->lock);
-	for (route = vin->info->routes; route->mask; route++) {
-		/* Check that VIN is part of the group. */
-		if (!vin->group->vin[route->vin])
-			continue;
-
+	for (route = vin->info->routes; route->chsel; route++) {
 		/* Check that VIN' master is part of the group. */
-		if (!vin->group->vin[rvin_group_id_to_master(route->vin)])
+		if (!vin->group->vin[route->master])
 			continue;
 
 		/* Check that CSI-2 is part of the group. */
 		if (!vin->group->remotes[route->csi].subdev)
 			continue;
 
-		ret = rvin_csi2_create_link(vin->group, route);
-		if (ret)
-			break;
+		for (id = route->master; id < route->master + 4; id++) {
+			/* Check that VIN is part of the group. */
+			if (!vin->group->vin[id])
+				continue;
+
+			ret = rvin_csi2_create_link(vin->group, id, route);
+			if (ret)
+				goto out;
+		}
 	}
+out:
 	mutex_unlock(&vin->group->lock);
 
 	return ret;
@@ -1156,30 +1152,9 @@ static const struct rvin_info rcar_info_gen2 = {
 };
 
 static const struct rvin_group_route rcar_info_r8a774e1_routes[] = {
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 0, .mask = BIT(0) | BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 0, .mask = BIT(1) | BIT(4) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 0, .mask = BIT(2) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 1, .mask = BIT(0) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 1, .mask = BIT(1) | BIT(3) },
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 1, .mask = BIT(2) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 1, .mask = BIT(4) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 2, .mask = BIT(0) },
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 2, .mask = BIT(1) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 2, .mask = BIT(2) },
-	{ .csi = RVIN_CSI40, .channel = 2, .vin = 2, .mask = BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 2, .vin = 2, .mask = BIT(4) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 3, .mask = BIT(0) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 3, .mask = BIT(1) | BIT(2) },
-	{ .csi = RVIN_CSI40, .channel = 3, .vin = 3, .mask = BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 3, .vin = 3, .mask = BIT(4) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 4, .mask = BIT(1) | BIT(4) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 5, .mask = BIT(0) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 5, .mask = BIT(4) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 6, .mask = BIT(0) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 6, .mask = BIT(2) },
-	{ .csi = RVIN_CSI20, .channel = 2, .vin = 6, .mask = BIT(4) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 7, .mask = BIT(1) | BIT(2) },
-	{ .csi = RVIN_CSI20, .channel = 3, .vin = 7, .mask = BIT(4) },
+	{ .master = 0, .csi = RVIN_CSI20, .chsel = 0x04 },
+	{ .master = 0, .csi = RVIN_CSI40, .chsel = 0x03 },
+	{ .master = 4, .csi = RVIN_CSI20, .chsel = 0x04 },
 	{ /* Sentinel */ }
 };
 
@@ -1192,38 +1167,10 @@ static const struct rvin_info rcar_info_r8a774e1 = {
 };
 
 static const struct rvin_group_route rcar_info_r8a7795_routes[] = {
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 0, .mask = BIT(0) | BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 0, .mask = BIT(1) | BIT(4) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 0, .mask = BIT(2) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 1, .mask = BIT(0) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 1, .mask = BIT(1) | BIT(3) },
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 1, .mask = BIT(2) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 1, .mask = BIT(4) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 2, .mask = BIT(0) },
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 2, .mask = BIT(1) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 2, .mask = BIT(2) },
-	{ .csi = RVIN_CSI40, .channel = 2, .vin = 2, .mask = BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 2, .vin = 2, .mask = BIT(4) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 3, .mask = BIT(0) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 3, .mask = BIT(1) | BIT(2) },
-	{ .csi = RVIN_CSI40, .channel = 3, .vin = 3, .mask = BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 3, .vin = 3, .mask = BIT(4) },
-	{ .csi = RVIN_CSI41, .channel = 0, .vin = 4, .mask = BIT(0) | BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 4, .mask = BIT(1) | BIT(4) },
-	{ .csi = RVIN_CSI41, .channel = 1, .vin = 4, .mask = BIT(2) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 5, .mask = BIT(0) },
-	{ .csi = RVIN_CSI41, .channel = 1, .vin = 5, .mask = BIT(1) | BIT(3) },
-	{ .csi = RVIN_CSI41, .channel = 0, .vin = 5, .mask = BIT(2) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 5, .mask = BIT(4) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 6, .mask = BIT(0) },
-	{ .csi = RVIN_CSI41, .channel = 0, .vin = 6, .mask = BIT(1) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 6, .mask = BIT(2) },
-	{ .csi = RVIN_CSI41, .channel = 2, .vin = 6, .mask = BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 2, .vin = 6, .mask = BIT(4) },
-	{ .csi = RVIN_CSI41, .channel = 1, .vin = 7, .mask = BIT(0) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 7, .mask = BIT(1) | BIT(2) },
-	{ .csi = RVIN_CSI41, .channel = 3, .vin = 7, .mask = BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 3, .vin = 7, .mask = BIT(4) },
+	{ .master = 0, .csi = RVIN_CSI20, .chsel = 0x04 },
+	{ .master = 0, .csi = RVIN_CSI40, .chsel = 0x03 },
+	{ .master = 4, .csi = RVIN_CSI20, .chsel = 0x04 },
+	{ .master = 4, .csi = RVIN_CSI41, .chsel = 0x03 },
 	{ /* Sentinel */ }
 };
 
@@ -1237,48 +1184,12 @@ static const struct rvin_info rcar_info_r8a7795 = {
 };
 
 static const struct rvin_group_route rcar_info_r8a7795es1_routes[] = {
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 0, .mask = BIT(0) | BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 0, .mask = BIT(1) | BIT(4) },
-	{ .csi = RVIN_CSI21, .channel = 0, .vin = 0, .mask = BIT(2) | BIT(5) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 1, .mask = BIT(0) },
-	{ .csi = RVIN_CSI21, .channel = 0, .vin = 1, .mask = BIT(1) },
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 1, .mask = BIT(2) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 1, .mask = BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 1, .mask = BIT(4) },
-	{ .csi = RVIN_CSI21, .channel = 1, .vin = 1, .mask = BIT(5) },
-	{ .csi = RVIN_CSI21, .channel = 0, .vin = 2, .mask = BIT(0) },
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 2, .mask = BIT(1) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 2, .mask = BIT(2) },
-	{ .csi = RVIN_CSI40, .channel = 2, .vin = 2, .mask = BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 2, .vin = 2, .mask = BIT(4) },
-	{ .csi = RVIN_CSI21, .channel = 2, .vin = 2, .mask = BIT(5) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 3, .mask = BIT(0) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 3, .mask = BIT(1) },
-	{ .csi = RVIN_CSI21, .channel = 1, .vin = 3, .mask = BIT(2) },
-	{ .csi = RVIN_CSI40, .channel = 3, .vin = 3, .mask = BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 3, .vin = 3, .mask = BIT(4) },
-	{ .csi = RVIN_CSI21, .channel = 3, .vin = 3, .mask = BIT(5) },
-	{ .csi = RVIN_CSI41, .channel = 0, .vin = 4, .mask = BIT(0) | BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 4, .mask = BIT(1) | BIT(4) },
-	{ .csi = RVIN_CSI21, .channel = 0, .vin = 4, .mask = BIT(2) | BIT(5) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 5, .mask = BIT(0) },
-	{ .csi = RVIN_CSI21, .channel = 0, .vin = 5, .mask = BIT(1) },
-	{ .csi = RVIN_CSI41, .channel = 0, .vin = 5, .mask = BIT(2) },
-	{ .csi = RVIN_CSI41, .channel = 1, .vin = 5, .mask = BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 5, .mask = BIT(4) },
-	{ .csi = RVIN_CSI21, .channel = 1, .vin = 5, .mask = BIT(5) },
-	{ .csi = RVIN_CSI21, .channel = 0, .vin = 6, .mask = BIT(0) },
-	{ .csi = RVIN_CSI41, .channel = 0, .vin = 6, .mask = BIT(1) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 6, .mask = BIT(2) },
-	{ .csi = RVIN_CSI41, .channel = 2, .vin = 6, .mask = BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 2, .vin = 6, .mask = BIT(4) },
-	{ .csi = RVIN_CSI21, .channel = 2, .vin = 6, .mask = BIT(5) },
-	{ .csi = RVIN_CSI41, .channel = 1, .vin = 7, .mask = BIT(0) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 7, .mask = BIT(1) },
-	{ .csi = RVIN_CSI21, .channel = 1, .vin = 7, .mask = BIT(2) },
-	{ .csi = RVIN_CSI41, .channel = 3, .vin = 7, .mask = BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 3, .vin = 7, .mask = BIT(4) },
-	{ .csi = RVIN_CSI21, .channel = 3, .vin = 7, .mask = BIT(5) },
+	{ .master = 0, .csi = RVIN_CSI20, .chsel = 0x04 },
+	{ .master = 0, .csi = RVIN_CSI21, .chsel = 0x05 },
+	{ .master = 0, .csi = RVIN_CSI40, .chsel = 0x03 },
+	{ .master = 4, .csi = RVIN_CSI20, .chsel = 0x04 },
+	{ .master = 4, .csi = RVIN_CSI21, .chsel = 0x05 },
+	{ .master = 4, .csi = RVIN_CSI41, .chsel = 0x03 },
 	{ /* Sentinel */ }
 };
 
@@ -1291,34 +1202,10 @@ static const struct rvin_info rcar_info_r8a7795es1 = {
 };
 
 static const struct rvin_group_route rcar_info_r8a7796_routes[] = {
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 0, .mask = BIT(0) | BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 0, .mask = BIT(1) | BIT(4) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 1, .mask = BIT(0) },
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 1, .mask = BIT(2) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 1, .mask = BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 1, .mask = BIT(4) },
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 2, .mask = BIT(1) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 2, .mask = BIT(2) },
-	{ .csi = RVIN_CSI40, .channel = 2, .vin = 2, .mask = BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 2, .vin = 2, .mask = BIT(4) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 3, .mask = BIT(0) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 3, .mask = BIT(1) },
-	{ .csi = RVIN_CSI40, .channel = 3, .vin = 3, .mask = BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 3, .vin = 3, .mask = BIT(4) },
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 4, .mask = BIT(0) | BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 4, .mask = BIT(1) | BIT(4) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 5, .mask = BIT(0) },
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 5, .mask = BIT(2) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 5, .mask = BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 5, .mask = BIT(4) },
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 6, .mask = BIT(1) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 6, .mask = BIT(2) },
-	{ .csi = RVIN_CSI40, .channel = 2, .vin = 6, .mask = BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 2, .vin = 6, .mask = BIT(4) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 7, .mask = BIT(0) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 7, .mask = BIT(1) },
-	{ .csi = RVIN_CSI40, .channel = 3, .vin = 7, .mask = BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 3, .vin = 7, .mask = BIT(4) },
+	{ .master = 0, .csi = RVIN_CSI20, .chsel = 0x04 },
+	{ .master = 0, .csi = RVIN_CSI40, .chsel = 0x03 },
+	{ .master = 4, .csi = RVIN_CSI20, .chsel = 0x04 },
+	{ .master = 4, .csi = RVIN_CSI40, .chsel = 0x03 },
 	{ /* Sentinel */ }
 };
 
@@ -1332,38 +1219,10 @@ static const struct rvin_info rcar_info_r8a7796 = {
 };
 
 static const struct rvin_group_route rcar_info_r8a77965_routes[] = {
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 0, .mask = BIT(0) | BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 0, .mask = BIT(1) | BIT(4) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 0, .mask = BIT(2) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 1, .mask = BIT(0) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 1, .mask = BIT(1) | BIT(3) },
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 1, .mask = BIT(2) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 1, .mask = BIT(4) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 2, .mask = BIT(0) },
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 2, .mask = BIT(1) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 2, .mask = BIT(2) },
-	{ .csi = RVIN_CSI40, .channel = 2, .vin = 2, .mask = BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 2, .vin = 2, .mask = BIT(4) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 3, .mask = BIT(0) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 3, .mask = BIT(1) | BIT(2) },
-	{ .csi = RVIN_CSI40, .channel = 3, .vin = 3, .mask = BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 3, .vin = 3, .mask = BIT(4) },
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 4, .mask = BIT(0) | BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 4, .mask = BIT(1) | BIT(4) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 4, .mask = BIT(2) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 5, .mask = BIT(0) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 5, .mask = BIT(1) | BIT(3) },
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 5, .mask = BIT(2) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 5, .mask = BIT(4) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 6, .mask = BIT(0) },
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 6, .mask = BIT(1) },
-	{ .csi = RVIN_CSI20, .channel = 0, .vin = 6, .mask = BIT(2) },
-	{ .csi = RVIN_CSI40, .channel = 2, .vin = 6, .mask = BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 2, .vin = 6, .mask = BIT(4) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 7, .mask = BIT(0) },
-	{ .csi = RVIN_CSI20, .channel = 1, .vin = 7, .mask = BIT(1) | BIT(2) },
-	{ .csi = RVIN_CSI40, .channel = 3, .vin = 7, .mask = BIT(3) },
-	{ .csi = RVIN_CSI20, .channel = 3, .vin = 7, .mask = BIT(4) },
+	{ .master = 0, .csi = RVIN_CSI20, .chsel = 0x04 },
+	{ .master = 0, .csi = RVIN_CSI40, .chsel = 0x03 },
+	{ .master = 4, .csi = RVIN_CSI20, .chsel = 0x04 },
+	{ .master = 4, .csi = RVIN_CSI40, .chsel = 0x03 },
 	{ /* Sentinel */ }
 };
 
@@ -1377,13 +1236,7 @@ static const struct rvin_info rcar_info_r8a77965 = {
 };
 
 static const struct rvin_group_route rcar_info_r8a77970_routes[] = {
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 0, .mask = BIT(0) | BIT(3) },
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 1, .mask = BIT(2) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 1, .mask = BIT(3) },
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 2, .mask = BIT(1) },
-	{ .csi = RVIN_CSI40, .channel = 2, .vin = 2, .mask = BIT(3) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 3, .mask = BIT(0) },
-	{ .csi = RVIN_CSI40, .channel = 3, .vin = 3, .mask = BIT(3) },
+	{ .master = 0, .csi = RVIN_CSI40, .chsel = 0x03 },
 	{ /* Sentinel */ }
 };
 
@@ -1396,22 +1249,8 @@ static const struct rvin_info rcar_info_r8a77970 = {
 };
 
 static const struct rvin_group_route rcar_info_r8a77980_routes[] = {
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 0, .mask = BIT(0) | BIT(3) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 0, .mask = BIT(2) },
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 1, .mask = BIT(2) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 1, .mask = BIT(1) | BIT(3) },
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 2, .mask = BIT(1) },
-	{ .csi = RVIN_CSI40, .channel = 2, .vin = 2, .mask = BIT(3) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 3, .mask = BIT(0) },
-	{ .csi = RVIN_CSI40, .channel = 3, .vin = 3, .mask = BIT(3) },
-	{ .csi = RVIN_CSI41, .channel = 0, .vin = 4, .mask = BIT(0) | BIT(3) },
-	{ .csi = RVIN_CSI41, .channel = 1, .vin = 4, .mask = BIT(2) },
-	{ .csi = RVIN_CSI41, .channel = 0, .vin = 5, .mask = BIT(2) },
-	{ .csi = RVIN_CSI41, .channel = 1, .vin = 5, .mask = BIT(1) | BIT(3) },
-	{ .csi = RVIN_CSI41, .channel = 0, .vin = 6, .mask = BIT(1) },
-	{ .csi = RVIN_CSI41, .channel = 2, .vin = 6, .mask = BIT(3) },
-	{ .csi = RVIN_CSI41, .channel = 1, .vin = 7, .mask = BIT(0) },
-	{ .csi = RVIN_CSI41, .channel = 3, .vin = 7, .mask = BIT(3) },
+	{ .master = 0, .csi = RVIN_CSI40, .chsel = 0x03 },
+	{ .master = 4, .csi = RVIN_CSI41, .chsel = 0x03 },
 	{ /* Sentinel */ }
 };
 
@@ -1425,10 +1264,7 @@ static const struct rvin_info rcar_info_r8a77980 = {
 };
 
 static const struct rvin_group_route rcar_info_r8a77990_routes[] = {
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 4, .mask = BIT(0) | BIT(3) },
-	{ .csi = RVIN_CSI40, .channel = 0, .vin = 5, .mask = BIT(2) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 4, .mask = BIT(2) },
-	{ .csi = RVIN_CSI40, .channel = 1, .vin = 5, .mask = BIT(1) | BIT(3) },
+	{ .master = 0, .csi = RVIN_CSI40, .chsel = 0x03 },
 	{ /* Sentinel */ }
 };
 
diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index 8c939cb3073d79ec..909419963188afc5 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -468,6 +468,8 @@ struct rcar_csi2 {
 	struct v4l2_subdev *remote;
 	unsigned int remote_pad;
 
+	int channel_vc[4];
+
 	struct mutex lock; /* Protects mf and stream_count. */
 	struct v4l2_mbus_framefmt mf;
 	int stream_count;
@@ -675,8 +677,11 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
 	for (i = 0; i < priv->info->num_channels; i++) {
 		u32 vcdt_part;
 
-		vcdt_part = VCDT_SEL_VC(i) | VCDT_VCDTN_EN | VCDT_SEL_DTN_ON |
-			VCDT_SEL_DT(format->datatype);
+		if (priv->channel_vc[i] < 0)
+			continue;
+
+		vcdt_part = VCDT_SEL_VC(priv->channel_vc[i]) | VCDT_VCDTN_EN |
+			VCDT_SEL_DTN_ON | VCDT_SEL_DT(format->datatype);
 
 		/* Store in correct reg and offset. */
 		if (i < 2)
@@ -1258,7 +1263,53 @@ static int rcsi2_init_phtw_v3u(struct rcar_csi2 *priv,
  * Platform Device Driver.
  */
 
+static int rcsi2_link_setup(struct media_entity *entity,
+			    const struct media_pad *local,
+			    const struct media_pad *remote, u32 flags)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct rcar_csi2 *priv = sd_to_csi2(sd);
+	struct video_device *vdev;
+	int channel, vc;
+	u32 id;
+
+	if (!is_media_entity_v4l2_video_device(remote->entity)) {
+		dev_err(priv->dev, "Remote is not a video device\n");
+		return -EINVAL;
+	}
+
+	vdev = media_entity_to_video_device(remote->entity);
+
+	if (of_property_read_u32(vdev->dev_parent->of_node, "renesas,id", &id)) {
+		dev_err(priv->dev, "No renesas,id, can't configure routing\n");
+		return -EINVAL;
+	}
+
+	channel = id % 4;
+
+	if (flags & MEDIA_LNK_FL_ENABLED) {
+		if (media_entity_remote_pad(local)) {
+			dev_dbg(priv->dev,
+				"Each VC can only be routed to one output channel\n");
+			return -EINVAL;
+		}
+
+		vc = local->index - 1;
+
+		dev_dbg(priv->dev, "Route VC%d to VIN%u on output channel %d\n",
+			vc, id, channel);
+	} else {
+		vc = -1;
+	}
+
+	priv->channel_vc[channel] = vc;
+
+	return 0;
+}
+
+
 static const struct media_entity_operations rcar_csi2_entity_ops = {
+	.link_setup = rcsi2_link_setup,
 	.link_validate = v4l2_subdev_link_validate,
 };
 
@@ -1477,6 +1528,9 @@ static int rcsi2_probe(struct platform_device *pdev)
 	if (ret)
 		goto error_async;
 
+	for (i = 0; i < ARRAY_SIZE(priv->channel_vc); i++)
+		priv->channel_vc[i] = -1;
+
 	pm_runtime_enable(&pdev->dev);
 
 	ret = v4l2_async_register_subdev(&priv->subdev);
diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index 8136bc75e7c47cdd..2272f1c96aafd72a 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -1507,7 +1507,7 @@ int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
 	 * register. IFMD_DES1 controls data expansion mode for CSI20/21,
 	 * IFMD_DES0 controls data expansion mode for CSI40/41.
 	 */
-	for (route = vin->info->routes; route->mask; route++) {
+	for (route = vin->info->routes; route->chsel; route++) {
 		if (route->csi == RVIN_CSI20 || route->csi == RVIN_CSI21)
 			ifmd |= VNCSI_IFMD_DES1;
 		else
diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
index 6c06320174a2ed96..ddc1830be9a5d6c3 100644
--- a/drivers/media/platform/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/rcar-vin/rcar-vin.h
@@ -128,11 +128,9 @@ struct rvin_parallel_entity {
  * struct rvin_group_route - describes a route from a channel of a
  *	CSI-2 receiver to a VIN
  *
+ * @master:	VIN group master ID.
  * @csi:	CSI-2 receiver ID.
- * @channel:	Output channel of the CSI-2 receiver.
- * @vin:	VIN ID.
- * @mask:	Bitmask of the different CHSEL register values that
- *		allow for a route from @csi + @chan to @vin.
+ * @chsel:	CHSEL register values that connects VIN group to CSI-2.
  *
  * .. note::
  *	Each R-Car CSI-2 receiver has four output channels facing the VIN
@@ -140,19 +138,11 @@ struct rvin_parallel_entity {
  *	There is no correlation between channel number and CSI-2 VC. It's
  *	up to the CSI-2 receiver driver to configure which VC is output
  *	on which channel, the VIN devices only care about output channels.
- *
- *	There are in some cases multiple CHSEL register settings which would
- *	allow for the same route from @csi + @channel to @vin. For example
- *	on R-Car H3 both the CHSEL values 0 and 3 allow for a route from
- *	CSI40/VC0 to VIN0. All possible CHSEL values for a route need to be
- *	recorded as a bitmask in @mask, in this example bit 0 and 3 should
- *	be set.
  */
 struct rvin_group_route {
+	unsigned int master;
 	enum rvin_csi_id csi;
-	unsigned int channel;
-	unsigned int vin;
-	unsigned int mask;
+	unsigned int chsel;
 };
 
 /**
-- 
2.34.1

