Return-Path: <linux-media+bounces-50670-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D21D1DE76
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 11:14:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 43BBC30326FE
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 10:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A4838A9C9;
	Wed, 14 Jan 2026 10:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AlnMEg2e"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D99E38B7BA;
	Wed, 14 Jan 2026 10:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768385371; cv=none; b=fWX9phXOISoOBy9YpEwn28OZTabaLg/GPSAmW9JlnNHQA185BUkmspJJgIlar7XCs/g7w9i3mhCZiLbWWm+d0JDoqnLdht3EKx9RMe7yLN0YTKpxBYZzIndG+nyjLOAHIAEbrcCObFmhYGYLZMH9P1YOIPAJrjP+0eJGbnf0Iwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768385371; c=relaxed/simple;
	bh=DNtLMGNbZb6Rx7hXH70qj+NI37bo1I4GXdx0IehFZUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aaRJB3VIgWAeehCWdxdBomgIGHLvNfPXiobYbf1rflEb7gOoELWeWb9XmrreNTK99boqkmoWmr5jHDv4oDHa6VpDSKeidrBC5U9qm90co98vhHOm1QEl7LTnD/tCWqOe6uV5HQdo++wYLNU+oOLOiXS11e7aYfeHUvWauXjW1Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AlnMEg2e; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768385367;
	bh=DNtLMGNbZb6Rx7hXH70qj+NI37bo1I4GXdx0IehFZUk=;
	h=From:To:Cc:Subject:Date:From;
	b=AlnMEg2e1zxsSG5taOVeiWQd8KWq7fUvwlsgur8Ag9kbN15koWkGWxik7QdVGAALc
	 2RqifSLwOa9W/fgtUsmMCczEWbf9kQMb6+6vZOlgg1OmJ+R+Av7Lc0++t6z5H0lQd6
	 aycLkCZKNp0jyybwWskXmyhwUXYBFLeuF+Dd+MbUVrCbAqjJrUp9nFYZSlZ1x646Jj
	 wv0HoXXrFDocjr49DTid7d1vaFbwyKrhjRuE6Fp1AjwfAhrjXZW1El/7ZBKYGpFV9k
	 oziHsI3omcdIm/fwHcpWJv1ebzgyhoo+V2NhtrKPL6BqsctagRHYgPrckibpA8RDuQ
	 RhytmLaV0rmKQ==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:1dad:60e8:7174:bd20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 512CD17E10C8;
	Wed, 14 Jan 2026 11:09:27 +0100 (CET)
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
Subject: [PATCH v12 0/6] Add support for Verisilicon IOMMU used by media
Date: Wed, 14 Jan 2026 11:09:12 +0100
Message-ID: <20260114100922.149187-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=a
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
regressions were introduced by this series.

Feedback and testing welcome.

changes in version 12:
- Remove useless vsi_iommu_flush_tlb_all()
- Merge MAINTAINERS changes in the patch introducing VSI iommu driver

changes in version 11:
- Fix dependency issue when decoder driver is build as module.

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

 
Benjamin Gaignard (6):
  dt-bindings: vendor-prefixes: Add Verisilicon
  dt-bindings: iommu: verisilicon: Add binding for VSI IOMMU
  iommu: Add verisilicon IOMMU driver
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
 drivers/iommu/vsi-iommu.c                     | 778 ++++++++++++++++++
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  |  15 +
 include/linux/vsi-iommu.h                     |  21 +
 10 files changed, 919 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
 create mode 100644 drivers/iommu/vsi-iommu.c
 create mode 100644 include/linux/vsi-iommu.h

-- 
2.43.0


