Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59AF062C4AD
	for <lists+linux-media@lfdr.de>; Wed, 16 Nov 2022 17:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233576AbiKPQgR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 11:36:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234790AbiKPQfw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 11:35:52 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5AC85B860
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:28:16 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id y16so30763117wrt.12
        for <linux-media@vger.kernel.org>; Wed, 16 Nov 2022 08:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WF300EU75fh/D+zJwC6uFdTZaSLOdy68f/rlMixUCU=;
        b=yn5Y+1YV/H9FBLh1VwUXO2aa2ngHoRoQwaIOQ+FLuC7zGe+OcAQRoBV78bLl9+Yptf
         r4JhKB/fCzYzCZIMJtNcfUVt+aNhbCVVvxAEv/s8UU00/24BaotnZY6gSHwIYT1GiOEy
         i6FnuyNSaeL6/Qg37Hr8ObRRD1tN1llUR6RCf8NIksHurz81hJ5/8OIniSCTdDPxIePH
         X/NIEBUUqlA7aGBi/89Wa/N49TWAwFp/LBkK7vjks5rc9qHX9MrdITDFWMCVCXZhnCTO
         jQepiXD5BR1oNNkb/sVuax03gwkS0ZYJJs70hcmiicduLvrBY2e3wdGb786cG4jZogFD
         /Wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WF300EU75fh/D+zJwC6uFdTZaSLOdy68f/rlMixUCU=;
        b=XXSeqBrQlrbeU+sTUB2piBfubA77DnwWD3/EMk5fgJFtILzz3aHDBSxfVPP53EZZFC
         cKh4UhDXDpTm6FpQnIUdLrZQJ095GQj7vmH/HNDtnmDy3ZWC5OyeLuNRbY+m3rZdD7KP
         bZXtAkKTS26DPdCYG4JOafj2WABdOcBePcXXp6JYIESsSf93v90ivVQHLl2n7GdsLTd/
         uSavfbU8UFhCNuFU9DAy+tQ8EXarbyWX+WCARIt4BvvNQaUQ79budsxTMeHvS2IkbtZa
         wM63f27XezrwaJLldWjQpKJyHYQqSzzyktSmfSI2211QYuQ1+qMnSHkxNDA9IqBzc4Hg
         2jqA==
X-Gm-Message-State: ANoB5pnQbsZN5Msv8Xzw4WRA7XgEI1JGqknpu2ptALB5ZXZLdopHFvOa
        x0H9qxGJ7CxPAcGAZFru7AMl8Q==
X-Google-Smtp-Source: AA0mqf7pcKuoWVfuNUeyeB4WnVzSRlF0Ldd5rkStoP3LPtgjBWiCZPcrfiVuB3dwFUC4MWAlGpScuA==
X-Received: by 2002:a5d:4107:0:b0:22e:3e28:f8db with SMTP id l7-20020a5d4107000000b0022e3e28f8dbmr14606449wrp.380.1668616095404;
        Wed, 16 Nov 2022 08:28:15 -0800 (PST)
Received: from localhost.localdomain (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id s3-20020adfecc3000000b0022e653f5abbsm15459168wro.69.2022.11.16.08.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 08:28:14 -0800 (PST)
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
Subject: [PATCH v6 7/7] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Add vision mezzanine
Date:   Wed, 16 Nov 2022 16:28:01 +0000
Message-Id: <20221116162801.546737-8-bryan.odonoghue@linaro.org>
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

The Vision Mezzanine for the RB5 ships with an imx577 and ov9282 populated.
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
 .../dts/qcom/qrb5165-rb5-vision-mezzanine.dts | 62 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 33 ++++++++++
 3 files changed, 96 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4c81c1ee7f7c7..f5a76ec8a85e0 100644
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
index 0000000000000..ac3ccab2da35e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
@@ -0,0 +1,62 @@
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
+			csiphy2_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep>;
+			};
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
index 806aa19ad93ce..d37694342b53f 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3822,6 +3822,39 @@ tlmm: pinctrl@f100000 {
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

