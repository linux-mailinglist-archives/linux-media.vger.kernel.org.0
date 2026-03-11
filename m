Return-Path: <linux-media+bounces-55383-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJyBFpZdsWl/uQIAu9opvQ
	(envelope-from <linux-media+bounces-55383-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:18:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D12263829
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 13:18:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 25FF4300147A
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 12:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA97B1A682F;
	Wed, 11 Mar 2026 12:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oLW6aYsW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658061EEA3C;
	Wed, 11 Mar 2026 12:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773231476; cv=none; b=mj14iomQyrL6wb2RCO5J53dbIe4AoPovZqfD7HoNRjyt97r+eXxyhYfXkwWQaoaLVb5sABLE+jUHDaYtScPLfnWU4Dz0hOSJo97fAWXvbjquzB1BkUUAGARtFvTCeIUW6xUrOJDYLJzn5/Z1AavjbDcGK5wMCvGcO4u4BcKROG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773231476; c=relaxed/simple;
	bh=g7JGoWvLNHDXHPK70uMQsZBrJB0TMmNYR16o2sKfGiA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hRJ1Lxaf4DlmGbrdM5yjiTxLOHfnPlkEctphorCjEmUXrcI9B0I/h5XW0J+dfg6xYVQzfksnDnUQ2eC7PEi6DKEn24DeEde/IY6iq+vPXIY0MX/EEHqjbKLzZeB/SyBBjQNO2FVouJACWDoY4CUnKczTMXIgOiHbBpPYGEY8ylw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oLW6aYsW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DA4D981;
	Wed, 11 Mar 2026 13:16:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773231400;
	bh=g7JGoWvLNHDXHPK70uMQsZBrJB0TMmNYR16o2sKfGiA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oLW6aYsWhOxuKK8LInlrVO+J1EESmNSiE/4/YSofW7UHp6yFCs5hiHf0XQcXarXi6
	 oVZMg2ZCbHTM9qRCgaM+DmKXO5y3KedHldHBlnAhuhwVDCvJMCZyGRobP5s9cGbVme
	 UnQHXLojZ/cG3+HETasmZ+xKLO1Qkek8Jj0r+os0=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 11 Mar 2026 14:17:21 +0200
Subject: [PATCH v5 3/3] media: i2c: ds90ub913: Use
 v4l2_subdev_get_frame_desc_passthrough
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-frame-desc-passthrough-v5-3-d59876bbb663@ideasonboard.com>
References: <20260311-frame-desc-passthrough-v5-0-d59876bbb663@ideasonboard.com>
In-Reply-To: <20260311-frame-desc-passthrough-v5-0-d59876bbb663@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2627;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=g7JGoWvLNHDXHPK70uMQsZBrJB0TMmNYR16o2sKfGiA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpsV1pn4ELsZVoKU+5ofDS6b2Kwp/FepIVu6nfy
 Dwd/zaQcDCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCabFdaQAKCRD6PaqMvJYe
 9Zh7D/94pX+etU1vKX7H6pxk4+t86UKny4YHJMarhX6G+bkOMmE1fF++MdeyC8nrlKCaq4Sr5ij
 v92H9Rj5I65gSRHqhaTqRYxfEXOqEVJ6sE+m/jcWR7J1dXGAa3FETmFhZ43ui1fXTBMbr3ZqjH/
 46Gcx8drmp6lqydDVDOwsHsEv8AkH/X+gcz+YA4Ep3XLWG8dzVVesZNp0QoCrt23ErLwWxVzlK0
 F0xG7kVgSO2OR5Z5PBKJw8oR+xy5+Y0BpjAMoRKd3HxWmr49CYpQD/KWgeGeJkBVYZbdf1cIDfd
 abuDjNXwzeCYHgu4t6d1HPExsVMlyhKJXufqufpq+Lyyeap0qLbNVBYc2eRAgTeg2bm/ButmXl1
 jy8qgns8kcnWxMlzmsbzPXXwNbxa53VmGO/ukq5z+fx1LDEG7u1I8zFVob8kvd6Tynv3DRVT/Vb
 LVDF+mq1/Yns9YdX8pSdqby/Q9SkH96aVDC/4XCam1O+YW1CBTEeYHx5a84Zsk9H4UXrXRwXqAz
 0im9vULRreT8c4XQFiUDYFoOwooOec5twKf5uncQCjGLyUOnJfXJAdncMSnBUzhKDUgqZz2uBdS
 bfFD2gSZNclBUd2VaODJklHl0fNfv6XgZa1Z/C+KGAdHB0vJAo27Txh8Dy5s/FsivD3szJx2Xbx
 H2Id7z1GdPzWBfA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Rspamd-Queue-Id: F0D12263829
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55383-lists,linux-media=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Use the new v4l2_subdev_get_frame_desc_passthrough helper for
.get_frame_desc.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/i2c/ds90ub913.c | 59 +------------------------------------------
 1 file changed, 1 insertion(+), 58 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index e97e499b04e6..49aa5f4a172c 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -372,63 +372,6 @@ static int ub913_set_routing(struct v4l2_subdev *sd,
 	return _ub913_set_routing(sd, state, routing);
 }
 
-static int ub913_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
-				struct v4l2_mbus_frame_desc *fd)
-{
-	struct ub913_data *priv = sd_to_ub913(sd);
-	const struct v4l2_subdev_krouting *routing;
-	struct v4l2_mbus_frame_desc source_fd;
-	struct v4l2_subdev_route *route;
-	struct v4l2_subdev_state *state;
-	int ret;
-
-	if (pad != UB913_PAD_SOURCE)
-		return -EINVAL;
-
-	ret = v4l2_subdev_call(priv->source_sd, pad, get_frame_desc,
-			       priv->source_sd_pad, &source_fd);
-	if (ret)
-		return ret;
-
-	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
-
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	routing = &state->routing;
-
-	for_each_active_route(routing, route) {
-		unsigned int i;
-
-		if (route->source_pad != pad)
-			continue;
-
-		for (i = 0; i < source_fd.num_entries; i++) {
-			if (source_fd.entry[i].stream == route->sink_stream)
-				break;
-		}
-
-		if (i == source_fd.num_entries) {
-			dev_err(&priv->client->dev,
-				"Failed to find stream from source frame desc\n");
-			ret = -EPIPE;
-			goto out_unlock;
-		}
-
-		fd->entry[fd->num_entries].stream = route->source_stream;
-		fd->entry[fd->num_entries].flags = source_fd.entry[i].flags;
-		fd->entry[fd->num_entries].length = source_fd.entry[i].length;
-		fd->entry[fd->num_entries].pixelcode =
-			source_fd.entry[i].pixelcode;
-
-		fd->num_entries++;
-	}
-
-out_unlock:
-	v4l2_subdev_unlock_state(state);
-
-	return ret;
-}
-
 static int ub913_set_fmt(struct v4l2_subdev *sd,
 			 struct v4l2_subdev_state *state,
 			 struct v4l2_subdev_format *format)
@@ -544,7 +487,7 @@ static const struct v4l2_subdev_pad_ops ub913_pad_ops = {
 	.enable_streams = ub913_enable_streams,
 	.disable_streams = ub913_disable_streams,
 	.set_routing = ub913_set_routing,
-	.get_frame_desc = ub913_get_frame_desc,
+	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ub913_set_fmt,
 };

-- 
2.43.0


