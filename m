Return-Path: <linux-media+bounces-43196-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BE1BA05CE
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 17:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E9456219BE
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 15:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC203191AB;
	Thu, 25 Sep 2025 15:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HS+8Us55"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DD0313E16
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 15:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813474; cv=none; b=VBCiYnq8bSfCPpMtBWtJSyU+VrY+bO6ZBDZ1LeNRNkp/tfaUs3hcYaCMvkHZd7swqWdJNWQwhc8guS+1IbCpajR7+840fRpiXpasl5DfXzvEUIpRDreWInzsxRDVsuwetdtcygyP4POnymMNBPBHBd0wPYunU5tzq5xsizPFFhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813474; c=relaxed/simple;
	bh=iiHfTmqTpfmKU38rkhczSgtC8/xhyV+ts8JmJCC3QqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u8bUmFGTyCfy+7Kqh1dmcs1d3jKqmE9jCm+4tXgkmm/WJtm3PzxJLBOH4KJizZ+oFZxremm+kixrDwLjH1aOiv/e9rfsc699j/Fo8QO5vuZHQUmkyfeReU95c0kdoAdZoXBGo/laDyUMBiqcSXzGaDRkPzr89So906ApZ6TNrOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HS+8Us55; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57a604fecb4so1344426e87.1
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 08:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813468; x=1759418268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihAxrvGeeqbDGS2s2nWoaKnfeN+9tvG68aYZNvqbzNU=;
        b=HS+8Us55YUrl1SpKCLgXLcg4nv83bV1Un1pNSEJd5981Ifvski/CNWikYAHWDua7WM
         XA60yIae3ORvMM3xXL+SI07nmqt/RO/jKWZZ8RRhXRRu3qrXEVvnSWiiuOyV8jTeX86z
         84CHMk/EIQNupoaklXuqxkw+dpmxhKjMDARl0Y9zItX1Ib4FgbD2X+OrejzrPbrVXxQn
         Xgdy81l0UcdpQNBwFyCepB2F0EoLfcZYGaePYdMLkQA46bYX9KxSxdG54hQrKcy0Sz55
         oBooCuHg4bcjkYXjEQrenkg+me11NLw0FNc4Fw1qoDdoA6a4UG+20vxxhWn1rhSHvnmC
         4LTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813468; x=1759418268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihAxrvGeeqbDGS2s2nWoaKnfeN+9tvG68aYZNvqbzNU=;
        b=JpDkKJW4/z1fWkI3tJgtQkt9A4o0eMPQeFjrU++miHwfo6dyV3vOwjav9qe+JBq5qz
         mNG5F6dzn2gZoVzaGGHKKEmX+yH/mHdibQqTb36ynlHgmxTfb5hJij3R1sEDFKESewLf
         3+9ba86lzxMiBdORFch3mrZV7MA2xcZ22e0Ys3AIC0CIUhyLqCfrT3Cpwbl+vEl3kVOv
         M7np2yQ3hVhP98nwcYeNx84YtGLnAwyDUHBeXQRPUaIehfX8uvPvz9CnA9UtMh6PWn13
         nyFZ7PfhGIRshx+8u36Bg/s5b5VTduNTrb5KkitVRGk0Z3xl4txKaF3CWpUOTvoaUmky
         ih5w==
X-Forwarded-Encrypted: i=1; AJvYcCWYnlVrIJXn+tfiJqN0A2xieziWJpUv9eVRzuvpaOqdjblw87dwisuwhbLC2NxaP3GlL9nAoFyAbENMNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6OAPnIRnibZLvSMl54ZFMtV2Y/6WK3seLWRHmtI0D9+szO3Yp
	6o0X4wQj4OwRvRtaWGobuWlXtGAgLPXL/9KEyqy8UK4GiFHifemxP3Z4
X-Gm-Gg: ASbGncsOp2/XVVzKILTAQ7ehrk021wiggiQ8Yf4u4WwzDRvGNikQjJ3rqt0rW+KYwHx
	lwVAONIEZ3jYxtIkdnsRk/428t5yPj9tnE5e6DzXTtMNTaeEA3g9iqMC6O0CnA6xEM+IHPdYs9x
	gk4n4pZZQvGBelWGweEb3mbWmbH3NupOBM00Amt1oYuZJ7RvvZU5Oc0XGY9HqVGUIgvBMqY0wjh
	MeyrAIvKrhMmvmr7t8RzIkJ0FBZy/HyEI7A1ou5LxXbS+ZeTnEN5TSpFj1F9GPNMVEiGtYExLK5
	iZwdE9ROnj8L21KOBHhZC/9SKha1f15kaA/Qku5T0WN94c3mXKgtD4ZytU7wC22Vy+08sqf5xvL
	ZEagMJRj+BFFsVg==
X-Google-Smtp-Source: AGHT+IEgIvTgxxL5WIN2ZRYvGEcMitZUM+cSp6l2oZhWq93Lx+b6iM39RU57IOUk08HihxonasaaBg==
X-Received: by 2002:a05:6512:6193:b0:577:35c5:9a41 with SMTP id 2adb3069b0e04-582d3ba0826mr1107436e87.53.1758813468072;
        Thu, 25 Sep 2025 08:17:48 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:47 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 21/22] ARM: tegra: add CSI nodes for Tegra20 and Tegra30
Date: Thu, 25 Sep 2025 18:16:47 +0300
Message-ID: <20250925151648.79510-22-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
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
 arch/arm/boot/dts/nvidia/tegra20.dtsi | 19 ++++++++++++++++++-
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 24 ++++++++++++++++++++++--
 2 files changed, 40 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi b/arch/arm/boot/dts/nvidia/tegra20.dtsi
index 6ae07b316c8a..5cdbf1246cf8 100644
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
@@ -72,6 +72,23 @@ vi@54080000 {
 			power-domains = <&pd_venc>;
 			operating-points-v2 = <&vi_dvfs_opp_table>;
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi: csi@800 {
+				compatible = "nvidia,tegra20-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA20_CLK_CSI>;
+				power-domains = <&pd_venc>;
+				#nvidia,mipi-calibrate-cells = <1>;
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		epp@540c0000 {
diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index 20b3248d4d2f..be752a245a55 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -150,8 +150,8 @@ mpe@54040000 {
 		};
 
 		vi@54080000 {
-			compatible = "nvidia,tegra30-vi";
-			reg = <0x54080000 0x00040000>;
+			compatible = "nvidia,tegra30-vi", "nvidia,tegra20-vi";
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -162,6 +162,26 @@ vi@54080000 {
 			iommus = <&mc TEGRA_SWGROUP_VI>;
 
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi: csi@800 {
+				compatible = "nvidia,tegra30-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA30_CLK_CSI>,
+					 <&tegra_car TEGRA30_CLK_CSIA_PAD>,
+					 <&tegra_car TEGRA30_CLK_CSIB_PAD>;
+				clock-names = "csi", "csia-pad", "csib-pad";
+				power-domains = <&pd_venc>;
+				#nvidia,mipi-calibrate-cells = <1>;
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		epp@540c0000 {
-- 
2.48.1


