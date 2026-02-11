Return-Path: <linux-media+bounces-52551-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCplHGv+i2kgegAAu9opvQ
	(envelope-from <linux-media+bounces-52551-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 04:58:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD721121191
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 04:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E77A9304C102
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 03:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687743502A7;
	Wed, 11 Feb 2026 03:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nb98x079"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7B631B124
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 03:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770782309; cv=none; b=b9rzh5mFIWpSyry+3XsV3Vsv3mKeg6mqEGifp3TDL6hwVhQibHBbaG9N7JcRPsBeI+WYjhJwNdZGRWj8HhC+6fWhDdSv//mOi/+i77b+vbva4KnbAFIiyH56DhhmusF20IMVHgsnLeqBFHHaOLrVNr1izK52cLzCYEw4NIYEIbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770782309; c=relaxed/simple;
	bh=8jyBmLQSnFdLbwjtzPh+A/Bbgq9ipmJNb0Ii6uPQcsA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nlvt+Ik78Oq5J0bKRCta+2LD6G5js/WmEJKUqD2yc32DD3h/Stvop4/85+1pdMJMz1ixLObGXWU240znCevwQN0g60S4hX2rvJuL1h4Di17qDg/bLCMa9Tofe3urKPOSKg9Bvb/2whSONLRxmjk5A07NmINFW3VjX89hVLbEQlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nb98x079; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82318b640beso866922b3a.0
        for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 19:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770782308; x=1771387108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wsleWUbG4NlaM7eQEfBnOK2CnkDnwhNTH+eHgEOHCJQ=;
        b=Nb98x079HqBj98D7isuyY+1BrczaYg8HZUNdT4vI8phCgcX6FEAZKzpNeJBHKF9fMO
         iT9yOnn8FkWJErYuVsEmopCYsokgsjs2GNu7MJFII+1KipTdS7ihHv2Qz+v93bE5+XAs
         DhPYXj6Xb+24rFysmgycsoJaF0o80E6lwTi470Ysadi9mKQA46+JB/0J16P5KbQYV5HA
         IL4+eytZK6E087IKD96TyTUTMICyKtEPYBtb2HDiJ/kaKoqeYdl/hVETBkp/AFAYv/YT
         8Bi4YFirKJtAgN4NCDimIYjB1orHkJXu2nbCLh20NSsYgHmcFNtvrb0aA+2aE4gmK54l
         clGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770782308; x=1771387108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsleWUbG4NlaM7eQEfBnOK2CnkDnwhNTH+eHgEOHCJQ=;
        b=qFLIfoszwGXe2tBMQ7+0mEvKD0YttBjgtyW8WLw/X6AdlrBYMCOP3ne0GceVf8x6Po
         TU93/qiNn/Lt4bYRzXc2h15dlMaWWobUNAwG7kiOhlMcusCYx9t8RQSPYpg+i1HIdV3P
         kYo+4dGqnr3E6kn9J8b01V/PxoxClXskPSczNenKFZ1Ur7lwMSOuUeAK1VxfooDw7k8H
         oqbTef93PKcSM/KWmzcbd+PX4taVUDbybt0ThcKM9p/0yfe75f/RrTCz04vJLh7PUs24
         H/yllkoawm/lzsp9RHLa6Wprm7woj2nYT5HJAxzv4JdcI/46blqmcnBVtwBbtOlSvgtX
         1YdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2Oy8rK/SqcZnAN2h3h9unSH7rnEOX+8Q7nlD15nIh8kNW8EENRYIcySxgkvzW6fLShfUvVTOXf3Jwdw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb8kcUnl003Sr64RkztiOOr8f4LqvfyKErCnCVQQXPSuNReDlx
	yXcVPtN/aNl5smv4RdgghHOqs7fGH663l2YDxl1+z0QJPt8i+sipZWjT
X-Gm-Gg: AZuq6aJ19oznLUhduMcwq3PZoceqvl5LuMKXMvs/2x9cOvjFF7zkGoS8WRk8ul+5I3H
	INfzgcjS6U0med7pZczwj2xnm82QVtcLs2PydJEh4daDP+z09ikaab8ui+MEbr253RrZz2yPKLx
	2pMCtLjNBT/rJFurzPEqavjkTJc9tVVgcI8rgtK2xIRpxb5P8cLgPhw95mNvlr9ucH1G/ytE9KO
	9K6zUBoqYwY3SZI+P3BHlEnaZeTOpUaW71qfvzZ1jdAjxbyRQQ4WPk2GdI/tYbithuJ6L0o0Smj
	t+ZF4wxj1rP+o/Vgyb1PDDpveI321+ObNkxdX7laSU2meSPEozStVyZZl2q6+IrQL3a8wJTdYmD
	Rr/unOo4fncnlmz9kJnm5bM1Q8xUULfZvaAjm5WZoSgBXokwE5yVr8EB1QuouxSuslzEfkzuv7e
	wWuBLbKv8jjQLHLpeCgGEHRVJ6iuXe2fLrTpVJuWdRIZWe/a7esC4nv0u85uh1EUoKzioNimbXz
	BQRqRg=
X-Received: by 2002:a05:6a00:300b:b0:821:8496:da9 with SMTP id d2e1a72fcca58-824417715e0mr14778948b3a.60.1770782308175;
        Tue, 10 Feb 2026 19:58:28 -0800 (PST)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:389d:c893:d87d:d1f4:a9a9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e3c39e0sm555591b3a.26.2026.02.10.19.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 19:58:27 -0800 (PST)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: mchehab@kernel.org
Cc: tglx@kernel.org,
	mingo@kernel.org,
	hverkuil+cisco@kernel.org,
	rongqianfeng@vivo.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+bd7c90de4c9f1f8ab660@syzkaller.appspotmail.com
Subject: [PATCH] media: dvb-core: fix uninit-value in dvb_dmxdev_read_sec
Date: Wed, 11 Feb 2026 09:28:20 +0530
Message-ID: <20260211035820.54489-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vivo.com,vger.kernel.org,gmail.com,syzkaller.appspotmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-52551-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kartikey406@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,cisco,bd7c90de4c9f1f8ab660];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: CD721121191
X-Rspamd-Action: no action

dvb_dmxdev_init() allocates the filter array using vmalloc_array(),
which does not zero-initialize memory. The subsequent init loop only
sets a few fields (dev, buffer.data, state), leaving other fields like
todo, type, and secheader uninitialized. When dvb_demux_read() is
called before the filter is fully configured, it reads these
uninitialized fields, triggering a KMSAN uninit-value warning.

Use vcalloc() instead to zero-initialize the entire allocation.

Reported-by: syzbot+bd7c90de4c9f1f8ab660@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=bd7c90de4c9f1f8ab660
Tested-by: syzbot+bd7c90de4c9f1f8ab660@syzkaller.appspotmail.com
Fixes: e4b21577b463 ("media: dvb-core: use vmalloc_array to simplify code")
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/media/dvb-core/dmxdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 8c6f5aafda1d..94010c4e4f89 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -1414,7 +1414,7 @@ int dvb_dmxdev_init(struct dmxdev *dmxdev, struct dvb_adapter *dvb_adapter)
 	if (dmxdev->demux->open(dmxdev->demux) < 0)
 		return -EUSERS;
 
-	dmxdev->filter = vmalloc_array(dmxdev->filternum,
+	dmxdev->filter = vcalloc(dmxdev->filternum,
 				       sizeof(struct dmxdev_filter));
 	if (!dmxdev->filter)
 		return -ENOMEM;
-- 
2.43.0


