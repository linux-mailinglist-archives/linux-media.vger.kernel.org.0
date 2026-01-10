Return-Path: <linux-media+bounces-50336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A41EED0D004
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 06:38:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9263D3019B6A
	for <lists+linux-media@lfdr.de>; Sat, 10 Jan 2026 05:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA07D33B6FE;
	Sat, 10 Jan 2026 05:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQAaKIA7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAFA33F8B2
	for <linux-media@vger.kernel.org>; Sat, 10 Jan 2026 05:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768023466; cv=none; b=UY7R9uCbUZmvOfDkuWtm0rK9DCWs5OHaofz6YXwAHa+BZXP3dyBq9be3k7hDhtGk/yoX3mX+DiCh4p2fAXNZe1vxZatIedz4PUq04dt4tezLzyuA56YdBGkL5mMEaITyKuRiZrCAh554cYTbDpc0YpL8wusktxqJ9E7IFFv/TjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768023466; c=relaxed/simple;
	bh=aiQH21puKQPZom1FBS2CS8wFKMYZxOyOP1j3Sjj8KqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AeoGYxbbkTeCouZ1zd+y49rd/YCVPTFxqAUMwQMekjEzHvbAQXN66x2N9+m49yGXH7pTHiqjJcuZRzlcooryUYDVOO1ixoI4GVq7iYENg9ZIDYFYfMU76E3zONsOK9wBqfiQFt/JNw/v22OzWNfAkhK54Sd1MrcdCzryHNfRj8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQAaKIA7; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4327555464cso2837315f8f.1
        for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 21:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768023463; x=1768628263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBV1jttw9vA0jCOoGP99Ua6fivA5lzhlMS+1uYQ4YFE=;
        b=XQAaKIA75JzKzrthVP89Cqf5lUYtymozYmjUgktIN6oWhMG6LDtPcVKAtJesOzmZzd
         M1eE1JZF8Jcfzjwcl0DHx5khfKSOgJ8LxsKKTi7U6pJT5mAKBpwOMfWafpeZKnzLlS0o
         2Y0NeLU4dH/PZlF+NW5qR+P5SqhwCB9K0sxPAdsmquN08VNtA+X80Zd+joY3T9/cAmI9
         K/6K9Isxb2OhjY/EErvIOboTVZZUvxn6iH0hf2IicjBnCfQaoOyRlV0u3oARqW10AvOx
         s7AGi9RLbjC/9C+gKhiR383uK0GaJpuEsn+VbI5k5wG2t3DiyB0kNchxsBT7X5iXxOPW
         wbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768023463; x=1768628263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KBV1jttw9vA0jCOoGP99Ua6fivA5lzhlMS+1uYQ4YFE=;
        b=fxtn4wOSqgkNRifwRsCA2ZK6JZVq2Dsgz+84RPOcnOEexNo1aVsh5z2EfMnE/TWPz8
         WwxBV+Q3pIUt9WyL+4GIw9u9FxoS13N8pIbEXfKXQBE1MkovUhSLUkdmZJZqdJvQdGd8
         0KjMBbhjWQIiOpsLKgZpGl9MGAJzk/9HuKtilmbQd1FE/6Y78RentAJzCeh60thKj0tm
         vtMKajUlY4vxpF4KQH/uyKHAaEvbs8d8LtwGoy7PK9mOpK10Maw5FROWzDLRix5SVDxx
         KY/B5N3M4teS+AHzZCXCQWAt4pZo5/xtfGYVQaE195w6T6vxz+xewJ6xCm0ex4uCkI5S
         yqgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkSsCW0xC8qnsRudscRUyKUKAGWSy8ppZX7O64x5vrRCJZX0cYce/HGJUCsXXz631rw8Y25YtqTOJ3Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwesVsh80Q5sbFCMrNAl+TDChQK9bRhcUDyfLj4xesb+0+VK/1s
	5KL1EhV/0P5BE8WLBBJYvwNyPYmUZjMrB5R+EqItxCdag94XkQVOVi5N
X-Gm-Gg: AY/fxX4KhVR7hHxNGpAAQYYyPq0SQWVVR0ki8OVjz8FUdvZpcNhJK5p/mHdSK8jOaSi
	02bRxQrGDRriyQLEdq+lTZhZJGe1k8sCHRMMTHYlhGyGLLsRuFfoMBKUPMFGplyxi3IvEIGyXb9
	5+PNUPy+uY6gLCeOV1MIxbKSMkUKMrMLwcU2Hsfw5pkbUfFfEgh4PdK1of+aMOpTUmiP6FozglB
	IqUQjcO1/Juc7y6EK0BikMKID68jJCAKprtI1K1NFueMo2qsHyp8LvVUqD+trMffnxaqqN6IkGh
	4TwxJ/9yWjA4tHuOplwpyulP+2R2Z2OWgdY/mC4BQ4lokO4VikaPa8q5HuYPY6E15A1f4Lbgwe0
	s+YbzJUj9TYz/vi24gXoRS9qW0WCh3a8EsOT01xCr5Ci52fej2fvK/V9FKrSy3rpTr04vWukBcR
	D9fSjIq8h7F9oEa+c=
X-Google-Smtp-Source: AGHT+IFcfMPIrhWiXPkS98R5rwsX/ACoRCaVo+plXZiPZaElaqnswMgbw6+184Fm/K+bJwMBmWeKXg==
X-Received: by 2002:a05:6000:4287:b0:432:851d:35ef with SMTP id ffacd0b85a97d-432c37a3b62mr16501208f8f.42.1768023462952;
        Fri, 09 Jan 2026 21:37:42 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dadcfsm25973825f8f.3.2026.01.09.21.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:37:42 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	=?UTF-8?q?Olivier=20Cr=C3=AAte?= <olivier.crete@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH v3 3/3] arm64: dts: rockchip: Add the vdpu346 Video Decoders on RK356X
Date: Sat, 10 Jan 2026 05:37:27 +0000
Message-ID: <20260110053727.2295260-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260110053727.2295260-1-christianshewitt@gmail.com>
References: <20260110053727.2295260-1-christianshewitt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the vdpu346 Video Decoders to the rk356x-base devicetree to
enable support on RK3566 and RK3568 boards. Also add the needed
sram and vdec_mmu nodes.

Suggested-by: Diederik de Haas <diederik@cknow-tech.com>
Suggested-by: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index a2c4957a5899..11536684479b 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -383,6 +383,19 @@ usb2phy1_grf: syscon@fdca8000 {
 		reg = <0x0 0xfdca8000 0x0 0x8000>;
 	};
 
+	sram@fdcc0000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0xfdcc0000 0x0 0xb000>;
+		ranges = <0x0 0x0 0xfdcc0000 0xb000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		vdec_sram: rkvdec-sram@0 {
+			reg = <0x0 0xb000>;
+			pool;
+		};
+	};
+
 	pmucru: clock-controller@fdd00000 {
 		compatible = "rockchip,rk3568-pmucru";
 		reg = <0x0 0xfdd00000 0x0 0x1000>;
@@ -619,6 +632,42 @@ vepu_mmu: iommu@fdee0800 {
 		#iommu-cells = <0>;
 	};
 
+	vdec: video-codec@fdf80100 {
+		compatible = "rockchip,rk3568-vdec";
+		reg = <0x0 0xfdf80200 0x0 0x500>,
+		      <0x0 0xfdf80100 0x0 0x100>,
+		      <0x0 0xfdf80700 0x0 0x100>;
+		reg-names = "function", "link", "cache";
+		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_RKVDEC>, <&cru HCLK_RKVDEC>,
+			 <&cru CLK_RKVDEC_CA>, <&cru CLK_RKVDEC_CORE>,
+			 <&cru CLK_RKVDEC_HEVC_CA>;
+		clock-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
+		assigned-clocks = <&cru ACLK_RKVDEC>,
+				  <&cru CLK_RKVDEC_CORE>,
+				  <&cru CLK_RKVDEC_CA>,
+				  <&cru CLK_RKVDEC_HEVC_CA>;
+		assigned-clock-rates = <297000000>, <297000000>,
+				       <297000000>, <600000000>;
+		iommus = <&vdec_mmu>;
+		power-domains = <&power RK3568_PD_RKVDEC>;
+		resets = <&cru SRST_A_RKVDEC>, <&cru SRST_H_RKVDEC>,
+			 <&cru SRST_RKVDEC_CA>, <&cru SRST_RKVDEC_CORE>,
+			 <&cru SRST_RKVDEC_HEVC_CA>;
+		reset-names = "axi", "ahb", "cabac", "core", "hevc_cabac";
+		sram = <&vdec_sram>;
+	};
+
+	vdec_mmu: iommu@fdf80800 {
+		compatible = "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdf80800 0x0 0x40>, <0x0 0xfdf80840 0x0 0x40>;
+		interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_RKVDEC>, <&cru HCLK_RKVDEC>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3568_PD_RKVDEC>;
+		#iommu-cells = <0>;
+	};
+
 	vicap: video-capture@fdfe0000 {
 		compatible = "rockchip,rk3568-vicap";
 		reg = <0x0 0xfdfe0000 0x0 0x200>;
-- 
2.43.0


