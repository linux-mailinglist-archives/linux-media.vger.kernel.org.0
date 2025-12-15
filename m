Return-Path: <linux-media+bounces-48778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C35A1CBD0BC
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 09:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CEC4A301A9D5
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 08:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D3332C921;
	Mon, 15 Dec 2025 08:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gYNYswpU"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0298F32A3F0;
	Mon, 15 Dec 2025 08:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788844; cv=none; b=C9yfeYGKmD9tK+MKRr/d2hP6av1HegbQFUOayf7JMi3snPPeNqP4jsblFeOD7fASZoX+W/rPxVL75SCytZ9zYb+v+1cMZBLAAYTe6zoqCpLSTT9efY0oejqzzLHO/cNpQpZz9b1axRcJudg7Hy6AKMZh6xUhOSJlgnzmrfyBadw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788844; c=relaxed/simple;
	bh=dFDb+uXCI5iHJKzZgaeokj2YXCnxjmhPbpePbOplK+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cvdXbbx7bArpyCXad5LQpAhMxwU4tOYIxiN+/U25SRZSJ00k/ZG7VHCc+7B0NQbKns7rC3wZsVB57qWG8Mln1qrPvDFE4fsxA4FmMmUrbUe1pIcKRh7GahqcqbIX3tDEaj1nFSPl9kymJBYoX5ua/qYNL24KhSa5YP3WKiSeEZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gYNYswpU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765788839;
	bh=dFDb+uXCI5iHJKzZgaeokj2YXCnxjmhPbpePbOplK+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gYNYswpU9s2BmDrBPZKR//toSLSx6/pobaSwsrc3HzdoQ1De5M+OfiTAQQwnf1bw6
	 5m6E2fL9dj2spSHpzk8o31PZ9QvDVCfDx45YoyhdsdW3cvv7VfuIX0981gbHCpKnWg
	 Mgd+JNqM/Vv9aaxhE5Z2M73URLNOJuZSdvYOAL1vzi35ax8kY9HAUvQ+IIWWJkCkH7
	 BkVzAp3HTyBrKyeP3hG1XZVa8xe7DOct++ZlQX0fa7qzdEzCGsY2e9crwkv5HasP6t
	 Aq9yLt3JXKh++pt4Z4S6zBupxL4pFdQvLDZJJo8Puv7EXTtRED/BWNGLAXwvlclRjN
	 xou7nu+XZjMrg==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:c17e:135b:5095:83a8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ADE8817E1517;
	Mon, 15 Dec 2025 09:53:58 +0100 (CET)
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
Subject: [PATCH v10 6/7] arm64: dts: rockchip: Add verisilicon IOMMU node on RK3588
Date: Mon, 15 Dec 2025 09:53:43 +0100
Message-ID: <20251215085349.10155-7-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215085349.10155-1-benjamin.gaignard@collabora.com>
References: <20251215085349.10155-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device tree node for the Verisilicon IOMMU present
in the RK3588 SoC.
This IOMMU handles address translation for the VPU hardware blocks.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 2a7921793020..acff8bb3a612 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1364,6 +1364,17 @@ av1d: video-codec@fdc70000 {
 		clock-names = "aclk", "hclk";
 		power-domains = <&power RK3588_PD_AV1>;
 		resets = <&cru SRST_A_AV1>, <&cru SRST_P_AV1>, <&cru SRST_A_AV1_BIU>, <&cru SRST_P_AV1_BIU>;
+		iommus = <&av1d_mmu>;
+	};
+
+	av1d_mmu: iommu@fdca0000 {
+		compatible = "rockchip,rk3588-av1-iommu", "verisilicon,iommu-1.2";
+		reg = <0x0 0xfdca0000 0x0 0x600>;
+		interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_AV1>, <&cru PCLK_AV1>;
+		clock-names = "core", "iface";
+		#iommu-cells = <0>;
+		power-domains = <&power RK3588_PD_AV1>;
 	};
 
 	vop: vop@fdd90000 {
-- 
2.43.0


