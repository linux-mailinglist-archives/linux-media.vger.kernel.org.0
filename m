Return-Path: <linux-media+bounces-57752-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBuzKuucy2loJgYAu9opvQ
	(envelope-from <linux-media+bounces-57752-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:07:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C8236797F
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A47E731115F8
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2F93A6B7A;
	Tue, 31 Mar 2026 10:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pWOBMbVZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CE63A451F;
	Tue, 31 Mar 2026 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951228; cv=none; b=oEjTEGS0hlAgEY0orVL+pKjmXp8vuvSUakghq+eYrO5NesDPl/RBbfCyavy3lbHDsG6qEU6ShduytRLJbhk74YgTUSjzroyiOnQu8gDTNN1nL9zia54v3ejMliPXkR+p2ASuQYvyZCxtbTTpr5m1vV7GiUwTVcmsWD2ByBVPc34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951228; c=relaxed/simple;
	bh=HViJ3A2FjlDEklvSisEqyQ3MoBEs84TC4OJD6vWGvCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cgKiyqGsZG/4jVuXncZfTQWUBYeWY1AWYKUr09NnJtXVfM66JrsLLwD+kdKNf1wQeKAL0TNVRSrU0Bk2dXqWoJNpkCo64UIghOxb9zDViZBRq9yRcNXJZL6XLwpTRKxim6NWXgcg2Trj6LIoOfS0cSeMO3vuOa+2B3fePBlE8Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pWOBMbVZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CAA6C19423;
	Tue, 31 Mar 2026 10:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774951227;
	bh=HViJ3A2FjlDEklvSisEqyQ3MoBEs84TC4OJD6vWGvCU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pWOBMbVZv+nHWUv6rnOHekogJLNlvQSUhgs8kiDRIVR4rb9hs6nzcs9z32W5KqUSx
	 jxGAJCaQOrRjegiJHCr6ThMqNcbBZvZw2yQQNAn+z8rwClG72e+aZRicYRFw/86EfY
	 kcpt00GzP4E0wABRNZr3nSZM9zbjE21lWfsOOfbQ2j6KHQiFemBCvxEkzfMADhlym4
	 hMrdpY/Sd/4r14/IJzWd2v1qVcFoNffqZaobMz2sHgTQCwiixND4wVHTkPvuCELveg
	 DcKPabGsZ3PW8ZDxD0PPNKheRO99RhsFLuY6ZIP2RY0TwgwW3e1aQnQxuR8TIqCn3P
	 Hyzmhs4UMbZ+A==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 31 Mar 2026 12:00:11 +0200
Subject: [PATCH v4 2/8] dma: contiguous: Make dev_get_cma_area() a proper
 function
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-dma-buf-heaps-as-modules-v4-2-e18fda504419@kernel.org>
References: <20260331-dma-buf-heaps-as-modules-v4-0-e18fda504419@kernel.org>
In-Reply-To: <20260331-dma-buf-heaps-as-modules-v4-0-e18fda504419@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2404; i=mripard@kernel.org;
 h=from:subject:message-id; bh=HViJ3A2FjlDEklvSisEqyQ3MoBEs84TC4OJD6vWGvCU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJmnZ+srzBZWUjrEa3fu2IUTV3l+3Pyqejiwi/mKUVuvx
 /9je98d6pjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATsZ3BWB/kd67z+pUXtTGW
 h1sCIzZvmPJDbYKbcWmbJsvjppVXzMqeXZRy+tB68e/zt3Pknx3+qMDY8O5/7p6p2rZvbY82FMU
 caGgs2sBsqsXk9lA5WNn6cqf57Z9KEkyuq/KPLJH8LPlwVe0sAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57752-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 27C8236797F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As we try to enable dma-buf heaps, and the CMA one in particular, to
compile as modules, we need to export dev_get_cma_area(). It's currently
implemented as an inline function that returns either the content of
device->cma_area or dma_contiguous_default_area.

Thus, it means we need to export dma_contiguous_default_area, which
isn't really something we want any module to have access to.

Instead, let's make dev_get_cma_area() a proper function we will be able
to export so we can avoid exporting dma_contiguous_default_area.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/linux/dma-map-ops.h | 7 +------
 kernel/dma/contiguous.c     | 8 ++++++++
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index c4c93c72ff6ff3ff5c59b7161970805422e9dccb..8604106c0c01b6a9dadc45263f3b1d9ecfacd4aa 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -91,16 +91,11 @@ static inline void set_dma_ops(struct device *dev,
 #endif /* CONFIG_ARCH_HAS_DMA_OPS */
 
 #ifdef CONFIG_DMA_CMA
 extern struct cma *dma_contiguous_default_area;
 
-static inline struct cma *dev_get_cma_area(struct device *dev)
-{
-	if (dev && dev->cma_area)
-		return dev->cma_area;
-	return dma_contiguous_default_area;
-}
+struct cma *dev_get_cma_area(struct device *dev);
 struct cma *dma_contiguous_get_area_by_idx(unsigned int idx);
 
 void dma_contiguous_reserve(phys_addr_t addr_limit);
 int __init dma_contiguous_reserve_area(phys_addr_t size, phys_addr_t base,
 		phys_addr_t limit, struct cma **res_cma, bool fixed);
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index afa9fd31304051d200cd4396dec26dd50becc375..40a0ead24979cfdf25e4779545536a5438e26356 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -129,10 +129,18 @@ early_param("cma", early_cma);
 bool __init cma_skip_dt_default_reserved_mem(void)
 {
 	return size_cmdline != -1;
 }
 
+struct cma *dev_get_cma_area(struct device *dev)
+{
+	if (dev && dev->cma_area)
+		return dev->cma_area;
+
+	return dma_contiguous_default_area;
+}
+
 #ifdef CONFIG_DMA_NUMA_CMA
 
 static struct cma *dma_contiguous_numa_area[MAX_NUMNODES];
 static phys_addr_t numa_cma_size[MAX_NUMNODES] __initdata;
 static struct cma *dma_contiguous_pernuma_area[MAX_NUMNODES];

-- 
2.53.0


