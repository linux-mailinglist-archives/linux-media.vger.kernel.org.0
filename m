Return-Path: <linux-media+bounces-35072-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B423ADCB7F
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 14:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07E4717BC48
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 12:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A24B2E2F00;
	Tue, 17 Jun 2025 12:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lhZ/y8oV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB7D2DE1E7;
	Tue, 17 Jun 2025 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163149; cv=none; b=o5fkYAempXQ28TBczqn6KeMf/JFYSdGx/fK1XkzsxfsuO0YVcsTQMOjOqi629gmpjNYQVV+snLW5ywyXe4HkNZmkqbnaDSo9A8N5N03gKDZc1b9cZFdTzad+qS+IGPpw3ORlJZOdWVRS8VzUUAKh9JgcLaxOVckzpfnuPnDJ410=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163149; c=relaxed/simple;
	bh=aoNET68UJIiLHYzCWITUHaaHkuJoHm/VQY7CwpH5NQw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EdzR1AkWnASsXRoxZrwegzDll+Oiy2ocZKb68xRWhhhZ5v0pgHo5n8Ul13RjhPUFL2ZGoCD9zi/bScbsCr9i73+HxhPyUDqg1ohGnaWHphtv3x1RdcRVMkzBfsMF4FVpGI2ltd4AMWyIQnxyUiOWvgMVsCB1CFLYHaLpUHHI6E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lhZ/y8oV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FF6C4CEE3;
	Tue, 17 Jun 2025 12:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750163149;
	bh=aoNET68UJIiLHYzCWITUHaaHkuJoHm/VQY7CwpH5NQw=;
	h=From:Subject:Date:To:Cc:From;
	b=lhZ/y8oVCPQyDybARc9LQ/ZtkG8+ESnzbX40CQqwTEW8F1VrJVAs2VNyFB+LcPwTN
	 BuVDDoVAGMnXpDtVqRFVfLW/BWMNdjV6+I8MHQA26MHUkmi6f1nxLri8kGUemQogX3
	 ZjBlJmS4yD0k7xwww+1ihUoJlspN9UZla6vZukSPtMIc8NEKGSPk5Z5rAP1rBWsHhY
	 kbTg1ssV4t+gkxNQxDRQOrMWhzSkFoAtDm8Jri6ckVq4RFRdQkjq7i4iTworFioluh
	 EHR6GNGonvywjhZAstchFCGYE5WXom0gyT5KEJZoUHHk4M7tGl/OKLOnFl+tH8dewq
	 7VpmW1naLviqA==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v5 0/2] dma-buf: heaps: Support carved-out heaps
Date: Tue, 17 Jun 2025 14:25:39 +0200
Message-Id: <20250617-dma-buf-ecc-heap-v5-0-0abdc5863a4f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMNeUWgC/33N3U7DMAyG4VuZcoyR7Tgb5Yj7QDvIj7NGQDulr
 AJNvXeySQjQKg7fT/Ljs5m0Fp3M4+Zsqs5lKuPQwt1tTOz9cFAoqbVhZEFHDtKbh3DKoDFCr/4
 I/OAtUeLYiZp2dqyay8eVfN637sv0PtbP64eZLus/2EyA4CSGkFA6R/T0onXQ1/uxHsxFm/lbc
 ChIKwI3AcXmhLj15PONYH8LuxXBNqHbxZTs1rvM3Y0gP4JjXBEECEJipUwhCMc/wrIsX+uH3YR
 3AQAA
X-Change-ID: 20240515-dma-buf-ecc-heap-28a311d2c94e
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3003; i=mripard@kernel.org;
 h=from:subject:message-id; bh=aoNET68UJIiLHYzCWITUHaaHkuJoHm/VQY7CwpH5NQw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmBcSf8lUxWPr39QW9m2N5G/bJYdkHZNd805rH/d7l1+
 HTjpiuSHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi3baMteIrVhzjql6pvG9D
 Wsl0b+FPh9wOnFnMl7L8v6Ob/xLb+QdfzGFJmfq1ZEHM88lbPVOfqjM2rL47XbCaQ0Voe9S1sET
 +aAezgxtjj0760TnlScgvl6kze/y4JtxcE35qsopg+rJzao9iAA==
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

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
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
Maxime Ripard (2):
      dt-bindings: reserved-memory: Introduce carved-out memory region binding
      dma-buf: heaps: Introduce a new heap for reserved memory

 .../bindings/reserved-memory/carved-out.yaml       |  49 +++
 drivers/dma-buf/heaps/Kconfig                      |   8 +
 drivers/dma-buf/heaps/Makefile                     |   1 +
 drivers/dma-buf/heaps/carveout_heap.c              | 362 +++++++++++++++++++++
 4 files changed, 420 insertions(+)
---
base-commit: d076bed8cb108ba2236d4d49c92303fda4036893
change-id: 20240515-dma-buf-ecc-heap-28a311d2c94e

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


