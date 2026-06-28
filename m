Return-Path: <linux-media+bounces-65817-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id meC7A+jsQGoajgkAu9opvQ
	(envelope-from <linux-media+bounces-65817-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 11:44:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5068E6D383D
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 11:44:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="SlOB/FPY";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65817-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65817-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A3DC301A3AC
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 09:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383B5342C9E;
	Sun, 28 Jun 2026 09:42:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5818717A30A
	for <linux-media@vger.kernel.org>; Sun, 28 Jun 2026 09:42:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782639776; cv=none; b=S/w5m3k2jvp8GwI6UdF28P2EGEj66KuKCURNftznYK6I+dLtfXk8Z3HHM9BcDgHLCnzZ0AwWRQxOdTN+gWrp2cYspeXHFYkvnYM1RiiC6xNsk804/+dXHS2O7SrvZ7k8IvYHaEn32BzZHzNPx59k3MiDa5qjz0YZjFZ3s2VTJkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782639776; c=relaxed/simple;
	bh=mhmLXscI6NQQEl70eju7+aXlhtGYE6nMOBb0I5fNLNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p9FQS/XWn5t+MV0/3omu8DAF4AwviQ5QsMYctBR8NVfBhqGVUnC75UGjnOhgDJwwKw5FDLfdxi1sorUHgVa4h+g5RAmkg/3iIljQqpz/qTsiIsOExezZH8U+bc7qyJfgBVmPd29ZaoAZCpYLQ284F6hMFo8shDTCBh7tn3fMlE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlOB/FPY; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso11783195e9.1
        for <linux-media@vger.kernel.org>; Sun, 28 Jun 2026 02:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782639774; x=1783244574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UqVt+RIteYYvNTCyf7JhD0K57WM4+XbG2izcVTYOpIA=;
        b=SlOB/FPYrV9b2whuUJSJc+ra4YuukppavegQRSdIaCA667GrgMn7BRmrnmcbbxCU1S
         Mwy0bWmhoQkB4t9Z9ZS5WNIdZxG2/sjMurfrk/tuMSeCF/NdfZdR7bVZ3FVckoGfwNAD
         SFWK1QfMVcf53nTThG2QH986ZlcXUnSSLRv3s8mbNxueI1/Boh/+qJOR+/x5CNCkrUpb
         u1uxm8P1Rq49ruEG1L9ZN2MsjVFFy21gHx2MV62B/vk/kAnycB5uRABnL/h+gCTr6VOP
         Mr3V/bfq5MPSwYwnbgYVEN1+AibVaFjRirO9Xs+NqjiFScSBO84kenigy4yykRWhs6RV
         99wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782639774; x=1783244574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqVt+RIteYYvNTCyf7JhD0K57WM4+XbG2izcVTYOpIA=;
        b=Unh8Dpc4vBNCwHvDhxO0HRmOVHE5FBf63n4iNEpFyAcK4//iX+hVH1SKI6iHYHPqe9
         fgdeERXBHOj7OtkABXM1aTM7Hl4a8+RA3Cs2CzDIDRt9mwwYaZ44bYHHTECtl+F1MUtT
         MhBF2wA5JobFcYgwGru7rLn+GsXhFkf6fABSX4fIRg/Hfja1V6+F+mP6h8rhK8NHkuBD
         8YC14zsCfRY+tIqk9o4uYj8Dh0intavADt4bZ82s8k9E8OhQuCPCt11IaKMc3y0a7RQy
         MMXAPsEZ9T0TPixarvPBys0JWCjwRV1wtvZiLTjpovtE7ZMbHbKR5FhFX0JpX7BYSQaa
         jzag==
X-Gm-Message-State: AOJu0YwqVdNkK4nLwe8mtX7OCVvi6mtNAOIAgqTO53PSMNQf4+jD7v/Y
	8Ijmqamvuzz7/6u1j5OsLMzLB/PMqOPquCuQOVKL0zPWf6CCGJeM9uPr
X-Gm-Gg: AfdE7ckJsTW59TmN4HCm5eWXsdXdeBO18hYSgGiXxbW1v3S/4j//4w3yiXjIzoT89zO
	aSppY+Nx4c+I+Mb81DUPooop3PmuYu8XOGfNeY7h/awHtWUh4fxh1/LU+2PlTY2w4Z0lZgIUBoP
	JenXFCaQotzSsrJ7+o8+oA6smw89pXec/ltrR170HgnIfiVcWDYvEwRohs/k9Hu13Q20AlAarcZ
	iFVWphAYxwTtzT4gxgU1NMzfRGB7GXFlhIYdYQc7eKVDQ8HWEOreiihd0Qaf0IdUPuxpR8HB7eO
	Gy2WdeoXya5gfK8fYVf3vGj+czwrDqvaaw7mXvNHStxoTq6RSP3BnU361TgAciq4r3w9Rfq3Bl4
	8lvjKYm7s0T1KCAOJAixFXAD9mTWzLBLkug1pmqLaIKBaAeZxGl0+IZCr1+F8qdRlP28JmI6/Zn
	HMFQXyDZNa4hziN3Q7SwuoORcrKQ==
X-Received: by 2002:a05:600c:4f83:b0:492:d8be:2c0f with SMTP id 5b1f17b1804b1-49398cd4600mr62591975e9.36.1782639773581;
        Sun, 28 Jun 2026 02:42:53 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926c28c51asm121739045e9.2.2026.06.28.02.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 02:42:52 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+ae466a728017ec940b41@syzkaller.appspotmail.com,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] media: dvb-core: pin frontend device through release
Date: Sun, 28 Jun 2026 11:42:05 +0200
Message-ID: <20260628094205.44981-1-alhouseenyousef@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65817-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,syzkaller.appspotmail.com,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:syzbot+ae466a728017ec940b41@syzkaller.appspotmail.com,m:alhouseenyousef@gmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,ae466a728017ec940b41];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,syzkaller.appspot.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,appspotmail.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5068E6D383D

dvb_generic_release() drops the reference held by the open file. Device
unregistration may already have dropped the registration reference, in
which case the call frees dvbdev. dvb_frontend_release() nevertheless
continues to inspect its user count, wait queue, media entity and private
frontend after that call, causing a use-after-free.

Take a temporary device reference around the generic release and the
remaining frontend shutdown work.

Fixes: 0fc044b2b5e2 ("media: dvbdev: adopts refcnt to avoid UAF")
Reported-by: syzbot+ae466a728017ec940b41@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ae466a728017ec940b41
Cc: stable@vger.kernel.org
Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/media/dvb-core/dvb_frontend.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index 7aebaef18191..1276fe704675 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -2912,6 +2912,7 @@ static int dvb_frontend_release(struct inode *inode, struct file *file)
 		mb();
 	}
 
+	dvb_device_get(dvbdev);
 	ret = dvb_generic_release(inode, file);
 
 	if (dvbdev->users == -1) {
@@ -2933,6 +2934,7 @@ static int dvb_frontend_release(struct inode *inode, struct file *file)
 	}
 
 	dvb_frontend_put(fe);
+	dvb_device_put(dvbdev);
 
 	return ret;
 }
-- 
2.54.0


