Return-Path: <linux-media+bounces-27943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 580C4A5937B
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 13:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 176FB3A1C55
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 12:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8AA227E98;
	Mon, 10 Mar 2025 12:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qjqmtDkn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE23D227B9A;
	Mon, 10 Mar 2025 12:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741608385; cv=none; b=Ri6XujDszyutK+RwDXwywfg3QIPmMEYdfGxcOhSztvAbyuyOfh+OOp5nSlcEJjuUB5r/B/AAQxxuTFvirQ9imvsqC78DMyex1DB5xAg43E01eBxeAbEbAn5l8GpPIs4v/02vkpqwYGa2kQhb+V2r1dU1cpPbWYN2omsTOcsZ454=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741608385; c=relaxed/simple;
	bh=2YzE4b+Qi+V9hV6O5UCs1RYDTh6ddyq+BV8GpU5GQUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qfwzfy2+C0bQ5Gea9hB+fxRa5D0E4GXBQO49p0IzxNK/NtjLzSWM7OiXVc33VziF950+NZCwEkQpWjJ1RenjVRUlJ7lSbbfXN9rgGkOlO6Hb8s4My9hDO+TLi6gLB7o41Ebu56HRbTT6ZM79brbelELYUWpMQZWO4RcGqNs+GoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qjqmtDkn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D605EC4CEEA;
	Mon, 10 Mar 2025 12:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741608384;
	bh=2YzE4b+Qi+V9hV6O5UCs1RYDTh6ddyq+BV8GpU5GQUE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qjqmtDknv7QUg/iDumEaO9V3eXLQMkJoagsIq89SSs+1N7acbPZXWD17ldw1M3TKe
	 PMliu5u6NwaMsA3bT6dLrX1yjvUMkL0oA80IjJJi+hypDgd7j5qAw1hgGQZOFzqnnQ
	 ZInbEz/FbqYH2OiTTl6wgDaSimir6JW+oaipvFPaSPGfPzNZcQJFhuNQjx2PxWGM71
	 byt+Kceqio0vbEhIzd9qn2qVk4H5w0YpfWJ3v9GO7/gbbjyEBPL1Gt9VJhZEXA0uy3
	 h0vVv5EM1AXM3tM05QphZ64QctN82e6k9D5EqX4V2bEzy/jSs9ncUhvlHxQevCbp3o
	 FnRn1MYeFwzGA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 10 Mar 2025 13:06:08 +0100
Subject: [PATCH RFC 02/12] cma: Provide accessor to cma dmem region
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-dmem-cgroups-v1-2-2984c1bc9312@kernel.org>
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
In-Reply-To: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Tomasz Figa <tfiga@chromium.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1700; i=mripard@kernel.org;
 h=from:subject:message-id; bh=2YzE4b+Qi+V9hV6O5UCs1RYDTh6ddyq+BV8GpU5GQUE=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOnnrm5cH1a87eYU773J9zyPXm56VvU+f61h0oRf0qv/s
 ur96Ku/31HCwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJBKgwfM87LWv75/xvll/+
 5bx9sb0aNRxHUvaX7arWY/y6UinlPSPDzmh9kYQtsY85Fz4RDTOKPGBzTFnnmvzZJDFRv3YRq1Z
 +AA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Consumers of the CMA API will have to know which CMA region their device
allocate from in order for them to charge the memory allocation in the
right one.

Let's provide an accessor for that region.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/linux/cma.h | 9 +++++++++
 mm/cma.c            | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/include/linux/cma.h b/include/linux/cma.h
index d15b64f51336df18d17a4097e27961fd1ac8d79f..d7b2f13918e536aeb8bccebc1934d36f2f0b4cf4 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -66,6 +66,15 @@ static inline bool cma_free_folio(struct cma *cma, const struct folio *folio)
 {
 	return false;
 }
 #endif
 
+#if IS_ENABLED(CONFIG_CGROUP_DMEM)
+struct dmem_cgroup_region *cma_get_dmem_cgroup_region(struct cma *cma);
+#else /* CONFIG_CGROUP_DMEM */
+static inline struct dmem_cgroup_region *cma_get_dmem_cgroup_region(struct cma *cma)
+{
+	return NULL;
+}
+#endif /* CONFIG_CGROUP_DMEM */
+
 #endif
diff --git a/mm/cma.c b/mm/cma.c
index 41a9ae907dcf69a73e963830d2c5f589dfc44f22..4973a8c6bacb9d4924f4969be07757cf631304b8 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -49,10 +49,17 @@ unsigned long cma_get_size(const struct cma *cma)
 const char *cma_get_name(const struct cma *cma)
 {
 	return cma->name;
 }
 
+#if IS_ENABLED(CONFIG_CGROUP_DMEM)
+struct dmem_cgroup_region *cma_get_dmem_cgroup_region(struct cma *cma)
+{
+	return cma->dmem_cgrp_region;
+}
+#endif /* CONFIG_CGROUP_DMEM */
+
 static unsigned long cma_bitmap_aligned_mask(const struct cma *cma,
 					     unsigned int align_order)
 {
 	if (align_order <= cma->order_per_bit)
 		return 0;

-- 
2.48.1


