Return-Path: <linux-media+bounces-57755-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH0IFRSdy2loJgYAu9opvQ
	(envelope-from <linux-media+bounces-57755-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:08:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3243679AF
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AF5C3127E2A
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2203A544E;
	Tue, 31 Mar 2026 10:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPB5Vr9q"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913D439BFF0;
	Tue, 31 Mar 2026 10:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951236; cv=none; b=P/R1jRbSm2Io19nPbzk4Vlk/Hy9Ex1dw4GBIFPvDqvVf16dMaeA9TuwF+lytyQrcKhobM/6x4altNe1sy5AwQDoJtDaWockdBJJBFxbcYyPNWu8d8Sl+EywGaCrqeDN9UubnblErSob7aXfOhRudZrWUQzZjPJjNWRxCFB3LFTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951236; c=relaxed/simple;
	bh=xA8iRNbldwAg/IWB0t2FyV0TtMeqN3qjpeDuNnBZW50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XlPROpwliHQ5qlDQ3kwdE+H3KAmFbzDxPgoOwPQeji3cZeX0P0E2kPK06kJ56zUU9IcF31Jb07TyhMEJPQLd/YA6gqpTYBNUQ21RYkcSHudYuYr+mhCnoKnX5UPV4StqqRN9OO6l+UhVfY1+o/NTBo5GbGYJ9fSdTgiREyU0FG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPB5Vr9q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA56C19423;
	Tue, 31 Mar 2026 10:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774951236;
	bh=xA8iRNbldwAg/IWB0t2FyV0TtMeqN3qjpeDuNnBZW50=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TPB5Vr9qWbumeBuwOxgrV3ajCVGtfgSc04MSZoTzT+N+Ky/SJO7mY400stC8X+YJE
	 zSuozt9uNtYKA5a8FG+ckBKsq4Kqph/USj9t7jAhBSHAllzf7JfpI88qTYUSTv+qgb
	 0md2i+/s6b7xeUV66zkeskIhyGVNndjnX7ggvITFVp0vZ5DyYwYKuXvlFvI23ZWPdD
	 YC9+/VUNcAcCrRMiAnSF8o0zC3DOyjBcW28uUYyd9jWj8H4tltwGYCvV4jxmqyzX6N
	 jwD2sWy8nLEQ6KKpE41NFqxWX6Z0gpHOwzVrhzu6SRQQlrrbVAVtryF8yaMQK4BAbO
	 F5TuUhIiispzw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 31 Mar 2026 12:00:14 +0200
Subject: [PATCH v4 5/8] mm: cma: Export cma_alloc(), cma_release() and
 cma_get_name()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-dma-buf-heaps-as-modules-v4-5-e18fda504419@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725; i=mripard@kernel.org;
 h=from:subject:message-id; bh=xA8iRNbldwAg/IWB0t2FyV0TtMeqN3qjpeDuNnBZW50=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJmnZxsI6Xe+TK9UnDHRLtbgwJbFopPP/dhVv+PAg01Wv
 KlqiklLOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBF8hgbtnx+F7ySsWL5NZ33
 X77yzKwUuPSl8MmbK3lWiivUzr24rTGP/7vkh/jCec+bJpT4bAq6yFjv1Wq+fqdSUluwTsHjJ6I
 O8u82se9i1/E6V3NMN+GgkFtuqU6d+a/K4162Bs6vj2RwXwYA
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
	TAGGED_FROM(0.00)[bounces-57755-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: AC3243679AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The CMA dma-buf heap uses cma_alloc() and cma_release() to allocate and
free, respectively, its CMA buffers, and cma_get_name() to get the name
of the heap instance it's going to create.

However, these functions are not exported. Since we want to turn the CMA
heap into a module, let's export them both.

Reviewed-by: T.J. Mercier <tjmercier@google.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 mm/cma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/cma.c b/mm/cma.c
index 94b5da468a7d719e5144d33b06bcc7619c0fbcc9..550effb9c4e01cc488b5744fe61d55a5b70a6d6c 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -50,10 +50,11 @@ unsigned long cma_get_size(const struct cma *cma)
 
 const char *cma_get_name(const struct cma *cma)
 {
 	return cma->name;
 }
+EXPORT_SYMBOL_GPL(cma_get_name);
 
 static unsigned long cma_bitmap_aligned_mask(const struct cma *cma,
 					     unsigned int align_order)
 {
 	if (align_order <= cma->order_per_bit)
@@ -949,10 +950,11 @@ struct page *cma_alloc(struct cma *cma, unsigned long count,
 	if (page)
 		set_pages_refcounted(page, count);
 
 	return page;
 }
+EXPORT_SYMBOL_GPL(cma_alloc);
 
 static struct cma_memrange *find_cma_memrange(struct cma *cma,
 		const struct page *pages, unsigned long count)
 {
 	struct cma_memrange *cmr = NULL;
@@ -1025,10 +1027,11 @@ bool cma_release(struct cma *cma, const struct page *pages,
 
 	__cma_release_frozen(cma, cmr, pages, count);
 
 	return true;
 }
+EXPORT_SYMBOL_GPL(cma_release);
 
 bool cma_release_frozen(struct cma *cma, const struct page *pages,
 		unsigned long count)
 {
 	struct cma_memrange *cmr;

-- 
2.53.0


