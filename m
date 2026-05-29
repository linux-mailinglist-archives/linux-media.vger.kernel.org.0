Return-Path: <linux-media+bounces-63023-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJ83MphjGWoBwAgAu9opvQ
	(envelope-from <linux-media+bounces-63023-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 11:59:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1554600607
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 11:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CA3D0300BC49
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 09:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA0013C661D;
	Fri, 29 May 2026 09:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="fY/t++Yd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00973C457C
	for <linux-media@vger.kernel.org>; Fri, 29 May 2026 09:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780048784; cv=none; b=ezzBcXo6TfrbzLRrwmG3lT/M5QeT8aSres5p4PyYxOwnGgDCQNq9HT2S4LGy5EcqMZnYYW5URjRQaY0c+IpjS/mAqEIV3kqhdITzWgr5SAWg2SUoTvO8BYwjNh8+gzc9FQRyvh8HiyVhX9hVoFjXhtRR2K2CFHcd6TzKa3Zp7dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780048784; c=relaxed/simple;
	bh=Npw6meRVzI8XXIu6E9mJDwAM/yCnOHRzevF4jIdYA98=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X/3uowGUhKmS0sXJiVQxBk9hwyUdBFBISqoslpx838SG9aQplAvw2xxyFElAnfYa45blrMbD9HvImyjo6xUcW0wzp+sCzT0cLyAdZTa7dM5zl54fn6VjN4LnCqN8w9SPMxnMj4B1f7vQFHaSvIIQBGYEEFI4RrPAkyUrkSEkbEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=fY/t++Yd; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1780048774;
 bh=7cmZ6ZbL+80ClxTtf0v5i/q6YUQKok4MUwle1i80mjw=;
 b=fY/t++Yd5qX993GEMnkXrSgWn+LSLxPS5VqbkVFwdIp4KL8I22PuQq+qPXDJMYuHViooTvvlx
 tnJHUSiipCjgXmLegu+09X90zkt8qKzzNsDoqJFDNVfbsCzb1tX7MoVUOpeUbOYCM0RdLNdFC3k
 ezTky5lN37zgzQXo3PaFW03tI6jxjICW+prrXwL7hAO9YnIPN6E6mRAvaWyDoOTt7DhNY4iHcfk
 Z2rsU07SLzyZF7kYzwovjYNw5nXAuAY32BTQgvCoH3QVLQPET/J8Ffxm/903Ho+V5X9dJWew/sL
 etRuBDcCKXBZ2Ok9PM7XI7R3x3gtd2pnlnP2S4G4VYEg==
X-Forward-Email-ID: 6a196383dafd1a4f103a4ea9
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.15
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Sean Young <sean@mess.org>
Cc: Jonas Karlman <jonas@kwiboo.se>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: cec: core: Fix kmemleak due to missed rc_free_device() call
Date: Fri, 29 May 2026 09:59:26 +0000
Message-ID: <20260529095926.2837178-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kwiboo.se,quarantine];
	R_DKIM_ALLOW(-0.20)[kwiboo.se:s=fe-e1b5cab7be];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-63023-lists,linux-media=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonas@kwiboo.se,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kwiboo.se:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,kwiboo.se:email,kwiboo.se:mid,kwiboo.se:dkim]
X-Rspamd-Queue-Id: B1554600607
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The commit dccc0c3ddf8f ("media: rc: fix race between unregister and
urb/irq callbacks") removed the implicit call to rc_free_device() from
rc_unregister_device(). However, the commit missed to remove the NULL
assignment of adap->rc that is now causing rc_free_device() to never be
called on an allocated rc device.

kmemleak reports following after e.g. dw-hdmi unbind:

unreferenced object 0xffff00010ac10000 (size 4096):
  comm "kworker/u16:1", pid 39, jiffies 4294897739
  hex dump (first 32 bytes):
    20 23 4b 0a 01 00 ff ff 08 00 c1 0a 01 00 ff ff   #K.............
    08 00 c1 0a 01 00 ff ff 00 00 00 00 00 00 00 00  ................
  backtrace (crc e11baccc):
    kmemleak_alloc+0x38/0x44
    __kmalloc_cache_noprof+0x4a8/0x5e0
    rc_allocate_device+0x48/0x2a0
    cec_allocate_adapter+0x3ac/0x800
    dw_hdmi_cec_probe+0x264/0x634
    platform_probe+0xc0/0x188
    really_probe+0x4a4/0x8e0
    __driver_probe_device+0x2f8/0x440
    driver_probe_device+0x60/0x160
    __device_attach_driver+0x1a0/0x2a0
    bus_for_each_drv+0x100/0x1a0
    __device_attach+0x174/0x350
    device_initial_probe+0x90/0xb0
    bus_probe_device+0x4c/0x120
    device_add+0xdec/0x116c
    platform_device_add+0x354/0x598

Remove the assignment of adap->rc to NULL to let cec_delete_adapter()
free the allocated rc device after last user of the cec device exits to
fix the kmemleak.

Fixes: dccc0c3ddf8f ("media: rc: fix race between unregister and urb/irq callbacks")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- Remove adap->rc = NULL instead of an explicit call to rc_free_device()
- Update commit message
Link to v1: https://lore.kernel.org/linux-media/20260527222024.1906303-1-jonas@kwiboo.se/
---
 drivers/media/cec/core/cec-core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 0fcd3b5e60c8..90a98f322f5e 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -371,9 +371,7 @@ void cec_unregister_adapter(struct cec_adapter *adap)
 		return;
 
 #ifdef CONFIG_MEDIA_CEC_RC
-	/* Note: rc_unregister also calls rc_free */
 	rc_unregister_device(adap->rc);
-	adap->rc = NULL;
 #endif
 	debugfs_remove_recursive(adap->cec_dir);
 #ifdef CONFIG_CEC_NOTIFIER
-- 
2.54.0


