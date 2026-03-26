Return-Path: <linux-media+bounces-57146-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNRxKvI0xWn/8AQAu9opvQ
	(envelope-from <linux-media+bounces-57146-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 14:30:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAD5335F7D
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 14:30:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 083F6316C724
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 13:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27323FCB00;
	Thu, 26 Mar 2026 13:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="J3cH9zZh"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-236.mail.qq.com (out203-205-221-236.mail.qq.com [203.205.221.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA9B2EF67A;
	Thu, 26 Mar 2026 13:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774531162; cv=none; b=W1+ud34FTNeJ3DjxQGsp0/wb/OiYsdbyyoMdKx3vIB1eKz4+kdqGbe5rzCnR4elFrPPAe324xahKdmNE5w0aCtGY1cp7X/SBmiDKPD4aYLNH75tDxlYCA16XKJENawV00QzryEZwJg9G4F+xmsVI227vyBn1AmnxszBjmKRFSb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774531162; c=relaxed/simple;
	bh=ucqVkd2T0ea3xNOeUsiB7pnWKWFmLI1rEDimNt6y0tE=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Kl2dbBHeRDJpGHNmp0GSDLR866OJIN+LEQTwI6dyMv+A0P/TnjcopxTTbsFURetimZL2/fKuiQCVxw93arPnXkH5G4sry56+vozZp1qrm8G/ZNxYnDEiC0kqz6fDYWhEcWBnX3azkXijCwTHuPk42vNyUQX5t2c9NboV8ZyO/AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=J3cH9zZh; arc=none smtp.client-ip=203.205.221.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774531151; bh=JoErUv58Wj+Rm8kK57uBKDOZhC5D/ZpwrkMzzbsi85w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J3cH9zZhWD9/06aVt3RKKnl7BbtgtAvLjASrWdT8BrG+wpUgeUjY+2xwh06i64GFA
	 Gz9UaVRj60C3l0SGmYvNSQkkSfpLMt00g+zvbhonx1wvmLPF/Pxn4TnQ2GGBJeU9Kl
	 kogyRF53YFL737TAScnJZlcEMWjnV57zFRiPbmKY=
Received: from lxu-ped-host.. ([111.198.231.89])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id 47588A37; Thu, 26 Mar 2026 21:17:53 +0800
X-QQ-mid: xmsmtpt1774531073tzymx5kv2
Message-ID: <tencent_F063E97E23B8C4431762377E26CC336AE305@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJ4PgGoLQqCw9Wh/LDKt0oMLdE3phc0mrm7OPjHR8ZoWme2bgRYY
	 AiTbZSiUYkXVG6Yl62unEiBZ8hLzymBwhg8C/1NlQzZcFvXRj4tDXVyny0ibif7v7rIuHuPoaVzR
	 +6ZOVw5BDKBjfa2NtzbdspxWUg3HSoSWkSmSIbgNWrZBPWXYRgP1JK5bzjo2z1bTwAZc+C6XYhgk
	 ICLFg8Q7FA1ey5se+iWewQYXmPi5OOdEA5/YfQ5sUoh4wlhETlsyEQEAw2XSw2OnfkYX3+wTOUW4
	 cstb/1KmeKeGmG66Bvl3PhgrCKal1ecl5d2Ib+pMm51sNyv197lU7vu5Yrqd9GSzFvLnrcwt4VHS
	 q5yRFDiQGZmawdT/YgaM7p/SJzWDaOtHs4gWJYmr2UIu1sfS37S52ZY4yXs+IG/ZzekZQnDbLanX
	 gSLBq3qatIB8oeZdnIBMKZpFeDXPG5IF1h+WFLdY/jrnEys4fQBQqqVe7ptWMSQxUORM6GiHGHQw
	 B68qIwcMfHsaZKlvszrWaQWG3kPnlLnlyBzk7JcH5orie5Pl1x5PSm12ZLbrPu253CFFA3blGc7o
	 JjnqbiUOgjtEr0hwAYRxK0ZyTzGKn+waOla0AtdmrOPP86sRkFa5j7dJ9GEjqjQJIpzFO4FOopQv
	 CcK1mRNe82ERSbaUiiTyqCSCGGxg3VunI8PozuPPDi1i1SYFC4NSzpGJryoa47tJB5WmE6ZD/uY6
	 EolQx1TlQkrxEP8aA35GoiVANZcrp3rbzSfIWAUrOyOAiF2X792m2F3X/T3822ubGiqdz5VjxFOc
	 LeWjM4xr8isR6jtfLrE/CEBDxbl3+r5NjapA2apBxAqDb8iMbHmzw/OlG8D2t9XGfbEyAejKnhqG
	 A0hOkAPNj9AMBKuneGtfzFmFgQT+Z8vdtsi8h4AUqBVDs141bcrZkEZjOMP7mnhOujshMQDdv1mx
	 gte18T6VPMR4jqSKCPUWdtTT8UcvXnX06J6ED90tXwqHYKl9IPVBjLRZleoOn/LzLBaYJlhv1gzx
	 EZVcMcpQ==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+3f395d8da879a58fb019@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] media: usb: as102: fix race condition between ioctl and register
Date: Thu, 26 Mar 2026 21:17:54 +0800
X-OQ-MSGID: <20260326131753.544671-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <69c4c074.a70a0220.23629d.0009.GAE@google.com>
References: <69c4c074.a70a0220.23629d.0009.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[qq.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57146-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[qq.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eadavis@qq.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,3f395d8da879a58fb019];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,syzkaller.appspot.com:url,appspotmail.com:email,qq.com:dkim,qq.com:email,qq.com:mid]
X-Rspamd-Queue-Id: 1CAD5335F7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A user process first connects to the as102 USB device. During the window
of time occurring after the kernel routine for registering the as102
dvb layer device driver has completed its initialization up to the
start_feed stage, but before the sem lock initialization code has been
executed, the user process issues a combined open and ioctl sequence to
invoke the as102_dvb_dmx_start_feed() function. Since the sem lock has
not yet been initialized at this point, the issue reported in [1] is
triggered.

To resolve this, the sem lock initialization procedure has been optimized
by moving it to occur before the start_feed initialization.

[1]
INFO: trying to register non-static key.
Call Trace:
 mutex_lock_interruptible_nested+0x5a/0x1d0 kernel/locking/rtmutex_api.c:566
 as102_dvb_dmx_start_feed+0x70/0x290 drivers/media/usb/as102/as102_drv.c:139
 dmx_section_feed_start_filtering+0x518/0x6c0 drivers/media/dvb-core/dvb_demux.c:977

Reported-by: syzbot+3f395d8da879a58fb019@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3f395d8da879a58fb019
Tested-by: syzbot+3f395d8da879a58fb019@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 drivers/media/usb/as102/as102_drv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/as102/as102_drv.c b/drivers/media/usb/as102/as102_drv.c
index 6b1d3528a0a7..e94828871635 100644
--- a/drivers/media/usb/as102/as102_drv.c
+++ b/drivers/media/usb/as102/as102_drv.c
@@ -299,6 +299,8 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
 	as102_dev->dvb_dmx.priv = as102_dev;
 	as102_dev->dvb_dmx.filternum = pid_filtering ? 16 : 256;
 	as102_dev->dvb_dmx.feednum = 256;
+	/* init start / stop stream mutex */
+	mutex_init(&as102_dev->sem);
 	as102_dev->dvb_dmx.start_feed = as102_dvb_dmx_start_feed;
 	as102_dev->dvb_dmx.stop_feed = as102_dvb_dmx_stop_feed;
 
@@ -344,9 +346,6 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
 	/* init bus mutex for token locking */
 	mutex_init(&as102_dev->bus_adap.lock);
 
-	/* init start / stop stream mutex */
-	mutex_init(&as102_dev->sem);
-
 	/*
 	 * try to load as102 firmware. If firmware upload failed, we'll be
 	 * able to upload it later.
-- 
2.43.0


