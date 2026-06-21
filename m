Return-Path: <linux-media+bounces-65324-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tc1fJfRjOGpvbwcAu9opvQ
	(envelope-from <linux-media+bounces-65324-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 00:21:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA5E6ABBD9
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 00:21:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=TyUZkeV7;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65324-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65324-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 137F6300E174
	for <lists+linux-media@lfdr.de>; Sun, 21 Jun 2026 22:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E42A377550;
	Sun, 21 Jun 2026 22:21:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f73.google.com (mail-qv1-f73.google.com [209.85.219.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF8923C368
	for <linux-media@vger.kernel.org>; Sun, 21 Jun 2026 22:21:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782080496; cv=none; b=UEjJ397qRbb12vQj6rgQjy5lAcObpG/DXTs+HS19cd5KhTsJ0l5kHRygi1dRMY+aervA5HmoyzvqvIpHoPVwRUxX1FrlBt/wuN4lk4VvrXYRTgrM6tobjbcS/TAYicinxZYZXHX+KwdXDGT3rWst5aPK9cjSphe4VqoMIMFiawA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782080496; c=relaxed/simple;
	bh=W6+v4i11Ax13kL48F/Y+SlQUTA6m8gwuQWrL0d08Rj4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=RzwiSdrbhHdYBT2WQmJ77j7OzzANeo8FBAGyYPrgBK2dN3vcH5dAX2DE10fDb0bHT/nC1/tEru8VGT1wcMFCJ+uFx3O+VTuN6Y5R2+Icf9LtrW3hh1FtIQITeZWCMa6G3mB85yRsQt7w3HD4ETxBlPDnxa4V8FBlnBTxhLuGf34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xuehaohu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TyUZkeV7; arc=none smtp.client-ip=209.85.219.73
Received: by mail-qv1-f73.google.com with SMTP id 6a1803df08f44-8dd4e82d2c7so31226096d6.0
        for <linux-media@vger.kernel.org>; Sun, 21 Jun 2026 15:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782080492; x=1782685292; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E/rPiB1Qh/2nTPaKmpZPHKT5hQGs3BX51WUl0ayz+VA=;
        b=TyUZkeV7RwmVH2tiEkM1hzshluKBhYTdeavGlJGmC85HVDS9FtHKJzsRxGjo2v5hpk
         6eHrEou9JmfipKF6zyDMHCa/g/ich5I2tgS4rwP5YMzFPeQQ9rH+eZ+PkFw+YnEZkX60
         yinu6vURy/GUz0yaMPjmmpDP6tpRsxDaeJALq62ZKz0n+8VINQwCVbmjA0PNVScRzR/j
         xLcBJIzeH2+jE3FL4du2SYXEjQkTGWZF5auEcgMuIA46zVyYbrPA9TCsSkItFI8KtW0f
         DRBsKErrZf1ieedsOIC6WObeDfYksLf4YSYvPtkYvuaMjs20K95ZZ0OIx8gindxfYkuZ
         vFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782080492; x=1782685292;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E/rPiB1Qh/2nTPaKmpZPHKT5hQGs3BX51WUl0ayz+VA=;
        b=qo97u3BFi9Ovulxm1PCfHK9j4WHn1SjJ5fTfWwzsxPn7asgbm7L/Zce9F0nx0uapQo
         nCE/clnjI/bwOvAcVbb6T/rRcJEWVelSQnvkOoMhPXhD7vOtmNhcLZPJQl5EYb8X6bnv
         JUl09/JaqrZ3KCvSnUzfE+heOW6hEPJAM2p5iXtZwayoqISsurKRbKsR9bQSeLHz+xJ5
         8mcVD8/7++AfEc6KLRtNn0L8zyeO+ZtiLQ+eiguJ0gtMxByo6x1YYEwPnhS3e81MA638
         nO5Mjq5HVrRGoURH0pHt+vxaM3pkpQsVa4sOZyXgQKz4d105tqzeNbq4PCyYuhw8pVke
         CRsw==
X-Forwarded-Encrypted: i=1; AHgh+Rp7YEugFirMVymyf7oOoWWMImR9zBXV7VX08ul9yvuxRv2TzcSRH8eA8C1/MZF+LTdjyhrpTyyZbh0R2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywztgp5/uW0DmZ1TR4Uln0xQME9/uYPm0ZIer4Y8zSdsUg/fh8u
	TuzYtabrlpXO+sbKWYtIr/IC29mUQN1PeNe/8mV2kgoe2bLz4vMfh5evQ/c5cDu45ku/G1ylBUF
	rCVPULQWryp2G
X-Received: from qvbld29.prod.google.com ([2002:a05:6214:419d:b0:8db:f5ff:e5e9])
 (user=xuehaohu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6214:3f82:b0:8cc:6aa6:7035 with SMTP id 6a1803df08f44-8de4c97e03amr175835356d6.19.1782080492419;
 Sun, 21 Jun 2026 15:21:32 -0700 (PDT)
Date: Sun, 21 Jun 2026 22:21:30 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
Message-ID: <20260621222130.1667453-1-xuehaohu@google.com>
Subject: [PATCH] dma-buf: Split sgl by largest page-aligned chunk
From: David Hu <xuehaohu@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, 
	Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, jmoroni@google.com, 
	praan@google.com, kpberry@google.com, David Hu <xuehaohu@google.com>, 
	sashiko-bot <sashiko-bot@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:jgg@ziepe.ca,m:nicolinc@nvidia.com,m:leon@kernel.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:jmoroni@google.com,m:praan@google.com,m:kpberry@google.com,m:xuehaohu@google.com,m:sashiko-bot@kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[xuehaohu@google.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65324-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xuehaohu@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CA5E6ABBD9

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

Fix this by splitting the scatterlist by the largest possible page
aligned chunk within `UINT_MAX` (`ALIGN_DOWN(UINT_MAX, PAGE_SIZE)`).
This ensures all scatterlist DMA addresses and lengths remain page
aligned and satisfy hardware constraints.

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
 drivers/dma-buf/dma-buf-mapping.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
index 794acff2546a..f2bde38fdb1f 100644
--- a/drivers/dma-buf/dma-buf-mapping.c
+++ b/drivers/dma-buf/dma-buf-mapping.c
@@ -5,6 +5,9 @@
  */
 #include <linux/dma-buf-mapping.h>
 #include <linux/dma-resv.h>
+#include <linux/align.h>
+
+#define MAX_ENT_SZ ALIGN_DOWN(UINT_MAX, PAGE_SIZE)
 
 static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
 					 dma_addr_t addr)
@@ -12,9 +15,9 @@ static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
 	unsigned int len, nents;
 	int i;
 
-	nents = DIV_ROUND_UP(length, UINT_MAX);
+	nents = DIV_ROUND_UP(length, MAX_ENT_SZ);
 	for (i = 0; i < nents; i++) {
-		len = min_t(size_t, length, UINT_MAX);
+		len = min_t(size_t, length, MAX_ENT_SZ);
 		length -= len;
 		/*
 		 * DMABUF abuses scatterlist to create a scatterlist
@@ -24,7 +27,7 @@ static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
 		 * does not require the CPU list for mapping or unmapping.
 		 */
 		sg_set_page(sgl, NULL, 0, 0);
-		sg_dma_address(sgl) = addr + (dma_addr_t)i * UINT_MAX;
+		sg_dma_address(sgl) = addr + (dma_addr_t)i * MAX_ENT_SZ;
 		sg_dma_len(sgl) = len;
 		sgl = sg_next(sgl);
 	}
@@ -41,14 +44,14 @@ static unsigned int calc_sg_nents(struct dma_iova_state *state,
 
 	if (!state || !dma_use_iova(state)) {
 		for (i = 0; i < nr_ranges; i++)
-			nents += DIV_ROUND_UP(phys_vec[i].len, UINT_MAX);
+			nents += DIV_ROUND_UP(phys_vec[i].len, MAX_ENT_SZ);
 	} else {
 		/*
 		 * In IOVA case, there is only one SG entry which spans
 		 * for whole IOVA address space, but we need to make sure
 		 * that it fits sg->length, maybe we need more.
 		 */
-		nents = DIV_ROUND_UP(size, UINT_MAX);
+		nents = DIV_ROUND_UP(size, MAX_ENT_SZ);
 	}
 
 	return nents;
-- 
2.55.0.rc0.738.g0c8ab3ebcc-goog


