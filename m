Return-Path: <linux-media+bounces-65423-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YPDMMe+6OWr0wgcAu9opvQ
	(envelope-from <linux-media+bounces-65423-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 00:45:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9866B2B1F
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 00:45:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ADrkBVuu;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65423-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65423-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4444B304FAE0
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 22:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F11137BE7F;
	Mon, 22 Jun 2026 22:44:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B130837BE60
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 22:44:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782168274; cv=none; b=fk+eg531uicO5NUtWeaHUzEfNAz+P9jl5rYdD//Fcq0EBZ4FZB86vif1nuBHnGYknzfOPIwiAVOfRNQvm4IrBfCNV71fvU5rgtCFee+Z9RmymvLEwEZDIvUZSfBbbwAnoqqXhbzWedIKNKp2L7HmVLDNSfQ57M+GN72mXocXAPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782168274; c=relaxed/simple;
	bh=ZfxkuR/9Vuef1Q22juZJ6EBv0iqn5LNDE8SSCqmYfWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aBcfhFDo+AVyCKhifWykG9BYcnqx244YKomOwzyYEbCpp+wjCMZpdSCKZ4RJ1KhjENfYaOEbBAOtwUKGbYACHwLV0ALbR7FPHMX9zV0ABKlfo0Ht7SzTXlhdAXFw5sKkyBVxKufGpRevRuK8ef/uRgaWZ7kDp3ZAho+RZ+HLRZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADrkBVuu; arc=none smtp.client-ip=74.125.82.177
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3042a388168so336272eec.1
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 15:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782168272; x=1782773072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fjpcGprWwQ0lr9GK2KFC92iw63YTslpmj1gCXP7xFg=;
        b=ADrkBVuuX9uACZYGVxUP8dHAARG6Pd3xb8mqZrfgPDInRJ0Oe6aNKVk+XUr8QKK6h8
         JPf8MaZkwnW1Mz5iDt7GqskJgVFUgpUdKY4RGWBcL5OC7y0dY1q/S3JQzYB56deWubTT
         gr+NlA0vE7mN8eXv/ed6sYCgd9H2x6bfp+BPjg8UDEZP3tN9y8DJxe2GNJtqOU1pkojU
         KUPMwzANLGTKmvjdGJ+X8IZEW1GJoWvfpIyayJ5Vh9H9rqRIu5nsv5QEPQsiaF0MOh9R
         rsB7IKDf4KbWQPk6PZtDzLIWq2bVPLCPFVkgPaE74y5guKNl9h3zG535hU5EUwl6fa6u
         G3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782168272; x=1782773072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7fjpcGprWwQ0lr9GK2KFC92iw63YTslpmj1gCXP7xFg=;
        b=DcqI4CcyeGXmrHNJcu3kuM1P6rlKGWgBYJgnvnhnZx9I5EraMTUWNO/Uq/7bnmuFMk
         5y276Si7tGIUiUZp7NkgHURiarOBoJ8TFYDOqADRaPOjEfHZ0ZarPdWaFSOZjDms7+wB
         A8ypngjTV99q0lFJ0f/DNmNujw7V6o+qUiT92WNDAi1u28MHljqFf19QmRPkyJMoH4v+
         y96254SUdo9SnQ3CTMh5ZMfqMVHC4yia30WGUKWoi+I9HgrEbkCofiVo7YRydWmc1aYM
         Dt+i4uJ+rSBZuQ94Zn3hrYXIzBLHi132EuXt0n/+dY5QGOgyFU4nvu8Pa8RnxeOUHvBl
         mZqw==
X-Forwarded-Encrypted: i=1; AHgh+Rp1R7ziqImUGWTBonTNfhpAZeA5V+m67gGDAnFMM1yHtMIxUBgkKK+/Lz5qX34IWIUsyJRP+IAfXZcOKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdIfbAb1yPjPAjbfBOTx4uknBQoIAdQ4LQgcOR4/LDEj6cnqLR
	yUd6WAZG/MFSP31I3K1O64wP9g0gu9crzxJSSOPxF3jNOxGSwz+2YA6p
X-Gm-Gg: AfdE7ckLGWeLZDgNGHjTNFKb4K3fpbQTwpZLLZ59Ig0X5zAzlP5YuR3aHi4DwtlDDDq
	l15h0PrVE+UNQkGQcVZl4OdBIMZgmjkZlO0R6mIq9uHBZOSK0kJw5V4AJf5S8wBf7CIMCRLdtiH
	fkXA1wH16X9jMriBomo6/MBVAif1wEkVkebj74w0iEDOGV4wbEI/q2gj7lrjkdb7vPadLy3FhsU
	zLgusbcrxgj9UJ+Y7U+7buKWtkxv7XglWXA//PXQ5vLguCUs4GgO474FORDUlgBv6YAdmavY/vk
	koebymtfhgCysY0ajo0gzcfiKl4gVMamVoFotlCUCq7t56SpSknJNp4vhwIPyLvMb+xnioYb0LA
	t9IG0aDY9KHV12XRNI9kZj5x3fLI+/j0Fq/9CH1NKYgk2Ly1y6wi7auOQ0Zv6uZ1eMt1QjjGmIB
	EFecvq9wLDXSjCyqSpeKK59TAG9WM0q56CWR/tSqbxFDH0NSuajETQj1JS97+1rb/UVAo=
X-Received: by 2002:a05:7300:7313:b0:304:cd0d:9ea5 with SMTP id 5a478bee46e88-30c555526ecmr1107469eec.7.1782168271573;
        Mon, 22 Jun 2026 15:44:31 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:691c:629b:eda4:7c2e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba1c376sm13087954eec.3.2026.06.22.15.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 15:44:31 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 3/3] staging: media: atomisp: drop redundant out-of-memory messages
Date: Mon, 22 Jun 2026 19:42:44 -0300
Message-ID: <20260622224402.34001-4-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260622224402.34001-1-rodrigo.gobbi.7@gmail.com>
References: <20260622224402.34001-1-rodrigo.gobbi.7@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:~lkcamp/patches@lists.sr.ht,m:linux-kernel-mentees@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65423-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[rodrigogobbi7@gmail.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rodrigogobbi7@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A9866B2B1F

On allocation failure the memory management core already emits a detailed
warning so driver's own IA_CSS_ERROR("out of memory") lines add nothing but noise.

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


