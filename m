Return-Path: <linux-media+bounces-26979-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ECBA44A79
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 19:34:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F1551732A7
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 18:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39BA7189B91;
	Tue, 25 Feb 2025 18:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="fdactwl/"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E3E14F9C4;
	Tue, 25 Feb 2025 18:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740508373; cv=pass; b=IYq/1NMl0RI08JhM4Vq/p3P6y8hGGiW8kswxg7Isd6QLTG4wKeVryzdH51y6y1D/HQlUw+zHVfKfUWNV72DX3Tv5pYrDI/dNxiRtygNkYhRODvMF9QYOTxXeYXhmGvxgD8vNs/H3H4S7okSDOau5WxYjU76RMS13RKrXzo/zC90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740508373; c=relaxed/simple;
	bh=45EZu9kkzl5OwUmwDGaw6JS8EitUKF1mOe5bkbmhpS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jyfgE5oGVhNAN+HtVdWzfpkpKJkLKXntF28kVMolG+f01Cxr42rQphrO8PEgueY+NFWAieda0bN64tycNz2kTNr4Zj+MkF18yY3q5rJleCRi5ryDbrPqC5IwtDTpY4ffPtvW5BWN8EYj7SRZ56sCea7wliO2heATs7Fh2M7a9iM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=fdactwl/; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740508325; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TvvvS2yyOnIMXN54B22FJz18QFgFwc41NScfyGKPkxLkxLRHQgYkSqiinbaHZlVPI61/hBYDF3vDXqiBDCx8I0tOovwbO7ZSS8Qe+nMXuuodoIAKpke0SChcParEUHLWdsGlpLjvRVavFnNtM0wjZ53AyjgWBItzHMkXMh9ygc4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740508325; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wx0i2BTQEV+R7NoKsDdzMKdh9jqK1pOVfRv5zU5IOEA=; 
	b=Isj68yanHt0CT2zV1KmPzklK4/I2k84g85AqnD/akcSme9j3Z/IwEX9pCOiZG2Wb1R89SI1Pd1J63DHeEdX/w6XbchIYwZhErOF2L/qQ6m9jCoBRCqHGaqZfsEu1wFSkCdGwV58+3Bf9Nrm1+Ayg5b3D6JdqK/TIe+8TAKOtt9o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740508325;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=wx0i2BTQEV+R7NoKsDdzMKdh9jqK1pOVfRv5zU5IOEA=;
	b=fdactwl/Qi5wNnoDHuNbMgT2JCjpBi4ZIjqlp78qPLD2xmEOM5rQpisrknKeVkb3
	lKV9ZhaKy0by/OsWRmEnrTrj815UTXZqHBlwbXdYe5iU9MOdbOqkJxpGTaVAUqPyIyJ
	hdZj+IumI+RGyynf4RBuJtQeC7kTkR+r/axMRcFc=
Received: by mx.zohomail.com with SMTPS id 1740508323681974.6714381973419;
	Tue, 25 Feb 2025 10:32:03 -0800 (PST)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Shreeya Patel <shreeya.patel@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	jose.abreu@synopsys.com,
	nelson.costa@synopsys.com,
	shawn.wen@rock-chips.com,
	nicolas.dufresne@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Tim Surber <me@timsurber.de>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v10 4/6] arm64: dts: rockchip: Add device tree support for HDMI RX Controller
Date: Tue, 25 Feb 2025 21:30:56 +0300
Message-ID: <20250225183058.607047-5-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225183058.607047-1-dmitry.osipenko@collabora.com>
References: <20250225183058.607047-1-dmitry.osipenko@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Shreeya Patel <shreeya.patel@collabora.com>

Add device tree support for Synopsys DesignWare HDMI RX
Controller.

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Co-developed-by: Dingxian Wen <shawn.wen@rock-chips.com>
Signed-off-by: Dingxian Wen <shawn.wen@rock-chips.com>
Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
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
index 4a950907ea6f..b7d06f93c8ce 100644
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
2.48.1


