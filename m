Return-Path: <linux-media+bounces-62968-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SK0XOV1vGGp6kAgAu9opvQ
	(envelope-from <linux-media+bounces-62968-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 18:37:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D22C5F515A
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 18:37:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 582D131021A7
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 16:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FEF730FF1E;
	Thu, 28 May 2026 16:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BgioBIqj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f201.google.com (mail-qt1-f201.google.com [209.85.160.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8020F2FB632
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 16:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779984009; cv=none; b=aBuFD1LxdYB2B/zwqVj0RIjBQo3IWcpqA8a3eBXzxNSva3NqUKQHhsSz2JH3hpV5+tABUHmOCMbuFcmOeEKmbkJlD7InRymyX1kfQw+F1V3pIDAgAdWlRfZs7MI5+3STyZ/AA+SdpqQpGjQrZZxFu5SsrcDF9eWFhGt/tN98/nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779984009; c=relaxed/simple;
	bh=k10mRhLr6t76p4jkzZqe4TGLVfCDjV4dlalSEfzSMXc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=SJUkqpo92md46iOAQh2f85XZVLTrdk2Vc8s3PP7ikElK4UCuxwqZwZjpXSb221ztUJLXlzfNMtnW+JJsicfrrmFsllOwXi57D4uSwwNUye2j104gZaLKF2IRWaIdRv6dpLNYxzjS/7/GrTCvpTD0LnWNdpOsIWXNasSTIn+mCms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xuehaohu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BgioBIqj; arc=none smtp.client-ip=209.85.160.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xuehaohu.bounces.google.com
Received: by mail-qt1-f201.google.com with SMTP id d75a77b69052e-516ceea1984so139117141cf.1
        for <linux-media@vger.kernel.org>; Thu, 28 May 2026 09:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779984007; x=1780588807; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MmPFy91yuYd+9nLUOi1wu2JWcf7o4ksos6H5oNntzCU=;
        b=BgioBIqjikS5YWrDib6V0VNppkXf1Q7CZEs+tgvrtcBff8sU2VM8hWbG0GCpggJcTs
         6SnoRbyV09kp9pyQ7Pso8s8POhbUKJCPI9i51EgYibG0ANjDyQ1iIpkgWabXVdshsSrF
         LcuScN4sBZpYnr/aRxbTFiP84JqmmAmI5ogQbbtnj0VMFIZmZL1nRQ6ezBTM0QF36Pno
         ErL9zO7OnzhNmi8d9QTVWgL8PWjRIt1a8PR6+0unKisPSDrDB4npy9a//SgYofAPL692
         XxA9dYdD2jDbhSoSmJ+zYeRGYKJCl+kWNnAshbHr5pr+RiW7ozeE+cGCqecGWjIeIXBJ
         HGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779984007; x=1780588807;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MmPFy91yuYd+9nLUOi1wu2JWcf7o4ksos6H5oNntzCU=;
        b=nuQ9YFIxNThrQTxmTT6yaxQssApzPVnkveZ9CSb1TYNDjwJu+WVZNVOydZurhtaq5I
         Ce2NqLpzR+PiUomQWSgbw1X9DyLLjzdH5RM5mU5jl4BKxf3IwuF8hIoVNB9KyrhnR2hA
         y0M291bvc92BhfR7H/9rRGPbzc8efoz5oLmVpIKY3DcXxcHTvmndR4kFDJJx3S6DTS31
         RiS3Zhvvlz+DChlgKsOabtJ0I0gEycusJJ+0Xohm1l982FL86+LY+H0lBgV3jv0U2Fm+
         ItGmcyHVYAIrS1C2SaKT/YEnMp2bclf6ALrlO4DLdM0rjVbd/cpPRchAIHgdnDG8/3Tz
         6CyQ==
X-Forwarded-Encrypted: i=1; AFNElJ+dn+pw25YdAxBAPBU6evPN/rHFUtTS/HXgA+sJqXSGZgnX8pUwfG0eXnDz/QR3QKwYxPXanEzbuJk9tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyceKb/HymOl8rjgT5UdNH/DVMdL51fdJuuBBeAt3EvPpG9WTUW
	WPgulOyf4JXXLvLR9qSU/nDC+YVn3FnlzFwu6I12wfSdtbvp+cH5k0Rt0kr/KMTrFYfW0EeZQtT
	36r15PM9mLrvd
X-Received: from qtxy12.prod.google.com ([2002:a05:622a:120c:b0:516:373e:a942])
 (user=xuehaohu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:1488:b0:516:d6a4:fd69 with SMTP id d75a77b69052e-516d6a4fe46mr371616761cf.12.1779984005890;
 Thu, 28 May 2026 09:00:05 -0700 (PDT)
Date: Thu, 28 May 2026 16:00:04 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <20260528160004.2452461-1-xuehaohu@google.com>
Subject: [PATCH v3] dma-buf: Fix silent overflow for phys vec to sgt
From: David Hu <xuehaohu@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, jmoroni@google.com, praan@google.com, 
	David Hu <xuehaohu@google.com>, stable@vger.kernel.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62968-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xuehaohu@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linux.dev:email]
X-Rspamd-Queue-Id: 8D22C5F515A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In case MMIO size is bigger than 4G and peer2peer DMA goes
through host bridge, we trigger a code path that assigns the
total linked IOVA (which is greater than 4G) to mapped_len.

Previously, `mapped_len` was declared as 32-bit `unsigned int`.
When accumulating `size_t` lengths, this leads to a silent wrap-around.
This truncation causes truncated lengths to be passed to functions
like `fill_sg_entry()`.

Fix this by changing `mapped_len` to `size_t` (64-bit). While
at it, fix similar potential overflow issues in `calc_sg_nents`
by using `size_t` for `nents` and checking against `UINT_MAX`
and using `unsigned int` for the loop iterator in `fill_sg_entry`
to match.

Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping routine")
Cc: stable@vger.kernel.org
Cc: iommu@lists.linux.dev
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: David Hu <xuehaohu@google.com>
---
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

 drivers/dma-buf/dma-buf-mapping.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
index 794acff2546a..5bc769fc42ea 100644
--- a/drivers/dma-buf/dma-buf-mapping.c
+++ b/drivers/dma-buf/dma-buf-mapping.c
@@ -10,7 +10,7 @@ static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
 					 dma_addr_t addr)
 {
 	unsigned int len, nents;
-	int i;
+	unsigned int i;
 
 	nents = DIV_ROUND_UP(length, UINT_MAX);
 	for (i = 0; i < nents; i++) {
@@ -36,7 +36,7 @@ static unsigned int calc_sg_nents(struct dma_iova_state *state,
 				  struct phys_vec *phys_vec, size_t nr_ranges,
 				  size_t size)
 {
-	unsigned int nents = 0;
+	size_t nents = 0;
 	size_t i;
 
 	if (!state || !dma_use_iova(state)) {
@@ -51,6 +51,9 @@ static unsigned int calc_sg_nents(struct dma_iova_state *state,
 		nents = DIV_ROUND_UP(size, UINT_MAX);
 	}
 
+	if (nents > UINT_MAX)
+		return 0;
+
 	return nents;
 }
 
@@ -95,9 +98,10 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
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
-- 
2.54.0.794.g4f17f83d09-goog


