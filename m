Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BDAF2A7244
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 00:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733197AbgKDXqb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 18:46:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733167AbgKDXpf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Nov 2020 18:45:35 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC86C0613CF;
        Wed,  4 Nov 2020 15:45:35 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id l28so143023lfp.10;
        Wed, 04 Nov 2020 15:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g8x6egXvkoE7IlVITDMjG68sqFxmck8iG4cXdT5aClY=;
        b=knwY4qldgRz85xN7wHG8/t/Hk+TrlyqYB5yOrIfHcDq2L83ZKYnXp52uopxa2aPau+
         GGiXRS0kkgWn5s8ZKZvNRdqVUsXRK9kQnTUTFEbvU1YAMqNm+lhpGdFlAxsxM1vjZGXC
         gR/raJPLvVdXo04Mi9NHtGHCza8FOnDMmEFMu+g/PEvx23qqmh4Yb/kg91yo0kxMhBQI
         TqvorWHpnTxBKT6rm3Gy60P7q74O7AER0fd8RuIq8B7gjuFTHDHSAOdZWeAhSh7tCCYs
         +qREBrXAnJcIpPh5txx1lR2W6vQJm0AXsdEYxiVWGVo/jpLVPSiro6atqsJfUXYFp4vt
         Xpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g8x6egXvkoE7IlVITDMjG68sqFxmck8iG4cXdT5aClY=;
        b=dxhNfQyxxaSIT8NjdUim3xiTnPt3u7G1TWmcG3tV7TaXp+QEuf6+zW0NTB2po7YpYI
         mDjTCBdApiDA8iwH0vKDYJNLCopALHURDrWXCZVlZrAkwR8tRAb1WZsIQXfy40F4Ari4
         vqqeR1B6cEqVsJ0Plf6thUwhsFDi/Ja3MXcbqy5FBhx2l5FhYBiC5P6w61hbsbPoC4/R
         nY6+TCpRl1/Tw4M+BRv+MoYy7gWYR57HhYZlAT8Vm5Ck26hXU2Zi80+7ggHWeyBHUMdv
         1Gc9b9iELaNz0INdKI0oLiXK9NKd5QElBdYc+JkDIxFrj3dGkNiux3rK7uMqnE3+n1WX
         VQKA==
X-Gm-Message-State: AOAM532SIlgUg9tVlisNFQyqAWTr8Hj4pvjL02z2HLVFdRh+6uQtI7nl
        R7xacN8hKBzw6Yl9xFMjYMY=
X-Google-Smtp-Source: ABdhPJz8N2Oz+8UFGJPk7QbDn5k2EBCL7Q+SAg+CeNKJVu1D596H0D056BGluC+KaAm7RZocVmHpuw==
X-Received: by 2002:ac2:52b9:: with SMTP id r25mr52667lfm.274.1604533533673;
        Wed, 04 Nov 2020 15:45:33 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru. [109.252.192.83])
        by smtp.gmail.com with ESMTPSA id m6sm640725ljc.112.2020.11.04.15.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 15:45:33 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Peter Chen <Peter.Chen@nxp.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>
Cc:     linux-samsung-soc@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-usb@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 27/30] ARM: tegra: paz00: Add voltage supplies to DVFS-capable devices
Date:   Thu,  5 Nov 2020 02:44:24 +0300
Message-Id: <20201104234427.26477-28-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104234427.26477-1-digetx@gmail.com>
References: <20201104234427.26477-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add voltage supplies to DVFS-capable devices in order to enable
system-wide voltage scaling and allow CORE/RTC regulators to go lower.

Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-paz00.dts | 40 ++++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 52a81d888424..d497eb149fba 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -26,7 +26,19 @@ memory@0 {
 	};
 
 	host1x@50000000 {
+		core-supply = <&core_vdd_reg>;
+
+		gr2d@54140000 {
+			core-supply = <&core_vdd_reg>;
+		};
+
+		gr3d@54180000 {
+			core-supply = <&core_vdd_reg>;
+		};
+
 		dc@54200000 {
+			core-supply = <&core_vdd_reg>;
+
 			rgb {
 				status = "okay";
 
@@ -34,11 +46,16 @@ rgb {
 			};
 		};
 
+		dc@54240000 {
+			core-supply = <&core_vdd_reg>;
+		};
+
 		hdmi@54280000 {
 			status = "okay";
 
 			vdd-supply = <&hdmi_vdd_reg>;
 			pll-supply = <&hdmi_pll_reg>;
+			core-supply = <&core_vdd_reg>;
 
 			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
 			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
@@ -46,6 +63,10 @@ hdmi@54280000 {
 		};
 	};
 
+	vde@6001a000 {
+		core-supply = <&core_vdd_reg>;
+	};
+
 	pinmux@70000014 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&state_default>;
@@ -389,10 +410,10 @@ sys_reg: sys {
 
 				core_vdd_reg: sm0 {
 					regulator-name = "+1.2vs_sm0,vdd_core";
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1225000>;
+					regulator-min-microvolt = <950000>;
+					regulator-max-microvolt = <1300000>;
 					regulator-coupled-with = <&rtc_vdd_reg &cpu_vdd_reg>;
-					regulator-coupled-max-spread = <170000 450000>;
+					regulator-coupled-max-spread = <170000 550000>;
 					regulator-always-on;
 
 					nvidia,tegra-core-regulator;
@@ -403,7 +424,7 @@ cpu_vdd_reg: sm1 {
 					regulator-min-microvolt = <750000>;
 					regulator-max-microvolt = <1100000>;
 					regulator-coupled-with = <&core_vdd_reg &rtc_vdd_reg>;
-					regulator-coupled-max-spread = <450000 450000>;
+					regulator-coupled-max-spread = <550000 550000>;
 					regulator-always-on;
 
 					nvidia,tegra-cpu-regulator;
@@ -427,10 +448,10 @@ ldo1 {
 
 				rtc_vdd_reg: ldo2 {
 					regulator-name = "+1.2vs_ldo2,vdd_rtc";
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <1225000>;
+					regulator-min-microvolt = <950000>;
+					regulator-max-microvolt = <1300000>;
 					regulator-coupled-with = <&core_vdd_reg &cpu_vdd_reg>;
-					regulator-coupled-max-spread = <170000 450000>;
+					regulator-coupled-max-spread = <170000 550000>;
 					regulator-always-on;
 
 					nvidia,tegra-rtc-regulator;
@@ -519,6 +540,7 @@ usb@c5000000 {
 		compatible = "nvidia,tegra20-udc";
 		status = "okay";
 		dr_mode = "peripheral";
+		core-supply = <&core_vdd_reg>;
 	};
 
 	usb-phy@c5000000 {
@@ -529,6 +551,7 @@ usb@c5004000 {
 		status = "okay";
 		nvidia,phy-reset-gpio = <&gpio TEGRA_GPIO(V, 0)
 			GPIO_ACTIVE_LOW>;
+		core-supply = <&core_vdd_reg>;
 	};
 
 	usb-phy@c5004000 {
@@ -539,6 +562,7 @@ usb-phy@c5004000 {
 
 	usb@c5008000 {
 		status = "okay";
+		core-supply = <&core_vdd_reg>;
 	};
 
 	usb-phy@c5008000 {
@@ -551,12 +575,14 @@ mmc@c8000000 {
 		wp-gpios = <&gpio TEGRA_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
 		power-gpios = <&gpio TEGRA_GPIO(V, 1) GPIO_ACTIVE_HIGH>;
 		bus-width = <4>;
+		core-supply = <&core_vdd_reg>;
 	};
 
 	mmc@c8000600 {
 		status = "okay";
 		bus-width = <8>;
 		non-removable;
+		core-supply = <&core_vdd_reg>;
 	};
 
 	backlight: backlight {
-- 
2.27.0

