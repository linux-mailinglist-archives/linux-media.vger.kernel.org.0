Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFAD43EE2EE
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 03:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239135AbhHQBb7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 21:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237428AbhHQBbN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 21:31:13 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 555FBC06129F;
        Mon, 16 Aug 2021 18:30:40 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id d16so12088958ljq.4;
        Mon, 16 Aug 2021 18:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7tWLKwb+ZmEC3y8A0gyfxp4Q/kIcdFWSAWAjt5iPc6s=;
        b=CN3quu0bis3+MRoArJ/g3zAfp5OX3ahF5JDOA1HTr/T6NKMfZVVObcZLGi9Jqa1yOL
         hjzTl0GfwjU9KoPnnvQCUAfafECAmhY1VsZaLlrele+MWTLARBrGu68KYNFnPlFF7Mo4
         l6+KZQ63ox7A+BKN7FEGatSVeXqigNCMx+eZvhT0iHrG82io4iwFnlEShTkxu+AQZubG
         C2YZZzqp/KgHY/7XQ4R3+QnaCEh02tBSQVd8C4schNxaiJHwDOQRiABAA7/yoZcNsIif
         L/7vyZCs7oJ31vm3NSJmDteRL3y8V+rR6cK8WsXTDek4BEcfK9J0VT3pBh6/r9IMgm9M
         JCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7tWLKwb+ZmEC3y8A0gyfxp4Q/kIcdFWSAWAjt5iPc6s=;
        b=Ubv9O3zNFUKTIWfNaa767e5/ZFJ7hHG5StinZ+/tfTTc8UU5SD6KABhhcXkK4RHzfF
         ed2t46852begUKebR5hSjDOoU69QPy/XbnU/4AwXu43LTyyNQjxsAEDVtUDDPSDKe6QJ
         gVB7M9nxA6c5nk0aonqlTWC/CBks7HaW6GZvPHR61VwgyjvoYYI5Yoj+YpLe/niy5/Ak
         p6MeTHqTYrRk8lxCQBGZsJ1QeeS7hmY6YAn3oyheHDrMVSFttOCCZLVOOgK9umdZYiw0
         3Ag+FcplmPGwITClTHAd+lDyLyn25znNWcal1y/SMM4j/maHx5O+4K+iNYTSsfvrU2tZ
         7kEg==
X-Gm-Message-State: AOAM533H/43NLyDNmtOGXKyjn8l7edGgAau1b2aXjZPCB+Dz3rYCJ8Ny
        YxsqQCAysSg80iuZ4Lp4quE=
X-Google-Smtp-Source: ABdhPJxvA1aNf4sl6RIXWNM63nUT9/u76tZjPgr7Jb36rGc01yQZCL10OPPhf2CxwnuMF2vcZRxD1w==
X-Received: by 2002:a2e:b4a5:: with SMTP id q5mr860004ljm.11.1629163838319;
        Mon, 16 Aug 2021 18:30:38 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru. [46.138.85.91])
        by smtp.gmail.com with ESMTPSA id g30sm46607lfj.298.2021.08.16.18.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 18:30:38 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Peter Chen <peter.chen@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Richard Weinberger <richard@nod.at>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v8 31/34] ARM: tegra: Add OPP tables and power domains to Tegra30 device-trees
Date:   Tue, 17 Aug 2021 04:27:51 +0300
Message-Id: <20210817012754.8710-32-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817012754.8710-1-digetx@gmail.com>
References: <20210817012754.8710-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add OPP tables and power domains to all peripheral devices which
support power management on Tegra30 SoC.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../tegra30-asus-nexus7-grouper-common.dtsi   |    1 +
 arch/arm/boot/dts/tegra30-beaver.dts          |    1 +
 arch/arm/boot/dts/tegra30-cardhu.dtsi         |    1 +
 arch/arm/boot/dts/tegra30-colibri.dtsi        |   17 +-
 arch/arm/boot/dts/tegra30-ouya.dts            |    1 +
 .../arm/boot/dts/tegra30-peripherals-opp.dtsi | 1412 +++++++++++++++++
 arch/arm/boot/dts/tegra30.dtsi                |  159 ++
 7 files changed, 1589 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index 9732cd6f20b7..4f116c26f6ce 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -957,6 +957,7 @@ pmc@7000e400 {
 		nvidia,core-pwr-off-time = <0>;
 		nvidia,core-power-req-active-high;
 		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
 	};
 
 	ahub@70080000 {
diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index e159feeedef7..b54cbb24c4d3 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -1915,6 +1915,7 @@ pmc@7000e400 {
 		nvidia,core-pwr-off-time = <0>;
 		nvidia,core-power-req-active-high;
 		nvidia,sys-clock-req-active-high;
+		core-supply = <&core_vdd_reg>;
 	};
 
 	ahub@70080000 {
diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index 448f1397e64a..b2bba923eb93 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -391,6 +391,7 @@ pmc@7000e400 {
 		nvidia,core-pwr-off-time = <0>;
 		nvidia,core-power-req-active-high;
 		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
 	};
 
 	ahub@70080000 {
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 413e35215804..0627b64f044d 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -765,9 +765,14 @@ vdd1_reg: vdd1 {
 
 				vddctrl_reg: vddctrl {
 					regulator-name = "+V1.0_VDD_CPU";
-					regulator-min-microvolt = <1150000>;
-					regulator-max-microvolt = <1150000>;
+					regulator-min-microvolt = <800000>;
+					regulator-max-microvolt = <1250000>;
+					regulator-coupled-with = <&vdd_core>;
+					regulator-coupled-max-spread = <300000>;
+					regulator-max-step-microvolt = <100000>;
 					regulator-always-on;
+
+					nvidia,tegra-cpu-regulator;
 				};
 
 				reg_1v8_vio: vio {
@@ -890,18 +895,23 @@ temp-sensor@4c {
 		};
 
 		/* SW: +V1.2_VDD_CORE */
-		regulator@60 {
+		vdd_core: regulator@60 {
 			compatible = "ti,tps62362";
 			reg = <0x60>;
 
 			regulator-name = "tps62362-vout";
 			regulator-min-microvolt = <900000>;
 			regulator-max-microvolt = <1400000>;
+			regulator-coupled-with = <&vddctrl_reg>;
+			regulator-coupled-max-spread = <300000>;
+			regulator-max-step-microvolt = <100000>;
 			regulator-boot-on;
 			regulator-always-on;
 			ti,vsel0-state-low;
 			/* VSEL1: EN_CORE_DVFS_N low for DVFS */
 			ti,vsel1-state-low;
+
+			nvidia,tegra-core-regulator;
 		};
 	};
 
@@ -914,6 +924,7 @@ pmc@7000e400 {
 		nvidia,core-pwr-off-time = <0>;
 		nvidia,core-power-req-active-high;
 		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
 
 		/* Set DEV_OFF bit in DCDC control register of TPS65911 PMIC */
 		i2c-thermtrip {
diff --git a/arch/arm/boot/dts/tegra30-ouya.dts b/arch/arm/boot/dts/tegra30-ouya.dts
index 90db5ff72537..2a79cd4662b1 100644
--- a/arch/arm/boot/dts/tegra30-ouya.dts
+++ b/arch/arm/boot/dts/tegra30-ouya.dts
@@ -274,6 +274,7 @@ pmc@7000e400 {
 		nvidia,core-pwr-off-time = <458>;
 		nvidia,core-power-req-active-high;
 		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
 	};
 
 	mc_timings: memory-controller@7000f000 {
diff --git a/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
index 2c9780319725..788dcac2079e 100644
--- a/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
+++ b/arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
@@ -1,6 +1,56 @@
 // SPDX-License-Identifier: GPL-2.0
 
 / {
+	core_opp_table: core-power-domain-opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		core_opp_950: opp@950000 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-level = <950000>;
+		};
+
+		core_opp_1000: opp@1000000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-level = <1000000>;
+		};
+
+		core_opp_1050: opp@1050000 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-level = <1050000>;
+		};
+
+		core_opp_1100: opp@1100000 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-level = <1100000>;
+		};
+
+		core_opp_1150: opp@1150000 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-level = <1150000>;
+		};
+
+		core_opp_1200: opp@1200000 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-level = <1200000>;
+		};
+
+		core_opp_1250: opp@1250000 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-level = <1250000>;
+		};
+
+		core_opp_1300: opp@1300000 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-level = <1300000>;
+		};
+
+		core_opp_1350: opp@1350000 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-level = <1350000>;
+		};
+	};
+
 	emc_icc_dvfs_opp_table: emc-dvfs-opp-table {
 		compatible = "operating-points-v2";
 
@@ -8,126 +58,147 @@ opp@12750000,950 {
 			opp-microvolt = <950000 950000 1350000>;
 			opp-hz = /bits/ 64 <12750000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_950>;
 		};
 
 		opp@12750000,1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <12750000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp@12750000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <12750000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@25500000,950 {
 			opp-microvolt = <950000 950000 1350000>;
 			opp-hz = /bits/ 64 <25500000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_950>;
 		};
 
 		opp@25500000,1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <25500000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp@25500000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <25500000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@27000000,950 {
 			opp-microvolt = <950000 950000 1350000>;
 			opp-hz = /bits/ 64 <27000000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_950>;
 		};
 
 		opp@27000000,1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <27000000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp@27000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <27000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@51000000,950 {
 			opp-microvolt = <950000 950000 1350000>;
 			opp-hz = /bits/ 64 <51000000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_950>;
 		};
 
 		opp@51000000,1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <51000000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp@51000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <51000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@54000000,950 {
 			opp-microvolt = <950000 950000 1350000>;
 			opp-hz = /bits/ 64 <54000000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_950>;
 		};
 
 		opp@54000000,1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <54000000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp@54000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <54000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@102000000,950 {
 			opp-microvolt = <950000 950000 1350000>;
 			opp-hz = /bits/ 64 <102000000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_950>;
 		};
 
 		opp@102000000,1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <102000000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp@102000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <102000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@108000000,1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <108000000>;
 			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp@108000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <108000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@204000000,1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1000>;
 			opp-suspend;
 		};
 
@@ -135,6 +206,7 @@ opp@204000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <204000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 			opp-suspend;
 		};
 
@@ -142,126 +214,147 @@ opp@333500000,1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <333500000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp@333500000,1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <333500000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp@333500000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <333500000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@375000000,1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <375000000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp@375000000,1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <375000000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp@375000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <375000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@400000000,1000 {
 			opp-microvolt = <1000000 1000000 1350000>;
 			opp-hz = /bits/ 64 <400000000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1000>;
 		};
 
 		opp@400000000,1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <400000000>;
 			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp@400000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <400000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@416000000,1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <416000000>;
 			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp@416000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <416000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@450000000,1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <450000000>;
 			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp@450000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <450000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@533000000,1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <533000000>;
 			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp@533000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <533000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@625000000,1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <625000000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp@625000000,1250 {
 			opp-microvolt = <1250000 1250000 1350000>;
 			opp-hz = /bits/ 64 <625000000>;
 			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
 		};
 
 		opp@667000000,1200 {
 			opp-microvolt = <1200000 1200000 1350000>;
 			opp-hz = /bits/ 64 <667000000>;
 			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1200>;
 		};
 
 		opp@750000000,1300 {
 			opp-microvolt = <1300000 1300000 1350000>;
 			opp-hz = /bits/ 64 <750000000>;
 			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1300>;
 		};
 
 		opp@800000000,1300 {
 			opp-microvolt = <1300000 1300000 1350000>;
 			opp-hz = /bits/ 64 <800000000>;
 			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1300>;
 		};
 
 		opp@900000000,1350 {
 			opp-microvolt = <1350000 1350000 1350000>;
 			opp-hz = /bits/ 64 <900000000>;
 			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1350>;
 		};
 	};
 
@@ -383,4 +476,1323 @@ opp@900000000 {
 			opp-peak-kBps = <7200000>;
 		};
 	};
+
+	gr2d_dvfs_opp_table: gr2d-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@267000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <267000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@285000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <285000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@304000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <304000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@332000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <332000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@361000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <361000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@380000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <380000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@408000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@416000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <416000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@446000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <446000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@484000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <484000000>;
+			opp-supported-hw = <0x000C>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp@520000000,1300 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-hz = /bits/ 64 <520000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1300>;
+		};
+
+		opp@600000000,1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1350>;
+		};
+	};
+
+	gr3d_dvfs_opp_table: gr3d-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@234000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <234000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1000>, <&core_opp_1000>;
+		};
+
+		opp@247000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <247000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1000>, <&core_opp_1000>;
+		};
+
+		opp@285000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <285000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1050>, <&core_opp_1050>;
+		};
+
+		opp@304000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <304000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1050>, <&core_opp_1050>;
+		};
+
+		opp@332000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <332000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1100>, <&core_opp_1100>;
+		};
+
+		opp@361000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <361000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1100>, <&core_opp_1100>;
+		};
+
+		opp@380000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <380000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1150>, <&core_opp_1150>;
+		};
+
+		opp@408000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1150>, <&core_opp_1150>;
+		};
+
+		opp@416000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <416000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1200>, <&core_opp_1200>;
+		};
+
+		opp@446000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <446000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1200>, <&core_opp_1200>;
+		};
+
+		opp@484000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <484000000>;
+			opp-supported-hw = <0x000C>;
+			required-opps = <&core_opp_1250>, <&core_opp_1250>;
+		};
+
+		opp@520000000,1300 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-hz = /bits/ 64 <520000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1300>, <&core_opp_1300>;
+		};
+
+		opp@600000000,1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1350>, <&core_opp_1350>;
+		};
+	};
+
+	afi_dvfs_opp_table: afi-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@250000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <250000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	cve_dvfs_opp_table: cve-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@297000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <297000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+	};
+
+	disp1_dvfs_opp_table: disp1-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@120000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <120000000>;
+			opp-supported-hw = <0x0009>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@155000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <155000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@190000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <190000000>;
+			opp-supported-hw = <0x0009>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@268000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <268000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1050>;
+		};
+	};
+
+	disp2_dvfs_opp_table: disp2-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@120000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <120000000>;
+			opp-supported-hw = <0x0009>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@155000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <155000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@190000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <190000000>;
+			opp-supported-hw = <0x0009>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@268000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <268000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1050>;
+		};
+	};
+
+	dsia_dvfs_opp_table: dsia-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@275000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <275000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	dsib_dvfs_opp_table: dsib-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@275000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <275000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	epp_dvfs_opp_table: epp-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@267000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <267000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@285000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <285000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@304000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <304000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@332000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <332000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@361000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <361000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@380000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <380000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@408000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@416000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <416000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@446000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <446000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@484000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <484000000>;
+			opp-supported-hw = <0x000C>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp@520000000,1300 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-hz = /bits/ 64 <520000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1300>;
+		};
+
+		opp@600000000,1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1350>;
+		};
+	};
+
+	fuse_burn_dvfs_opp_table: fuse_burn-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@26000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <26000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1150>;
+		};
+	};
+
+	hdmi_dvfs_opp_table: hdmi-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@148500000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <148500000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	host1x_dvfs_opp_table: host1x-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@152000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <152000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@188000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <188000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@222000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <222000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@242000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <242000000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp@254000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <254000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@267000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <267000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@300000000,1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1350>;
+		};
+	};
+
+	mipi_dvfs_opp_table: mipi-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@60000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <60000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	mpe_dvfs_opp_table: mpe-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@234000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <234000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@247000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <247000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@285000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <285000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@304000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <304000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@332000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <332000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@361000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <361000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@380000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <380000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@408000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@416000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <416000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@446000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <446000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@484000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <484000000>;
+			opp-supported-hw = <0x000C>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp@520000000,1300 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-hz = /bits/ 64 <520000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1300>;
+		};
+
+		opp@600000000,1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1350>;
+		};
+	};
+
+	sclk_dvfs_opp_table: sclk-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@51000000,950 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-hz = /bits/ 64 <51000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp@136000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <136000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@164000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <164000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@191000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <191000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@205000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <205000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@216000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <216000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@227000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <227000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@267000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <267000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@334000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <334000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp@378000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <378000000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
+		};
+	};
+
+	se_dvfs_opp_table: se-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@267000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <267000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@285000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <285000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@304000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <304000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@332000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <332000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@361000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <361000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@380000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <380000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@408000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@416000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <416000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@446000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <446000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@484000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <484000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp@520000000,1300 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-hz = /bits/ 64 <520000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1300>;
+		};
+
+		opp@600000000,1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1350>;
+		};
+
+		opp@625000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <625000000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
+		};
+	};
+
+	ndflash_dvfs_opp_table: ndflash-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@120000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <120000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@200000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <200000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1150>;
+		};
+	};
+
+	nor_dvfs_opp_table: nor-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@108000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <108000000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp@115000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <115000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@130000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <130000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@133000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <133000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1150>;
+		};
+	};
+
+	pcie_dvfs_opp_table: pcie-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@250000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <250000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	pll_c_dvfs_opp_table: pll_c-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@533000000,950 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-hz = /bits/ 64 <533000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp@667000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <667000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@800000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <800000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@1066000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <1066000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@1200000000,1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1350>;
+		};
+	};
+
+	pll_e_dvfs_opp_table: pll_e-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@100000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <100000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	pll_m_dvfs_opp_table: pll_m-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@533000000,950 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-hz = /bits/ 64 <533000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp@667000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <667000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@800000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <800000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@1066000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <1066000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	pwm_dvfs_opp_table: pwm-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@408000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <408000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	sata_dvfs_opp_table: sata-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@216000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <216000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	sata_oob_dvfs_opp_table: sata_oob-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@216000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <216000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	sbc1_dvfs_opp_table: sbc1-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@52000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@60000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <60000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@100000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <100000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	sbc2_dvfs_opp_table: sbc2-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@52000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@60000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <60000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@100000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <100000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	sbc3_dvfs_opp_table: sbc3-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@52000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@60000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <60000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@100000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <100000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	sbc4_dvfs_opp_table: sbc4-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@52000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@60000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <60000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@100000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <100000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	sbc5_dvfs_opp_table: sbc5-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@52000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@60000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <60000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@100000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <100000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	sbc6_dvfs_opp_table: sbc6-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@52000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <52000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@60000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <60000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@100000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <100000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	sdmmc1_dvfs_opp_table: sdmmc1-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@104000000,950 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-hz = /bits/ 64 <104000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp@208000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <208000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	sdmmc3_dvfs_opp_table: sdmmc3-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@104000000,950 {
+			opp-microvolt = <950000 950000 1350000>;
+			opp-hz = /bits/ 64 <104000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_950>;
+		};
+
+		opp@208000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <208000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1200>;
+		};
+	};
+
+	spdif_out_dvfs_opp_table: spdif-out-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@26000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <26000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	tvdac_dvfs_opp_table: tvdac-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@220000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <220000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	tvo_dvfs_opp_table: tvo-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@297000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <297000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1050>;
+		};
+	};
+
+	usbd_dvfs_opp_table: usbd-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@480000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <480000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	usb2_dvfs_opp_table: usb2-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@480000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <480000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	usb3_dvfs_opp_table: usb3-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@480000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <480000000>;
+			opp-supported-hw = <0x000F>;
+			required-opps = <&core_opp_1000>;
+		};
+	};
+
+	vde_dvfs_opp_table: vde-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@228000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <228000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@247000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <247000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@275000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <275000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@304000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <304000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@332000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <332000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@352000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <352000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@380000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <380000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@400000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <400000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@416000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <416000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@437000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <437000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@484000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <484000000>;
+			opp-supported-hw = <0x000C>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp@520000000,1300 {
+			opp-microvolt = <1300000 1300000 1350000>;
+			opp-hz = /bits/ 64 <520000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1300>;
+		};
+
+		opp@600000000,1350 {
+			opp-microvolt = <1350000 1350000 1350000>;
+			opp-hz = /bits/ 64 <600000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1350>;
+		};
+	};
+
+	vi_dvfs_opp_table: vi-opp-table {
+		compatible = "operating-points-v2";
+
+		opp@216000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <216000000>;
+			opp-supported-hw = <0x0003>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@219000000,1000 {
+			opp-microvolt = <1000000 1000000 1350000>;
+			opp-hz = /bits/ 64 <219000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1000>;
+		};
+
+		opp@267000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <267000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@285000000,1050 {
+			opp-microvolt = <1050000 1050000 1350000>;
+			opp-hz = /bits/ 64 <285000000>;
+			opp-supported-hw = <0x0001>;
+			required-opps = <&core_opp_1050>;
+		};
+
+		opp@300000000,1100 {
+			opp-microvolt = <1100000 1100000 1350000>;
+			opp-hz = /bits/ 64 <300000000>;
+			opp-supported-hw = <0x0007>;
+			required-opps = <&core_opp_1100>;
+		};
+
+		opp@371000000,1150 {
+			opp-microvolt = <1150000 1150000 1350000>;
+			opp-hz = /bits/ 64 <371000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1150>;
+		};
+
+		opp@409000000,1200 {
+			opp-microvolt = <1200000 1200000 1350000>;
+			opp-hz = /bits/ 64 <409000000>;
+			opp-supported-hw = <0x0006>;
+			required-opps = <&core_opp_1200>;
+		};
+
+		opp@425000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <425000000>;
+			opp-supported-hw = <0x0004>;
+			required-opps = <&core_opp_1250>;
+		};
+
+		opp@470000000,1250 {
+			opp-microvolt = <1250000 1250000 1350000>;
+			opp-hz = /bits/ 64 <470000000>;
+			opp-supported-hw = <0x0008>;
+			required-opps = <&core_opp_1250>;
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index eaf4951d9ff8..46e7bfa1e894 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -55,6 +55,8 @@ pcie@3000 {
 			 <&tegra_car 72>,
 			 <&tegra_car 74>;
 		reset-names = "pex", "afi", "pcie_x";
+		operating-points-v2 = <&pcie_dvfs_opp_table>;
+		power-domains = <&pd_core>;
 		status = "disabled";
 
 		pci@1,0 {
@@ -124,6 +126,8 @@ host1x@50000000 {
 		resets = <&tegra_car 28>;
 		reset-names = "host1x";
 		iommus = <&mc TEGRA_SWGROUP_HC>;
+		operating-points-v2 = <&host1x_dvfs_opp_table>;
+		power-domains = <&pd_heg>;
 
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -137,6 +141,8 @@ mpe@54040000 {
 			clocks = <&tegra_car TEGRA30_CLK_MPE>;
 			resets = <&tegra_car 60>;
 			reset-names = "mpe";
+			operating-points-v2 = <&mpe_dvfs_opp_table>;
+			power-domains = <&pd_mpe>;
 
 			iommus = <&mc TEGRA_SWGROUP_MPE>;
 		};
@@ -148,6 +154,8 @@ vi@54080000 {
 			clocks = <&tegra_car TEGRA30_CLK_VI>;
 			resets = <&tegra_car 20>;
 			reset-names = "vi";
+			operating-points-v2 = <&vi_dvfs_opp_table>;
+			power-domains = <&pd_venc>;
 
 			iommus = <&mc TEGRA_SWGROUP_VI>;
 		};
@@ -159,6 +167,8 @@ epp@540c0000 {
 			clocks = <&tegra_car TEGRA30_CLK_EPP>;
 			resets = <&tegra_car 19>;
 			reset-names = "epp";
+			operating-points-v2 = <&epp_dvfs_opp_table>;
+			power-domains = <&pd_heg>;
 
 			iommus = <&mc TEGRA_SWGROUP_EPP>;
 		};
@@ -170,6 +180,7 @@ isp@54100000 {
 			clocks = <&tegra_car TEGRA30_CLK_ISP>;
 			resets = <&tegra_car 23>;
 			reset-names = "isp";
+			power-domains = <&pd_venc>;
 
 			iommus = <&mc TEGRA_SWGROUP_ISP>;
 		};
@@ -181,6 +192,8 @@ gr2d@54140000 {
 			clocks = <&tegra_car TEGRA30_CLK_GR2D>;
 			resets = <&tegra_car 21>;
 			reset-names = "2d";
+			operating-points-v2 = <&gr2d_dvfs_opp_table>;
+			power-domains = <&pd_heg>;
 
 			iommus = <&mc TEGRA_SWGROUP_G2>;
 		};
@@ -194,6 +207,9 @@ gr3d@54180000 {
 			resets = <&tegra_car 24>,
 				 <&tegra_car 98>;
 			reset-names = "3d", "3d2";
+			operating-points-v2 = <&gr3d_dvfs_opp_table>;
+			power-domains = <&pd_3d0>, <&pd_3d1>;
+			power-domain-names = "3d0", "3d1";
 
 			iommus = <&mc TEGRA_SWGROUP_NV>,
 				 <&mc TEGRA_SWGROUP_NV2>;
@@ -208,6 +224,8 @@ dc@54200000 {
 			clock-names = "dc", "parent";
 			resets = <&tegra_car 27>;
 			reset-names = "dc";
+			operating-points-v2 = <&disp1_dvfs_opp_table>;
+			power-domains = <&pd_core>;
 
 			iommus = <&mc TEGRA_SWGROUP_DC>;
 
@@ -238,6 +256,8 @@ dc@54240000 {
 			clock-names = "dc", "parent";
 			resets = <&tegra_car 26>;
 			reset-names = "dc";
+			operating-points-v2 = <&disp2_dvfs_opp_table>;
+			power-domains = <&pd_core>;
 
 			iommus = <&mc TEGRA_SWGROUP_DCB>;
 
@@ -268,6 +288,8 @@ hdmi@54280000 {
 			clock-names = "hdmi", "parent";
 			resets = <&tegra_car 51>;
 			reset-names = "hdmi";
+			operating-points-v2 = <&hdmi_dvfs_opp_table>;
+			power-domains = <&pd_core>;
 			status = "disabled";
 		};
 
@@ -276,6 +298,8 @@ tvo@542c0000 {
 			reg = <0x542c0000 0x00040000>;
 			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_TVO>;
+			operating-points-v2 = <&tvo_dvfs_opp_table>;
+			power-domains = <&pd_core>;
 			status = "disabled";
 		};
 
@@ -287,6 +311,8 @@ dsi@54300000 {
 			clock-names = "dsi", "parent";
 			resets = <&tegra_car 48>;
 			reset-names = "dsi";
+			operating-points-v2 = <&dsia_dvfs_opp_table>;
+			power-domains = <&pd_core>;
 			status = "disabled";
 		};
 
@@ -298,6 +324,8 @@ dsi@54400000 {
 			clock-names = "dsi", "parent";
 			resets = <&tegra_car 84>;
 			reset-names = "dsi";
+			operating-points-v2 = <&dsib_dvfs_opp_table>;
+			power-domains = <&pd_core>;
 			status = "disabled";
 		};
 	};
@@ -358,6 +386,40 @@ tegra_car: clock@60006000 {
 		reg = <0x60006000 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
+
+		tegra-clocks {
+			sclk {
+				compatible = "nvidia,tegra30-sclk",
+					     "nvidia,tegra-clock";
+				operating-points-v2 = <&sclk_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_SCLK>;
+				power-domains = <&pd_core>;
+			};
+
+			pll_c {
+				compatible = "nvidia,tegra30-pllc",
+					     "nvidia,tegra-clock";
+				operating-points-v2 = <&pll_c_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_PLL_C>;
+				power-domains = <&pd_core>;
+			};
+
+			pll_e {
+				compatible = "nvidia,tegra30-plle",
+					     "nvidia,tegra-clock";
+				operating-points-v2 = <&pll_e_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_PLL_E>;
+				power-domains = <&pd_core>;
+			};
+
+			pll_m {
+				compatible = "nvidia,tegra30-pllm",
+					     "nvidia,tegra-clock";
+				operating-points-v2 = <&pll_m_dvfs_opp_table>;
+				clocks = <&tegra_car TEGRA30_CLK_PLL_M>;
+				power-domains = <&pd_core>;
+			};
+		};
 	};
 
 	flow-controller@60007000 {
@@ -468,6 +530,8 @@ vde@6001a000 {
 		reset-names = "vde", "mc";
 		resets = <&tegra_car 61>, <&mc TEGRA30_MC_RESET_VDE>;
 		iommus = <&mc TEGRA_SWGROUP_VDE>;
+		operating-points-v2 = <&vde_dvfs_opp_table>;
+		power-domains = <&pd_vde>;
 	};
 
 	apbmisc@70000800 {
@@ -565,6 +629,8 @@ gmi@70009000 {
 		clock-names = "gmi";
 		resets = <&tegra_car 42>;
 		reset-names = "gmi";
+		operating-points-v2 = <&nor_dvfs_opp_table>;
+		power-domains = <&pd_core>;
 		status = "disabled";
 	};
 
@@ -575,6 +641,8 @@ pwm: pwm@7000a000 {
 		clocks = <&tegra_car TEGRA30_CLK_PWM>;
 		resets = <&tegra_car 17>;
 		reset-names = "pwm";
+		operating-points-v2 = <&pwm_dvfs_opp_table>;
+		power-domains = <&pd_core>;
 		status = "disabled";
 	};
 
@@ -676,6 +744,8 @@ spi@7000d400 {
 		reset-names = "spi";
 		dmas = <&apbdma 15>, <&apbdma 15>;
 		dma-names = "rx", "tx";
+		operating-points-v2 = <&sbc1_dvfs_opp_table>;
+		power-domains = <&pd_core>;
 		status = "disabled";
 	};
 
@@ -690,6 +760,8 @@ spi@7000d600 {
 		reset-names = "spi";
 		dmas = <&apbdma 16>, <&apbdma 16>;
 		dma-names = "rx", "tx";
+		operating-points-v2 = <&sbc2_dvfs_opp_table>;
+		power-domains = <&pd_core>;
 		status = "disabled";
 	};
 
@@ -704,6 +776,8 @@ spi@7000d800 {
 		reset-names = "spi";
 		dmas = <&apbdma 17>, <&apbdma 17>;
 		dma-names = "rx", "tx";
+		operating-points-v2 = <&sbc3_dvfs_opp_table>;
+		power-domains = <&pd_core>;
 		status = "disabled";
 	};
 
@@ -718,6 +792,8 @@ spi@7000da00 {
 		reset-names = "spi";
 		dmas = <&apbdma 18>, <&apbdma 18>;
 		dma-names = "rx", "tx";
+		operating-points-v2 = <&sbc4_dvfs_opp_table>;
+		power-domains = <&pd_core>;
 		status = "disabled";
 	};
 
@@ -732,6 +808,8 @@ spi@7000dc00 {
 		reset-names = "spi";
 		dmas = <&apbdma 27>, <&apbdma 27>;
 		dma-names = "rx", "tx";
+		operating-points-v2 = <&sbc5_dvfs_opp_table>;
+		power-domains = <&pd_core>;
 		status = "disabled";
 	};
 
@@ -746,6 +824,8 @@ spi@7000de00 {
 		reset-names = "spi";
 		dmas = <&apbdma 28>, <&apbdma 28>;
 		dma-names = "rx", "tx";
+		operating-points-v2 = <&sbc6_dvfs_opp_table>;
+		power-domains = <&pd_core>;
 		status = "disabled";
 	};
 
@@ -765,6 +845,72 @@ tegra_pmc: pmc@7000e400 {
 		clocks = <&tegra_car TEGRA30_CLK_PCLK>, <&clk32k_in>;
 		clock-names = "pclk", "clk32k_in";
 		#clock-cells = <1>;
+
+		pd_core: core-domain {
+			operating-points-v2 = <&core_opp_table>;
+			#power-domain-cells = <0>;
+		};
+
+		powergates {
+			pd_3d0: 3d0 {
+				clocks = <&tegra_car TEGRA30_CLK_GR3D>;
+				resets = <&mc TEGRA30_MC_RESET_3D>,
+					 <&tegra_car TEGRA30_CLK_GR3D>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_3d1: 3d1 {
+				clocks = <&tegra_car TEGRA30_CLK_GR3D2>;
+				resets = <&mc TEGRA30_MC_RESET_3D2>,
+					 <&tegra_car TEGRA30_CLK_GR3D2>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_venc: venc {
+				clocks = <&tegra_car TEGRA30_CLK_ISP>,
+					 <&tegra_car TEGRA30_CLK_VI>,
+					 <&tegra_car TEGRA30_CLK_CSI>;
+				resets = <&mc TEGRA30_MC_RESET_ISP>,
+					 <&mc TEGRA30_MC_RESET_VI>,
+					 <&tegra_car TEGRA30_CLK_ISP>,
+					 <&tegra_car 20 /* VI */>,
+					 <&tegra_car TEGRA30_CLK_CSI>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_vde: vdec {
+				clocks = <&tegra_car TEGRA30_CLK_VDE>;
+				resets = <&mc TEGRA30_MC_RESET_VDE>,
+					 <&tegra_car TEGRA30_CLK_VDE>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_mpe: mpe {
+				clocks = <&tegra_car TEGRA30_CLK_MPE>;
+				resets = <&mc TEGRA30_MC_RESET_MPE>,
+					 <&tegra_car TEGRA30_CLK_MPE>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+
+			pd_heg: heg {
+				clocks = <&tegra_car TEGRA30_CLK_GR2D>,
+					 <&tegra_car TEGRA30_CLK_EPP>,
+					 <&tegra_car TEGRA30_CLK_HOST1X>;
+				resets = <&mc TEGRA30_MC_RESET_2D>,
+					 <&mc TEGRA30_MC_RESET_EPP>,
+					 <&mc TEGRA30_MC_RESET_HC>,
+					 <&tegra_car TEGRA30_CLK_GR2D>,
+					 <&tegra_car TEGRA30_CLK_EPP>,
+					 <&tegra_car TEGRA30_CLK_HOST1X>;
+				power-domains = <&pd_core>;
+				#power-domain-cells = <0>;
+			};
+		};
 	};
 
 	mc: memory-controller@7000f000 {
@@ -785,6 +931,7 @@ emc: memory-controller@7000f400 {
 		reg = <0x7000f400 0x400>;
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_EMC>;
+		power-domains = <&pd_core>;
 
 		nvidia,memory-controller = <&mc>;
 		operating-points-v2 = <&emc_icc_dvfs_opp_table>;
@@ -799,6 +946,8 @@ fuse@7000f800 {
 		clock-names = "fuse";
 		resets = <&tegra_car 39>;
 		reset-names = "fuse";
+		operating-points-v2 = <&fuse_burn_dvfs_opp_table>;
+		power-domains = <&pd_core>;
 	};
 
 	tsensor: tsensor@70014000 {
@@ -921,6 +1070,8 @@ mmc@78000000 {
 		clock-names = "sdhci";
 		resets = <&tegra_car 14>;
 		reset-names = "sdhci";
+		operating-points-v2 = <&sdmmc1_dvfs_opp_table>;
+		power-domains = <&pd_core>;
 		status = "disabled";
 	};
 
@@ -943,6 +1094,8 @@ mmc@78000400 {
 		clock-names = "sdhci";
 		resets = <&tegra_car 69>;
 		reset-names = "sdhci";
+		operating-points-v2 = <&sdmmc3_dvfs_opp_table>;
+		power-domains = <&pd_core>;
 		status = "disabled";
 	};
 
@@ -967,6 +1120,8 @@ usb@7d000000 {
 		reset-names = "usb";
 		nvidia,needs-double-reset;
 		nvidia,phy = <&phy1>;
+		operating-points-v2 = <&usbd_dvfs_opp_table>;
+		power-domains = <&pd_core>;
 		status = "disabled";
 	};
 
@@ -1006,6 +1161,8 @@ usb@7d004000 {
 		resets = <&tegra_car 58>;
 		reset-names = "usb";
 		nvidia,phy = <&phy2>;
+		operating-points-v2 = <&usb2_dvfs_opp_table>;
+		power-domains = <&pd_core>;
 		status = "disabled";
 	};
 
@@ -1044,6 +1201,8 @@ usb@7d008000 {
 		resets = <&tegra_car 59>;
 		reset-names = "usb";
 		nvidia,phy = <&phy3>;
+		operating-points-v2 = <&usb3_dvfs_opp_table>;
+		power-domains = <&pd_core>;
 		status = "disabled";
 	};
 
-- 
2.32.0

