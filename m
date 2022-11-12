Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2260262696D
	for <lists+linux-media@lfdr.de>; Sat, 12 Nov 2022 13:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234923AbiKLMlq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Nov 2022 07:41:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234847AbiKLMln (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Nov 2022 07:41:43 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1435012ACE
        for <linux-media@vger.kernel.org>; Sat, 12 Nov 2022 04:41:42 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id bj12so18042779ejb.13
        for <linux-media@vger.kernel.org>; Sat, 12 Nov 2022 04:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDK4zcScJZbs0+D+aVK+lquKsO1LJrdqxEJtJmVP6qs=;
        b=WIE3E0a7wbYG1PcIGAOlP+GAagrcOhF+FOnZWkExlbWUcgdnLmw2ds45yqDLhcSZEE
         oH+jn609FLuy9M7sYOBkNexzeRMC364UZFUCLPSpZwj8Cx63gJr1D6sWH5rdkDkZH3w9
         QjPf6bs0Gl1hOY/db6+p/sp114OU8TZmLAJL8xVbXkvrB4DHenGh6tWBaFzj1ajNprek
         K0+tS6z2lMURTlZuPFsoeRk/N8jqh41xCZU7DucfI4bzN1rn8rCe5Di6Bs9xwr+OuGpv
         8q/4vD8wX2bM+R34J7drN4XfjTgG3ssvfj33eJzcLau8sequVRRP+cqjX+MA7AtWubgd
         XAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDK4zcScJZbs0+D+aVK+lquKsO1LJrdqxEJtJmVP6qs=;
        b=czZ4wQWIihBHkU8fxdDQ2yuanZX951yzsbaTXgNySlmZm98M/JbOPT3LUEG50YiGif
         NAEqjQMSgEri+gkFpOpKXeprR38/G8FjBad9StT7uL7kC/e4aeUu+3WyqJ0Kx+/0uDoI
         XqwoGWS5sxLQsEPykOwhtnFRJ6R2WMy1Syre3x8eF3zi6wsmFlcEl2JQQNm399n5MKq7
         VbC/0K+4fcTiB684jwfb5LmfnA5danaXD3/IFOrhRVnVpnCZV45aBfJKWXmdaFi9ermq
         AYgrxYyeBfUb2QQzG6AosFxdJJiv+sHI6xuD59x0BfMr+ObAA6DDNzfL6j0V63S78uA9
         pzhA==
X-Gm-Message-State: ANoB5pnnPX34Y1MXrf1LMaNxYpwnLDQPLqfSgfQswX66cLCw3JlCmzIN
        My1dQ1B2gL9+eP5ZWDyfRBrhJg==
X-Google-Smtp-Source: AA0mqf7W7np7Qqikh74VZyDkmczIrnoJkqDihn5BGzfKb1t7NEDE0Udoh9C8KCpfHuDoC2iN77pXzQ==
X-Received: by 2002:a17:907:7f27:b0:78c:b8b0:9d35 with SMTP id qf39-20020a1709077f2700b0078cb8b09d35mr5078637ejc.586.1668256901624;
        Sat, 12 Nov 2022 04:41:41 -0800 (PST)
Received: from localhost.localdomain (2001-1c06-2302-5600-7e82-4de3-e7e5-df38.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7e82:4de3:e7e5:df38])
        by smtp.gmail.com with ESMTPSA id h23-20020a170906585700b007317f017e64sm1882915ejs.134.2022.11.12.04.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 04:41:41 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        vladimir.zapolskiy@linaro.org
Cc:     sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, quic_mmitkov@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v4 3/3] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Add navigation mezzanine dts
Date:   Sat, 12 Nov 2022 12:41:26 +0000
Message-Id: <20221112124126.86815-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221112124126.86815-1-bryan.odonoghue@linaro.org>
References: <20221112124126.86815-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move the dts data for the rb3 navigation mezzanine into its own dts file.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../sdm845-db845c-navigation-mezzanine.dts    | 109 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    | 101 ----------------
 3 files changed, 110 insertions(+), 101 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index cd88efa19e750..5eadd251a0a16 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -132,6 +132,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyln.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-lg-judyp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
new file mode 100644
index 0000000000000..0862ca30c8963
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022, Linaro Ltd.
+ */
+
+/dts-v1/;
+
+#include "sdm845-db845c.dts"
+
+&cci {
+	status = "okay";
+};
+
+&camss {
+	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
+
+	status = "ok";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			csiphy0_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&ov8856_ep>;
+			};
+		};
+	};
+};
+
+&cci_i2c0 {
+	camera@10 {
+		compatible = "ovti,ov8856";
+		reg = <0x10>;
+
+		/* CAM0_RST_N */
+		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam0_default>;
+
+		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
+		clock-names = "xvclk";
+		clock-frequency = <19200000>;
+
+		/*
+		 * The &vreg_s4a_1p8 trace is powered on as a,
+		 * so it is represented by a fixed regulator.
+		 *
+		 * The 2.8V vdda-supply and 1.2V vddd-supply regulators
+		 * both have to be enabled through the power management
+		 * gpios.
+		 */
+		dovdd-supply = <&vreg_lvs1a_1p8>;
+		avdd-supply = <&cam0_avdd_2v8>;
+		dvdd-supply = <&cam0_dvdd_1v2>;
+
+		status = "ok";
+
+		port {
+			ov8856_ep: endpoint {
+				link-frequencies = /bits/ 64
+					<360000000 180000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy0_ep>;
+			};
+		};
+	};
+};
+
+&cci_i2c1 {
+	camera@60 {
+		compatible = "ovti,ov7251";
+
+		/* I2C address as per ov7251.txt linux documentation */
+		reg = <0x60>;
+
+		/* CAM3_RST_N */
+		enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam3_default>;
+
+		clocks = <&clock_camcc CAM_CC_MCLK3_CLK>;
+		clock-names = "xclk";
+		clock-frequency = <24000000>;
+
+		/*
+		 * The &vreg_s4a_1p8 trace always powered on.
+		 *
+		 * The 2.8V vdda-supply regulator is enabled when the
+		 * vreg_s4a_1p8 trace is pulled high.
+		 * It too is represented by a fixed regulator.
+		 *
+		 * No 1.2V vddd-supply regulator is used.
+		 */
+		vdddo-supply = <&vreg_lvs1a_1p8>;
+		vdda-supply = <&cam3_avdd_2v8>;
+
+		status = "disable";
+
+		port {
+			ov7251_ep: endpoint {
+				data-lanes = <0 1>;
+/*				remote-endpoint = <&csiphy3_ep>; */
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 3e7ceb0861eb0..f41c6d600ea8c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1174,107 +1174,6 @@ &pm8998_gpio {
 
 };
 
-&cci {
-	status = "okay";
-};
-
-&camss {
-	vdda-phy-supply = <&vreg_l1a_0p875>;
-	vdda-pll-supply = <&vreg_l26a_1p2>;
-
-	status = "ok";
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		port@0 {
-			reg = <0>;
-			csiphy0_ep: endpoint {
-				data-lanes = <0 1 2 3>;
-				remote-endpoint = <&ov8856_ep>;
-			};
-		};
-	};
-};
-
-&cci_i2c0 {
-	camera@10 {
-		compatible = "ovti,ov8856";
-		reg = <0x10>;
-
-		/* CAM0_RST_N */
-		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&cam0_default>;
-
-		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
-		clock-names = "xvclk";
-		clock-frequency = <19200000>;
-
-		/*
-		 * The &vreg_s4a_1p8 trace is powered on as a,
-		 * so it is represented by a fixed regulator.
-		 *
-		 * The 2.8V vdda-supply and 1.2V vddd-supply regulators
-		 * both have to be enabled through the power management
-		 * gpios.
-		 */
-		dovdd-supply = <&vreg_lvs1a_1p8>;
-		avdd-supply = <&cam0_avdd_2v8>;
-		dvdd-supply = <&cam0_dvdd_1v2>;
-
-		status = "ok";
-
-		port {
-			ov8856_ep: endpoint {
-				link-frequencies = /bits/ 64
-					<360000000 180000000>;
-				data-lanes = <1 2 3 4>;
-				remote-endpoint = <&csiphy0_ep>;
-			};
-		};
-	};
-};
-
-&cci_i2c1 {
-	camera@60 {
-		compatible = "ovti,ov7251";
-
-		/* I2C address as per ov7251.txt linux documentation */
-		reg = <0x60>;
-
-		/* CAM3_RST_N */
-		enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&cam3_default>;
-
-		clocks = <&clock_camcc CAM_CC_MCLK3_CLK>;
-		clock-names = "xclk";
-		clock-frequency = <24000000>;
-
-		/*
-		 * The &vreg_s4a_1p8 trace always powered on.
-		 *
-		 * The 2.8V vdda-supply regulator is enabled when the
-		 * vreg_s4a_1p8 trace is pulled high.
-		 * It too is represented by a fixed regulator.
-		 *
-		 * No 1.2V vddd-supply regulator is used.
-		 */
-		vdddo-supply = <&vreg_lvs1a_1p8>;
-		vdda-supply = <&cam3_avdd_2v8>;
-
-		status = "disable";
-
-		port {
-			ov7251_ep: endpoint {
-				data-lanes = <0 1>;
-/*				remote-endpoint = <&csiphy3_ep>; */
-			};
-		};
-	};
-};
-
 /* PINCTRL - additions to nodes defined in sdm845.dtsi */
 &qup_spi0_default {
 	config {
-- 
2.34.1

