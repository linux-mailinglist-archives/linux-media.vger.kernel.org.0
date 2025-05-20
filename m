Return-Path: <linux-media+bounces-32903-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D721ABD4B2
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 12:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A7A34A6076
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 10:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6A326B978;
	Tue, 20 May 2025 10:27:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1641E26B08D;
	Tue, 20 May 2025 10:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747736851; cv=none; b=BMSoxTbmpsisBlP3OFmVtsL0H6k/TjZpjVH+b7i+f834pogsRU6QWvcczXXRJu4M7ZzKEjvRUIx55p2WCqU6kN7kl+u08yG2UVl4Jd047Q399cHsoZDUuSS5raNeH3IR2GAhY/xw/kf8ahqDjtfa5MOE5hYuso7ywrRRep3NcG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747736851; c=relaxed/simple;
	bh=r63jBmdYNfllCSlVbc7iG71kBpdUFZAx1p/Hv2DTI4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Af/RDEl84qOpp/mSpxAbgUagAbIUg6XMJViJWV06zYw1h0S4c5wjFJmt8Sg8r8v9bSZPLK1iOzLHb9oNs6TNq2nRR/z485U/VSpc3+q8AOYMmvtDWF+x8vOPULooxQ4qIOn6JjHUqqy+LT1f88+w9kIm5dQqYDE2OVmLBRvFF4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so59079135e9.3;
        Tue, 20 May 2025 03:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747736848; x=1748341648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=laEkWWVQjQ2oI3CZqHqG5uO1wLsoJjXKyEWBV14uYNg=;
        b=Te7ncP9D/PoQ7Bs+md/GznOWUoZTHPnrE7HbIJ37LjYeOPIVBlyA5cNdbpHCtbyYMh
         x7A6p63EIz6L0zRZIOLb+3u2rl6HCJvJPMvRPgd3N2kjbTfCUEwv9f8PjZmqfcmroNWJ
         yaaptlbiM08eOV62Ynuh+rxrJLkhCB2V5LG7ZGBsA5kJkZeyvMswRFPUIy7hYJ3XlYYB
         rYSh4DIaJc9pbwV0pYrn0I/k3u+nyTlMX6ZcOrs2QPieExLVizrSR0ETgUn1A1rwWBog
         iZfzJFgc7rxD9I/Q0Dkh/8zfq1Jsgvqb0ZTvMjKLP2dv7ASJz+aw4OyjmT8ysqjCQVGg
         /ckQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6ex+S1LQirYTpMjKtB6QwS5+5SCDjRP1LFmjagVTXnj35enbGFrhqkgvGH5RpdSZ0Klb+/MXibGQ=@vger.kernel.org, AJvYcCWtM0y8OObUYiSBk/r2NEyE9Faq/o+vPvISlt8oJFQhOOkF1ij9t9WG5tRaC+CgWRzATs+PgbzIGDRJ2EI=@vger.kernel.org, AJvYcCXM8sW6tivZioFrDb70HRCVPOgiJ0d9maBeMEhy0kV8HVN02lBYJF/2su6tYbInqybwbjS3uQyka35+SyF6@vger.kernel.org
X-Gm-Message-State: AOJu0YyAXlpEw1aeYp2BRSh80gljruPxprJkrXiLLvNplsGCh78ITfva
	t7jzMwYoJxOP83WjvhpjRXNkVqGD9RvbeEfTJ2gZieWMqLJHg91IJX34VucNkLuv
X-Gm-Gg: ASbGncvkNWZo8lw+SZVkfC8Phbq22WU/0mdelNFPWAXj89PVxyOs/HjJlLjzhlGZ1cu
	nZWU4VZj3lHU/ts3cR16sktF8HRVtzXSvP/m6irxde2mHwhYLHk0gX1wcCcFtYywE+WEDWc144A
	iMTUMeOr810JY0AdTukAGapDTJGgKJyNXPGH8fF9483biEYMkBeaYDu/veJcOlnYaUu8nGdXy3V
	ljlMzBtem+oOl8znBkCX29J0MqzCHrUVaAq7XUg5wP2q1F5ah2pSLtj9XtpFlf8BNytVzTbqZGd
	dTp2jnuA4SLL/xZPPe89dx0SVAzNCMUMYLPQA//rW7sdEe8RjvLEdOR3Pewwa+DmJSoTsBYLivv
	6/Ynzhr2w9A==
X-Google-Smtp-Source: AGHT+IE5Bxm/E8r67kmDtvflrTA0WsP6FuXs0GnBPgIeKU2e5T6lT8BURuMuEsuYnHCevSt98CcBpQ==
X-Received: by 2002:a05:600c:6806:b0:43c:fb95:c76f with SMTP id 5b1f17b1804b1-442fd618ee7mr138062635e9.9.1747736848247;
        Tue, 20 May 2025 03:27:28 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d3defsm24680025e9.18.2025.05.20.03.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 03:27:27 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 20 May 2025 12:26:55 +0200
Subject: [PATCH v5 02/10] arm64: dts: rockchip: Add nodes for NPU and its
 MMU to rk3588s
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-6-10-rocket-v5-2-18c9ca0fcb3c@tomeuvizoso.net>
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
In-Reply-To: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
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

v4:
- Adapt to changes in bindings

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 85 +++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 1e18ad93ba0ebdad31642b88ff0f90ef4e8dc76f..f5e58851047e80b23f9ff3244692ad868ddc1ff6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1136,6 +1136,91 @@ power-domain@RK3588_PD_SDMMC {
 		};
 	};
 
+	rknn_core_top: npu@fdab0000 {
+		compatible = "rockchip,rk3588-rknn-core-top";
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
+	rknn_core_1: npu@fdac0000 {
+		compatible = "rockchip,rk3588-rknn-core";
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
+	rknn_core_2: npu@fdad0000 {
+		compatible = "rockchip,rk3588-rknn-core";
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


