Return-Path: <linux-media+bounces-45266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A346ABFCABB
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 16:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 27A9435815F
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 14:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 727F834DCEE;
	Wed, 22 Oct 2025 14:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fK0ObCXn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B13534C14D
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 14:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761144584; cv=none; b=rYAV/bwc0SvuT3svAda/BG3iGmj4uFKqSBpYEWK7f0FLI6+yb5J230RT8wIWvW/LjTqY9Fwt6GHG4XN0jR+nt/QyyLYN2gLJwUHNCF+jrICAye7lfLo/CYyes1r1KMsFKbygrYNAjXdHu7TbMyunBga6QBusp9XQ/euqO/w06MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761144584; c=relaxed/simple;
	bh=DxarD8TnJr61kRFsvLf+3W5F4BVamSRc5LKPNeE+jqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KTk0Qye76K37L5oG9CL1R4i2avj65p3+SklPzywxoPv6cmdCx4jwaM/sds2llpjmDKI+02qJoAYaNm9i1qB4vLaE0srn2ccxL65mGvKppQbAwKJU8o4YCk6tRRRLbxPZxxy16QL7L/isuHaRzSiQ4pun4FBq+2QCHSKt85g+YLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fK0ObCXn; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-471191ac79dso60646885e9.3
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 07:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761144580; x=1761749380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYj7EXPz+vvQTqjjNn2xCYOEsNBPpMyP80swSO3NtRk=;
        b=fK0ObCXnz2k7dYMybMNXtOSlZu92WXN+oD7cV5uDLJP/WkSTPN679x5VLJW8f5TaI+
         AtnPoUehgnIGRlzaHH90td2gT21uMNCUU3a1sfinbWWnhOyJgz5ZSi+GvwlnCSTBu7dP
         DYwAV8URbXL3LPxrgpRu2yvm+2gju86C5JAim2XyMRn9UdWRy1Po32186GGSGRG21B+V
         TG63SFE7WvP7o+Y5aTPcavxJ6IZaa+NTdCysyF9hgFkpfK7e4ejU34XjVGEkaq0ajFIk
         xHYxehZi2lXX7xDtEzR7XXgoWdoqZCyoUzD09o73o+2SkKr6vyrAB3EVVuNSpEjx3Lsf
         ZZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761144580; x=1761749380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYj7EXPz+vvQTqjjNn2xCYOEsNBPpMyP80swSO3NtRk=;
        b=tGYUV6wHeW60Lky0yZttDc5dxiON7RCDDGnx2M2LTj7rrCS/kTBQS7iwmZVvmEIBsx
         DcNZtfe0sTim76NTiJ7C7sB69QEU7qgME0O0mnZjbDVijxbMiYlg6PU/rHiBZi/Xn71E
         Vi8I9WGVgQh036SOKaD4WaPnN7hMc0D6D2gd1NzrAqHCV+Wx68GcKukVF4GdV+wSmVE+
         ScSIDQWXCfH2o4AwWlFDSBzxT3aA5GtnLwQ1Nabg8DADRtkYozNFXlmvIG39d70vG/DS
         4iNnvImTbe+WONW6IlwKy4ChYJKGPJswCdfMBkDKRHV7soAlyzKdscLaMBiPG2kFxquq
         vkRw==
X-Forwarded-Encrypted: i=1; AJvYcCWQdSc0XC2u/KkGiHyhR/LVbgMo007nVHoyGIKgHXZ6O+wTObpxTT9gPqGn1uKDxgxypDwqC+8LN93OJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhql80Yz25Blvc+CFI1Q6ZNoNzg47n8bFg7v7xAqxFLwoLXyCh
	LZ9WTq4SY0ftw0Rlc57bW9zSNahdHCUY9UIqav3x3foWbg62ySxzm0/s
X-Gm-Gg: ASbGncuKbzMbDJhF34Rr/OB/mKRSxNC8/gZvqqx5pvr2JE9xHMLko24ezSsVpm17gu7
	n6oKGNaMue0+YYrvmrHRvVmMxQnSRDrFzTfbE5PdnOioQY2KIv3U2xr4LVmNIPtsAmLnC7vQ2BA
	+H+SkK76qBKacsfm3TvtJkQ1alGywTQDdLkwChLzRis1Mx3yPa2kcboPPrt5gwzbEpQW0dUM8ae
	26jtCEjUzdQE77av4Lj7RlmJAaklU4LkGebcCqc83Rs7fGHv6XxgqfDyhnOYCflg/XYryb2pKbh
	/Aog3GC36yP3Js8yAj8yPz/2Hu5O9IiMhh4mWeIshl4C76i/HIL6FotJhtVm44Lpyhd26pYcJ8U
	mz448LnoKgLJTyOM8UWB5sqDlWKg22P/kfKP4igISv+0jR3REOK7sq3VdPRVtoyN+0Ko=
X-Google-Smtp-Source: AGHT+IFQPTCWm/+rvvBIUt0UXHZaN56MajrHW+8ZDd5b9VAy+C4orsub3LKR2q3U+XbF/HSoJxwJiw==
X-Received: by 2002:a05:600c:3488:b0:46c:d476:52f3 with SMTP id 5b1f17b1804b1-47117907a6bmr159176745e9.26.1761144580197;
        Wed, 22 Oct 2025 07:49:40 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm49956525e9.3.2025.10.22.07.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:49:39 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
	linux-staging@lists.linux.dev
Subject: [PATCH v5 22/23] ARM: tegra: add CSI nodes for Tegra20 and Tegra30
Date: Wed, 22 Oct 2025 17:49:29 +0300
Message-ID: <20251022144930.73272-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022144930.73272-1-clamor95@gmail.com>
References: <20251022144930.73272-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CSI node to Tegra20 and Tegra30 device trees.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
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


