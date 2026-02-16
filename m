Return-Path: <linux-media+bounces-52850-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GmOMsbokmlSzwEAu9opvQ
	(envelope-from <linux-media+bounces-52850-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 10:52:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9D214216F
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 10:52:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADEEC3013279
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 09:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76AFB2F068C;
	Mon, 16 Feb 2026 09:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="X8Y+sCYz"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF10928EA56;
	Mon, 16 Feb 2026 09:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771235512; cv=none; b=RDqdyD++C7kem7nyCqkJnRfKQ2Dy8vjrgoUZge82ZEdzvvmeW88k6JFe1hRZ1hKi/OEjN36VVwtYwD74QvQnqG4bpVwN9V3Zqmz9xfzbiKcm/kx4+tFPhEgZW6oBPI09bS2u74fCTpB7z9Ij9L0MnTJbDIypY0zHqKfEbjtkRU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771235512; c=relaxed/simple;
	bh=biCcOHqP+do8XFkuUeXeQflxOQhc4E8/7vo1QY8UTEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b8wr2jFH258A84LlGdR6yLMHpLiI1dhzU0rLvKpv9FEks5gx+25fqStNKzeCTJSE27U/6/BhlpJnwCAxwfnv9YYsdlb0Xlmz7dISKCS120eoBuVPimcv/K07aciOFLbiKq0kFXkdlxe1Bi2THGkGiAN3KKpHljjCN5eMwsHpXjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=X8Y+sCYz; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771235510;
	bh=biCcOHqP+do8XFkuUeXeQflxOQhc4E8/7vo1QY8UTEQ=;
	h=From:To:Cc:Subject:Date:From;
	b=X8Y+sCYznSOAKhUXvQM3fp9wFg6Wz2ou1+E3XMf8lilRg4/15XJJ6SjTbTDut3ljm
	 6izl9yhMNJqEt5LzmT+pKLFKpYDJvhzlnyNsXWTx4RlsdyMVJ3EGjvd/zpSdqOk1uV
	 3FqXraOjn9Ekj5mhQxIUHQWWrnpXq51PVp2Bou6QyyUKXJW5xZjteWcZVev6UX+0HA
	 5gnQ24hodfAmolyGuGgzznQr2nqrWIxfeL1wip/Pns/o9dBO0I/In45K/ZqT9Ou4c8
	 VWkqmtXMyTjdlYccZuNTgGp+vHFxzR9TMQZhW1ubboNAGhjGPS1ARmykSkx26jZif3
	 rn7quSEv/IcxA==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:f6d2:8ed9:560e:4f27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 92A7217E12E9;
	Mon, 16 Feb 2026 10:51:49 +0100 (CET)
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
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v13 0/6] Add support for Verisilicon IOMMU used by media
Date: Mon, 16 Feb 2026 10:51:32 +0100
Message-ID: <20260216095144.107356-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-52850-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.gaignard@collabora.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim]
X-Rspamd-Queue-Id: 6C9D214216F
X-Rspamd-Action: no action

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

changes in version 13:
 - On top the driver file explicit why the hardware is different than Rockchip IOMMU
 - Document why vsi_iommu_restore_ctx() is needed when using Verisilicon
   stateless video decoder.

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
 drivers/iommu/vsi-iommu.c                     | 794 ++++++++++++++++++
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  |  15 +
 include/linux/vsi-iommu.h                     |  21 +
 10 files changed, 935 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iommu/verisilicon,iommu.yaml
 create mode 100644 drivers/iommu/vsi-iommu.c
 create mode 100644 include/linux/vsi-iommu.h

-- 
2.43.0


