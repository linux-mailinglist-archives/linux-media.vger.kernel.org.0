Return-Path: <linux-media+bounces-67160-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HHCfBEKhT2pmlQIAu9opvQ
	(envelope-from <linux-media+bounces-67160-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:25:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B867318AA
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 15:25:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ORUqMKb9;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ORUqMKb9;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67160-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67160-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A1D530D4AE5
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 13:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19393286D60;
	Thu,  9 Jul 2026 13:21:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5A5283142
	for <linux-media@vger.kernel.org>; Thu,  9 Jul 2026 13:21:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603290; cv=none; b=cbye5aZ4DLo8y+ee4pS9Edc+V6H3s8q3/IQckKraAA+Je7pYaG8j8CnZK5MgqGzN91CjTTXRWm66JzhlStlVsBu65CgM+hRQF/oxSTyxt/hzVY+w6d1vzHh+evrmQ4dtH+qha4P7tzQzQNRLayEHgoTWuzxigybZymTB5qARGrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603290; c=relaxed/simple;
	bh=M17dMpulSJ+K9IlvNqYPSi3jRg67kGp6jsj5x+e0dIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qpNLVLtOijrSjOGi21ybfbe7pX81Mx/dqy3BbyOo+v5t9eZMrM3+QV2e/ycSY5P+/AjtsqbU89ApZVJ1IS1arr2nI10lg2w66UfI7nmQ4dwOnSwqa9StQgKF73bgB2uoisJgTWjiPrydWO1wCN5U/xUHCKj62ey05Q3PO1Wn5Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=ORUqMKb9; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=ORUqMKb9; arc=none smtp.client-ip=195.135.223.130
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DD6607621C;
	Thu,  9 Jul 2026 13:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783603286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QyxhEkV0IJ8hSdFNqcMWGJIOaTRcxZ42uhAzyd99eAE=;
	b=ORUqMKb9KR8fMePwGoNlvF1HHySyuQR4dbzLLMPimXCgHi8vDGmFG6uSyqbx2WmPdTL9r/
	vhdtugeyjfrbUcHb6LQC3lH8O8toIbCCb77gf8mYfdSp3oCTzy8s4UTo0qF5qMpRyyn40H
	datxcsIfUumeTaZCnV7409h0X99/pAo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1783603286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=QyxhEkV0IJ8hSdFNqcMWGJIOaTRcxZ42uhAzyd99eAE=;
	b=ORUqMKb9KR8fMePwGoNlvF1HHySyuQR4dbzLLMPimXCgHi8vDGmFG6uSyqbx2WmPdTL9r/
	vhdtugeyjfrbUcHb6LQC3lH8O8toIbCCb77gf8mYfdSp3oCTzy8s4UTo0qF5qMpRyyn40H
	datxcsIfUumeTaZCnV7409h0X99/pAo=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BE49F779AA;
	Thu,  9 Jul 2026 13:21:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3LZbLVagT2oTKgAAD6G6ig
	(envelope-from <oneukum@suse.com>); Thu, 09 Jul 2026 13:21:26 +0000
From: Oliver Neukum <oneukum@suse.com>
To: ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>
Subject: [PATCH 1/2] media: stk1160: cleanup error handling in probe
Date: Thu,  9 Jul 2026 15:21:23 +0200
Message-ID: <20260709132124.1453410-1-oneukum@suse.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67160-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ezequiel@vanguardiasur.com.ar,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:oneukum@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oneukum@suse.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73B867318AA

Do not replicate cleanup code.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/usb/stk1160/stk1160-core.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-core.c b/drivers/media/usb/stk1160/stk1160-core.c
index f9462a9ca761..5058cada0d0a 100644
--- a/drivers/media/usb/stk1160/stk1160-core.c
+++ b/drivers/media/usb/stk1160/stk1160-core.c
@@ -263,7 +263,7 @@ static int stk1160_scan_usb(struct usb_interface *intf, struct usb_device *udev,
 static int stk1160_probe(struct usb_interface *interface,
 		const struct usb_device_id *id)
 {
-	int rc = 0;
+	int rc;
 
 	unsigned int *alt_max_pkt_size;	/* array of wMaxPacketSize */
 	struct usb_device *udev;
@@ -290,15 +290,13 @@ static int stk1160_probe(struct usb_interface *interface,
 	 * Also, check if device speed is fast enough.
 	 */
 	rc = stk1160_scan_usb(interface, udev, alt_max_pkt_size);
-	if (rc < 0) {
-		kfree(alt_max_pkt_size);
-		return rc;
-	}
+	if (rc < 0)
+		goto free_array;
 
 	dev = kzalloc_obj(struct stk1160);
 	if (dev == NULL) {
-		kfree(alt_max_pkt_size);
-		return -ENOMEM;
+		rc = -ENOMEM;
+		goto free_array;
 	}
 
 	dev->alt_max_pkt_size = alt_max_pkt_size;
@@ -379,8 +377,9 @@ static int stk1160_probe(struct usb_interface *interface,
 free_ctrl:
 	v4l2_ctrl_handler_free(&dev->ctrl_handler);
 free_err:
-	kfree(alt_max_pkt_size);
 	kfree(dev);
+free_array:
+	kfree(alt_max_pkt_size);
 
 	return rc;
 }
-- 
2.54.0


