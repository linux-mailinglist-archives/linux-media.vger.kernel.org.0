Return-Path: <linux-media+bounces-52748-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGnhAgcwj2mhLwEAu9opvQ
	(envelope-from <linux-media+bounces-52748-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:07:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B151136E7D
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 15:07:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A4DC31580D9
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3CC361DCA;
	Fri, 13 Feb 2026 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uJrG526K"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBBC361DC1;
	Fri, 13 Feb 2026 14:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991340; cv=none; b=LxRfOR2XwhT38rEUDuC7rJkJeqcNUnpx0HHVvGdJxZOE2h8b/1YO9XI0yaVP5+4+A0XskSet1PXh1teH4SLuZVBb1NBa1VBL2+5ZjiukPARzTUoSTXVPrI8IsZc+kTw7mBsVQjgWZySAp1Map++zofeKlA40kHFck6pjUY6ULnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991340; c=relaxed/simple;
	bh=78T0LnvdtFFAIIJ76DTX3FnmfK0GiECbM3UInTJHW6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K/s25G0VGp9rc0nIz0rFhwQHf88m4XbHqifoHb6yTF72DKIxw3yxmr3FlWGErmHLr6vaN0PphthporPB6dMDSrqO8fJsE55aHG5enTzgD+rxbppMWy9aMSns2UkPF0jGw0fsmNg5J57kHzdbupGGdyAVSB4TdKmUKMA6JDv/r9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uJrG526K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBE5026AB;
	Fri, 13 Feb 2026 15:01:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770991280;
	bh=78T0LnvdtFFAIIJ76DTX3FnmfK0GiECbM3UInTJHW6k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uJrG526Kecp6EwNlLldMFPe8w3p2Ll4OaSybboJMHtTSeWU41Pk8mbxiTmHqqayqO
	 IMNwbkb2Vd6By3aANC/ojAT0ydMvLcS8ohrW8a4bVxH7TrM88Q3U/v9wyXWs7OvxZ6
	 LWQT4uG38fRgBEXo2n0aGen1VvcUnxHOfjLmVY+k=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 13 Feb 2026 14:01:47 +0000
Subject: [PATCH v2 08/25] media: i2c: imx283: Vertical offset corrections
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-mainline-imx283-v2-v2-8-be40a3770ebf@ideasonboard.com>
References: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com>
In-Reply-To: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com>
To: Umang Jain <uajain@igalia.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770991325; l=1732;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=78T0LnvdtFFAIIJ76DTX3FnmfK0GiECbM3UInTJHW6k=;
 b=w1mBCiTuVlkcEvJ4bPG9AUuv7v4cQ+MoLQ/vOyYg6iR1VHXJDSDJUR+tW/NFAoJLOMbm/cEhX
 Ai67ZNTCI1BAS5PZ88RNGQzqgvwN9WJom4Il7EraZ7j5klGQXcE3Cb7
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52748-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 9B151136E7D
X-Rspamd-Action: no action

The IMX283 has different vertical offsets when applying binning modes.
To provide consistent framing in each mode - ensure that the offsets
measured are accounted for.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 0abfeeb89425..95f93ee0747f 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -272,7 +272,7 @@ struct imx283_scanout {
 	u8 vertical_ob;
 
 	/* Vertical Arbitrary Cropping Function */
-	u16 vst;
+	s16 vst;
 	u16 vct;
 	u16 veff;
 };
@@ -283,7 +283,7 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.bpp = 12,
 		.readout = { 0x04, 0x03, 0x10, 0x00 },
 		.vertical_ob = 16,
-		.vst = 0,
+		.vst = -1, /* Align to Mode 2/3 */
 		.vct = 0,
 		.veff = 3694,
 	},
@@ -291,7 +291,7 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.bpp = 10,
 		.readout = { 0x04, 0x01, 0x00, 0x00 },
 		.vertical_ob = 16,
-		.vst = 0,
+		.vst = -1, /* Align to Mode 2/3 */
 		.vct = 0,
 		.veff = 3694,
 	},
@@ -317,7 +317,7 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.bpp = 12,
 		.readout = { 0x0d, 0x11, 0x50, 0x00 },
 		.vertical_ob = 4,
-		.vst = 0,
+		.vst = -2, /* Provides alignment to Mode 0/1 */
 		.vct = 0,
 		.veff = 1824,
 	},
@@ -335,7 +335,7 @@ static const struct imx283_scanout imx283_scan_modes[] = {
 		.bpp = 12,
 		.readout = { 0x1e, 0x18, 0x10, 0x00 },
 		.vertical_ob = 4,
-		.vst = 0,
+		.vst = 1, /* Provides alignment to Mode 0/1 */
 		.vct = 0,
 		.veff = 1234,
 	},

-- 
2.52.0


