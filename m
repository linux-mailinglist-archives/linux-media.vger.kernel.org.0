Return-Path: <linux-media+bounces-65486-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aasPGLwEO2pzOggAu9opvQ
	(envelope-from <linux-media+bounces-65486-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 00:12:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB716BA5AC
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 00:12:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=e9KpD0Po;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65486-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65486-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCA0B309D1BE
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 22:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4FB3C3459;
	Tue, 23 Jun 2026 22:10:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2339B3C2BA4
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 22:10:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782252646; cv=none; b=gmeAbGuYkTc8hG0/r1bORzQRjgF0EIxg/AZonUzAIWX/u40Pa6SCzRwk1NnAKGBHpiDQkpVhqDmRqFi+V7hyuoX2k3xPJa7VS+igd2FjNfZN5fE/aH8RnyXLCWzh5hCAzRrv8UyfqCrfY+KUhT8ITwfgh2iJ6XpBbtA1zGCTHWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782252646; c=relaxed/simple;
	bh=5Quy3AwSC2bBXWPKe5RE+1ZzgFALSjzDTW6lstWMxQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J6r0LfxbLguG3dSVkG+rOA6O0Jh1/xg2xtRfzwkbjU1jHfE39U6lNeVrianIk5zWh6A3j+GyS3SukOmSluhsQGZjAhSS3hDYGO7FKC4i1QODYMQuAy6E80/eYfCMISQSjGmUBhW6KpCaB3vQ5bn9JcPy3cWxR5CYv5WXDY4g0E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9KpD0Po; arc=none smtp.client-ip=74.125.82.172
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30c6c8d7503so37389eec.0
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 15:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782252644; x=1782857444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4+uQXuijZnEK5sxR6O5Jnnm3H8Px01U81Fdw7NimSA=;
        b=e9KpD0PoKmgNEoogiStk/oxMH9zkIuDi100G5/Ld57AYgNW9lN5+hIJtGiNfEyvjoI
         eZ5YCGcl3cJPTpaOnOhdm+wvCD9fuTzzufUBjSx4f4Phtmt8+ektoXjsRwpD4Evu369X
         Va5zuvFq9MmfDTpWrJQxm8/+MfzfX/g5kAMm9Y/rPj8d60of2ZITKPOhyPsH4PLkZG+6
         1/OEgt7KRihnyNxIHwUsq/aspYovAZ/dQPZlt/7cwkC/MOSGY6yuX19me4bbSH/JUtnz
         SwdOIRqh2nWXDS7Z84Cr57cdV5YVW/cWeDqQIrM6F/8+E6cLzMqKIsOv6qNS5lYmepb0
         k+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782252644; x=1782857444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4+uQXuijZnEK5sxR6O5Jnnm3H8Px01U81Fdw7NimSA=;
        b=km0ufsMryvUkPDhQa68+oAMNsvb93bdyRmXNuAk4v3fLCBzhuOWKDoWPlrWkYxJjSq
         bTHuVmh5PMx1Q8hIlRx5LmgEmf9uPY3L1fZfcMLcNZo6FrIfmoHR1PKX4bOlE52PPxMf
         Hwsex6Qd+2jUSatpLsAOpvYnFVJLvBIHrRfTthRHp7JOaoRG7PWZRfdtFERlYaXYSMLw
         dNF37CbgyYiuuJt7rCg4PCVr0KQatrpW59ojsPQme7J5lTrV+P7pJKY8xfqWYgLF3GvH
         /TEFOd0M1S1FmoPUVsFwPXOizhE9IdWGi/65Zeu3BJ2Y5DJRSkTUEbs+43ykNClkSe/J
         Q9Mw==
X-Forwarded-Encrypted: i=1; AHgh+RpXSCP5oAGWqj1xFIdLIEVfTQwFcItUYvCeIJF+p3n7LHvX8J8szaVUp6ZJdUcKt1ilTyZCJES3eP06JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPZ8Jj2fTtrWWtldbP+gwdrCcyEu/13yAewU+V4xrXZc6kr6SX
	x3P1/4ZONmBprEQsaT+yrRR+qAYnh+wUziFN4+dMtHiB0/TsaEvwktxC
X-Gm-Gg: AfdE7clQJpSErYAhmZoJOyTu2ZZRkk2sLCSYFVr/O9sKTh3JK75J0kY33ppHfg2QAdn
	PplEyEMCBC+4zPSzykMQcYeIVkNOVst9FCsickVbw1PEl70AYjIE5UMe3QJ7kqnHlYaLixFUxfL
	WGdKFNxrpuCTAkJi/RWo7bAK6RB74MD5t4yZFgsUvWmTOQdWvMByZvSBPnxPsIQtOaIJQW+2oIJ
	5c9xw1PvVN3SNwpC+NreeTFU37vDl+0+62Dv56bFuFtBMRxc3YVwCkPEZGRjA6ZCbvLH0sxcveU
	kYlXA4jExJQKRh7mlt+Ub5xC7DW/PvzhLoeMGz36NY7zYsc+RrtEEf5NOyH9qaHRCq919PuGmgK
	5XzCCvS2lyf5gdO7oJghphiYTarpgkDomsSsfffqCnRS1rIPCxEKCT1L/ql9CJ4BFlDe/VdftYC
	K+bj5RTDSFKuM8MwNXN18og3STPhZg4SnPqBR0kJkVU7p+qYCofknKMArzP+wu0FRuUys=
X-Received: by 2002:a05:7301:685:b0:30c:38ed:46a5 with SMTP id 5a478bee46e88-30c69394a09mr987617eec.30.1782252644170;
        Tue, 23 Jun 2026 15:10:44 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:c10d:2699:12a0:58d6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c5178a68dsm9059903eec.22.2026.06.23.15.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:10:43 -0700 (PDT)
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
Subject: [PATCH v3 2/3] staging: media: atomisp: use kvmalloc_objs() for overflow-safe allocation
Date: Tue, 23 Jun 2026 19:09:27 -0300
Message-ID: <20260623221028.40238-3-rodrigo.gobbi.7@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-65486-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: ABB716BA5AC

From: Feng Ning <feng@innora.ai>

Replace open-coded width * height * sizeof() multiplications with
kvmalloc_objs() and array_size() to prevent integer overflow in buffer
allocations.

The atomisp driver computes DVS and statistics buffer sizes using
unchecked arithmetic.  When dimensions are large, the product can
silently wrap, causing kvmalloc() to allocate an undersized buffer.

kvmalloc_objs() uses size_mul() internally, which saturates to SIZE_MAX
on overflow, so kvmalloc() returns NULL instead of succeeding with too
few bytes.  array_size() provides the same overflow protection for the
two-factor dimension products.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Feng Ning <feng@innora.ai>
[rodrigo: rebased; convert only the sites left open-coded after
   commit d178c7ca8fef]
Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
 .../staging/media/atomisp/pci/sh_css_params.c | 101 +++++++-----------
 1 file changed, 36 insertions(+), 65 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 8420a22fd8f0..adc329be8b0b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -6,6 +6,7 @@
 
 #include <linux/overflow.h>
 #include <linux/math.h>
+#include <linux/slab.h>
 
 #include "gdc_device.h"		/* gdc_lut_store(), ... */
 #include "isp.h"			/* ISP_VEC_ELEMBITS */
@@ -4151,7 +4152,7 @@ struct ia_css_3a_statistics *
 ia_css_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
 {
 	struct ia_css_3a_statistics *me;
-	int grid_size;
+	size_t grid_size;
 
 	IA_CSS_ENTER("grid=%p", grid);
 
@@ -4162,8 +4163,8 @@ ia_css_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
 		goto err;
 
 	me->grid = *grid;
-	grid_size = grid->width * grid->height;
-	me->data = kvmalloc(grid_size * sizeof(*me->data), GFP_KERNEL);
+	grid_size = array_size(grid->width, grid->height);
+	me->data = kvmalloc_objs(*me->data, grid_size);
 	if (!me->data)
 		goto err;
 	/* No weighted histogram, no structure, treat the histogram data as a byte dump in a byte array */
@@ -4236,6 +4237,7 @@ struct ia_css_dvs_coefficients *
 ia_css_dvs_coefficients_allocate(const struct ia_css_dvs_grid_info *grid)
 {
 	struct ia_css_dvs_coefficients *me;
+	size_t cnt;
 
 	assert(grid);
 
@@ -4245,15 +4247,13 @@ ia_css_dvs_coefficients_allocate(const struct ia_css_dvs_grid_info *grid)
 
 	me->grid = *grid;
 
-	me->hor_coefs = kvmalloc(grid->num_hor_coefs *
-				 IA_CSS_DVS_NUM_COEF_TYPES *
-				 sizeof(*me->hor_coefs), GFP_KERNEL);
+	cnt = array_size(grid->num_hor_coefs, IA_CSS_DVS_NUM_COEF_TYPES);
+	me->hor_coefs = kvmalloc_objs(*me->hor_coefs, cnt);
 	if (!me->hor_coefs)
 		goto err;
 
-	me->ver_coefs = kvmalloc(grid->num_ver_coefs *
-				 IA_CSS_DVS_NUM_COEF_TYPES *
-				 sizeof(*me->ver_coefs), GFP_KERNEL);
+	cnt = array_size(grid->num_ver_coefs, IA_CSS_DVS_NUM_COEF_TYPES);
+	me->ver_coefs = kvmalloc_objs(*me->ver_coefs, cnt);
 	if (!me->ver_coefs)
 		goto err;
 
@@ -4277,6 +4277,7 @@ struct ia_css_dvs2_statistics *
 ia_css_dvs2_statistics_allocate(const struct ia_css_dvs_grid_info *grid)
 {
 	struct ia_css_dvs2_statistics *me;
+	size_t cnt;
 
 	assert(grid);
 
@@ -4286,59 +4287,37 @@ ia_css_dvs2_statistics_allocate(const struct ia_css_dvs_grid_info *grid)
 
 	me->grid = *grid;
 
-	me->hor_prod.odd_real = kvmalloc(grid->aligned_width *
-					 grid->aligned_height *
-					 sizeof(*me->hor_prod.odd_real),
-					 GFP_KERNEL);
+	cnt = array_size(grid->aligned_width, grid->aligned_height);
+
+	me->hor_prod.odd_real = kvmalloc_objs(*me->hor_prod.odd_real, cnt);
 	if (!me->hor_prod.odd_real)
 		goto err;
 
-	me->hor_prod.odd_imag = kvmalloc(grid->aligned_width *
-					 grid->aligned_height *
-					 sizeof(*me->hor_prod.odd_imag),
-					 GFP_KERNEL);
+	me->hor_prod.odd_imag = kvmalloc_objs(*me->hor_prod.odd_imag, cnt);
 	if (!me->hor_prod.odd_imag)
 		goto err;
 
-	me->hor_prod.even_real = kvmalloc(grid->aligned_width *
-					  grid->aligned_height *
-					  sizeof(*me->hor_prod.even_real),
-					  GFP_KERNEL);
+	me->hor_prod.even_real = kvmalloc_objs(*me->hor_prod.even_real, cnt);
 	if (!me->hor_prod.even_real)
 		goto err;
 
-	me->hor_prod.even_imag = kvmalloc(grid->aligned_width *
-					  grid->aligned_height *
-					  sizeof(*me->hor_prod.even_imag),
-					  GFP_KERNEL);
+	me->hor_prod.even_imag = kvmalloc_objs(*me->hor_prod.even_imag, cnt);
 	if (!me->hor_prod.even_imag)
 		goto err;
 
-	me->ver_prod.odd_real = kvmalloc(grid->aligned_width *
-					 grid->aligned_height *
-					 sizeof(*me->ver_prod.odd_real),
-					 GFP_KERNEL);
+	me->ver_prod.odd_real = kvmalloc_objs(*me->ver_prod.odd_real, cnt);
 	if (!me->ver_prod.odd_real)
 		goto err;
 
-	me->ver_prod.odd_imag = kvmalloc(grid->aligned_width *
-					 grid->aligned_height *
-					 sizeof(*me->ver_prod.odd_imag),
-					 GFP_KERNEL);
+	me->ver_prod.odd_imag = kvmalloc_objs(*me->ver_prod.odd_imag, cnt);
 	if (!me->ver_prod.odd_imag)
 		goto err;
 
-	me->ver_prod.even_real = kvmalloc(grid->aligned_width *
-					  grid->aligned_height *
-					  sizeof(*me->ver_prod.even_real),
-					  GFP_KERNEL);
+	me->ver_prod.even_real = kvmalloc_objs(*me->ver_prod.even_real, cnt);
 	if (!me->ver_prod.even_real)
 		goto err;
 
-	me->ver_prod.even_imag = kvmalloc(grid->aligned_width *
-					  grid->aligned_height *
-					  sizeof(*me->ver_prod.even_imag),
-					  GFP_KERNEL);
+	me->ver_prod.even_imag = kvmalloc_objs(*me->ver_prod.even_imag, cnt);
 	if (!me->ver_prod.even_imag)
 		goto err;
 
@@ -4377,51 +4356,43 @@ ia_css_dvs2_coefficients_allocate(const struct ia_css_dvs_grid_info *grid)
 
 	me->grid = *grid;
 
-	me->hor_coefs.odd_real = kvmalloc(grid->num_hor_coefs *
-					  sizeof(*me->hor_coefs.odd_real),
-					  GFP_KERNEL);
+	me->hor_coefs.odd_real = kvmalloc_objs(*me->hor_coefs.odd_real,
+					       grid->num_hor_coefs);
 	if (!me->hor_coefs.odd_real)
 		goto err;
 
-	me->hor_coefs.odd_imag = kvmalloc(grid->num_hor_coefs *
-					  sizeof(*me->hor_coefs.odd_imag),
-					  GFP_KERNEL);
+	me->hor_coefs.odd_imag = kvmalloc_objs(*me->hor_coefs.odd_imag,
+					       grid->num_hor_coefs);
 	if (!me->hor_coefs.odd_imag)
 		goto err;
 
-	me->hor_coefs.even_real = kvmalloc(grid->num_hor_coefs *
-					   sizeof(*me->hor_coefs.even_real),
-					   GFP_KERNEL);
+	me->hor_coefs.even_real = kvmalloc_objs(*me->hor_coefs.even_real,
+						grid->num_hor_coefs);
 	if (!me->hor_coefs.even_real)
 		goto err;
 
-	me->hor_coefs.even_imag = kvmalloc(grid->num_hor_coefs *
-					   sizeof(*me->hor_coefs.even_imag),
-					   GFP_KERNEL);
+	me->hor_coefs.even_imag = kvmalloc_objs(*me->hor_coefs.even_imag,
+						grid->num_hor_coefs);
 	if (!me->hor_coefs.even_imag)
 		goto err;
 
-	me->ver_coefs.odd_real = kvmalloc(grid->num_ver_coefs *
-					  sizeof(*me->ver_coefs.odd_real),
-					  GFP_KERNEL);
+	me->ver_coefs.odd_real = kvmalloc_objs(*me->ver_coefs.odd_real,
+					       grid->num_ver_coefs);
 	if (!me->ver_coefs.odd_real)
 		goto err;
 
-	me->ver_coefs.odd_imag = kvmalloc(grid->num_ver_coefs *
-					  sizeof(*me->ver_coefs.odd_imag),
-					  GFP_KERNEL);
+	me->ver_coefs.odd_imag = kvmalloc_objs(*me->ver_coefs.odd_imag,
+					       grid->num_ver_coefs);
 	if (!me->ver_coefs.odd_imag)
 		goto err;
 
-	me->ver_coefs.even_real = kvmalloc(grid->num_ver_coefs *
-					   sizeof(*me->ver_coefs.even_real),
-					   GFP_KERNEL);
+	me->ver_coefs.even_real = kvmalloc_objs(*me->ver_coefs.even_real,
+						grid->num_ver_coefs);
 	if (!me->ver_coefs.even_real)
 		goto err;
 
-	me->ver_coefs.even_imag = kvmalloc(grid->num_ver_coefs *
-					   sizeof(*me->ver_coefs.even_imag),
-					   GFP_KERNEL);
+	me->ver_coefs.even_imag = kvmalloc_objs(*me->ver_coefs.even_imag,
+						grid->num_ver_coefs);
 	if (!me->ver_coefs.even_imag)
 		goto err;
 
-- 
2.48.1


