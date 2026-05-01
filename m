Return-Path: <linux-media+bounces-60144-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNqkOIHJ9GnEEgIAu9opvQ
	(envelope-from <linux-media+bounces-60144-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 17:40:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8504ADA95
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 17:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 655DC3035AB4
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 15:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4BF3D0934;
	Fri,  1 May 2026 15:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mxdlmt9W"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724F93CA499;
	Fri,  1 May 2026 15:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649970; cv=none; b=m05/TTmvwMFtvD75aX/CkwUEU/F3MwLHSt3sui1FYwDTzOhIf9Om+UILCkweQuBMBekp8328TNjqUCncZSf4FrSrrtY/C6zSttOxyxK6oic5G+mSktA/cJUbV2J3EOYdQzg2ZOapcBnhTHdM//hdkXCnv1T0AMEKow/alOyi+Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649970; c=relaxed/simple;
	bh=ZiqHYLgH9r/Q7zxIHs8cGRe43k8mG5yTH+Z8muQgmoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I5XRbLYUwX7NaYcLVare+sXrR4qSWxn0J5EYYSAwqTpRI0gwETQqlqoTQBYee9pkrhWn6kdlYRVAKp8tnG8DISUo+aFaR0Jzg36+jRwmOZfqfG00jMJIdd2TDU/UNGU+chzs6VlJSz3XupFq3jRz8nIrxdyPbfccKhoCOlgH3fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mxdlmt9W; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13FD0664;
	Fri,  1 May 2026 17:37:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777649855;
	bh=ZiqHYLgH9r/Q7zxIHs8cGRe43k8mG5yTH+Z8muQgmoQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mxdlmt9WHOb/vwXyMi4YX2kg1lWYX6Jxs2C8A/3fCsWtghEjYuasatZwF7jiF8aYw
	 xZ6GKySnGDV34jZqQ8KqwPI5xtsuTaT4FNfEPTPk0bQZiqjhJty5lJQNykhf+3VTmm
	 OHK5oGSTlQW4WFBq7xzYEN5Ejus+mi/EaqEjQU/Y=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 01 May 2026 16:39:03 +0100
Subject: [PATCH 01/11] media: i2c: ov5640: Set default WB gains
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-ov5640_cleanup-v1-1-0869a7802a33@ideasonboard.com>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
In-Reply-To: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777649959; l=1049;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=ZiqHYLgH9r/Q7zxIHs8cGRe43k8mG5yTH+Z8muQgmoQ=;
 b=m7DTuQIRhEgKtYEe+1YdhqmnREZTq4abpYz51XXPllIZPxUQcMAoASJc9gerXMBvSCAc9Wz7y
 EcFVw0FF468ACRBrkjSH8U9V6x/yBFnjeD4bfUnsnSjdgbs89MIJ5zu
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Queue-Id: 8A8504ADA95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60144-lists,linux-media=lfdr.de];
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

The default values for the Blue and Red balance should be
the same as the Green balance (0x400/1024).

Update the values to ensure no change is applied by default.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 85ecc23b3587..01ea6b2bfeeb 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3470,9 +3470,9 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 					   V4L2_CID_AUTO_WHITE_BALANCE,
 					   0, 1, 1, 1);
 	ctrls->blue_balance = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_BLUE_BALANCE,
-						0, 4095, 1, 0);
+						0, 4095, 1, 1024);
 	ctrls->red_balance = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_RED_BALANCE,
-					       0, 4095, 1, 0);
+					       0, 4095, 1, 1024);
 	/* Auto/manual exposure */
 	ctrls->auto_exp = v4l2_ctrl_new_std_menu(hdl, ops,
 						 V4L2_CID_EXPOSURE_AUTO,

-- 
2.52.0


