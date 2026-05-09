Return-Path: <linux-media+bounces-61002-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGhzKIJc/2mQ5QAAu9opvQ
	(envelope-from <linux-media+bounces-61002-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 18:10:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 344FE5006FF
	for <lists+linux-media@lfdr.de>; Sat, 09 May 2026 18:10:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2FE4B300F1B1
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2026 16:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 658222DA74C;
	Sat,  9 May 2026 16:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpFQqiPC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836F427FB2A
	for <linux-media@vger.kernel.org>; Sat,  9 May 2026 16:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778343037; cv=none; b=RJhVTiKPRnZpamcmLBUWoObEVafN+qP9aYTHgP7I4n1GaLDfc5j5eAlFYdp1B/HTIhEO7oFHWvRmwnNOpz8Kb+O1Y19kVjH7mblUEbl7dN/sPMn5KZUyG8PfTCZ7Y7MhU8h0UgrzVY/OaMkF1PxcJafhMjLK1mdPY5a4DaOm64Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778343037; c=relaxed/simple;
	bh=uzbHpk4MijGQQrPmmN2tdpyA31ld6cJMlkuKBZTnlAI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rCA4ZtF0Um703aBFJgyHyZH0wXyLGzHtz6LHZrKQJHb+X7RrP0iNL2Hl8HMUoJmUVnf8iQUlscjv+s8hzm3kJjgfRr+eSkZA8EhZD/iu6c+KzAHxGona3SgrUup4VTIdh0FDdgytj04UvYYoZ/btOWtCDgbo76tTm/lGeUcqdhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpFQqiPC; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so29270265e9.2
        for <linux-media@vger.kernel.org>; Sat, 09 May 2026 09:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778343035; x=1778947835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h1WABFuITTiRhoshhlQerIjtt48KBscaeJl5fUkeGEg=;
        b=fpFQqiPCDP8cDVsi+QmzIxQkpfEfMe1QdZGR/2RsQ2z4nqQ+lOo6ZH7Zs5hsjgsndC
         TBarwWzxsRrxLXGsYklDG9y3e6Fnl1keW7/n+PA6o1Wgeu7YcvNx/UOmPHEyizESLdPY
         MefO5HNwF3BivRRminF7hJS5rsK+7M59npVacr6yi/JBT/rBC4TtVFxhXk/76w+4YW9C
         /1F1J1wjY8NKj75UzDiSHUvr0F0ty4N2uD08hhFQ9QBLym9Ck12jcBD2RSLYr02QmpVY
         lXcZNAHgcF64jsqGOLiS8ewoTLmw59WPzRELem6z4REEMrRJlf+gTwI3WHm4AwjZIcL9
         fGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778343035; x=1778947835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1WABFuITTiRhoshhlQerIjtt48KBscaeJl5fUkeGEg=;
        b=AFspZ+hyjDDVya/UFnvXRQL11+dAQdwoNjitmf9z86Yjor/DP63ts9XDx+dH++t/4h
         WkfkJQaOLzc1XKacRuqNNOlRb7DEI/qAmCxAr2/wHNvK7Slr/7DbFuqj56qZ/KSH2qM1
         mCuaTucvJZkNEMp7lLO5HvTUvMdRAi4fqmNZgT1C6ETX0wC+ZwvJ4pX0UuLlfax1gcyT
         HbEIM+XZRl6mvAm6RelsS3HqWo1Jt5VP3CB1CTv4A1plWT4Nf0Z4RlRTDpzZpoQqy8po
         JaRzNotqbsf3ujhx1i5CIUqYicW9UVK7s33AlyE/vGQFaNgkbqzu5HCXLTYcAULHVrVF
         XTmA==
X-Gm-Message-State: AOJu0Ywa3WqI+ix6bIv/QJtkRhhdJq1OK+FERKv0YxhOSxBU0ufz8nt7
	OwWYtvlcdvZC2/g0UXLS/oDw1wH3nm+N7MYYKLVobKxGFNb0mqZeKQHa
X-Gm-Gg: Acq92OGAJZxorM8Iw3TWOqkz0RNHYRUwH4dNPn53sv7HpvHihIRdHjFA1xDdEHlCZ/Y
	n2VZUNlnT6RRljI8F3hknZYIpZbqrKqAekxgTRHF4NADVn3JnxHZU0rNw4RvsEJdTQMNHcsLqD7
	PRLwQSSHaqTfLUHzB7WNjQ+AOzwdAnIAlkVXSLYZrHJ+G/H2OQY+nKs4fy1WMVQ2tRpcx4Q42Ah
	P24hxODeUJkicBHJf+85fnnNlJFiwVVY2NfwDqaBy0Go3nuf1A1lnuh98RWwhkSrL1cQDA68jWW
	OqUmoi+Og71s0eq+P4DHdNzYVgh76qeWtGB3dHZP5m1Ax8BKFNFp3ihAw6h+V7hCdrJ64NHRFCw
	8+3FtVzytsOYYEzhWOSkfls63PAg1K2xszMpR2kFBTJR6N+G4BevWUs2yPrdwjD8bgu50Qy2MbX
	JtuBYmtPPehElSM6pDhImJcJJWz9VJyECwx+2KulMM7N6K7cqpLuym0HLpBwjjZSUiasufpHREr
	Cvs5m+2dXEph5sP/0Rb
X-Received: by 2002:a05:600c:3b96:b0:48a:66a8:9981 with SMTP id 5b1f17b1804b1-48e51f55272mr287641795e9.27.1778343034768;
        Sat, 09 May 2026 09:10:34 -0700 (PDT)
Received: from thinkpad ([46.164.106.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e715dsm110691755e9.8.2026.05.09.09.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 09:10:34 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: matt@ranostay.sg,
	mchehab@kernel.org,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH] media: video-i2c: use vb2_video_unregister_device on driver removal
Date: Sat,  9 May 2026 19:40:13 +0330
Message-Id: <20260509161013.14602-1-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 344FE5006FF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ranostay.sg,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-61002-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arashgolgol@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The driver uses vb2_fop_release() as its file release operation, so
vb2_video_unregister_device() should be used instead of
video_unregister_device() during driver removal.

This ensures that the vb2 queue is properly disconnected before the
video device is unregistered.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
---
 drivers/media/i2c/video-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index b2db0dd64a5d..5e11758ffa56 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -888,7 +888,7 @@ static void video_i2c_remove(struct i2c_client *client)
 	if (data->chip->set_power)
 		data->chip->set_power(data, false);
 
-	video_unregister_device(&data->vdev);
+	vb2_video_unregister_device(&data->vdev);
 }
 
 #ifdef CONFIG_PM
-- 
2.34.1


