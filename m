Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7D622DD769
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:14:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731391AbgLQSJr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:09:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731168AbgLQSJ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:09:27 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53BD2C061A4D;
        Thu, 17 Dec 2020 10:08:17 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id l11so59864645lfg.0;
        Thu, 17 Dec 2020 10:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dKHTaUqpc9+qnQDklHnbuyOfX2r5BRRRR5K6s2ucz2U=;
        b=Z/3072D8/T/ty624y/Y3fzZ4jDHFKHMiM8Puk81C8hVAIESVtNYFGrhY1j91vcZIjE
         X9pYxViGd/drXaOMeiO03C94pqe0NUAIdPEzUPg7/baXADcPcw0MywpuMA/Af8v2L3JF
         YYJPps/fM0KR2BDKsk6Jh/nu6atzjZi+/Qjyh1NdEhRzIxzuzNvI0ZekJYPghXXJV2Kx
         V10TKhm0SSOl8Cihy6JHBf3ogDQRcQ0CbbCJogpbFv704LJOPOZyq5ADGrMW4TfZ9+M8
         ZS2aqdaM/ACpx1+4CmVJGtjLu2NfZZYPG13hiBP/iVkg3oJvV1O/9KFPXJDqaEV+LQIb
         JiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dKHTaUqpc9+qnQDklHnbuyOfX2r5BRRRR5K6s2ucz2U=;
        b=UJRB4QLjc/eSV67gm2DMcLV0oBReR809rnjGNZzD1CvM6JlaFnrWYVFMDSyf0Ko04q
         dT9AknZNi23QqlzO29FpKHzHuyb1bu1OP1ClKVi2tJ3ZlsC1evizEXRT/8iTPJbklYNt
         GsDcMGqy23/Ge1LTlbR6wAmzm5pgncbP/Cct+ScaveD2se1q+HB7jH27sa2AHSiXDwj7
         ii8SHtM3EJdsPxTaAPM2WhifXB+wBaIizSHCpQmoYam68j4Za/kPes0hSkC9z3QTLZQ7
         GtljYMNZrJLb6uncA2M/Ku6+YO6EyDoLfgonU7UlX2HnNpuC4zb9xv4akH+a1qzk50hI
         64UQ==
X-Gm-Message-State: AOAM530s5AzlHyaXhXBOSh3LbQdnJ+GHLiODbzS7YXlLUDl01wHRX2Oe
        ZCcl2xkV9mtb2zpxkQhcRss=
X-Google-Smtp-Source: ABdhPJyA0nTTMUEGxiyKEV0G3HcIN8F0c417daftUmLQYrZ/StuJHmuOFKZCKF5VoAB7IsqXITN4Aw==
X-Received: by 2002:a2e:8512:: with SMTP id j18mr213822lji.31.1608228495787;
        Thu, 17 Dec 2020 10:08:15 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u5sm655596lff.78.2020.12.17.10.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 10:08:15 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 48/48] ARM: tegra: cardhu: Support CPU voltage scaling and thermal throttling
Date:   Thu, 17 Dec 2020 21:06:38 +0300
Message-Id: <20201217180638.22748-49-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217180638.22748-1-digetx@gmail.com>
References: <20201217180638.22748-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable CPU voltage scaling and thermal throttling on Tegra30 Cardhu board.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-cardhu.dtsi | 61 ++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index d74c9ca78a7f..08c0ea4e6228 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/thermal/thermal.h>
 #include "tegra30.dtsi"
+#include "tegra30-cpu-opp.dtsi"
+#include "tegra30-cpu-opp-microvolt.dtsi"
 
 /**
  * This file contains common DT entry for all fab version of Cardhu.
@@ -339,12 +342,13 @@ ldo8_reg: ldo8 {
 			};
 		};
 
-		temperature-sensor@4c {
+		nct1008: temperature-sensor@4c {
 			compatible = "onnn,nct1008";
 			reg = <0x4c>;
 			vcc-supply = <&sys_3v3_reg>;
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(CC, 2) IRQ_TYPE_LEVEL_LOW>;
+			#thermal-sensor-cells = <1>;
 		};
 
 		vdd_core: tps62361@60 {
@@ -438,6 +442,29 @@ clk32k_in: clock@0 {
 		#clock-cells = <0>;
 	};
 
+	cpus {
+		cpu0: cpu@0 {
+			cpu-supply = <&vddctrl_reg>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <2>;
+		};
+
+		cpu@1 {
+			cpu-supply = <&vddctrl_reg>;
+			operating-points-v2 = <&cpu0_opp_table>;
+		};
+
+		cpu@2 {
+			cpu-supply = <&vddctrl_reg>;
+			operating-points-v2 = <&cpu0_opp_table>;
+		};
+
+		cpu@3 {
+			cpu-supply = <&vddctrl_reg>;
+			operating-points-v2 = <&cpu0_opp_table>;
+		};
+	};
+
 	panel: panel {
 		compatible = "chunghwa,claa101wb01";
 		ddc-i2c-bus = <&panelddc>;
@@ -617,6 +644,38 @@ sound {
 					 <&tegra_car TEGRA30_CLK_EXTERN1>;
 	};
 
+	thermal-zones {
+		cpu-thermal {
+			polling-delay-passive = <1000>; /* milliseconds */
+			polling-delay = <5000>; /* milliseconds */
+
+			thermal-sensors = <&nct1008 1>;
+
+			trips {
+				trip0: cpu-alert0 {
+					/* throttle at 57C until temperature drops to 56.8C */
+					temperature = <57000>;
+					hysteresis = <200>;
+					type = "passive";
+				};
+
+				trip1: cpu-crit {
+					/* shut down at 60C */
+					temperature = <60000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&trip0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
-- 
2.29.2

