Return-Path: <linux-media+bounces-44248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A67ABD217D
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 10:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B637B4EEE68
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 08:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92B62FA0F6;
	Mon, 13 Oct 2025 08:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PoKMEbD7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277192F9D89;
	Mon, 13 Oct 2025 08:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760344524; cv=none; b=GKTcSZBpzXr7zvQMewQZAouII5B1+fBbSFYJkrdld8i1d15xYTT+jws7ylTDuJYssDZG0wNigUR3Fhok/d0m78ObEtfzo1xn51OlUk6dCXJxYwvE2V4Voku2lB2JAxEyop5aT2nwP4qkCT2iTukRN+AlQMRV3ZmXpf1ehv38nMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760344524; c=relaxed/simple;
	bh=LajQOzk5GurvfMLYf/AkXrRyTeYx/Rv5O6zLtZAh0eM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o0p7eDXgWrkBiSAr+K46ZyoxFfaLmHtgA3dyC7wDhDYESDTGyaBTyVyhwotRbqHqzjbGVvyJcr89lnSV3vCrOLZL/v4E1Fq99vN3hd2xgJk9m0xJWKJO6YINcy4EU4hFxXSCs0gEQtMeKjsWJkZsb1LQoZxmIyJb25WgkEA6gEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PoKMEbD7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2A3C4CEFE;
	Mon, 13 Oct 2025 08:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760344523;
	bh=LajQOzk5GurvfMLYf/AkXrRyTeYx/Rv5O6zLtZAh0eM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PoKMEbD7W7BvsFwuUR4NZOpmLGVqH3UTQkCAWknoduVynmpAKzMHMwUWeyKxWahzb
	 x09EBSmy88L4bwEun0kHl+ctSTqkbW2jCEA+nusK/xSke2aerDalu063VBP0Ic7OKR
	 O0ryxoWQ9gUHfI9uRrQ40KcRHD1KsXfQayvlXHpmPwiIQHfCD0KhzzgtMXs8Jr9YTn
	 pS2xw3/MRz+Xvd2GQiCsOup591MTBB4UDDAMxh6WCFbVYnfK7Oik9PQRcZQOUFuO0R
	 CJ/E+mK3zQ+jWuBLwJHtsyGESV8nYXJWUDhP7KZwX+97oP8XCHDTyJ+ithGbwrCU9k
	 y1ffjnDqAhDRA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 13 Oct 2025 10:35:16 +0200
Subject: [PATCH v8 1/5] doc: dma-buf: List the heaps by name
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-dma-buf-ecc-heap-v8-1-04ce150ea3d9@kernel.org>
References: <20251013-dma-buf-ecc-heap-v8-0-04ce150ea3d9@kernel.org>
In-Reply-To: <20251013-dma-buf-ecc-heap-v8-0-04ce150ea3d9@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, Jonathan Corbet <corbet@lwn.net>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 iommu@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2

Since we're going to introduce multiple instances of the CMA heap
driver, there's no single CMA heap anymore.

Let's use the heap name instead to differentiate between all the heaps
available in the system.

While we're at it, let's also rework the backward compatibility part to
make it easier to amend later on.

Reviewed-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/userspace-api/dma-buf-heaps.rst | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index 1dfe5e7acd5a3c674323775176d81944147e40c0..17bf6829efd7963bc849765db54d327644e8c395 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -14,15 +14,16 @@ Heaps
 A heap represents a specific allocator. The Linux kernel currently supports the
 following heaps:
 
  - The ``system`` heap allocates virtually contiguous, cacheable, buffers.
 
- - The ``cma`` heap allocates physically contiguous, cacheable,
-   buffers. Only present if a CMA region is present. Such a region is
-   usually created either through the kernel commandline through the
-   ``cma`` parameter, a memory region Device-Tree node with the
-   ``linux,cma-default`` property set, or through the ``CMA_SIZE_MBYTES`` or
-   ``CMA_SIZE_PERCENTAGE`` Kconfig options. The heap's name in devtmpfs is
-   ``default_cma_region``. For backwards compatibility, when the
-   ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option is set, a duplicate node is
-   created following legacy naming conventions; the legacy name might be
-   ``reserved``, ``linux,cma``, or ``default-pool``.
+ - The ``default_cma_region`` heap allocates physically contiguous,
+   cacheable, buffers. Only present if a CMA region is present. Such a
+   region is usually created either through the kernel commandline
+   through the ``cma`` parameter, a memory region Device-Tree node with
+   the ``linux,cma-default`` property set, or through the
+   ``CMA_SIZE_MBYTES`` or ``CMA_SIZE_PERCENTAGE`` Kconfig options. Prior
+   to Linux 6.17, its name wasn't stable and could be called
+   ``reserved``, ``linux,cma``, or ``default-pool``, depending on the
+   platform. From Linux 6.17 onwards, the creation of these heaps is
+   controlled through the ``DMABUF_HEAPS_CMA_LEGACY`` Kconfig option for
+   backwards compatibility.

-- 
2.51.0


