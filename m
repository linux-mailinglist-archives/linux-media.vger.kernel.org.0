Return-Path: <linux-media+bounces-52617-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Dd0yFTPFjGmuswAAu9opvQ
	(envelope-from <linux-media+bounces-52617-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 19:06:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A272C126CA5
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 19:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A9103015C86
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 18:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1E434FF5E;
	Wed, 11 Feb 2026 18:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="l8Qpfi+A";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="l8Qpfi+A"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A51A932
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 18:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770833192; cv=none; b=sZm5Msru+bY0A4Pxnl2dOwXpjJjnyqV3rNUsql/yRRndasHHUGWwPAMC+uJwJCPGSd+seO4xb4yUOd9fnfA68xTjr+gznqfZ2R1ASwfT4Juud5vCqTGHsa5CHdM0aGIB0QYLFwVVjSapkRl3dG9IOe75XEjnTyERyjCNn/qqazg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770833192; c=relaxed/simple;
	bh=6H0rEeqTkwfIofX53xl8hIT3ny7lMw5EOx7JV7K6LDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WpSG86Dy/ooMaADw/KM3CCrL0MBOCDb3zqomEBVAXP5s1fffn421iHQ9nPpxQsWkNEmepr0c+ocV9TrcjYP1wNjf94Z96JMln094Sh6a6R5B78kpV8VY5nQ5URDZZ55r5R2aTCtwq4srYk6S3/Hu4jnZDyqJIKDp7aWTI4iP8r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=l8Qpfi+A; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=l8Qpfi+A; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A8B555BDC9;
	Wed, 11 Feb 2026 18:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1770833189; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BgMo6RwzgqZnEdMnw8wn9T4E2Wpz79JV3Kuh3kEPlIM=;
	b=l8Qpfi+AU/t1q+NkKYREfbnaDP+7xeWgOk5ppfXWvI45VbRhZWCFM5ZMX7dxwD15qkn2WT
	MzfqeIW+YB9tmnz2kud3DoaAB41OPjzXcxMzB9gkjBc34SJI30Xbn73AubzLzOQEutf04P
	QtBKcWZnOz9WBJ4w+fX4kgvqB3Gg2OE=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1770833189; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BgMo6RwzgqZnEdMnw8wn9T4E2Wpz79JV3Kuh3kEPlIM=;
	b=l8Qpfi+AU/t1q+NkKYREfbnaDP+7xeWgOk5ppfXWvI45VbRhZWCFM5ZMX7dxwD15qkn2WT
	MzfqeIW+YB9tmnz2kud3DoaAB41OPjzXcxMzB9gkjBc34SJI30Xbn73AubzLzOQEutf04P
	QtBKcWZnOz9WBJ4w+fX4kgvqB3Gg2OE=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 769BE3EA62;
	Wed, 11 Feb 2026 18:06:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6PllGyXFjGnADQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Wed, 11 Feb 2026 18:06:29 +0000
From: Oliver Neukum <oneukum@suse.com>
To: sean@mess.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 1/4] media: rc: streamzap: error handling in probe
Date: Wed, 11 Feb 2026 19:06:21 +0100
Message-ID: <20260211180621.992776-1-oneukum@suse.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52617-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email]
X-Rspamd-Queue-Id: A272C126CA5
X-Rspamd-Action: no action

If submitting the URB fails, the device will be unusual.
Probe() must fail.

Fixes: 7a569f524dd36 ("V4L/DVB: IR/streamzap: functional in-kernel decoding")
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/rc/streamzap.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/rc/streamzap.c b/drivers/media/rc/streamzap.c
index d3b48a0dd1f4..8e9b156e4300 100644
--- a/drivers/media/rc/streamzap.c
+++ b/drivers/media/rc/streamzap.c
@@ -219,9 +219,8 @@ static void streamzap_callback(struct urb *urb)
 	case -ESHUTDOWN:
 		/*
 		 * this urb is terminated, clean up.
-		 * sz might already be invalid at this point
 		 */
-		dev_err(sz->dev, "urb terminated, status: %d\n", urb->status);
+		dev_dbg(sz->dev, "urb terminated, status: %d\n", urb->status);
 		return;
 	default:
 		break;
@@ -358,11 +357,16 @@ static int streamzap_probe(struct usb_interface *intf,
 
 	usb_set_intfdata(intf, sz);
 
-	if (usb_submit_urb(sz->urb_in, GFP_ATOMIC))
+	retval = usb_submit_urb(sz->urb_in, GFP_ATOMIC);
+	if (retval < 0) {
 		dev_err(sz->dev, "urb submit failed\n");
+		goto rc_submit_fail;
+	}
 
 	return 0;
-
+rc_submit_fail:
+	rc_free_device(sz->rdev);
+	usb_set_intfdata(intf, NULL);
 rc_dev_fail:
 	usb_free_urb(sz->urb_in);
 free_buf_in:
-- 
2.53.0


