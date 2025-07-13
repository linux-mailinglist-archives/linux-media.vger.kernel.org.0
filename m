Return-Path: <linux-media+bounces-37565-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D313B03026
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 10:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B87174A0B3F
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 08:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4771F4634;
	Sun, 13 Jul 2025 08:39:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC5522259D;
	Sun, 13 Jul 2025 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752395963; cv=none; b=UN+9hwnfANJExUlPWXYd1RNijdPT5Kal+ZocWKxqr9okdFfJR30hDVOJ2MimmADMl8rxs48iPpo2VSoTaQq+fi17ZXGLxpwc1Lc14HFpC8s4eHDRtyUeDsDp1TkDVodsY+6W/9wMV9fXSwiclJ8LnS3FNsiX3wyGPovUTdjwKrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752395963; c=relaxed/simple;
	bh=vS5h+RJDuH5UqFLX3Bg7UOjvdKenYKICf5gL9TCLwH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EhI8oCUgIRf8QIwsJNHWgqKq4I6ycXnA7HAsAVO9H6pfWZald/vyWZmZvrkMUqR8ByoCBkSwtY3XRw8/ohD5zc5RphR4vrIUj6YtLwjlx+Ebr8kKsthYQsmaj91b9Ns4nAc80So/+w0DHJFVLPKRdst7a5a7qRJIIEBMsJTRx3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so590647366b.2;
        Sun, 13 Jul 2025 01:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752395960; x=1753000760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Hm16g5Mxtx53PSxMN74Q22wyf8qfoU99Wb/xlnrO7E=;
        b=JNms2s+GpNGJdMc8KzskkWeSbhKTj6zUwRiKoCmKjoBaJC/wGeZPojJTOISHb69FkS
         AoY22puRqdxuFKObmpgp4uhZSYVuXsovXjMZgoTwiDop2A0TeC77BGnw+pWDuX3FE5TB
         KZZb6ssh4xu5SPXQifMEvjOWCeVgQFcRVOtUyahOmm6pEMu1WNxx5+9LAOyWoHd7ubOE
         6lnBFrQkAb7ljcFy8wkoJZLeRWqc5ZsKRSSJfsbKJfCa6gShnUPfufbHF2A0eDbLjVYs
         wqi4DVqELE8UlZeGKObs/NhrG6c+wOKVPyUJZCiZpqC/txVN7mb7yb5hBuqSvQSdCSir
         eQmg==
X-Forwarded-Encrypted: i=1; AJvYcCUQqMyLVXDXHLdy/tg9t0zuLby0JALS11ghPpjgy2ueZGNn8I5rzlrWQ4+6REK7r69qSEoCvioDJXw=@vger.kernel.org, AJvYcCWqnt7Kg96o5itN5DP/btdDBPbLifl+nudoFQKcgIt1NB6zn8BPapjWCtdfnuBZxrn445pByXIudBqlfrAr@vger.kernel.org, AJvYcCXiVpExjYraDrw1IVRueJVIQcnr1mKeUqXSww9nWA6xwcr3tXcl0HjugSqc9povz1E4O8kqKn6je6EM3Fs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJgGRiaNB64NDXqWGtDiCr/b8eqAq8vniAHpeFeJaN1fmwe9TW
	K6o7i+q+jI4XTmkxKTm2RW2NmS0taI0c8FKgs+M2FmumcrKmWDBndwm1
X-Gm-Gg: ASbGnct55zzFzSzoZ0RD+A/LaVbdpzZO8X9dDJvrgHxLBxai/U27YFeLYDXRPzkSu+J
	o3chK7FIQAA0EJ6owJ/16UTa+MLp5GG4PfWzzxlmiIi900Q/ghjcuhTjjF9CogxL6nUlCoflvwu
	Ti4w5dP0uAsBGjYelG268VXcO1a1fHSn17D51ml6bcrgPz9uFJzaPcxgwaw7YYRsgMHnatUfjnu
	xNGJ0aGIWpFP+CPFTHhsWa0VE5i2R/rjlCKzeF+7vYsBLY0Tfym6mLyOsrJBB/XSW+L9UYlWyPC
	kZPnpw+a2GQqcXPp6lGTA2+2DOiVgu/vzwR7fX8r8o0vl+UTyk+heEh6H7EyXtnXct6HAqgn7k9
	bv6V45jAfhTJjvK6zYioyQFZZTBKFqNG/OkG/ZjVMTUpNJnFffn5lItjo
X-Google-Smtp-Source: AGHT+IHYAnqKa11NZdx4DJugnnBcrrL8eyEdMDfMSbvMuRV0PN4x6j1/G2L31aEokbnVnM1KlwmfHA==
X-Received: by 2002:a17:907:3f14:b0:ad8:a935:b8eb with SMTP id a640c23a62f3a-ae6fc6a70b1mr950430466b.3.1752395959438;
        Sun, 13 Jul 2025 01:39:19 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90a42sm610876266b.27.2025.07.13.01.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:39:19 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sun, 13 Jul 2025 10:38:58 +0200
Subject: [PATCH v8 08/10] arm64: dts: rockchip: Add nodes for NPU and its
 MMU to rk3588-base
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-6-10-rocket-v8-8-64fa3115e910@tomeuvizoso.net>
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
In-Reply-To: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
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
index 1eddc69fd9c9ed95cdc810ba48d9683e3f82489a..dbd472feaa8b3f8c14597a48a4f5afbe3cb45b6a 100644
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


