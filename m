Return-Path: <linux-media+bounces-67596-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HdrKOBS+VmrbAgEAu9opvQ
	(envelope-from <linux-media+bounces-67596-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 00:54:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D95E775949A
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 00:54:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kOEzYcyk;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67596-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-67596-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8097A3001FB6
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2026 22:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817BA437467;
	Tue, 14 Jul 2026 22:52:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880CC431E76
	for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 22:52:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784069577; cv=none; b=RMg13bbotFSpMPFe4PYBqNz96ksb/IM9Wt2HT9d+b3gu/dGXGlQ5th7u4F69qOTZekAYA16RwrU6QSIRtvimDFMOxz0krzTUaxQt2Nt9ACquNxfMIf5SFbOUEXXUi5MRI/gdswQ/aGUgIc4CVieJlSlaY/cJydy8NnXWLFXVMEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784069577; c=relaxed/simple;
	bh=aneHEOEVTUFpxhruqbXN4fpzumP0voPWx/etkXlO+EI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nMKUx8Vy1Q4H+F/CNHklNKzbml4FWZ1LFYp3CJijlQ4bPOGSO7J5JhAo3ndtDGrQM+e8sjSfTPs1I/oeQ3LDmfn4op6bxczbDl3XoV21k1xwioSq0pge3ZeSdEHyAjmDThhq1nJzEAOJkpj9F1JTAKM6zspE/+z1ylvXZuY8lfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOEzYcyk; arc=none smtp.client-ip=74.125.224.47
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-664a09bc459so7700318d50.1
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 15:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784069575; x=1784674375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=huMAZLasX9MtSdlliVLSBQtahcShQoIS8BrLCB4qkoo=;
        b=kOEzYcykoVyyRJeDaA1L2sOv0jypIWaIjwBBfJAeZCILPC471LO6URqOm5pIHVamV9
         InKXPd5n9tq0p0+fWN4XxbMU+uGB0YkX21BaqO60rUokUrRdXn3DkHBDeUlJcSFeZrZT
         9vbyGy+o8yNoAm8R9fs2uwPqcLHm2BfjvFymPnTN3K90qiP99WLfeMSUUTvAw2aAru1L
         MIc++u+5ZYcgrXRsdABwcHMl5Kx4nZmDLeRafOhfvHvuAAtP63JT6bDGMmBTQPNR+x+j
         Xa4nnWBxKM/cs+8M7P8FhOUtiTvvOSHpfd7Uvvg0mxV1pnJQuENRAv+qJDko4KgKCcK4
         7rdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784069575; x=1784674375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=huMAZLasX9MtSdlliVLSBQtahcShQoIS8BrLCB4qkoo=;
        b=ecGtsxK5G0Y1WOdl9f7mafMH4mgUKSuf/IQdWXqbPtzaZGBPmdj6MXIVNp4BwrG6Iu
         oln4LgMXPxc+1IgpmgfJaDhNcSiCm9hEV4NYSGCU3OgGXpcrYrfO9Hcahw5yBFiLvebi
         F5tF+9WMOA0XDiYDZFb+woAFF/pDJUzQQY6btmk+IG/sacJril5ib+GiEx0VFc6G1t25
         jb9GC6UrmaTBS54vRrfPWg7SYoUzQFJkWJbeQK6Znp4UETzxm3khMZ4fY0CKOcRSP1JA
         vmVoKwjU0c9hrqyviP62q+EYKIEdYFpX9JY5N2wWQmwUWtc5o8YCXQPrVsX7gALzOqIl
         Ho5g==
X-Forwarded-Encrypted: i=1; AHgh+RqnNLqnvegcJ43XBRjRAKik2uL08sHAp+E3WommqHy6fclWyKbdc2Jd0El+VN2shICjZ//aPRbtJZHmbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3ki45AyVUJUexvzgSy+GKQGa7ItH9gNFc2Fa8feqlJS0uWlVt
	4UyAxUhP77ueRrNFNLHgvrON3Mj0tF80d9E1K3jmRM/oIWXuszwhc6Fg
X-Gm-Gg: AfdE7cnnhknKKUVquZtJTrgZsR/qC2yf+j6dG77EBMECoVyI/gTcsKrSo00MT6sWFBd
	fTjo2/g1WwXd7RfVzFJXgv5fjjcOs7POrroUsGVjBnNvlZ8hr0n9yN1WVKqg0gDpefuhx6BhEci
	aXZT/VnBInB42Ch8IKHVykk2qNp80TOdoszy3czsM3v3gmzecWsmczpmUHDWVhEDstTGo7zYwQg
	h2tsw8DA5OALbFJCx7I+HGpIxmjZBG3H+RVBmt8KwaParM+TzkMvfpiln24ywIkV25fjUYLqiVe
	U0+9ogV9HgDfRbKk+KwfV9IMVOr9ZkEA2N59FNH9DFwW/Wj0ZRFbb0GHKe3MuKF3zMRn+nHCmhs
	W0GlmwLDT6h6sEU+f6t2QHXrf+ftb5ujV1XWeXexeLIoVSIoYcZ/IrdVRXN/sTU4QZO8RG2f7PE
	l6PcUDKX+VgZy2U/OOGmFJwQyw5PDKcWWDRB434Pcwd+h6Ar5lvQ134ufYWa/H/FJJVR83+K+Jb
	kSs
X-Received: by 2002:a05:690c:4507:b0:7e8:6a6a:dc11 with SMTP id 00721157ae682-81ecf86d451mr4640387b3.19.1784069575635;
        Tue, 14 Jul 2026 15:52:55 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:a510:f4e7:1a8:cf71])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c249b87sm153446897b3.49.2026.07.14.15.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:52:55 -0700 (PDT)
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
Subject: [PATCH v4 3/3] staging: media: atomisp: drop redundant out-of-memory messages
Date: Tue, 14 Jul 2026 19:49:02 -0300
Message-ID: <20260714225235.47134-4-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
References: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:feng@innora.ai,m:~lkcamp/patches@lists.sr.ht,m:linux-kernel-mentees@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67596-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[rodrigogobbi7@gmail.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rodrigogobbi7@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D95E775949A

On allocation failure the memory management core already emits a
detailed warning, so the driver's own IA_CSS_ERROR("out of memory")
lines add nothing but noise.

Remove them; the error handling itself is left unchanged.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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


