Return-Path: <linux-media+bounces-32511-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8D1AB7077
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 17:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B9DB16FC4A
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 15:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6142280330;
	Wed, 14 May 2025 15:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kSJrOodQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEEC27B4E7;
	Wed, 14 May 2025 15:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747237984; cv=none; b=kia5WtwTkdwq2gBU96nI+TQkZpgVWxYBjdW0Gw8JNI8PdlKZu++DUCl+tE2/6GME02gGLjcGjr+/8PWirrHKX6y6BP4yGCqGqnn3wOX5GNS54qrgBA4n/gGuzp5AvMxb7R07VCpEOofJ/2hKLfTw6Q7M9z1j+IoUkUkFtxqZIgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747237984; c=relaxed/simple;
	bh=xgXsedVSUFwJxfdbZ+OMjnP+EyVsw+vIcIpvCuIoqpE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s2nsukDqJXUhxX8dGuR/ZLl+RSZeYxzqCRmWpbXnAbPPDJmhO9+s5PTuIR29tIoGXsx9kB580yBA2/RolJy6NYj76DJtKJlQqmkuM+itF0Lxna16IPk2EnXh6YWyB7gx8RWOdpLFVYubI/4oC6yXE5lTDUi87k+xdqlXfw1wfNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kSJrOodQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6CA97C4AF1D;
	Wed, 14 May 2025 15:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747237983;
	bh=xgXsedVSUFwJxfdbZ+OMjnP+EyVsw+vIcIpvCuIoqpE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kSJrOodQxomFt/O2BNAFwPYNhyf+zz6oJenZxnZs/2+gyxUaNH9iV4/HpCHOCaBry
	 eyJ1atWh76MTdqqjaaeTf+gxr2Z/RuXwDMlv/tXpomsYAXudILIoQMyLEw2fn4P7HR
	 mRX+YSziKPA8XYPTEeMCw2e1EVXwaWa+sdG6YtVDQNiHod9UuED2RdRlOvZ+dM169K
	 1T5Xw4xjdbGsFo8DfD603f3bNbuLa3/KGlMpJsN6ppjE7HtZfxq2aS+nCdDn9QPW2D
	 tLtzbGFkl6IVX5MQplVV/u9J2SApo91cGjsdxWuv9YN0IWQBK9TG4pYm1fXMuzZYG8
	 FURIjdXhbCpRA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F8CC54755;
	Wed, 14 May 2025 15:53:03 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 14 May 2025 17:41:12 +0200
Subject: [PATCH v7 11/14] arm64: dts: rockchip: add the vip node to px30
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v7-11-7581fd96a33a@collabora.com>
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
 Michael Riesch <michael.riesch@collabora.com>, 
 Mehdi Djait <mehdi.djait@bootlin.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747237265; l=1272;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=frVH3YZJKlIZ2oOEYo9xSW4fg9sYwlZ7N9+sfEetpaM=;
 b=x8y8jUmOcpOD/M3ORBrxJh0Vqq97rx5r20axa2SBOpCuy/2/EdIOuD+lVhLFCR5I6SJ/SHv/o
 QJCdtd6ok8CANuRKim9jfJhLT5Vsi/tGhnvD43/NGfw8ltyhH9h0g+H
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
index 9137dd76e72c..c2acf5952d08 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -1282,6 +1282,18 @@ isp_mmu: iommu@ff4a8000 {
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



