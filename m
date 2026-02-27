Return-Path: <linux-media+bounces-53706-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKgTO/yaoWl8ugQAu9opvQ
	(envelope-from <linux-media+bounces-53706-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 14:24:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AD11B7999
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 14:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3400230BD4C9
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 13:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47442367D5;
	Fri, 27 Feb 2026 13:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0uK8pIA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2754117B506;
	Fri, 27 Feb 2026 13:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772198595; cv=none; b=uId9uc4ATbLxmA4T449/BWFpfeDDAVd2eSLSULoTuCdezh9AF5VIDVtKARP330tVE93uLtUvORUhmCWkkakHUwAsgRmBFgo2WtWSmEGsAKwcVdvd9vX35aG2/YhzO9VJwmOZWor9J2TNuskl8681RikBvxctj33CCQYEOXVR+zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772198595; c=relaxed/simple;
	bh=mjmT4w11Wfq0ynV+KWTaTpvGkSiB5WiaBYudNN248UY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YyINM+hDqBf2LsMPADHiA9t0Oas80N3Nb0Cg94CrCYzSFPa/syP//QPsU+NlDCYspK543G1dkw4KI+DBJ+5l7bur8m0kqvIJnDsT1mH1p+thu12jVVGkOBPGoIUiqItEXsQleNnk8lFdUOfZlORra7T823rJ06wJyME0DjWxdlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0uK8pIA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E885C116C6;
	Fri, 27 Feb 2026 13:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772198594;
	bh=mjmT4w11Wfq0ynV+KWTaTpvGkSiB5WiaBYudNN248UY=;
	h=From:Subject:Date:To:Cc:From;
	b=A0uK8pIA9bybdYhTA2eIMWK2CKAddEEVXTlrKyNUFRgyjp5z61iBDziPXYKWc3qNU
	 BKreHJgju60WflwCbE6o7xZnoJgE785fP2GlTMNIe/hoRkGCpVXpE6X/O2d4Xcd8qW
	 juvytmljqRQZwanmzNSRn3oDghJmwgcGws5CRlXfxq2bz0JhKhaz8x0eWDZKMAYUEB
	 3zV+wWz3V4rR0DZCILuf0cRxPIkbLXFGlq2yQXeTQZAs8ycAW7iB/CsROzKdw8ntut
	 Q/Gfy3fkymQnzF1med4+NEilU0OpawBfP9Kde+FgZMOsuGeEYJEtroOAl3rbNMzIwN
	 Weh8sp9K9rpbA==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 0/9] dma-buf: heaps: Turn heaps into modules
Date: Fri, 27 Feb 2026 14:15:39 +0100
Message-Id: <20260227-dma-buf-heaps-as-modules-v2-0-454aee7e06cc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0Jm7ZjpoCa48h6ERaEDNAIlHSEaw
 t2tnMDl+/n//Q1UoheFe7ZBlNWrD1MCPmXQ9HbqBL1LDEx8I+YrutFivbTYi50VreIY3DKIoqH
 8UufSFC1bSPM5Suvfh7qsEvdeXyF+jqfV/NI/pKtBQjZUpJalgtzjKXGS4RxiB9W+71+k1vmdw
 QAAAA==
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
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 iommu@lists.linux.dev, linux-mm@kvack.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2081; i=mripard@kernel.org;
 h=from:subject:message-id; bh=mjmT4w11Wfq0ynV+KWTaTpvGkSiB5WiaBYudNN248UY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkLZ233vsYj5JpYrLbY+435oV9Ka1gWd/zcdlDWWzTkX
 NULZadfHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi+88y1hd33xXkmvXP4kfW
 seOxsrWpzodV8m4dz/OZ3jr3zwQvia6rj09/utFxY/nquMQwkyMPmBnrQ8PrZraVVhxN0j8UNqV
 J5qXU/XeWsjpCsxZ979Yr+RbSpL3TKIt5Lf+Px3cXcB/ycuYHAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53706-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
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
X-Rspamd-Queue-Id: 52AD11B7999
X-Rspamd-Action: no action

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
Changes in v2:
- Collect tags
- Don't export dma_contiguous_default_area anymore, but export
  dev_get_cma_area instead
- Mentioned that heap modules can't be removed
- Link to v1: https://lore.kernel.org/r/20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org

---
Maxime Ripard (9):
      dma: contiguous: Turn heap registration logic around
      dma: contiguous: Make dev_get_cma_area() a proper function
      dma: contiguous: Make dma_contiguous_default_area static
      mm: cma: Export dev_get_cma_area()
      mm: cma: Export cma_alloc and cma_release
      mm: cma: Export cma_get_name
      dma-buf: heaps: Export mem_accounting parameter
      dma-buf: heaps: cma: Turn the heap into a module
      dma-buf: heaps: system: Turn the heap into a module

 drivers/dma-buf/dma-heap.c          |  1 +
 drivers/dma-buf/heaps/Kconfig       |  4 ++--
 drivers/dma-buf/heaps/cma_heap.c    | 21 +++++----------------
 drivers/dma-buf/heaps/system_heap.c |  5 +++++
 include/linux/dma-map-ops.h         | 14 ++++++--------
 kernel/dma/contiguous.c             | 37 ++++++++++++++++++++++++++++++++++---
 mm/cma.c                            |  3 +++
 7 files changed, 56 insertions(+), 29 deletions(-)
---
base-commit: 499a718536dc0e1c1d1b6211847207d58acd9916
change-id: 20260225-dma-buf-heaps-as-modules-1034b3ec9f2a

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


