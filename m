Return-Path: <linux-media+bounces-55717-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJN4NyEttGlYigAAu9opvQ
	(envelope-from <linux-media+bounces-55717-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:28:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 889C0285FD3
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2CA1330B2FE6
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 15:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A66B3B3C1E;
	Fri, 13 Mar 2026 15:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Usqoq4eu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7933AD503;
	Fri, 13 Mar 2026 15:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773415246; cv=none; b=O+iNq6MMcVcA6mVpbgu1q+yLXPlx/fa+W+wv4lW5yiJO7Led1iw/OLjpwNsoradyUOFl88MFK0J/R7gt5JPKs8nqrkJMgFqQkZ3SXb3qfzjt6Hie/PnQu4TUxpEQAofZwlRtF7lTSPatiKPZs4twQgGOSBsWr4nLTzfiFeMgYZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773415246; c=relaxed/simple;
	bh=FhTQ5SVdxITPm8tDe0bW/0ZG36G8hCk0e58aJbKwRGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pm/8TKKKKW86SjIo7ZryJSyAu6Nr9BJW3jJtFrrwQThMtNNnCM+JyxsFyPtPuBMRKBrKp8hhWmN004SxgEOkmV9ngmJ+95F9HdMFlw0KN9CbTxPYp4u6RqPRoQsd3fNFE1dkRrjvusSOct17CoP7a2If5iaKQvT1/CSDOr6MxJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Usqoq4eu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F570C2BC87;
	Fri, 13 Mar 2026 15:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773415246;
	bh=FhTQ5SVdxITPm8tDe0bW/0ZG36G8hCk0e58aJbKwRGQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Usqoq4eujdp/ykdqtdOMtfmZZCceIAhKYKuh7KzHk5jzBRbVLuQiF0uGRszoT1z7/
	 VMipIWN3SPKq/rcXOTBcVzRDa1l5ULLW/HHjS0x/j7H5l6UFYJZfyZKsjHuPNfb66i
	 VV8SXyZ/L0Qfs+KZCVovydewPhYnA1R6RCBcqgLILMOLa2/Hj21oaPXRSkvwE0nKNE
	 1hbt41eGXS4vPpCn2CPm+nxzRodSg4ou5VzT7t+2M7/8PVLP+jZU/8FMHbB1T7o0sb
	 wYKNE6gjTAQktjc5rJDBBuooKjipTBFTwEuBITzNe9CsnoJYYY9Z8XizFnfoFV2XwX
	 633Eg1KIKZ7yQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65ADE105F7BC;
	Fri, 13 Mar 2026 15:20:46 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 13 Mar 2026 16:20:47 +0100
Subject: [PATCH DONOTMERGE 5/9] arm64: dts: rockchip: add mipi csi-2
 receiver nodes to rk3588
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-rk3588-vicap-v1-5-b3bddf749914@collabora.com>
References: <20250430-rk3588-vicap-v1-0-b3bddf749914@collabora.com>
In-Reply-To: <20250430-rk3588-vicap-v1-0-b3bddf749914@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2_=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773415244; l=2664;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=5oU0klzEB2FubzgZ+1XdUaBRRnzqz5jTIQAtdWBAHeM=;
 b=9XFhFOGOTKJeatU9czWomdBIwqBazjGoUPrY+Ii0pHpmta8bfcJzBj1veZEg0TtAR6BAet7Jz
 J5dzoQVl+6TAGzP/TYqPNvw1PWuktisY7B8caLtSFBLTUez+q0Q4les
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55717-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,collabora.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	HAS_REPLYTO(0.00)[michael.riesch@collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fdd90000:email,0.0.0.0:email,fdd50000:email,fdd30000:email,0.0.0.1:email,collabora.com:email,collabora.com:replyto,collabora.com:mid,fdc70000:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 889C0285FD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Michael Riesch <michael.riesch@collabora.com>

This patch is discussed over at
https://lore.kernel.org/all/20260305-rk3588-csi2rx-v2-0-79d01b615486@collabora.com
included here for testing purposes only.

The Rockchip RK3588 features six MIPI CSI-2 receiver units:
 - MIPI0: connected to MIPI DCPHY0 (not supported)
 - MIPI1: connected to MIPI DCPHY1 (not supported)
 - MIPI2: connected to MIPI DPHY0
 - MIPI3: connected to MIPI DPHY0-1 (not supported)
 - MIPI4: connected to MIPI DPHY1
 - MIPI5: connected to MIPI DPHY1-1 (not supported)
As the MIPI DCPHYs as well as the split DPHY mode of the DPHYs
are not yet supported, add only the device tree nodes for the
MIPI2 and MIPI4 units.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 52 +++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 7fe9593d8c19..6c593b0255c3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1430,6 +1430,58 @@ av1d: video-codec@fdc70000 {
 		resets = <&cru SRST_A_AV1>, <&cru SRST_P_AV1>, <&cru SRST_A_AV1_BIU>, <&cru SRST_P_AV1_BIU>;
 	};
 
+	csi2: csi@fdd30000 {
+		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+		reg = <0x0 0xfdd30000 0x0 0x10000>;
+		interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "err1", "err2";
+		clocks = <&cru PCLK_CSI_HOST_2>;
+		phys = <&csi_dphy0>;
+		power-domains = <&power RK3588_PD_VI>;
+		resets = <&cru SRST_P_CSI_HOST_2>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi2_in: port@0 {
+				reg = <0>;
+			};
+
+			csi2_out: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
+	csi4: csi@fdd50000 {
+		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
+		reg = <0x0 0xfdd50000 0x0 0x10000>;
+		interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "err1", "err2";
+		clocks = <&cru PCLK_CSI_HOST_4>;
+		phys = <&csi_dphy1>;
+		power-domains = <&power RK3588_PD_VI>;
+		resets = <&cru SRST_P_CSI_HOST_4>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			csi4_in: port@0 {
+				reg = <0>;
+			};
+
+			csi4_out: port@1 {
+				reg = <1>;
+			};
+		};
+	};
+
 	vop: vop@fdd90000 {
 		compatible = "rockchip,rk3588-vop";
 		reg = <0x0 0xfdd90000 0x0 0x4200>, <0x0 0xfdd95000 0x0 0x1000>;

-- 
2.39.5



