Return-Path: <linux-media+bounces-56970-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGjZBC+7w2kKtwQAu9opvQ
	(envelope-from <linux-media+bounces-56970-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:38:39 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C4620323204
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:38:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B15673173E61
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 10:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97DBD3A543E;
	Wed, 25 Mar 2026 10:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z6eYyiES"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FEC39D6F4;
	Wed, 25 Mar 2026 10:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774434336; cv=none; b=Q8W+928+a3ZkId8gFrEg6pavrz08DWDx5WG4oFGV2nRS2EV6SiUDmBb8HnjG6y7nsAzSJoGALBFCEz/Jdrj+x3wVtBlZ5qcphNOqAkMnprEr4/46McADmvS4EwkH0t/tSOka6UAHZqZYPskzFyigV1U5GhBhoCKSKZPH1VktEJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774434336; c=relaxed/simple;
	bh=eXpDdX/kQyDxNpLURS993lHyshWENbFjP5/yo5InZe4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qXamsWUd79WmVbUTyxk2fLqyAlZFKMgRsXK1tpybrkifDGr6ZGoMln/14Ldubkr3VZVI2sbBmowJ93Gz9CECAb1AA/SKI6AewCKyQ7Xha/U7k7N4mnijO3bZ0lwb5KYG5gHjL5tzQdewOUibGpPOzNkIlEI71L6WHxYN3KAU9XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z6eYyiES; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C03E1C2BCB4;
	Wed, 25 Mar 2026 10:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774434335;
	bh=eXpDdX/kQyDxNpLURS993lHyshWENbFjP5/yo5InZe4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Z6eYyiESvckSaaTv0qKMPPOIb+r1EBMMegIRq1Uz9cyWz89rEHUkeS+9+pBlPprzP
	 qUXMfYeFI1q0z3JlZptW4zO7wJoDcD92GD5nMVOm5w9Q2aMH4XzTNf1YEj6wFl7aB3
	 drgMylG372bBWhtOfUK9hTIj97S0uo0tI+BjPcTsQrnrUzIqJwOBTWO7RtHBb8K30S
	 w7MpJh13Hy83lil0oKIm0ckEcj3dLnFKFyQHZPPqlGLJnWeul117IJEGhT6gf4sRAS
	 fO+fF6Q68v79sy8Rr1anfosS6IJj0zqrofIma85wX1YJDI3FVG3hLfp9FMXAfVfT3V
	 nT2D5E9WufqNg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B181BFEA824;
	Wed, 25 Mar 2026 10:25:35 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 25 Mar 2026 11:25:35 +0100
Subject: [PATCH v3 2/2] arm64: dts: rockchip: add mipi csi-2 receiver nodes
 to rk3588
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-rk3588-csi2rx-v3-2-754473981f39@collabora.com>
References: <20260305-rk3588-csi2rx-v3-0-754473981f39@collabora.com>
In-Reply-To: <20260305-rk3588-csi2rx-v3-0-754473981f39@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Collabora Kernel Team <kernel@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774434334; l=2503;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=eOx/3+fLG0p1riU9lvyNxwYlp2uG1DyRr96Nkcj8cCQ=;
 b=88X1+5RPNBwR+aEH0UzzpSoiSmSWeI27iJXJWQAFUO8dGOUF6H/Zf+W/3eP25aduk7l+lu5ru
 yZ34GeKdCQaCpycS3z2fj6VaLtjSVGLZQN/xXBLTRgwgT7dSmVbqpio
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56970-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_REPLYTO(0.00)[michael.riesch@collabora.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,collabora.com:email,collabora.com:replyto,collabora.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fdd30000:email,fdc70000:email,fdd50000:email]
X-Rspamd-Queue-Id: C4620323204
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Michael Riesch <michael.riesch@collabora.com>

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



