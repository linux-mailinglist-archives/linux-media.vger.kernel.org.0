Return-Path: <linux-media+bounces-62933-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIomE0phF2p+DAgAu9opvQ
	(envelope-from <linux-media+bounces-62933-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 23:25:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A13B65EA66D
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 23:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67C933028ED7
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 21:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB753BE178;
	Wed, 27 May 2026 21:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="oLiv+0CI";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="ReMNFS1l"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75CD221723
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 21:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779917124; cv=none; b=MlRgyL/S8+sOmiDulE/6ST7oxWGZlxEyG+UsQCFu4VZlb4WgRpjlKYVLqLWMVuZExwN6PBnl/ZGsnNvHqL+ZCUrd8MsSNqkX3g48jSMlXjAUr32KSy+xqzMuwG2dMwZc//Vtr/0nT2ScL2b7uwPxvLyP0vKNcifVbr9nCIzpD6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779917124; c=relaxed/simple;
	bh=r3YiyLMq9KXa9atHHl9rBxnq/k8gp0buCuJq75SgMFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WhIoDBQb2Zxqp4384bS+e00OCjbHpHUXGoBscR1MSu3QJqK+GGbprBHGZAIRuEtDbrKLRSq/PxfrpRQO9UOlt/G8+GCvzwf3IXhn5jrvdQ4gUEI4cFnPBvAM3dpZjmJTYt3KYFJbZf86E+S0mVgS5QdwCYgpa8rXgUfiK3ccLRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=oLiv+0CI; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=ReMNFS1l; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 570CC6AAC1;
	Wed, 27 May 2026 21:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1779917115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=D+lhqfJRL09EH+WsIkEKp46sKbzTBckJqK6tD3HNkxk=;
	b=oLiv+0CIrzCNw5GvhSpCzhp0winfOvGBW8+qEh9CJtqKAF8Y+HqpC3FQ4O1QU5+cEKKUEt
	wCcG9CAMMjGN3PIwnYhEPsJhj5ma6fIpUK9J/HIiLoamzRhCnEqJ9fgCgsPNO8re34jwtL
	jl/utVC8PRddTuKPsXRZZbTRnSaUjmw=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1779917111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=D+lhqfJRL09EH+WsIkEKp46sKbzTBckJqK6tD3HNkxk=;
	b=ReMNFS1lSnA+JSB50SqM4fZdtznRMKRLvR2cuAGYwtvBQBj+oMp0Cl0GJsB7c/eYZ5ssBz
	9aAbNIFWdbQeQ0uwnElb+gbMkRnNCpltKnmBFEa7BRJQufHEwb7Vjrc5dwyA1in5pl9Ki1
	9rcrZV4xngb5FANRMJFR2Cs0OpNVAo4=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 29C1A5AA23;
	Wed, 27 May 2026 21:25:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dgxGCDdhF2rtAQAAD6G6ig
	(envelope-from <oneukum@suse.com>); Wed, 27 May 2026 21:25:11 +0000
From: Oliver Neukum <oneukum@suse.com>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] drivers: media: mc: mc-request.c clean up error handling in media_request_ioctl_reinit
Date: Wed, 27 May 2026 23:24:55 +0200
Message-ID: <20260527212508.2280494-1-oneukum@suse.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -2.80
X-Spam-Flag: NO
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62933-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,suse.com:email,suse.com:mid,suse.com:dkim]
X-Rspamd-Queue-Id: A13B65EA66D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Unify error handling in one place and clarify that interrupts
are enabled for locking purposes.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/mc/mc-request.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/media/mc/mc-request.c b/drivers/media/mc/mc-request.c
index 13e77648807c..efa7fa5fe96e 100644
--- a/drivers/media/mc/mc-request.c
+++ b/drivers/media/mc/mc-request.c
@@ -190,39 +190,38 @@ static long media_request_ioctl_queue(struct media_request *req)
 static long media_request_ioctl_reinit(struct media_request *req)
 {
 	struct media_device *mdev = req->mdev;
-	unsigned long flags;
+	long err = 0;
 
 	mutex_lock(&mdev->req_queue_mutex);
 
-	spin_lock_irqsave(&req->lock, flags);
+	spin_lock_irq(&req->lock);
 	if (req->state != MEDIA_REQUEST_STATE_IDLE &&
 	    req->state != MEDIA_REQUEST_STATE_COMPLETE) {
 		dev_dbg(mdev->dev,
 			"request: %s not in idle or complete state, cannot reinit\n",
 			req->debug_str);
-		spin_unlock_irqrestore(&req->lock, flags);
-		mutex_unlock(&mdev->req_queue_mutex);
-		return -EBUSY;
+		err = -EBUSY;
+		goto bailout;
 	}
 	if (req->access_count) {
 		dev_dbg(mdev->dev,
 			"request: %s is being accessed, cannot reinit\n",
 			req->debug_str);
-		spin_unlock_irqrestore(&req->lock, flags);
-		mutex_unlock(&mdev->req_queue_mutex);
-		return -EBUSY;
+		err = -EBUSY;
+		goto bailout;
 	}
 	req->state = MEDIA_REQUEST_STATE_CLEANING;
-	spin_unlock_irqrestore(&req->lock, flags);
+	spin_unlock_irq(&req->lock);
 
 	media_request_clean(req);
 
-	spin_lock_irqsave(&req->lock, flags);
+	spin_lock_irq(&req->lock);
 	req->state = MEDIA_REQUEST_STATE_IDLE;
-	spin_unlock_irqrestore(&req->lock, flags);
+bailout:
+	spin_unlock_irq(&req->lock);
 	mutex_unlock(&mdev->req_queue_mutex);
 
-	return 0;
+	return err;
 }
 
 static long media_request_ioctl(struct file *filp, unsigned int cmd,
-- 
2.54.0


