Return-Path: <linux-media+bounces-65114-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6/NeN/GMMmq71wUAu9opvQ
	(envelope-from <linux-media+bounces-65114-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 14:02:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA94969970B
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 14:02:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="K/kZJCpR";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65114-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65114-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A7AE30782CE
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 11:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115153FE677;
	Wed, 17 Jun 2026 11:56:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5DD3FB07E;
	Wed, 17 Jun 2026 11:56:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697378; cv=none; b=lCgjNJaYPUUwdjSJDTs3piYzpDaoSTsqgSeQNxHO/SVRxw8z2zSxwug8j0PiCR+wkL0p4PxjCLu1hns0HmzpF6YN4wv0ZGcChCiVQ8rPM5t4jza1j7rKgjmrc+m+bTwcAPzv3uDYluy5RtrEN+2k9SyTMpsjpmUVS7foBRrJ4o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697378; c=relaxed/simple;
	bh=asXI7wVuxtiTJOk362LtdU6/Okyu7xXtTfE9UwJ5R54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FKZ9eSvElpZ7/OBfsw+DifLpqlzjU7el6Tbv4NCTS91TZE2BX8C3764Qz6GhfCoK7VTarbFHVjkUcq5d9NzIMqtwhwUP70t9MZXZgnsF9bf5wilh70u1kqYVHhSnlIEAU99Kh3fYf7eWfgpdYTNTgLqGwDMI9x3psnw0sL8ZjUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K/kZJCpR; arc=none smtp.client-ip=213.167.242.64
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 63470243E;
	Wed, 17 Jun 2026 13:55:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781697324;
	bh=asXI7wVuxtiTJOk362LtdU6/Okyu7xXtTfE9UwJ5R54=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K/kZJCpR3t/CP3h1Spazot+tfm7GLgoaq19ZO3jssdu4L0gbqjq9sU/r5j86euFOk
	 8ZjTwvmMnR5FrEjRbEHUwWsJrR1ksR11d0fB3qur9QJo6Kn3I+t0TQAnMmzBhP8MLC
	 WsWOvD7wVdGOrzNB6zEt/s3RJX2H364IO11SmbGY=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 17 Jun 2026 14:55:02 +0300
Subject: [PATCH v6 09/11] media: rcar-csi2: Call get_frame_desc to find out
 VC & DT (Gen3)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-rcar-streams-v6-9-1260eb72dff7@ideasonboard.com>
References: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
In-Reply-To: <20260617-rcar-streams-v6-0-1260eb72dff7@ideasonboard.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4903;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=asXI7wVuxtiTJOk362LtdU6/Okyu7xXtTfE9UwJ5R54=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqMotG/uAJOnq9xVUn75QaoY5hpDaMy40QzbOX/
 lqUsWlwcgaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCajKLRgAKCRD6PaqMvJYe
 9cl/D/9hp6KogZG4NTuWerDuIsBkUxB+CI3Vqcv2IqeBRzXwIKl1jixe8Pn3mr0SfIdCCyI2pQI
 oWthZF1nDLxBurNB3yF381dB6+ywYqNmrSfgF+BX5Aak/8zSPEmAPh6Lr06ztWhN1McxqMeWqow
 lnLpW7Dzq093IbxZk6Hs6PnrAiDdnlys85ConYsKPzY0o9hwXIx21ISbJh8Ljro7MK3vmssFy88
 1l8bDY6AuzUclCDP4I6N29v+p/ck7T19BmjfSsOP3FOIGvqb+OdBNuw8QuxpbEPkaR/XCSl3B76
 mRsmycTsmjCTUT76jjcFUUXLzHpNcY9BRdtcE2zcXSdfhbG2gmewKJAYa0sKYypY1xGof5aI5Z/
 li7p4kbPXfCMYnpl5zvJN0rCbmgbriLz7jBM4u8LjrxnRDlEPRpV2pzH2as9YyqIYheUHJHxnsK
 l57DuFj5KUizAQRnTaes3/4huD8cuOhNoHdFxuHqOW7E04oUlmraP5p4kEV7sDBldxLrjZ4QlBY
 qbhagmJCGWJLyTNKg6aSvoTAQO4ajVczVX3WnkL78dAn78b5gx/piljyOEm7T3VV0p2KDt8V2JL
 FDxSWK3DajWKqWclRyRsR5In2vaeP+J9Uc/WB4nz9j5M9PYbrIz4FpUdBgtgTB8YHIwnjJhKzRm
 fOaZWWCcQzpf/SA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65114-lists,linux-media=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund+renesas@ragnatech.se,m:mchehab+huawei@kernel.org,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media,renesas,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA94969970B

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
index 0d9e730fa677..8cd38b4cbc7f 100644
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


