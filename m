Return-Path: <linux-media+bounces-44247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F91EBD2156
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 10:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D518018995B8
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 08:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B712F9D91;
	Mon, 13 Oct 2025 08:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pwmZt5RI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C40223DFD;
	Mon, 13 Oct 2025 08:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760344521; cv=none; b=TagOhPpFTVl/WRTMCVGWLK7niRPotpi5YT+Emp5N29nXdnhC1ssIFCoV6xLq1R3dRX0RXf6ftRNLuNJb4ANAnX3iv9EhEGOLOGDPQgm7FJehyCOoWCHnsmCyllXoedg8Uwhx0NMs3CG2x1sGvNS9nrerSWPbOSl+79vrQkb30Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760344521; c=relaxed/simple;
	bh=sqP8me6x8vHK+dhZnCoXUPEUGaQUJmxSAwIYgLVXXfQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oCZ2P3LrMWXXuYkoPJc84TkYXaNmY9kt50v1JLjL01PK6K4DIou1sw2e7Hkl8t+feEIsWWgRCH12n2EShi0QkBTMItcXZDKpx+YXkmB/XQSENVIDz9dc8fs6ZEredimdXx2IDYWwPm4VniRswCDJQmBdUyNJF5xoyNPfMdSapOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pwmZt5RI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F4FC116C6;
	Mon, 13 Oct 2025 08:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760344521;
	bh=sqP8me6x8vHK+dhZnCoXUPEUGaQUJmxSAwIYgLVXXfQ=;
	h=From:Subject:Date:To:Cc:From;
	b=pwmZt5RIWCiJOqlM4kLmg22p30EWttw4n5RbO1SzjJ8m4xXzlcqDSelkkq5d/zJ1l
	 5WT6Mxii6RJQootl5x0DFx2EdLeowWhCB9zRA6bsC+X2Ezuf7lwfpsTmcO86s/cSic
	 IoC7l9HyOpeR00mN3w0N4HU4RroNongmYqxLGvdqL/jlGt0+WFodR0a0WaepCS3BvZ
	 jPbOJSwH7h6WhwnyF60hH5//lpH/4zm2I2Hr2GszteYNPus9EtH8JRUrTLQxK0+R+c
	 dLrPu3ZkqnuMcCyCxmMfqLliYCr8LPIU8VW3QKnFkgbp1l/DQ8csL8EIwbRmlVmVj7
	 /IezHZX/0eGzg==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v8 0/5] dma-buf: heaps: Create a CMA heap for each CMA
 reserved region
Date: Mon, 13 Oct 2025 10:35:15 +0200
Message-Id: <20251013-dma-buf-ecc-heap-v8-0-04ce150ea3d9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMO57GgC/33SyU7DMBAA0F+JfMaRx1uSCqH+B+LgZUxCSVPsN
 AJV/XecFtSiRBzHkt+sJ5IwdpjIpjiRiFOXumGfg/qhIK41+1eknc8x4YxLpkBR3xtqj4Gic7R
 Fc6C8NgLAc9dIJPnbIWLoPi/k80uO2y6NQ/y6ZJhgfv0Hm4AyqqSz1jPZKIDtDuMe38shvpJZm
 /ivoJhksCLwLDApgmdMGzBhIYh7oVoRRBaaynkvtFGBNwtB3gTF2YogKVDrOUIAayV3C0HdBA1
 rNai5C2O9U7UWRi670DehYs2KoLPgjWtsqFkQyi+E6k7ga5Os5hoE1EIjmEbyP8L5uuqIH8d8N
 ON136THlMzlaDbF4097DARwASVUXGpe5dG87fJlmbSN6Fszlm7on+bLsSYhzUHfjZti0iVoGp3
 Kqc7fL7YOk6cCAAA=
X-Change-ID: 20240515-dma-buf-ecc-heap-28a311d2c94e
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

Hi,

Here's another attempt at supporting user-space allocations from a
specific carved-out reserved memory region.

The initial problem we were discussing was that I'm currently working on
a platform which has a memory layout with ECC enabled. However, enabling
the ECC has a number of drawbacks on that platform: lower performance,
increased memory usage, etc. So for things like framebuffers, the
trade-off isn't great and thus there's a memory region with ECC disabled
to allocate from for such use cases.

After a suggestion from John, I chose to first start using heap
allocations flags to allow for userspace to ask for a particular ECC
setup. This is then backed by a new heap type that runs from reserved
memory chunks flagged as such, and the existing DT properties to specify
the ECC properties.

After further discussion, it was considered that flags were not the
right solution, and relying on the names of the heaps would be enough to
let userspace know the kind of buffer it deals with.

Thus, even though the uAPI part of it had been dropped in this second
version, we still needed a driver to create heaps out of carved-out memory
regions. In addition to the original usecase, a similar driver can be
found in BSPs from most vendors, so I believe it would be a useful
addition to the kernel.

Some extra discussion with Rob Herring [1] came to the conclusion that
some specific compatible for this is not great either, and as such an
new driver probably isn't called for either.

Some other discussions we had with John [2] also dropped some hints that
multiple CMA heaps might be a good idea, and some vendors seem to do
that too.

So here's another attempt that doesn't affect the device tree at all and
will just create a heap for every CMA reserved memory region.

It also falls nicely into the current plan we have to support cgroups in
DRM/KMS and v4l2, which is an additional benefit.

Let me know what you think,
Maxime

1: https://lore.kernel.org/all/20250707-cobalt-dingo-of-serenity-dbf92c@houat/
2: https://lore.kernel.org/all/CANDhNCroe6ZBtN_o=c71kzFFaWK-fF5rCdnr9P5h1sgPOWSGSw@mail.gmail.com/

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v8:
- Rebased on top of 6.18-rc1
- Added TJ R-b
- Link to v7: https://lore.kernel.org/r/20250721-dma-buf-ecc-heap-v7-0-031836e1a942@kernel.org

Changes in v7:
- Invert the logic and register CMA heap from the reserved memory /
  dma contiguous code, instead of iterating over them from the CMA heap.
- Link to v6: https://lore.kernel.org/r/20250709-dma-buf-ecc-heap-v6-0-dac9bf80f35d@kernel.org

Changes in v6:
- Drop the new driver and allocate a CMA heap for each region now
- Dropped the binding
- Rebased on 6.16-rc5
- Link to v5: https://lore.kernel.org/r/20250617-dma-buf-ecc-heap-v5-0-0abdc5863a4f@kernel.org

Changes in v5:
- Rebased on 6.16-rc2
- Switch from property to dedicated binding
- Link to v4: https://lore.kernel.org/r/20250520-dma-buf-ecc-heap-v4-1-bd2e1f1bb42c@kernel.org

Changes in v4:
- Rebased on 6.15-rc7
- Map buffers only when map is actually called, not at allocation time
- Deal with restricted-dma-pool and shared-dma-pool
- Reword Kconfig options
- Properly report dma_map_sgtable failures
- Link to v3: https://lore.kernel.org/r/20250407-dma-buf-ecc-heap-v3-0-97cdd36a5f29@kernel.org

Changes in v3:
- Reworked global variable patch
- Link to v2: https://lore.kernel.org/r/20250401-dma-buf-ecc-heap-v2-0-043fd006a1af@kernel.org

Changes in v2:
- Add vmap/vunmap operations
- Drop ECC flags uapi
- Rebase on top of 6.14
- Link to v1: https://lore.kernel.org/r/20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org

---
Maxime Ripard (5):
      doc: dma-buf: List the heaps by name
      dma-buf: heaps: cma: Register list of CMA regions at boot
      dma: contiguous: Register reusable CMA regions at boot
      dma: contiguous: Reserve default CMA heap
      dma-buf: heaps: cma: Create CMA heap for each CMA reserved region

 Documentation/userspace-api/dma-buf-heaps.rst | 24 ++++++++------
 MAINTAINERS                                   |  1 +
 drivers/dma-buf/heaps/Kconfig                 | 10 ------
 drivers/dma-buf/heaps/cma_heap.c              | 47 +++++++++++++++++----------
 include/linux/dma-buf/heaps/cma.h             | 16 +++++++++
 kernel/dma/contiguous.c                       | 11 +++++++
 6 files changed, 72 insertions(+), 37 deletions(-)
---
base-commit: 47633099a672fc7bfe604ef454e4f116e2c954b1
change-id: 20240515-dma-buf-ecc-heap-28a311d2c94e
prerequisite-message-id: <20250610131231.1724627-1-jkangas@redhat.com>
prerequisite-patch-id: bc44be5968feb187f2bc1b8074af7209462b18e7
prerequisite-patch-id: f02a91b723e5ec01fbfedf3c3905218b43d432da
prerequisite-patch-id: e944d0a3e22f2cdf4d3b3906e5603af934696deb

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


