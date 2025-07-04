Return-Path: <linux-media+bounces-36857-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74549AF9770
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 17:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E1E8587E7F
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 15:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF04F307AD9;
	Fri,  4 Jul 2025 15:59:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A540E3271B6;
	Fri,  4 Jul 2025 15:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751644741; cv=none; b=S8rIvbH40cAJ2Q05SWGLwxQCjBdMcJWKFTGifvPORfbv/qt3GL7yX0X9dGhe6G/DPjkxgdIbrO5mBaN1t4xT2gfxXHM70HJ7c8MOn1bI59tS3fRHppiuuTX+3ggVRHIyQx4PgVxwVeYNl/Nx8KkbhZ7heooDZbFYFCsRUmcjaQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751644741; c=relaxed/simple;
	bh=0LgRCoQI7qyxCqauFlfqpaKjx6CVpwBGKfu0sdnj6Z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBX7T0FsIWeouX5GTQkJdTdD+R5p/3SOoHpFy0Ar2F5WmNEydzSqwnKSj+LC4f81p9mylbaTaa2NVQPUEzGtSDnNdYBsm6L7GNmyouQBOIQrPUy8qGQWT7oIerwtxX8WERVMziQHcT/2UxxS1VEkdDGWAsHHZBaQrqMCOHc3LCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id D740B1F00050;
	Fri,  4 Jul 2025 15:58:54 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 58CE2ACA6AC; Fri,  4 Jul 2025 15:51:19 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 682FEACA658;
	Fri,  4 Jul 2025 15:46:40 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v8 6/9] ARM: dts: sun8i: v3s: Add support for the ISP
Date: Fri,  4 Jul 2025 17:46:23 +0200
Message-ID: <20250704154628.3468793-7-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704154628.3468793-1-paulk@sys-base.io>
References: <20250704154628.3468793-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

The V3s (and related platforms) come with an instance of the A31 ISP.
Even though it is very close to the A31 ISP, it is not exactly
register-compatible and a dedicated compatible only is used as a
result.

Just like most other blocks of the camera pipeline, the ISP uses
the common CSI bus, module and ram clock as well as reset.

A port connection to the ISP is added to CSI0 for convenience since
CSI0 serves for MIPI CSI-2 interface support, which is likely to
receive raw data that will need to be processed by the ISP to produce
a final image.

The interconnects property is used to inherit the proper DMA offset.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
index bfe02295f45d..f63534a02706 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
@@ -695,6 +695,14 @@ csi0_in_mipi_csi2: endpoint {
 						remote-endpoint = <&mipi_csi2_out_csi0>;
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+
+					csi0_out_isp: endpoint {
+						remote-endpoint = <&isp_in_csi0>;
+					};
+				};
 			};
 		};
 
@@ -753,5 +761,32 @@ csi1: camera@1cb4000 {
 			resets = <&ccu RST_BUS_CSI>;
 			status = "disabled";
 		};
+
+		isp: isp@1cb8000 {
+			compatible = "allwinner,sun8i-v3s-isp";
+			reg = <0x01cb8000 0x1000>;
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_CSI>,
+				 <&ccu CLK_CSI_SCLK>,
+				 <&ccu CLK_DRAM_CSI>;
+			clock-names = "bus", "mod", "ram";
+			resets = <&ccu RST_BUS_CSI>;
+			interconnects = <&mbus 5>;
+			interconnect-names = "dma-mem";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					isp_in_csi0: endpoint {
+						remote-endpoint = <&csi0_out_isp>;
+					};
+				};
+			};
+		};
 	};
 };
-- 
2.49.0


