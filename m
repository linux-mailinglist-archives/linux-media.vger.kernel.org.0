Return-Path: <linux-media+bounces-13074-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E60905A09
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 19:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A78631F223B7
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 17:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02767184109;
	Wed, 12 Jun 2024 17:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PqcYgz1F"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D7617E91E;
	Wed, 12 Jun 2024 17:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718213546; cv=none; b=WMwUHAdrJ5Fu6RsR+4n+PXkiOJBrIRWmeVO9oHQtLkTEWDR1uZ/W0llPignp8c1ETTf8HJIuDhnmmIvQ0hOZDZyaCWIaLAAMkBx76Oc3U/uW3mROf5T1+QhtyyoFRdKpr2AvQTkdxVJjmgRzP5imqKqYGbAJSxwgyZNXPgA68m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718213546; c=relaxed/simple;
	bh=r9Pm0rMa12TnlTbVnCAif5kBsOtAXCY8BoST484+vUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hZY24DCVlCnHwWau6hUAKR9K40aZTtRMRTDC6h/Jp5QMbc8p4pIgB90zA5Ts0r8fY2E4pcL1lP5OnsFdRSWtup+8TIW4/GhjRfj8SeYjOnta430v9glBsUfaFCNykHf91oGi99bMqXiixR/B3C/INGfRssLvfJDruMuUWlYTSoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PqcYgz1F; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718213542;
	bh=r9Pm0rMa12TnlTbVnCAif5kBsOtAXCY8BoST484+vUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PqcYgz1FzL+j/xAfT53N0okz1nknSrba+8D8H82pfxa/tY/HR9Z8wGzKbiNivoEff
	 CpqM2XcjJ1LobLBYxrvkKKmZBx0TCuRgQ7zSOK78tfphvEpxw77W2QTA9BQ1ti/c+0
	 ipDCrBAxt14PHeK4phaBk7ysmWZciAwOkiNVNEuNXm7SjXLlkkOenChUE1InBvAaD7
	 Uhtk13fDS34ncRiPnQz6gsea3Fn4ewzT8KO2x+ftf2ChRm/OTapc90JSoBa3QFQOiv
	 lW2BX/9OtlkB8k7ZsnWdkK8UzKtp1Ku4lwUrhu+AwwQ8r0ndRuhyHZ1lkLQ3hoIq/s
	 9YZMktstN/KHA==
Received: from jupiter.universe (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D1BCF3781139;
	Wed, 12 Jun 2024 17:32:21 +0000 (UTC)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 607274800CF; Wed, 12 Jun 2024 19:32:21 +0200 (CEST)
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
Subject: [PATCH v5 4/5] arm64: dts: rockchip: Add VEPU121 to RK3588
Date: Wed, 12 Jun 2024 19:15:44 +0200
Message-ID: <20240612173213.42827-5-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240612173213.42827-1-sebastian.reichel@collabora.com>
References: <20240612173213.42827-1-sebastian.reichel@collabora.com>
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
index 6ac5ac8b48ab..9edbcfe778ca 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
@@ -1159,6 +1159,86 @@ power-domain@RK3588_PD_SDMMC {
 		};
 	};
 
+	jpeg_enc0: video-codec@fdba0000 {
+		compatible = "rockchip,rk3588-vepu121";
+		reg = <0x0 0xfdba0000 0x0 0x800>;
+		interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_ENCODER0>, <&cru HCLK_JPEG_ENCODER0>;
+		clock-names = "aclk", "hclk";
+		iommus = <&jpeg_enc0_mmu>;
+		power-domains = <&power RK3588_PD_VDPU>;
+	};
+
+	jpeg_enc0_mmu: iommu@fdba0800 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdba0800 0x0 0x40>;
+		interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_ENCODER0>, <&cru HCLK_JPEG_ENCODER0>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_VDPU>;
+		#iommu-cells = <0>;
+	};
+
+	jpeg_enc1: video-codec@fdba4000 {
+		compatible = "rockchip,rk3588-vepu121";
+		reg = <0x0 0xfdba4000 0x0 0x800>;
+		interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_ENCODER1>, <&cru HCLK_JPEG_ENCODER1>;
+		clock-names = "aclk", "hclk";
+		iommus = <&jpeg_enc1_mmu>;
+		power-domains = <&power RK3588_PD_VDPU>;
+	};
+
+	jpeg_enc1_mmu: iommu@fdba4800 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdba4800 0x0 0x40>;
+		interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_ENCODER1>, <&cru HCLK_JPEG_ENCODER1>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_VDPU>;
+		#iommu-cells = <0>;
+	};
+
+	jpeg_enc2: video-codec@fdba8000 {
+		compatible = "rockchip,rk3588-vepu121";
+		reg = <0x0 0xfdba8000 0x0 0x800>;
+		interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_ENCODER2>, <&cru HCLK_JPEG_ENCODER2>;
+		clock-names = "aclk", "hclk";
+		iommus = <&jpeg_enc2_mmu>;
+		power-domains = <&power RK3588_PD_VDPU>;
+	};
+
+	jpeg_enc2_mmu: iommu@fdba8800 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdba8800 0x0 0x40>;
+		interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_ENCODER2>, <&cru HCLK_JPEG_ENCODER2>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_VDPU>;
+		#iommu-cells = <0>;
+	};
+
+	jpeg_enc3: video-codec@fdbac000 {
+		compatible = "rockchip,rk3588-vepu121";
+		reg = <0x0 0xfdbac000 0x0 0x800>;
+		interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_JPEG_ENCODER3>, <&cru HCLK_JPEG_ENCODER3>;
+		clock-names = "aclk", "hclk";
+		iommus = <&jpeg_enc3_mmu>;
+		power-domains = <&power RK3588_PD_VDPU>;
+	};
+
+	jpeg_enc3_mmu: iommu@fdbac800 {
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


