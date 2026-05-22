Return-Path: <linux-media+bounces-62648-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJlCInHKEGpAdwYAu9opvQ
	(envelope-from <linux-media+bounces-62648-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 23:28:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F13845BA71B
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 23:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDEC4307AD2D
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 21:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9235939150D;
	Fri, 22 May 2026 21:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kFuo1E6G"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E315138A70B;
	Fri, 22 May 2026 21:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779484998; cv=none; b=cWpNoSymKzwCIYbEHkD+0U7DGZMO63FAQA7LqwAOKLassHsa9dMOokMe6J8s52BN4xm+XSWxw8jlSBx/97JJZnLB0sYTKHSwh3JLFiynTljyXZB1syfn431Kv8YR2tkLiyewdxoEng8zVc96NBOrTuKQU9qgEOzMwRx+Ro1dKak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779484998; c=relaxed/simple;
	bh=m/AbRBopamOKiwYPMf8rEgjjYqQK7Co5JGsJxP7jV4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CS4jHF7v/zQbwNNJvuCYWUfN16ior0rnmmNBf5FgfXm3OvvniotCUrXHc2JV6SRQimncFsOvsfyHmI8jKQPxuphJ0A0hhH2HDDroNMnj9DAYSFAIi70olD0c7KHo80kLbFCgoJEoNPvktBRW9TFdp+HWZ+6wem+Gob7qOXj98pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kFuo1E6G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03202C2BCF5;
	Fri, 22 May 2026 21:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779484997;
	bh=m/AbRBopamOKiwYPMf8rEgjjYqQK7Co5JGsJxP7jV4k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kFuo1E6GbAtPd/Cxi6fpNyBzwwkkhwC28dHgocMnt/dzGTi3aMjyr7gtFmBv2uvnL
	 7VNBPg1lQlXWeCXWJ1Iz8h694spTn8ueBZA2iSn5nkYDZnvU6s+WKHdh+YUYjiXn+R
	 qqQQyX9sQ1vIYg0z7vbKQdwq8RBC10GDHljw0q8PKWgUrFn7RtE+jtHdsMf//s7JC/
	 WlbS3BRGZfDlzy+hjBaV2dv+Q5U1fhq/z/q0mWnDBlycawGoDO3GsQIa7lzO3svARC
	 DWx+l5U+gNb6h0wNAd4xiG3JVf/lzosBTK5wD3BbcHXHheWRB+Qxc0rlfowZ5M5mUZ
	 rA1/X+wt7k66g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC956CD4F3D;
	Fri, 22 May 2026 21:23:16 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 22 May 2026 23:23:11 +0200
Subject: [PATCH v5 5/8] arm64: dts: rockchip: add vicap node to rk3588
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rk3588-vicap-v5-5-d1d1f5265c56@collabora.com>
References: <20260522-rk3588-vicap-v5-0-d1d1f5265c56@collabora.com>
In-Reply-To: <20260522-rk3588-vicap-v5-0-d1d1f5265c56@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2_=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>, 
 Charalampos Mitrodimas <charmitro@posteo.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779484994; l=3302;
 i=michael.riesch@collabora.com; s=20260428; h=from:subject:message-id;
 bh=b/JPknTi57RvPKXxe7hO2AELGPmkoSjW8sarGr2DoLo=;
 b=IQr8ff1GNVzA20henso2tdEpSgZGkB8cjc72gDGV5E8DCRJM60gsQ30GL2+zkrwnpLsv6HUzz
 RmrRoHOvxADALn27gWu3ghXlSlM7uYn1rcACRKlD3F4apmCSUGAdBm7
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=tAbmpPTE1MELYweXqqDU40fa18uCO6s32GJL/RzyW2Y=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20260428
 with auth_id=759
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62648-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,posteo.net,collabora.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	HAS_REPLYTO(0.00)[michael.riesch@collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: F13845BA71B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Michael Riesch <michael.riesch@collabora.com>

Add the device tree node for the RK3588 Video Capture (VICAP) unit.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 91 +++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 4d80e5e1f0339b6e91adf40da6cc8389ffd4ddc9..87b0ac0893a9fe404a6274067bc142d782e3366e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1430,6 +1430,89 @@ av1d: video-codec@fdc70000 {
 		resets = <&cru SRST_A_AV1>, <&cru SRST_P_AV1>, <&cru SRST_A_AV1_BIU>, <&cru SRST_P_AV1_BIU>;
 	};
 
+	vicap: video-capture@fdce0000 {
+		compatible = "rockchip,rk3588-vicap";
+		reg = <0x0 0xfdce0000 0x0 0x800>;
+		interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
+			 <&cru DCLK_VICAP>, <&cru ICLK_CSIHOST0>,
+			 <&cru ICLK_CSIHOST1>;
+		clock-names = "aclk", "hclk", "dclk", "iclk", "iclk1";
+		iommus = <&vicap_mmu>;
+		power-domains = <&power RK3588_PD_VI>;
+		resets = <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
+			 <&cru SRST_D_VICAP>, <&cru SRST_CSIHOST0_VICAP>,
+			 <&cru SRST_CSIHOST1_VICAP>,
+			 <&cru SRST_CSIHOST2_VICAP>,
+			 <&cru SRST_CSIHOST3_VICAP>,
+			 <&cru SRST_CSIHOST4_VICAP>,
+			 <&cru SRST_CSIHOST5_VICAP>;
+		reset-names = "arst", "hrst", "drst", "irst0", "irst1",
+			      "irst2", "irst3", "irst4", "irst5";
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
+			vicap_mipi0: port@1 {
+				reg = <1>;
+			};
+
+			vicap_mipi1: port@2 {
+				reg = <2>;
+			};
+
+			vicap_mipi2: port@3 {
+				reg = <3>;
+
+				vicap_mipi2_input: endpoint {
+					remote-endpoint = <&csi2_output>;
+				};
+			};
+
+			vicap_mipi3: port@4 {
+				reg = <4>;
+			};
+
+			vicap_mipi4: port@5 {
+				reg = <5>;
+
+				vicap_mipi4_input: endpoint {
+					remote-endpoint = <&csi4_output>;
+				};
+			};
+
+			vicap_mipi5: port@6 {
+				reg = <6>;
+			};
+
+			vicap_toisp0: port@10 {
+				reg = <16>;
+			};
+
+			vicap_toisp1: port@11 {
+				reg = <17>;
+			};
+		};
+	};
+
+	vicap_mmu: iommu@fdce0800 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdce0800 0x0 0x40>, <0x0 0xfdce0900 0x0 0x40>;
+		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>;
+		clock-names = "aclk", "iface";
+		#iommu-cells = <0>;
+		power-domains = <&power RK3588_PD_VI>;
+		rockchip,disable-mmu-reset;
+		status = "disabled";
+	};
+
 	csi2: csi@fdd30000 {
 		compatible = "rockchip,rk3588-mipi-csi2", "rockchip,rk3568-mipi-csi2";
 		reg = <0x0 0xfdd30000 0x0 0x10000>;
@@ -1452,6 +1535,10 @@ csi2_in: port@0 {
 
 			csi2_out: port@1 {
 				reg = <1>;
+
+				csi2_output: endpoint {
+					remote-endpoint = <&vicap_mipi2_input>;
+				};
 			};
 		};
 	};
@@ -1478,6 +1565,10 @@ csi4_in: port@0 {
 
 			csi4_out: port@1 {
 				reg = <1>;
+
+				csi4_output: endpoint {
+					remote-endpoint = <&vicap_mipi4_input>;
+				};
 			};
 		};
 	};

-- 
2.47.3



