Return-Path: <linux-media+bounces-14517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 589DD923A7C
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 11:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A48B282999
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 09:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5E6156230;
	Tue,  2 Jul 2024 09:47:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D752C13D8BA;
	Tue,  2 Jul 2024 09:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719913637; cv=none; b=c1g6Ga84g+l0Ff7RvvTxkTYikzlrhIWTCAi83QH18J1/k9/4yMhvwNpsLPRc7OEEYw3tIRL40mwENxxGbyceU7r1RrChP+pO/e9m1cU+NMZWk1zYj1vPl/JZLulNyO7ekmbhZQNgk1GvEH/F/nlKy9M0Ru3Huh1eXJcZ4KJkrl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719913637; c=relaxed/simple;
	bh=0KLwuWGVUlM4JhPjVFSevzIgSGPPmtIAFrh8QNuZPRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jTy3TBLA0yspZkq1uKSBZ4RuF77JovILW79fm/AIKr+UXIQVzzQ+fBHt4Ygt6rvIwLrvoV/fZXfQVjhV/5NE4ivibd27hAkw92s1Cyn3DyX7ZWm+87wzq83KfZ3AiGsJq+9TqzbSmhLT8s3q6JXT5pt2Z/lqcpwOciZfmo71wHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,178,1716217200"; 
   d="scan'208";a="210014966"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 02 Jul 2024 18:47:14 +0900
Received: from localhost.localdomain (unknown [10.226.93.72])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 630AC40031F9;
	Tue,  2 Jul 2024 18:47:08 +0900 (JST)
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
Subject: [PATCH 6/9] arm64: dts: renesas: r9a07g043u: Add vspd node
Date: Tue,  2 Jul 2024 10:46:16 +0100
Message-ID: <20240702094630.41485-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240702094630.41485-1-biju.das.jz@bp.renesas.com>
References: <20240702094630.41485-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vspd node to RZ/G2UL SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
index 18ef297db933..15e84a5428ef 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
@@ -129,6 +129,19 @@ csi2cru: endpoint@0 {
 		};
 	};
 
+	vspd: vsp@10870000 {
+		compatible = "renesas,r9a07g043u-vsp2", "renesas,r9a07g044-vsp2";
+		reg = <0 0x10870000 0 0x10000>;
+		interrupts = <SOC_PERIPHERAL_IRQ(149) IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cpg CPG_MOD R9A07G043_LCDC_CLK_A>,
+			 <&cpg CPG_MOD R9A07G043_LCDC_CLK_P>,
+			 <&cpg CPG_MOD R9A07G043_LCDC_CLK_D>;
+		clock-names = "aclk", "pclk", "vclk";
+		power-domains = <&cpg>;
+		resets = <&cpg R9A07G043_LCDC_RESET_N>;
+		renesas,fcp = <&fcpvd>;
+	};
+
 	irqc: interrupt-controller@110a0000 {
 		compatible = "renesas,r9a07g043u-irqc",
 			     "renesas,rzg2l-irqc";
-- 
2.43.0


