Return-Path: <linux-media+bounces-34944-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB23ADB487
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 16:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 675DE3A8EF5
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 14:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95514214236;
	Mon, 16 Jun 2025 14:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BxVRxFhV"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5F88488;
	Mon, 16 Jun 2025 14:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085783; cv=none; b=iKQvsKV+q8wefBm3GA1mZVCAbt03rBIrgXT6dBbpBpuLFPz5xVwCoddy/AHWUvQnq5IrOpPd9ur5LYOXRtQMox+fg9+5mL606mrhmrEqNVCCgjb11RmQLjKiO3yC7frUwjvdwA+ZSoel5rb0sMqT47eyKrZgz8XxnhULJ3GNRc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085783; c=relaxed/simple;
	bh=IPS5pyYgHpxPgbxv/IHzWa6tUPv1UYhANfe/623koZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Pb40Z8bLi80azv1C0ixGZKfmwE3p/FKtEE33JFRMEP0urCTcM4mNd9OSGVB11B0x36AdhrFvVcXOV5RZq3Gpf8S7TbkwM7wVcYnPgfUS7Brq9ryBNDPvw5vae3nGVKyWTpIZKBbN1UNOwyO8Aeqjj+ZJF6PNVdfAYj9mN3MZMxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BxVRxFhV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750085773;
	bh=IPS5pyYgHpxPgbxv/IHzWa6tUPv1UYhANfe/623koZ8=;
	h=From:To:Cc:Subject:Date:From;
	b=BxVRxFhVDcNmrDeC1P7uctqpOqyITQjUmL2LbGMF+iJg8NMWcE3x08UyLK1IYq8Xz
	 9dcQrJltVxmVug43XszNFWEAHtwAm+hhX44hB0teZVItmBmKhG58IJ/K2yPCSB0PBs
	 jt9KA4RjtPoUcF/w3CAWGVGW5uv49wFMF+YzpC3xQQP8CQgVD+KokYwALEAHpZN4Us
	 mRWFOv6TQxj7Vw+KgWfHtxP48Xh2kMN7modxcVvNbYXQSpCVMwtyOHhLybmEsqN8nY
	 PQHep9xrChhiclR2SMiAN1LHp5GDgCu7SdZv0hTY2ZwuCbFWHQpzGlBPAZGWSM14XP
	 UefVISx0bXPnw==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4811:e81c:4b33:730c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BE19517E088C;
	Mon, 16 Jun 2025 16:56:12 +0200 (CEST)
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
Subject: [PATCH 0/5] Add support for Verisilicon IOMMU used by media codec blocks
Date: Mon, 16 Jun 2025 16:55:48 +0200
Message-ID: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
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

This patch series adds support for the Verisilicon IOMMU, which is found in front
of hardware encoder and decoder blocks in several SoCs using Verisilicon IP. 
A first implementation of this IOMMU is available on the Rockchip RK3588 SoC.

Rockchip provides a driver for this hardware in their 6.1 kernel branch:
https://github.com/rockchip-linux/kernel/blob/develop-6.1/drivers/iommu/rockchip-iommu-av1d.c

This series includes:
- a new binding for the Verisilicon IOMMU
- a basic driver implementation
- DT updates for RK3588
- integration with the Verisilicon VPU driver.

The driver was forward-ported from Rockchip’s 6.1 implementation, 
the prefix was renamed to vsi for generality, and several fixes were applied.

AV1 decoding was tested using the stateless VPU driver and Fluster.
The test results show a score of 205/239, which confirms that no regressions
were introduced by this series.

Feedback and testing welcome.

Thanks,
Benjamin

Benjamin Gaignard (5):
  dt-bindings: vendor-prefixes: Add Verisilicon
  dt-bindings: iommu: verisilicon: Add binding for VSI IOMMU
  iommu: Add verisilicon IOMMU driver
  arm64: dts: rockchip: Add verisilicon IOMMU node on RK3588
  media: verisilicon: Flush IOMMU before decoding a frame

 .../bindings/iommu/verisilicon,iommu.yaml     |  71 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |  11 +
 drivers/iommu/Kconfig                         |   8 +
 drivers/iommu/Makefile                        |   1 +
 drivers/iommu/vsi-iommu.c                     | 900 ++++++++++++++++++
 .../media/platform/verisilicon/hantro_drv.c   |  11 +
 7 files changed, 1004 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
 create mode 100644 drivers/iommu/vsi-iommu.c

-- 
2.43.0


