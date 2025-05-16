Return-Path: <linux-media+bounces-32644-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4F2ABA133
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 18:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20A0DA21685
	for <lists+linux-media@lfdr.de>; Fri, 16 May 2025 16:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F07E1F4717;
	Fri, 16 May 2025 16:53:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E1B1DED52;
	Fri, 16 May 2025 16:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747414414; cv=none; b=K5xhdrBursdYFcAxZf8wcj84ndGK6oogLPOZa4IUSKbDSDfy0G2gA1wwLlNJpbnwq8IM+jncxHBoB+Co4CH8OPlWwac2fc1Fj0jdbVKXhLQ2Whukb/wkCoxwsr7uktEZ0fQz8WW74b6azOO6gE6+Ih3/za5RDQ7AFqj1XyGsq7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747414414; c=relaxed/simple;
	bh=IeABITpfRJJS0uUqYw87dboYfAhsXOALzmUbUeN84s0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pSHXiReoitek92w1W1B79d7U35HWee/d1Oeo7eouKYNAIVXu5QXk7tRFesb0M0v9vY4Ae1TUaA4r7Fb8t1Q//wbxdoa2TRkjkxwA7nYi5lY4AMvxihGnr0B/+nGg1Sm0nEb7WHpdftLlAnkIkE4nURwD432N9t3OBScpSoIQh4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf848528aso19112745e9.2;
        Fri, 16 May 2025 09:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747414411; x=1748019211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1+iJmqB658a/aUxnQtdRYruzMq2533k3y7JaFRfhZY=;
        b=X3m8wbWrkeUSfUQ1a/uNjILb647YHVkwOu4Y2R+lazNZ7XZ89R47apXesJLj/yRFzq
         eq6zP8DkBwrj9871cq6uFwBcRSITTzXrmyFcjEHmeTQj2db8+wYBF6aACiSexWmBNOkq
         9YERZPAQuBhvClp+I2rIx4iXxt585skRihIJEkYGN+QjgVYu4XFWz7/KYijXkQDTWSr/
         72PFH4wH/wyb3Z88OGFiVgzhdSXYFPFM1Oykd/61kO1tuRj3lD8qcyCvS1Gg64K4ItHi
         J1Gb5eoNE5BBljA0aZza0h1YxfZr+LYy8ltu5OHDtQhNGhnFiT1HfnOtF1hVPF5uTN2q
         LqFw==
X-Forwarded-Encrypted: i=1; AJvYcCWDLkBWzWcuXjqvlP+gbsN5Yk92JD+Lw1BliDRz7CZDQE7pC40VuQdrXf4ao7ezr25BZf7iYSydefBNDozC@vger.kernel.org, AJvYcCXR/xtc+/gybz/JiYgrfDf2L/Gwdal1733hn/7udGZfFdV23Xy9bK+Qdelb3BOSHcfjY9L0BIFDI3U=@vger.kernel.org, AJvYcCXpzimGOZ7u3FhQwRaAzUeFNqw5rUI26f8qKK1o8urd+IrDeGr/syLaD3GmYkbyORoKhBuKFH9aD3k8DZo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5KbNg4sUEXTyr5FgLOeIbJArH98SjC/xzNSkh3ElDWTy46YGy
	IoWhbaj62k+aSQA9pM26L1HCX4wYJwemTFZHEHiwj+Qfo5DXMm+KowkPtp9Fig==
X-Gm-Gg: ASbGncstXLpk+El6kyb50toXYMuP2ZCddTfC51trwthfJd/VpzzjGUlclFVLFOhlEvw
	CbUyj3hdjvwLZzmXXOrSZn/JjUKnng88Wj+zo159QjnUhGpLYDoLLi6+IwhKL93M6K3nbqgGH3l
	FFy//tHeE1Qj1gdaxbMeIhSyJE/x16KEtkLiNdlKMGT7RvgGuN27EFKAOuKCLFFwC57+Ek9zmkZ
	u9v4BB2uVYTmVtJqQ8+mr46FdjoSplMfBAvQfiPQFruAEYvf8Gka3n5tfPnHXCupR4Fw09sE5tG
	z/ch3aY5gFkWq0gSd2U/MUm4z8wUeiK1/xfdI0K2KXkAoNf1lKIvDCAVQ0YhUH5ExuQzZcFAOaG
	qxc4hGkjVrw==
X-Google-Smtp-Source: AGHT+IEqUDOXRIt4evEe97tQreNnr4PJVSbA4T0abD0JQttK3D+ebhXw/aumcpomb2R/8PbIN2ejtg==
X-Received: by 2002:a05:600c:4687:b0:442:f98e:f37 with SMTP id 5b1f17b1804b1-442fd6607d4mr35071725e9.21.1747414410965;
        Fri, 16 May 2025 09:53:30 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3380498sm116511755e9.11.2025.05.16.09.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 09:53:29 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 16 May 2025 18:53:16 +0200
Subject: [PATCH v3 02/10] arm64: dts: rockchip: Add nodes for NPU and its
 MMU to rk3588s
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-6-10-rocket-v3-2-7051ac9225db@tomeuvizoso.net>
References: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
In-Reply-To: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
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
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2

See Chapter 36 "RKNN" from the RK3588 TRM (Part 1).

This is a derivative of NVIDIA's NVDLA, but with its own front-end
processor.

The IP is divided in three cores, programmed independently. The first
core though is special, requiring to be powered on before any of the
others can be used.

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

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 85 +++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 1e18ad93ba0ebdad31642b88ff0f90ef4e8dc76f..7b961ab838212fad8e4a70390fdc917a828433a9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1136,6 +1136,91 @@ power-domain@RK3588_PD_SDMMC {
 		};
 	};
 
+	rknn_core_top: npu-core@fdab0000 {
+		compatible = "rockchip,rk3588-rknn-core-top", "rockchip,rknn-core-top";
+		reg = <0x0 0xfdab0000 0x0 0x1000>,
+		      <0x0 0xfdab1000 0x0 0x1000>,
+		      <0x0 0xfdab3000 0x0 0x1000>;
+		reg-names = "pc", "cna", "core";
+		interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&scmi_clk SCMI_CLK_NPU>, <&cru PCLK_NPU_ROOT>,
+			 <&cru ACLK_NPU0>, <&cru HCLK_NPU0>;
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
+	rknn_core_1: npu-core@fdac0000 {
+		compatible = "rockchip,rk3588-rknn-core", "rockchip,rknn-core";
+		reg = <0x0 0xfdac0000 0x0 0x1000>,
+		      <0x0 0xfdac1000 0x0 0x1000>,
+		      <0x0 0xfdac3000 0x0 0x1000>;
+		reg-names = "pc", "cna", "core";
+		interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_NPU1>, <&cru HCLK_NPU1>;
+		clock-names = "aclk", "hclk";
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
+	rknn_core_2: npu-core@fdad0000 {
+		compatible = "rockchip,rk3588-rknn-core", "rockchip,rknn-core";
+		reg = <0x0 0xfdad0000 0x0 0x1000>,
+		      <0x0 0xfdad1000 0x0 0x1000>,
+		      <0x0 0xfdad3000 0x0 0x1000>;
+		reg-names = "pc", "cna", "core";
+		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_NPU2>, <&cru HCLK_NPU2>;
+		clock-names = "aclk", "hclk";
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


