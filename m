Return-Path: <linux-media+bounces-38164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7173B0C293
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 13:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 190FB4E4CAB
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 11:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECEF029A336;
	Mon, 21 Jul 2025 11:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GqV4pDpe"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B34298CB5;
	Mon, 21 Jul 2025 11:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753096663; cv=none; b=GADagV8WfyYYSbYTv0oZDS/PaPGQStK5upr3G45w7jPmfACyN4w8sQA24gLSmMLW2dPYbvKPISX0RvJQLdMrhOtAjLvzavWCVVuCMeqhTDW4D56mUmMz7ClKDnSM37N0YjEgefPMXxrzInnjGA21wyxC7X8LItefk+Llm8NrSWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753096663; c=relaxed/simple;
	bh=pkewGPjjFTsNcaE929R2dk9XfsEdn97c4Fm1Zzq1x+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DQasfn1IVrDLl3oKG8sRvGASZuXC4r/zGdMWrzM8ZZxk6lnhnPm9iytYw1Q0+0G+CiWiSsN24i13fj+7y+4bzRerQBDhqLPLO2Y1Z0dw+aWNmlvrdkdDvRHRXhG00tk/DExnqoKS7gCTQCNQ7eayxad/bzozijpEyAgKb+re6GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GqV4pDpe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBEFC4CEF1;
	Mon, 21 Jul 2025 11:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753096662;
	bh=pkewGPjjFTsNcaE929R2dk9XfsEdn97c4Fm1Zzq1x+Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GqV4pDpem7xWd3kdcpmPqvV1GCbzoSWmbz48gxbnNSFR9tKsvgPOcEFjGr+ed191y
	 lNUUyN1qWGANt+vd6COVjF7q1f5dwzaa6Uh7KcJCS8Q50dvVc/oPsSBy1Cp4pXQIAi
	 GArxYtNjWLzh6iGG/8udiFM8jtJ0lPP6oc3btVI/H6MA+ARxAiaHxas9A8vTbszMuV
	 WzdsAp5iipxa5I6P6lLmiHOUH55Q1ZntH8yYf4KrjWpvl4/OvlUENeC7vONjnit5mE
	 H+xK/RXfwOTkRS03nGyS6i21irG26EXUYW4LiNCtfVm6aLyixAx4qG58ZTp3NEHp+S
	 XL40SWpwYS+VA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 21 Jul 2025 13:17:30 +0200
Subject: [PATCH v7 1/5] doc: dma-buf: List the heaps by name
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-dma-buf-ecc-heap-v7-1-031836e1a942@kernel.org>
References: <20250721-dma-buf-ecc-heap-v7-0-031836e1a942@kernel.org>
In-Reply-To: <20250721-dma-buf-ecc-heap-v7-0-031836e1a942@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 iommu@lists.linux.dev, linux-doc@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2482; i=mripard@kernel.org;
 h=from:subject:message-id; bh=pkewGPjjFTsNcaE929R2dk9XfsEdn97c4Fm1Zzq1x+Q=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBl1iudmqnneWB99U9twXZvdjSCWd0Ysmnx3UrJn6/z+H
 L+XLVajYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAExk+yvGSsbjJrP15C0e2ust
 TRFdkOwlN/G2d+fbU1aRvntKby4w/F51MG1/r9SjbJ3oH57c0vu3MdY7nBLcG79HtWifaepSdpM
 Dq+fc9WVQsomef+vuLx+VOdaVaU+Ye56Xeas23ChxO7xmHjMA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Since we're going to introduce multiple instances of the CMA heap
driver, there's no single CMA heap anymore.

Let's use the heap name instead to differentiate between all the heaps
available in the system.

While we're at it, let's also rework the backward compatibility part to
make it easier to amend later on.

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
2.50.1


