Return-Path: <linux-media+bounces-56262-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mO9+IXI8u2lmhQIAu9opvQ
	(envelope-from <linux-media+bounces-56262-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 00:59:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B230D2C3F9F
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 00:59:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0C2D13003813
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 23:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A892393DFF;
	Wed, 18 Mar 2026 23:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UDCTZWOj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A603939A9;
	Wed, 18 Mar 2026 23:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773878369; cv=none; b=Z+wurn9shyTChs6om4HysjDuZL4Nmip7KGemoEqPNDMHdptj3rb/6HNQYz4BcAMWxN2A2aaeAwr7y5trDkbXKgjbdBWcMFFKnNPAFASUc+kmykKnSJYw2/Qnw7+aTWt+aZMiXUKVgbarTGsZcG8i90fKUeSFGVnehmtreUk9Dg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773878369; c=relaxed/simple;
	bh=a2GEIRmCFMvM3qIlhr1qpfTVxVJCd6RIjLa5J7yJB2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AAuK5UnrGE+ZhOmOUkpEf4BdjEXJFKshUuLHAHi4Ns0ACmWH0o3gIJtg+z3kyT7AnpPMHl7PNA5EvXP/bgkn0ZmGqXkXXOVSD+fEEJQ9VcJJ7SJpUW2hsQFWXGR+a0v1q1JcvmvYhgVAdkuwnqLc5Bd2pGF4ahsYFVYTIZFZC/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UDCTZWOj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 842B613D3;
	Thu, 19 Mar 2026 00:58:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773878290;
	bh=a2GEIRmCFMvM3qIlhr1qpfTVxVJCd6RIjLa5J7yJB2A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UDCTZWOjgDcqJrmVRZF9CIX1lBArWnlF1SQnc6T2hwP2CLi9CgmtE5C7hvI2caJ9o
	 tyZZUfjo/+vZvD6GkVd4HOpq81xRTYGL+P1owBr8ZAGY3RCoj0j5VFQBbYj2226s3v
	 iBgInHNsFlvhm8wlF5J64r9YT2itrmQPE5CW6qps=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v4 11/13] media: renesas: vsp1: histo: Fix format setting
Date: Thu, 19 Mar 2026 01:59:05 +0200
Message-ID: <20260318235907.831556-12-laurent.pinchart+renesas@ideasonboard.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-56262-lists,linux-media=lfdr.de,renesas];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:mid]
X-Rspamd-Queue-Id: B230D2C3F9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The histogram .set_fmt() handler suffers from two problems:

- When operating on the source pad, it returns correct information to
  userspace, but does not store the format in the subdev state.
  Subsequent calls to .get_fmt(), handled by the
  vsp1_subdev_get_pad_format() helper, will not return the correct
  information.

- When operating on the sink pad, it uses the
  vsp1_subdev_set_pad_format(), which propagates the sink format to the
  source, incorrectly overwriting the fixed source format.

The first issue could be fixed by implementing the set format operation
with vsp1_subdev_get_pad_format() on the source pad, if it wasn't that
.set_fmt() is also used to initialize the subdev state in
vsp1_entity_init_state(). The histogram would need a custom
.init_state() handler.

As the second issue would anyway overwrite the format, and therefore
requires a custom .set_fmt() implementation, fix both issues without
using the helpers.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../media/platform/renesas/vsp1/vsp1_histo.c  | 67 ++++++++++++++++---
 1 file changed, 59 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_histo.c b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
index 313b9f3ce0f1..79da56c456eb 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_histo.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_histo.c
@@ -350,17 +350,68 @@ static int histo_set_format(struct v4l2_subdev *subdev,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
-	if (fmt->pad == HISTO_PAD_SOURCE) {
-		fmt->format.code = MEDIA_BUS_FMT_FIXED;
-		fmt->format.width = 0;
-		fmt->format.height = 0;
-		fmt->format.field = V4L2_FIELD_NONE;
-		fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+	struct vsp1_entity *entity = to_vsp1_entity(subdev);
+	struct v4l2_subdev_state *state;
+	struct v4l2_mbus_framefmt *format;
+	struct v4l2_rect *selection;
+	unsigned int i;
 
-		return 0;
+	state = vsp1_entity_get_state(entity, sd_state, fmt->which);
+	if (!state)
+		return -EINVAL;
+
+	format = v4l2_subdev_state_get_format(state, fmt->pad);
+
+	guard(mutex)(&entity->lock);
+
+	if (fmt->pad == HISTO_PAD_SINK) {
+		/*
+		 * Default to the first media bus code if the requested format
+		 * is not supported.
+		 */
+		for (i = 0; i < entity->num_codes; ++i) {
+			if (fmt->format.code == entity->codes[i])
+				break;
+		}
+
+		format->code = i < entity->num_codes
+			     ? entity->codes[i] : entity->codes[0];
+		format->width = clamp_t(unsigned int, fmt->format.width,
+					entity->min_width, entity->max_width);
+		format->height = clamp_t(unsigned int, fmt->format.height,
+					 entity->min_height, entity->max_height);
+		format->field = V4L2_FIELD_NONE;
+
+		format->colorspace = fmt->format.colorspace;
+		format->xfer_func = fmt->format.xfer_func;
+		format->ycbcr_enc = fmt->format.ycbcr_enc;
+		format->quantization = fmt->format.quantization;
+
+		vsp1_entity_adjust_color_space(format);
+
+		/* Reset the crop and compose rectangles. */
+		selection = v4l2_subdev_state_get_crop(state, fmt->pad);
+		selection->left = 0;
+		selection->top = 0;
+		selection->width = format->width;
+		selection->height = format->height;
+
+		selection = v4l2_subdev_state_get_compose(state, fmt->pad);
+		selection->left = 0;
+		selection->top = 0;
+		selection->width = format->width;
+		selection->height = format->height;
+	} else {
+		format->code = MEDIA_BUS_FMT_METADATA_FIXED;
+		format->width = 0;
+		format->height = 0;
+		format->field = V4L2_FIELD_NONE;
+		format->colorspace = V4L2_COLORSPACE_RAW;
 	}
 
-	return vsp1_subdev_set_pad_format(subdev, sd_state, fmt);
+	fmt->format = *format;
+
+	return 0;
 }
 
 static const struct v4l2_subdev_pad_ops histo_pad_ops = {
-- 
Regards,

Laurent Pinchart


