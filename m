Return-Path: <linux-media+bounces-59323-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JjqNRW96GkHPgIAu9opvQ
	(envelope-from <linux-media+bounces-59323-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 14:20:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7DA445D2C
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 14:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8CD6B3024006
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2026 12:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C403D34A0;
	Wed, 22 Apr 2026 12:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkcgKIl/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89193D3319
	for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860428; cv=none; b=ICHhIeBFaZfuNK95OdtmUdqQA/DzBNB7S7YOhG+wBhoustU8dkO/q6elc7K0nWiNevYTIBi/clsjrhTimoUeO2QsKtRf5FG3XiYYjxcPzsyNirEmAVit3hDP0xlo9Iraa8Fn5vt5tXfA6AE6OEKapP08glVsZ5msGJ2tX+vA6kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860428; c=relaxed/simple;
	bh=Jz2IRjOiJ/M8WuaaKQqT9yeyni2Rlhh9VMwuz6lyXkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ddUFep6cNYROW01tAncxclmNZ/k0jSv57ScpW5wRYVLwVqfT+IeokDb94Gn05oCCa8/WwuJEonOZM9nsUiN2ItzHngHXr/mNi0gRNWwihA64PDISOBQbBREmUh1DUPG9vhhZ2zBNwqqOZ+ohS7tjw2GuEURAGVQlnqZ5lXH/pG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkcgKIl/; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so1848846a12.3
        for <linux-media@vger.kernel.org>; Wed, 22 Apr 2026 05:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776860425; x=1777465225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9o+1Y3qFEujqIV/P/1ozlPANKTLBduTXUFO4gXypNYs=;
        b=mkcgKIl/x1543qk6yArfijNKEQZZoblK78reAsrCaSC2QhHY7yixZ7rqVNHtn7ZXYq
         jyRbSiRn1jTimUo5fwIPksW6mqgwgWdfUS+hTsuIx8IDZ8liQJ+wxy63MM4BN7Xhphb6
         JCiV8Niou2InigVrL9wo0SBuXTb9ilzzzw3c07S3LRfkpUrd87dfyFc+1/GvnmJK6IlT
         1x3KeHpaWYtkcHYWiHM9bcQy2w2jFu2YQWAchQQPo9hGWzgVQ4hoxi8qs6dNR1zpsKgp
         bq6CAaMmE9vBQyEE441fs0Ea+FxqOBWK5GNCUQ1dirU+bsQe8D2hsCLzmV+gVQZTSv9H
         w4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776860425; x=1777465225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9o+1Y3qFEujqIV/P/1ozlPANKTLBduTXUFO4gXypNYs=;
        b=p+bf9FN1PuEzVmk1lHQwyu51owRh9bpFPWh5SX3B58btorq2w7SNB4A77uR8xHYmmQ
         mgdA657vLiNgaEwWQ8WjSWveeSpWPsfeNTcIqCbeq/Nny8WDyVI4sybPBSAnT4vb31vR
         RDLVU4Qho6XQACMKxRcikgEmWK4VITu8VnMfPo3KvZK8W5eQjaMJ0qQ3srUGdZl4hf3R
         0ldJvqkO9iGVl9JbUY9kOWL0Xlwqy9Gkl9FDINJuMx1PBvHGZnZtRR0Vb39K9qkH0nXZ
         Q9yR/gqzDmOvy7/60BVAyuGKWya0iuhnIagQS8zqxgelPuuuj189qI/oa86pcF8w2Hv7
         EHtA==
X-Forwarded-Encrypted: i=1; AFNElJ8mb6l0oqVsHBpgp83uBej9uhMXchQNCIlk0NtFFqLzJPtkpQMt+aJkOeieQeZ3Q81v18Py5pWumEgKzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgxup3UGK4XxZTbowo1lkQiWA5VaESOB3d5cB1szIYdyeM1Tb8
	uT0ANM+qqHjNi5SvZYOW73pnO8W7QxQSjZudED9HmoCbexZ9MtOeK7/B
X-Gm-Gg: AeBDieuKUXU4R9Bk8aDO4mUeygPs9km53u8d9Ig5Me1cOFVdY9s19zdUyx5p4C4ulBX
	3cebj3YNT31t1VMEOE8+hdqjCVIWjd8cazD/E4rOZ0etaXPs0ijVW8WaJrk7OiaJnhuOkzp94qy
	jS72INeJgSQJcIoW9ZfUmWnBL3FKLhz03UTOoEVmbNsQYVN1iPv7qG9J31/CHGR3iOT/tTPbn1I
	Iy3JoSwV/t5/H+H4nUShDfwnxum76mAaRXAKUICJBtWln+Kel12LhAxdDWIEdvmDHv8yLvM4yCF
	8yzdz1CgwM2S4CEfFqbkpn/cOPWK4MfMsmTYvJcLJgZg1UCb1vRB02CT5JgWDOLKlJx0kcAw6ac
	/RIo+LSmBaSC4zzoXxL2Ca9yD9Yv2yqIajq8zLeHL9GT334RVjmkr9QJsGqf2AKv4r9XrKiKgru
	4BPNih0H7dIArA32jn00MEhg8OuGwJB3bkz47ue/+GydT6PBKnJOme
X-Received: by 2002:a05:6a20:7faa:b0:3a1:90ef:7e31 with SMTP id adf61e73a8af0-3a190ef81d8mr15048824637.54.1776860424962;
        Wed, 22 Apr 2026 05:20:24 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797701b1a3sm12798030a12.19.2026.04.22.05.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:20:24 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: andy.shevchenko@gmail.com,
	andy@kernel.org,
	debjeetbanerjee48@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org
Subject: [PATCH v4 1/2] media: atomisp: csi2: Remove unimplemented DPCM decompression
Date: Wed, 22 Apr 2026 17:50:05 +0530
Message-ID: <20260422122006.29390-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aeiuhvqcT189lL5U@kekkonen.localdomain>
References: <aeiuhvqcT189lL5U@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59323-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[debjeetbanerjee48@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7D7DA445D2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The source pad format handling attempted to map DPCM-compressed mbus
codes to their uncompressed equivalents. However, the rest of the
driver does not support DPCM decompression, making this dead code.

Remove the DPCM unmapping logic and simplify to directly copy the sink
pad format to the source pad. Add an explicit comment stating that
DPCM is not supported.

Signed-off-by: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
---
v4:
- Complete removal of DPCM decompression attempt (per Sakari Ailus feedback)
- Keep source pad simply copying sink pad format without unmapping
- Replace detailed comment with explicit "DPCM is not supported" statement

v3:
- Drop "staging:" prefix in subject (per Andy Shevchenko)

v2:
- Rebased onto latest media tree (fix CI apply failure)
- Fix missing linux-staging recipient (typo in v1)
- Fix indentation
---
 drivers/staging/media/atomisp/pci/atomisp_csi2.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index e723304bec80..64419c1a805e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -107,17 +107,10 @@ int atomisp_csi2_set_ffmt(struct v4l2_subdev *sd,
 					     &tmp_ffmt);
 	}
 
-	/*
-	 * The source pad must expose the uncompressed format even when the sink
-	 * pad receives DPCM-compressed data. The hardware decompresses DPCM
-	 * (e.g. SGRBG10_DPCM8_1X8 -> SGRBG10_1X10) between sink and source,
-	 * so propagate the sink format but map the mbus code to its uncompressed
-	 * equivalent. atomisp_subdev_uncompressed_code() returns the code
-	 * unchanged for formats that are not DPCM-compressed.
-	 */
-	*actual_ffmt = *__csi2_get_format(csi2, sd_state, which, CSI2_PAD_SINK);
-	actual_ffmt->code = atomisp_subdev_uncompressed_code(actual_ffmt->code);
-	*ffmt = *actual_ffmt;
+	/* Source pad format is copied from sink pad. DPCM is not supported. */
+	*actual_ffmt = *ffmt = *__csi2_get_format(csi2, sd_state, which,
+						  CSI2_PAD_SINK);
+
 	return 0;
 }
 
-- 
2.53.0


