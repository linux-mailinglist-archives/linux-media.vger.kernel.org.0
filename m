Return-Path: <linux-media+bounces-35675-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2221AAE4A67
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 18:18:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6B7B1888115
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 16:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 806422C326F;
	Mon, 23 Jun 2025 16:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SaB0zpAH"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B572C3245;
	Mon, 23 Jun 2025 16:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750694881; cv=none; b=m/jEi8/NXw9sfEJmgDuLM8egsPBOtsgiqmWhahSEdUTrp8GkSX7Q3e1y4jIFWoMJC0Zm9iS7Prt1GDfcZ1U5ejpcQ/BOwH38Vw0FaV2z3tlu7vXYwXqA1KXLgeX2fjtffEAYDZ8wYcLiHrfqkSzLL6b3FoDql5DrkQdf1yELBrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750694881; c=relaxed/simple;
	bh=LAtHIDsXc48M+4SNF2evd23d5+2WZS3MzWRndXBDn7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JnWE84LjZugcc0tTLjNjgr+hyeED+7+bGKuxDQNu6IXD+1tWtACzRq9MjpdVL9dghRZAtl3TVCoXQ2yT3/hRgjspcbsZCGhSj0v0+sqowugI0mnDZLt6rVzrE6Ywpo+oyqsoq2y9ndMnqLbJAZSuK0kTuiXSkFQ6Tbbm00taKAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SaB0zpAH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750694878;
	bh=LAtHIDsXc48M+4SNF2evd23d5+2WZS3MzWRndXBDn7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SaB0zpAHjXwCGcMTaY4yKSJkhwbsYNN+QC6lQXd0qEINs3aPwKdC8+EugvoX3hzlq
	 3OUzwmZZxTvvoSqVwZYy09nSEJYvKMToPzJ58ikI46LFNMO2/hziBfrwxoSZCljo9z
	 V0umNgidaM6cVS4GYIz41lFQlzWyjL/AcpfWiRYiWv/MTIulK72WfOXj5jKiL+czuG
	 P89Z9sZbvN/4PbRvlXY2xhUhBSBtpS+gkou5omQar5r//iUAtCA6ogeOn006Ur0guq
	 WMCQe8/65QrsOKEKebY/rVx1k6edtBoA0QfgCkkM4oWSb6TP0V03cOh6F9OWOMJCSI
	 CDEkXG+SA5oWQ==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 12DAC17E35D3;
	Mon, 23 Jun 2025 18:07:54 +0200 (CEST)
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
Subject: [PATCH 4/8] arm64: dts: rockchip: Add the vdpu383 Video Decoder on rk3576
Date: Mon, 23 Jun 2025 12:07:18 -0400
Message-ID: <20250623160722.55938-5-detlev.casanova@collabora.com>
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

Add the vdpu383 Video Decoder variant to the RK3576 device tree.

Also allow using the dedicated SRAM as a pool.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 36 ++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index b1ac23035dd78..26896ac22cedf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1139,6 +1139,41 @@ gpu: gpu@27800000 {
 			status = "disabled";
 		};
 
+		vdec: video-codec@27b00000 {
+			compatible = "rockchip,rk3576-vdec";
+			reg = <0x0 0x27b00100 0x0 0x500>,
+			      <0x0 0x27b00000 0x0 0x100>,
+			      <0x0 0x27b00600 0x0 0x100>;
+			reg-names = "function", "link", "cache";
+			interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_RKVDEC_ROOT>, <&cru HCLK_RKVDEC>,
+				 <&cru ACLK_RKVDEC_ROOT_BAK>, <&cru CLK_RKVDEC_CORE>,
+				 <&cru CLK_RKVDEC_HEVC_CA>;
+			clock-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
+			assigned-clocks = <&cru ACLK_RKVDEC_ROOT>, <&cru CLK_RKVDEC_CORE>,
+					  <&cru ACLK_RKVDEC_ROOT_BAK>, <&cru CLK_RKVDEC_HEVC_CA>;
+			assigned-clock-rates = <600000000>, <600000000>,
+					       <500000000>, <1000000000>;
+			iommus = <&vdec_mmu>;
+			power-domains = <&power RK3576_PD_VDEC>;
+			resets = <&cru SRST_A_RKVDEC_BIU>, <&cru SRST_H_RKVDEC_BIU>,
+				 <&cru SRST_H_RKVDEC>, <&cru SRST_RKVDEC_CORE>,
+				 <&cru SRST_RKVDEC_HEVC_CA>;
+			reset-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
+			sram = <&rkvdec_sram>;
+		};
+
+		vdec_mmu: iommu@27b00800 {
+			compatible = "rockchip,rk3576-iommu", "rockchip,rk3568-iommu";
+			reg = <0x0 0x27b00800 0x0 0x40>, <0x0 0x27b00900 0x0 0x40>;
+			interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru CLK_RKVDEC_CORE>, <&cru HCLK_RKVDEC>;
+			clock-names = "aclk", "iface";
+			power-domains = <&power RK3576_PD_VDEC>;
+			rockchip,disable-mmu-reset;
+			#iommu-cells = <0>;
+		};
+
 		vop: vop@27d00000 {
 			compatible = "rockchip,rk3576-vop";
 			reg = <0x0 0x27d00000 0x0 0x3000>, <0x0 0x27d05000 0x0 0x1000>;
@@ -2412,6 +2447,7 @@ sram: sram@3ff88000 {
 			/* start address and size should be 4k align */
 			rkvdec_sram: rkvdec-sram@0 {
 				reg = <0x0 0x78000>;
+				pool;
 			};
 		};
 
-- 
2.50.0


