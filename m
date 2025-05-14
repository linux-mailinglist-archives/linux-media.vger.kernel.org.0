Return-Path: <linux-media+bounces-32516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0636AAB7074
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 17:54:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB5228C3D98
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 15:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235E92820D0;
	Wed, 14 May 2025 15:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDYxrNeQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFD627CCC7;
	Wed, 14 May 2025 15:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747237984; cv=none; b=YLlgZNz+I6VA/L/qq6ER49fJZlPzlBEm/UFwjDPk1aqq+yO0JEkzhgw+QXxPCpeLB+MoOwjagyiHj6gTzE+i1RCHgs1ReX2GQWT4xNGjh6XJl/kWYnH+3m2b5gho1ryuZz+wd5Z9hxrZtDx5eRuGVm9yb8vcsLaFrsE41axxes0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747237984; c=relaxed/simple;
	bh=N6fkCiwtMq7cQFfPuTVHOCQOjaRR0eDS9lPzo9y3LvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aEq/l5h1n6srf6sTsEBqrV2flD2C0p3IXEnSU4ELgqnptrP1N8Bi9K3MlszGRSMgMyxeo+P5V9oVx1XNJL/Lycx3pmF4xY2iwrERed7j0HbPxS/MdEB+3wU6rBMEM9jwy5B8tVHEjClsiheBS+7JGUT36RbqnCD69MTEqaZ8nGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDYxrNeQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B4C0C2BCF4;
	Wed, 14 May 2025 15:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747237983;
	bh=N6fkCiwtMq7cQFfPuTVHOCQOjaRR0eDS9lPzo9y3LvA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NDYxrNeQd+PQJJ10SCmzIJW3TVZqfkEWJxxWjuUkzZuzWq3qy/ixbll1SbHZLJpq5
	 APYrEh1ZyU8OzExZWK9prEG49wV2+/rO2N9e/AGJYobUyEPaBjwCAvV163bonvk2O0
	 DufTZ5j0jgJPSi0ZrsSm6SUiC10kqD2EFM6gkNaAJkOliKuwfeYCFOjBdkiCl2ZE5D
	 5J2jsGeyIsv+PJ/V+WMVQLDhQFD21n3JPWh86fWZZKQlfeZU2S/mXfy/IJTxkqV9eo
	 tqmez9aNHF4eKKqaVvK4xBCOsRPf/k4QEZcQbvsBcCx3meGXhR4EXU5WJe/4zaaSsZ
	 /ZU57RtKBTpqg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0ACC54755;
	Wed, 14 May 2025 15:53:03 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 14 May 2025 17:41:15 +0200
Subject: [PATCH v7 14/14] arm64: dts: rockchip: enable vicap dvp on
 wolfvision pf5 io expander
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v7-14-7581fd96a33a@collabora.com>
References: <20240220-rk3568-vicap-v7-0-7581fd96a33a@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v7-0-7581fd96a33a@collabora.com>
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
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747237265; l=1541;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=A46w67oMbroxqAcXCMQ9mjlreHO/teIN06ITNLENh64=;
 b=rHlRlv7WVUb+EsRcrImyjmJ8M57AwpV3gcaGXLTszDDggm0UGb8f63kbLyvTPDoUoj0Hm3BTl
 7B46p2AwCsmDTuEgFU/rN2z5z+d3BqfyxnmPc49B4hG2jMyG7r2b5e+
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@wolfvision.net>

The Digital Video Port (DVP, the 16-bit variant) of the RK3568 VICAP
is broken out to the PF5 mainboard expansion header.
Enable it in the device tree overlay for the WolfVision PF5 IO
Expander board.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../rockchip/rk3568-wolfvision-pf5-io-expander.dtso  | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso b/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso
index 048933de2943..8cfce71dd318 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-io-expander.dtso
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/rk3568-cru.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 
 &{/} {
@@ -134,3 +135,22 @@ &usb2phy0_host {
 	phy-supply = <&usb_host_vbus>;
 	status = "okay";
 };
+
+&vicap {
+	pinctrl-names = "default";
+	pinctrl-0 = <&cif_clk &cif_dvp_clk &cif_dvp_bus16>;
+	status = "okay";
+};
+
+&vicap_dvp {
+	vicap_dvp_input: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_BT656>;
+		bus-width = <16>;
+		pclk-sample = <MEDIA_PCLK_SAMPLE_DUAL_EDGE>;
+		rockchip,dvp-clk-delay = <10>;
+	};
+};
+
+&vicap_mmu {
+	status = "okay";
+};

-- 
2.39.5



