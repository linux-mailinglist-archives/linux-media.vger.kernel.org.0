Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78B6762C4A9
	for <lists+linux-media@lfdr.de>; Wed, 16 Nov 2022 17:36:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233604AbiKPQgN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 11:36:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233781AbiKPQfp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 11:35:45 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B92E65B5B8
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:28:12 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id o4so30644417wrq.6
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWW8UuJ/BxO4nM6TqB3D45Z5tX0e7fD6LJhIzNErQBY=;
        b=vUIg21SbI5gEsFyKjUoQ70p3/hG7WZgAUgZXVuGDUErgNPrDEHQljxv9JlsvtrYdNh
         uwUngRX/5KyYEMJJ3UUCnBBXmtBvaEFGeCVlwCfwBVSwaI/JUTPs6q/5xRIp4By6eR3t
         AYqIVDy7yvzep074HC1lBUItW5TCAR6J0fesZxvhlM4juio+wTuV6ecJnSjaVjhwh1lE
         T7HOD+bCAqMs3/N0Vj/9/iSRzlL4f5mlPqaSBU0jRgHjLKEJokzWXWg6oBt059bj2r37
         8vep+2GwwXcHEt9jnudHJ/u2pjs1wxW4Z0w2ykyq/k+PFDgOjshKe+Ej+I5mH+dM+T3y
         f3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWW8UuJ/BxO4nM6TqB3D45Z5tX0e7fD6LJhIzNErQBY=;
        b=b3uDag7J/f1TW0uLv0gT2AHQYfCLjCPZuZ6TfiOLnuX94ZWERbiovSb9j+7dA0KUU+
         tLSTIrvdLt3E1ZR8x/VGnzeZvmT08K8lHTXf4fujVofrwN2QsqCiKro146mafpxI3dQg
         qY5heDGhHQ+YTmloVw3JbiqeyUixKom1pBzL+NbSO+6qMmWPmSQ2WAEFgPgynUbvzbw+
         x/peAjcv5UM75z26QNDqveZx8jz4fC87Uo3yAzQ+ggSTxw4JJHbcUzWmKlpNbtO2VF9N
         pXk7NdCcN1etmtcwKXBsV9VO3kdezGW/TODWcJKXcl4nxIvomLs4yVG8jxN/z5UzQLdH
         A+jw==
X-Gm-Message-State: ANoB5plTjlFWE5hUiFSmKykruLim+a+UwbiVAw6Xh3fydRD+nBy2LHNd
        xPPsRmQWcllXwIgADxtechhEOg==
X-Google-Smtp-Source: AA0mqf6/naCGwIE/WeeM0zdUGT267gBJhJCx1AQzGwkyA5dZ3qKhZ7JqHf3TdFV3AkPHYCGC/C270A==
X-Received: by 2002:adf:f650:0:b0:236:e271:ead4 with SMTP id x16-20020adff650000000b00236e271ead4mr13954591wrp.426.1668616092320;
        Wed, 16 Nov 2022 08:28:12 -0800 (PST)
Received: from localhost.localdomain (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s3-20020adfecc3000000b0022e653f5abbsm15459168wro.69.2022.11.16.08.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 08:28:11 -0800 (PST)
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
Subject: [PATCH v6 5/7] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Add navigation mezzanine dts
Date:   Wed, 16 Nov 2022 16:27:59 +0000
Message-Id: <20221116162801.546737-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116162801.546737-1-bryan.odonoghue@linaro.org>
References: <20221116162801.546737-1-bryan.odonoghue@linaro.org>
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
 .../sdm845-db845c-navigation-mezzanine.dts    | 104 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  96 ----------------
 3 files changed, 105 insertions(+), 96 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index afe496a93f945..4c81c1ee7f7c7 100644
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
index 0000000000000..a21caa6f3fa25
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dts
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022, Linaro Ltd.
+ */
+
+/dts-v1/;
+
+#include "sdm845-db845c.dts"
+
+&camss {
+	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l26a_1p2>;
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			csiphy0_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&ov8856_ep>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
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
+		status = "disabled";
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
index be946f71666bc..f41c6d600ea8c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1174,102 +1174,6 @@ &pm8998_gpio {
 
 };
 
-&cci {
-	status = "okay";
-};
-
-&camss {
-	vdda-phy-supply = <&vreg_l1a_0p875>;
-	vdda-pll-supply = <&vreg_l26a_1p2>;
-
-	status = "okay";
-
-	ports {
-		port@0 {
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
-		status = "disabled";
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

