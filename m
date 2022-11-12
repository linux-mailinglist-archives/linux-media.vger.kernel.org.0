Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11115626ADD
	for <lists+linux-media@lfdr.de>; Sat, 12 Nov 2022 18:27:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235058AbiKLR1G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Nov 2022 12:27:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234983AbiKLR1D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Nov 2022 12:27:03 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B68B9183A5
        for <linux-media@vger.kernel.org>; Sat, 12 Nov 2022 09:27:02 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id f5so19181370ejc.5
        for <linux-media@vger.kernel.org>; Sat, 12 Nov 2022 09:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7QgvGNEwbhmBG8RfAUhGnCMf8oICSZxdmaf5EMA/lI=;
        b=jQOWHK/RLj6Nt67dAQ29pP5GsD2NQHPkvvOHjeZCzNOvnzrKMjttB2suQ0Jzedr9gI
         Q4xOjtCv5PmFwHdx3bhxlzoWNTxvC8rMGpYjOlSUZs0hteqaRvkvnGKjP9U8cJtVy7+Z
         8aFrJlS1Ifpu8blLKs7gN5eBtl2rXsDW83nbTKoru8T8+JXm31fFhY5kr8ReS1BVXkb1
         zltuYRTxBQGSpbwCWsAEnjG3vHu1qKcEoYIkb9f2zbovTZ6l6J6IwqD7nKDzN810Bqkd
         rhIDkAEVALTN2H5exVC6niNKJ6+qLj08r675LdcRm6Ebsjgkh20CxJ9Ya2FlNgw6tX6v
         2mXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z7QgvGNEwbhmBG8RfAUhGnCMf8oICSZxdmaf5EMA/lI=;
        b=q1PJDpeLHNWlTRp5kS4gAZtV3zqf3XfOvCJkX2c2Ru7aMWHKPXFdqs03q7kGyLYHss
         nB6PvEG+BVCADwkWR3jkw7CrWn2Nc6o3xRqmQAu0CkZF0PKI45C8p4tvGmpqeRfHHujI
         OuqPSHwBHSkOKSTHPeg0TYP1eXkKDCJR/LaM981bw6q2gXjyddYcOUr+gJtvCxbxPSEw
         nntUHMFUYzg7++JuYq03x5Q+hzfY2CvOU424bQwpdh3DbxnoZOXUUwv/7NqtP3uiz4CM
         kRZ/43aaFjRnZ5mo9JB0aQ2T20Yu44TKanTZPgEU8/W3KvRgsEc9fUluvxJ7yjQnaIUa
         ox2w==
X-Gm-Message-State: ANoB5pkTBqQO+T4ox58obfc/P4iSpabrt+MmVdgGiEaPTwWQU3bsrjQu
        B1fmS8Wd7L5s5KUn4/n9CI/yOw==
X-Google-Smtp-Source: AA0mqf4u852UGyZmqz0faQeeeBJmJVkzRVoRS/HyRLwfwX4dBQssrVE61mnbU1FhfEM4nD1xP0309Q==
X-Received: by 2002:a17:906:9f04:b0:7ae:ed2:5367 with SMTP id fy4-20020a1709069f0400b007ae0ed25367mr5688859ejc.521.1668274021268;
        Sat, 12 Nov 2022 09:27:01 -0800 (PST)
Received: from localhost.localdomain (2001-1c06-2302-5600-3861-6a56-0346-9c90.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:3861:6a56:346:9c90])
        by smtp.gmail.com with ESMTPSA id qo9-20020a170907874900b0078c1e174e11sm2099265ejc.136.2022.11.12.09.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 09:27:00 -0800 (PST)
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
Subject: [PATCH v5 6/6] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Add vision mezzanine
Date:   Sat, 12 Nov 2022 17:26:50 +0000
Message-Id: <20221112172650.127280-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221112172650.127280-1-bryan.odonoghue@linaro.org>
References: <20221112172650.127280-1-bryan.odonoghue@linaro.org>
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

The Vision Mezzanine for the RB5 ships with an imx517 and ov9282 populated.
Other sensors and components may be added or stacked with additional
mezzanines.

Enable the IMX577 on the vision mezzanine.

An example media-ctl pipeline for the imx577 is:

media-ctl --reset
media-ctl -v -d /dev/media0 -V '"imx577 '22-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
media-ctl -V '"msm_csiphy2":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'

yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../dts/qcom/qrb5165-rb5-vision-mezzanine.dts | 63 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 33 ++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 70ce09bc63a33..5eadd251a0a16 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -54,6 +54,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
new file mode 100644
index 0000000000000..315d524045cf3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2022, Linaro Ltd.
+ */
+
+/dts-v1/;
+
+#include "qrb5165-rb5.dts"
+
+&camss {
+	status = "okay";
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+
+	ports {
+		/* The port index denotes CSIPHY id i.e. csiphy2 */
+		port@2 {
+			reg = <2>;
+			csiphy2_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep>;
+			};
+		};
+	};
+};
+
+&camcc {
+	status = "okay";
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c0 {
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default", "suspend";
+		pinctrl-0 = <&cam2_default>;
+		pinctrl-1 = <&cam2_suspend>;
+
+		clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		dovdd-supply  = <&vreg_l7f_1p8>;
+		avdd-supply = <&vdc_5v>;
+		dvdd-supply = <&vdc_5v>;
+
+		port {
+			imx577_ep: endpoint {
+				clock-lanes = <1>;
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy2_ep>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f28a8893d00d7..83604b9772766 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3798,6 +3798,39 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 181>;
 			wakeup-parent = <&pdc>;
 
+			cam2_default: cam2-default-state {
+				rst-pins {
+					pins = "gpio78";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				mclk-pins {
+					pins = "gpio96";
+					function = "cam_mclk";
+					drive-strength = <16>;
+					bias-disable;
+				};
+			};
+
+			cam2_suspend: cam2-suspend-state {
+				rst-pins {
+					pins = "gpio78";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+					output-low;
+				};
+
+				mclk-pins {
+					pins = "gpio96";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
 			cci0_default: cci0-default-state {
 				cci0_i2c0_default: cci0-i2c0-default-pins {
 					/* SDA, SCL */
-- 
2.34.1

