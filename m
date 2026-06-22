Return-Path: <linux-media+bounces-65422-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ri2FNwe7OWr5wgcAu9opvQ
	(envelope-from <linux-media+bounces-65422-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 00:45:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 417326B2B25
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 00:45:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YwaTf+9F;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65422-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65422-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 685F8304F2E5
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 22:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA25C37BE7C;
	Mon, 22 Jun 2026 22:44:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEE13537E0
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 22:44:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782168269; cv=none; b=fhA8pzzGczOcDpItdF9YppRzi5W5ve8cozpQpPqeYVDvimyv6/vmxKrL6XVYbWxLBLjd14L5DfHq6iU+pUKJUdXE+iv1Ie6e3wZnARjd0giUO1ZaFuaN+6Ws1L0VUWLwGhmtJhOZnm0diAJcQ6ys6qFlq261OGhkq+mvQKITHDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782168269; c=relaxed/simple;
	bh=bn1nCUdKY6brcFbeCzncsYtRcAG380V6bvWnypmIGuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dhFL97U0mDpNJNUqG9rOqVbgRr9a/yXwtG5fdpk9MghD9lXvj7gZk7nbMNA4wnZH6/aJrc3LLKnWtrc6cRicq0+IAuxor9IQo6fN7r7YrRtuY+RYKSimyYD/4rbIXcb4na3s3XRzYF1SUwcOJa0T2pFdbjtpPCxxNQHHFkHYlVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwaTf+9F; arc=none smtp.client-ip=74.125.82.178
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30c0a352e33so349606eec.0
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 15:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782168267; x=1782773067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SeMGMO5CHz03os8Q93xKr0Zz4ur/IPCKPm092KCihk=;
        b=YwaTf+9FrcFfliWgSPnYxmVVmnaddjaLi0RKxZvXSnJtClytfsvBefT+cuW2e+Qx03
         XcWCpe7x4ntNolyZotXFvgk9QoE8aitHm7HKkdvYiPUO/YFT7EKJhm+gHkWYHHHmbQ+o
         0NAqx8CKI9WgZm/3tf6bgGsIpm62BAKbmBgbPt45VkYxWE2TbKm4h7oVPCrAJNUNON+3
         eU8XY7iEACVunTaPew93k7UUMmSZ45rYs7qTN8vrl756BXC0SUeSj+Pj049HWGk0+4Hq
         Xj0AJa2W90yZgrV5gPlXjVOJnVc2QiJt4tLJvJLuVqNlMt/ZRjtXzHWz2Qwtw2/QdeUW
         yNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782168267; x=1782773067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6SeMGMO5CHz03os8Q93xKr0Zz4ur/IPCKPm092KCihk=;
        b=ONHxGTVlLAZDqQ8sc9IUou5EsNA2Dwj3Bo7nmLojn/mK8jmFdoLY4mHwf7w0T9qiDk
         ZssRJDeBATvMz2obHLetao0LjpqFBaBFIiWU3Kxt8th3UFOmOnZODcA/BuTwmkbCaCgU
         mos83PSNJWOA9SxiRAaBr5ByK5xowal5lXziPMvl5w5MNolLbbnrlQLbiX8xvbphwE7K
         CFyIYDUbhDXqguVvB8KGwHs+w8ys4Uh5XZ/6UP7PrK9NvY7Fnrw90ci5ohiLot7FfY+O
         kt+QLIQm3drs2w1/IqYybQmMEhAw/p6Fe2fViAixNCZnD7DkLIZNtpCmoSGSUYqXD66e
         r0oA==
X-Forwarded-Encrypted: i=1; AHgh+RreyYyJX3e1Lr9im6JPsgQw+FYT91UoWnRniP4nB+T83gRz7tTPIWqEP6cjGcrNNbKF7vImVQlxsA4hPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwc4q3ilQWZvE85hQ+upVihBFe2F8frL2kpCVB7jIOrfQl2EEc
	Mg/Hlaton6KdL2Q0xfGGBrmZoa5DA5NgjyYYLpcmjiOfve6yUQ9SSQdg
X-Gm-Gg: AfdE7cnryT0GDttNFFjMCxm/nXFqBjJeliNuAF/DwG3ZC5LKrP9St67ieLPPExjKI4j
	wP+vcXSJ2ZsuMC6YRBhQK996p6pJ+8gZHRMKi8rGCKS+0Hq8ilTg3d9MqgmtyStwqAXLiaJWcIG
	6bSpBpGHPlt//ZLTk3cNqHj/T9am97NaQO2B1Lut05iKLg2mmWIzrjSyUuKd6CEpiiriO5pjpQr
	qS6rI7ccElD7j86vVUKQ4+QJtN294Yh6/I4rUdMnH7qVj3mopM8PE8t0s0BwBZqp2b4PqrQUv5M
	dT14auSS6N97A+t1FNFQeE2FAZh8wM3JrRxTPZ//A26HjqcHo+aEIrvXEwhQH51pQZYc7LWGg+H
	PmcSjLuDGzeXJ6IBaxxwrSW3NVrxoOGx7pijnaOTNCVn+r/NFyUNEKQt4b3l4DgbxzvaUF89Boh
	tJlemLi8ghnIV3nyVYECfHm3o8LsBnjPsuPouUJAJTfs7N/tqpUcmC4WKfpXVF823HaNc=
X-Received: by 2002:a05:7300:642a:b0:2c9:ee15:a0ee with SMTP id 5a478bee46e88-30c555b8663mr1075252eec.12.1782168266974;
        Mon, 22 Jun 2026 15:44:26 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:691c:629b:eda4:7c2e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba1c376sm13087954eec.3.2026.06.22.15.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 15:44:26 -0700 (PDT)
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
Subject: [PATCH v2 2/3] staging: media: atomisp: use kvmalloc_objs() for overflow-safe allocation
Date: Mon, 22 Jun 2026 19:42:43 -0300
Message-ID: <20260622224402.34001-3-rodrigo.gobbi.7@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:gregkh@linuxfoundation.org,m:~lkcamp/patches@lists.sr.ht,m:linux-kernel-mentees@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65422-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 417326B2B25

Several allocations in sh_css_params.c still size their buffers with
open-coded multiplication (e.g. width * height * sizeof(*p)), which can
silently overflow and under-allocate.

Convert them to kvmalloc_objs() with array_size(), which saturate to
SIZE_MAX on overflow so kvmalloc() returns NULL instead of allocating
too few bytes.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
 .../staging/media/atomisp/pci/sh_css_params.c | 101 +++++++-----------
 1 file changed, 36 insertions(+), 65 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 8420a22fd8f0..50dbda6b3f0a 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -6,6 +6,7 @@
 
 #include <linux/overflow.h>
 #include <linux/math.h>
+#include <linux/slab.h>
 
 #include "gdc_device.h"		/* gdc_lut_store(), ... */
 #include "isp.h"			/* ISP_VEC_ELEMBITS */
@@ -4151,7 +4152,6 @@ struct ia_css_3a_statistics *
 ia_css_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
 {
 	struct ia_css_3a_statistics *me;
-	int grid_size;
 
 	IA_CSS_ENTER("grid=%p", grid);
 
@@ -4162,8 +4162,8 @@ ia_css_3a_statistics_allocate(const struct ia_css_3a_grid_info *grid)
 		goto err;
 
 	me->grid = *grid;
-	grid_size = grid->width * grid->height;
-	me->data = kvmalloc(grid_size * sizeof(*me->data), GFP_KERNEL);
+	me->data = kvmalloc_objs(*me->data,
+				 array_size(grid->width, grid->height));
 	if (!me->data)
 		goto err;
 	/* No weighted histogram, no structure, treat the histogram data as a byte dump in a byte array */
@@ -4245,15 +4245,15 @@ ia_css_dvs_coefficients_allocate(const struct ia_css_dvs_grid_info *grid)
 
 	me->grid = *grid;
 
-	me->hor_coefs = kvmalloc(grid->num_hor_coefs *
-				 IA_CSS_DVS_NUM_COEF_TYPES *
-				 sizeof(*me->hor_coefs), GFP_KERNEL);
+	me->hor_coefs = kvmalloc_objs(*me->hor_coefs,
+				      array_size(grid->num_hor_coefs,
+						 IA_CSS_DVS_NUM_COEF_TYPES));
 	if (!me->hor_coefs)
 		goto err;
 
-	me->ver_coefs = kvmalloc(grid->num_ver_coefs *
-				 IA_CSS_DVS_NUM_COEF_TYPES *
-				 sizeof(*me->ver_coefs), GFP_KERNEL);
+	me->ver_coefs = kvmalloc_objs(*me->ver_coefs,
+				      array_size(grid->num_ver_coefs,
+						 IA_CSS_DVS_NUM_COEF_TYPES));
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


