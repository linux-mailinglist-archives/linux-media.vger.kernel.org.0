Return-Path: <linux-media+bounces-13044-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17576905453
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 15:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 986282873FA
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 13:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B62D17E460;
	Wed, 12 Jun 2024 13:53:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1D417F37E;
	Wed, 12 Jun 2024 13:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718200394; cv=none; b=I1O8anYwrYNqR8/4slmdclvt9wy7vZuiupen4woT3zTvKUInmqjC8PgHwsO2jMRbh80R1MTHu24upCBBk6XL0Rkqn2r/qEzoW6AmtfyJS3RbqbQfsBmwb4PmLfFE5KpyZBGLy1KHEG0laBkBnMUGz8LiYkLhjJ3RqHe0023solA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718200394; c=relaxed/simple;
	bh=2ksgBeMoDxxU9lmoxZOewpWRGNambwfo3QRSZmh5AUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LWg0doKb9gRCqBO/bE8zX6rS2kA8QNfCoGpHLfDHNXwhF+xrt3nuXJjGwPJNZhueCcNPbDdtigD/Wlf5h+uqWC6EzB8xsXOea61T5CUj00fnri63VzEbEJrdpa3nRQKUSqJbueq3BAZGObf+slDWR5fuuvzS5VyRxbx0ecebCmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52c94cf4c9bso2324513e87.2;
        Wed, 12 Jun 2024 06:53:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718200391; x=1718805191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vg0+/XjLA9DMNjh74DM615g/08bNgkZOcZb3JbFI57w=;
        b=qJwp/p7jcBwylcBuzznqPcNm8E6y7DrYDQaLJ49IAZwaH/8Royuf5Vm53xnKHR3TQR
         6mOjpVAf24WM9bN8CQ0FTBuZklppHfnFRnm39itBtlJTS56cn2LLQb5gYuSsB536uHWJ
         FlHGuYwfwtzUz/yGwMLbyhaRVznVzKochFCO83zW+rwl/eYXdutuniWN4yj8ZE2WhgPy
         Wl7y0tjYJotzQdMT60VhFlUfjf5JL7dzl2s2l6b+wwHWQ3hBeJU6O48rIAMsradRTdjI
         gjuwEzOIi0ZlBgwFn74NLz06po/kXauUWzArmKA6dvivlPuuwem2rBTiDhVltKIexwfu
         G/nw==
X-Forwarded-Encrypted: i=1; AJvYcCV7euCR0kXwj4P1mnHl63rjv5OklMal5Ntx8G7mOsmZ3nOxd5NqKOasLu6RjYsDC5I+dRyNc6ct9IcnS7eQdZTBS56lFoVRyhqZETNpju2si2JjGkWcbRJoSwoS6noZIBHocmpYGhAWngYgcimPBQrIr6QTBCbIJdAbPop0uFESsCiK77BL
X-Gm-Message-State: AOJu0YyFvg61kmgs67JjexWpkM30OnPsdHb+3GRz0XEdrzfWoQwT22Lw
	0TDGI/fcFWanm2rx6easZfcABXSFToU0IsrzBh1rzwutaQjWuxV/
X-Google-Smtp-Source: AGHT+IFb5KiASexlYfqJGzCdUiz4DDkx8C0TVnq0cahH+zxyS5x49RXEnxhGffyDz+kuMTXlB2fIdQ==
X-Received: by 2002:a05:6512:1391:b0:52c:82c7:bdff with SMTP id 2adb3069b0e04-52c9a3b963bmr1947827e87.13.1718200391086;
        Wed, 12 Jun 2024 06:53:11 -0700 (PDT)
Received: from ramallet.home (cst-prg-45-36.cust.vodafone.cz. [46.135.45.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422871ec9e6sm28201695e9.38.2024.06.12.06.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 06:53:10 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 12 Jun 2024 15:52:57 +0200
Subject: [PATCH 4/9] arm64: dts: rockchip: Add nodes for NPU and its MMU to
 rk3588s
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-6-10-rocket-v1-4-060e48eea250@tomeuvizoso.net>
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
In-Reply-To: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Heiko Stuebner <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.13.0

See Chapter 36 "RKNN" from the RK3588 TRM (Part 1).

This is a derivative of NVIDIA's NVDLA, but with its own front-end
processor.

Mostly taken from downstream.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 53 +++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
index 6ac5ac8b48ab..a5d53578c8f6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
@@ -2665,6 +2665,59 @@ gpio4: gpio@fec50000 {
 			#interrupt-cells = <2>;
 		};
 	};
+
+	rknn: npu@fdab0000 {
+		compatible = "rockchip,rk3588-rknn", "rockchip,rknn";
+		reg = <0x0 0xfdab0000 0x0 0x9000>,
+		      <0x0 0xfdac0000 0x0 0x9000>,
+		      <0x0 0xfdad0000 0x0 0x9000>;
+		interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "npu0_irq", "npu1_irq", "npu2_irq";
+		clocks = <&scmi_clk SCMI_CLK_NPU>, <&cru ACLK_NPU0>,
+			 <&cru ACLK_NPU1>, <&cru ACLK_NPU2>,
+			 <&cru HCLK_NPU0>, <&cru HCLK_NPU1>,
+			 <&cru HCLK_NPU2>, <&cru PCLK_NPU_ROOT>;
+		clock-names = "clk_npu",
+			      "aclk0", "aclk1", "aclk2",
+			      "hclk0", "hclk1", "hclk2",
+			      "pclk";
+		assigned-clocks = <&scmi_clk SCMI_CLK_NPU>;
+		assigned-clock-rates = <200000000>;
+		resets = <&cru SRST_A_RKNN0>, <&cru SRST_A_RKNN1>, <&cru SRST_A_RKNN2>,
+			 <&cru SRST_H_RKNN0>, <&cru SRST_H_RKNN1>, <&cru SRST_H_RKNN2>;
+		reset-names = "srst_a0", "srst_a1", "srst_a2",
+			      "srst_h0", "srst_h1", "srst_h2";
+		power-domains = <&power RK3588_PD_NPUTOP>,
+				<&power RK3588_PD_NPU1>,
+				<&power RK3588_PD_NPU2>;
+		power-domain-names = "npu0", "npu1", "npu2";
+		iommus = <&rknn_mmu>;
+		status = "disabled";
+	};
+
+	rknn_mmu: iommu@fdab9000 {
+		compatible = "rockchip,rk3588-iommu";
+		reg = <0x0 0xfdab9000 0x0 0x100>,
+		      <0x0 0xfdaba000 0x0 0x100>,
+		      <0x0 0xfdaca000 0x0 0x100>,
+		      <0x0 0xfdada000 0x0 0x100>;
+		interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "npu0_mmu", "npu1_mmu", "npu2_mmu";
+		clocks = <&cru ACLK_NPU0>, <&cru ACLK_NPU1>, <&cru ACLK_NPU2>,
+			 <&cru HCLK_NPU0>, <&cru HCLK_NPU1>, <&cru HCLK_NPU2>;
+		clock-names = "aclk0", "aclk1", "aclk2",
+			      "iface0", "iface1", "iface2";
+		#iommu-cells = <0>;
+		power-domains = <&power RK3588_PD_NPUTOP>,
+				<&power RK3588_PD_NPU1>,
+				<&power RK3588_PD_NPU2>;
+		power-domain-names = "npu0", "npu1", "npu2";
+		status = "disabled";
+	};
 };
 
 #include "rk3588s-pinctrl.dtsi"

-- 
2.45.2


