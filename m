Return-Path: <linux-media+bounces-28752-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FB5A70C2E
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 22:37:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 052921896B30
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 21:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5565526A0D9;
	Tue, 25 Mar 2025 21:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fE6qmdVo"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9DF26A0BE;
	Tue, 25 Mar 2025 21:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742938423; cv=none; b=CUhQP4pzTxPVcweM24MOn+/QFTC+8xigRfzF9vW/b0O3ba08uxEMobYBKJLBTYmOivXUiZqm6HJzU1jfOOaDXtBV+nPBwFTgLCIEg0QUL+CNFVUeG2Fz2A1rR9bHYf1S1mUVNpr6VQzrC/JoU+ystrIFb8aS0bH3uHu5chy6wUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742938423; c=relaxed/simple;
	bh=RIwz438r/s63gFgZUecLnaG9eUlgOCD/aBHrHYdi1fU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WUTS5FKnQioDsiWVCnqlO2+MYPmf4OWclUE/Lw80zyxKC6fQtvYjmI74ZLViMQ95j5w5Lob+cUUZnnYoON2NtjQMRtRb+FdOm9dX27garfEytBfs0n7E5vX21H3ekvM1z8L/qrYG9M+QRyar7drpPXPVEBBsn0lCvXIyEIallL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fE6qmdVo; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742938420;
	bh=RIwz438r/s63gFgZUecLnaG9eUlgOCD/aBHrHYdi1fU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fE6qmdVoLeoyvxhGvbETHLH1YV26mbH3mMvegjz3h2UZnSa9rlRpRneZd4uoNIHgR
	 4/xdGSCsf6N/hE3857KIJzgSs9hER/pAqmTJt2iXH9+seX8WODDqpA82/V9EhP9PIv
	 u1Oe+gP/RfyJT+bb4QdliV2LpM8JriVnZofm3be9dafb3gCRUbky6hzJhnWDOxfq0h
	 fFHG2nXsLnlksJ1wWGj03mfOyE0bMCF1T6mopAxa+gz5UOf05zGmjqbx8aQfjkOpUZ
	 7RWENWT8rykqGJqMpkV5Pc6ANpUr3zlg0ao8g2P8Ucdq5MWlLYwfpwT5hkbj7CYm9H
	 aL1toeb1yZs7g==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2067517E0865;
	Tue, 25 Mar 2025 22:33:36 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Niklas Cassel <cassel@kernel.org>,
	Alexey Charkov <alchark@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com
Subject: [PATCH v4 6/6] arm64: dts: rockchip: Add rkvdec2 Video Decoder on rk3588(s)
Date: Tue, 25 Mar 2025 17:22:22 -0400
Message-ID: <20250325213303.826925-7-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325213303.826925-1-detlev.casanova@collabora.com>
References: <20250325213303.826925-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the rkvdec2 Video Decoder to the RK3588s devicetree.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index c3abdfb04f8f4..636c287b94e0a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1237,6 +1237,70 @@ vepu121_3_mmu: iommu@fdbac800 {
 		#iommu-cells = <0>;
 	};
 
+	vdec0: video-decoder@fdc38000 {
+		compatible = "rockchip,rk3588-vdec";
+		reg = <0x0 0xfdc38000 0x0 0x100>,
+		      <0x0 0xfdc38100 0x0 0x500>,
+		      <0x0 0xfdc38600 0x0 0x100>;
+		reg-names = "link", "function", "cache";
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
+	vdec1: video-decoder@fdc40000 {
+		compatible = "rockchip,rk3588-vdec";
+		reg = <0x0 0xfdc40000 0x0 0x100>,
+		      <0x0 0xfdc40100 0x0 0x500>,
+		      <0x0 0xfdc40600 0x0 0x100>;
+		reg-names = "link", "function", "cache";
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
+		clocks = <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3588_PD_RKVDEC0>;
+		#iommu-cells = <0>;
+	};
+
 	av1d: video-codec@fdc70000 {
 		compatible = "rockchip,rk3588-av1-vpu";
 		reg = <0x0 0xfdc70000 0x0 0x800>;
@@ -2883,6 +2947,16 @@ system_sram2: sram@ff001000 {
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
2.49.0


