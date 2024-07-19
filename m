Return-Path: <linux-media+bounces-15151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A029377E2
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 14:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 740821F21D43
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 12:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC22F143881;
	Fri, 19 Jul 2024 12:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="wCaIv5iI"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6832E419;
	Fri, 19 Jul 2024 12:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721392896; cv=none; b=YMXxt1rRzSoKciJTPJ/z1GbdQi0BVQwBwtYgJ91wJgoC0naQaVMrb54siS4hIEPaItubl8Q/9chVqsTMAQJW8Dz6lvz1c+PlYwNQ72AkCM/+kUP2pOumCdLf9iSmtDaQU8uAkzNJlI4gql+3vdwXSWSpUAky8qjg0xo4NBFXPQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721392896; c=relaxed/simple;
	bh=dkJBI/WEA7Z2zjS69onvJAqMWQn0HPSur5PVPAjeGPc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GuunrTFEqhNX+YRZB0HvHkd5W1E5UPz6jCZqATMd0dF+W+Vv6rAmh+Cgd7XQiTk61ffVQ1FxTavSZHeM9lQgHden+0O4ByqRR2PS49E4mhhaOvmHR1i/0/yySATlZY4mf+cIHz2cYCpLSDwSTDgzm/t7KalQxsWZz3uS1S0h/FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=wCaIv5iI; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721392893;
	bh=dkJBI/WEA7Z2zjS69onvJAqMWQn0HPSur5PVPAjeGPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wCaIv5iIRe2M5QSoQhZpTCAX8UNXGDhObjY6YEvyi6Vzkf7Sh4ZvOyUssK+kB/Ett
	 16ZLbE36wbQsL1M1pptkT8ud/QjqBDlxjum2U2/TCuFQogCAFNOLwnVkGdwl/M9BBm
	 BZ2ZwSyaGsg9VIkCoxtgQ9AZ8oOsg6Mi45hHZAbhN0IV+sTn8f+RxUFcDTjO8GMfx8
	 oGkUja+oKg2b40/g9tJMZ5AUfbWHw0s7EQHyqWkC2BHAb+Ptf1tPm8PIfkpRcv8NuQ
	 E/36q4IZTdWKF+F5Lwif3f3lI7mBEG6ggXbO6SAGC59sQfxOgjyH/MPop6LR38wC5C
	 ukfpRHC8ypRCQ==
Received: from shreeya.shreeya (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: shreeya)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 61FD937821CE;
	Fri, 19 Jul 2024 12:41:28 +0000 (UTC)
From: Shreeya Patel <shreeya.patel@collabora.com>
To: heiko@sntech.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	jose.abreu@synopsys.com,
	nelson.costa@synopsys.com,
	shawn.wen@rock-chips.com,
	nicolas.dufresne@collabora.com,
	hverkuil@xs4all.nl,
	hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Shreeya Patel <shreeya.patel@collabora.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: [PATCH v4 3/4] arm64: dts: rockchip: Add device tree support for HDMI RX Controller
Date: Fri, 19 Jul 2024 18:10:31 +0530
Message-Id: <20240719124032.26852-4-shreeya.patel@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240719124032.26852-1-shreeya.patel@collabora.com>
References: <20240719124032.26852-1-shreeya.patel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree support for Synopsys DesignWare HDMI RX
Controller.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Co-developed-by: Dingxian Wen <shawn.wen@rock-chips.com>
Signed-off-by: Dingxian Wen <shawn.wen@rock-chips.com>
Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
---

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
 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi | 56 +++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
index 30db12c4fc82..ca006f5a4c90 100644
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
index 0ce0934ec6b7..96f8ce91eaf4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
@@ -7,6 +7,29 @@
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
+			no-map;
+			status = "disabled";
+		};
+	};
+
 	usb_host1_xhci: usb@fc400000 {
 		compatible = "rockchip,rk3588-dwc3", "snps,dwc3";
 		reg = <0x0 0xfc400000 0x0 0x400000>;
@@ -135,6 +158,39 @@ i2s10_8ch: i2s@fde00000 {
 		status = "disabled";
 	};
 
+	hdmi_receiver: hdmi_receiver@fdee0000 {
+		compatible = "rockchip,rk3588-hdmirx-ctrler", "snps,dw-hdmi-rx";
+		reg = <0x0 0xfdee0000 0x0 0x6000>;
+		power-domains = <&power RK3588_PD_VO1>;
+		rockchip,grf = <&sys_grf>;
+		rockchip,vo1-grf = <&vo1_grf>;
+		interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH 0>,
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


