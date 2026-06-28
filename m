Return-Path: <linux-media+bounces-65816-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FkUbNijnQGpGjAkAu9opvQ
	(envelope-from <linux-media+bounces-65816-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 11:19:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AB16D3762
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 11:19:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="S/sfpgFt";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65816-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65816-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81EFB300FB72
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 09:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C1F22A80D;
	Sun, 28 Jun 2026 09:19:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8851A5B8A
	for <linux-media@vger.kernel.org>; Sun, 28 Jun 2026 09:19:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782638373; cv=none; b=ZTAsJqs3Vsh95SVLNh6tb1XxMuLtNjYpSqxabPHIYSlqAVtiUDyhx0r9yoPocBj8zN5e5YwGYUBZsfJ+A7RGwDV23W2VafUk5SD0LVc0HnU9df3sGPiNbcXb3sdhm6qID9E2ZGXQw+sjKSrhUZ6xEqbAZ9gYFNtfZhhNfyzVoNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782638373; c=relaxed/simple;
	bh=+TMcaHn5YQykUzQzJACoD9w3PjSFRZHmSBneHv5oR0o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pGhfk2YDCy0S77+4H3Cyuhue+JA5TbNhCbSlleuZ4umSrm3WVcJ1qLVG1qonu582SCTCDgdS6sfA7n5c/YuCorRCaTtqyzXeR88Vgzm+kdmLINJDoU74OYxkEnEbsjaSe9ceAt+NMMZ0v9yhyosWSzTC4Z/f44pOMokGb1iloKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/sfpgFt; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4924593f45dso30283535e9.1
        for <linux-media@vger.kernel.org>; Sun, 28 Jun 2026 02:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782638369; x=1783243169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AMFPxxbKwC83QNnr+scrjS2pM+xu1i6gm24bZDXkabo=;
        b=S/sfpgFtfzoyqQAOh3BYPNNmOys4f1KeDYChh3amm9XmUBoLv7li7uOQyq3tXfGQn8
         HoLBKdMXbUrjxzixHNxRPGi7FlAz+4vYWPeB+BqtXCL/ANG4qYGKX4AiJvejPwuczhSx
         fZB4HM3xOrOPvE+WWnzWbVLCqLfr/kwBl0brQixDxbTuzOUPTEpHSswCzXn2dmDWRZ/2
         wv/Fhz+n5LGmU2RWUF+zQe5dak9WbYjA79HUjjn8UHQFMbp3Tpk3bjiD5R7ftIGIsJCn
         pgF97h8Z1VgycAYkh4oW6xHMiN815WbetsFN/q2UqiemI1RC2k6SpuB4BHK9DAitGbso
         HesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782638369; x=1783243169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMFPxxbKwC83QNnr+scrjS2pM+xu1i6gm24bZDXkabo=;
        b=q41sEH+AAyYFt/TP/rRh8ne+DnRi+D0jMvT7n6m1asN66fTpeyIXilzuhAqMc6ikgd
         y/rR9ZiLTV5iLrVpcxlsFseMG1MuJPpR1LGW9TFK2xo2oZZJenHS1uXGZWZEjFe7oskA
         H+OMfZkiqKDPnhbYGkT0Dsy3Wwi5cpFz7c2ilI04/XPGTLf2Kx0zcqGKg3zvdCvy/Tsy
         SXEXqN7PhWYBCycLKzLy1FgncIX6b+da2/O1V41aiTuPZacCaoI5wOVZJlYM/3xTTBMu
         LaQPK/MPv2KLkr/8LZpjgFn2NRxkaoSqa2/vGP/kX7G/YkSDOmrpbPKVTGa0YXqoaGVi
         ypkw==
X-Gm-Message-State: AOJu0Yzm3+i7pSLVXQdw4/npDgsxHznYPCf/gp7hmw164oyZQWKs/yhQ
	JosQKH0a5Nug26gAlw1FbcDhkVDvn9LBubwsH39AGuJWYgMl+uW+wzdZ
X-Gm-Gg: AfdE7ckjT+785UQR3kYEi4zyNp3rPEi1a8YeZv72q+zH5X+brKLd4OCtrqMPqCY5lle
	l5slap84l69XQvtO5f2+y6JnszWbt6dJrstUkAppX/RDoB8swQrNfK//Mtv52kZW7b6N/qB3ePy
	a4VS2ORPznp3g0K5yAG/cKixZdPxIErYPl/LueBxQwJr0yRpMPBg4P24ip2sxvim2Mi+PbY/lmv
	++eiC4CYFoVKQRzcpRK766coJPpGMFHyad2yCMPiISvx5wDrOw8hTN0rrK8ZTB02n4WcQgWAwef
	dVLhc+jcgwM6WNmdfWPVZK4iLDqbGy5qRP85vlx3Rhi3INPokA8m4ydSkT7AOMtMEDC24F4VUMt
	3eLh2++g9ywgmfIFIAnzecDmFHWRSYmeFPNWVHjr5/KT6uH3wGwOmSGNNgvgYIxbVsq5/S8mY1w
	2eFgSuxx/Qxi2WiRXUZuUlqpBbpw==
X-Received: by 2002:a05:600c:1d1e:b0:492:2f3c:d0ed with SMTP id 5b1f17b1804b1-4926688a528mr186302095e9.30.1782638368707;
        Sun, 28 Jun 2026 02:19:28 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c28673dsm187757565e9.2.2026.06.28.02.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 02:19:27 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+40339ea82afa8184ad5d@syzkaller.appspotmail.com,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] media: dvb-core: avoid dropping device ref on frontend open failure
Date: Sun, 28 Jun 2026 11:18:44 +0200
Message-ID: <20260628091844.37577-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65816-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,syzkaller.appspotmail.com,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:syzbot+40339ea82afa8184ad5d@syzkaller.appspotmail.com,m:alhouseenyousef@gmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alhouseenyousef@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,40339ea82afa8184ad5d];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 37AB16D3762

dvb_device_open() takes a device reference before calling the frontend
open callback and drops that reference itself if the callback fails.
However, the frontend error path calls dvb_generic_release(), which drops
the same reference while merely trying to undo the user counters changed
by dvb_generic_open(). A concurrent device unregister can leave this as
the final reference, so the subsequent dvbdev->users access is a
use-after-free. The outer open path then also performs a second put.

Restore the writer and user counters directly. The reference remains
owned by dvb_device_open(), which will release it after the callback
returns the error.

Fixes: 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
Reported-by: syzbot+40339ea82afa8184ad5d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=40339ea82afa8184ad5d
Cc: stable@vger.kernel.org
Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/media/dvb-core/dvb_frontend.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index d082b6c57c76..7aebaef18191 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -2887,7 +2887,8 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 	mutex_unlock(&fe->dvb->mdev_lock);
 err2:
 #endif
-	dvb_generic_release(inode, file);
+	dvbdev->writers++;
+	dvbdev->users++;
 err1:
 	if (dvbdev->users == -1 && fe->ops.ts_bus_ctrl)
 		fe->ops.ts_bus_ctrl(fe, 0);
-- 
2.54.0


