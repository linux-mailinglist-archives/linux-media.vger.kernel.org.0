Return-Path: <linux-media+bounces-56259-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEhwAqM8u2lmhQIAu9opvQ
	(envelope-from <linux-media+bounces-56259-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 01:00:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED4A2C3FD4
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 01:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D860F3028831
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 23:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC170393DCD;
	Wed, 18 Mar 2026 23:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XiHXkWq1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EFC3939A9;
	Wed, 18 Mar 2026 23:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773878366; cv=none; b=qh+BRJc/KfeEbF1CEwP6vD+4BKJtD/cWqGnIgaxo9wYGvi6vVvGMavdEIYmgCGVVEa4Z3BOzJ1f/Cdq6zc6xNcY87BzQq2ROxxBeBn+0zSVWchUvYnakipv0SmeYuztljACBiX0uZTAIxpmcbRYl8cU9Oxzo2jKfVhgctxhvxXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773878366; c=relaxed/simple;
	bh=Szk70GkMcaOflbL9LxMVc5cbPaxff2f/t4LnMznh6gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N2yEfKHktKtnfLQAWoyOIlhaWJ9yAP/6QKUuDKv6h6WyqjIFT87cSYuGBbps9s4MV5lDCzjk7K30Ltx5BdEpxYoN7Tu9x7Emw6bwmQLofyElpEu+5SlT4sO8bP6j5BZrolIvyHXJjdM+whl5KB1PJj/R37oQ1GGsryeeACso9Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XiHXkWq1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9D7B8379;
	Thu, 19 Mar 2026 00:58:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773878286;
	bh=Szk70GkMcaOflbL9LxMVc5cbPaxff2f/t4LnMznh6gc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XiHXkWq1IpRhCf7r/VMH25gXooJae0y+iQkoVIdo3MLVSAHL1cVEoonziXaBiDcYO
	 TejNIaHW+J+e9xWKirfOzioQDxOLA22Chto0KnsbWI6B+xegt3RG2xDCaUyhMRSTrd
	 5BPRaxlQj/gtBi0/iWq8oWcumxI48X+/PBfHxKps=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v4 08/13] media: renesas: vsp1: hsit: Fix size enumeration
Date: Thu, 19 Mar 2026 01:59:02 +0200
Message-ID: <20260318235907.831556-9-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-56259-lists,linux-media=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: 5ED4A2C3FD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The HSIT entity performs format conversion, which leads to incorrect
results with the vsp1_subdev_enum_frame_size() helper. Implement a
custom .enum_frame_size() handler that correctly validates the media bus
code. Size validation is identical to the helper.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_hsit.c   | 53 ++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
index 8260934db789..830e124beb7b 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_hsit.c
@@ -9,6 +9,7 @@
 
 #include <linux/device.h>
 #include <linux/gfp.h>
+#include <linux/mutex.h>
 
 #include <media/v4l2-subdev.h>
 
@@ -57,6 +58,56 @@ static int hsit_enum_mbus_code(struct v4l2_subdev *subdev,
 	return 0;
 }
 
+static int hsit_enum_frame_size(struct v4l2_subdev *subdev,
+				struct v4l2_subdev_state *sd_state,
+				struct v4l2_subdev_frame_size_enum *fse)
+{
+	struct vsp1_entity *entity = to_vsp1_entity(subdev);
+	struct vsp1_hsit *hsit = to_hsit(subdev);
+	u32 code;
+
+	if (fse->index)
+		return -EINVAL;
+
+	if ((fse->pad == HSIT_PAD_SINK && !hsit->inverse) |
+	    (fse->pad == HSIT_PAD_SOURCE && hsit->inverse))
+		code = MEDIA_BUS_FMT_ARGB8888_1X32;
+	else
+		code = MEDIA_BUS_FMT_AHSV8888_1X32;
+
+	if (fse->code != code)
+		return -EINVAL;
+
+	if (fse->pad == 0) {
+		fse->min_width = entity->min_width;
+		fse->max_width = entity->max_width;
+		fse->min_height = entity->min_height;
+		fse->max_height = entity->max_height;
+	} else {
+		struct v4l2_subdev_state *state;
+		struct v4l2_mbus_framefmt *format;
+
+		state = vsp1_entity_get_state(entity, sd_state, fse->which);
+		if (!state)
+			return -EINVAL;
+
+		/*
+		 * The size on the source pad is fixed and always identical to
+		 * the sink pad.
+		 */
+		format = v4l2_subdev_state_get_format(state, HSIT_PAD_SINK);
+
+		guard(mutex)(&entity->lock);
+
+		fse->min_width = format->width;
+		fse->max_width = format->width;
+		fse->min_height = format->height;
+		fse->max_height = format->height;
+	}
+
+	return 0;
+}
+
 static int hsit_set_format(struct v4l2_subdev *subdev,
 			   struct v4l2_subdev_state *sd_state,
 			   struct v4l2_subdev_format *fmt)
@@ -117,7 +168,7 @@ static int hsit_set_format(struct v4l2_subdev *subdev,
 
 static const struct v4l2_subdev_pad_ops hsit_pad_ops = {
 	.enum_mbus_code = hsit_enum_mbus_code,
-	.enum_frame_size = vsp1_subdev_enum_frame_size,
+	.enum_frame_size = hsit_enum_frame_size,
 	.get_fmt = vsp1_subdev_get_pad_format,
 	.set_fmt = hsit_set_format,
 };
-- 
Regards,

Laurent Pinchart


