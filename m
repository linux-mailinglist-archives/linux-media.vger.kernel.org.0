Return-Path: <linux-media+bounces-58570-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBRPJ51l2Wk5pQgAu9opvQ
	(envelope-from <linux-media+bounces-58570-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 23:03:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF063DCAD5
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 23:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A4F6E300E020
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 21:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A55C3A7F67;
	Fri, 10 Apr 2026 21:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="qXCi79wR";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="qXCi79wR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F98039A803
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 21:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775855000; cv=none; b=J4B8mooK6vt4iBTUg5cTox6B2/X9rnkWDcE2lQYBn8o+bq/ZwVJddaHJ3/1svNHpaiaXuJIo1iex1GLcmUC/OVdiv3+qLlniBSDwd3UMz1ZFkvrIw9gOGu7n3V/nNBPr/DPnjKEf7ruFmDdjhQkiEelyCSdno8/35IuXb0AuuLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775855000; c=relaxed/simple;
	bh=7h8LyRdoJp3yGfPH2fNa8yX21k/lalqexk3fyYPfYNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UpyWbQ7cy+9sZuuGD27N64YKVOCQFKsODjusxu1MCJTfL2vWXGKammsPuoqM+gTv4Y3WtAblSbkny4TklynEsMY3ngKRayY+M6KzSNyUQtmeQuTFCb/lPr/BDPNg4oultCmz4b4O0oIavED9CPyzbnZeCmAxfFPdTN4ZFzznVIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=qXCi79wR; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=qXCi79wR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D5AAF5BCF2;
	Fri, 10 Apr 2026 21:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1775854997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nGyagOtSx+G12drqNoiREvB00SzQGDW0YPOk4Jdw8NI=;
	b=qXCi79wRnUvocNYqGngCjCUizjnHN+eeGwmVKVKLxMlN/AFWbNRHc3zRO4F+zv+6YeuK49
	ceQv4On9VgNW02iLcYG/g7Gjic1rExGC5WvsGKeHKpmSzyr1rMZQ0RyauDldwXEkQNOCWS
	Obuqgva+tifjhlfHZjkmtS7WYLVufxM=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=qXCi79wR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1775854997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nGyagOtSx+G12drqNoiREvB00SzQGDW0YPOk4Jdw8NI=;
	b=qXCi79wRnUvocNYqGngCjCUizjnHN+eeGwmVKVKLxMlN/AFWbNRHc3zRO4F+zv+6YeuK49
	ceQv4On9VgNW02iLcYG/g7Gjic1rExGC5WvsGKeHKpmSzyr1rMZQ0RyauDldwXEkQNOCWS
	Obuqgva+tifjhlfHZjkmtS7WYLVufxM=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A5C4A4A0B2;
	Fri, 10 Apr 2026 21:03:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jtZfJ5Vl2Wn2YwAAD6G6ig
	(envelope-from <oneukum@suse.com>); Fri, 10 Apr 2026 21:03:17 +0000
From: Oliver Neukum <oneukum@suse.com>
To: error27@gmail.com,
	sean@mess.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] media: rc: ttusbir: fix inverted error logic
Date: Fri, 10 Apr 2026 23:03:09 +0200
Message-ID: <20260410210309.724713-1-oneukum@suse.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-58570-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,mess.org,kernel.org,vger.kernel.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3CF063DCAD5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We have to report ENOMEM if no buffer is allocated.
Typo dropped a "!". Restore it.

Fixes: 50acaad3d202 ("media: rc: ttusbir: respect DMA coherency rules")
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/rc/ttusbir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/ttusbir.c b/drivers/media/rc/ttusbir.c
index 3848ad3a6b85..db2f6698a6c0 100644
--- a/drivers/media/rc/ttusbir.c
+++ b/drivers/media/rc/ttusbir.c
@@ -191,7 +191,7 @@ static int ttusbir_probe(struct usb_interface *intf,
 	tt = kzalloc_obj(*tt);
 	buffer = kzalloc(5, GFP_KERNEL);
 	rc = rc_allocate_device(RC_DRIVER_IR_RAW);
-	if (!tt || !rc || buffer) {
+	if (!tt || !rc || !buffer) {
 		ret = -ENOMEM;
 		goto out;
 	}
-- 
2.53.0


