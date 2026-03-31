Return-Path: <linux-media+bounces-57750-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAIPGamcy2loJgYAu9opvQ
	(envelope-from <linux-media+bounces-57750-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:06:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D399A367930
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 12:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30C0D30E74E7
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 10:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E9B38A733;
	Tue, 31 Mar 2026 10:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ss2nXoTT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EAC3A16A2;
	Tue, 31 Mar 2026 10:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951222; cv=none; b=hb3Cb/dMyZSbkDPEd8XwlEoiZUFtJXsoOm+OGFZLRBPxvHqsGc4tvUcBgD2rgw9xQbUvdm25hKPR4V7vzMk0GHAI+yLrVMzwmnS+LQkZi/cqHqkFr9pTfiJYeMxi/KCFFT71pPdiwTbxqNlwaUOw3rq6m4F3lpymZpPeU4jT4ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951222; c=relaxed/simple;
	bh=NmPYacRlRMgDK6wlfQdVkWEvsfihThv4t5CQJjQ7Y7I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RBWSAm20x0kyXujWTOukKUWJjlM0tu/8eMxU0OfeHTcEN6WjKOqiTNDhNLHK7JKav9DvCSFseVOnCn1cV48bR2ZFzLSzhhxSR7W/hT5j0ptkAKygN4ZiVvHT5+RsJjmtiurTOOoEeMBacy6g/aEvSZDAF/SOikclQHl5z1DKAlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ss2nXoTT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE3DBC2BCB0;
	Tue, 31 Mar 2026 10:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774951221;
	bh=NmPYacRlRMgDK6wlfQdVkWEvsfihThv4t5CQJjQ7Y7I=;
	h=From:Subject:Date:To:Cc:From;
	b=Ss2nXoTTqQTPpFf+vd8KL2TOHaj3gYelQORnJjYSaDskPaCsG/ahwxR5wQyo09pev
	 QyEsyS4gOFfegOmiVrVX41jQ1kJ8mXgEz1yDMzeH+1LykYYKx4+klu1Dxmxho07FAZ
	 one1+BWa39lVLE8FS9yHz48EUzN+8WFCQGli65jzK4ESyd09ULQ/ayN+8J1Zgr6s22
	 Hq1dL/OncUCyQuhVYvy/MACSqKFlizO2SoIp9uFCRVxm6cyOdM5dZ6CrIxwWwaazWW
	 iARNOAknbGwHy+620T97BwjBbRtB6vLJ3XFlG2X/w88YFvkuNwrGQ9E57OpsA48hGP
	 sDSIXDEMWJb/g==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v4 0/8] dma-buf: heaps: Turn heaps into modules
Date: Tue, 31 Mar 2026 12:00:09 +0200
Message-Id: <20260331-dma-buf-heaps-as-modules-v4-0-e18fda504419@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OwQ6CMAwG4FcxO1vTdQPEk+9hPIxRZFGBbEI0h
 Hd3cFFjYjz+Tf+vHUVg7ziI3WoUngcXXNvEoNcrYWvTnBhcGbMgpBSJEiivBoq+gppNF8AEuLZ
 lf+EAEpUuFNu8IiNivfNcuftCH44x1y7cWv9YLg1ynv6BDhIQSGIetwzmWO7P7Bu+bFp/ErM60
 LuU/ZAoSjrRhjljTK39ktRLUqh+SGr+SSutt5JshtmHNE3TE6FYwwtVAQAA
X-Change-ID: 20260225-dma-buf-heaps-as-modules-1034b3ec9f2a
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2731; i=mripard@kernel.org;
 h=from:subject:message-id; bh=NmPYacRlRMgDK6wlfQdVkWEvsfihThv4t5CQJjQ7Y7I=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJmnZ+vtyny391ST68fupKZOXg+LP5MLLv56Wdf4VfGRu
 aKiLp9Sx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjI7jjGhjMPOeZ5mJ7+U1+7
 xX37xEN5MWZqs+/M9C8X8bm0z/FoLz9j0KvsW/Pit7Gqf5wid2nGZsaGyfNf758uxcDkcvtFq+j
 R52FKkjJPNM+bFbHOO2xhN0OHoWLtsnPrFVSuunzRmHlE9U0nAA==
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
	TAGGED_FROM(0.00)[bounces-57750-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: D399A367930
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

The recent introduction of heaps in the optee driver [1] made possible
the creation of heaps as modules.

It's generally a good idea if possible, including for the already
existing system and CMA heaps.

The system one is pretty trivial, the CMA one is a bit more involved,
especially since we have a call from kernel/dma/contiguous.c to the CMA
heap code. This was solved by turning the logic around and making the
CMA heap call into the contiguous DMA code.

Let me know what you think,
Maxime

1: https://lore.kernel.org/dri-devel/20250911135007.1275833-4-jens.wiklander@linaro.org/

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v4:
- Fix compilation failure
- Rework to take into account OF_RESERVED_MEM
- Fix regression making the default CMA area disappear if not created
  through the DT
- Added some documentation and comments
- Link to v3: https://lore.kernel.org/r/20260303-dma-buf-heaps-as-modules-v3-0-24344812c707@kernel.org

Changes in v3:
- Squashed cma_get_name and cma_alloc/release patches
- Fixed typo in Export dev_get_cma_area commit title
- Fixed compilation failure with DMA_CMA but not OF_RESERVED_MEM
- Link to v2: https://lore.kernel.org/r/20260227-dma-buf-heaps-as-modules-v2-0-454aee7e06cc@kernel.org

Changes in v2:
- Collect tags
- Don't export dma_contiguous_default_area anymore, but export
  dev_get_cma_area instead
- Mentioned that heap modules can't be removed
- Link to v1: https://lore.kernel.org/r/20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org

---
Maxime Ripard (8):
      dma: contiguous: Turn heap registration logic around
      dma: contiguous: Make dev_get_cma_area() a proper function
      dma: contiguous: Make dma_contiguous_default_area static
      dma: contiguous: Export dev_get_cma_area()
      mm: cma: Export cma_alloc(), cma_release() and cma_get_name()
      dma-buf: heaps: Export mem_accounting parameter
      dma-buf: heaps: cma: Turn the heap into a module
      dma-buf: heaps: system: Turn the heap into a module

 drivers/dma-buf/dma-heap.c          |  1 +
 drivers/dma-buf/heaps/Kconfig       |  4 +--
 drivers/dma-buf/heaps/cma_heap.c    | 22 +++----------
 drivers/dma-buf/heaps/system_heap.c |  5 +++
 include/linux/dma-buf/heaps/cma.h   | 16 ---------
 include/linux/dma-map-ops.h         | 14 ++++----
 kernel/dma/contiguous.c             | 66 +++++++++++++++++++++++++++++++++----
 mm/cma.c                            |  3 ++
 8 files changed, 82 insertions(+), 49 deletions(-)
---
base-commit: c081b71f11732ad2c443f170ab19c3ebe8a1a422
change-id: 20260225-dma-buf-heaps-as-modules-1034b3ec9f2a

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


