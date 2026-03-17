Return-Path: <linux-media+bounces-56055-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOURDwpGuWmK+QEAu9opvQ
	(envelope-from <linux-media+bounces-56055-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:16:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8EB2A9AB4
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 13:16:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5F3D3250A23
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 12:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C150C3BD222;
	Tue, 17 Mar 2026 12:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g7l47nzh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C133BBA19;
	Tue, 17 Mar 2026 12:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773749401; cv=none; b=XbPGy7q0aVroM0AlD9pJ0uewvgAcmzupEAVGDKVaRpQYvYxCel53whTdxw9ky30e4exLYD2IiY06krPVCLusDLpXHNOiKfi+L14OA4MvFh9oYnL0n3qch84vdkSYnOGkv3QuXuMPkmnW1HACC0k9CxWXZETfA0bKT695VAFK4Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773749401; c=relaxed/simple;
	bh=8sN9QwGz77K3Y0zsOpXU7uArFmzQe2gheap8pVeEnU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WuQuycTzFSPNe+2z9nYkUhDPmgy2vQ06sYCXOebAGtRzjI9VcVNojji1toTCSaWN/bBOQfpuR5wAJMWT0QBoi0sMR7utMdjW/XypXUZcToDG+npoydpRNuRTuuaYOgO8XuYjYpfh2Y9OoXMwXr87OyUxMhZFY0Po/aft6lAoelQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g7l47nzh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83D80BD2;
	Tue, 17 Mar 2026 13:08:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773749323;
	bh=8sN9QwGz77K3Y0zsOpXU7uArFmzQe2gheap8pVeEnU4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g7l47nzhKxdxq0WnQ9WKbaubyK9DDy/rOWBN/K18yMks+nVSzEVcsQjUKhCOm7bMJ
	 kYz8/ms/pzWqgPby5FljU566KXNs+zCRORK9IwREeCnFjIuc+onUgNE7/YZAOJA7B1
	 ILv4tJstWSyNEi8D/Vr9Q6fukVP95k1+INiKQf0g=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 17 Mar 2026 14:09:41 +0200
Subject: [PATCH v2 2/3] media: subdev: Minor
 v4l2_subdev_get_frame_desc_passthrough() cleanups
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-frame-desc-passthrough-impro-v2-2-0c93b437d85d@ideasonboard.com>
References: <20260317-frame-desc-passthrough-impro-v2-0-0c93b437d85d@ideasonboard.com>
In-Reply-To: <20260317-frame-desc-passthrough-impro-v2-0-0c93b437d85d@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2335;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=8sN9QwGz77K3Y0zsOpXU7uArFmzQe2gheap8pVeEnU4=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpuUSRKhvAcYzmyNIFQ6TSJVZmeNPhmDyM7ko2w
 YES1+yKwouJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCablEkQAKCRD6PaqMvJYe
 9QtEEACvn/pii3+0cC9wZ4C5VneHwojHz6kj48DtcJLnQ6W+HpNhDElBC7mtlvTUi+sYfAJZjXJ
 xd+BQNXiAGms1noS9X1F3Tq2qqBNdcCcFVoEFQl/TSGsgqU2Vwq5378IPkJAxfsg8b4f5isUzWn
 S7bfe03OkWbSsgEXjrBCsDLUfE2skhchjdMBAkOWRTaK7sVvPRWe12RMGOAbO0c4B3z94LGjImR
 F4SHU9EFD7LQXj1mV54R8GU3qEwxbF06VfmPWFhKWqQ9T+KxRzsFIvuC/fqiBslV8M5FM/RCEM9
 nZdmVIz3I2MwZaFbIaqhfsewponVrHRudghRk0HDmRecwR24uIkwWNRhv+qFtcRqfMTbvDF916y
 tP/xGd8i59aNnkXr8GKiC5RKT73NpR9rf0PIXKL7jP4sJf4ZQjl9XUfeth/LXuzzLqA3s+UBQng
 ac+guOiWkRLasQbAnWKlFtyc2GEKW5LMcOCj9s+ZeT/sudUV99fuGsE08IgzCjgODqsAikAazgN
 20APwYsR5W4wVe89zLZTLgQgx4m7iEKUrUonZZe9Sy1PCCLSf0/V2y5GNhsISof2BQY4cmhVWPb
 dz89lSwCOaQGyTAXcfdCBfAOwX/E7YE5kfktCZqqcTbtvoqlcGA2WU3jl16iWDGJ9OL9qM1jF5y
 netQnegA5VsyfRw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56055-lists,linux-media=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 9A8EB2A9AB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Minor code cleanups, no functional change.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 9efd14d4026f..2757378c628a 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2549,14 +2549,13 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 					   unsigned int pad,
 					   struct v4l2_mbus_frame_desc *fd)
 {
-	const struct media_pad *pads = sd->entity.pads;
 	struct media_pad *local_sink_pad;
 	struct v4l2_subdev_route *route;
 	struct v4l2_subdev_state *state;
 	struct device *dev = sd->dev;
 	int ret = 0;
 
-	if (WARN_ON(!(pads[pad].flags & MEDIA_PAD_FL_SOURCE)))
+	if (WARN_ON(!(sd->entity.pads[pad].flags & MEDIA_PAD_FL_SOURCE)))
 		return -EINVAL;
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
@@ -2577,7 +2576,6 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 			struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
 			struct media_pad *remote_source_pad;
 			struct v4l2_subdev *remote_sd;
-			unsigned int i;
 
 			if (route->source_pad != pad ||
 			    route->sink_pad != local_sink_pad->index)
@@ -2622,7 +2620,7 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 				}
 			}
 
-			for (i = 0; i < source_fd.num_entries; i++) {
+			for (unsigned int i = 0; i < source_fd.num_entries; i++) {
 				if (source_fd.entry[i].stream == route->sink_stream) {
 					source_entry = &source_fd.entry[i];
 					break;
@@ -2630,7 +2628,7 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 			}
 
 			if (!source_entry) {
-				dev_dbg(sd->dev,
+				dev_dbg(dev,
 					"Failed to find stream %u from source frame desc\n",
 					route->sink_stream);
 				ret = -EPIPE;
@@ -2638,7 +2636,7 @@ int v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
 			}
 
 			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_MAX) {
-				dev_dbg(sd->dev, "Frame desc entry limit reached\n");
+				dev_dbg(dev, "Frame desc entry limit reached\n");
 				ret = -ENOSPC;
 				goto out_unlock;
 			}

-- 
2.43.0


