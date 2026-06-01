Return-Path: <linux-media+bounces-63204-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wE8UBIMkHWq6VwkAu9opvQ
	(envelope-from <linux-media+bounces-63204-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 08:19:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EF861A104
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 08:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D60F302EEE6
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 06:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1786F33E351;
	Mon,  1 Jun 2026 06:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9r1smC8"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B95334374
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 06:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780294750; cv=none; b=RtoC3XInfwGuB1l9dTUBFFhZk/o6UK1g1puIDT624COgJOW7eLjY9H1b2eTYSZTJJfAuBOp9QbibPzsIFA7pPMWvAyq3kk+jlUe2OgJmkvvl9o2cPuI2v7lMCMoK74xrv47H0BuNUDulsOz2nmcUMoQI+Ml1zd0rCqYSSwRDAR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780294750; c=relaxed/simple;
	bh=oHcTUnvcqcLOAHz2qJNyRgXXzrx6u+8K/6YrOn16UZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P2HJDenZRaQ5r2RPyb7DclAkY0+EeuKj5MUzAigNs2ruENFvYdLXZolS6HWwDNinvsskQk9pFWUqD7lps1LHwpr9pfXI64/JYGT9tJyxKoES2SC1zs8KPvoWho05CimSV1hKpbIuI5IS5b5B1rWjUNqdN+2hATQzUbgwnCk2rmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9r1smC8; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-914bf787977so754776585a.2
        for <linux-media@vger.kernel.org>; Sun, 31 May 2026 23:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780294748; x=1780899548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mog99DukFxhQ0S5r2LtJJo8E1/PcR+R6fPQRmzy6lXQ=;
        b=i9r1smC8IDSEL6xxcBv1Zb02XPUlk7eXH1d0wiI16C8hhSC9vvrRog9GGHZgjh5QhY
         mc4n+kVtT2NogNJHma9/DB9516sX4alNzdgvKUN2RQn4yuSp+TtVvL9+RnUzpbGkM/dL
         s9B1d40FGG2YixiUvrDtJw7EXmsgtx0j1kAl9FCcA22wS7FBhsUH2Mi3+1NYsSL6QGZC
         5aPHbUrbMUWsMrvRAzTQno2jP8G9YjkllVYK/Tf7D00ge4F2W0lXciqB+h2Y+K9O8NV5
         OhBraWI3bGsC9vvry11oHlufKq15SmIISTyYxg7Iy/yO94ktRP3Fst9siXjWd8twRxPc
         SKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780294748; x=1780899548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mog99DukFxhQ0S5r2LtJJo8E1/PcR+R6fPQRmzy6lXQ=;
        b=FCDbCYNGQBtaUVYtG2ydQ7ZnIODuLiUgLP81qCUwNnCHHdnyKnD1iIy09oagi/vCVk
         PhL3suuTxVhdXlQ9QAzLtGhU7iltcbWTUYxu7YnYW48HGPNO7Gka3oOzVjr13fnrsOkg
         TY4tOJekg4/BjGPlpzKEr4kmh308qFuzvc2zuXHLedFJvJB22L0UuBWxHSJc/peG5lCT
         UrdurafkeVv0jkiN273rhSXyi+ZM65BYLzjMOz5M9aWB4j/m3EjFxpl7IooYOPwt7W/J
         +Z5stJozYeYobYoYWc5itAVI2mrehB6OdlFdlKmDx4MmQC4sudz8pGJKiCP39BQdsLmV
         Vxqg==
X-Forwarded-Encrypted: i=1; AFNElJ/CEQDk7Mf+8K+koQlNY03AOIma6fLLW15j2zo2i+tgt6119OKfCaM6coTi8qqeOew1dfnxz2Jgtu/cCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyl4jsmN60U22IQrYpwmC3SRbmseMRqlF9IPBXIKNDWTyHqVKd
	pA9H8kzHwYvxcRE8z+kjPLiUzXJo8ke2VSFOOmfH6gLwCAbGptGF6qUJ
X-Gm-Gg: Acq92OEmLNJPhKK6YlXZaWdX87kbTPMdeclOTVIh8gd8i2qF+QbkCqZ2Hi1OA34QFcO
	b81QCFdEay7IQmFKyVCEbJU7V5OPd6sOpCigtthtie7Q1Gc4Eh/KVNZIOolYOJ5Y+v22poVCfsq
	+hroSTovQW4mHlrntsYqy67L3ZG6qeqp8p77qNiwjnlOgZAurcCAaqkiHwIiOkoOJel32LZoIbU
	k0BTtE7KSIneISlMoGC4kImFbF4zv/KZfLWbjlvsLA8WKZA12FqIl6AplOOw0m9xULoqxkHxfy2
	b9GDaDMO7uAK9pq31k40Xt5HC0xT4uKl45MXSnAHzpX9t2CBnrqzNJmNADBZsINdxdkcmiWXwiI
	5S9c3Mz5nfaLRc3N7NY7oh/trjNuREuh/NI8Y/AmRrPGFjfe1mLeognfCKC0FGlpnblIrmPDEE3
	a1DS6I2AV5+GNdYrEdfC9g797d3qgzsghJuwfQwCNrvTiBG1kiaZ7O5SjnY95IKcBHbwIGpklIc
	h9jCP1cVo1ubOsa7Tsw
X-Received: by 2002:a05:620a:2610:b0:8f8:cdd0:df82 with SMTP id af79cd13be357-9153dcb4b99mr1645770485a.58.1780294748269;
        Sun, 31 May 2026 23:19:08 -0700 (PDT)
Received: from Mac.mynetworksettings.com ([2600:4041:42f2:d000:5598:1322:a565:857b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91532448099sm928020885a.7.2026.05.31.23.19.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 31 May 2026 23:19:07 -0700 (PDT)
From: Rohith Matam <rohithmatham@gmail.com>
To: mchehab@kernel.org
Cc: duoming@zju.edu.cn,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rohith Matam <rohithmatham@gmail.com>,
	syzbot+0d6ef2b7ceb6014d756c@syzkaller.appspotmail.com
Subject: [PATCH] media: usb: siano: initialize URB work once
Date: Mon,  1 Jun 2026 02:18:55 -0400
Message-ID: <20260601061855.47423-1-rohithmatham@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[zju.edu.cn,kernel.org,vger.kernel.org,gmail.com,syzkaller.appspotmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63204-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rohithmatham@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,0d6ef2b7ceb6014d756c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A9EF861A104
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

smsusb_onresponse() reinitializes the URB work item immediately before
scheduling it. If teardown races with a queued work item,
cancel_work_sync() can observe workqueue state with WORK_STRUCT_PWQ
still set and trip the workqueue warning reported by syzbot.

Initialize each work item once when the URB is allocated, then schedule
and cancel that initialized work item for the lifetime of the URB. With
the work item always initialized, smsusb_stop_streaming() can cancel it
unconditionally.

Fixes: ebad8e731c1c ("media: usb: siano: Fix use after free bugs caused by do_submit_urb")
Reported-by: syzbot+0d6ef2b7ceb6014d756c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0d6ef2b7ceb6014d756c
Signed-off-by: Rohith Matam <rohithmatham@gmail.com>
---
 drivers/media/usb/siano/smsusb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
index 0fdc2e095..4e80ccc20 100644
--- a/drivers/media/usb/siano/smsusb.c
+++ b/drivers/media/usb/siano/smsusb.c
@@ -143,7 +143,6 @@ static void smsusb_onresponse(struct urb *urb)
 
 
 exit_and_resubmit:
-	INIT_WORK(&surb->wq, do_submit_urb);
 	schedule_work(&surb->wq);
 }
 
@@ -179,8 +178,7 @@ static void smsusb_stop_streaming(struct smsusb_device_t *dev)
 
 	for (i = 0; i < MAX_URBS; i++) {
 		usb_kill_urb(dev->surbs[i].urb);
-		if (dev->surbs[i].wq.func)
-			cancel_work_sync(&dev->surbs[i].wq);
+		cancel_work_sync(&dev->surbs[i].wq);
 
 		if (dev->surbs[i].cb) {
 			smscore_putbuffer(dev->coredev, dev->surbs[i].cb);
@@ -471,6 +469,7 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
 		dev->surbs[i].urb = usb_alloc_urb(0, GFP_KERNEL);
 		if (!dev->surbs[i].urb)
 			goto err_unregister_device;
+		INIT_WORK(&dev->surbs[i].wq, do_submit_urb);
 	}
 
 	pr_debug("smsusb_start_streaming(...).\n");
-- 
2.47.0


