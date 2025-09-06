Return-Path: <linux-media+bounces-41908-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC5AB46FCF
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 16:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 446C11BC0406
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 14:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5901305E1D;
	Sat,  6 Sep 2025 13:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJlSEPuW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1694830594D;
	Sat,  6 Sep 2025 13:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166880; cv=none; b=OnVqoInQhWCl//kPFweUFK8HkDp6194cmKKCCvLgn3ONCD3eQ4m7CU1u8qLsMMDUIaeiCXdQVCmTKoJ7nt04a77JYGBbzM6DW17tmJRRG/2cjPSjvp+ixIt+Pnkv/gmIWQnhnOBOeUj9PpQmEB8gQYoCCvmijN/TLk44nHHh5sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166880; c=relaxed/simple;
	bh=iiHfTmqTpfmKU38rkhczSgtC8/xhyV+ts8JmJCC3QqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oOUvXqqaPb97Lhj/8zR7O72VNyhAhwXwJzSC+84kn8xEBBDXTUuMH9GiSr/1DAwRg9b8BvMlKcMT851G1+RtdNUC6chHnTn1LizUxHpNN4WXFZ/F+z6Gk7nINWL9TtWb6uHOoScpzh63+g2OmyMb2m6q0DHaFwtSFnjz60CKWrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJlSEPuW; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55f6b0049fbso3421884e87.0;
        Sat, 06 Sep 2025 06:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166877; x=1757771677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihAxrvGeeqbDGS2s2nWoaKnfeN+9tvG68aYZNvqbzNU=;
        b=BJlSEPuWCa/3SPcmo1UKcJtHVqoTthEXXbWri5aeUXc+FYtIQdb6EkD07+nA8eIMw0
         cJdyffGMt/DOexLUh+NfbVAMUMhfIixXO5CT7ItQnPs58M8OD0e0EOHn+uJqtBmbdmOX
         zNArHqn9U8Q+OiBlYhuRyBsMHJwwOl7opCqBwEntAMXcmrsdv7PtyKgTDyIgisLEhiDc
         ekatTAIb6yT6rRZl+esMya4aBkU0E3dckPq2t7a1yGxzUByMcdLzBghMJRfPeEt0WFmd
         Rk91xQRoSeLL2nKncLsg+M8WxiYVXbuuUzD7BIiwMJOrkfWZAdhlgS8Fg4yj/0hp80Bh
         uLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166877; x=1757771677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihAxrvGeeqbDGS2s2nWoaKnfeN+9tvG68aYZNvqbzNU=;
        b=w7krZDX8pQEHD9fN+0LXyUli5TLL+ZPu8T2FrYO8Immg31KwKMrRvjOwqKCKjxp2zJ
         iNqMKWqmqqNZj9iooNli1O9dNZp1Q0sIU1CcDZNCFs/Lolk6GqbsWeGRkWliJClJ0WVC
         r7Mvw4hSzRPVNkaVDvvfLaXiqskAQSaVyrxYKiCfprYNSrrZS+wKNx7FNmFCJhQ8RkUU
         s0fq2TRGPJkCsW8chYT+j0uTOWhpS53d+jVsRWN4DQTe84HSdYceq2orqO/8K/KOdxqz
         Bu/964U7XkZLBfkye9OAuRZ6inSYcH84njA2hL+WoRfShBfnH9KmHdkzWpkDwWt8UK4j
         1WrA==
X-Forwarded-Encrypted: i=1; AJvYcCUW6byogjKSB3Sn9w5nf/lbKWzXiuAFtdfSqNh0UAVUi/2IAYlLmzerEwrTSGIEpHuIGZcikMJTIlzI8pQ=@vger.kernel.org, AJvYcCUZTgYb7mX8qQsEooQ3CN7jms+Hc1uFMTHcND/BSN3UgMlpWAHQDDe8Gn/1cqY0ivOd4uXuIGuaFFTAdjI=@vger.kernel.org, AJvYcCUt1vPp5+zEqMe2tOXXE2wvQonttS4jLwo/JC1Zcn21uzWG1yealpgBQ+hZHQVA1pam331hs0w/OePy@vger.kernel.org, AJvYcCV3SR/hoDxXF0/QyJCmWwHOWEECjZibnXf8zJSbSpEGaRjbsgYBv4sDC46WdMaDjIzKxxVGXV350x6q@vger.kernel.org, AJvYcCVdZyBoT9TJd4m9v74Xmx9kIrtH16ztTrTYPXU80KbSp1Z1pzi8BHshcOAfIoySuYljEL82JSWz5tJVOIjl@vger.kernel.org
X-Gm-Message-State: AOJu0YxH9NbnwDGwEYP8AeUkPKfenQj4fbViVZmtUDUgT/JUQkDzpxGR
	HCYgNaYJFqlPk6Ia5T3mfzFcil2LsI0jDF7kfLecYkmJmyUsCtk61Swh
X-Gm-Gg: ASbGncsPOS4GIdRCDkSqrvJJZ+U7a2gJf7N0ObA9X0qyV7Kz1xRjBlVX6HraTsYHNE+
	LuGu3wVOKyDvlrPMGni7WFES7c4cHdUzFF9HQ7OcJ8Jdf9GwF9NPDQR/9hdOpbBqMrr2FgfQK5X
	8NHp/OSX//lWM/n7NUh3UbOLGZDFh0SM9sl6xmpp9Q2FFCTpVKVnF8RByMDH8QHaD6eKN/GZJY+
	th7bJVelyIi5hOZlL9huQ7F/Eln8lIbZE7wN+uXPln33Rd3pQZ1770NlagW0Z747q2OfXFhN4sK
	GMKJCup6VC395yUWq5IAbCL+3qCQ83OVZl0YDCSVu8Kuj/g4JBC5JcS11Sa9VlKr0nmenuy/MiE
	bomhMllx9xCcQZQ==
X-Google-Smtp-Source: AGHT+IHatIGh8G0J1UikQfxdTFIXqQbQiWvindT5F63RkEZZAi8sPudRZamp4DbTR3zgvoJJlfk9bg==
X-Received: by 2002:a05:6512:1455:20b0:562:d04d:fa0d with SMTP id 2adb3069b0e04-562d04dfb1cmr352888e87.30.1757166877046;
        Sat, 06 Sep 2025 06:54:37 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:36 -0700 (PDT)
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
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 22/23] ARM: tegra: add CSI nodes for Tegra20 and Tegra30
Date: Sat,  6 Sep 2025 16:53:43 +0300
Message-ID: <20250906135345.241229-23-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
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


