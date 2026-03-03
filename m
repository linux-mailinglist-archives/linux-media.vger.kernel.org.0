Return-Path: <linux-media+bounces-54305-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB6eOom0pmk7TAAAu9opvQ
	(envelope-from <linux-media+bounces-54305-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:14:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9360E1EC83F
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 11:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 564EF3035F47
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 10:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A454337BA6;
	Tue,  3 Mar 2026 10:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hNLBgPiY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0533988EA;
	Tue,  3 Mar 2026 10:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772532815; cv=none; b=oANv3KtvlBEOfDweq7ddcg13CBTlTTLgDZGt//CoCnxBLJN9c0Kqq2nNylgopadFIgHrDv75ClE5S6Sn9goygX7MjY7AnN6dB05UEMf8kJn0yRvdSVMRASCYdzlCOvPMdBsKWeAq4G8Nkz+rWzQSuY2v4J6QA2fWqwnyo5MOu4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772532815; c=relaxed/simple;
	bh=uocFqI6buKhD72I9T9guormXJl46wyFDpX9g7jostug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HEb0YrB8Lr0ytc0CXtozN5nUyx8lDF0U+c3KgLeb6tk6Ut2JdHR4l2R+Gf6VFeWs4UXi+bPomkO7B0YBJRtnYIXwbCLBJEZmCnr09YBIWHZaAjWDKP0xVWrKv8Buisi5Vu3SxLqUItdFKzNenq22C+2EoyhLgenbaG0PMkXvC9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hNLBgPiY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8734C2BCB4;
	Tue,  3 Mar 2026 10:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772532815;
	bh=uocFqI6buKhD72I9T9guormXJl46wyFDpX9g7jostug=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hNLBgPiYlGA3ROspXiwDWvGd7UDC3eLt9KG+LRpD2ykmSpbvDT4i2lecDwEEQ4jRi
	 BSriPRPByLDuUP07IrVg5AWs0lHcb/j5vNyXlRdfXxPb9Gmh21vG71c0O4goDaA8DR
	 viJH+W2PiOP/skvF0y52/p3n1Sl8m2jC7WrjZr0ZyA4FFArGVbBpfR0/p7mifhP9zc
	 vuxDO4mW0g4VCQk13LnYA04RoubMyd71KF6RRslLiRJyJYV8teAEPkxI4Uiht714lw
	 Su6WskTLu+cqYWbaT0LYNfkORzEllBz+OkTHo9zVAvRkED584wGHpfE//bQQ6aVFHI
	 qI0XQT+J6gALQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 03 Mar 2026 11:13:09 +0100
Subject: [PATCH v3 6/8] dma-buf: heaps: Export mem_accounting parameter
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-dma-buf-heaps-as-modules-v3-6-24344812c707@kernel.org>
References: <20260303-dma-buf-heaps-as-modules-v3-0-24344812c707@kernel.org>
In-Reply-To: <20260303-dma-buf-heaps-as-modules-v3-0-24344812c707@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Cc: Albert Esteve <aesteve@redhat.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114; i=mripard@kernel.org;
 h=from:subject:message-id; bh=uocFqI6buKhD72I9T9guormXJl46wyFDpX9g7jostug=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJnLtpg51J64F2S+Qnv20d4+vXl7NF2OTUzZEbiAw+DT1
 DTF2JqujqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRpGmM9W4hG/rbaxtq+/t+
 TFZ9WZrIxbMl1Z5rxh2PTpe4RweTlh6aWsVRvk2v0+9XgXIBZ/ljxobDb3+d2ZoTr5IvGT05qeb
 NJsfWxCKRfpEylf23TWZPncb3e4tml+rbq5MZild+d9gZ/h0A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Queue-Id: 9360E1EC83F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54305-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

The mem_accounting kernel parameter is used by heaps to know if they
should account allocations in their respective cgroup controllers.

Since we're going to allow heaps to compile as modules, we need to
export that variable.

Reviewed-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/dma-buf/dma-heap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index ac5f8685a649496c0e1c6decbf263b63fa472d04..a76bf3f8b071a3d5bf39a8513f31e9e8aa16e02f 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -51,10 +51,11 @@ static DEFINE_XARRAY_ALLOC(dma_heap_minors);
 
 bool __read_mostly mem_accounting;
 module_param(mem_accounting, bool, 0444);
 MODULE_PARM_DESC(mem_accounting,
 		 "Enable cgroup-based memory accounting for dma-buf heap allocations (default=false).");
+EXPORT_SYMBOL_NS_GPL(mem_accounting, "DMA_BUF_HEAP");
 
 static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
 				 u32 fd_flags,
 				 u64 heap_flags)
 {

-- 
2.53.0


