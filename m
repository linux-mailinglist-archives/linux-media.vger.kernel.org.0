Return-Path: <linux-media+bounces-64248-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PTEhOQocJ2odsAIAu9opvQ
	(envelope-from <linux-media+bounces-64248-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 21:46:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 438FF65A238
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 21:46:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=UINqabH2;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64248-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64248-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80981301D052
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 19:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384463E7141;
	Mon,  8 Jun 2026 19:43:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f202.google.com (mail-qt1-f202.google.com [209.85.160.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9A03E63A8
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 19:43:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780947806; cv=none; b=HVEJVhvlabhC3LTwbLi0KIm3ywKKaOHgcE5s1sLKnWzW2eQou3S3k6rdwOj1Y695E0bGQ+VlGjK7N4ZvXYNrPK/qfFF7eSZ6ykoiPi4iF1nPe9s+xvEhq1jkeaI9h8nyW9O9VkAglf96iQI02NqlZJAjabnm4xsuY/C+wTqpjzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780947806; c=relaxed/simple;
	bh=gJ6qO82cunFkHH/YI0cpZWB+99vzwtO076qzoKQb8zA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=hPHxsOQoCCFLF11gqnVc1I+kp0b7hD7da617gLvlSg3wruwfO2VUkgx0hXVqNOY8j85KS9I9GX1INw4OQG+oTO8nbYYm/kJcR8I5bxah7yJ8PCiO6mMtgV1ZRJ43TrhevmvCRGLOBr8UW82VQ66sMrAUWJ7rMzi5B/etNnzr6LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xuehaohu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UINqabH2; arc=none smtp.client-ip=209.85.160.202
Received: by mail-qt1-f202.google.com with SMTP id d75a77b69052e-5174a236220so92971191cf.3
        for <linux-media@vger.kernel.org>; Mon, 08 Jun 2026 12:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780947804; x=1781552604; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v1WPgK4XhrSsWKxtc0VlcZjNH1lHogrTgrVmSMDXRnU=;
        b=UINqabH2uO+66H5EoeRt+plG6DMjsyTLma14AVhprh1pyA297JvCWI6zIVAYwRqp5s
         mqt5sVB92TzNwynHeLDSVfso6RLK8+1xtlXIwUbvGhPycf2Ji/KpXSlr4GPs9azZnGdj
         pDMX8TwNgK/1FlRUEQa49mT2cIkU/a8RxgxYqTMq99IWEyw9JB8g6g04xs/LomfbzdXj
         I6wW7NIAPLAPcRRwypRphYAvH7XcWeJ9TWiE+zpP5Ulweo0Erhl3Fln8nidCZbAVo02o
         CGXEOtWQvAVyW8xSZfLNfsU+zDyG7ivFKZ4+pxoh8R3WqzGrT5LQcLccqmI5VGnYqA9b
         MeBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780947804; x=1781552604;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v1WPgK4XhrSsWKxtc0VlcZjNH1lHogrTgrVmSMDXRnU=;
        b=oxQk2U7+tqFXxK9WDkzc6R9jI1DGcQGGS4JjU36rTNwPAh48FM19p2eDUS4gvmgWGS
         BfP/8BOk7G3orppIeSUGOhP9bl1POjMqpO+eVCfT3An0FbamA+WcQe8ixkE3UJWXUv2+
         9rRmvnmxGrwV8Tnd/ithwTV2fAlk5L5jAZFE+CkhrSmdxYCtddKacWOitGobjYXcGerT
         MuViIAMjJWWYX9UuYveiYYPh2AOMR/ppc0hv1QSb7xoUBWxpOpQMhCmmq/6t1VWzfi3s
         J12dlIq/WFug/cdCnBqY3RtERXa7D8xaQ9rWQox6qFgPIoR5ufylkLk+EMXZpl+q3oMN
         kzyw==
X-Forwarded-Encrypted: i=1; AFNElJ8rXHqBWp4EvmWfeUEVc/61fBipSKXUf73Ze0NI6tpkuBTac2DlPfOlZGNnz9RiqiK+d90VnS/a6+JyAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQMSY8lheuqrh0vXkp0ar9chxTQIe8FULm4kkY1dmMDYbVSNzL
	2jCbVH+YeBNIYWhs6vT76D1wcFsJO403oNdDU/PzYrh0mvsUvx/PimUZtty9KTf46vF0qKEdXdJ
	b/fp5EK4ZNZDd
X-Received: from qtss4-n2.prod.google.com ([2002:a05:622a:a9c4:20b0:517:85d0:ad3a])
 (user=xuehaohu job=prod-delivery.src-stubby-dispatcher) by
 2002:ac8:5cd1:0:b0:516:df62:bde3 with SMTP id d75a77b69052e-51795c47f23mr242075611cf.54.1780947803937;
 Mon, 08 Jun 2026 12:43:23 -0700 (PDT)
Date: Mon,  8 Jun 2026 19:43:21 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1064.gd145956f57-goog
Message-ID: <20260608194321.150838-1-xuehaohu@google.com>
Subject: [PATCH v6] dma-buf: Fix silent overflow for phys vec to sgt
From: David Hu <xuehaohu@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, 
	Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, jmoroni@google.com, 
	praan@google.com, David Hu <xuehaohu@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jgg@ziepe.ca,m:nicolinc@nvidia.com,m:leon@kernel.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:jmoroni@google.com,m:praan@google.com,m:xuehaohu@google.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[xuehaohu@google.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64248-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xuehaohu@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,intel.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 438FF65A238

In case MMIO size is bigger than 4G and peer2peer DMA goes
through host bridge, we trigger a code path that assigns the
total linked IOVA (which is greater than 4G) to mapped_len.

Previously, `mapped_len` was declared as 32-bit `unsigned int`.
When accumulating `size_t` lengths, this leads to a silent wrap-around.
This truncation causes truncated lengths to be passed to functions
like `fill_sg_entry()`.

Fix this by changing `mapped_len` to `size_t` (64-bit). While
at it, fix similar potential overflow issues in `calc_sg_nents`
by using `check_add_overflow()` for `nents` and using
`unsigned int` for the loop iterator in `fill_sg_entry` to match.

Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping routine")
Cc: stable@vger.kernel.org
Cc: iommu@lists.linux.dev
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: David Hu <xuehaohu@google.com>
---
Changes in v6:
 - Used `check_add_overflow()` in `calc_sg_nents()` for safer
   accumulation (Leon).
 - Dropped explicit `!nents` check and added a comment noting that
   `sg_alloc_table` handles `nents == 0` (Leon).
 - Collected Reviewed-by from Kevin Tian.

Changes in v5:
 - Removed WARN_ON_ONCE from calc_sg_nents() to avoid log noise (Jason).
 - Added explicit check for `!nents` in dma_buf_phys_vec_to_sgt() to
   cleanly return -EINVAL on overflow (Jason).

Changes in v4:
 - Added WARN_ON_ONCE() to the nents overflow check to prevent silent
   failures (Claude Bot).

Changes in v3:
 - Removed leftover sentence fragment from the commit message.
 - Kept `nents = 0` initialization (previously stated as removed in the
   v2 changelog) as it is strictly required for the `+=` accumulation
   loop in `calc_sg_nents()`.

Changes in v2:
 - Fixed 'IVOA' -> 'IOVA' typo and expanded commit message (Claude Bot).
 - Added Reverse Xmas tree formatting (Pranjal).
 - Folded in extra bounds checking for calc_sg_nents() (Pranjal).
 - Folded in type consistency fix for fill_sg_entry() (Pranjal).
 - Collected Reviewed-by from Pranjal Shrivastava.

 drivers/dma-buf/dma-buf-mapping.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
index 794acff2546a..67a8ff52fb8f 100644
--- a/drivers/dma-buf/dma-buf-mapping.c
+++ b/drivers/dma-buf/dma-buf-mapping.c
@@ -5,12 +5,13 @@
  */
 #include <linux/dma-buf-mapping.h>
 #include <linux/dma-resv.h>
+#include <linux/overflow.h>
 
 static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
 					 dma_addr_t addr)
 {
 	unsigned int len, nents;
-	int i;
+	unsigned int i;
 
 	nents = DIV_ROUND_UP(length, UINT_MAX);
 	for (i = 0; i < nents; i++) {
@@ -40,8 +41,11 @@ static unsigned int calc_sg_nents(struct dma_iova_state *state,
 	size_t i;
 
 	if (!state || !dma_use_iova(state)) {
-		for (i = 0; i < nr_ranges; i++)
-			nents += DIV_ROUND_UP(phys_vec[i].len, UINT_MAX);
+		for (i = 0; i < nr_ranges; i++) {
+			unsigned int added = DIV_ROUND_UP(phys_vec[i].len, UINT_MAX);
+			if (check_add_overflow(nents, added, &nents))
+				return 0;
+		}
 	} else {
 		/*
 		 * In IOVA case, there is only one SG entry which spans
@@ -95,9 +99,10 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
 					 size_t nr_ranges, size_t size,
 					 enum dma_data_direction dir)
 {
-	unsigned int nents, mapped_len = 0;
 	struct dma_buf_dma *dma;
 	struct scatterlist *sgl;
+	size_t mapped_len = 0;
+	unsigned int nents;
 	dma_addr_t addr;
 	size_t i;
 	int ret;
@@ -133,6 +138,8 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
 	}
 
 	nents = calc_sg_nents(dma->state, phys_vec, nr_ranges, size);
+
+	/* sg_alloc_table will cleanly fail and return -EINVAL if nents == 0 */
 	ret = sg_alloc_table(&dma->sgt, nents, GFP_KERNEL | __GFP_ZERO);
 	if (ret)
 		goto err_free_state;
-- 
2.54.0.1064.gd145956f57-goog


