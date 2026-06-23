Return-Path: <linux-media+bounces-65428-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Wg1aM67nOWqoywcAu9opvQ
	(envelope-from <linux-media+bounces-65428-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 03:55:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4246B3700
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 03:55:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=TVgsc0sT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65428-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65428-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E601430611C5
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2026 01:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C5E385D8D;
	Tue, 23 Jun 2026 01:55:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f201.google.com (mail-qt1-f201.google.com [209.85.160.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B83385D8C
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 01:55:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782179705; cv=none; b=O0iIOWzfweLlwaouuNemOEujOlI0X8Rbzu37JI37tpUiEXMxN3zVHwehbNEeLsXNSMluqvI5G3VVmj7FGIfj1WqTmD5aF9xm7WdpRtfH7NmY31WS8RznN/N0Xczn9smrwvd1ZrP4BZHpFZ4FRoQfa7D9kRDQ47YYMDgmD/0Z26Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782179705; c=relaxed/simple;
	bh=bBWRORv7RUc8uRHv6zCGgvNd/JG4DiLB/oASlXLOQPs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L7DK3rX4sWWu+nKEBqVOjo55feVDlQjvjRZweleQgCoIf6VrtKxHssSLAR1/cl5l50x7Xtwxvj4SoK1lFqbiM8WSfD9ysE5OgVSjC4knuIhDLzU/DtpHVrlJzAaXpW1lARCp/8+JNvRWcZ4TrCOuRyJUaZqrB8MgB1gE2J4LEYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xuehaohu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TVgsc0sT; arc=none smtp.client-ip=209.85.160.201
Received: by mail-qt1-f201.google.com with SMTP id d75a77b69052e-519899abab8so100954991cf.2
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 18:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782179702; x=1782784502; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lkITz2dGNs54nij5ccY4KCvNRYJG4BpFQmrxgUXzmOc=;
        b=TVgsc0sTIDf3LSHX/MsKLkwwjnd2LZOOlBd0U8+/Z52q1GSIBRwWzmJiQFJA+HC+DP
         NwpBus+1F/xW819J8IgPepSE2YQUUSNM1wxtmbCFCVLrRU7Ei6aaQl9HlqDAN+Cpro4f
         Bx1/SNsm/nIYpqkGwgTH7lRZKXh55ilepG3RDnRXBP6DgpaS6YCd5+r68rp6qxC5j+4d
         4GaiC8f7Inyssj3LZTsgVaN6CnZ9VLfuM5dt4DaojjIbQ7E6rdivfH5FVVKFjGTM2LeX
         5ZVB0Yxf4c3tyqZ+glK+SJI4VLo2CUJZdW6PbJYscq2lYkKFR7VAqxE5pdOiHYNg7G29
         uEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782179702; x=1782784502;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lkITz2dGNs54nij5ccY4KCvNRYJG4BpFQmrxgUXzmOc=;
        b=S3dHhn0aTgTzZdqvvD3Rh5q0MnvrVwE8x0+YROCrhb+TGzVeDdy2OKG6cs1O9Qs6wO
         bmjuaaTcBpJGfk1F1MLGz8wEsY3QABthHxwBV1/7aa/hXoOqy9mgRfxrb3JXEt5/wNKy
         BbRJxK2/6FiVoxSsreQCWUEPAOa2D2JhxBozoLQspDoYLN++iaHHiPaAWULbtp37gwZX
         cisNfdmERWJabPDChhcLWY9yAUAEVRC6jBmstCZFviVeh227qzJMwlZFPIHKsurgHug7
         co9753Uvb2GwvnbE1P0+BTRpVm9Il0fsxTUC3gHLU8c3QLuEbAnnun3KAiW2aAGmXTLU
         KI0w==
X-Forwarded-Encrypted: i=1; AFNElJ/p2LbAcdKO/+wIZnF8mUVuSEe59cqUAx2cqSsBaaGrJu6S+5PUgTUzRa8vn6hBEEAxJPGpbZhm9OLTBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5gU3pUAOyc/dh+1602fSiP0CmPKkJC0Otg660HOSfwJmpahbP
	RB8hUO8U+wqJV2VDOrEY1hhOsMxmqLHHHaDG97UC8r0qOFyyakjJmX/Q/228yLrIjT8XcJ7XvyQ
	kVTDlk1CTx7Tb
X-Received: from qtxx9-n2.prod.google.com ([2002:a05:622a:aac9:20b0:517:96a4:99ea])
 (user=xuehaohu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:2609:b0:519:89f6:6ed4 with SMTP id d75a77b69052e-51a548b6418mr13414611cf.47.1782179701475;
 Mon, 22 Jun 2026 18:55:01 -0700 (PDT)
Date: Tue, 23 Jun 2026 01:54:59 +0000
In-Reply-To: <20260621222130.1667453-1-xuehaohu@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260621222130.1667453-1-xuehaohu@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260623015459.1153884-1-xuehaohu@google.com>
Subject: [PATCH v2] dma-buf: Split sgl into page-aligned 2G chunks
From: David Hu <xuehaohu@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>
Cc: David Laight <david.laight.linux@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Nicolin Chen <nicolinc@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Kevin Tian <kevin.tian@intel.com>, 
	Ankit Agrawal <ankita@nvidia.com>, Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, jmoroni@google.com, 
	praan@google.com, kpberry@google.com, chriscli@google.com, 
	sashiko-bot@kernel.org, stable@vger.kernel.org, 
	David Hu <xuehaohu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[xuehaohu@google.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65428-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:david.laight.linux@gmail.com,m:jgg@ziepe.ca,m:nicolinc@nvidia.com,m:leon@kernel.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:jmoroni@google.com,m:praan@google.com,m:kpberry@google.com,m:chriscli@google.com,m:sashiko-bot@kernel.org,m:stable@vger.kernel.org,m:xuehaohu@google.com,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xuehaohu@google.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,ziepe.ca,nvidia.com,kernel.org,intel.com,shazbot.org,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev,google.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F4246B3700

Currently, `fill_sg_entry()` splits the scatterlist using `UINT_MAX`.
This creates a non-page-aligned DMA length (`0xFFFFFFFF`) for the
first entry, resulting in non-page-aligned DMA addresses for all
subsequent entries.

While the underlying IOMMU mapping may be contiguous, hardware
DMA engines often require explicit address alignment (e.g., page,
cacheline, or storage sector boundaries). Passing unaligned
addresses and lengths can cause explicit failures in DMA descriptor
creation or silent data corruption if lower unaligned bits are
truncated.

Fix this by splitting the scatterlist into 2G chunks. An alternative
previously considered was to use the largest page aligned chunk within
`UINT_MAX` (`ALIGN_DOWN(UINT_MAX, PAGE_SIZE)`) to satisfy page
alignment. A 2G chunk is better as it naturally aligns with most known
hardware boundaries, while also allowing compiler optimizations with
simple bit shifts. This ensures all scatterlist DMA addresses and
lengths remain page aligned and satisfy hardware constraints.

Page-aligned entries allow the system to cleanly chunk payloads into
PCIe MaxPayloadSize (MPS) (e.g., 128 bytes, 256 bytes, 512 bytes).
As a result, this may help reduce TLP fragmentation in P2P transfers
and alleviate potential congestion within a logical PCIe switch
partition, especially when Relaxed Ordering is not possible due to
hardware constraints.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260609165431.778061F00893@smtp.kernel.org/
Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping routine")
Cc: stable@vger.kernel.org
Signed-off-by: David Hu <xuehaohu@google.com>
---
 Changes in v2:
 - Updated commit title and message to reflect the switch to 2G chunks
 - Switch to using 2G as the max sg entry size as it naturally aligns
   with most hardware boundaries, while allowing compiler optimizations
   with bit shifts (David Laight)
 - Optimized away division calculation for `nent`, and multiplication
   calculation for sgl address, by dropping the `for` loop in favor of a
   `while (length)` loop (David Laight)
 - Dropped `min_t` in favor of `min()` to maintain a strict type
   checking safety net (David Laight)

 drivers/dma-buf/dma-buf-mapping.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
index 794acff2546a..2d88e08c5ebf 100644
--- a/drivers/dma-buf/dma-buf-mapping.c
+++ b/drivers/dma-buf/dma-buf-mapping.c
@@ -5,16 +5,17 @@
  */
 #include <linux/dma-buf-mapping.h>
 #include <linux/dma-resv.h>
+#include <linux/sizes.h>
+
+#define MAX_SG_ENT_SZ ((size_t)SZ_2G)
 
 static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
 					 dma_addr_t addr)
 {
-	unsigned int len, nents;
-	int i;
+	size_t len;
 
-	nents = DIV_ROUND_UP(length, UINT_MAX);
-	for (i = 0; i < nents; i++) {
-		len = min_t(size_t, length, UINT_MAX);
+	while (length) {
+		len = min(length, MAX_SG_ENT_SZ);
 		length -= len;
 		/*
 		 * DMABUF abuses scatterlist to create a scatterlist
@@ -24,11 +25,12 @@ static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
 		 * does not require the CPU list for mapping or unmapping.
 		 */
 		sg_set_page(sgl, NULL, 0, 0);
-		sg_dma_address(sgl) = addr + (dma_addr_t)i * UINT_MAX;
+		sg_dma_address(sgl) = addr;
 		sg_dma_len(sgl) = len;
+		addr += len;
+		/* Unconditionally advance. On last segment, this becomes NULL */
 		sgl = sg_next(sgl);
 	}
-
 	return sgl;
 }
 
@@ -41,14 +43,14 @@ static unsigned int calc_sg_nents(struct dma_iova_state *state,
 
 	if (!state || !dma_use_iova(state)) {
 		for (i = 0; i < nr_ranges; i++)
-			nents += DIV_ROUND_UP(phys_vec[i].len, UINT_MAX);
+			nents += DIV_ROUND_UP(phys_vec[i].len, MAX_SG_ENT_SZ);
 	} else {
 		/*
 		 * In IOVA case, there is only one SG entry which spans
 		 * for whole IOVA address space, but we need to make sure
 		 * that it fits sg->length, maybe we need more.
 		 */
-		nents = DIV_ROUND_UP(size, UINT_MAX);
+		nents = DIV_ROUND_UP(size, MAX_SG_ENT_SZ);
 	}
 
 	return nents;
-- 
2.55.0.rc0.799.gd6f94ed593-goog


