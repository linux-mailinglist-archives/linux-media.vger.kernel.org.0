Return-Path: <linux-media+bounces-14774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A14B892BC00
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 15:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B09628369E
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 13:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7BA18A924;
	Tue,  9 Jul 2024 13:52:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330BF181D0D;
	Tue,  9 Jul 2024 13:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720533171; cv=none; b=IABZtozScBSVC/VwS0Z/LyEkCX4umZBRKoE1pIqexPA1INQ4sOPhw3yPjDYo6LBJifJ75FSaaOYwO+vUPngNa64sn3QRtwXkGvWeX1puDE8LSV+BcSjRUJKhPFUp/e2oISHaB7ta0yKXX6iR38XlRjy+9/WSGTg2BRrhpgwH7Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720533171; c=relaxed/simple;
	bh=YL9pLO05LtVJrFx2GIztKgltcNq2guFaLtlRrsCbGDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KILd4gfE0JGz7W3yx5pD6iDvcj1M2lmVPKdsQ2xb5S9tM4cM2Q1ySq08RjowBPel0fS6vypZCuNfydfqLuake39LNG7DtxGAZwOvk5BOpNyW9XM6maq6kvk4a2ZW6W8qjwdnuPA58B3ZZu2w5/QEZIpPkxBkGeSX3u06VEFJH/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,195,1716217200"; 
   d="scan'208";a="210808068"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Jul 2024 22:52:49 +0900
Received: from localhost.localdomain (unknown [10.226.92.130])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id B391C43DEDAE;
	Tue,  9 Jul 2024 22:52:43 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 8/9] arm64: dts: renesas: r9a07g043u: Add DU node
Date: Tue,  9 Jul 2024 14:51:46 +0100
Message-ID: <20240709135152.185042-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DU node to RZ/G2UL SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 25 +++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
index d88bf23b0782..0a4f24d83791 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
@@ -153,6 +153,31 @@ fcpvd: fcp@10880000 {
 		resets = <&cpg R9A07G043_LCDC_RESET_N>;
 	};
 
+	du: display@10890000 {
+		compatible = "renesas,r9a07g043u-du";
+		reg = <0 0x10890000 0 0x10000>;
+		interrupts = <SOC_PERIPHERAL_IRQ(152) IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cpg CPG_MOD R9A07G043_LCDC_CLK_A>,
+			 <&cpg CPG_MOD R9A07G043_LCDC_CLK_P>,
+			 <&cpg CPG_MOD R9A07G043_LCDC_CLK_D>;
+		clock-names = "aclk", "pclk", "vclk";
+		power-domains = <&cpg>;
+		resets = <&cpg R9A07G043_LCDC_RESET_N>;
+		renesas,vsps = <&vspd 0>;
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+				du_out_rgb: endpoint {
+				};
+			};
+		};
+	};
+
 	irqc: interrupt-controller@110a0000 {
 		compatible = "renesas,r9a07g043u-irqc",
 			     "renesas,rzg2l-irqc";
-- 
2.43.0


