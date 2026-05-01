Return-Path: <linux-media+bounces-60150-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KJzEVrK9GnEEgIAu9opvQ
	(envelope-from <linux-media+bounces-60150-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 17:44:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B34F4ADB0C
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 17:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAA513072AA1
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 15:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2A43D34BC;
	Fri,  1 May 2026 15:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Ekkw31iT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF853D091B;
	Fri,  1 May 2026 15:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649982; cv=none; b=OEFF0GsuWoTahMptYjCxZvnfALj6Gd5dq0fnn8sNaMtTFD1Gz3LR7/77yO01DcEDMJLwXuFjGEOUZI5hVnfHSVbt2W6oOJYQ/AI4dq/I2/wQMnA78+eAYVboaBQ+cF4MmtB+04XUR8r89f8B0PZe0qjzbHrXea8vUCnAA1taxhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649982; c=relaxed/simple;
	bh=DQCUjDrCnDe0ZfwbDnnalWvDQSrt/yIfBPdK5RXwdf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YpLtUTyaE16S/PfkxaKt8wdtafnM1FJVweGQHTddO/AQlUTHkUksBkjleGGnDyyDKl7Hka19CRzT7z7j/R+AqjYGKacF0wGgAFbNyLcegN2HgTnRpG+wIps9uICL5pIsHk8YYuKHziJxklBlgL4pVOyKRT1n69GnLDNYHeOQCVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Ekkw31iT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 226D813BA;
	Fri,  1 May 2026 17:37:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777649857;
	bh=DQCUjDrCnDe0ZfwbDnnalWvDQSrt/yIfBPdK5RXwdf8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ekkw31iTBo/GppkOmZXgqA7DkbITYKGIwH6wf9NlLDBKL7vdzMMzNcBw0lBD3EpQr
	 RpMISPw/pw9/6CATx97ED2me1ad/zbEm9W7rG0DKqPbYEVZYUFeYm2RiTUUcm/U4GK
	 KrgEQD/OAK1L0oSrciCgjUSxboKhvNdI0vAR70+M=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 01 May 2026 16:39:09 +0100
Subject: [PATCH 07/11] media: i2c: ov5640: Split out AWB registers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-ov5640_cleanup-v1-7-0869a7802a33@ideasonboard.com>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
In-Reply-To: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777649959; l=2682;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=DQCUjDrCnDe0ZfwbDnnalWvDQSrt/yIfBPdK5RXwdf8=;
 b=INH3F+izvzn4SBYWPNSW2mW7VGJON9Div9c9HFeqcKu73aN0USWM7IFyxorLR61YrvklXli49
 BJb8zjTCm8pD+u+tEuCD6ZigvywUGDIw2ytil1py7deCDq5XgxHSeyh
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Queue-Id: 8B34F4ADB0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60150-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kieran.bingham@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim,ideasonboard.com:mid]

Move the AWB registers to their own lines and split out from
the bulk block independently as a first stage before documenting
to ensure no registers values get lost or reordered during
the updates.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 46 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 11 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index b4e1ec4364df..4b6804fc47e1 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -573,17 +573,41 @@ static const struct reg_value ov5640_init_setting[] = {
 	{0x3002, 0x1c, 0, 0}, {0x3004, 0xff, 0, 0}, {0x3006, 0xc3, 0, 0},
 	{0x302e, 0x08, 0, 0}, {0x4300, 0x3f, 0, 0},
 	{0x501f, 0x00, 0, 0}, {0x440e, 0x00, 0, 0}, {0x4837, 0x0a, 0, 0},
-	{0x5000, 0xa7, 0, 0}, {0x5001, 0xa3, 0, 0}, {0x5180, 0xff, 0, 0},
-	{0x5181, 0xf2, 0, 0}, {0x5182, 0x00, 0, 0}, {0x5183, 0x14, 0, 0},
-	{0x5184, 0x25, 0, 0}, {0x5185, 0x24, 0, 0}, {0x5186, 0x09, 0, 0},
-	{0x5187, 0x09, 0, 0}, {0x5188, 0x09, 0, 0}, {0x5189, 0x88, 0, 0},
-	{0x518a, 0x54, 0, 0}, {0x518b, 0xee, 0, 0}, {0x518c, 0xb2, 0, 0},
-	{0x518d, 0x50, 0, 0}, {0x518e, 0x34, 0, 0}, {0x518f, 0x6b, 0, 0},
-	{0x5190, 0x46, 0, 0}, {0x5191, 0xf8, 0, 0}, {0x5192, 0x04, 0, 0},
-	{0x5193, 0x70, 0, 0}, {0x5194, 0xf0, 0, 0}, {0x5195, 0xf0, 0, 0},
-	{0x5196, 0x03, 0, 0}, {0x5197, 0x01, 0, 0}, {0x5198, 0x04, 0, 0},
-	{0x5199, 0x6c, 0, 0}, {0x519a, 0x04, 0, 0}, {0x519b, 0x00, 0, 0},
-	{0x519c, 0x09, 0, 0}, {0x519d, 0x2b, 0, 0}, {0x519e, 0x38, 0, 0},
+	{0x5000, 0xa7, 0, 0}, {0x5001, 0xa3, 0, 0},
+
+	/* AWB Control */
+	{0x5180, 0xff, 0, 0},
+	{0x5181, 0xf2, 0, 0},
+	{0x5182, 0x00, 0, 0},
+	{0x5183, 0x14, 0, 0},
+	{0x5184, 0x25, 0, 0},
+	{0x5185, 0x24, 0, 0},
+	{0x5186, 0x09, 0, 0},
+	{0x5187, 0x09, 0, 0},
+	{0x5188, 0x09, 0, 0},
+	{0x5189, 0x88, 0, 0},
+	{0x518a, 0x54, 0, 0},
+	{0x518b, 0xee, 0, 0},
+	{0x518c, 0xb2, 0, 0},
+	{0x518d, 0x50, 0, 0},
+	{0x518e, 0x34, 0, 0},
+	{0x518f, 0x6b, 0, 0},
+	{0x5190, 0x46, 0, 0},
+	{0x5191, 0xf8, 0, 0},
+	{0x5192, 0x04, 0, 0},
+	{0x5193, 0x70, 0, 0},
+	{0x5194, 0xf0, 0, 0},
+	{0x5195, 0xf0, 0, 0},
+	{0x5196, 0x03, 0, 0},
+	{0x5197, 0x01, 0, 0},
+	{0x5198, 0x04, 0, 0},
+	{0x5199, 0x6c, 0, 0},
+	{0x519a, 0x04, 0, 0},
+	{0x519b, 0x00, 0, 0},
+	{0x519c, 0x09, 0, 0},
+	{0x519d, 0x2b, 0, 0},
+	{0x519e, 0x38, 0, 0},
+
 	{0x5381, 0x1e, 0, 0}, {0x5382, 0x5b, 0, 0}, {0x5383, 0x08, 0, 0},
 	{0x5384, 0x0a, 0, 0}, {0x5385, 0x7e, 0, 0}, {0x5386, 0x88, 0, 0},
 	{0x5387, 0x7c, 0, 0}, {0x5388, 0x6c, 0, 0}, {0x5389, 0x10, 0, 0},

-- 
2.52.0


