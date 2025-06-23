Return-Path: <linux-media+bounces-35674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BF475AE4A0A
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 18:12:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E9BB7A976D
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 16:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA11D2C17A8;
	Mon, 23 Jun 2025 16:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gvKMbe3b"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747C22C08B1;
	Mon, 23 Jun 2025 16:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750694878; cv=none; b=E/C/zPt2cx9wdL8MnOleT3d/AxB2aWhV/x7PC56dek8mdDWfp9UUcF7xOMPD3ZcavCDCadzmzLBFpKWC76hLkMOGYGB5V4NiZaPBLGVZbmwzcS6V2vSAVfKjzS+3WC26rcAh2/1VgXoIWx2Msb0mVKgfJC2hTMSgm/IiXH94dWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750694878; c=relaxed/simple;
	bh=zt/DaCss2i5ulknRW3sJNkFnzwFerUvIICmaqy3KydU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oD2yMUxXMaAKxQhl4XqeDjzFUPF4LH/wRhbaCyvIruA4XIeV6dV66j9DIkIKyBQhaaBbUWTT8Pnki2WH8GMAuNvj2rQdSdMRdAmKwS42LD9TrUyywEaCF/lkciIagS/PEiuRZlb8TeYLGTwYYwtwOQoQazt8EsaJXfElPjRA2o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gvKMbe3b; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750694874;
	bh=zt/DaCss2i5ulknRW3sJNkFnzwFerUvIICmaqy3KydU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gvKMbe3b4XE3UscHhE6pkbYBUhJlem382157apB5Hu7W52ybOAb4wdwyvJPSCtS5R
	 KV1SJCmsRmtga1KWke6xeJCvC1NXXw6Ve4j1y++g1CnqVsBg4bnsKvShEEcfKQUuSu
	 NTvjvaP/Bn2eg29kdKMeRRYG+YRLZkF0cCjvWCdJ8bpFZ6IznZlqNVm5Evtq5FGeX3
	 zNHbKZue9Nj0hAsw+afPUrOWAnqRSkz+WipJBf/pbtjJzYkPzH+KUDaSvSnMxd8fYB
	 zOlElfRbwAcjnXfXoyPVmyFr8z+PRHKQg+ckeyH3hD2w/pvRUplGSe24waD42StvZ4
	 zLvfMt3E+ODYA==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 70AEB17E1580;
	Mon, 23 Jun 2025 18:07:51 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 3/8] arm64: dts: rockchip: Add the vdpu381 Video Decoders on RK3588
Date: Mon, 23 Jun 2025 12:07:17 -0400
Message-ID: <20250623160722.55938-4-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623160722.55938-1-detlev.casanova@collabora.com>
References: <20250623160722.55938-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the vdpu381 Video Decoders to the rk3588-base devicetree.

The RK3588 based SoCs all embed 2 vdpu381 decoders.
This also adds the dedicated IOMMU controllers.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 70f03e68ba550..c1eaff86d5b73 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1252,6 +1252,70 @@ vepu121_3_mmu: iommu@fdbac800 {
 		#iommu-cells = <0>;
 	};
 
+	vdec0: video-codec@fdc38000 {
+		compatible = "rockchip,rk3588-vdec";
+		reg = <0x0 0xfdc38100 0x0 0x500>,
+		      <0x0 0xfdc38000 0x0 0x100>,
+		      <0x0 0xfdc38600 0x0 0x100>;
+		reg-names = "function", "link", "cache";
+		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>, <&cru CLK_RKVDEC0_CA>,
+			 <&cru CLK_RKVDEC0_CORE>, <&cru CLK_RKVDEC0_HEVC_CA>;
+		clock-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
+		assigned-clocks = <&cru ACLK_RKVDEC0>, <&cru CLK_RKVDEC0_CORE>,
+				  <&cru CLK_RKVDEC0_CA>, <&cru CLK_RKVDEC0_HEVC_CA>;
+		assigned-clock-rates = <800000000>, <600000000>,
+				       <600000000>, <1000000000>;
+		iommus = <&vdec0_mmu>;
+		power-domains = <&power RK3588_PD_RKVDEC0>;
+		resets = <&cru SRST_A_RKVDEC0>, <&cru SRST_H_RKVDEC0>, <&cru SRST_RKVDEC0_CA>,
+			 <&cru SRST_RKVDEC0_CORE>, <&cru SRST_RKVDEC0_HEVC_CA>;
+		reset-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
+		sram = <&vdec0_sram>;
+	};
+
+	vdec0_mmu: iommu@fdc38700 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdc38700 0x0 0x40>, <0x0 0xfdc38740 0x0 0x40>;
+		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_RKVDEC0>;
+		#iommu-cells = <0>;
+	};
+
+	vdec1: video-codec@fdc40000 {
+		compatible = "rockchip,rk3588-vdec";
+		reg = <0x0 0xfdc40100 0x0 0x500>,
+		      <0x0 0xfdc40000 0x0 0x100>,
+		      <0x0 0xfdc40600 0x0 0x100>;
+		reg-names = "function", "link", "cache";
+		interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_RKVDEC1>, <&cru HCLK_RKVDEC1>, <&cru CLK_RKVDEC1_CA>,
+			 <&cru CLK_RKVDEC1_CORE>, <&cru CLK_RKVDEC1_HEVC_CA>;
+		clock-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
+		assigned-clocks = <&cru ACLK_RKVDEC1>, <&cru CLK_RKVDEC1_CORE>,
+				  <&cru CLK_RKVDEC1_CA>, <&cru CLK_RKVDEC1_HEVC_CA>;
+		assigned-clock-rates = <800000000>, <600000000>,
+				       <600000000>, <1000000000>;
+		iommus = <&vdec1_mmu>;
+		power-domains = <&power RK3588_PD_RKVDEC1>;
+		resets = <&cru SRST_A_RKVDEC1>, <&cru SRST_H_RKVDEC1>, <&cru SRST_RKVDEC1_CA>,
+			 <&cru SRST_RKVDEC1_CORE>, <&cru SRST_RKVDEC1_HEVC_CA>;
+		reset-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
+		sram = <&vdec1_sram>;
+	};
+
+	vdec1_mmu: iommu@fdc40700 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdc40700 0x0 0x40>, <0x0 0xfdc40740 0x0 0x40>;
+		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_RKVDEC1>, <&cru HCLK_RKVDEC1>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_RKVDEC1>;
+		#iommu-cells = <0>;
+	};
+
 	av1d: video-codec@fdc70000 {
 		compatible = "rockchip,rk3588-av1-vpu";
 		reg = <0x0 0xfdc70000 0x0 0x800>;
@@ -3093,6 +3157,16 @@ system_sram2: sram@ff001000 {
 		ranges = <0x0 0x0 0xff001000 0xef000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
+
+		vdec0_sram: codec-sram@0 {
+			reg = <0x0 0x78000>;
+			pool;
+		};
+
+		vdec1_sram: codec-sram@78000 {
+			reg = <0x78000 0x77000>;
+			pool;
+		};
 	};
 
 	pinctrl: pinctrl {
-- 
2.50.0


