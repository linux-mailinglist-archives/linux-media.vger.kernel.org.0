Return-Path: <linux-media+bounces-38139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B0EB0BFFF
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 11:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A568B17DA7E
	for <lists+linux-media@lfdr.de>; Mon, 21 Jul 2025 09:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54EC628BA9B;
	Mon, 21 Jul 2025 09:18:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207CC28B7DD;
	Mon, 21 Jul 2025 09:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753089505; cv=none; b=O9u5Nm/pk/1kphINi+KoPQPwn2RymcFO88UpQ+xFy7eo5X1UPtF+p8r+QE47O7Y8m5cqM/k8EEp2fo4scvnh0A1Xk3Q0BnNdm+Sk+j7jvN+kKbRLfpjXlkeoAWvzyW9vB46ICrof1GkkyqEGeH7/emPuTW5k3cKuDMf3eC/WcBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753089505; c=relaxed/simple;
	bh=xnjHjUYh7bkvWBb2R9dYSDyY0XrsOlYjbe57pAX1if4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jTcXzGfLEcy+N2VQeATq2bobLSqJ/RWxkY9BpbYe2kzxzj6rRd2Rku5DQMjbhMoVe+bCT1uVFGJS9yc9q2e+IgWLjeBXQp6I0rnA6QY9dJrUhxDdg37YKJ7bUOlvNK7c0tQvx7ZeHahlhyMDg+GnMK2IIfXlfXco+l2c/0NGRI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so5851279a12.0;
        Mon, 21 Jul 2025 02:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753089502; x=1753694302;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXbkrzEMVmbNq/dofsT/k1IbzrThDycc/Oysnojjrlw=;
        b=dzypyh4W7lP3nmSTsnsi6ddL/RcBMdH99OipOy0Hx6ziixaHFF7LsrA90ZpfPfnRZq
         DEWQ8b8sujuoo610kbZ29R26FDKmSsrgQbR7G+WxlILS9qxX5cvPk9BuGWF0RPOp4WbY
         Td5aRwABMukeeBAs4sW02INcxJmskhduI7jH6HML/OpT6xe8p8ltvtKY6Vw0vu8UHBYM
         hNDYlsiNbCtyYO8Wg2rsXkieflz+YxguW7WPoLC8e5d8wYxeDxpkPgMs9nsuhUlCMVyA
         aiBnSGHuSLRfq/hwQcqF5geknuhu3SmB4G5pe8BGdaFoOHHZLUObN9uiB4sbelmx0r90
         AW6g==
X-Forwarded-Encrypted: i=1; AJvYcCU3RN8TE2C1kAlYE2IQ2cjf0rx3l/reb1i2XxwE1fLgvmY4knN1OqcavA4lOduJfPXFcE9e3eWq/s0=@vger.kernel.org, AJvYcCV9YMIozcEa0WgMzAkdq1cGyr8Qk9cCfLVvLN1RBdSGSk6cBnJ7X95O57Tb3+lZ9zD9DibrjZa2fLIH/avP@vger.kernel.org, AJvYcCXJD0NLJ+JWl0SMJPrkagAfp5A/nFXtxTlG/YGp+RfDCKqDkHL8ljvRa/m26u9a0BkBHIneHAxoC1orPCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZyqILdSgGQSfy7Ty/7bU8k1H6MGicyXpFE0TieIlU007eBZs0
	7asHU1dPJWon4DRo/a/DxCkRrM4X67pSRn249fXr8oWLYRSgrAUtpc8s
X-Gm-Gg: ASbGnctJkpmVevykQK5QxRP7Gvg2vOoxObj9cZOx6au4nEPXbt0yIJDhYPPS2UcuEy1
	cPVpOKwyDAQTnIw/IAgC+eC+euksq93sLlBS4Dh8Tms2gKK3O0HI0q5Milwtk7PeTYtKs06pncz
	LxtiQZy7LVPFmMrKa3FYnz9D/cROd8wvIapZ7VIVaS3zS3TgFzQHFVtyNt9mv9CIuk4RLmZ2tYU
	JJ2R5CBOP4uTdZt0f2j37QRQZvVpiJNLIuPcuS4pjbmHCokPvRT7ilSadEFzOF15l+AMpD5T1P9
	OIzizgwwmKKFE3sOYvTh4yGEoDSjSYJTEUldpHZptrAaMggP40S7oxkrf2qco7IY5LzIlzOXhDe
	8mIyzvm5wis9m295VsxxXNjzoRLwgOk2TYQHezcr2Yi6DLND5L9zKwLLE
X-Google-Smtp-Source: AGHT+IEzjtfi8tq0IDuO5VqiAZtxvVepiC3jbjEcMqZCdnzLVGWSGdtm+F3Pxc9XAXXc20Er6jqAhw==
X-Received: by 2002:a17:906:d268:b0:ae3:c6a3:f855 with SMTP id a640c23a62f3a-ae9ce0b9061mr1910062366b.31.1753089502130;
        Mon, 21 Jul 2025 02:18:22 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca2efc1sm643125266b.83.2025.07.21.02.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 02:18:21 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 21 Jul 2025 11:17:35 +0200
Subject: [PATCH v9 08/10] arm64: dts: rockchip: Add nodes for NPU and its
 MMU to rk3588-base
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-6-10-rocket-v9-8-77ebd484941e@tomeuvizoso.net>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
In-Reply-To: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
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
 Philipp Zabel <p.zabel@pengutronix.de>, 
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

v8:
- Remove notion of top core (Robin Murphy)

Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 91 +++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 1eddc69fd9c9ed95cdc810ba48d9683e3f82489a..a18aa1e6c3f1cd92fe26d657bf26784dc1f84127 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1140,6 +1140,97 @@ power-domain@RK3588_PD_SDMMC {
 		};
 	};
 
+	rknn_core_0: npu@fdab0000 {
+		compatible = "rockchip,rk3588-rknn-core";
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
+		iommus = <&rknn_mmu_0>;
+		status = "disabled";
+	};
+
+	rknn_mmu_0: iommu@fdab9000 {
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
+		assigned-clocks = <&scmi_clk SCMI_CLK_NPU>;
+		assigned-clock-rates = <200000000>;
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
+		assigned-clocks = <&scmi_clk SCMI_CLK_NPU>;
+		assigned-clock-rates = <200000000>;
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
2.50.0


