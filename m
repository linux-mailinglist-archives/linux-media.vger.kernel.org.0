Return-Path: <linux-media+bounces-58130-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wL/AAIAq1GmfrwcAu9opvQ
	(envelope-from <linux-media+bounces-58130-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 23:49:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BA93A79C8
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 23:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D66753019D77
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 21:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A3139D6DA;
	Mon,  6 Apr 2026 21:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ql5GTX9e"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807162765DF;
	Mon,  6 Apr 2026 21:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775512184; cv=none; b=Ny7x0wu9Mp8NDkb2PWy9xbNJGOwcPHRCmFD8Z6GcWNAYyu6NeOlc2/2Xckajnme1iFc9R+alYR0I1R46SYLb6aF3f3gPvWqWnLHwr5Ml5HILDtYxq3mQsC65btE4X8e4mTO5pd6j8wYNRvjfOIMt4Qc9moOvf8w8+QBIg8ct/ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775512184; c=relaxed/simple;
	bh=N+z22Wq+UEerxVHAHodhIfMR6FsXxwnZoZShwWjnMK0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=mr1JZxUt+LU+B0EenlltDh+JviDwejSRZPI02n2pFZgTCUMo9gtnvIdbHPiLsBSGKZALDOfcrGGzM7Fa74DY1lRTwWYUAHyyhra8RVNUxrQTh6PGvEjl3/tU0bPHSeZGPv7GYHoMOPD/N8WI+RrsCW1egz3/+ozKFgodlVlD0PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ql5GTX9e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE36FC4CEF7;
	Mon,  6 Apr 2026 21:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775512184;
	bh=N+z22Wq+UEerxVHAHodhIfMR6FsXxwnZoZShwWjnMK0=;
	h=From:To:Cc:Subject:Date:From;
	b=Ql5GTX9eykHVTn0dJcvGAyRizNvXj1F315Z9c/ibdXYR25xTk3qp4CXm7MLy52cpa
	 OWgpQ2n6zIIpH3rWtG6co4qZ9DcV/uZGrNPgvHLwnt09ra0JgvHyAbxEe8B5e924gu
	 Lrv814OFg1k6eMYasonNNSbK8UmzDKpSm2iVvHzf5IEILthB6dlRhfsWYm95SX4v+B
	 BtWsyWwG2kcOW2AWVOHHJPZVWEExfOW5+BgmtAy0tqfARhfaM1sb1WwRAydlW9KwIR
	 6GIqblsKkLrfsa8gCi2o/LcSPMCcgus1qf+F6c8tN+xdbf9m569SGTmxx9ckctHrQY
	 UTjPM16TasV+A==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Cc: linux-kernel@vger.kernel.org,
	Xueyuan Chen <Xueyuan.chen21@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Barry Song <baohua@kernel.org>
Subject: [PATCH] dma-buf: system_heap: Optimize sg_table-to-pages conversion in vmap
Date: Tue,  7 Apr 2026 05:49:38 +0800
Message-Id: <20260406214938.24142-1-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58130-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,linaro.org,collabora.com,arm.com,google.com,amd.com,kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[baohua@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,arm.com:email,amd.com:email,linaro.org:email]
X-Rspamd-Queue-Id: 99BA93A79C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Xueyuan Chen <Xueyuan.chen21@gmail.com>

Replace the heavy for_each_sgtable_page() iterator in system_heap_do_vmap()
with a more efficient nested loop approach.

Instead of iterating page by page, we now iterate through the scatterlist
entries via for_each_sgtable_sg(). Because pages within a single sg entry
are physically contiguous, we can populate the page array with a in an
inner loop using simple pointer math. This save a lot of time.

The WARN_ON check is also pulled out of the loop to save branch
instructions.

Performance results mapping a 2GB buffer on Radxa O6:
- Before: ~1440000 ns
- After:  ~232000 ns
(~84% reduction in iteration time, or ~6.2x faster)

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: John Stultz <jstultz@google.com>
Cc: T.J. Mercier <tjmercier@google.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Xueyuan Chen <Xueyuan.chen21@gmail.com>
Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 drivers/dma-buf/heaps/system_heap.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index b3650d8fd651..769f01f0cc96 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -224,16 +224,21 @@ static void *system_heap_do_vmap(struct system_heap_buffer *buffer)
 	int npages = PAGE_ALIGN(buffer->len) / PAGE_SIZE;
 	struct page **pages = vmalloc(sizeof(struct page *) * npages);
 	struct page **tmp = pages;
-	struct sg_page_iter piter;
 	void *vaddr;
+	u32 i, j, count;
+	struct page *base_page;
+	struct scatterlist *sg;
 
 	if (!pages)
 		return ERR_PTR(-ENOMEM);
 
-	for_each_sgtable_page(table, &piter, 0) {
-		WARN_ON(tmp - pages >= npages);
-		*tmp++ = sg_page_iter_page(&piter);
+	for_each_sgtable_sg(table, sg, i) {
+		base_page = sg_page(sg);
+		count = sg->length >> PAGE_SHIFT;
+		for (j = 0; j < count; j++)
+			*tmp++ = base_page + j;
 	}
+	WARN_ON(tmp - pages != npages);
 
 	vaddr = vmap(pages, npages, VM_MAP, PAGE_KERNEL);
 	vfree(pages);
-- 
2.39.3 (Apple Git-146)


