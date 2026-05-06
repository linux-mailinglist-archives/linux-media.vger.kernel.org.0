Return-Path: <linux-media+bounces-60689-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI1+DzC5+2kiEAAAu9opvQ
	(envelope-from <linux-media+bounces-60689-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 23:57:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D67984E0EDF
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 23:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9D323008273
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 21:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F67B3B4E9F;
	Wed,  6 May 2026 21:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pylYI4uO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05203B47D7;
	Wed,  6 May 2026 21:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778104618; cv=none; b=tWIBvBEdeT4xgOXLf5UJHC2gwgtFUB2MW1EA5tvLLTqM4IAx3cCWWhctvF8fsM6dqcfmQ4ekbdZnCTNMltJkXM0j7JIKonFivtS+yEiXbYofPDqAlz5no/I3KQ4z60tPerLigZRDeeLYpxR00HkPjAatZz3W5rPndLhAVRJEOwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778104618; c=relaxed/simple;
	bh=s9ZJQTXoeo8U5iaNxwA5ML7HHIOG1WeK/hkd0OPqxhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=psfuFmTfKpv1nQgIvy1AiepohCW9SLr4TaJdv4WX/6BIz/7XaS6sFByKAqdumEOCmcl7kFgiLRnZ+2/j3aPbiZCTEJNrYdU8CdeMxhvfOnH48OfatVDCikv7jLtUpzLTSMUqhWfHw/yw6nAC+StFNw1viCxDPkPyf9Xatily8KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pylYI4uO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 761C1C21;
	Wed,  6 May 2026 23:56:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778104611;
	bh=s9ZJQTXoeo8U5iaNxwA5ML7HHIOG1WeK/hkd0OPqxhs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pylYI4uONK5UXyaNBasRJ3L3J6/QJ1Q8f9xUUt/vqNGL26/VTjdah1K4J2yKnndd5
	 e6xLGSl1BkxHYAJmiBORcIbSwJ2dJinXkSmcux4KknCzb9HETWZln2bR77RRwbZU5M
	 a8/CHRYERvcKpmhpms950qGq4QJ4r11/7CoeXKjY=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v2 2/2] Revert "media: renesas: vsp1: brx: Fix format propagation"
Date: Thu,  7 May 2026 00:56:50 +0300
Message-ID: <20260506215650.1897177-3-laurent.pinchart+renesas@ideasonboard.com>
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
X-Rspamd-Queue-Id: D67984E0EDF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60689-lists,linux-media=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim,renesas.com:email]
X-Rspamd-Action: no action

This reverts commit 937f3e6b51f1cea079be9ba642665f2bf8bcc31f.

The change to format propagation in the BRx broke configuration of the
DRM pipeline. Revert it to fix the regression.

The original commit was meant to fix a v4l2-compliance failure, with no
known userspace applications being affected beside test tools. Reverting
is the simplest option, a more comprehensive fix can be developed (and
tested more thoroughly) later.

Reported-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Closes: https://lore.kernel.org/linux-media/CA+V-a8t481xuwava0nb7uY9CUPqFWZ_8EP0xrK3BgumP7HDcLg@mail.gmail.com
Fixes: 937f3e6b51f1 ("media: renesas: vsp1: brx: Fix format propagation")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_brx.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
index b1a2c68e9944..9d93cb8b8e82 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
@@ -156,20 +156,14 @@ static int brx_set_format(struct v4l2_subdev *subdev,
 		compose->height = format->height;
 	}
 
-	/*
-	 * Propagate the format code to all pads, and the whole format to the
-	 * source pad.
-	 */
+	/* Propagate the format code to all pads. */
 	if (fmt->pad == BRX_PAD_SINK(0)) {
 		unsigned int i;
 
-		for (i = 0; i < brx->entity.source_pad; ++i) {
+		for (i = 0; i <= brx->entity.source_pad; ++i) {
 			format = v4l2_subdev_state_get_format(state, i);
 			format->code = fmt->format.code;
 		}
-
-		format = v4l2_subdev_state_get_format(state, i);
-		*format = fmt->format;
 	}
 
 done:
-- 
Regards,

Laurent Pinchart


