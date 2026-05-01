Return-Path: <linux-media+bounces-60147-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIwAF9zJ9GnEEgIAu9opvQ
	(envelope-from <linux-media+bounces-60147-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 17:42:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F8A4ADAE4
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 17:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 252C4304C60D
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 15:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7985F3D3001;
	Fri,  1 May 2026 15:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KFAoeQvb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00963D16E6;
	Fri,  1 May 2026 15:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649975; cv=none; b=g8CAs0ndcVRkMChNmYu6kSMvqe2/fOokVQAX4+KU463h7dctS7OUhPUrHLWWdBbl2YD5ysOekmp9uiRYkqf42K5wdihun55ZQpz5AxfwHqpFjgWDWpnnkoWK3EGCGUCQVDbXXWl8YE6vp678VZ6sPwWGheMZeQqoIbFAgzcEv3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649975; c=relaxed/simple;
	bh=CU4HZUz7ruXCTQJa+/VVoz7nbR/QBujPNiNoL4lLDkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OJzWfJFHrhFJmx6pQoombZbdTHhphJy75e/2YEou7BQf5zotp6/4QluqWoKkBJA/c8EB2/iZOsrx+6cDJ0dBC/5ursDQ2HcZYQMPLq5LPgSD7VXBjj7dpk+g59tSPaE1+4P6Hr6JxV89C69cDxVJoRTuGPtL8rsJou8NlqPzqUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KFAoeQvb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B91CE802;
	Fri,  1 May 2026 17:37:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777649855;
	bh=CU4HZUz7ruXCTQJa+/VVoz7nbR/QBujPNiNoL4lLDkg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KFAoeQvbMmnf3m1jiA0wU+yLn/ax1md4cnKDqLoleYC5xWy81Lc5znueSGdmXfs4+
	 pGAtC33gHP+HYQpCyw6dz0bS4FzYltgnXghGu0tuGhUBRpVWTY6lsC1UcKen4MrM/P
	 ThZ/xAhhiOVESXI4X0vLPDFNXmqiECZ0AbwPwbQY=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 01 May 2026 16:39:05 +0100
Subject: [PATCH 03/11] media: i2c: ov5640: Fix minimum gain to 1.0x
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-ov5640_cleanup-v1-3-0869a7802a33@ideasonboard.com>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
In-Reply-To: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777649959; l=1044;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=CU4HZUz7ruXCTQJa+/VVoz7nbR/QBujPNiNoL4lLDkg=;
 b=h1G2rhWBmZA9xidxk4iGYhVrEWIzjEfQkEeoxgxXGKrF1PwD8Ko52L8i8pf4gztY6pyTZ/GDB
 AD9ASPoYwn+DYzqZ9zQ7Z3s+po0HhUOp1AkfSaeZxklDwnNMAAm+jSr
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-Rspamd-Queue-Id: 09F8A4ADAE4
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
	TAGGED_FROM(0.00)[bounces-60147-lists,linux-media=lfdr.de];
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

Adjust the Analogue Gain control to only provide a minimum gain of 1.0,
and ensure that this is the default value rather than '0' which is
invalid.

Requesting an Analogue gain of 0 would result in a black frame, and when
the sensor is over exposed the Exposure should be reduced instead.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index b5e529ea662b..0dc4f4272d05 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3484,7 +3484,7 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
 	ctrls->auto_gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_AUTOGAIN,
 					     0, 1, 1, 1);
 	ctrls->gain = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_ANALOGUE_GAIN,
-					0, 1023, 1, 0);
+					16, 1023, 1, 16);
 
 	ctrls->saturation = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_SATURATION,
 					      0, 255, 1, 64);

-- 
2.52.0


