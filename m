Return-Path: <linux-media+bounces-29163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A8FA77E9B
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 17:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DEC0188B0E7
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 15:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E4E207676;
	Tue,  1 Apr 2025 15:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bg/itma8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33897205510;
	Tue,  1 Apr 2025 15:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743520354; cv=none; b=WU+xqj4jHoRZyF7/g91RtHTUG+pQRgAjFtjGLMFgzeTDdkq/TcOIaGzpw7kearHNdDBiIGOqqtZYQJ6glXZqH9pVD4k7wZ6JRyM3wXqRwI4Oxuy+W+JfPdJ5WQ4AVDSsB3gNLQd0KkWTbwaIpypd1p9gTQv1/0DK8vgC82N4sD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743520354; c=relaxed/simple;
	bh=KZXcafL2auCLUJgbm7uw6IG9C/2A7tu8xp8GCwbcb38=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b51dFN8YvGCwBGAHK8MLlTf6FH1S1xlv9q+O4x7/2ibAwWzXIkm2mWdWeDlYum3vr8Rr2NqBBnxISOl6ZytoyQxTOUIJhFV3Ft4lzbGI1SslJR3ibxvPeIrHfmJcXSpo635Qx2b+iTd07RQs+3Yc2J6Mhrb0Jsis3TLOCKT6Wiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bg/itma8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62789C4CEE4;
	Tue,  1 Apr 2025 15:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743520353;
	bh=KZXcafL2auCLUJgbm7uw6IG9C/2A7tu8xp8GCwbcb38=;
	h=From:Subject:Date:To:Cc:From;
	b=Bg/itma8fp+k16JA1TqDRICROFJycG/+xJnlTOJ7+OdUBKGS5hzq1dzPLEI5KtP0n
	 qkL4vzIJ/OAqg2RCudlGmB/AFraHLCTe2/AuexjncR/1qLXfxe85J350WmaJtKCQDd
	 aqd6PQmk6ItZC0UxM+WbAUc1UiziOO7UMLrmru6+aZ8nkTDrXGTsCqGF4xkCChHzCf
	 vGYMcE6/bmkYO11TyuFFeOtekd1SIpTGKTXFC5w/SyFMf20HhfXZAgdvuwJiHa9KIK
	 Q5IBRRjVIV8LvIHq4QpPrmuHg9lBZXcQfBhnbVxEcxLSUq6HgocT/In4U8YfhnNrlp
	 ugwwUpI4bu15A==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 0/2] dma-buf: heaps: Support carved-out heaps
Date: Tue, 01 Apr 2025 17:12:20 +0200
Message-Id: <20250401-dma-buf-ecc-heap-v2-0-043fd006a1af@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFQC7GcC/32NTQ6CMBBGr0Jm7ZhObRNx5T0Ii/4MtFGBtEo0p
 He3cgCX7yXf+zbInCJnuDQbJF5jjvNUQR4acMFMI2P0lUEKqYQmjf5h0L4GZOcwsFlQns2JyEv
 XKoY6WxIP8b0nu75yiPk5p8/+sNLP/omthAK1ctZ6oVpNdL1xmvh+nNMIfSnlCxcCXfaxAAAA
X-Change-ID: 20240515-dma-buf-ecc-heap-28a311d2c94e
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2423; i=mripard@kernel.org;
 h=from:subject:message-id; bh=KZXcafL2auCLUJgbm7uw6IG9C/2A7tu8xp8GCwbcb38=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOlvmMKXs2Wcnil56IeYVdCv5UZL8gxXslzZkvf3u/JP7
 TaF3XZPOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRlRsZfrNfLmbxXKH5cOv/
 Ax9DL99h/zDDseWlB8OOaRqM/DZ5vjsZGe4LT5ZavHZ2nJfMo5WOJ3pO3T++8P/ZnP83A7gm+ct
 NMWAHAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Hi,

This series is the follow-up of the discussion that John and I had some
time ago here:

https://lore.kernel.org/all/CANDhNCquJn6bH3KxKf65BWiTYLVqSd9892-xtFDHHqqyrroCMQ@mail.gmail.com/

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

Thus, even though the uAPI part of it has been dropped in this second
version, we still need a driver to create heaps out of carved-out memory
regions. In addition to the original usecase, a similar driver can be
found in BSPs from most vendors, so I believe it would be a useful
addition to the kernel.

I submitted a draft PR to the DT schema for the bindings used in this
PR:
https://github.com/devicetree-org/dt-schema/pull/138

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v2:
- Add vmap/vunmap operations
- Drop ECC flags uapi
- Rebase on top of 6.14
- Link to v1: https://lore.kernel.org/r/20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org

---
Maxime Ripard (2):
      dma-buf: heaps: system: Remove global variable
      dma-buf: heaps: Introduce a new heap for reserved memory

 drivers/dma-buf/heaps/Kconfig         |   8 +
 drivers/dma-buf/heaps/Makefile        |   1 +
 drivers/dma-buf/heaps/carveout_heap.c | 360 ++++++++++++++++++++++++++++++++++
 drivers/dma-buf/heaps/system_heap.c   |  17 +-
 4 files changed, 381 insertions(+), 5 deletions(-)
---
base-commit: fcbf30774e82a441890b722bf0c26542fb82150f
change-id: 20240515-dma-buf-ecc-heap-28a311d2c94e

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


