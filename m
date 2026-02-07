Return-Path: <linux-media+bounces-52344-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oM6OJUq3h2k6cQQAu9opvQ
	(envelope-from <linux-media+bounces-52344-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 23:06:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D2F10747E
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 23:06:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0563A301D309
	for <lists+linux-media@lfdr.de>; Sat,  7 Feb 2026 22:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F03356A21;
	Sat,  7 Feb 2026 22:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8G+28rU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D0834FF67
	for <linux-media@vger.kernel.org>; Sat,  7 Feb 2026 22:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770501947; cv=none; b=lrH32AsWG+WnQEol/28PnuPwY7iSk5/o8NJLHVJKgZ0LgNxMW9UWsplR3i7X7ogfTYuwU8Yml9bhZqoLRhCiTS8vmWe3fLkyAF/89GqR7WlRWDStHRHJJhDCd7al+vWkQknvF/k2cB2tZQRuuNrXskNGAe1z3GyAneos1TGmGPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770501947; c=relaxed/simple;
	bh=tFeZ6eqQEns+BbNpZxKKzRzzk5L7mf1AI6/R/s6kqxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b2l6KD8JYHlXJUa5DyTHEnWsUKEsugXn4JU40a/+LPkACIEzmoab1473Qsxc9Vl69JqvB/uNBcyvrUMIPJFzGry8lLX7bq3KaKwdTI/hj2jZY7MKM1w78qMBrG/qj08IMbZiWeHeYfjm+E5HSN1dzAa9Mu515habO21vgdgl2ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8G+28rU; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6581327d6baso5010614a12.3
        for <linux-media@vger.kernel.org>; Sat, 07 Feb 2026 14:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770501946; x=1771106746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z7JzfkHfLZrS3JCd6WEG699dvuHJ446+yPABvOVAurU=;
        b=H8G+28rU65Rf9mFJEqbnrc6OURK/IkX0BWvblY7ujvZGQDDHQt7yJzmWx9tT9bs6k9
         Lq8GKTCiVOzp9dVqPiIk9gCn8wcSGyEJltDbETsoLmelnyZGx4sOEFx/ssb4H/PcJV/y
         8jjXa1u1NIjfxcx/QI6YQkqgtLbBfhFTWIGYR96ZgB6RrsBDoOX2oOLMPrM4eGYk1pUb
         fgUAiTMBvUruuz5N9fABNWTr36veiO5TtYPXqhP+UIOKTQE6Dr1QhKizaEUZHkI2q3rG
         1AAXqgShA7p5j3Pov3kKlFMlVuj8KOO2Be4fzRLQTz58qSVOlp8t5FR7xRhN/RrNsdfQ
         qc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770501946; x=1771106746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7JzfkHfLZrS3JCd6WEG699dvuHJ446+yPABvOVAurU=;
        b=PLYdyRFoJ4bIrq1kcfmwRk7SI4+izXLjyVV5rsk4tmWWHncOi9GDeuNoVVuqi/gfCc
         Or8oN0VK1BqQeP+eMIiVUmFGoWGPPZPwCnWddTatzcuHIx/KcRbIA8b6GQG+qa5F49jL
         es+8QaagKOGWpFBJdKN1VWtjIay0OIYNe/OkfGot9Th1ehskODUkTwq5+3WMVEhYSbPR
         BpOwMpMie8vTn1MtDYMRooQNepKoA00AtlH0y87S/C4jdZlwX70DDBpn5y8/LFPebNUS
         7omkcpy7/EVHxA47PhxARBvSU8FjbWMJOSxhN45c8ARw+4oKYDVYa8GcSrd9SWX/7PAx
         lpCg==
X-Gm-Message-State: AOJu0YxWrraFLFMghH8zj6XcRIDuhdVj79HMFgE9n3tbDtVqB2cUwwLJ
	D7Y6xID2N+kvPi7F9CyGnvt0HASEUVyPzpCxfmzJakh/Fc1DQz5nWUUO
X-Gm-Gg: AZuq6aIVt6luv+EvJZS9mMaqjwjwrMYJvzdIv1wsJMqqMiYmVwhCCC4GS7v4eJxGxta
	usFBf2OFcaqJXlKrEVWmobuD2+RfWIVcnwLSSNBy/QSKA8mQ0kTN7Uqk/F6Iy1MnrFyb/UapniC
	GbNAX7LttkR9NMrTORAgRD/hvE705Q4mSNBtR+NGVB47pFMQjf8Vu5elvc/G4oZYERV80qjqDv+
	1oCEA/+XiNWu2dMuJV+FDQ5wIr23JE839jloU4cbtqZdG1oYcv3z/Pb4qW+CIyUfhsc1kLtF1M4
	Kbfj6Bbehj/axa8jf2VFbovJm6myzDjZkJHJXCPMtF1HDMaB8PN5KzDlSCU/j4ju9TAuvCvz9yL
	9R4oGPkEjrN9U73gnNYXml969+1HJX2rmT6JI8QZR0OXUDrDXKc+zcErtcHVtHnxaZkTtfA4YAI
	rM50hFoKiJafImDbGGEM2eXXG+OumDYT6LiFC46gLLogxYYYzN9S8LOG9CRisgx43NF2m/x8L8v
	wX1ru8xXCVdoLJZw95soDxMVXLKt6aNkkbjCW1roL5DGRDqdgF+QAOM
X-Received: by 2002:a17:907:961f:b0:b88:7093:3cac with SMTP id a640c23a62f3a-b8edf43254amr385654366b.54.1770501945604;
        Sat, 07 Feb 2026 14:05:45 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.od237066db22328bb-tp.internal (99.86.90.34.bc.googleusercontent.com. [34.90.86.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7dd3acsm216806666b.28.2026.02.07.14.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 14:05:45 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH] staging: media: av7110: replace BUG() with error return in gpioirq
Date: Sat,  7 Feb 2026 22:05:44 +0000
Message-ID: <20260207220544.3884-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-52344-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[iprintercanon@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 38D2F10747E
X-Rspamd-Action: no action

Replace BUG() with a return statement in the gpioirq tasklet handler.
If saa7146_wait_for_debi_done() times out, crashing the kernel is
disproportionate. The pr_err() already logs the failure, and returning
early avoids accessing hardware in a potentially broken state.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/media/av7110/av7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 602342d11..bd53d1a41 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -460,7 +460,7 @@ static void gpioirq(struct tasklet_struct *t)
 
 	if (saa7146_wait_for_debi_done(av7110->dev, 0)) {
 		pr_err("%s(): saa7146_wait_for_debi_done timed out\n", __func__);
-		BUG(); /* maybe we should try resetting the debi? */
+		return;
 	}
 
 	spin_lock(&av7110->debilock);
-- 
2.43.0


