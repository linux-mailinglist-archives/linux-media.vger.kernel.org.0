Return-Path: <linux-media+bounces-44609-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 24226BDF36B
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 16:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 039CB5052FF
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 14:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE22E2F0C69;
	Wed, 15 Oct 2025 14:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sIl5nM2b"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DD82DCBF1;
	Wed, 15 Oct 2025 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760540189; cv=none; b=XvsS31sD90murZvE2VXS50myK0lzLtfBkB3cCF+uGnO6sPRqWtj2XMlbuPGaz/nIumJZGHTGlq/twNN1TFU+0vmJar3ZU4WjfV3iGAk3a9ZzOcPTstkWtpaJymSLlzGXk2DIvD17DjKwByiDVAtbX4sHbYEMs/oEc+E67hKy/Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760540189; c=relaxed/simple;
	bh=Zl4Mel46TcR7AjpUnvtEjIgKxbaBwJflcYSmq34rCyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qvi4viTZwJluHFQpbvV+2TkFvyzmw07UmHdArysiVFHOZ5Xq/KJPW+UdZ1iVpfJLxr3kHuwsnx71TR3lJueuVVuagmbSNnnpBMlpvKTrdJyPFnywC4jPD4qiRxt+JJpyaByj4Z2GtcMPsmp7FoTnGx8FgUA/6suo/esaHtRoYnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sIl5nM2b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5306C4DDE2;
	Wed, 15 Oct 2025 14:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760540188;
	bh=Zl4Mel46TcR7AjpUnvtEjIgKxbaBwJflcYSmq34rCyA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sIl5nM2bvFE3k9vXW/3Utnz7ESxpyUbR46hQbDfckOVVmAg/pbXEgVzqXWrQmeoHJ
	 I2eBT9Rl3R+X9BOyDrmG09YV6z3r53bJxIMV7JuasgBXd//HM4EbbJUP64zOmJ9QPo
	 O6+DEsHmoG8JChZoDevBBnVuRTxEmV/OL5+L63Iz7Gjtak/Sa8+sIM3UrMv/LhpgfC
	 vnPF7g6YSxolildhwmox6mv0v8vkMmowl+uBkxUxOceWWu7CPzoAhYf5aXYncKIBIA
	 xFeroin9g0Uo/RaNH2vkr/t8SyClag/Sk1hL53Q0uZiyb5nUhp2UKk/SjvIuL+Qj5P
	 0yMpGewiGQg6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C4ECCD185;
	Wed, 15 Oct 2025 14:56:28 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 15 Oct 2025 16:56:40 +0200
Subject: [PATCH v13 17/18] arm64: dts: rockchip: enable vicap dvp on
 wolfvision pf5 io expander
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v13-17-da164b4918fe@collabora.com>
References: <20240220-rk3568-vicap-v13-0-da164b4918fe@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v13-0-da164b4918fe@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760540185; l=1721;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=0H9SWagLsWuudSJ0hjW87B9xG48FbT9CuvPeqAKM5fI=;
 b=kDk1Dhq5Tb8DcEUcG68xEmaT925yDwQqPcyUnRYnByNUmniDP/B7UvfljdgxxGUNZPieFnqzi
 RlrsZ60wFwmBIM1je3xM2ekkUD4yNA6Set5FXM2yh8aNLyiLDM+UBll
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

The Digital Video Port (DVP, the 16-bit variant) of the RK3568 VICAP
is broken out to the PF5 mainboard expansion header.
Enable it in the device tree overlay for the WolfVision PF5 IO
Expander board.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Reviewed-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Tested-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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



