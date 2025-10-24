Return-Path: <linux-media+bounces-45515-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A38B9C0659E
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 14:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4E96C345D21
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 12:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FBE7321434;
	Fri, 24 Oct 2025 12:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gIk/nQyE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E5D31B801;
	Fri, 24 Oct 2025 12:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761310297; cv=none; b=PtSThVOlPzgxhyYsmBZjCRBmKAJBtQTB+R4klBYBW/C36PxwEpHUWl9X1mSRkSLWsH4XHXP6Tx4YN101O+edXh2Cyz3MNiG5GNgz9Hy4i0HJmPh4lruQTonhQS6S7rcdhM7efxu8rOajXsCcjt6Ua3aJo6q2NatBHxxJiDV/Dv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761310297; c=relaxed/simple;
	bh=cbLEkvJeCgSCfAv9tPFINBb5ggoFvww0kpeGffJo/0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X/CbNBAFL9WkYhG3lcwtMjJs0VVGoB4TyxvYSuvQixDdZNK8JbQwMVmDapAxESdHkofq14ZWaHS/PtjmPPYutVE65o+0V6A+sbo3vxzxRA0oHJP96hD/WgQcAZWCnrRY9h9VdxYQfoNhU6S5VwZxgHP6I7qN89Kr3ACO9QE5sYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gIk/nQyE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C68BC19423;
	Fri, 24 Oct 2025 12:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761310297;
	bh=cbLEkvJeCgSCfAv9tPFINBb5ggoFvww0kpeGffJo/0Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gIk/nQyE5ymaLYW3jPvuWCSrH3c58w/YzA7yElIQbllU343HYHjNUxbV9Wm1K6PZN
	 yS7Lqw/1gb+Dv2BHC1PowKXUmPEGiaHMA69yaPsYZeC94wf8Hnkq1kxi0GVWwxHEA9
	 YClJYpiBFBPSYID+VNhTnq3QcBNHR3ZuDuR2+Ay4zXXCSQzbsdgRXmoh0h2as1UlqW
	 tXxsOjb+7areP7t9Xpzgi8QnhgTSGJg3Ayp5GI35h8Z0xBinI16sZ0IqRVz5vn8MV/
	 PMcys6uu0FZV57kJT2mzvn3+OlgoRDRyY5L4x9/YyUHZxoyMRw5y1sDGVAGVrIxTgw
	 C/7UDFOvsxtmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF82CCF9EC;
	Fri, 24 Oct 2025 12:51:37 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 24 Oct 2025 14:51:45 +0200
Subject: [PATCH v14 16/18] arm64: dts: rockchip: add mipi csi-2 receiver
 node to rk356x
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v14-16-b38b6da0fc80@collabora.com>
References: <20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v14-0-b38b6da0fc80@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761310293; l=1704;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=jgd8PGtinPHV73owMQCyysIiMO5uNpYF0qMpM09delI=;
 b=qgIQF5qL6Tm1pqpH4xptJfaT3ahLifapsdmrPC+/rk9QY3kPq0z3Tmo1rq9YyIk3GuoPcJ5CK
 FTWl0SFkBUeA0IJkS63vvRTU+HwNurflWG9eSa3Jid+RSzWqZlk+8VQ
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

Add the device tree node for the RK356x MIPI CSI-2 Receiver.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 34 +++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index e0e4dc85a3a9..36365e6998dc 100644
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
+		interrupt-names = "err1", "err2";
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



