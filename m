Return-Path: <linux-media+bounces-13598-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9E490DBBA
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 20:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EA9C1F226FF
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 18:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E26B1607BA;
	Tue, 18 Jun 2024 18:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="URTLKdO8"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D2215EFDA;
	Tue, 18 Jun 2024 18:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718735904; cv=none; b=gVVqxJA/zV2I7o+GNagvHfExnUNmNswNDtefdxtIljdolmV4nu+Xw1/WGvbNaAXb2eVRp4kEUglFAKYwBHQdUn1jBBFVpsHF1WFF9u3ooSKkJuVN8lYh+NFpLPJgujQICnUGw67bIrO/X5l7CHcwxYuD9Mx3fwaUByzsL/Wuo8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718735904; c=relaxed/simple;
	bh=JWRpO8n0qfJ/LE7k1lFWnR99Wqz0mOCN8aOE7S7nk+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SpLRm8OKFeNDz3OysgI1/PQTOLO0E4gVTwfKJBpZ8v8h+edTZytxIrlc2IfYHE6EZ7UmfubjaSA3XPU5Obvfti/6/CgN3pU4QOyeoQDDCZdBKYFeAKt7ziM7aOcWlm6ImaYvh1ahpJGjjdjxwis1j8MHoxLp27EFx9M4gV0KhYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=URTLKdO8; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718735898;
	bh=JWRpO8n0qfJ/LE7k1lFWnR99Wqz0mOCN8aOE7S7nk+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=URTLKdO8gtshe8Dpssr/ERwHwKlx9awqT1KHKsKpTFzfRcsf7d7y0ys7tOOC7W+hf
	 vs4vkAViUm0zGQeAhqLGVeqgAOyTi8vVKxy0MG3ZtIIgFyBr873nRYQ56oycgcxH7v
	 W3jl8LVBPkVCn/pUUIHu3hDsrGT50oytb1kWGXZUxZRy9kQhjdkPZu5bT4Pb9T5W3J
	 U7Dx9u2Zxuf+7CikFyBfo/r44f7Iza/PHhUUsyPmn8f9QruYp8xPYmRgO03qSZcgn1
	 9j3W/FqOAoxzfgcczsXLyGKZrpz52z5r/DnpUqE3L3O39wk7agtlm3USXyMJxGZAfe
	 kvsZPyPvD1wcQ==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0EF87378219E;
	Tue, 18 Jun 2024 18:38:18 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 33CB54800D0; Tue, 18 Jun 2024 20:38:17 +0200 (CEST)
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
Subject: [PATCH v7 5/6] arm64: dts: rockchip: Add VEPU121 to RK3588
Date: Tue, 18 Jun 2024 20:18:36 +0200
Message-ID: <20240618183816.77597-6-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618183816.77597-1-sebastian.reichel@collabora.com>
References: <20240618183816.77597-1-sebastian.reichel@collabora.com>
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


