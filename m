Return-Path: <linux-media+bounces-22971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 040A49E9FFF
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 21:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90557165469
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 20:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F3E199FAC;
	Mon,  9 Dec 2024 20:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="p5uV6pGp";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="PeX2v8Xp"
X-Original-To: linux-media@vger.kernel.org
Received: from a7-39.smtp-out.eu-west-1.amazonses.com (a7-39.smtp-out.eu-west-1.amazonses.com [54.240.7.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C00D1993B2;
	Mon,  9 Dec 2024 20:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.7.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733774566; cv=none; b=guynihUBqQMzwP8RLULxeO1GrbWUsZOjbUMwJQEzSHktStlS43rnwvquCBNn0UIC4ACq/Jgr7xYKQmhOFe76KKJHSXQPQgGzYykWAjepreQBZeiM0aZVVu0hjBfAHGa0Chjtk5A6yRWyw6wLvDTuOtHI7lVO7F/ymgu59TD/4CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733774566; c=relaxed/simple;
	bh=QBzH9CuLKr7HcYXPsbeS4iEFc6a5mvd6bQSm9OBbi/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WfZqfT4VAxwP0S4+b4oE/i9pw2I0QZUOZ/FaQXLNyfElG+0H5O8gv+UU9/v8AgU4OZpDrKSAG1SwJbW4ZBJafniivIYwq56YBqnIhxw12dwgBLQTzz4mGNgvXqKQwH/YDTY2C0zURaVJzax4KhSFYy/6sPH8SIfyUGwhu+uQSNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=amazonses.collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=p5uV6pGp; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=PeX2v8Xp; arc=none smtp.client-ip=54.240.7.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.collabora.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bc7lryepznv65m6r2ewkpoafjt4fiq42; d=collabora.com; t=1733774562;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=QBzH9CuLKr7HcYXPsbeS4iEFc6a5mvd6bQSm9OBbi/E=;
	b=p5uV6pGpNd5WZHPVH5Yfcs2bTW41LkFV5Ennqr/PNFmV1avh/rCUmvxqIPKcI8mv
	DK25HWRPhgkxRpNV5SwkFxOc81yaU0JXAhc1mvd34Gx9babTEkj6cgtB/8gn9NlkZ72
	OY9jK+OQGYVGIqkL8um2dXfNIC7OZW+GcF9OFTp6GkJsOt7jo9fmyRuzoN6oxeGuD6Q
	+KilPOQxa4tf2ILjL+y7s7NNCC+Svtps/XGMEjVny1Zcp7MU7sGinCAySJ3qSlrRTSC
	iPGC0m4CrxQ1FwuV09qBUnqXRUYrUMwygAbOrJJek81VT98S/Y5PdRayNF1+mjqz/ZP
	zTq0d0c6nA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1733774562;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=QBzH9CuLKr7HcYXPsbeS4iEFc6a5mvd6bQSm9OBbi/E=;
	b=PeX2v8XpmVHLI3ynVwPuoXkAWzIiNOhOAsi+34lD9xCwjmCTV9yXZrhoMAXKP7oZ
	7DoHaka1O5fil31viEtzV/WZHM4Dj5pdSXt7wQ0JVhONO8upcFZX59KIr+2tT5Lrqwk
	Mu3nvCc06HLnDXvddzvOTQwo4/4Z/YwWiOrR7ubI=
From: Shreeya Patel <shreeya.patel@collabora.com>
To: heiko@sntech.de, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	p.zabel@pengutronix.de, jose.abreu@synopsys.com, 
	nelson.costa@synopsys.com, shawn.wen@rock-chips.com, 
	nicolas.dufresne@collabora.com, hverkuil@xs4all.nl, 
	hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, shreeya.patel@collabora.com, 
	dmitry.osipenko@collabora.com
Subject: [PATCH v5 3/4] arm64: dts: rockchip: Add device tree support for HDMI RX Controller
Date: Mon, 9 Dec 2024 20:02:42 +0000
Message-ID: <01020193ad045582-afdad76d-ab76-4e3e-bf93-6951ed6219a8-000000@eu-west-1.amazonses.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241209200120.3228643-1-shreeya.patel@collabora.com>
References: <20241209200120.3228643-1-shreeya.patel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.12.09-54.240.7.39

Add device tree support for Synopsys DesignWare HDMI RX
Controller.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Co-developed-by: Dingxian Wen <shawn.wen@rock-chips.com>
Signed-off-by: Dingxian Wen <shawn.wen@rock-chips.com>
Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
---

Changes in v5 :-
- Add alignment property to ensure hdmi-receiver-cma
  starts at a 64KB-aligned address
- Correct one of the interrupt IRQ number

Changes in v4 :-
- Remove DTS changes added to this patch
- Remove the HDMI RX pin nodes as it's already present
  in the rk3588-base-pinctrl.dtsi

Changes in v3 :-
- Rename cma node and phandle names
- Elaborate the comment to explain 160MiB calculation
- Move &hdmi_receiver_cma to the rock5b dts file

Changes in v2 :-
- Fix some of the checkpatch errors and warnings
- Rename resets, vo1-grf and HPD
- Move hdmirx_cma node to the rk3588.dtsi file

 .../dts/rockchip/rk3588-base-pinctrl.dtsi     | 14 +++++
 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi | 57 +++++++++++++++++++
 2 files changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
index 7f874c77410c..2d4b9986a177 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
@@ -594,6 +594,20 @@ hdmim0_tx1_hpd: hdmim0-tx1-hpd {
 				/* hdmim0_tx1_hpd */
 				<1 RK_PA6 5 &pcfg_pull_none>;
 		};
+
+		/omit-if-no-ref/
+		hdmim1_rx: hdmim1-rx {
+			rockchip,pins =
+				/* hdmim1_rx_cec */
+				<3 RK_PD1 5 &pcfg_pull_none>,
+				/* hdmim1_rx_scl */
+				<3 RK_PD2 5 &pcfg_pull_none_smt>,
+				/* hdmim1_rx_sda */
+				<3 RK_PD3 5 &pcfg_pull_none_smt>,
+				/* hdmim1_rx_hpdin */
+				<3 RK_PD4 5 &pcfg_pull_none>;
+		};
+
 		/omit-if-no-ref/
 		hdmim1_rx_cec: hdmim1-rx-cec {
 			rockchip,pins =
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
index ead151941e84..bde1efdf1824 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -7,6 +7,30 @@
 #include "rk3588-extra-pinctrl.dtsi"
 
 / {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/*
+		 * The 4k HDMI capture controller works only with 32bit
+		 * phys addresses and doesn't support IOMMU. HDMI RX CMA
+		 * must be reserved below 4GB.
+		 * The size of 160MB was determined as follows:
+		 * (3840 * 2160 pixels) * (4 bytes/pixel) * (2 frames/buffer) / 10^6 = 66MB
+		 * To ensure sufficient support for practical use-cases,
+		 * we doubled the 66MB value.
+		 */
+		hdmi_receiver_cma: hdmi-receiver-cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x0 0x0 0xffffffff>;
+			size = <0x0 (160 * 0x100000)>; /* 160MiB */
+			alignment = <0x0 0x40000>; /* 64K */
+			no-map;
+			status = "disabled";
+		};
+	};
+
 	usb_host1_xhci: usb@fc400000 {
 		compatible = "rockchip,rk3588-dwc3", "snps,dwc3";
 		reg = <0x0 0xfc400000 0x0 0x400000>;
@@ -135,6 +159,39 @@ i2s10_8ch: i2s@fde00000 {
 		status = "disabled";
 	};
 
+	hdmi_receiver: hdmi_receiver@fdee0000 {
+		compatible = "rockchip,rk3588-hdmirx-ctrler", "snps,dw-hdmi-rx";
+		reg = <0x0 0xfdee0000 0x0 0x6000>;
+		power-domains = <&power RK3588_PD_VO1>;
+		rockchip,grf = <&sys_grf>;
+		rockchip,vo1-grf = <&vo1_grf>;
+		interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "cec", "hdmi", "dma";
+		clocks = <&cru ACLK_HDMIRX>,
+			 <&cru CLK_HDMIRX_AUD>,
+			 <&cru CLK_CR_PARA>,
+			 <&cru PCLK_HDMIRX>,
+			 <&cru CLK_HDMIRX_REF>,
+			 <&cru PCLK_S_HDMIRX>,
+			 <&cru HCLK_VO1>;
+		clock-names = "aclk",
+			      "audio",
+			      "cr_para",
+			      "pclk",
+			      "ref",
+			      "hclk_s_hdmirx",
+			      "hclk_vo1";
+		resets = <&cru SRST_A_HDMIRX>, <&cru SRST_P_HDMIRX>,
+			 <&cru SRST_HDMIRX_REF>, <&cru SRST_A_HDMIRX_BIU>;
+		reset-names = "axi", "apb", "ref", "biu";
+		memory-region = <&hdmi_receiver_cma>;
+		pinctrl-0 = <&hdmim1_rx>;
+		pinctrl-names = "default";
+		status = "disabled";
+	};
+
 	pcie3x4: pcie@fe150000 {
 		compatible = "rockchip,rk3588-pcie", "rockchip,rk3568-pcie";
 		#address-cells = <3>;
-- 
2.39.2


