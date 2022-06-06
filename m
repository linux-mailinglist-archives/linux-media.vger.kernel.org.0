Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF6F53E651
	for <lists+linux-media@lfdr.de>; Mon,  6 Jun 2022 19:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238768AbiFFNUp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jun 2022 09:20:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238769AbiFFNUo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jun 2022 09:20:44 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F409A2DCB3D
        for <linux-media@vger.kernel.org>; Mon,  6 Jun 2022 06:20:40 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id u8so15507934wrm.13
        for <linux-media@vger.kernel.org>; Mon, 06 Jun 2022 06:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r2R9jG8Kr9X9kmtbyt2WFDnM8NcZdvgcAwzUcSJYgjw=;
        b=qzJbkgoAry6y5ooent4QLmsA0cRCNFEoLRGjDr98rD999MqAsUN6QjVZpNJXZyo+hK
         C6uN3cBDa1i+8ZtIhzwcOa7zLsYP/HsK0OQlEK9fBtuEYe3SVb++Cq6OWVDyJS4I1kQC
         ch2ojPl4WGIvQXB2UlSjDPFGoXfWiw/kq6DExOEbJkI5y4PU6bQU8rkehsmiSkicKqal
         9hy3xDwP3skiJHYRGIhTAKQM0z8g6kTVZaEZkXmLoCl6na3/adiZRqHR+pOnZGbufR1t
         ARq0dzV39wxuKVMLcEDG69thomCWRIR3ZAre7w7Swd5lAGAq3ZaKq4tJZwiP4EUeyKTl
         rFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r2R9jG8Kr9X9kmtbyt2WFDnM8NcZdvgcAwzUcSJYgjw=;
        b=egAhZZwnb5EAeuZcTimH3BAs9+faVtRQHVlxlb7KSAywu71JOXC2kci0giUnlj/Cz2
         7g0TQ2xCG6cMAwbKSwRZLUXomMdwmG3m4UiI29Q9N32NYkAKt1KcVNgfiRoOaEAASbYt
         QtqnfOhIk7JaQT4n3zX+purCw9wqsAyEov02dTY/rDfXfjU1kJ+OMmvVWUg7YzY8nhub
         bKOKwQors9drkJRDYoTcMITGxjheBp5bsBzU2LP2Jy8q0n/EZLMJ3RE7EeXKbCCJX8CA
         mex2pSj7vGqh60/djcyF+U2n7FO8lD2FV2uHJAhq2AnHRV6yQyg5iHXk43hD7T72evvk
         r0GQ==
X-Gm-Message-State: AOAM530jLs2Y875HOdVBi0cICbjDx15L5CIB9SsHhPlom7eBku+P3Zr/
        ZQGJstlXL2M4nf2hQ7L3ngNROm3b9KSJeA1K
X-Google-Smtp-Source: ABdhPJzWoxTMK/JV0TvFWOsbiyvdmQ5ev4T6j/uZCIl+bI0dO66TkLxqsbDT345zmVf/uJBC+xcnXQ==
X-Received: by 2002:a5d:5952:0:b0:217:a419:c417 with SMTP id e18-20020a5d5952000000b00217a419c417mr7367967wri.641.1654521639416;
        Mon, 06 Jun 2022 06:20:39 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id i12-20020a05600c354c00b0039765a7add4sm21077810wmq.29.2022.06.06.06.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 06:20:38 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, konrad.dybcio@somainline.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v3 5/5] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Add navigation mezzanine dts
Date:   Mon,  6 Jun 2022 14:20:29 +0100
Message-Id: <20220606132029.2221257-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606132029.2221257-1-bryan.odonoghue@linaro.org>
References: <20220606132029.2221257-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
 .../sdm845-db845c-navigation-mezzanine.dts    | 115 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    | 106 ----------------
 3 files changed, 116 insertions(+), 106 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 86e6801a9c29..2561c419f3ef 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -101,6 +101,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c-navigation-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-oneplus-enchilada.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-oneplus-fajita.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
new file mode 100644
index 000000000000..565675d644c5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
@@ -0,0 +1,115 @@
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
+	vdda-supply = <&vreg_l1a_0p875>;
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
+		// CAM0_RST_N
+		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam0_default>;
+		gpios = <&tlmm 13 0>,
+			<&tlmm 9 GPIO_ACTIVE_LOW>;
+
+		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
+		clock-names = "xvclk";
+		clock-frequency = <19200000>;
+
+		/* The &vreg_s4a_1p8 trace is powered on as a,
+		 * so it is represented by a fixed regulator.
+		 *
+		 * The 2.8V vdda-supply and 1.2V vddd-supply regulators
+		 * both have to be enabled through the power management
+		 * gpios.
+		 */
+		power-domains = <&clock_camcc TITAN_TOP_GDSC>;
+
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
+		// I2C address as per ov7251.txt linux documentation
+		reg = <0x60>;
+
+		// CAM3_RST_N
+		enable-gpios = <&tlmm 21 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam3_default>;
+		gpios = <&tlmm 16 0>,
+			<&tlmm 21 0>;
+
+		clocks = <&clock_camcc CAM_CC_MCLK3_CLK>;
+		clock-names = "xclk";
+		clock-frequency = <24000000>;
+
+		/* The &vreg_s4a_1p8 trace always powered on.
+		 *
+		 * The 2.8V vdda-supply regulator is enabled when the
+		 * vreg_s4a_1p8 trace is pulled high.
+		 * It too is represented by a fixed regulator.
+		 *
+		 * No 1.2V vddd-supply regulator is used.
+		 */
+		power-domains = <&clock_camcc TITAN_TOP_GDSC>;
+
+		vdddo-supply = <&vreg_lvs1a_1p8>;
+		vdda-supply = <&cam3_avdd_2v8>;
+
+		status = "disable";
+
+		port {
+			ov7251_ep: endpoint {
+				data-lanes = <0 1>;
+//				remote-endpoint = <&csiphy3_ep>;
+			};
+		};
+	};
+};
+
diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 194ebeb3259c..faf1e9c7f24b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1139,112 +1139,6 @@ &pm8998_gpio {
 
 };
 
-&cci {
-	status = "okay";
-};
-
-&camss {
-	vdda-supply = <&vreg_l1a_0p875>;
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
-		// CAM0_RST_N
-		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&cam0_default>;
-		gpios = <&tlmm 13 0>,
-			<&tlmm 9 GPIO_ACTIVE_LOW>;
-
-		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
-		clock-names = "xvclk";
-		clock-frequency = <19200000>;
-
-		/* The &vreg_s4a_1p8 trace is powered on as a,
-		 * so it is represented by a fixed regulator.
-		 *
-		 * The 2.8V vdda-supply and 1.2V vddd-supply regulators
-		 * both have to be enabled through the power management
-		 * gpios.
-		 */
-		power-domains = <&clock_camcc TITAN_TOP_GDSC>;
-
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
-		// I2C address as per ov7251.txt linux documentation
-		reg = <0x60>;
-
-		// CAM3_RST_N
-		enable-gpios = <&tlmm 21 0>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&cam3_default>;
-		gpios = <&tlmm 16 0>,
-			<&tlmm 21 0>;
-
-		clocks = <&clock_camcc CAM_CC_MCLK3_CLK>;
-		clock-names = "xclk";
-		clock-frequency = <24000000>;
-
-		/* The &vreg_s4a_1p8 trace always powered on.
-		 *
-		 * The 2.8V vdda-supply regulator is enabled when the
-		 * vreg_s4a_1p8 trace is pulled high.
-		 * It too is represented by a fixed regulator.
-		 *
-		 * No 1.2V vddd-supply regulator is used.
-		 */
-		power-domains = <&clock_camcc TITAN_TOP_GDSC>;
-
-		vdddo-supply = <&vreg_lvs1a_1p8>;
-		vdda-supply = <&cam3_avdd_2v8>;
-
-		status = "disable";
-
-		port {
-			ov7251_ep: endpoint {
-				data-lanes = <0 1>;
-//				remote-endpoint = <&csiphy3_ep>;
-			};
-		};
-	};
-};
-
 /* PINCTRL - additions to nodes defined in sdm845.dtsi */
 &qup_spi0_default {
 	config {
-- 
2.36.1

