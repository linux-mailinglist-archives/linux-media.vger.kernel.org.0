Return-Path: <linux-media+bounces-57466-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OZrPLlobyGkGhAUAu9opvQ
	(envelope-from <linux-media+bounces-57466-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 19:18:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3C134F7D7
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 19:18:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED16130269F2
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 18:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657033793C2;
	Sat, 28 Mar 2026 18:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pNjDFCXu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF133E47B
	for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 18:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774721875; cv=none; b=dq+YPTXJcDvtb+5ugits3+Cf7yDzteB/Hjf5okQVOE+cnRF8L1kMZdb7qKV3nmmOe0ywqesqD4cwrlfveZYzJ4mWb1luZfaW0JVz6DHcCnG4jkbRHMfPV+rlfHuufp05T/ZJlsniAD04byniR9UtFlf3iE9rs7kB5tM+DV13Tt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774721875; c=relaxed/simple;
	bh=ZWJg7QYWRQbgXcojyR4TKyqPIue1T7QETHoFjcx4hlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WlL4ghf+1/5tzmb6RPO2bPYMymReGactcnrM2mKiwKg0v0hQAlldptrjnOYsEw8YQnl9udwL3b6E8NZ3K35rdYiqdsW+iRwnxGg7yykNPINTy/FqHxI9RrTzwNeZAzyQ4+H0lp0/ybQ9QxJaJh19XiuCVIcXYAtTk24kCTf/VEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pNjDFCXu; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439cd6b09f8so2097195f8f.3
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2026 11:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774721873; x=1775326673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rprbcKOKh6LbVDBtx1L6evH/A6xyQAWdrHbB0AMy/jA=;
        b=pNjDFCXudYSC/Uo2+ev+6npNPz6F9f3fzuukjykp2RhTmoh12SrSsgc2dBtG3Ju2sb
         vaFKG+vN0r8kkqE1E2uPBNG8lGKrsPJel+4T8d16PFLyswKgfxS4/aZ9T7fKROu0invA
         2ExsLzt/EuJYO7hJaP9aup9QhFJwQfAdAKHVMyDFgBrq3OSm7F9WN/enC7YJksZhbbE+
         ny2lIK2HlDqzwMbYcoHFvSgZHjFflfhzfhjHtV1dK2nG/2gL2r4KvjZBwDrXjWHPO/Rg
         mxeEqEcAUmHP/J3qe07mGjLWUKrPFQQFF5iTXodqqyczZQkS3zvFKhkB9yeNl7+5g5fO
         278Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774721873; x=1775326673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rprbcKOKh6LbVDBtx1L6evH/A6xyQAWdrHbB0AMy/jA=;
        b=n9c9ZiJnPj43w3n3/mdRzC1GnuzoY/z6xkCmCsCwH/DBtfs3CIAWEYV84ZEENoDMlJ
         JCaAImU7e8rzoIG3AayM05DQbos4CDlMidJuDSu2PpAW+v5rZ24MVthzTZagr8BSLzl5
         9/h3CjgdVc6EvKViRPlLQkrCrtmZxHrYx3kDfbBqmr4PM/yWIdw1+NRKqcULT9pmkTIy
         B1oCx/bOdoFx3bTXALTcy3ayQWNAN6YSJqiCjiOCAroLouIdK/kKdhAYAwnQOYxvNt+8
         V7dcCOlquEUEitikzOFDB72izuzSks1BoVugJWYfYHgIH/zF5nEbbs9j71vUXUAd6Gy9
         cnnQ==
X-Gm-Message-State: AOJu0Yw+PBr3QYRuEkfu9GwSMU/O4V8FTswxxIRb0t9pfKMTK73flKMN
	jtffLJM0igWm+qI74zFu7b79ER1Ru2OqO6mRZUpUotw8/xwI1qzfRflQ
X-Gm-Gg: ATEYQzzT5REKoIBxTiQCFX0IlmRRilQ8DcHPUuc6NLKxvew5EOagzolsCafFgdVEHtm
	uIYZX4A5hB+GB13Ok8aPa4IAAD6TVbt1BbitqxqfTTzEj81CBhwVzsF6Z8dG+K66SWTyJBBl/qc
	bG6DYadGhAUrXzNdJYmPu1vHQblDVHQKlvHUfgfSScGYvB+UTJbw4eza0n8TIRkuXgpW0VeGmh5
	7BxIFPe3JMfN8gZ5+21DWILCjS4TqHhLN+U2sxEd12NnWumNOguvgX74TeX/D5SGbyT2t0WYlFA
	wyBOJs6420fDipy8qEf+F2d/KGKYnVydQjub9Cgsd4RE6bxSI5l/8ghf3veatrOGn1o37d4dh0C
	8XpyI3Roaczlu8MD+48hOdFmLgUyf3IDfQujWTzIR/rtD5j5e3fQx1t2ePOIimU5cTUNQyDIqAl
	7fcAksFBDcVerCzoTqLeFZGDIEaMHh1lDSfFHaTqSy0kQKDydtNpvxo/Hbp4A0Bp7lsSLE7xQfX
	L00EP21dYCt
X-Received: by 2002:a05:6000:220b:b0:43b:8023:8b2 with SMTP id ffacd0b85a97d-43b9ea76481mr11973788f8f.45.1774721872613;
        Sat, 28 Mar 2026 11:17:52 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf247472csm5435632f8f.28.2026.03.28.11.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 11:17:52 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: kwliu@nuvoton.com,
	kflin@nuvoton.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v3 1/2] media: nuvoton: npcm-video: fix error handling in npcm_video_init()
Date: Sat, 28 Mar 2026 18:17:49 +0000
Message-ID: <20260328181749.13047-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <69c81867.050a0220.26a904.f72a@mx.google.com>
References: <69c81867.050a0220.26a904.f72a@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-57466-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 1E3C134F7D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

npcm_video_init() has two error handling issues after
of_reserved_mem_device_init() is called:

When dma_set_mask_and_coherent() fails, the function releases the
reserved memory but does not return, allowing execution to fall through
into npcm_video_ece_init() with a failed DMA configuration.

When npcm_video_ece_init() fails, the function returns an error without
calling of_reserved_mem_device_release(), leaking the reserved memory
association.

Fix both by adding the missing return after the DMA mask failure and
adding the missing of_reserved_mem_device_release() call on the ECE init
error path.

Fixes: 46c15a4ff1f4 ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index b2a562e1ee1c..5c6bddfe8073 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1720,10 +1720,12 @@ static int npcm_video_init(struct npcm_video *video)
 	if (rc) {
 		dev_err(dev, "Failed to set DMA mask\n");
 		of_reserved_mem_device_release(dev);
+		return rc;
 	}
 
 	rc = npcm_video_ece_init(video);
 	if (rc) {
+		of_reserved_mem_device_release(dev);
 		dev_err(dev, "Failed to initialize ECE\n");
 		return rc;
 	}
-- 
2.53.0


