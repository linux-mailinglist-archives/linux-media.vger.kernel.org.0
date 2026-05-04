Return-Path: <linux-media+bounces-60304-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNCdI4Ke+GnHxAIAu9opvQ
	(envelope-from <linux-media+bounces-60304-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 15:26:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC434BDDB6
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 15:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 100BA303C0D7
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 13:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 002DD3DA7E3;
	Mon,  4 May 2026 13:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eETDozoa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D423DBD52
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 13:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777900917; cv=none; b=uXsVQZjmJYqQzQpZW1y6B1j4xNBtQTvHgfFceiHh1xlE3L8xBSqgZBvJ7NKALPX1nZvpXjknQ7xxaEDyAQRPHTiQ0k7UyLu3KtMSRHfLiRRS+xIdoWAOoXynZKmFjCIzHYni/14gPgvvMvwY2S+CVFTV0uz0iHdXEX4ss5YS0gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777900917; c=relaxed/simple;
	bh=r9eQVf4VASyFYaE/ZIlyDRbmFOv6clE/O8XKlS0U8ZE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u4ttZisKRceDbyxEOPJeG6CQ/2SqzjajMnG2vxuNRQ7Xaptq/Sg/hjulhXYIj5xH+uH4mzy+h9NpXmeT6XFSWAIvewQN3wdLj5jkYb2WMjnyp7q6vGDCl5AIzl0swL1DPWbNFqwLwC6zy0hZ2jVxvxsQEST1YyxXrWXoCp5Jxos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eETDozoa; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38ec6e3de84so3921731fa.1
        for <linux-media@vger.kernel.org>; Mon, 04 May 2026 06:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777900914; x=1778505714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NzTvXmtIHVqLoOxlkNflVv2HMvkwESIZVj/UhIYYlUU=;
        b=eETDozoa2mte/9xI3UtGg89nJVlTKs7Qu/8AoSV1SwSNjOwY5q3AcZ+7exyGlhg96Y
         7lRiBZHauBw5UrZMeBoyLHmS75s4DkElYjmhnLplzIN3tqVUhQVZgpD1ISrXRblGm2+b
         tEixkQl+vzbArzT6Kp3MNx+Vs1/ghuTpq3y0nXlpqTCUtlXwwdeWXrmiN+z8jzSUT4cM
         lL/+mt3XlZhRttmSXzCFbmbB4uELjrY6BIMoJ3O5zdfioK5VbLFiNWFnbfZno2+kZr6k
         N/UdfGd0FtVchvVjVm6t5s5EnzW+3IZdCA2z2vJZDB1l8r+2tnnhnlh3Fg6hXnABAw1L
         L4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777900914; x=1778505714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzTvXmtIHVqLoOxlkNflVv2HMvkwESIZVj/UhIYYlUU=;
        b=mDZrb4QKGZVOgLUtjIjNhxoCVkFpvOduIj+pKtiq4iM6/E5EXDdadnH7i3TY2WCWKG
         YfbZxTPcm8tkRZxUAFRJk7v9DFWOQl09r7sruwBkrJW74gIltWjdpWVr9w5hKzRV6CUU
         3boPBvufBV5v9rZUIsMMd+l8OWy7tuOnWBYkPGLeDnQFzqJadftHWPAYKba68MhXHG0u
         5lci04bdZHeHKy3XBMOUwQMjmyV4xofDPK2ftIIaS4ndpx2FPbEdxsI84VU00gD2IoAB
         yUDw4o6De7FAx9nBczwWB469DivtXJB9iqzGnZ6WeZ+p/gGQN/N6A0/r2FMuKbt9mcwX
         dmpg==
X-Forwarded-Encrypted: i=1; AFNElJ+EclhCeBPuO+i7BpteeUonGiN0dEep+uJovWSv8hpO9yLkFU2jZ2I8NOXLNiYaN3qCupmySP2HNp3L1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS5qKFqvxMGygJixOZgXuM7LjGHacLDSKD5kzuqJWpqwiNKXsG
	i5BnCeoZCXw44hacAWarmIcvatAUl9p9dK7qFBA1YnIBVzyj46EdWenv
X-Gm-Gg: AeBDiesfRdZCLUBRLUfr4UX/wdpVnfUilfJ1C642UvrcrKbEOf2UOVQpmcXJ9C4DPWP
	D2IPgtxWziXYZSlA+VXQdUsmsNBZYTIR06GGA7mwsPPpuwtMYNroOfutGRqt8OkNNdkT/c55lHH
	5On7uuQyzifO/afZW8llWqvweLYbGX+igBCtF4fO7ExrSK2QRhUkZGUtpGFeixbciqRYmtJ1qlo
	mLhNhDJCCPRfWuStC1BPLCu0/HxsnYE7M5ML6K29i+/BCczEkZ/5MbNcf6LaInJWv0zZfRdSJ7K
	FdXAOtffk5aqp4h+Uo2lCtynYZLjPtRxjZpPQMglUQfUDt3qAv9nToSOKXEMustA8QuGXgJ4TBo
	j4dvEryk2a/UkxghN/U/w40tyo+IVG8k/zCXMAJlE1jD6lnST9WuyypSQOHgeEYv4YJfWCShhuF
	u7d95MUUlbOJs61Gb2KCRk/PzXF8zjLNAZC3i8Qb0TGm8GlP2NRhHcLg==
X-Received: by 2002:a05:651c:505:b0:393:a31a:ab30 with SMTP id 38308e7fff4ca-393a31ac91cmr4741351fa.0.1777900913930;
        Mon, 04 May 2026 06:21:53 -0700 (PDT)
Received: from localhost.localdomain ([94.158.58.95])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393610ba631sm31780481fa.12.2026.05.04.06.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 06:21:53 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	aadarshmandal9354@gmail.com,
	luka.gejak@linux.dev,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stepan Ionichev <sozdayvek@gmail.com>
Subject: [PATCH] staging: media: av7110: remove dead av7110_reset_arm()
Date: Mon,  4 May 2026 17:21:05 +0500
Message-Id: <20260504122105.1428-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2EC434BDDB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,linaro.org,gmail.com,linux.dev,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-60304-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sozdayvek@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

The av7110_reset_arm() function in av7110_hw.c is wrapped in an
"#if 0 / #endif" block and therefore not compiled into the driver.
The function name is not referenced from anywhere else in the
av7110 driver tree:

  $ git grep -n av7110_reset_arm drivers/staging/media/av7110/
  (no results after this change)

The actual ARM boot path is implemented by av7110_bootarm(), so the
disabled av7110_reset_arm() is leftover code with no remaining
purpose. Drop it; "#if 0" blocks are dead code and should be
removed rather than kept around (see coding-style.rst, section 21,
"Conditional Compilation").

The "/* av7110 ARM core boot stuff */" section comment is kept,
since it still applies to the helpers that follow (waitdebi(),
load_dram(), av7110_bootarm()).

No functional change.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 drivers/staging/media/av7110/av7110_hw.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_hw.c b/drivers/staging/media/av7110/av7110_hw.c
index 49ce29577..3cd0988db 100644
--- a/drivers/staging/media/av7110/av7110_hw.c
+++ b/drivers/staging/media/av7110/av7110_hw.c
@@ -96,27 +96,6 @@ u32 av7110_debiread(struct av7110 *av7110, u32 config, int addr, unsigned int co
 }
 
 /* av7110 ARM core boot stuff */
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
 
 static int waitdebi(struct av7110 *av7110, int adr, int state)
 {
-- 
2.33.0.windows.2


