Return-Path: <linux-media+bounces-59612-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABNXLEE37WmTgwAAu9opvQ
	(envelope-from <linux-media+bounces-59612-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 23:50:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1460A467EA0
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 23:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13C0230036C3
	for <lists+linux-media@lfdr.de>; Sat, 25 Apr 2026 21:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108BF3624AF;
	Sat, 25 Apr 2026 21:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S1YdDhbb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2991D33D4EC;
	Sat, 25 Apr 2026 21:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777153849; cv=none; b=P1wjHa0071gwa9voKsBzaW1jeVe4ZF9dVccpmIvVoWQeZKyEAxRdJf6EmlC1eq40X1ZqXqizoTfXMdmL0uJe6Udh5UzC6jNYrNKlWaRXgyygrL3XkoKIC1PuzE4tZd+3LKG9azN8gv4xrOZNpzV353Dae4qfLdSfREMVgQkH5bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777153849; c=relaxed/simple;
	bh=Eqeee3zzZnMu2texkvZlN8dC6INnUSCAuuPOCps11Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=maVRjtvstk9jkxxkGmLRRIneEFFSU8d5AnsP7B8OzTgeWmdgrH60EO0Nh/F6vSLvpM2+kDfe6sxMeXg8C6LvlZX+FtKIa1N+1GwzyYjqzjfbzZGa68AuL5Wc+fdACTH3QWFWYU6PjMDCtPGAZJCo0uR7gIDxdonExv1N3TpBJLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S1YdDhbb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4D779A6;
	Sat, 25 Apr 2026 23:48:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777153738;
	bh=Eqeee3zzZnMu2texkvZlN8dC6INnUSCAuuPOCps11Ac=;
	h=From:To:Cc:Subject:Date:From;
	b=S1YdDhbbIVFE/1L8uCnzNh/L6vgGpll3lL6IhGYZNrB2o+yqULEl2Gw3EoGMQFNih
	 MvV2KsCu8U/3naEpUZ4mN4cCeKjEvKLcaka9uEX+4YzB3I2hrFKui+Uhdu5kPBvWjh
	 JEFbiw/0CYfbkO7Ugkk0LQAjf7Cvem5FY5ltSF3s=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] Revert "media: renesas: vsp1: brx: Fix format propagation"
Date: Sun, 26 Apr 2026 00:50:37 +0300
Message-ID: <20260425215037.3557213-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1460A467EA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59612-lists,linux-media=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

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
This is a fix for a v7.1 regression.

Prabhakar, I have test this on R-Car Gen3 with
kms-test-plane-position.py and it fixes the regression I reproduced. The
symptoms were not identical to the ones you reported on RZ/V2H, so I
would appreciated if you could confirm that the patch fixes the
regression for you too.
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


