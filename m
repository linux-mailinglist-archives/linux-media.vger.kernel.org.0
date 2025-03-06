Return-Path: <linux-media+bounces-27726-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C6EA54C9F
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 14:51:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44887173F5D
	for <lists+linux-media@lfdr.de>; Thu,  6 Mar 2025 13:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7D07DA7F;
	Thu,  6 Mar 2025 13:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PfZHbCsG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56ABC33FD;
	Thu,  6 Mar 2025 13:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741269078; cv=none; b=IWOocImaSPiDF09gaHDQbspbg8wyWrROE9q8fEEWT1tDGivfKcLMuzgqZVM5lq5gCxaPfo3cmnpjI08GO3BHnVUzLVTPwXZkX0kdes31RStxfsJnEbyPnShlRo8I08Qa2p/r/ryjr+6bBhZ5DQb0MdNk8Qq2G4DwpjoaW0Upz3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741269078; c=relaxed/simple;
	bh=xMq/gXwuGbOwdPZKg7OBqBV81DdiKtrLBRNuI+qJwjc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ssmyyh66CU3H0U2f6Qao9hM2O6rzosbj/NKxil04I2S2968zbYTHxSrSmo8ED/lOVSDTlisJIN941iWf570h1MAkcWWBJSlQxwDjVmjKCTZnIXS3PEJHEvUCdqCVr4QDrSJ7vQE/E41m1PUHkW+skBuLlmDn2tyqCCKj1Yh8iJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PfZHbCsG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F30C4CEE0;
	Thu,  6 Mar 2025 13:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741269077;
	bh=xMq/gXwuGbOwdPZKg7OBqBV81DdiKtrLBRNuI+qJwjc=;
	h=From:To:Cc:Subject:Date:From;
	b=PfZHbCsGmbNbw3l6km+Hk/s/99YLXQIB10uxwOjopesXwDCt52NATDEW9Gx1Kp0Qa
	 dmhV1g09jA9sCfaVNdq2C+bY4hQK2Hh7JyZLoo4IHVwMwLs4unG94Xj7a+MdLDp0xJ
	 zGCHbo1rKEDpu54xGOlwxFmHCuH7IwxFHZCgGcNbz70Y12Y3y6G/BEAypXnm8Xigma
	 fBYprMIew0gE417YJe6fkMKrpJKOrqRC0oEImHCxHP4s7TCSydEsfOUTshPebJbqZ+
	 B1Q5bhSTTzpaHvdg/whFGG1IjVIniSQ4by83SDauPrKKYyW7CJYhiRHUoearz2Sobi
	 Ifv8T8P6oLIMQ==
From: Maxime Ripard <mripard@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v4] Documentation: dma-buf: heaps: Add heap name definitions
Date: Thu,  6 Mar 2025 14:51:14 +0100
Message-ID: <20250306135114.1943738-1-mripard@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following a recent discussion at last Plumbers, John Stultz, Sumit
Sewal, TJ Mercier and I came to an agreement that we should document
what the dma-buf heaps names are expected to be, and what the buffers
attributes you'll get should be documented.

Let's create that doc to make sure those attributes and names are
guaranteed going forward.

Reviewed-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
Changes from v3:
  - Add TJ RB
  - Fix a few typos.

Changes from v2:
  - Remove exhaustive list of names for platforms, and just mention the
    alternatives.
  - Add MAINTAINERS entry

Changes from v1:
  - Add the mention that the cma / reserved heap is optional.
---
 Documentation/userspace-api/dma-buf-heaps.rst | 25 +++++++++++++++++++
 Documentation/userspace-api/index.rst         |  1 +
 MAINTAINERS                                   |  1 +
 3 files changed, 27 insertions(+)
 create mode 100644 Documentation/userspace-api/dma-buf-heaps.rst

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
new file mode 100644
index 000000000000..535f49047ce6
--- /dev/null
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -0,0 +1,25 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==============================
+Allocating dma-buf using heaps
+==============================
+
+Dma-buf Heaps are a way for userspace to allocate dma-buf objects. They are
+typically used to allocate buffers from a specific allocation pool, or to share
+buffers across frameworks.
+
+Heaps
+=====
+
+A heap represents a specific allocator. The Linux kernel currently supports the
+following heaps:
+
+ - The ``system`` heap allocates virtually contiguous, cacheable, buffers.
+
+ - The ``cma`` heap allocates physically contiguous, cacheable,
+   buffers. Only present if a CMA region is present. Such a region is
+   usually created either through the kernel commandline through the
+   `cma` parameter, a memory region Device-Tree node with the
+   `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
+   `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
+   might be called ``reserved``, ``linux,cma``, or ``default-pool``.
diff --git a/Documentation/userspace-api/index.rst b/Documentation/userspace-api/index.rst
index b1395d94b3fd..9cbe4390c872 100644
--- a/Documentation/userspace-api/index.rst
+++ b/Documentation/userspace-api/index.rst
@@ -42,10 +42,11 @@ Devices and I/O
 
 .. toctree::
    :maxdepth: 1
 
    accelerators/ocxl
+   dma-buf-heaps
    dma-buf-alloc-exchange
    gpio/index
    iommufd
    media/index
    dcdbas
diff --git a/MAINTAINERS b/MAINTAINERS
index 8e0736dc2ee0..ef0364e65aef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6911,10 +6911,11 @@ R:	T.J. Mercier <tjmercier@google.com>
 L:	linux-media@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/userspace-api/dma-buf-heaps.rst
 F:	drivers/dma-buf/dma-heap.c
 F:	drivers/dma-buf/heaps/*
 F:	include/linux/dma-heap.h
 F:	include/uapi/linux/dma-heap.h
 F:	tools/testing/selftests/dmabuf-heaps/
-- 
2.48.1


