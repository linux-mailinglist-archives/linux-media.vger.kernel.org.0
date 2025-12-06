Return-Path: <linux-media+bounces-48351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA94CAA2D2
	for <lists+linux-media@lfdr.de>; Sat, 06 Dec 2025 09:28:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A5A9301513A
	for <lists+linux-media@lfdr.de>; Sat,  6 Dec 2025 08:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531D72DCBFA;
	Sat,  6 Dec 2025 08:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0fgrzCh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC39281376
	for <linux-media@vger.kernel.org>; Sat,  6 Dec 2025 08:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765009710; cv=none; b=Yv8yhsVTjIV+Fsfe7Y7Dxh4j723VAT4AWOvxAKU7JGFzDMUL9vJ/3Gs3fpj3Qko85Hr/6KrUe6tyVYJM0IGRlp3fXXmdQmHbgaC9aVwLSmHvFCbrfTKvge5iy4aCYlrAMhVOsvqKmTGKtDOe2alP/29689cbEtlhBlJ99I3pFrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765009710; c=relaxed/simple;
	bh=jbPQQXxbTlq8NK0YN2JEkDKUTfuPh1hTpIy/tr0wqqI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pFE1N3mRiicB4XECcQOG/2h0LT3v6n+bxNrDKxK91wHIk4OCeNokSpJc0jXsoE0uesE8P06KDOYTuz+8t0GkuGUzdsdXr2u6oTQPqkt3k9hUgwbMJ/4jTsAqaYADGNbvGqCLHeJS0Ajd6xDs5B220eu/duN+IPzSH7fPq57Va2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0fgrzCh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso36725985e9.0
        for <linux-media@vger.kernel.org>; Sat, 06 Dec 2025 00:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765009707; x=1765614507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybnktA7yiPw4tJvX7FdmF5g8bI2fRM90QpenRWrGzHw=;
        b=d0fgrzChz1rDKzisGaiQR1BvEpjQ5WGEaUTMkfP6BnwU1Xi/L3se4SYaJjRzSOpFGz
         I1mkiFVOqvG5LYaJAofCOPt5t40B/3P2H2MiaywS8gBotTOJ6jDowN5i0P2WEYdvyE8D
         jbI3qxQ6sySXSDtfI/2200Wkf1Poq+hAfFfKlzOuhbpUNeuzXPECT0c8RVlZzkP1VGsU
         4zM+yLvoMANTh5wgp94p1UPIwD5msPq25F6y2L8CSN+2OujDj2oLEJamThcKbgeGS4M+
         jgBHRTaTaWgK6IO1ZBPd4gNog5Tz+XHcwpghFm7cR+Ad9nmEHg7OxSHWW4iTzW4ROlfR
         AJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765009707; x=1765614507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ybnktA7yiPw4tJvX7FdmF5g8bI2fRM90QpenRWrGzHw=;
        b=DhG9z4kPEj+RbZyumrepyB5Ci3MXjJU/ZWJlSv+yY4M2tmW3zLFeYnFmKL1ixb0F2B
         shAlltdkZqENFV7C1tI4UZocnXOCnQqVgPWOJP0mXAyzlEtdOmMGctDbogQRupBJkQ6I
         cPSiN1TqwIbnHVh4A0fGDjFH7LiDdZeM6sJNKdGYDuIv+AYMehd0Go2a37xfjb5FLsPa
         syWdjnTL5f8hKA29j/He2UXaxIYWkM0f+kiufr38QAupG5upRJneSeznTBk5zB82ToGh
         HewsfEdh7nwUNyJYkEObgXXJXcDAy+WOz9p1jCbys1Jf3djuqHwXhqmk+pZ6QpnPbw16
         M79w==
X-Forwarded-Encrypted: i=1; AJvYcCVsyY8DB18PjW+qbaecUKLI3ILh4zfD7FSK2MaVt+TucCfgAyaQEOTZO4IRrZJIORKtTdse5ELJQMpy2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV8dux4D4J2/8PC177mkwb2gpEZaPM8E1JW8PvPrfSdlMVg46N
	4IlcMDJJwjkHQjhoKDLuhroExQZflnlqkTxaSoFPUzBZzzCHPBUo72WV
X-Gm-Gg: ASbGnctPteO5zPdGUmrjGwHjHVmHnMTWDXy5uOlG29DMtb9weekifNmG98md0/dcfa8
	DSHFw3pH+JrQrVpONpD8ZjuxkV2U2PyNVC1jGJnyy6tBvJcHyxGETbGkHe0B9cB1ciQuuiNHLhF
	9o0l7AckrtkbeRk3HShn9WEv+OIEUaXFZQG8MMU+MKgqI8kjibZUXNe3dr5jCAAJI8KcN3IOoy8
	x36nbZE9MZl2TsItEZu3GEAi5aeh2v/mnd4xv+O7WkkPnLui06oNur2Yf8XrBKAfVWQcQixZJAh
	lnhncJP1cKoJkMNMGfhkKrBAQguEUYbGb6kJNVFVIRNZ8u6J9m/G6lWk9RA6D6oilMka16DnvpE
	ChML0kLcOz9o50V3t2vamQYmqUHe7/7N2Ck0vYdHZocPOvY2Cx+ENPFc6YC9W5jxEjlYl/9KLz5
	/qrlme8Cac0WPL/vzF0zCtg7ebug==
X-Google-Smtp-Source: AGHT+IF4fUERXjr9/GquO8BnCSUOnAm5kGVyznTwFVQh3KUd4dX0Gabps7xFnP/iqOvdByNlLK3i7g==
X-Received: by 2002:a05:600c:3f12:b0:477:c478:46d7 with SMTP id 5b1f17b1804b1-47939e23802mr18875825e9.22.1765009707151;
        Sat, 06 Dec 2025 00:28:27 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310a6d9dsm123094705e9.2.2025.12.06.00.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 00:28:26 -0800 (PST)
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
Subject: [PATCH 4/4] arm64: dts: rockchip: Add the vdpu346 Video Decoders on RK356X
Date: Sat,  6 Dec 2025 08:28:09 +0000
Message-Id: <20251206082809.2040679-5-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251206082809.2040679-1-christianshewitt@gmail.com>
References: <20251206082809.2040679-1-christianshewitt@gmail.com>
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
index c005135089d4..c51179e13657 100644
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
 	sdmmc2: mmc@fe000000 {
 		compatible = "rockchip,rk3568-dw-mshc", "rockchip,rk3288-dw-mshc";
 		reg = <0x0 0xfe000000 0x0 0x4000>;
-- 
2.34.1


