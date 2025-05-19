Return-Path: <linux-media+bounces-32793-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8B2ABBFA4
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 15:47:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E41E4A1D07
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 13:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584E12820D5;
	Mon, 19 May 2025 13:44:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3EF280A3B;
	Mon, 19 May 2025 13:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747662259; cv=none; b=eHOQy2yM+IhiKyOdLFb+wH2S9BdYtvD9Pkv7xfD9WcOJuG+pEfghe0blk5vgV3Rvu+CZ5WqYDPCBmh5jlSxlBgse/EwqO+IGbvqAXrFz3Mc6855b2xIaILrJms7LXPS9OMBhC23I8fXGGDTUBWnVXQjxV339eEd635RWieuYVjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747662259; c=relaxed/simple;
	bh=qcLANFQYB6F1aTadtJclYNPeTflXqceuvsxjG9tl5Gg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A2zSdJORS95riE+JE0mPhuSp2fn3gfS0odNDAC2DGbB8jz/2838F0bzkme+VC3jvaJWbgyGXiC2vaIk9hJeV89EgoCIy9MspNEoDwqowrJbREIqVXStNatj8E+9TkuFPD2uf4uOW9724iAH70szcLPKI7I4zPHLf/FeOo1c3vmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so34970875e9.1;
        Mon, 19 May 2025 06:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747662255; x=1748267055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=anhtEfC+aYWJeJvUly60jdWH8rm+sVcW8pcF9vb2eMk=;
        b=JiRQnIT89gp3qQKVDS/XQW8/dezcgrQXukPDjnDpP/9lA7OI2ZoENbpkB5x9xeERHC
         HjdtBHoeRxaMnQFoOTjbqM0Z4sp5NudtzcP/0/wsPiU85XwLhFEd6aHzPWsaWfF+tehB
         ucgHkWRiQxWVUG+Bob1yyJaNOCeroPvFVyekX6NtFAkZZV7tRudHnz3m/LjOKl8bUXF0
         /guxoWrYBlCWDyROTOrueYHtd/1KUyhyxP6EeBe6LEFMh7s47y96MO8utKOzA/8Rf8cQ
         7Ydm40TDXC/AlNtYQB8yk0e46mT+ujBEZGhwBjaIs7kqi0eBEWptiaHx2rjm7U8fZxjh
         eFcA==
X-Forwarded-Encrypted: i=1; AJvYcCUpaepuvQexXnndCBUNShopKAmnMKSmeSXncMExdwvm7vsq00B3v+OUhuu84Rktml4RShjBAildYcGt42ON@vger.kernel.org, AJvYcCVHwOgc6kTO3BKktEaVWsud508huNuhpnNZRJB2/gnlltEXE/3cSBfPjHeGebZI8ICfcK1evhP2Ury5m+E=@vger.kernel.org, AJvYcCXhHZ+BZAyw66AEh3+NM7PQkiYjqp+XlO/6n1+JyFCmhMQxyN7XeT//+wOSW3I/RhMFYUnkdnxdM0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI6BISDbp7zIRG4D9LeyzHHLmXKFLAwyedC/HLYkRrU3vmIHkC
	6xlYaf0hRpJ5jugtxAyFhDwJYjFjNLR5dyvqZAAxj8KcXJfTCAJ50slq
X-Gm-Gg: ASbGncswP9RmnLumsaGQQx2xviokPlLFHz6gpTh9q73C4RgfvG6TEEBR5pBqeT+pGMF
	rhv3GQu+1zzxpnQL6LUW1joDF66U5Niho0WKiLK28eqFbGvq6P1fhWosNHuhBmUxbO/2oeKPiua
	XY1Ar0neQoC+cf7xRe+1xl/p3SPdwiGl1FN9hHEDYObYTOOWxd+fht6MxCd/zBB+v/gfBcCzkWz
	MEMap5wi30crncCkCp0VTYrYh1sGRa4WEyVwEPVsNowp/ZiTWojjqIw5TORWjvcrXzPJBStbnao
	Og5qjj1IIKSoc8dECSak9g4UYScDOuaTRpBXum+zIkrsN8Rkk1MzxXEPr8EgSwMXMiBlGd7NWYe
	/A5tmZ2+y8A==
X-Google-Smtp-Source: AGHT+IEWSM8pwbQ+eewtaNC0pityD3poeCoFUie9piHQXV3RLcUMbKhDhTRCudb5lKuMqUm4AA1Amw==
X-Received: by 2002:a05:600c:529b:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-442fd5a347emr129006045e9.0.1747662255196;
        Mon, 19 May 2025 06:44:15 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f8ab839esm171263005e9.17.2025.05.19.06.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 06:44:14 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 19 May 2025 15:43:42 +0200
Subject: [PATCH v4 10/10] arm64: dts: rockchip: enable NPU on ROCK 5B
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-6-10-rocket-v4-10-d6dff6b4c0ae@tomeuvizoso.net>
References: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
In-Reply-To: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The NPU on the ROCK5B uses the same regulator for both the sram-supply
and the npu's supply. Add this regulator, and enable all the NPU bits.
Also add the regulator as a domain-supply to the pd_npu power domain.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts | 56 +++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
index d22068475c5dc6cb885f878f3f527a66edf1ba70..49500f7cbcb14af4919a6c1997e9e53a01d84973 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -316,6 +316,28 @@ regulator-state-mem {
 	};
 };
 
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1m2_xfer>;
+	status = "okay";
+
+	vdd_npu_s0: regulator@42 {
+		compatible = "rockchip,rk8602";
+		reg = <0x42>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_npu_s0";
+		regulator-boot-on;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <950000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
 &i2c6 {
 	status = "okay";
 
@@ -440,6 +462,10 @@ &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	hdmirx {
 		hdmirx_hpd: hdmirx-5v-detection {
@@ -500,6 +526,36 @@ &pwm1 {
 	status = "okay";
 };
 
+&rknn_core_top {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_core_2 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_top {
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
+&rknn_mmu_2 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&avcc_1v8_s0>;
 	status = "okay";

-- 
2.49.0


