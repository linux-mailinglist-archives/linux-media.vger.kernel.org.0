Return-Path: <linux-media+bounces-55398-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFjuNwV0sWlVvAIAu9opvQ
	(envelope-from <linux-media+bounces-55398-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:54:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 860BB264DFF
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:54:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A5D42301E9A4
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698BA35F614;
	Wed, 11 Mar 2026 13:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WNQaMzsB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6847F2D3EC1;
	Wed, 11 Mar 2026 13:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773237241; cv=none; b=rUNk0OOWL7ITLlwL08U42wD4Lqli5NTmo6OclA+2jGFjxK2wcrr4ov+429Pxew8+Tp4SClxXfX2u/p4qbZsZ/dYldD94HUzLOz00PHyE50oETTUT4qksVGL7rq0jmunp98jYkImG/125p3e5fZTBwTMvtDhFh+UU9G/xUTVJPiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773237241; c=relaxed/simple;
	bh=pdZyak81e8CG8vI3htglWPevuPv2rJAraMngVPQe9+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RwsHs8UteEojojSNrfeSO+UT8m1KfEQM6aNcmmwtph1uqTL6RwIuMDOOxAL2AopyYUG645u+rNh3UNunxzBcUN4qWNbhO1aNvHfYYXl7REnAudoKCZ0yucBnE4bvYsCfgDMbLAxrTABlcXqxDkBMkotS5L7Kud7IQQV9ua8dDgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WNQaMzsB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DF5F5A5;
	Wed, 11 Mar 2026 14:52:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773237163;
	bh=pdZyak81e8CG8vI3htglWPevuPv2rJAraMngVPQe9+o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WNQaMzsBRe3ziVVHxOSjzaEy6xqfuug9C+Y18T5I3yu0LXQVT/9He93EUMlTh6lDY
	 LK2JppEB45fkzxvNMbpb7Aj+i12RbuFmJ/HMvN6btJKP4HdtMq+I6RuNRaYv2Zh1Lc
	 bWl7hrSHmq0+/3mAEXgRbQEMsd9qmT799rSm6c9w=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 11 Mar 2026 15:53:14 +0200
Subject: [PATCH v5 01/10] media: rcar-vin: Link VINs on Gen3 to a single
 channel on each CSI-2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-rcar-streams-v5-1-3e6c957d7567@ideasonboard.com>
References: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
In-Reply-To: <20260311-rcar-streams-v5-0-3e6c957d7567@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2436;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=pdZyak81e8CG8vI3htglWPevuPv2rJAraMngVPQe9+o=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpsXPpr68/L8Pm5FCMdmSav/Ta7zCoBpb+GNmNd
 DLF23yR8NaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCabFz6QAKCRD6PaqMvJYe
 9UjtD/96nP3CDORCHG/zsL1B1M2h/x1s0EZARDA1JUe16r9BWwNogd0nx4Boi8OofqTGd9vPlUi
 jZt3f7IPg70R8O+8QqZxijNC7BX7Eyf9WdPTs1KPvJKd3TMOBZcIj3X59lOQxstI+7UbD2N/ynu
 HibU+qHR/cEaL6Seq4HqHQonu3uacIZhWvHYKdp2WgIKzEAgbhMnvA8iOPtb9QF7mGL1KKR1Wmm
 Tb37lAnCWc3J8O/PeRMDjiLu0YhaxAz1QcDhyh62T69j/2LNi0+bUtrtllQBphDiRBI/2cOXoQu
 VHSQdfu4LTyPz2bXj/P97iafwfm/G7fEnXcN4LIVHBcW4kUcdBS+nCppEDX0OBkdoBe8IVa2LkN
 r8otridGWDl3Z7ApgzJt+fUDDO63YhpFBANDwwLxDqxp0XdSyH1T6UaHPMwA+tPA2/Ng7UwZXj/
 ja3aRV0P1MQsfooqgxUV3kBmWz+SJQyPN1+hKNKeOyyNStX6nzN2OzhvUG/6qhtHCBOUySfrWJY
 qlUFhKPktUewgK0byyE581z84XplWOpKw6eNHNEWu8XZnCSQ7upskpuuNV/SedAWDRwlu6Wbl8r
 1quAazcZ7Rw+AKOmKYgH68BJnwKAHus0yP2T4rQrnSH1X0Uyjd7GS5m15/t18vuFDZc9tqOCM7R
 r0pKkSkUu+Rl7fg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Queue-Id: 860BB264DFF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55398-lists,linux-media=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Action: no action

The stream routing will be fully configurable when we add full streams
support to the rcar pipeline. Thus there is no need for the user to be
able to link VINs to different CSI-2 channels. In fact, allowing e.g.
VIN0 to be connected to CSI-2 channel 3 would be wrong, as the hardware
doesn't allow that.

Change rvin_csi2_create_link() so that it creates media links only
between matching VINs and CSI-2 channels (VIN0 - channel 0, VIN1 -
channel 1, etc.).

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 .../media/platform/renesas/rcar-vin/rcar-core.c    | 27 ++++++++++++----------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index c8d564aa1eba..2fcea715101c 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -673,23 +673,26 @@ static int rvin_csi2_create_link(struct rvin_group *group, unsigned int id,
 	struct media_entity *source = &group->remotes[route->csi].subdev->entity;
 	struct media_entity *sink = &group->vin[id]->vdev.entity;
 	struct media_pad *sink_pad = &sink->pads[0];
+	struct media_pad *source_pad;
+	unsigned int source_idx;
 	unsigned int channel;
-	int ret;
 
-	for (channel = 0; channel < 4; channel++) {
-		unsigned int source_idx = rvin_group_csi_channel_to_pad(channel);
-		struct media_pad *source_pad = &source->pads[source_idx];
+	/*
+	 * The channels from CSI-2 blocks and the VIN groups have a set of
+	 * hardcoded routing options to choose from. We only support the routing
+	 * where all VINs in a group are connected to the same CSI-2 block,
+	 * and the Nth VIN in the group is connected to the Nth CSI-2 channel.
+	 */
 
-		/* Skip if link already exists. */
-		if (media_entity_find_link(source_pad, sink_pad))
-			continue;
+	channel = id % 4;
+	source_idx = rvin_group_csi_channel_to_pad(channel);
+	source_pad = &source->pads[source_idx];
 
-		ret = media_create_pad_link(source, source_idx, sink, 0, 0);
-		if (ret)
-			return ret;
-	}
+	/* Skip if link already exists. */
+	if (media_entity_find_link(source_pad, sink_pad))
+		return 0;
 
-	return 0;
+	return media_create_pad_link(source, source_idx, sink, 0, 0);
 }
 
 static int rvin_parallel_setup_links(struct rvin_group *group)

-- 
2.43.0


