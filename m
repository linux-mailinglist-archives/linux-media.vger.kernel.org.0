Return-Path: <linux-media+bounces-55406-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QicnDMF0sWnovQIAu9opvQ
	(envelope-from <linux-media+bounces-55406-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:57:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E94264EC4
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 14:57:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10CB5303EFB1
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD0F373BEC;
	Wed, 11 Mar 2026 13:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tw0qd7uj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F16D35838B;
	Wed, 11 Mar 2026 13:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773237265; cv=none; b=UABgn/dqMBuxAd0BuS/uze76vyh4sjx+jQogNGPQ03I8hhTGhT86ZE3gFuHfInGsvlPJ853OcxyiGJoPhOi6LptmDKLFaTY0FOJQRSg4OeZKMcVqNl0lPTIu1wAgKqCtVLmP3gOonttFUVwmw3BcBpoBTk7DV0V7ZYbwO6GPMe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773237265; c=relaxed/simple;
	bh=14Intlvp5GdTtMEvJXMxfu9GYJOwY69MsMo1wMxPhlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FhStBhUsFvbqfKnkLGchbZcJTjD6JylNPHRm6h0Fy5uEWygPAdnn/ZVN0oUmOPh/CJip3KhNVq/u5ia3wMayLhik66PXi/V7TIta6qGFkhbhvmL/gXfkWxC6L2XJSqFgWaMm1v/smWtUMBVTvJjVcreaALMIvhIEC2vY7WBUDLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tw0qd7uj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A91512D6;
	Wed, 11 Mar 2026 14:52:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773237168;
	bh=14Intlvp5GdTtMEvJXMxfu9GYJOwY69MsMo1wMxPhlM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tw0qd7ujs4x3aL4XGBJjLZUUNhAzej582Uim4t/JWfbP3WvqE+WZgjIoHh5BBqmAF
	 PGc1WDCX2+GU9+TKXONwBJzeg4r1UTgW1pZKG8IzNsn0X6yqLyJi891/3jFIUgZ6kj
	 eD9XjTQbAtpYbrbwlP4mP0UQ+iHKX2EvCFiw8fQc=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 11 Mar 2026 15:53:21 +0200
Subject: [PATCH v5 08/10] media: rcar-csi2: Call get_frame_desc to find out
 VC & DT (Gen3)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-rcar-streams-v5-8-3e6c957d7567@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4903;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=14Intlvp5GdTtMEvJXMxfu9GYJOwY69MsMo1wMxPhlM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpsXPrz7Co+FfxIfaG7q2NPVEENhpZEtQ2CKIdS
 J3w9SQpeh2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCabFz6wAKCRD6PaqMvJYe
 9RkKD/4+M/arhpeYkhMMGr31BqPzZmOZEP2TAtzskA88Q/FbYMM7ccE13XIAlAo6KepH7p8nzRt
 uuxnS7YEaUSh4pbTOLXQlg2KNKGrI8zGb5vPSWPjpQ43gx8t/UehHZcueimQIyjhZJgkXVj8FQ0
 I8fMoVrL2rOd2wAOP+UV3ExRccwZismngG1jheJZpWMPZGIW6DVU3ZlUlUbzjkRa9DccZx742Z0
 zz5cefJfiTwhEaO5TskdHNm0TDKRAzRJilhFhPMpcHVYAMYzD/8NTvkHB9CewJlp8XLA3+OduKb
 NzVqh5SRU/RCaYz204ze361kuNk6KcXRglOnZtumkiwVo7FjaNP/QVynpfuhKbLSsTx/Q4sfh24
 KZgzs9aVtkaqhSpzyxWyz3487eDXMOAEobCg6Nev6XL8Uv1CLHGZ4pyD4G2dxJjzPSBSbyK5JAD
 YF4JeL72AaxJR+pyV7BdwsmcRQtkXZRrJG1tyP1RIXC0D0f7DtxjHFP2/GUs3jkPKsmdqDi/ik7
 kkt6ac8YtgGL7qJLPy2mZrLaNJ7qCpkW9GX+vNIDIOC38rkIxa9uVt6JmTZ0+qHKtHIWAJhfjvw
 BB9s4E8QQhlUbWZLyCo1kfLK6V/1qnw7SC8xpgh9DrmtXRYm3eYx2mstQIfEI827RkSuKTnpaFV
 NxQ5EPvLFMqcKSg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Queue-Id: 99E94264EC4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55406-lists,linux-media=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Call get_frame_desc to find out VC & DT, for Gen3 platforms, instead of
hardcoding the VC routing and deducing the DT based on the mbus format.

If the source subdevice doesn't implement .get_frame_desc, we use a
fallback case where we assume there's a single stream with VC = 0 and DT
based on the mbus format.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 111 ++++++++++++++++++-----------
 1 file changed, 71 insertions(+), 40 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index b8baf7c65e90..831a5ec27233 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1069,62 +1069,93 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
 static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
 				     struct v4l2_subdev_state *state)
 {
-	const struct v4l2_subdev_route *route;
-	const struct rcar_csi2_format *format;
-	u32 phycnt, vcdt = 0, vcdt2 = 0, fld = 0;
-	const struct v4l2_mbus_framefmt *fmt;
+	u32 phycnt, vcdt = 0, vcdt2 = 0;
+	u32 fld = FLD_DET_SEL(1);
+	struct v4l2_mbus_frame_desc source_fd;
+	struct v4l2_subdev_route *route;
 	unsigned int lanes;
-	unsigned int i;
 	int mbps, ret;
+	u8 ch = 0;
 
-	/* Use the format on the sink pad to compute the receiver config. */
+	ret = v4l2_subdev_call(priv->remote, pad, get_frame_desc,
+			       priv->remote_pad, &source_fd);
+	if (ret && ret != -ENOIOCTLCMD)
+		return ret;
 
-	if (state->routing.num_routes != 1)
-		return -EINVAL;
+	if (ret == -ENOIOCTLCMD) {
+		/* Create a fallback source_fd */
+		struct v4l2_mbus_frame_desc *fd = &source_fd;
+		const struct v4l2_subdev_route *route;
+		const struct rcar_csi2_format *format;
+		struct v4l2_mbus_framefmt *fmt;
 
-	route = &state->routing.routes[0];
+		if (state->routing.num_routes != 1)
+			return -EINVAL;
 
-	fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
-					   route->sink_stream);
-	if (!fmt)
-		return -EINVAL;
+		route = &state->routing.routes[0];
 
-	dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
-		fmt->width, fmt->height,
-		fmt->field == V4L2_FIELD_NONE ? 'p' : 'i');
+		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+						   route->sink_stream);
+		if (!fmt)
+			return -EINVAL;
 
-	/* Code is validated in set_fmt. */
-	format = rcsi2_code_to_fmt(fmt->code);
-	if (!format)
-		return -EINVAL;
+		format = rcsi2_code_to_fmt(fmt->code);
+		if (!format)
+			return -EINVAL;
 
-	/*
-	 * Enable all supported CSI-2 channels with virtual channel and
-	 * data type matching.
-	 *
-	 * NOTE: It's not possible to get individual datatype for each
-	 *       source virtual channel. Once this is possible in V4L2
-	 *       it should be used here.
-	 */
-	for (i = 0; i < priv->info->num_channels; i++) {
+		memset(fd, 0, sizeof(*fd));
+
+		fd->num_entries = 1;
+		fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+		fd->entry[0].stream = 0;
+		fd->entry[0].pixelcode = fmt->code;
+		fd->entry[0].bus.csi2.vc = 0;
+		fd->entry[0].bus.csi2.dt = format->datatype;
+	}
+
+	for_each_active_route(&state->routing, route) {
+		const struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
+		const struct v4l2_mbus_framefmt *fmt;
+		unsigned int i;
 		u32 vcdt_part;
 
-		if (priv->channel_vc[i] < 0)
-			continue;
+		for (i = 0; i < source_fd.num_entries; i++) {
+			if (source_fd.entry[i].stream == route->sink_stream) {
+				source_entry = &source_fd.entry[i];
+				break;
+			}
+		}
 
-		vcdt_part = VCDT_SEL_VC(priv->channel_vc[i]) | VCDT_VCDTN_EN |
-			VCDT_SEL_DTN_ON | VCDT_SEL_DT(format->datatype);
+		if (!source_entry) {
+			dev_err(priv->dev,
+				"Failed to find stream from source frame desc\n");
+			return -EPIPE;
+		}
+
+		vcdt_part = VCDT_SEL_VC(source_entry->bus.csi2.vc) |
+			    VCDT_VCDTN_EN | VCDT_SEL_DTN_ON |
+			    VCDT_SEL_DT(source_entry->bus.csi2.dt);
 
 		/* Store in correct reg and offset. */
-		if (i < 2)
-			vcdt |= vcdt_part << ((i % 2) * 16);
+		if (ch < 2)
+			vcdt |= vcdt_part << ((ch % 2) * 16);
 		else
-			vcdt2 |= vcdt_part << ((i % 2) * 16);
-	}
+			vcdt2 |= vcdt_part << ((ch % 2) * 16);
+
+		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK,
+						   route->sink_stream);
+		if (!fmt)
+			return -EINVAL;
+
+		dev_dbg(priv->dev, "Input size (%ux%u%c)\n",
+			fmt->width, fmt->height,
+			fmt->field == V4L2_FIELD_NONE ? 'p' : 'i');
 
-	if (fmt->field == V4L2_FIELD_ALTERNATE)
-		fld = FLD_DET_SEL(1) | FLD_FLD_EN(3) | FLD_FLD_EN(2) |
-		      FLD_FLD_EN(1) | FLD_FLD_EN(0);
+		if (fmt->field == V4L2_FIELD_ALTERNATE)
+			fld |= FLD_FLD_EN(ch);
+
+		ch++;
+	}
 
 	/*
 	 * Get the number of active data lanes inspecting the remote mbus

-- 
2.43.0


