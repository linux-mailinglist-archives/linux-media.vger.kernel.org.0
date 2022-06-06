Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A50B53E61A
	for <lists+linux-media@lfdr.de>; Mon,  6 Jun 2022 19:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238777AbiFFNUx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jun 2022 09:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238775AbiFFNUu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jun 2022 09:20:50 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62FC12E4346
        for <linux-media@vger.kernel.org>; Mon,  6 Jun 2022 06:20:49 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id q26so9471411wra.1
        for <linux-media@vger.kernel.org>; Mon, 06 Jun 2022 06:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wGX5MpVkQ5hX6iOJKIJ2U4ssdOVd1XOAUXMMf4leTQ8=;
        b=GkyJcF4Ph8XRwhMknB4xv0KQVTgeGaN5KNi1VozcP1+yLnQawcnzZr61dmpWs2rrIt
         C3fdX4C2ViNGFVA4Q4kDFg919SNLkzAIa61OOndZ+81nL5jI6yICr0sSpetC9PeXcIwF
         xpi2Rn80vSaTGMbvgmIPKIBlSN+HTTJB5PlGsob5vy5risjU5EPLx6EYyOI9DEdihS7d
         Vw+CnqlOmQeC6/UXoACgbJODfzRQKpNEEXEaPoMZLijdOxCvv46Tmuwe/BEqvIh3baKS
         8fSuKvKan0ndWJPY9GNRwM3amvAG5pdG+0BC7aS25fxgOtKeglD7ru68a+GNVBO+j3SK
         bTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wGX5MpVkQ5hX6iOJKIJ2U4ssdOVd1XOAUXMMf4leTQ8=;
        b=Nu54Pmtm0XRDfsdyuRDXjpAw804Dk5zBWeRdkYJAlL6/O+hrfIPVQLXZZfMt3U/IUp
         gdAfDtBil0eo9lBVX/W+vz50MGNIs7Il2mseesTxrBdsfcfvWGwIvfqVXQwpNmBXu+GV
         WnwpPQfl0G2qVH8I3ifAu+tKOOVTECR28VFkbbdjry9Kzyo9R/SO6VduvZhM/advVeOj
         GJahrqXZM3szanj3CJdlnIGiFb9hszYBIySBRehySEkmMtm7cC0lZzNXorLLrQSp0LJv
         em8UnAlr/MUkSWAH+GVU2qsk6BX73479wIN5In789D6DfNg/OmFiavhTXkZ+bi+lnGKn
         fhhg==
X-Gm-Message-State: AOAM531GUVyCAghByFE2Tf9FDm/+hvfwVIPPhsmRBgZw304x+7UHYjem
        70v9ZVLQD+aAJ75XT6Ec22b0rDeuZCR9ebGw
X-Google-Smtp-Source: ABdhPJyyIQ8AKDFD0LfZOb3Qftd+I0tfHQrl7nCpAdY3ga5Y2wNrqUOHtcut3eFBH2kL/2WRdW1Twg==
X-Received: by 2002:a5d:64ac:0:b0:211:7f3b:a0d4 with SMTP id m12-20020a5d64ac000000b002117f3ba0d4mr21975329wrp.490.1654521638140;
        Mon, 06 Jun 2022 06:20:38 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id i12-20020a05600c354c00b0039765a7add4sm21077810wmq.29.2022.06.06.06.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 06:20:37 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, konrad.dybcio@somainline.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v3 4/5] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Add vision mezzanine
Date:   Mon,  6 Jun 2022 14:20:28 +0100
Message-Id: <20220606132029.2221257-5-bryan.odonoghue@linaro.org>
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

The Vision Mezzanine for the RB5 ships with an imx517 and ov9282 populated.
Other sensors and components may be added or stacked with additional
mezzanines.

In this drop we enable the Sony imx577 main camera sensor.

The IMX577 is on CCI1/CSI2 provides four lanes of camera data.

An example media-ctl pipeline is:

media-ctl --reset
media-ctl -v -d /dev/media0 -V '"imx412 '20-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
media-ctl -V '"msm_csiphy2":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'

yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../dts/qcom/qrb5165-rb5-vision-mezzanine.dts | 68 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 33 +++++++++
 3 files changed, 102 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 2f8aec2cc6db..86e6801a9c29 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -51,6 +51,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1.dtb
diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
new file mode 100644
index 000000000000..c8bed02243f8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2022, Linaro Ltd.
+ */
+
+/dts-v1/;
+
+#include "qrb5165-rb5.dts"
+
+&camcc {
+	status = "okay";
+};
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
+				remote-endpoint = <&imx412_ep>;
+			};
+
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c0 {
+	camera@1a {
+		/*
+		 * rb5 ships with an imx577. camx code from qcom treats imx412
+		 * and imx577 the same way. Absent better data do the same here.
+		 */
+		compatible = "sony,imx412";
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
+			imx412_ep: endpoint {
+				clock-lanes = <1>;
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy2_ep>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index aa9a13364865..2b65ec2806d0 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3788,6 +3788,39 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 181>;
 			wakeup-parent = <&pdc>;
 
+			cam2_default: cam2-default {
+				rst {
+					pins = "gpio78";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				mclk {
+					pins = "gpio96";
+					function = "cam_mclk";
+					drive-strength = <16>;
+					bias-disable;
+				};
+			};
+
+			cam2_suspend: cam2-suspend {
+				rst {
+					pins = "gpio78";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+					output-low;
+				};
+
+				mclk {
+					pins = "gpio96";
+					function = "cam_mclk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
 			cci0_default: cci0-default {
 				cci0_i2c0_default: cci0-i2c0-default {
 					/* SDA, SCL */
-- 
2.36.1

