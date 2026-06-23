Return-Path: <linux-media+bounces-65487-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vmHGHfIEO2qGOggAu9opvQ
	(envelope-from <linux-media+bounces-65487-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 00:13:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F41C6BA5B9
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 00:13:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Bxb/D2/A";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65487-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65487-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B04230C36D4
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 22:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15903C3BF3;
	Tue, 23 Jun 2026 22:10:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94703C3429
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 22:10:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782252650; cv=none; b=qAd7c76Axs4qt1DlQUQPyJXwDvaZBD08Gd4f7PgTHJ7duLDQzvjrnRszgVacuaKNOpZwzuFQKmhxQlKABOB3JiDbaiGA5S5OJnordhdDq6vElGuQbK3D6pcnC15wFoHs0ZOf+MiGl38t5zxr0xVh6qil8ZfRsvWJC3kYlzlLHfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782252650; c=relaxed/simple;
	bh=CLlY5yDoMSKTXAg15Hqh1YMdL5qX4NCHKFH0B5SFS6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bujFSWA3FbfssPgkuDIE4j+sntzGxPqqJHpamgPgYU8qCE9Ee5MAlzU+SGdnX3L5pD964VVwrYYDNIKTTiGUmcLMFhRrEoUEHjxXV7hfmzus+zUHtjOCU+hirkAKmCj9zrcwtKeWOZWDmeBjg1lyydSx3NumRq+O8z/9138PLbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bxb/D2/A; arc=none smtp.client-ip=74.125.82.179
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3078e0dcd67so443513eec.0
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 15:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782252648; x=1782857448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfgVBc/XSNTUAUKRc0vevXswDdgkcM0JGJwtpxvQCG8=;
        b=Bxb/D2/ATOp342vRuec2tz8ceIA9vlbZpZ0wpK47Ep+IFEh2PRX0WAliXPZf/bp/n3
         VmRSWI+8hPeHKo9DTrqIs6ASdB5Y0y9TLjZl1eKB8xUAaN8o3y6GuY6Jc3ZsVMpzzfkY
         hHAI4H+Q+dfLzzkf0i2OzZEtBt7RBx3pG8vWkU64J3+UXQxrSVQdsYFEpWGXgF0v3CVZ
         NDcrBMWN3k0kxIg/+D1UhJ7NhNKxP1i52C5D1x1Qy1sD43UcinZTCXsBiL7GaJvAVnlr
         WxUfBThLf7hOootL+hJ3EhnvYSVqHcsJUrPZddQOk0J+ik49rDyraYQPl/H2h2DnYflP
         asAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782252648; x=1782857448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lfgVBc/XSNTUAUKRc0vevXswDdgkcM0JGJwtpxvQCG8=;
        b=dDj8GVI2gJ9Nw9G81SdaoAeDheXWppJd+7wFimeVvRXjB+vcafu4V6P5nwJtuD8LFP
         Z2P9gD+xGP9adSFjwSp6Yd1b+5zo49pwUQJgo/uoOez0CoCmzCz8dNo6svtv+JtqBp3p
         LFIyJsAmf29UwShCP3r9/+nM/X++slXW97vgX8AnCxeDVzTPMpLKo/gk+rLLg24xfYjC
         r+QgiU57ITDR7fj8x9NoyHcrmY8CO0xrF1evhzmjbAzsjflLkiZEKGKpsttCF9lW8gYw
         YIbbA4y49J7j2mwX6LAvUALWOlePVFymEEixLLVYD09zEHNN8hD+3JTNBmVCzwfNs/ZU
         WRVA==
X-Forwarded-Encrypted: i=1; AHgh+Rqs1zcmKisSgJg65Z66bVJICKAsCII+0AnHWMqJ5yus4RsKRpL5De3tl0eqdBjXVI0EChtphxGqz238GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUeTxw+WdNImr4Xg7kZ4vZNmdEphc98be7qKQThVKO5WgBWxPT
	EX0tP8uvytIizI7R3nbuJZaey2Z8nJNehIfCiQfI2sC32ZDHldv9uz3M
X-Gm-Gg: AfdE7cnDlL3WU7xVjNi4LG95kzeNbfVaaQn68ALb5tStfpSVFnx/8bkouICYgx31I2N
	5phXeHjqskpAas+0+iXW1r8OjA7WCsM2EuECluPe8nqKxjVZt9wKVMMR7V3JfZfvHDGC/Ll/EWz
	K9EIbue2t0NXZyd2IayC9qy3EmEcYr98TTcqT8ImIen/EXNWVzTB4NPKNJXyNjDGhsTV7A12PS/
	pdZDPQH57VJpW9HqiEPF5EeF4bMOzMTnH0ydk8WjLlZscLdsHZ340iDwey973uU1dK33hdFG22E
	QxxICG2zmygh9ei5vYXcKu7kUUEW6SkbegrHTBLrpGSNcZBISHj3KQUrGz2X4QOTaZKquKgcVAY
	FNTY9j/VdK6xBbZqP+ysTdvAU2oyGD0cQah5DDe0/GNnDwmsxlsSl8Lt68hIfwTnB8I1D9Md0eL
	9lQwI2fdhZiZo3ZccL/ZstSjZXXdn2TEPGKUxnwvfMj2bDJvdboN4Mo2KJ6HQzWyDQEdI=
X-Received: by 2002:a05:7300:214b:b0:2ed:e14:42e9 with SMTP id 5a478bee46e88-30c68ec5a61mr1210948eec.34.1782252647728;
        Tue, 23 Jun 2026 15:10:47 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:c10d:2699:12a0:58d6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c5178a68dsm9059903eec.22.2026.06.23.15.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:10:47 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	feng@innora.ai
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 3/3] staging: media: atomisp: drop redundant out-of-memory messages
Date: Tue, 23 Jun 2026 19:09:28 -0300
Message-ID: <20260623221028.40238-4-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260623221028.40238-1-rodrigo.gobbi.7@gmail.com>
References: <20260623221028.40238-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:feng@innora.ai,m:~lkcamp/patches@lists.sr.ht,m:linux-kernel-mentees@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65487-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[rodrigogobbi7@gmail.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rodrigogobbi7@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F41C6BA5B9

On allocation failure the memory management core already emits a
detailed warning, so the driver's own IA_CSS_ERROR("out of memory")
lines add nothing but noise.

Remove them; the error handling itself is left unchanged.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_param_dvs.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
index ad2a9b84e232..c0102056d421 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
@@ -25,7 +25,6 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *frame_res,
 
 	dvs_config = kvmalloc_obj(struct ia_css_dvs_6axis_config);
 	if (!dvs_config)	{
-		IA_CSS_ERROR("out of memory");
 		err = -ENOMEM;
 	} else {
 		/*Initialize new struct with latest config settings*/
@@ -52,7 +51,6 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *frame_res,
 		dvs_config->xcoords_y = kvmalloc(array3_size(width_y, height_y, sizeof(uint32_t)),
 						 GFP_KERNEL);
 		if (!dvs_config->xcoords_y) {
-			IA_CSS_ERROR("out of memory");
 			err = -ENOMEM;
 			goto exit;
 		}
@@ -60,7 +58,6 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *frame_res,
 		dvs_config->ycoords_y = kvmalloc(array3_size(width_y, height_y, sizeof(uint32_t)),
 						 GFP_KERNEL);
 		if (!dvs_config->ycoords_y) {
-			IA_CSS_ERROR("out of memory");
 			err = -ENOMEM;
 			goto exit;
 		}
@@ -72,7 +69,6 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *frame_res,
 							      sizeof(uint32_t)),
 						  GFP_KERNEL);
 		if (!dvs_config->xcoords_uv) {
-			IA_CSS_ERROR("out of memory");
 			err = -ENOMEM;
 			goto exit;
 		}
@@ -81,7 +77,6 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *frame_res,
 							      sizeof(uint32_t)),
 						  GFP_KERNEL);
 		if (!dvs_config->ycoords_uv) {
-			IA_CSS_ERROR("out of memory");
 			err = -ENOMEM;
 		}
 exit:
-- 
2.48.1


