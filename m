Return-Path: <linux-media+bounces-35194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B41ADF1D0
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 17:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8BAC7A3638
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 15:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493442F2365;
	Wed, 18 Jun 2025 15:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fN9N1dg2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516692F0C5B;
	Wed, 18 Jun 2025 15:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750261850; cv=none; b=RK/t1NXoXwZGja2LB+mQ/GUVzvRQCTuvCAlAYb69q0P7l9ivckhtJHrrfOylshc+VLljhzwfIs4K/8HIKo01Lrpj+pZSghPam2z3sGMXvk4sIb5bPrmjuZlbr1lijTN3WaglPkkIWI7FBGoODHuiaMMM4NKAN6h6/YXrWMjAebg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750261850; c=relaxed/simple;
	bh=5BRFtk/5jIDcMryMPGQHwW1SEx1AjjpWVEcTh5JdPRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iTc6eb8aAoto9dR/gMfYiRkXWxak8ExdTTDmGnf43dLi/OJE70HjhBL1ybMEdaRh0gC0T8UpIkCQVDz6vBGL/i72RWeAA5GaOU/elg9kQeZGm0w0lK6WRBsStLLDyEetOqD8pVzC1oYv5HWa66YI9sbIxdcGQGn2BDN9XWuJJQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fN9N1dg2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C30A3C4CEF0;
	Wed, 18 Jun 2025 15:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750261849;
	bh=5BRFtk/5jIDcMryMPGQHwW1SEx1AjjpWVEcTh5JdPRs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fN9N1dg2WRhOHTDiBAvXH4xAdRt3EKsr18j5yWvDUqxlGrDps32DgjO2VEB25j/4k
	 YIAXPLvqgNw3pVdv8usGVJcMcRlz9O8hRARK6Xjl1AcdqLMQl0pLGgtw1Op4CFwq+9
	 EIWn2Noddsn8OdnyUAtDoJJkn/1um8yAIZ8dcaKbQL4ZG9Bk8JIUXNVAuTu8+k5aL5
	 V1T4o01HKnRx49n7ShO/U/mrzpHSULiZmy35QORvrA9fnvuKHAhTWaUanSOMPtjQ6H
	 20a2APn7RuspRCLW2CJkz8L4vn4T3a7PiKTlUDh2NFj+KemUhs6lH6lM5kU38TlCOi
	 SCT0d7l7wJLBg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E70C7115D;
	Wed, 18 Jun 2025 15:50:49 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 18 Jun 2025 17:38:05 +0200
Subject: [PATCH v9 10/13] arm64: dts: rockchip: add the vip node to px30
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v9-10-ace1e5cc4a82@collabora.com>
References: <20240220-rk3568-vicap-v9-0-ace1e5cc4a82@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v9-0-ace1e5cc4a82@collabora.com>
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
 Michael Riesch <michael.riesch@collabora.com>, 
 Mehdi Djait <mehdi.djait@bootlin.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750261092; l=1272;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=bPZJ1Uc+vxwNAO8V6hB3CEnLbtHLJAdH+/IeDgKwqBQ=;
 b=oWREpMDoRNlWONc6fEHyVeWWuaBG5sMYdKCA5y41CurdpynwdjnMsOjezOyrvfm0TPXUfzatw
 0V4Rjuv8fKNAT4MwGqbXoYDnzzd4q3KX9cRLYi1hn3dysb7ucxSYGZg
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Mehdi Djait <mehdi.djait@bootlin.com>

Add the device tree node for the PX30 Video Input Processor (VIP).

Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
[added cosmetic changes]
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index feabdadfa440..7b890620a6a0 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -1288,6 +1288,18 @@ isp_mmu: iommu@ff4a8000 {
 		#iommu-cells = <0>;
 	};
 
+	cif: video-capture@ff490000 {
+		compatible = "rockchip,px30-vip";
+		reg = <0x0 0xff490000 0x0 0x200>;
+		interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_CIF>, <&cru HCLK_CIF>, <&cru PCLK_CIF>;
+		clock-names = "aclk", "hclk", "pclk";
+		power-domains = <&power PX30_PD_VI>;
+		resets = <&cru SRST_CIF_A>, <&cru SRST_CIF_H>, <&cru SRST_CIF_PCLKIN>;
+		reset-names = "axi", "ahb", "pclkin";
+		status = "disabled";
+	};
+
 	qos_gmac: qos@ff518000 {
 		compatible = "rockchip,px30-qos", "syscon";
 		reg = <0x0 0xff518000 0x0 0x20>;

-- 
2.39.5



