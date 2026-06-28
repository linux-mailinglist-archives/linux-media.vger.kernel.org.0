Return-Path: <linux-media+bounces-65819-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZX2IEB3xQGrAjgkAu9opvQ
	(envelope-from <linux-media+bounces-65819-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 12:02:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF65A6D38E3
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 12:02:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=oS+ukM0S;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65819-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65819-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDF943013A9B
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 10:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90BE823EAAD;
	Sun, 28 Jun 2026 10:01:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EA01F03DE
	for <linux-media@vger.kernel.org>; Sun, 28 Jun 2026 10:01:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782640914; cv=none; b=STSvog5t6VVu4akp5sRrY4ANVw6fAekb9UK/1bVv8QIIFEqsu7JmmcWUVioQjXE8OGY1wKqsZvG4UO8mJTBjydn1LDre4s3T7lp1jn+unnsPoeITFGczC1kGM32EVz6w7cJ1nO672O8JIGGNYorTOEkesI+WyrKAGPj/GnAHQfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782640914; c=relaxed/simple;
	bh=2t5a9qB6hNVDxj5S5IvP3ktU8+lgMMAZlQSPGY+2cYo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zb1tfKBII5mkEj1PmCn5v3T20O1VYvcw4v2af3U4GhU4z5ZkSTQN5cL6Rbxxv9K/QN40CKhh/zdgpKdvD6SzE2ZqnLE5IkIAqsKTP20EAwgG4oh5mH1F7zgqx5wuvgxJ/wgchxH9PL5KPCLEBKXdUwZiRsjZ2y1NKdQ/BNSRY0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oS+ukM0S; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-472a14c9965so340586f8f.1
        for <linux-media@vger.kernel.org>; Sun, 28 Jun 2026 03:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782640911; x=1783245711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/GcbpUykRobBfdlA1r4jXGTM9YzHADH53GFKveeipoE=;
        b=oS+ukM0S6XxhNWJ01URy4Y6Tr1K/gSix2ZsqKk6v37kajwpS6v+S3jLaA4DWYhEIaf
         WXVL5P8CUEekhySWm2UG9gUm8XVMVfPfU1a5Xz5cJTrtpuro4Rj1V1ePG4Q0uC+ouMu3
         Vt5DuuydsyycBSvX3fkYlCUg0VaLoKG17JgK5uPsZwtB4+bhhDDJ36n6TR9CvyGjBHC9
         wTR0HeqbjEDiz4IOV9zPUkJTM/qEP//j+ElDIwvX9+JjROgR9BIpVEqMrV2bh7EDQuX4
         c5tycSeRgRqqKV2JmGX81ELctYENtJPLzY1qeqncjT0cYV9MW4elDYVcjt+ocETS5DYm
         eoeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782640911; x=1783245711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/GcbpUykRobBfdlA1r4jXGTM9YzHADH53GFKveeipoE=;
        b=VqtIUPbRC0PZFXrWp9u6eVhjSdewgOMdv/WEocsTqN6qBYy5PLUSeuMcedj9gK3eTC
         3hIL7wjPkQAKIMou896rvK324G+8i3PeUVnvmc4qCH8CMZjrb7BOZzXalYbooQA+Z2pA
         4CSpAVMv/vjQUNiLytqCNvy1+KwtaZiZPhnmTrFo3bKubu6kSS0vGe1iZD9a1c0VPhHT
         pG1ied/TaFFB3qES1OhmDe9E8PSH8Buok/8GZ94pJzosqm8DRnwmTIenxr0U+yrdPyyz
         G3loLmBdp05lZPI9nbLTuE8kwtEn1sKanrQyFWtyOkiibA4T6a5FF1LB9V+op/AlVai+
         e3SQ==
X-Gm-Message-State: AOJu0YyYhwoCUwUre1sgeQkgmAx+5wN/yLHKezv4a0fBZp+cZkkk0NEH
	s8DvIh3kLmOGFpZvyb42L0NzYa7jtoI80NObJydgerbtbkn7eKs1ZrLp
X-Gm-Gg: AfdE7clx9vaLRlGvSfpCPPucyS0gS1PIEsFYBE7j4EUkHywV8tdWvmSw7brTEUWh967
	85o5mcm0+7egcE8MKMv4mygAqtUIVH4O8mY4ny2hg27SQ3MggBy3gMqRPYU3A+jA06m+u7Ud20A
	kZJEbWEVuDRfsllDCAcxk2axPVe4qb1hS3l5653RcLaGBy7xO+LiQIfnFVvgG8O2IHFLRLPcfRg
	cO1mMrd2hkhJKTLqBnQ6MT2vSP9Ojt7qRVhzKFxDBpeMeQQjLqOq6PxTyW8fp8FqQO+o9v2J0aO
	YyTn+sSo5M//xoxeycl+pjWVsTy7VdNPFuWtlHm4KtriiPdeyWVWNP+uxQNnqMdVB4EVK4QPyZw
	Y1e9yo7/UI0g44Z+/t4f6R3ZiGbN85YpQ3O0V1Zw4/YFckGxBvon/8OGDhkAIZ3oMHpk9+FoXHy
	dMIhKXvKsk+NfRo+/MqNs+EDfvdQ==
X-Received: by 2002:a05:600c:3581:b0:492:66fb:5dc5 with SMTP id 5b1f17b1804b1-49266fb5f1bmr205698715e9.24.1782640911113;
        Sun, 28 Jun 2026 03:01:51 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-472bca3caccsm5286932f8f.33.2026.06.28.03.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 03:01:49 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+d37184d9d8cc34602616@syzkaller.appspotmail.com,
	syzbot+d445a71e1c011b592c16@syzkaller.appspotmail.com,
	syzbot+2e428058cafb408fb695@syzkaller.appspotmail.com,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] media: dvb-core: publish device minors after registration succeeds
Date: Sun, 28 Jun 2026 12:00:58 +0200
Message-ID: <20260628100058.48760-1-alhouseenyousef@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,syzkaller.appspotmail.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65819-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:syzbot+d37184d9d8cc34602616@syzkaller.appspotmail.com,m:syzbot+d445a71e1c011b592c16@syzkaller.appspotmail.com,m:syzbot+2e428058cafb408fb695@syzkaller.appspotmail.com,m:alhouseenyousef@gmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alhouseenyousef@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,d37184d9d8cc34602616,d445a71e1c011b592c16,2e428058cafb408fb695];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,appspotmail.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CF65A6D38E3

dvb_register_device() publishes dvbdev in the minor table before media
graph and class-device creation, both of which can still fail. Their error
paths then free dvbdev directly without removing the table entry or
dropping its minor reference. Opening a manually created device node can
race with or follow that failure, causing refcount corruption and
use-after-free; without an open, the minor reference is leaked.

Keep the chosen minor private until all fallible registration steps have
succeeded. On failure, release the initial reference through
dvb_device_put() rather than bypassing the kref.

Fixes: 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
Reported-by: syzbot+d37184d9d8cc34602616@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d37184d9d8cc34602616
Reported-by: syzbot+d445a71e1c011b592c16@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d445a71e1c011b592c16
Reported-by: syzbot+2e428058cafb408fb695@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2e428058cafb408fb695
Cc: stable@vger.kernel.org
Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/media/dvb-core/dvbdev.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index d753d329502a..ca4d61a94270 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -545,7 +545,6 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	}
 
 	dvbdev->minor = minor;
-	dvb_minors[minor] = dvb_device_get(dvbdev);
 	up_write(&minor_rwsem);
 	ret = dvb_register_media_device(dvbdev, type, minor, demux_sink_pads);
 	if (ret) {
@@ -558,7 +557,7 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 		}
 		dvb_media_device_free(dvbdev);
 		list_del(&dvbdev->list_head);
-		kfree(dvbdev);
+		dvb_device_put(dvbdev);
 		*pdvbdev = NULL;
 		mutex_unlock(&dvbdev_register_lock);
 		return ret;
@@ -577,12 +576,16 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 		}
 		dvb_media_device_free(dvbdev);
 		list_del(&dvbdev->list_head);
-		kfree(dvbdev);
+		dvb_device_put(dvbdev);
 		*pdvbdev = NULL;
 		mutex_unlock(&dvbdev_register_lock);
 		return PTR_ERR(clsdev);
 	}
 
+	down_write(&minor_rwsem);
+	dvb_minors[minor] = dvb_device_get(dvbdev);
+	up_write(&minor_rwsem);
+
 	dprintk("DVB: register adapter%d/%s%d @ minor: %i (0x%02x)\n",
 		adap->num, dnames[type], id, minor, minor);
 
-- 
2.54.0


