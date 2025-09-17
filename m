Return-Path: <linux-media+bounces-42691-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA43B80AD9
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 17:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7298F525659
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 15:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31D3321279;
	Wed, 17 Sep 2025 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BK28CZxu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107C337C0EB;
	Wed, 17 Sep 2025 15:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758123534; cv=none; b=DWdCoB7imE+ii0QyUdBvVWrQIEjQaxX/2F5Sbaxlxf8BYnl4deH77a/59wB9FVqNbWQCvgP+PuAdU4c0ATn/hM0ppqHI/ev6KGgn4E2VZF6Qhdn5PK3t9lka8qathK/rBLnJDx1cbtNY1a7bCQVNWYlVCe6JZvV3/yTdM0TTAh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758123534; c=relaxed/simple;
	bh=00ySgDeY2SbqvhPX9kBYvU/RMgHNCrJd0O4BG6/GCrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OVHpot5kc5kBm5b+fq1bl+K+Vmzdd+tta5FmKvl34FPaORoBWobhRz0cJXOJxjxi4qWdCgAJeIi2mRrwAq5+FPEMioszgYWgcY+XlHtlMnqe1zkvWUofLIGe6LMNVjCLl7JydLuEtnFWQV77P6M2v8OLTn/d7it8ix7Qhe0Ls3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BK28CZxu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2FDEC4CEE7;
	Wed, 17 Sep 2025 15:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758123533;
	bh=00ySgDeY2SbqvhPX9kBYvU/RMgHNCrJd0O4BG6/GCrE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BK28CZxuLfmUTKYUv0Y2EmBRDAPfQtbqw0IU1E876bTYuxd6tF5wvnF2gAzEGcLGo
	 LRoMXsU/74frILIEbJNOBbClTbR5DEjf7bGpovxs0WyTrWS3Hrer/56hVjJ7Dq6o0v
	 QREe9aTN5oTiRfq39UyTtC49t5xnXH9wmSoPZobJqhupuxZlH1OC/T6Xn5VJN1tJXa
	 Jlzu5g1P/2iI21GKWHy5NKbn9pqvpmQeuMIiwZ/G3Po63YLZbWzVLQ7XUrNNoGMSxx
	 oOY4NhFIf1RWq+Mxpow0VxG/OU8v9LvX+gbqKhYq9pkIA68tC4VVm344661MTW8haC
	 MzQpNyXqklLTA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA719CAC59A;
	Wed, 17 Sep 2025 15:38:53 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 17 Sep 2025 17:38:55 +0200
Subject: [PATCH v11 15/17] arm64: dts: rockchip: add vicap node to rk356x
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v11-15-af0eada54e5d@collabora.com>
References: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758123529; l=2050;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=lEu6UcdwUJ585mOVJj4+wXFbf1qt1nIxcP9Qq7FSezA=;
 b=r/KmEMzbRk07ERxrS6b+7oQuBcmritCK+a929Whh7uDfTVE8FVn+YxM1WQY9KTyw7AWH+vA/B
 GSWGr8yr752AgZB7bAjqMbB97sFtq/RvuLoM331EVeYAx/FJ7H+MCEk
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

Add the device tree node for the RK356x Video Capture (VICAP) unit.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index fd2214b6fad4..e0e4dc85a3a9 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -564,6 +564,50 @@ gpu: gpu@fde60000 {
 		status = "disabled";
 	};
 
+	vicap: video-capture@fdfe0000 {
+		compatible = "rockchip,rk3568-vicap";
+		reg = <0x0 0xfdfe0000 0x0 0x200>;
+		interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+		assigned-clocks = <&cru DCLK_VICAP>;
+		assigned-clock-rates = <300000000>;
+		clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
+			 <&cru DCLK_VICAP>, <&cru ICLK_VICAP_G>;
+		clock-names = "aclk", "hclk", "dclk", "iclk";
+		iommus = <&vicap_mmu>;
+		power-domains = <&power RK3568_PD_VI>;
+		resets = <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
+			 <&cru SRST_D_VICAP>, <&cru SRST_P_VICAP>,
+			 <&cru SRST_I_VICAP>;
+		reset-names = "arst", "hrst", "drst", "prst", "irst";
+		rockchip,grf = <&grf>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			vicap_dvp: port@0 {
+				reg = <0>;
+			};
+
+			vicap_mipi: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
+	vicap_mmu: iommu@fdfe0800 {
+		compatible = "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdfe0800 0x0 0x100>;
+		interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>;
+		clock-names = "aclk", "iface";
+		#iommu-cells = <0>;
+		power-domains = <&power RK3568_PD_VI>;
+		rockchip,disable-mmu-reset;
+		status = "disabled";
+	};
+
 	vpu: video-codec@fdea0400 {
 		compatible = "rockchip,rk3568-vpu";
 		reg = <0x0 0xfdea0000 0x0 0x800>;

-- 
2.39.5



