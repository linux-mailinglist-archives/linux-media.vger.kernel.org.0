Return-Path: <linux-media+bounces-26899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05455A436A5
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 08:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D6AB189F499
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 07:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3F125D525;
	Tue, 25 Feb 2025 07:56:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70B725B680;
	Tue, 25 Feb 2025 07:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740470166; cv=none; b=o4ahPcGQBTKW6JTvKp+iJiNhXBCIYWz9zivD2KIDdQaQQL2Bs6ve+VIqZmUazk5Mg3MC80EOT+94oYPUIgiltTbQkU+3/tWS0O7kHbylZHdxE/CT3MIQSpsMONR4Aj9SLOMjww8HO/a0CfpdoAZcTetzdNS7W69VbaNhb/p1fmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740470166; c=relaxed/simple;
	bh=fhDQbozmhpj3uv7nN7NCsI0P+gUCgH7AjflzpIAnaDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V16H37rtqHKqLkHKFYSMhncRwz6ZhaMHh6tnvZLuRJ8+7FEg6h9lkorYJc3wcX3Ubv8PYTnEw0BgA9dEQuNREXyqR2H/ere2Ifk3Xnq0TEocMAyW3t+FD9QazrvN7XrndC5GTfPvVyuj+7+2yz3f5qQjU32u0zPacNQI4bG/LOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so49848615e9.1;
        Mon, 24 Feb 2025 23:56:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740470163; x=1741074963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bttKeyS+W49kYKVE/Q0TanEzPtlhvTNN8fcNqxR6WQw=;
        b=wb86UruJkUWfetwZtxZ737JbKkceXGmZFDFEvu5+97ho+snTGlB/eLGDic2jKrnbO4
         9w4L1dGM65kqwpRtH5lzvHQyIWEjHg0wCWIEoBXI4tHMXPcrcC+2VwkfEK2rWd8Wh+/a
         NKW/bCLXiptg5vbpBXf0nyu/TqTxlzTU5YgTwj+YMIv9ZBk7WAf7rsD0JgUaV+iTXTO6
         8cOEgr2/pp+Yxy07R+WBg2/NnkDUPweqrVoZZimJZNa2ph6Fhz0RcgTouYi7b4es1NIS
         Sk2YBjif2ZaxD+Cx1jl3L00+dVvRDh39CC2ZtGR2QFm0AMY5Efn9Uz55OZVN+sjlfx0a
         uYNg==
X-Forwarded-Encrypted: i=1; AJvYcCWZW8ZVNdKgX/LnK41f2z5xlY2WcYP664rLBh8YhvFfTZMGexqBl4VPEYqY8OK4KdS0aOOmVxF/njM=@vger.kernel.org, AJvYcCWo43byuaxDA/99cF3Ioi5cEIL5hDpHgQKPYzIZ9I6vjsNbsylc5Mf0gWkeaandXsMIIqGAYjVZbz2+eHzS@vger.kernel.org, AJvYcCXsmBTq0EYkLfijGfYZu+7v6urAN2dPFmP3LF7XfNkEpBP83WBRn81IROGWGq+3XKAkFZnF+GmJVXj3aTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOJuB9vEt/vt1QVGROoMIc2I/RiT6qr3qHn5JcxddsdTk+w+N/
	NZv6cEPQkoSydr0f0GAqNHxxvRPF9HdSokhbru4fAyq7XFNhoZ3w
X-Gm-Gg: ASbGncuB93MV6i8k3J2vDtADOiEv2z9pd8iBfUz1ToCXVQczTIdTHvXi+8maH0Mn00E
	inZ38mlovPwTHNXWWgewv6SNiQR7T+UFIYvGarI4W1XuAa2OKx8JeUPxOdUxKslMC+CAg7Cz6OA
	Rv7TryufDIgpBS6TQmYRSgAdlUPkBObt6pMNtIK+OswtKY8KVoha/VEg9diciPtNNsXhYLYIlkP
	7DRYoQj9aoFBU8Ds9/+t7WIYJX6pvs1/GUXNA8appIYQJD1DRTUzMQ1AeXxYctAL+yuQkAZG83V
	QCBLzkltxVdLpnHqKhPbRzZuK6cdcPTz2BwOuBawABNyAcQ9QReHUVHIcQ==
X-Google-Smtp-Source: AGHT+IGlnf3zeYcKfw6UHFzFMOBrY9gNCtvaCQ4A3tiD1q4/beEfrfwhp2DF03Do2Fta+a8Paidiyg==
X-Received: by 2002:a05:600c:470a:b0:439:a139:7a19 with SMTP id 5b1f17b1804b1-439aebb3155mr125686995e9.23.1740470162856;
        Mon, 24 Feb 2025 23:56:02 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-37-50.cust.vodafone.cz. [46.135.37.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02f2475sm130299475e9.20.2025.02.24.23.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 23:56:02 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 25 Feb 2025 08:55:48 +0100
Subject: [PATCH v2 2/7] arm64: dts: rockchip: Add nodes for NPU and its MMU
 to rk3588s
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-6-10-rocket-v2-2-d4dbcfafc141@tomeuvizoso.net>
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
In-Reply-To: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
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

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 76 +++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 8cfa30837ce72581d0b513a8274ab0177eb5ae15..2680ed854e0c2ba5de167740ef18fcee167016fe 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1125,6 +1125,82 @@ power-domain@RK3588_PD_SDMMC {
 		};
 	};
 
+	rknn_core_top: npu-core@fdab0000 {
+		compatible = "rockchip,rk3588-rknn-core-top", "rockchip,rknn-core-top";
+		reg = <0x0 0xfdab0000 0x0 0x9000>;
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
+		reg = <0x0 0xfdac0000 0x0 0x9000>;
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
+		reg = <0x0 0xfdad0000 0x0 0x9000>;
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
2.48.1


