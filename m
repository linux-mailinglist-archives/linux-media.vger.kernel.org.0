Return-Path: <linux-media+bounces-34195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A69D2ACFCC1
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 08:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4C7617812D
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 06:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EB6257AFE;
	Fri,  6 Jun 2025 06:29:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074C62561AB;
	Fri,  6 Jun 2025 06:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749191354; cv=none; b=YnxM7lBS031H+/LhbpF/kVg68Zeqxd7Ft062NXzIeaBilGO9IwNjAIAD58fboceA6BOlX/A+29N1oYkU0f7pfjVMcmVzMNpnrZg8mMIxfmcp53wkUxTbZV5gRfYZ2D1YmQ22N/1ZZ2f5xGfnYSeMf2vsZaO9zJED0Pw4wo3Qy+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749191354; c=relaxed/simple;
	bh=+bdN/kT5MtsstHPRK67i7Ue5h4bWeV9Hf+M9/Gj3qdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PrTzlZZWT7wZBR98ysz+N7aT/+8ItHpWr9SgLkadt4dM1vUpJowqLupuZssgn4mMwz/jjA5Wj6BGA4N4Z8KNDs0zEbO6Fq4I1Hl6DqdB723PlpcKBAyWJvhJ330f5OGfsU7L4mxa2bwopXVyn2ZqPe5lQ4w5uVWvuF5EuA8VVoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-adb47e0644dso399345066b.0;
        Thu, 05 Jun 2025 23:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749191350; x=1749796150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BBY3zfp/gVT4d7V68F0FjQK1ui4N7CD3XErRkof95EU=;
        b=EDgw+JS3p5GOuOnW1mxT7+O1KnD2oZOqwktJHWLaEdHLU002XR+N8gqB0owaj37SBr
         4nRg9r4Fat+SvkPiwlUxZi7Ud8oGCHBlvJaxwJ4sczOr6AaSG4qO33dtv5Te3K6siDQ2
         YJ1/8VBPrSrbZSYspT2LZm+n40BBPQqhO1p9Ym0it1iYp+Azmh1X0ybycIcgtPlg9CiG
         LCbjzn7YUDSrjEXY7jyFqfCAy+fktCj3qB/nSNU9HoMgXVVotZ6OjofM5CAJUK067bH3
         C1wicdMJ/3hWWqemFka+DFJLg3NwkBtqlZZPjwQ61tWeg6Aa2Rv22BYvPozW/JUuGazZ
         GI8w==
X-Forwarded-Encrypted: i=1; AJvYcCUzR8dXk7ssLSb9NfqSj+G0tCRSLGE4vhBu+zp+EM7kW2HLlDEesS+bmzXa5qDq+ExLs3R53xySOM4i7yc=@vger.kernel.org, AJvYcCWx8KPe2cD7zxUA76zPmSAyk4xlcJ3v83fb4Ust4MGal23x4O378yLsWA7LSm9oc29UrK/9qkgET5pFTVNO@vger.kernel.org, AJvYcCXiB6i9OFT/D+HT7HHs2yizlTTRN1JrbukwAX45zF47gFcZ53vctOCDA//yCnZCj5WDMAx9AiLdZ88=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr2l0117ZQVoQXZa7FHYFxN6FpoS5flOgKwPe+4xp/ojUd7Sks
	7k4UXJaIxBWC3tjtGlH9/o2/wU6A3icrbcteAIzUzIzBMwWZ8kR7NMaT
X-Gm-Gg: ASbGnctZkqZSTlQ9lWSSVkS9X7ffQOZ2LfC7N0uw7FWkTPe3/J5/JWmqi39eTrUjEsd
	ze3GRjXDhCy4T70hgck4e8b5aPUcK7Pdf3CAVpNbSVH7Ep9Sr0Qhd1m0ij+mLrQ297tZsfwBDuJ
	hSd4wypD1zRuBBw7OqolApMas8egZODQJhiHyng9fSIB3125quHjVNDUMDXF/it/Cd0urcbGKg3
	CxHjwRdMkATB3cO6j0UZ2hQnCkFDZpHf+2KKkB3UhQCg1umG/QUCt9JzTk0s6G2lHpi7FRG71Vv
	gUN462azxRFSAVH2kxQ/3wzeKI3jKCcolDFzn03nZT9ue0e94QHXdCjwKnZOTr3wm9xkUaYE7yF
	KqWk3IChGmLwtks/T3pK+
X-Google-Smtp-Source: AGHT+IGIgByRiDaxu7x+GgdDAyi0pg04HKabQz6DUty+YC/3MjbJAWO/hPj1HK0PAFL+6D5n41HM1A==
X-Received: by 2002:a17:907:c22:b0:aca:d29e:53f1 with SMTP id a640c23a62f3a-ade1a9ac994mr194794266b.12.1749191350122;
        Thu, 05 Jun 2025 23:29:10 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d754653sm67989966b.20.2025.06.05.23.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 23:29:09 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 06 Jun 2025 08:28:28 +0200
Subject: [PATCH v7 08/10] arm64: dts: rockchip: Add nodes for NPU and its
 MMU to rk3588-base
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-6-10-rocket-v7-8-dc16cfe6fe4e@tomeuvizoso.net>
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
In-Reply-To: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2

See Chapter 36 "RKNN" from the RK3588 TRM (Part 1).

The IP is divided in three cores, programmed independently. The first
core though is special, being able to delegate work to the other cores.

The IOMMU of the first core is also special in that it has two subunits
(read/write?) that need to be programmed in sync.

v2:
- Have one device for each NPU core (Sebastian Reichel)
- Have one device for each IOMMU (Sebastian Reichel)
- Correctly sort nodes (Diederik de Haas)
- Add rockchip,iommu compatible to IOMMU nodes (Sebastian Reichel)

v3:
- Adapt to a split of the register block in the DT bindings (Nicolas
  Frattaroli)

v4:
- Adapt to changes in bindings

v6:
- pclk and npu clocks are needed by all clocks (Rob Herring)

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 87 +++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 335b4489691b6299c4fe28342e827f07c920c665..a44dfb376fdf4c29e1bd307d9a7d1621e11d8c59 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1136,6 +1136,93 @@ power-domain@RK3588_PD_SDMMC {
 		};
 	};
 
+	rknn_core_top: npu@fdab0000 {
+		compatible = "rockchip,rk3588-rknn-core-top";
+		reg = <0x0 0xfdab0000 0x0 0x1000>,
+		      <0x0 0xfdab1000 0x0 0x1000>,
+		      <0x0 0xfdab3000 0x0 0x1000>;
+		reg-names = "pc", "cna", "core";
+		interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_NPU0>, <&cru HCLK_NPU0>,
+			 <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_ROOT>;
+		clock-names = "aclk", "hclk", "npu", "pclk";
+		assigned-clocks = <&scmi_clk SCMI_CLK_NPU>;
+		assigned-clock-rates = <200000000>;
+		resets = <&cru SRST_A_RKNN0>, <&cru SRST_H_RKNN0>;
+		reset-names = "srst_a", "srst_h";
+		power-domains = <&power RK3588_PD_NPUTOP>;
+		iommus = <&rknn_mmu_top>;
+		status = "disabled";
+	};
+
+	rknn_mmu_top: iommu@fdab9000 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdab9000 0x0 0x100>,
+		      <0x0 0xfdaba000 0x0 0x100>;
+		interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_NPU0>, <&cru HCLK_NPU0>;
+		clock-names = "aclk", "iface";
+		#iommu-cells = <0>;
+		power-domains = <&power RK3588_PD_NPUTOP>;
+		status = "disabled";
+	};
+
+	rknn_core_1: npu@fdac0000 {
+		compatible = "rockchip,rk3588-rknn-core";
+		reg = <0x0 0xfdac0000 0x0 0x1000>,
+		      <0x0 0xfdac1000 0x0 0x1000>,
+		      <0x0 0xfdac3000 0x0 0x1000>;
+		reg-names = "pc", "cna", "core";
+		interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_NPU1>, <&cru HCLK_NPU1>,
+			 <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_ROOT>;
+		clock-names = "aclk", "hclk", "npu", "pclk";
+		resets = <&cru SRST_A_RKNN1>, <&cru SRST_H_RKNN1>;
+		reset-names = "srst_a", "srst_h";
+		power-domains = <&power RK3588_PD_NPU1>;
+		iommus = <&rknn_mmu_1>;
+		status = "disabled";
+	};
+
+	rknn_mmu_1: iommu@fdac9000 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdaca000 0x0 0x100>;
+		interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_NPU1>, <&cru HCLK_NPU1>;
+		clock-names = "aclk", "iface";
+		#iommu-cells = <0>;
+		power-domains = <&power RK3588_PD_NPU1>;
+		status = "disabled";
+	};
+
+	rknn_core_2: npu@fdad0000 {
+		compatible = "rockchip,rk3588-rknn-core";
+		reg = <0x0 0xfdad0000 0x0 0x1000>,
+		      <0x0 0xfdad1000 0x0 0x1000>,
+		      <0x0 0xfdad3000 0x0 0x1000>;
+		reg-names = "pc", "cna", "core";
+		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_NPU2>, <&cru HCLK_NPU2>,
+			 <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_ROOT>;
+		clock-names = "aclk", "hclk", "npu", "pclk";
+		resets = <&cru SRST_A_RKNN2>, <&cru SRST_H_RKNN2>;
+		reset-names = "srst_a", "srst_h";
+		power-domains = <&power RK3588_PD_NPU2>;
+		iommus = <&rknn_mmu_2>;
+		status = "disabled";
+	};
+
+	rknn_mmu_2: iommu@fdad9000 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdada000 0x0 0x100>;
+		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_NPU2>, <&cru HCLK_NPU2>;
+		clock-names = "aclk", "iface";
+		#iommu-cells = <0>;
+		power-domains = <&power RK3588_PD_NPU2>;
+		status = "disabled";
+	};
+
 	vpu121: video-codec@fdb50000 {
 		compatible = "rockchip,rk3588-vpu121", "rockchip,rk3568-vpu";
 		reg = <0x0 0xfdb50000 0x0 0x800>;

-- 
2.49.0


