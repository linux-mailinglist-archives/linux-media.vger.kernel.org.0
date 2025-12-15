Return-Path: <linux-media+bounces-48772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEC3CBD0ED
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 09:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B5793026A99
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F6D28DB54;
	Mon, 15 Dec 2025 08:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TKQQJWMC"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511C5248873;
	Mon, 15 Dec 2025 08:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788839; cv=none; b=TPJAm7CuoM6TMBSmQh4Hg1hYZgU1RMP6IyQqUOaHe/XF1izf6KV1lncFPQD9QSn2j6RwU7q+74sQJ9hB5YXso52Kp3HN7qGDUUMNp7ZuCACAYpfejkvLGFDDiqcbaBSh7fT4z5VaT4ROAHJ6GhtGRlTy4Als4VgLP8mqiPowKmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788839; c=relaxed/simple;
	bh=aC7H/Tmab4zhybp7BBcY+/SuHj8ed8QSGcvjdAbp5fI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HE4SQFahBXHr2rQe/vhsBNa+62Z9lp4Yj0AEL0j0D4qAADHixmyJljoVfahmnEFDmeUwZ4Z4HoYr/a81mYngHM6j7rfPVQw9m1nl+edkrAZmp0vm+f80J2rmY+vfYs7A5Njr32qrblelqv0Cfpi4IzfVvhwIQBSB9SLs1UE3Vg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TKQQJWMC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765788835;
	bh=aC7H/Tmab4zhybp7BBcY+/SuHj8ed8QSGcvjdAbp5fI=;
	h=From:To:Cc:Subject:Date:From;
	b=TKQQJWMCtBFnIxbmr4W5ZNB5Q4tP3qsE4yacA4IQTDdWRAeNQzyJjzB+w257Jkg/L
	 RQEmk4uxadQwZ/tHiuMjCC6eE9zzCjD77ZIf5hJvVX2KofODNmJpc6f2wiwM6OXvEG
	 nCzlNqPQYOryN8AdHuziyC4NfoLs8xVGjuBnSyfCWAWGeXattFgSryU2r9QRYoepno
	 TjDKkEWZfLsgjJH25BA7loPx0t8EZ7SMjKvEFvDMexzfHMCNEHrPQFv2DcUmG1Tuwp
	 g1sXDNDJUg61HKByzWxGvDit3jrBZ3TQBHIS+E+/mfwUzhqGvi0T2BMhfZwGvxjPI2
	 nraF3V1dyT4Cw==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:c17e:135b:5095:83a8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0339017E12A2;
	Mon, 15 Dec 2025 09:53:54 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v10 0/7] Add support for Verisilicon IOMMU used by media
Date: Mon, 15 Dec 2025 09:53:37 +0100
Message-ID: <20251215085349.10155-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Hi all,

This patch series adds support for the Verisilicon IOMMU, which is found
in front
of hardware encoder and decoder blocks in several SoCs using Verisilicon
IP. 
A first implementation of this IOMMU is available on the Rockchip RK3588
SoC.

Rockchip provides a driver for this hardware in their 6.1 kernel branch:
https://github.com/rockchip-linux/kernel/blob/develop-6.1/drivers/iommu/rockchip-iommu-av1d.c

This series includes:
- a new binding for the Verisilicon IOMMU
- a driver implementation
- DT updates for RK3588

The driver was forward-ported from Rockchip’s 6.1 implementation, 
the prefix was renamed to vsi for generality, and several fixes were
applied.

AV1 decoding was tested using the stateless VPU driver and Fluster.
The test results show a score of 205/239, which confirms that no
regressions
were introduced by this series.

Feedback and testing welcome.

changes in version 10:
- Update vsi_iommu_identity_attach() and vsi_iommu_attach_device()
  prototypes.
- Fix build as module issue when Verisilicon video decoder is built-in.
- Rebase on master branch.

changes in version 9:
- removing blanks lines.

changes in version 8:
- Add myself in MAINTAINERS file.
- Add API to restore VSI iommu context from decoder driver
- Fix reported checkpatch issues: add comment in pinlock_t declaration
  and remove blank line.
- Include board name in defconfig patch commit message

changes in version 7:
- fix locking issues.
- add a patch in AV1 video decoder to manage per context iommu domain.
- fix compilation issues when build as module.
- remove useless "rockchip,rk3588-av1-iommu" compatible in driver code.

changes in version 6:
- rework lock schema in vsi_iommu_attach_device() so
  it protected against concurrent invalidation.
- flush the cache after changing of domain.

changes in version 5:
- change locking schema to use 2 spin_locks: one to protect vsi_domain
  data and one to protect vsi_iommu structure.
- make suspend/resume more robust by calling disable/enable function.
- rebased on top of v6.16-rc5

changes in version 4:
- rename and reorder compatibles fields.
- Kconfig dependencies
- Fix the remarks done by Jason and Robin: locking, clocks, macros
  probing, pm_runtime, atomic allocation.

changes in version 3:
- Change compatible to "rockchip,rk3588-iommu-1.2"
- Fix compatible in .yaml
- Update DT and driver to use "rockchip,rk3588-iommu-1.2" compatible
- Set CONFIG_VSI_IOMMU as module in defconfig
- Create an identity domain for the driver
- Fix double flush issue
- Rework attach/detach logic
- Simplify xlate function
- Discover iommu device like done in ARM driver
- Remove ARM_DMA_USE_IOMMU from Kconfig

changes in version 2:
- Add a compatible "rockchip,rk3588-av1-iommu"
- Fix clock-names in binding 
- Remove "vsi_mmu" label in binding example.
- Rework driver probe function
- Remove double flush
- Rework driver internal structures and avoid allocate
  in xlate function.
- Do not touch to VPU driver anymore (path removed)
- Add a patch to enable the driver in arm64 defconfig

Benjamin Gaignard (7):
  dt-bindings: vendor-prefixes: Add Verisilicon
  dt-bindings: iommu: verisilicon: Add binding for VSI IOMMU
  iommu: Add verisilicon IOMMU driver
  MAINTAINERS: Add entry for Verisilicon IOMMU driver
  media: verisilicon: AV1: Restore IOMMU context before decoding a frame
  arm64: dts: rockchip: Add verisilicon IOMMU node on RK3588
  arm64: defconfig: enable Verisilicon IOMMU for Rockchip RK3588

 .../bindings/iommu/verisilicon,iommu.yaml     |  71 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  11 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/iommu/Kconfig                         |  11 +
 drivers/iommu/Makefile                        |   1 +
 drivers/iommu/vsi-iommu.c                     | 808 ++++++++++++++++++
 drivers/media/platform/verisilicon/Kconfig    |   1 +
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  |  15 +
 include/linux/vsi-iommu.h                     |  21 +
 11 files changed, 950 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
 create mode 100644 drivers/iommu/vsi-iommu.c
 create mode 100644 include/linux/vsi-iommu.h

-- 
2.43.0


