Return-Path: <linux-media+bounces-52046-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEXpMCbOgGkfBwMAu9opvQ
	(envelope-from <linux-media+bounces-52046-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 17:17:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D52B1CECF3
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 17:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4AF843001590
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 16:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A55227FD40;
	Mon,  2 Feb 2026 16:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtXh3ALN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D986E27BF7C
	for <linux-media@vger.kernel.org>; Mon,  2 Feb 2026 16:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770049046; cv=none; b=BiysvXgJxIWTKfNZAbv2RRKifSyh50YlOpTrx+pRmCPoVoXWhtXzGlVW7mFW2yrXz8zj26aDebRw18880rQHFoNASLs20h8fxsGNyxhpi9WXCDiKVNb8PqvduebBf2c5nRQWQERsw1jBzgIHr10gO+rH9FoIguVQNZmJFcfPp/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770049046; c=relaxed/simple;
	bh=rglkDeT5IuUtm+z7whjBnRm5IqPqBNV9OatoxBDTRcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LVGkkG6Ae10Cir2do/reejhk9KPON0awyZNg1TRzWGA0T3BT/pd0Lf17YbUNWkpJdWLJGlF1ET/tvrQq1BTECC4wfbKfj1bKMlnXXuotTFZ9ZI3hxO9BHSFMgVSoTH95Q/6jFvFvVzUKThb5ptAviqsFOApaTFmNlUljNNE+Epw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtXh3ALN; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c613161b489so1955556a12.0
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 08:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770049042; x=1770653842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WzprY86WwCRfy0peK1U3YYL0/I48uF6P+UVD4PxfSe8=;
        b=AtXh3ALN44v7DmVv6imjB5vanvYY26zg7D8Kgy8Yv8MR8CZDe4lWjP0CgVYiWtmJg1
         GYQYhp8r32LBqSfT452t/abr3imf8fjDG6w7K1hLHmQFSxSKcYZb1KP51CjsVxGOC9Zx
         BCUTEShTkV+EfeEQvt4LxnkNwfp1xVpRVCA+Ccxyi+g14BzqwrzvP8v4I/NVT1S6XHCz
         6Gdm6P4VLCGhDbQysJF6Zw4rk6draXVT9+KR+lCUPYxaeBvaj5Jyjm97YnEpdtgzz4zv
         ktlleJXShQRPcTPoijtNWsi3VfiSOsge9suAsz2+hhKYkZwySGkolt8kU6N/8RYNfl3d
         JWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770049042; x=1770653842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzprY86WwCRfy0peK1U3YYL0/I48uF6P+UVD4PxfSe8=;
        b=P8Bj+Lc7huSHcqEAlDVh1ASqpp1ETrw+KipDYVSIwyAU3/jzmwuew+wSlzihZxAHfr
         UDYxAbfDIyVNTNZNCQTM++xy0WhoYZomBVgHpcDl5lXTLH/JmvnuLyA8JR7vmMs4fkX4
         nc6DL+3GClCrFnvxCBTJFuXXYEm0NYHXCZjtM/idwLr/xh5Q/aKYreYMyeR8NkNhzdvx
         TYW6agIxfsrp82VmIPprh4Q00GHchEZQei26RtbMWqcCGGdAg+6RX1JUi+aKEdc/L/5n
         tR3wPP31eUEuMshuqMRihQSqYTdhPlVyW4BzXOnNTITCwjSU6v/GtK7QC9H7JPIKzUSN
         3G5A==
X-Gm-Message-State: AOJu0YxnP2lhbh9SNXW/2yxjCvsrGOPyQGaPCJ+8g8h47ynYzDGIuylR
	3lxC2ZuScA3YHr015fEaeQN+Xa183iZRIGKhxNl16BOn7ISO3k0haIZs1TB9GQ==
X-Gm-Gg: AZuq6aIFSONM1vjRw8cqVOBrbEh00qjLlq0TMHsnKYPcrQ5u+vtZkDIaZlGLan5a2ss
	S7Z8ZxGHHBx4VUEM4pU5UKrV1nGgnAzyTaOj99wkmBe4xYSG9ArW3K09YRgUUpn6ptGJhPuKgdg
	hMwClcPs7QuOk9tyfmnUE0AH1PRzblMLWu5EZ5VoZO26PGuVBUrVpzhu4yiuNPAT33OPuE+7wI/
	FiFFbmmkQs/+fCkBEy//17WM1Vh9g3PIGyrh7QEFCnwHSD+NNHLd+AtYTUi7z/wYSYqlgso+S06
	S82rFMmLkq4u/GYd3lAUHNKPll6qRdn3RKL0+UI3hnNS4JeJPAbVcUnYZC5vSqVLL1JhASz62fv
	5n18WXh5h1x0/yV8nRfcf8febRf78y18tou1oZsP5aWcaPMDa8XsE6bhTAlpQQU+CUg4HyBpeht
	GoGxvVTgKP
X-Received: by 2002:a17:90b:2e8e:b0:340:d1b5:bfda with SMTP id 98e67ed59e1d1-3543b2ebe78mr12089583a91.3.1770049042379;
        Mon, 02 Feb 2026 08:17:22 -0800 (PST)
Received: from archlinux ([45.119.31.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3540f3f0872sm15735043a91.16.2026.02.02.08.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 08:17:22 -0800 (PST)
From: Adarsh Das <adarshdas950@gmail.com>
To: Stefan Richter <stefanr@s5r6.in-berlin.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Adarsh Das <adarshdas950@gmail.com>
Subject: [PATCH] media: firewire: firedtv-avc.c: Remove unused code block guarded by #if 0
Date: Mon,  2 Feb 2026 21:47:07 +0530
Message-ID: <20260202161707.164006-1-adarshdas950@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sourceforge.net,gmail.com];
	TAGGED_FROM(0.00)[bounces-52046-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adarshdas950@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D52B1CECF3
X-Rspamd-Action: no action

This resolves the FIXME comments and checkpatch.pl script warning
regarding use of #if 0 for code blocks.
---
 drivers/media/firewire/firedtv-avc.c | 41 ----------------------------
 1 file changed, 41 deletions(-)

diff --git a/drivers/media/firewire/firedtv-avc.c b/drivers/media/firewire/firedtv-avc.c
index a36c28412170..552b77a5cd57 100644
--- a/drivers/media/firewire/firedtv-avc.c
+++ b/drivers/media/firewire/firedtv-avc.c
@@ -910,37 +910,6 @@ void avc_remote_ctrl_work(struct work_struct *work)
 	avc_register_remote_control(fdtv);
 }
 
-#if 0 /* FIXME: unused */
-int avc_tuner_host2ca(struct firedtv *fdtv)
-{
-	struct avc_command_frame *c = (void *)fdtv->avc_data;
-	int ret;
-
-	mutex_lock(&fdtv->avc_mutex);
-
-	c->ctype   = AVC_CTYPE_CONTROL;
-	c->subunit = AVC_SUBUNIT_TYPE_TUNER | fdtv->subunit;
-	c->opcode  = AVC_OPCODE_VENDOR;
-
-	c->operand[0] = SFE_VENDOR_DE_COMPANYID_0;
-	c->operand[1] = SFE_VENDOR_DE_COMPANYID_1;
-	c->operand[2] = SFE_VENDOR_DE_COMPANYID_2;
-	c->operand[3] = SFE_VENDOR_OPCODE_HOST2CA;
-	c->operand[4] = 0; /* slot */
-	c->operand[5] = SFE_VENDOR_TAG_CA_APPLICATION_INFO; /* ca tag */
-	clear_operands(c, 6, 8);
-
-	fdtv->avc_data_length = 12;
-	ret = avc_write(fdtv);
-
-	/* FIXME: check response code? */
-
-	mutex_unlock(&fdtv->avc_mutex);
-
-	return ret;
-}
-#endif
-
 static int get_ca_object_pos(struct avc_response_frame *r)
 {
 	int length = 1;
@@ -953,16 +922,6 @@ static int get_ca_object_pos(struct avc_response_frame *r)
 
 static int get_ca_object_length(struct avc_response_frame *r)
 {
-#if 0 /* FIXME: unused */
-	int size = 0;
-	int i;
-
-	if (r->operand[7] & 0x80)
-		for (i = 0; i < (r->operand[7] & 0x7f); i++) {
-			size <<= 8;
-			size += r->operand[8 + i];
-		}
-#endif
 	return r->operand[7];
 }
 
-- 
2.52.0


