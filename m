Return-Path: <linux-media+bounces-58559-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFHlEGga2Wk1mQgAu9opvQ
	(envelope-from <linux-media+bounces-58559-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 17:42:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAAF3D98ED
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 17:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 86C7631392FC
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 15:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0757B3DA7F2;
	Fri, 10 Apr 2026 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNJQ9etp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7553E2759
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 15:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775834729; cv=none; b=dAIaOFS3wDeXOubntf2tFYOI+GHEYEJg6RYZYahYxM6dR+v2T1rumF/5U4XuCDD+1EmW6PEddMjBYFg3VDRyEoUdK9CwxJqRoBnn2cTQuY6vbn17Vw2gHAwK2pqFmEgWQF7hzM7NvcOFWuqN/Nc0ojD4g8/nu/zEEs9uKF60Jgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775834729; c=relaxed/simple;
	bh=41Neor7tSLrmgihGYhIlmf6oXzMPazdCBeClFzMAnzo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZmFtoDr3dEg9Rs5/Utx2aw4URSNqZwS/7PVTbN9rZrGt+9GdnhqqzKsGHbLzdgEbfuoD4Quzd6vxX/XvRQaSdYAiDKPuHF9WX0pc9PFs7L7K94ST0JljZSJzIsj9J4mbSwyNVov2/g2c6sfGbCXSrffA42TqlBWA8dHEBM9g20Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNJQ9etp; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d17bb1c65so1499692f8f.0
        for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 08:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775834726; x=1776439526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g5E/qGGytHyyxjtH+nmK60xHIAvqtE0J+wOflAMG2XA=;
        b=gNJQ9etpzDY0gtsn/P8ELdIbu8ZlXIVAezz/Qm7aVpeCf0tbVdEzO7VIT01mIf0L7a
         NLn3X7iRBBsHm+VCq8cGuy6eGF0KGfNsXQp6bFIIHRGT41ypT6+NI9zjq7gAk4fJOplO
         AGsXGelHEZcn7rOmCSGXqgKJwowqHPNPR9Dj75+cVkZ1nh+91LJ9j/rN1UVbSzQRPrwC
         8TZseirpuF0eDavIuIIitDyS3zMwo5SCdojgi4CtQX3TgQui9WACbGFZHzvyIFNPolcr
         u0z5HGwJ+D40xlLb8SY7XfAN/O0wBqFVLy2Pg0c6XSCIaBqVp65gwsWtONDXm4+SelDa
         6hoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775834726; x=1776439526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5E/qGGytHyyxjtH+nmK60xHIAvqtE0J+wOflAMG2XA=;
        b=VOscpgy6+UrOIHK3O5x86tTOIfoYQ+rr7wfJjEpMf4ns6+tkcj60gsrRuSl+jvMUMi
         lvtFWd3Gz90qpqrjhbPjIbspKWc8V59zBWDxo+RK+6IobaeZQNu4EH+obq+6pXzEjkY3
         ZvTMgJ/YRHZT0ic72lZTGWekBQMFJG1RrzCLPUL2M6JcV0V6etq2ksfMaanB6KNA4SmV
         VkPzhtuTkpYs1nU+yZdkn1dcGMlbXuOBBLwU/we6iZf2a3pexWzac6+zMJ2OluerFh1t
         uLF/VfLzLcmnp5nCWLkNHkeulgtk30D3zlHyh94aXH5YluJ3IxhVCQ12uo/Y7Hl6qPwu
         Ckfw==
X-Gm-Message-State: AOJu0YzvB+qEBmNCDXmgp1zv60pdZO/EDdxEABTIoGkY7rZgKdZdmyrF
	gVD2TgSfBZGqTJ6+LbYmMWqKL1zB2T8c847NxKg1eKMyG6Q6NLCA0a1o
X-Gm-Gg: AeBDiesvTQ4DzZe+1sWpQ1thjBjQD9uCvjhbouKNAh8ftRMF9OD3hXyVXciLLalJTET
	C0EmA0tgIj+o6ws55pOCb0Wp52wcgB3Fk+hZeoy3ZANpkS2OLLqXGKzXrWPUpxc2iTgbUORtlce
	F1jMjp3tmemtdyiIB3tnqe2hhHO/kz8WHWaiaEsZpHqJz45u0FEH/Bpa9FK+ewQBnQH93SSrfGK
	qEV2+IwUmIaDCvtsUGVBEHn9hwzTyUVLIpfENaKt4BXx3jkViTbhpx1eNrzQdsVzWDUoQ336ht3
	XCkbbZFkZNM2JgBDeuf70PaT7TxY6GQP/W3KkxAPLSFsNGD+HmKSMIHiW55XTkP2tw/SfH8R30R
	ADdbjJyIDI5iMSknyani/RJvWfHVmpfTFI33+/4asImBN/Z2HoN6BKP6tGllL5EeIK8E0CD7k5Z
	YkSn9ecIBbUbWfPUpoihwvUugISpFZg3QA5xi5jH6bj0hbBwADRV6inE7Fpl7QKcVxtz8d9c9dt
	eUbePMHqvp3
X-Received: by 2002:a5d:588c:0:b0:43d:578:586f with SMTP id ffacd0b85a97d-43d642b8e06mr5498182f8f.25.1775834726385;
        Fri, 10 Apr 2026 08:25:26 -0700 (PDT)
Received: from fedora ([2a00:23c5:4a5d:3701:b24c:c1d6:5c61:a2ed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2e4csm8722033f8f.2.2026.04.10.08.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:25:26 -0700 (PDT)
From: Josh Hesketh <josh.hesketh@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Hesketh <josh.hesketh@gmail.com>
Subject: [PATCH] staging: media: av7110: remove dead code from av7110_hw.c
Date: Fri, 10 Apr 2026 16:25:02 +0100
Message-ID: <20260410152502.25310-1-josh.hesketh@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58559-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joshhesketh@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DEAAF3D98ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove functions av7110_reset_arm() and av7110_send_ci_cmd()
which have both been disabled behind #if 0 since the introduction
to staging. Code can be recovered from git history.

Signed-off-by: Josh Hesketh <josh.hesketh@gmail.com>
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
2.53.0


