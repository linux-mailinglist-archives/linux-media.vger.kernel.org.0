Return-Path: <linux-media+bounces-60001-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAcOI01G8mmApQEAu9opvQ
	(envelope-from <linux-media+bounces-60001-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 19:56:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EC44985F1
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 19:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 93452300FEF1
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 17:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0631B41322D;
	Wed, 29 Apr 2026 17:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8+FFCOj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CD938BF9C
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 17:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777485377; cv=none; b=MuMo6LrTE/hy3KGLlUuP+faRLe+8kff5vCOL+IcjKOybl7Adz087RtmvCLIPXbn8B3CX1xU2xY1wwzNw2q6W5HUTEyKJe0WA10AmnffcIcm+pvRdHNiRclU33jBvOjHzbgjNIUNRT/xn79gZVOxN0E+IWIssxIaEs11GdZDHwgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777485377; c=relaxed/simple;
	bh=GXDy2EPWSVIeOj61/oWjBf0bAkD5nNMFZ37O68A7Nfc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iTJZv1Z4tDgD4uje3VCM0nsRk5LvVK0GOm2wwetl/Vo/MlM7jxQI+WX9g5jxyAA2IIY5FrvFpnSc49mSOGK7i6KCLjtOMORwc/LagSDaj3h84/UmAvEni6nBoU00XbkI2kD5UWgmSn13b9dlGLWTIWQiTWPT6L9QNfJulR6/NfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8+FFCOj; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8b1f2b7f1bcso1306896d6.1
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 10:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777485375; x=1778090175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2cs6IAugrzoJGGoa8oOAhhUyVMrU1DfkZ5ti3ubmr9E=;
        b=f8+FFCOjQA+eTEgALNNOOXi7BgZpFPWj/Wk29FLJYtKoIT9OvPARWvuCESLlKOtdsc
         Gp/ffktJ/j1TFaSHqVTXYd1G7aIwjh/1SIqiDE4yl/rugp5+oUJtN7RjOTz8eQx6db4V
         3yIqBfiVy4Q4TRT4gqqlKiQMumpV/jY9tybrb9474UQKPVd9BNov8E8z6XzlmBAGRY6f
         WLmZ4WqxCzUKLugCH3K4CtNK0EJf3duD1o017vvLa7rbKViLOuuMDWlybAYt+/wpMztL
         gWXxUkm6yjIpgHLfFEYiuM52oyJ9xsyiId8O4xYIqBfyLkBmvUP8y0l01kWhHbFlGRCM
         71Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777485375; x=1778090175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cs6IAugrzoJGGoa8oOAhhUyVMrU1DfkZ5ti3ubmr9E=;
        b=G8BlOyrXHPBkal1lKz86MJQlk0kJ85mcPkQPlE/R1W59dEk4WsRKtEgaB/36mOoDTM
         lCH58lExSB0NslGtPMBTzwXyl4gXEqrabWjZLZXyYJ+2DcBvHAXlkxJU4kxGt05BvFXD
         cjdbrcKtbsvO/v1p8XON/RT7/rYZniLGa+zCAGhyt+/wNzIIN9okfzqj0/rC4+IqKRbi
         /pqKI/ow7YVyfGS6mHL1AHADWlawssK9MvwrPXROH/NQGaEoNnZ2pBrd9+sUexvR4vi8
         JItvfD1gMKY3RDKQIghO3i3zXmuLhID9rQvli83GUL/cPm80EIE2YWJdvpGtDSkKTkKR
         aOHg==
X-Forwarded-Encrypted: i=1; AFNElJ+9+9tVx6ESYeJzlS1RzEH3V56RqxJjSybSoNYmR4tWQ/0d0xx+eHwcnHD1iKVUdB4YM4qKiK4aKJFElg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAfE+TSHrcULwmAd0UI4w9iy1n+I1TvJla3NGF2/i6EMJGl6Qe
	RGAbKych8L8ZQtAcspe0aNIRYARwLRtuPr66Eh9W5IdspjdRsyoRRhwi
X-Gm-Gg: AeBDievuGsG9t7VX9Cmq3TAn8txNqWgK0C50gH7tlPxKMxwxj74T/Nz2PmdggJpX+pV
	ye1QRP3EZMDlSsCqHjtcaTSE8JTsfioLWE03E1xznJAdxVeHC+lb5omXhN9vUyoquUZ5EMxiFu4
	UYihH1P5b0c36dh3Zzr3xlBvsFxzvci/z1sWUBC6HDLggdtRKKNOIXttnJlfXWO2PHBr/aAmQNS
	pidkQQV4/kafGlHcHfpYy+AiN0O4tbmaam1ub5nuTkd0KcR8D0R+fo9scWyBkvz+ICK7Tqv2CeV
	+HvzX4zg9dHKUuc9fDbB9rw/XUVWWiMPGQBlLMfi3w6R4yiBPn4gEEBUFDIk0tlyXAcWZY1NP5a
	BAfTZMSim8yF+J4DWz+VNoiKzxzOmOiK1LVuvV5hiIh7gdRB6q+9p4myMWDDxXollOvX7OlwTnj
	+UvP7eijSA/LWY1928rJ3IxOmP4Kc24JYcnqWIinR3So6q7SXrDnxaJ9gEGyTjSuDdRaufUsGhf
	nezD2s=
X-Received: by 2002:a05:6214:3007:b0:8ac:aa89:6bb0 with SMTP id 6a1803df08f44-8b3ee990841mr57214366d6.11.1777485374954;
        Wed, 29 Apr 2026 10:56:14 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:cdc9:3f29:858c:a856])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef8422a4sm29658796d6.41.2026.04.29.10.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:56:14 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: sh_css_mmu: fix typo in sh_css_mmu.c
Date: Wed, 29 Apr 2026 13:55:09 -0400
Message-Id: <20260429175509.6306-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 76EC44985F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-60001-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mahamaryamjavaid@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

Fix spelling mistake: Suppres -> Suppress

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mmu.c b/drivers/staging/media/atomisp/pci/sh_css_mmu.c
index f2a84c1d6e52..f2838e40617a 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mmu.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mmu.c
@@ -25,7 +25,7 @@ ia_css_mmu_invalidate_cache(void)
 	if (sh_css_sp_is_running()) {
 		HIVE_ADDR_ia_css_dmaproxy_sp_invalidate_tlb = fw->info.sp.invalidate_tlb;
 
-		(void)HIVE_ADDR_ia_css_dmaproxy_sp_invalidate_tlb; /* Suppres warnings in CRUN */
+		(void)HIVE_ADDR_ia_css_dmaproxy_sp_invalidate_tlb; /* Suppress warnings in CRUN */
 
 		sp_dmem_store_uint32(SP0_ID,
 				     (unsigned int)sp_address_of(ia_css_dmaproxy_sp_invalidate_tlb),
-- 
2.34.1


