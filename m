Return-Path: <linux-media+bounces-49576-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9A3CDEA76
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 12:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBF51302B112
	for <lists+linux-media@lfdr.de>; Fri, 26 Dec 2025 11:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0CB831AF1A;
	Fri, 26 Dec 2025 11:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnwXz+Cp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5970131B80B
	for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 11:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766748720; cv=none; b=G5eyJmzGiVTlYnIep9gSJdeo+hSga4z1Ere58D2tKa0n23eoTleplB9r+i8d+kOYks/rDQQl3VSLj3ptNoo4x0r36erKMxJqG6KtvMqxCmq3CNvaBHdUTWeZr1QHo2lvrdXKm1+ANRDNDCg97dkr88P5tDSGbzRvJn7eMsWEJIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766748720; c=relaxed/simple;
	bh=o8WeHXECi8dmWIr+Makak47k2m+/uQv0NNmDSOOQ07w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CfCy4pZvY0/pQIKh3lC1Rzra8p/dlFeLvUiPI8c7Lrll3xLkHx1oR11+/yF28aPwkeTFUQQ+LcCofWZVa2Rcc8GJNZ9SWAvhdSwjO0PHRoTFd3oVlcbM8w1yx17n5FZcZo/cMpuK4lZb9bToztSH/2HL3R3zwm6mRXSYL5JDg6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnwXz+Cp; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-430f57cd471so3668042f8f.0
        for <linux-media@vger.kernel.org>; Fri, 26 Dec 2025 03:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766748717; x=1767353517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIMoNY3Aw98ZzAyD/ql7BezuP1iCnP+4r2HUN/Krfmg=;
        b=YnwXz+CpC6GcP//vWc3H9DzCjs5AbawausVuTpPnE4BVjIJf9dWrIW0vGFWIhe0FEB
         gMql43FjEHyveAcGaRCTGmJNvNFanuZ4dXWpCTGAQS6hJG/RiyJF4LJCReCobYiWMMwO
         BncRL4SEhKEaOVrrUwt7Enw3rvqSCM6tkWcnRKz97s1/BCiq4uc6lBjleU2KbCo88log
         cERi/uEjyuaGzceylgOYUmMGc66TYGjsll35+DUfSl3/hXkH8ZjX0L/GeeQ6u0W065vc
         Ewc1388Hq4AB77GLcyytGdM++zcMZ5f6FY8PMZacWivSRuaMARW9QjSKijMhOzCLz7Zi
         uImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766748717; x=1767353517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LIMoNY3Aw98ZzAyD/ql7BezuP1iCnP+4r2HUN/Krfmg=;
        b=wNo85eSs/mYDaFP2tm+zaCCC3oYroe2e48aT6W9C1sTXRHXQwIBdVA3LHEvr1lbFV2
         XtW/3YyDzgXwzhZXp9TBJhW3gEgSS2Cu7WhbQAW6TRrFLVrBgZd2ZCsLgKoBdYMx6KCi
         0xx6BLKipDubdBvUmlc8YRvQUSTGaaaIbchnimL+Z5sxQsrfYhw0DhqsWH0dCaA87o9G
         QTBdrnh4suqhoFdgXKh1tU5MSIWegvizvBUD5xpB3M3qWTfqA6DLaUIxLHEu+ZZfq4zO
         mHbuXTn677SMVN3t8T/5vv2EJ7lSkcvPCh53Dxm3pSROaGBK35gsm+AEv5x/13XNLleX
         9QAw==
X-Forwarded-Encrypted: i=1; AJvYcCUaLDrY9TeRl84LniNvcN90Ku9K9180ONuq6AodPVAxNk8dzrBSmgXd4pUX2jct2MQUt3vf1tK1buWKhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+gmxCEFDRDuy88d/BISQiOQdZf1Nd0ctVwxA1pIY7Kfud+78M
	Ft1jT39FRBYDnv4AE3OEksr94/Guc0DJlxrGeHc4k7gKpWOJ6yCqeXPR
X-Gm-Gg: AY/fxX59lJ6laiz9IMjWJLqln8i1QTPJymK0o6LuaEAi06G3uHudHw6WpBltzyYnMUN
	8D04qS7cqm3UWf3vf0ZSmlz+TjswjTXgaMP6EW4EBnkiyIVWyTDomP56o9lYFhMa5d6N4M0gqmi
	ZVnxPdaBe+ztA3tjl5Ii4vg/8r8Q4/5ZupGfheGfVYAa+Dk4HF5r/UkgIUY/c/fL31nPStSaO8j
	5c3hcnxfun0f0DR0+duKEZCCch3IB6Cf72F3yvGSFYUt3j2/dlIj9JgqxdIULhhP4RTJ3ElZxsn
	4eHUcuNPDlTrz0aq0PAmSU+t7ozJjoj2q/MwQFCBdTACUI4FltD5lJzGjeDhXs3ts6tvhL1WnVM
	Ui+DCMpAl69GUu39DO1NCh6EgNS2xUROJbz4qliKOGTfH/Tc3sUrawiU7sJAAIpzzr+6cq00HFt
	lwelMmnDrYJTkIi+s=
X-Google-Smtp-Source: AGHT+IFFOJzfU27KrqGH3nfRwzkjvpp/3lBr9q9F1dbqFSb0UGV9ka2fDQLSk0GuKEIBX51sO7Kfhw==
X-Received: by 2002:a05:6000:24c8:b0:431:808:2d58 with SMTP id ffacd0b85a97d-4324e50d219mr27294070f8f.51.1766748716486;
        Fri, 26 Dec 2025 03:31:56 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b1bdsm44182107f8f.8.2025.12.26.03.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 03:31:56 -0800 (PST)
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
Cc: Diederik de Haas <didi.debian@cknow.org>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: rockchip: Add the vdpu346 Video Decoders on RK356X
Date: Fri, 26 Dec 2025 11:31:40 +0000
Message-Id: <20251226113140.573759-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251226113140.573759-1-christianshewitt@gmail.com>
References: <20251226113140.573759-1-christianshewitt@gmail.com>
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

Suggested-by: Diederik de Haas <didi.debian@cknow.org>
Suggested-by: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index 8893b7b6cc9f..b37eea56c221 100644
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
2.34.1


