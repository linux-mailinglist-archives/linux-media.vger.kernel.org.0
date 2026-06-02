Return-Path: <linux-media+bounces-63338-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPVDIhA+HmpriAkAu9opvQ
	(envelope-from <linux-media+bounces-63338-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 04:21:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A196272AF
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 04:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FF5F30A44D4
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 02:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835CB35E1B6;
	Tue,  2 Jun 2026 02:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XC9luP1v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1AC34CFBA
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 02:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780366340; cv=none; b=A+fHBycSY2+UcwVBNQj+63+6b4Gy102JdnfbqiZ1WnqfQUytASiGXf282H6eWi6hAxrfi1CYGH+GPIvV/5wHKf6yZTvvoLqCaJ75XhsQTzSDREi3FG4dX51pdT1hr0DE/VrKk2SyjTupPqL3dgj6aXoat2wbUs6FUF8Et9v4jmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780366340; c=relaxed/simple;
	bh=wf/Tk37nbq/peNqLyDFCZP6yanc4XzxUnAJaltP01xg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fdneAgxWOi7k/k5+COQsLY+Z5T4IuV003+1o1bZu5A0F68e+7CtfF1SocBE4WAj9gsJ4c3YEXi8m5EjTOq6qPG26B3zqhNPguwGN1v4p+jGgmbfkIdL14RNpZe4qiU/vW4hqEnpEOhLL4LJ+oFjJyD1gCRNILWTAYIjE8t5x2nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XC9luP1v; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36d5fd50d20so1904767a91.1
        for <linux-media@vger.kernel.org>; Mon, 01 Jun 2026 19:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780366339; x=1780971139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yD+SU8WL23LENwZ9rMPspuomjTKLBSTSnf+u+Jse5Lc=;
        b=XC9luP1valVDdFgiMi1EebgRlKVrH0sPmMOSuUsH74RerLC9LTfu8UqB9xGwqtxnub
         meNx8pWiZJnnLSKf3H+FBTvlzlNmYH8f8i899PFeH2ckw3xpTYEbFrbb0gTs1hSHDrZt
         Tx5OofLWu86/2fedfkxSDaEBfNw+N4Y+Q/Rthv8jywI1t4nCuQvFfjdErcBA47v1Icfv
         GQVLjccZHSxInSrurL/xXxCsRHAFmDdD9AEpJuQkUC/Unmw/qMWEG98e43y0roL2qCAp
         c30DWLu8w3d9CE5HgvM+QJXgKeUUYRKF7MFMAbv56xfhiWi8mDcM7Nh2niXrozAKni6B
         GZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780366339; x=1780971139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yD+SU8WL23LENwZ9rMPspuomjTKLBSTSnf+u+Jse5Lc=;
        b=jqKs6VtW19oNS1jRMDK76MHs78VntLzAUFPTktlVbNNmB7xyVyoG6vFPdvkWSzzMKv
         vGJeO25QoPToBlhopAFNouVhV2haxjr+QfMw4VnU97PVpi3W+WaKIUhRMChIbm15MFad
         sGC6ktUi0m/88mS95gp17Zs/pQDmkRyngXG/D+CLvfUHlqFa5ycatj9O35JaoN0tuCqB
         5ayRtZXZCIiIDS4QxKitultNrKljgaPiOOqSHd2JQnWKylG8xdy509ElIXePhryFOZw+
         Lb65OqTPjh5aVNBrQnEjEDq78m7TWfP4SZaxuker6c4w6dEWwsBBdnNvYuZ/7hBDTWjS
         r10w==
X-Forwarded-Encrypted: i=1; AFNElJ/RsdmScfWn4RhjNMWgwJHJF+5iHIXWTI9zZ4wx+v7tkyAMeP7CwfsMtS6+lQvqtVxzSOC9vu7XzAYa+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOGCTo0kY9ZgrwO88n+ZnPYwsJYakYGxa+gtvy5ngqRBn1DBY2
	4m6CFfRif3JG8lhOfL2EwFuusfQ4kiRiS/SnzhkXQqwHC0k4hUoe99Kh
X-Gm-Gg: Acq92OHBkE9Z4ZSrnwi+7g05UJk/LeQsBydtDDNdtqwDwdbUbdHXzBuj7tAj+ScrPDa
	FTA+YPejOemjYUA2+t9KuR2UXYQmDOgqaiOkU2tOrAAdap3IJ/KKEv9ughMsHOP41hyKwGUTSI0
	I9YMrLjOapPt7zYD05inkC8FxdphGn0NyjROW/f3AaUzQLsndIMdDIhevZnkq6HrpkdcS3tFSzZ
	9GRUBY5PZNlayiJPhr+yrEEnC/HJ8eDnHDz3dYCZ+ZjkSCa3TTnFzQ88rKY7BxpcUeLnVpPWAUw
	qlxXhafGDo0Tpi/kgc9m+eU8LkbYl+C9/tKEqJPt/D76PXPiYNFzG+PXGmyceOpdSRI0btNGSkA
	uoGhpWsSJXglsKBTYv3QvUiR59JDzSTJQJNnv+1G4F5LeP1xNRmFU+K9lfXaZEazmzmg20lNl8b
	UY3jlpqIW8n3CoBS7Kq1FKFRio9n2aQ9q6BdYtz3ObcdAVDjk=
X-Received: by 2002:a17:90b:590e:b0:36b:211f:fa75 with SMTP id 98e67ed59e1d1-36c4ff4cfd4mr15269083a91.8.1780366338907;
        Mon, 01 Jun 2026 19:12:18 -0700 (PDT)
Received: from localhost.localdomain ([2604:3d08:2474:4800::7698])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd95095aasm875733a91.17.2026.06.01.19.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 19:12:18 -0700 (PDT)
From: Brock Haftner <brockhaftner@gmail.com>
To: gregkh@linuxfoundation.org
Cc: mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	preyas17@zohomail.in,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Brock Haftner <brockhaftner@gmail.com>
Subject: [PATCH] staging: media: av7110: remove unused dead code wrapped in #if 0
Date: Mon,  1 Jun 2026 19:11:43 -0700
Message-ID: <20260602021143.39442-1-brockhaftner@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,zohomail.in,vger.kernel.org,lists.linux.dev,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63338-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brockhaftner@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 03A196272AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove the av7110_reset_arm() and av7110_send_ci_cmd() functions
because they are wrapped in #if 0 preprocessor blocks and so never
compiled or called.

Signed-off-by: Brock Haftner <brockhaftner@gmail.com>
---
 drivers/staging/media/av7110/av7110_hw.c | 46 ------------------------
 1 file changed, 46 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_hw.c b/drivers/staging/media/av7110/av7110_hw.c
index 49ce295771e4..b0bd7666d48b 100644
--- a/drivers/staging/media/av7110/av7110_hw.c
+++ b/drivers/staging/media/av7110/av7110_hw.c
@@ -95,29 +95,6 @@ u32 av7110_debiread(struct av7110 *av7110, u32 config, int addr, unsigned int co
 	return result;
 }
 
-/* av7110 ARM core boot stuff */
-#if 0
-void av7110_reset_arm(struct av7110 *av7110)
-{
-	saa7146_setgpio(av7110->dev, RESET_LINE, SAA7146_GPIO_OUTLO);
-
-	/* Disable DEBI and GPIO irq */
-	SAA7146_IER_DISABLE(av7110->dev, MASK_19 | MASK_03);
-	SAA7146_ISR_CLEAR(av7110->dev, MASK_19 | MASK_03);
-
-	saa7146_setgpio(av7110->dev, RESET_LINE, SAA7146_GPIO_OUTHI);
-	msleep(30);	/* the firmware needs some time to initialize */
-
-	ARM_ResetMailBox(av7110);
-
-	SAA7146_ISR_CLEAR(av7110->dev, MASK_19 | MASK_03);
-	SAA7146_IER_ENABLE(av7110->dev, MASK_03);
-
-	av7110->arm_ready = 1;
-	dprintk(1, "reset ARM\n");
-}
-#endif  /*  0  */
-
 static int waitdebi(struct av7110 *av7110, int adr, int state)
 {
 	int k;
@@ -498,29 +475,6 @@ int av7110_fw_cmd(struct av7110 *av7110, int type, int com, int num, ...)
 	return ret;
 }
 
-#if 0
-int av7110_send_ci_cmd(struct av7110 *av7110, u8 subcom, u8 *buf, u8 len)
-{
-	int i, ret;
-	u16 cmd[18] = { ((COMTYPE_COMMON_IF << 8) + subcom),
-		16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
-
-	dprintk(4, "%p\n", av7110);
-
-	for (i = 0; i < len && i < 32; i++) {
-		if (i % 2 == 0)
-			cmd[(i / 2) + 2] = (u16)(buf[i]) << 8;
-		else
-			cmd[(i / 2) + 2] |= buf[i];
-	}
-
-	ret = av7110_send_fw_cmd(av7110, cmd, 18);
-	if (ret && ret != -ERESTARTSYS)
-		pr_err("%s(): error %d\n", __func__, ret);
-	return ret;
-}
-#endif  /*  0  */
-
 int av7110_fw_request(struct av7110 *av7110, u16 *request_buf,
 		      int request_buf_len, u16 *reply_buf, int reply_buf_len)
 {
-- 
2.54.0


