Return-Path: <linux-media+bounces-60688-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KARNNvC5+2kxEAAAu9opvQ
	(envelope-from <linux-media+bounces-60688-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 00:00:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1434E0FFA
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 00:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 310B53029C2F
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 21:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F1B3B47E6;
	Wed,  6 May 2026 21:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TJCfOFeK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFBC364052;
	Wed,  6 May 2026 21:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778104616; cv=none; b=kCDB3k+1fdOl96NRwPyEUbcnJBNNFhWnsOIxX4Q/umVV9JjXg6ww4p1Ky0uPgwlpzOmZ8zZLXK4u4gHSmAmjEHnhPEvA7tDwiQelgAwercyeaZA232NjBlDBh3RTfCtXJjca0erKuX93vlBgn/AgHgybeMHZE0GM5pKqOyJJgzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778104616; c=relaxed/simple;
	bh=v48+HlYogwE3W6NBFC9AnfLnHzuLsAAi31a7n5umF04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lIYAYZjLhE+LFh3AQ05CvDRcSFRshOTRg3/jKa/aF5a2wk3XzmHCdtk87WJ7CeBLsMOirDBD1JNt3kf2yhmkgA6BAb5LBNphsKUn1mfZw4Coty8XYMrlVuxfPL8BO7fYlWHHfySz1rBCqrRrXWmZQnbEjUz6jdwq4qZ6iPohgh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TJCfOFeK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2458163D;
	Wed,  6 May 2026 23:56:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778104610;
	bh=v48+HlYogwE3W6NBFC9AnfLnHzuLsAAi31a7n5umF04=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TJCfOFeKfgXTcZoa/EpYKAq1q7IUg2m3SyvUXk1FN8DH+gpyqpPRAMfIOcHzRVIPq
	 GM595lShySWS+zfLbOBpYnTEgRL4P+aA+2L6H97nHoWzjyoFRqPiEV9TDP0kD8EW4y
	 RGlhlqBa3qlYqIWZfYSDuxa7o8cNcRRD8uniBLZc=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v2 1/2] Revert "media: renesas: vsp1: Initialize format on all pads"
Date: Thu,  7 May 2026 00:56:49 +0300
Message-ID: <20260506215650.1897177-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506215650.1897177-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260506215650.1897177-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8D1434E0FFA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60688-lists,linux-media=lfdr.de,renesas];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Action: no action

This reverts commit 133ac42af0a1b389e8b7b3dc7c1cc8c30ff162b6.

The change to format initialization, along with the change to format
propagation in the BRx in commit 937f3e6b51f1 ("media: renesas: vsp1:
brx: Fix format propagation"), broke configuration of the DRM pipeline.
Revert it to fix the regression.

The original commit was meant to fix a v4l2-compliance failure, with no
known userspace applications being affected beside test tools. Reverting
is the simplest option, a more comprehensive fix can be developed (and
tested more thoroughly) later.

Fixes: 133ac42af0a1 ("media: renesas: vsp1: Initialize format on all pads")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_entity.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index 1dad9589768c..839b75b62ceb 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -380,7 +380,7 @@ static int vsp1_entity_init_state(struct v4l2_subdev *subdev,
 	unsigned int pad;
 
 	/* Initialize all pad formats with default values. */
-	for (pad = 0; pad < subdev->entity.num_pads; ++pad) {
+	for (pad = 0; pad < subdev->entity.num_pads - 1; ++pad) {
 		struct v4l2_subdev_format format = {
 			.pad = pad,
 			.which = sd_state ? V4L2_SUBDEV_FORMAT_TRY
-- 
Regards,

Laurent Pinchart


