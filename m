Return-Path: <linux-media+bounces-40275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1137B2C36E
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4953F16BD3F
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223442C11CC;
	Tue, 19 Aug 2025 12:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2eCfClK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0560350858;
	Tue, 19 Aug 2025 12:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605836; cv=none; b=cRXtaMIJ4KmMsTCJyMHKPWmmxfoT8C+T8JHSXAN7dxc2pzIquOwbRpDXPqa/ONC2IDwDfw0ugVmI57hTYTnaEhQeJyBizQZIYrD7KLSQdQVCLF0S3sIy98k12NIwsYETW2htesC8ay4VDgDiV2+C/2dYbG6vpo6uasm3jpWSJlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605836; c=relaxed/simple;
	bh=KaBfRdSVp1n4M7D9JKIPTPYpipa5lq4m/RS9a3/MFYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d6JtUldRHM+rYtKvkbJBBJbu4GF+TknUz9s/lbRVpfjif+0CsOg0C7vrk/bUig3iHldaICMV8nFW5t1+9jh/Z0AGlZ3fPxH4eXtJ+PG9CYy6JKpO99cOr7g3YZ/+Zyv8r5CebE//tCw5Csizs0Bec3Z4j+SzQ6TpAMkvShvmjCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2eCfClK; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb78e70c5so812801266b.1;
        Tue, 19 Aug 2025 05:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605833; x=1756210633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpAJrdDioA3K7/+UDEGCcZqVfZOD6D2E3R2fJlZANzE=;
        b=Z2eCfClK8/SsnUAIwxd88ikLgDvPAf/7h6R6SWyG8U92h0wHEKDHJd+yqpHpTSjxmu
         /QuXtj3vAsjbZf0X6ivhy4MRVMMP08ErUQA/lBoyrYOBwBrNFUNH0mwpgSeXv+qOA6b5
         WAmYiDjPlvTrMwr8mExk2wU/InI9R3zz28UJEXYxR71OVWU5lDgxqW/xXXwNfIYYDpF5
         VIFfjuYnlrqITtqbXRpFEX9vmc0nUuul/FVV4U/b7s/Yenoia2V9zJGUhk37cYwCUKqt
         YgSghuM6fPgVsiS+CfOJM6E8FRm/rq7s0cQgZIWJyfkyM2FAvSjmAXEWKj91HtK561Bp
         LKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605833; x=1756210633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WpAJrdDioA3K7/+UDEGCcZqVfZOD6D2E3R2fJlZANzE=;
        b=n2j7FMZigUDoGioHsoIH8FuzKeN+wqTmEEjqrA2t4zFdU1p6EwoZ69sRJCBHmo9C6y
         FhUDtUB11iIhaUv3nD0PdjGJCuBUN9opRcRJmQHs1mzjpwqw2S7Fd2RtWpGn13HeaCbo
         55cdPmkAubqX8W+KwkmYyx4riaarfqlg/R9oSe6zcrtyUYyO7HdgZROrJyfxzxYL/S1o
         09XkqmmSaRPqlwYsQ5RnNriHZLZV9LkJMKE70KjBleO2ISlf0H6YsxElx4UwDGUOyE/W
         9t9PDLbekn/pN+oA7YJjaex/FeHJAIT0jLgPNKmCF1D0oQnFjRGKxPeCjqz620uvRJ8c
         vKDg==
X-Forwarded-Encrypted: i=1; AJvYcCUr1cMnhI8goWqQ10yhm1b1FVm9ak/mNXzcuIqYnELF4ZWIVeH2YeuFeg2TrOkRbZHLSUj/ZzVm4OnAZZY=@vger.kernel.org, AJvYcCW62LTVDxlXFbTVIwH/SyYMW2slba3Pe/Zhe2ew4lFEM8Dl0knxqCMQzc5gkpY21pMBQzGz4EQzJy9rrbzL@vger.kernel.org, AJvYcCWJ2Ts77YOS64eSyZX0jy0+9eNWkW5sAyxTgcM+hbNxrTQa4gxRiEarB6RcBuZJf3coak1tdJQGDfmM@vger.kernel.org, AJvYcCWUTZX3+Prg79HC3Bn+KlaIKwAY1fFVYr29ivShxXJmk/02yq5BRNSwXxIdd0jZbq9wCx7BKLmm8FF1@vger.kernel.org
X-Gm-Message-State: AOJu0YzSYxARanlUjiHdbg6MCtw1TH/3IxTPzs3QnM+erm/1BrJE0KkJ
	t2bXW8UwnBTM1GPnBTmOouQ8waRaowzbqgRo3d072Kw/QXV0jRF6RWQX
X-Gm-Gg: ASbGncvLls8t/vs4TUjNdjWPhY9E4MOH768FP4Uc+2xwzrkn+8eoFVyLPrUCPzQ2ZA9
	5kq3COmVg7EizGiurZFXqr+3Z2UHVL+UYLGPmY2SqPPzMWVJpg8XgFmvKwi0/64vCHtM2DWBRBT
	fIq4ptG5ZI8QCHkaca+ZQVt1J6gRinXQ/evr2A/sJUi1TCVlyum1sx/mOwXlWKavc3LUMt79Ukn
	TFTd7pKuYJk39FXQp1OqNhqb24YTTIaOJJxlQl59/yD148dbWfvIaH3fFHwQaYfOAskxk8gn3QA
	uZ3apKIygdSH7sxSTeIIdRW2h4QWn9f0TDxzm1//xWoOKse4UxMbwMS39RJvlnWXR8dtYrPz1lJ
	rQOosQ2sHxqoOYtP11IoLUs45
X-Google-Smtp-Source: AGHT+IHvM5DccqskpaOVZxNfX6lgCDdNfDK3EqRTSS9p/z8kmF7PIsdXdNlSir76MBljF1I98Xhy5g==
X-Received: by 2002:a17:907:7f0e:b0:af4:12f6:420 with SMTP id a640c23a62f3a-afddcb4db40mr234210466b.13.1755605833042;
        Tue, 19 Aug 2025 05:17:13 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:17:12 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 18/19] ARM: tegra: add CSI binding for Tegra20 and Tegra30
Date: Tue, 19 Aug 2025 15:16:30 +0300
Message-ID: <20250819121631.84280-19-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CSI node to Tegra20 and Tegra30 device trees.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra20.dtsi | 17 ++++++++++++++++-
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 19 ++++++++++++++++++-
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi b/arch/arm/boot/dts/nvidia/tegra20.dtsi
index 606839fd40bb..d00786368115 100644
--- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
@@ -64,7 +64,7 @@ mpe@54040000 {
 
 		vi@54080000 {
 			compatible = "nvidia,tegra20-vi";
-			reg = <0x54080000 0x00040000>;
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA20_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -72,6 +72,21 @@ vi@54080000 {
 			power-domains = <&pd_venc>;
 			operating-points-v2 = <&vi_dvfs_opp_table>;
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi@800 {
+				compatible = "nvidia,tegra20-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA20_CLK_CSI>;
+				clock-names = "csi";
+				power-domains = <&pd_venc>;
+
+				status = "disabled";
+			};
 		};
 
 		/* DSI MIPI calibration logic is a part of VI/CSI */
diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index d9223bd7cf3b..c3e9212d5edf 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -151,7 +151,7 @@ mpe@54040000 {
 
 		vi@54080000 {
 			compatible = "nvidia,tegra30-vi";
-			reg = <0x54080000 0x00040000>;
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -162,6 +162,23 @@ vi@54080000 {
 			iommus = <&mc TEGRA_SWGROUP_VI>;
 
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi@800 {
+				compatible = "nvidia,tegra30-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA30_CLK_CSI>,
+					 <&tegra_car TEGRA30_CLK_CSIA_PAD>,
+					 <&tegra_car TEGRA30_CLK_CSIB_PAD>;
+				clock-names = "csi", "csia_pad", "csib_pad";
+				power-domains = <&pd_venc>;
+
+				status = "disabled";
+			};
 		};
 
 		/* DSI MIPI calibration logic is a part of VI/CSI */
-- 
2.48.1


