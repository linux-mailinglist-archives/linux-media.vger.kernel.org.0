Return-Path: <linux-media+bounces-40208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2B1B2B4E8
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 01:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 560714E81AF
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 23:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B32A283C82;
	Mon, 18 Aug 2025 23:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j4ZwAlq6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDFA28002B;
	Mon, 18 Aug 2025 23:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755560388; cv=none; b=V75hl+VetXKObJGFfb6xxqw7bEqMjiiJVL4+vzHLWmeikbyAXnE0cYErsu5kMZipooLC4KOr9R/eL4OZqCCaijJvyy8Nv/8PfWTBes/tna1Qr6fvXKVuRblWTaG9IH2bBT5alDHFfcY3wMrI7ga5xMAvBoApqMprAXrXrayMwow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755560388; c=relaxed/simple;
	bh=otgrb/vF+atbB3mWxRg3GACduHocftu87TGfvm3zQwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K+TtxaczCMfU6MV2MshvTNhY0h7BgdYr9YyA86gMf6HbNkGM6sxkj008g/bA1m+XqcHB/FI62a0q3aFu9qjFbdl6hHNl1qsf3fGDCFG2Bs7uKXVs+HjaB69Sn6sLwdDXwEpaJXOgHawqkOujD2/NsqHkxPcPjOXC4QGa5DR7iaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j4ZwAlq6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B26BC4DDEB;
	Mon, 18 Aug 2025 23:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755560388;
	bh=otgrb/vF+atbB3mWxRg3GACduHocftu87TGfvm3zQwU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=j4ZwAlq62WgJ5Cd8JriFRmxdC1T91LWqojWxtn4zEKkvlaTiDflVvbpuO5/CY8zPg
	 2vYRBcG5cORWJ+YXdhrxqUX9VM/JrjFy8Yg9la68Fb42EJvSVgnkWroqsfTBwlCs3g
	 s4qyYyzxS6srMJlSuIOrTp9o8eNkHPxULdlmwMBkfJPxziT+hJf57nj6Re5twrxofx
	 /4R0eGkBQnvSO/IlIJfBl9vxbfPK3j8CnlHO70Wpg5ePx0qAXwwNVmDNTwJ8iOhTFt
	 eLNJoRYCwkru31N0PYKIVSuQ8dIA7Al/POBSfQwgrfPjIyGOcLLn25yx7P4o7DwmEz
	 5joLRDxJufazA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3569CA0EE4;
	Mon, 18 Aug 2025 23:39:47 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 19 Aug 2025 01:26:04 +0200
Subject: [PATCH v10 12/13] arm64: dts: rockchip: add mipi csi-2 receiver
 node to rk356x
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v10-12-62d8a7b209b4@collabora.com>
References: <20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755559554; l=1644;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=mp3pf9RuqEGrye/HxgD+x+5GeyykIBGgvJ6m8tMl1hs=;
 b=R48tifdHwsraUqtvtxoL3WvMMvmn2fq5td0ZCgMULr8WkjE9gXXsRwFY0vyS1qlKg0az5nwgN
 WKdGMdV9XmkAvYFi73w4BauNenWIB9QFKjE0fHTD8OnH5NW9kLFwo9m
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

Add the device tree node for the RK356x MIPI CSI-2 Receiver.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 34 +++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index e0e4dc85a3a9..4c3dbcabd834 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -564,6 +564,36 @@ gpu: gpu@fde60000 {
 		status = "disabled";
 	};
 
+	csi: csi@fdfb0000 {
+		compatible = "rockchip,rk3568-mipi-csi";
+		reg = <0x0 0xfdfb0000 0x0 0x10000>;
+		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "irq1", "irq2";
+		clocks = <&cru PCLK_CSI2HOST1>;
+		phys = <&csi_dphy>;
+		power-domains = <&power RK3568_PD_VI>;
+		resets = <&cru SRST_P_CSI2HOST1>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi_in: port@0 {
+				reg = <0>;
+			};
+
+			csi_out: port@1 {
+				reg = <1>;
+
+				csi_output: endpoint {
+					remote-endpoint = <&vicap_mipi_input>;
+				};
+			};
+		};
+	};
+
 	vicap: video-capture@fdfe0000 {
 		compatible = "rockchip,rk3568-vicap";
 		reg = <0x0 0xfdfe0000 0x0 0x200>;
@@ -592,6 +622,10 @@ vicap_dvp: port@0 {
 
 			vicap_mipi: port@1 {
 				reg = <1>;
+
+				vicap_mipi_input: endpoint {
+					remote-endpoint = <&csi_output>;
+				};
 			};
 		};
 	};

-- 
2.39.5



