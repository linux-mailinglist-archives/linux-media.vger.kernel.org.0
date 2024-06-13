Return-Path: <linux-media+bounces-13194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF795907458
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 15:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58894284F44
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 13:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE316146D42;
	Thu, 13 Jun 2024 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oLzfqXLM"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4482145FE3;
	Thu, 13 Jun 2024 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718286643; cv=none; b=MAYU0hylP9pMyxAGrLwr/Z1igOWUvWkdnQtdOMp5sbbIGjcxmIW9QFBZo95c6l/VrrO/nTEbiUf47OgwKbiQ3COwkCymWIddl0cF0nlZkhxn5nO+qAI8nc4RVu8eQDmg4sQkh8YC5716BtJBIAJ5RG87gsLXcINog5E43RX1J/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718286643; c=relaxed/simple;
	bh=JWRpO8n0qfJ/LE7k1lFWnR99Wqz0mOCN8aOE7S7nk+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qkeq3LXSGCq8N3Budr31FVkNnTLoCdPbvcYjUv77ix/P6rCyHUOrpxhY+xian9TdFzNju17POMhoHOUtu0vwbXL7dg7quzv8bSkEIva8OlxpEKxjtZ5kE/0B0DNfO/rQO0Dgilg6yrzyH7x1mgESrmDiC4tUSK9XaStX1NmlVCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oLzfqXLM; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718286637;
	bh=JWRpO8n0qfJ/LE7k1lFWnR99Wqz0mOCN8aOE7S7nk+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oLzfqXLMQHV0tQG8tRH8y30stFVoMzixKnoDXWXyxXfM3g1ZQw9J6MhtWt5j5p3rX
	 mWif4R46rm68J4jx+HjKZv6+SfuAK/al6Zb/Hgv4AsfcMGEqgs/JKTfeObFgiPtT0B
	 IvM2CJr/RJpgb3Y9kQpApJO9O2tjYhOCPHxObteB4pMEfWa/YYqAGS2/QpIACW3B8w
	 ZHx+o4+qICXJ3E3rFhQ3G1U84OO/+CxWezH33355FLVgYp6qjDXuopgBV0aBRc0mv3
	 eIxAb6o8tLCRcFrB2whr32Xy9ATKwIwBsKHHkw5MAyr2/YGkGN2YaxvCo8nbPLacNT
	 yV2wo3kpa9KUg==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1773537821B7;
	Thu, 13 Jun 2024 13:50:37 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3A4A04800D0; Thu, 13 Jun 2024 15:50:36 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v6 5/6] arm64: dts: rockchip: Add VEPU121 to RK3588
Date: Thu, 13 Jun 2024 15:48:46 +0200
Message-ID: <20240613135034.31684-6-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240613135034.31684-1-sebastian.reichel@collabora.com>
References: <20240613135034.31684-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

RK3588 has 4 Hantro G1 encoder-only cores. They are all independent IP,
but can be used as a cluster (i.e. sharing work between the cores).
These cores are called VEPU121 in the TRM. The TRM describes one more
VEPU121, but that is combined with a Hantro H1. That one will be handled
using the VPU binding instead.

Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 80 +++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
index 6ac5ac8b48ab..dd85d4e55922 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
@@ -1159,6 +1159,86 @@ power-domain@RK3588_PD_SDMMC {
 		};
 	};
 
+	vepu121_0: video-codec@fdba0000 {
+		compatible = "rockchip,rk3588-vepu121";
+		reg = <0x0 0xfdba0000 0x0 0x800>;
+		interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_ENCODER0>, <&cru HCLK_JPEG_ENCODER0>;
+		clock-names = "aclk", "hclk";
+		iommus = <&vepu121_0_mmu>;
+		power-domains = <&power RK3588_PD_VDPU>;
+	};
+
+	vepu121_0_mmu: iommu@fdba0800 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdba0800 0x0 0x40>;
+		interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_ENCODER0>, <&cru HCLK_JPEG_ENCODER0>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_VDPU>;
+		#iommu-cells = <0>;
+	};
+
+	vepu121_1: video-codec@fdba4000 {
+		compatible = "rockchip,rk3588-vepu121";
+		reg = <0x0 0xfdba4000 0x0 0x800>;
+		interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_ENCODER1>, <&cru HCLK_JPEG_ENCODER1>;
+		clock-names = "aclk", "hclk";
+		iommus = <&vepu121_1_mmu>;
+		power-domains = <&power RK3588_PD_VDPU>;
+	};
+
+	vepu121_1_mmu: iommu@fdba4800 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdba4800 0x0 0x40>;
+		interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_ENCODER1>, <&cru HCLK_JPEG_ENCODER1>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_VDPU>;
+		#iommu-cells = <0>;
+	};
+
+	vepu121_2: video-codec@fdba8000 {
+		compatible = "rockchip,rk3588-vepu121";
+		reg = <0x0 0xfdba8000 0x0 0x800>;
+		interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_ENCODER2>, <&cru HCLK_JPEG_ENCODER2>;
+		clock-names = "aclk", "hclk";
+		iommus = <&vepu121_2_mmu>;
+		power-domains = <&power RK3588_PD_VDPU>;
+	};
+
+	vepu121_2_mmu: iommu@fdba8800 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdba8800 0x0 0x40>;
+		interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_ENCODER2>, <&cru HCLK_JPEG_ENCODER2>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_VDPU>;
+		#iommu-cells = <0>;
+	};
+
+	vepu121_3: video-codec@fdbac000 {
+		compatible = "rockchip,rk3588-vepu121";
+		reg = <0x0 0xfdbac000 0x0 0x800>;
+		interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_ENCODER3>, <&cru HCLK_JPEG_ENCODER3>;
+		clock-names = "aclk", "hclk";
+		iommus = <&vepu121_3_mmu>;
+		power-domains = <&power RK3588_PD_VDPU>;
+	};
+
+	vepu121_3_mmu: iommu@fdbac800 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdbac800 0x0 0x40>;
+		interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_ENCODER3>, <&cru HCLK_JPEG_ENCODER3>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_VDPU>;
+		#iommu-cells = <0>;
+	};
+
 	av1d: video-codec@fdc70000 {
 		compatible = "rockchip,rk3588-av1-vpu";
 		reg = <0x0 0xfdc70000 0x0 0x800>;
-- 
2.43.0


