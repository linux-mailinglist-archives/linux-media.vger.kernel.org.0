Return-Path: <linux-media+bounces-65818-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0mZzNlbtQGoxjgkAu9opvQ
	(envelope-from <linux-media+bounces-65818-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 11:45:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6076D384F
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 11:45:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LJ3oglRM;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65818-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65818-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC5873003832
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 09:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725FE34E74B;
	Sun, 28 Jun 2026 09:45:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946962F12A5
	for <linux-media@vger.kernel.org>; Sun, 28 Jun 2026 09:45:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782639947; cv=none; b=TOnd3R6Z5xnzBdUK8t7ZoYT10MWB+/KdwA0K33kZyhHjxcTuagY/APiMEKvQUAKhMyDA8lU2G5Y6BRQF5YZnlgF7FKkMJqFYj0VxBOac4k4z0ze+rEutf62C5O/mMFFs44U0HnVaesqZBfixErHBWfkkh8L2ezWGRoGZBe7JO64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782639947; c=relaxed/simple;
	bh=O2B0uMKqHoOD4mY58Xsxi7bJvPfPy0Z+UX2l8MD+dOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GT8mHbg2dqOVtlDSTTQhZ5L1Y4UR6YudFJwQDW7U/Ilk5odlzOgGILWEg9hg0IGWSWP5yrKAS5oN6mpU7HGbn5kJfNcLyFPca6Ay4OGZryZl1TOWMopsT0lDJVH5ZqSf4Xte9XGFG5oD3OEbeN/LIsvKmJVErXiyEYtcSRVqh9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJ3oglRM; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49395888c7bso12353665e9.0
        for <linux-media@vger.kernel.org>; Sun, 28 Jun 2026 02:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782639945; x=1783244745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yUuAzQn+5JDiJk1q5e76fbese7WA+ir/L5EhW8ClE0Q=;
        b=LJ3oglRMuFWgnV6Nwf2hwROxVcBHOSvgnPHvqtGsyyTLyOcISTItSuqW48CXqMLJ8q
         IHpjX8TkcRQIcpOsRaKRDlaLhuW9gWKVg+lsHQtmEr33hUKxw1w/+CNTVe3uIO3uF5hk
         15FbbXMIkfvwI9sCsPLm1wUz88hbL48Vu3IEeqv7G3ijeAFKOMaFbQDGb2jNbbDXIbn8
         xCorzJAOzfQW3psZt020v6Vuhb2kJzA+/VdiNijRt1OiVEN4EYPxFGMIPiylKzGt/Jkb
         m0J0vi8nRxiSKah0Qg5wUIG5N1TXiS4+RYNb+M4dPI4Po7JO4FGIWzhyY+KP9r1t7I95
         XXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782639945; x=1783244745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUuAzQn+5JDiJk1q5e76fbese7WA+ir/L5EhW8ClE0Q=;
        b=dhjjjTzbQIdvuT+Rz7PFDw+wUGN+KWS29fuvv1jQoG4VYfD7y8/fAmmsoN8A8BookC
         Dy9LEicLxR4LEMhFz0cNZqjrBUhwEEIyGCBw+kYtOgaucxVWoorSM1m24csTiBGzUZBf
         /+7GUHHs0Coc2c4ttebv61VXJwJiZIVqZc8VouRx/OSgEj3q9ThTH6VaSRH4JeTm3g1n
         qbLqKdIjiBcapK5OYrZZcVZ90iTAEUXiyIGOuhU75r1W28RqqINeMLvlACpSPoWsRjHb
         ff7Ses8Sd7yBRh18/ZA1UEiQGe9BNOc7ZtwMplsUjI9vo/CcCEOYOVC95cctOTc9qGD6
         k5Dw==
X-Gm-Message-State: AOJu0Yxlfs+694hQP6wXXLWJA7BcE7j/0cwHraNG74afffq5HklE8CNd
	nUWRIlTeZl/t14ycudigmPZ6cbLLN07vczqyUyWOrDEmEyz5XT1OE40l9BVTpt1x3Tn3dA==
X-Gm-Gg: AfdE7cmAMjt+Df1f14L1lU2wCJe2fEGPwERMWjndtQaa2Jdtu8GZ7zYQa/aFXNurDIQ
	MPU9WyFFPC52X1ah8w5wQMbtCNfFZquK5h0uerrPX7M4/G6mKetYFkQMJH/eUgbnJ3tXBP75GFL
	HmxRwBYT4tzjhtT5VCSKTa4oxD4JeHzD5HjARLmcp1JZrnIH8qnlY7FAjgnI6E86FKLVPv9yRq+
	EsdBu8gcQ2+bmpCDOCTvhEGpcYlrRn6XT6WdVhBBzax0Q4RkFAwPuhbZtr/NXJ7hSuOnqR9RLD0
	NW2otqXjQYylicx4J699CQMc3xehSPX4LpuQVl+R1tsKVhh19KDeQsB+h6JgBbuSZ61aecQs6KZ
	VzhR4F/8TJJhn0eRi2IAtfagWKF6PH7hCO1Ue1Nv0fcaoX4jGZFW59wNync193KyXwvlvffSxe/
	W3CbRjOkpmcoFfMbWHOhJR0IMWeCEYscY4OSZj
X-Received: by 2002:a05:6000:2483:b0:472:79bc:3919 with SMTP id ffacd0b85a97d-47279bc3aa5mr3463612f8f.39.1782639944961;
        Sun, 28 Jun 2026 02:45:44 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-472c7bec9c2sm5129507f8f.12.2026.06.28.02.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 02:45:44 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+01d4620886bee3db0e74@syzkaller.appspotmail.com,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] media: dvb-core: initialize TS feed cleanup fields
Date: Sun, 28 Jun 2026 11:44:53 +0200
Message-ID: <20260628094453.45766-1-alhouseenyousef@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65818-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,syzkaller.appspotmail.com,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:syzbot+01d4620886bee3db0e74@syzkaller.appspotmail.com,m:alhouseenyousef@gmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,01d4620886bee3db0e74];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,appspotmail.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE6076D384F

dmx_ts_feed_set() validates the requested PID and decoder type before it
assigns feed->ts_type and feed->pes_type. If validation fails, dmxdev
releases the newly allocated feed, and dvbdmx_release_ts_feed() reads both
uninitialized fields. A random TS_DECODER bit can also make cleanup use an
uninitialized PES type as an array index.

Initialize new feeds as non-decoder, DMX_PES_OTHER feeds so release is
safe before the set operation succeeds.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+01d4620886bee3db0e74@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=01d4620886bee3db0e74
Cc: stable@vger.kernel.org
Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/media/dvb-core/dvb_demux.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/dvb-core/dvb_demux.c b/drivers/media/dvb-core/dvb_demux.c
index 290fc7961647..ed77e0bfb8e2 100644
--- a/drivers/media/dvb-core/dvb_demux.c
+++ b/drivers/media/dvb-core/dvb_demux.c
@@ -810,6 +810,8 @@ static int dvbdmx_allocate_ts_feed(struct dmx_demux *dmx,
 	feed->pid = 0xffff;
 	feed->peslen = 0xfffa;
 	feed->buffer_flags = 0;
+	feed->ts_type = 0;
+	feed->pes_type = DMX_PES_OTHER;
 
 	(*ts_feed) = &feed->feed.ts;
 	(*ts_feed)->parent = dmx;
-- 
2.54.0


