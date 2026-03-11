Return-Path: <linux-media+bounces-55382-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIvOMqZdsWl/uQIAu9opvQ
	(envelope-from <linux-media+bounces-55382-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:18:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 661E9263832
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDD7D30488CC
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 12:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 647313E0C45;
	Wed, 11 Mar 2026 12:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eQmX/MVj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA703E0229;
	Wed, 11 Mar 2026 12:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773231476; cv=none; b=WBN4P2r6Rrv6Aop2J7AonvmPTYdamhKJj71eVasPXloCvqQk4DU0axlJratE+y/CM79JXoZpSRchlLjwPM+LeC7tNODZZPm2M1g5JO99sfJZqWsuFtyZx8d6DDECD2pbc8K6CEuREP3ghr7Z2xzuC8DMYznG6lk4fSzFduJ9bS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773231476; c=relaxed/simple;
	bh=eUKa3Pr8BETFOmz9d3AslwF7WJpmKaVm3NCDYXMId1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t0VM11Ob1MIB1RCHEFuGk9QCNWJ8u2k0Hnw2gKMn/Mr0T4CqYZ7vxTbT3l/J8EcHa1DJCOjYf3aXyV7GRDr3I6jponQ0vYxPMEI+s9SnOyNzuZpl89VilsfJgDfaCEn/qoeOyCgkYPeBGl0ZQD3mX6hPZ/jSuErAW2d6X2ijohM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eQmX/MVj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22AC64B3;
	Wed, 11 Mar 2026 13:16:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773231400;
	bh=eUKa3Pr8BETFOmz9d3AslwF7WJpmKaVm3NCDYXMId1Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eQmX/MVjaf2X3Bvgpx3VIAvIi6lwL6cdOCK9QKR5K0TT4rbv0j4oYxqLdSyMo9Jzf
	 Wc7yX099XJLCEgC2nZgHVilZnYbLrYpu9OkKmARbOJDQRbswt20zuF+L/MwUOPuxbB
	 C4j+Glry5IK9/iVeLOyLGsOGupQuQnaY3Wjsn110=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 11 Mar 2026 14:17:20 +0200
Subject: [PATCH v5 2/3] media: i2c: ds90ub953: Use
 v4l2_subdev_get_frame_desc_passthrough
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-frame-desc-passthrough-v5-2-d59876bbb663@ideasonboard.com>
References: <20260311-frame-desc-passthrough-v5-0-d59876bbb663@ideasonboard.com>
In-Reply-To: <20260311-frame-desc-passthrough-v5-0-d59876bbb663@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2742;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=eUKa3Pr8BETFOmz9d3AslwF7WJpmKaVm3NCDYXMId1Q=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpsV1oMtZlwiE/i9pRpqEEhSGDGoLqP5K1BzQER
 HQ2yh6c3O6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCabFdaAAKCRD6PaqMvJYe
 9S8GEACjQfpanqlWq/2vwTZ7NuEZV+Epa+I9WoLoasLN17xw6UcKjcPxJFPCL9g4PginnQ43OSd
 A2g/5RbHnOg429jmTi3XcvjsVINkOfnOyXYQEKn2YyXZ4XsVcBiBzEnx/QIpH7Kbd89YRQ+NT0z
 H77g9Sfc6HbRZPQ6FBI8p5P8+JijToDbTlv6odkJiozZjwjSZ9ZsPlkVIgeLh3EIc3HqRaacsNb
 1ezGBUcZ2IsDcjnfQyA0n17wNtiVpw6M1SaAjdcrIigB9PDeislmdg9SV/waPk5zk30x+bKZr/r
 AXq1+r7V7lRSw4y4aGEuO3FMI9b/jAdnR6/Dpb3D8swm7udaYB4fToyp2niJkM/ZQah7b2Y/xgy
 H/04oOiCbFj8GM+2lVWELs+NhVUOtVf2hIMKeTvVwIW28yKJt82s4iSU/CuRSosAlTf/D8rcUby
 34Eyqvr3IkfmY2gz67PiG4lFC4OYetOG4BWmvihGKZoOvpWUBCGAzOdjpjoNj6xw5hL0iPfVIGg
 LEGRB0X4fkWUgRQQ3276FKwd+3dkpzmyXMvKPrarepxH1vpHS8q9Uk98jSymANKjyBCMd5knIOs
 V5H+swkO+L4iABK3kTM49LnloM9AdopOY7fyu3ZW0L4+J3z1RWpMVxtf51c8p5lddz+mu+lZ7Tb
 D6n2l6k/xUpBhgw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Queue-Id: 661E9263832
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55382-lists,linux-media=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Action: no action

Use the new v4l2_subdev_get_frame_desc_passthrough helper for
.get_frame_desc.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/i2c/ds90ub953.c | 61 +------------------------------------------
 1 file changed, 1 insertion(+), 60 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index daefdb108fbf..a8ab67f4137f 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -424,65 +424,6 @@ static int ub953_set_routing(struct v4l2_subdev *sd,
 	return _ub953_set_routing(sd, state, routing);
 }
 
-static int ub953_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
-				struct v4l2_mbus_frame_desc *fd)
-{
-	struct ub953_data *priv = sd_to_ub953(sd);
-	struct v4l2_mbus_frame_desc source_fd;
-	struct v4l2_subdev_route *route;
-	struct v4l2_subdev_state *state;
-	int ret;
-
-	if (pad != UB953_PAD_SOURCE)
-		return -EINVAL;
-
-	ret = v4l2_subdev_call(priv->source_sd, pad, get_frame_desc,
-			       priv->source_sd_pad, &source_fd);
-	if (ret)
-		return ret;
-
-	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
-
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	for_each_active_route(&state->routing, route) {
-		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
-		unsigned int i;
-
-		if (route->source_pad != pad)
-			continue;
-
-		for (i = 0; i < source_fd.num_entries; i++) {
-			if (source_fd.entry[i].stream == route->sink_stream) {
-				source_entry = &source_fd.entry[i];
-				break;
-			}
-		}
-
-		if (!source_entry) {
-			dev_err(&priv->client->dev,
-				"Failed to find stream from source frame desc\n");
-			ret = -EPIPE;
-			goto out_unlock;
-		}
-
-		fd->entry[fd->num_entries].stream = route->source_stream;
-		fd->entry[fd->num_entries].flags = source_entry->flags;
-		fd->entry[fd->num_entries].length = source_entry->length;
-		fd->entry[fd->num_entries].pixelcode = source_entry->pixelcode;
-		fd->entry[fd->num_entries].bus.csi2.vc =
-			source_entry->bus.csi2.vc;
-		fd->entry[fd->num_entries].bus.csi2.dt =
-			source_entry->bus.csi2.dt;
-
-		fd->num_entries++;
-	}
-
-out_unlock:
-	v4l2_subdev_unlock_state(state);
-
-	return ret;
-}
 
 static int ub953_set_fmt(struct v4l2_subdev *sd,
 			 struct v4l2_subdev_state *state,
@@ -694,7 +635,7 @@ static const struct v4l2_subdev_pad_ops ub953_pad_ops = {
 	.enable_streams = ub953_enable_streams,
 	.disable_streams = ub953_disable_streams,
 	.set_routing = ub953_set_routing,
-	.get_frame_desc = ub953_get_frame_desc,
+	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ub953_set_fmt,
 };

-- 
2.43.0


