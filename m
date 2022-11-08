Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 956306206A9
	for <lists+linux-media@lfdr.de>; Tue,  8 Nov 2022 03:19:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233689AbiKHCTZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Nov 2022 21:19:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233682AbiKHCTB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Nov 2022 21:19:01 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 517A227B36
        for <linux-media@vger.kernel.org>; Mon,  7 Nov 2022 18:18:35 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id p16so7939639wmc.3
        for <linux-media@vger.kernel.org>; Mon, 07 Nov 2022 18:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gJOeL3OzXTVRmzSvErkhUVE7t+al9Oo/WcNfNQzWbU=;
        b=zb8rBc02OAPUAE9AMXw89ol0/SsTpKSh9DlHiMa7s9ZYCVQ0LnUYyr0NkCkeHqygrS
         PHsCYxmAOhn6MJPXfErBL4wRxk/BNVrrZS8ZEj6YlCiqCmQGv+6sNHqsNH5FRZRhPOS0
         3aX+1jODKTDlpjNg9ejwXdLIJDcBgG3KI0RSn1bbCmWZ6fPINZ7OiRaSQjgUBAn7h65I
         GKu7nzy9WJWVFFltqzLp9IumvKfH4SxRacjMGWApGeVj3Odu+5v0+2Zm3zLiPcYqsMnt
         D4juqky3MdoWBuMf9FoJlfHsVGc3VSx7vwRRNRS6MOH3NTkViN60t+ZD3QjfDmk/8zxj
         7xzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gJOeL3OzXTVRmzSvErkhUVE7t+al9Oo/WcNfNQzWbU=;
        b=p/YpZkl2IluSh1rwGcO+GEkxIk6980FOAoDqvnsK27Au5OmZEO3oaQ7pSuelYDhd9e
         kn7NtUKq3Yzl1NueSBMf6pXwzHUMMNXW6elcg3KHDLigVFOZrd4AhRExQwIDrjM5b3md
         g86ekPJFwFOkvOrdAZswji8yLdv2YVsSUCILTRhklOYUqH6H0cdYFIYIxN7WSIiqa3UU
         wj37EJSwNbmNv5Ryq4nNXWTrAMjReqgPB37hje2A2LeosLbFoaeCQEg7YaezR5/mVX6T
         sVsPxiR+V40MZq4Fm8mcACgRN+EcmuEj7nUhVmbsLlxFyLhd6+hWBWQ7PqPuRHiqUMw8
         WW8Q==
X-Gm-Message-State: ACrzQf11/aNDRp0sgbSDT/IRCfSg/LViEshZSq9/1otzZxeZnSkrqUnh
        EPY1LAJDT+iEXuXeMO8aELT2wA==
X-Google-Smtp-Source: AMsMyM7ruirY+T9CwzKht2hNCTf/aBD7l7pP8QrY9sMOA7plJh7A4FmBaKmvODYLo4+QUlypEpXEOg==
X-Received: by 2002:a05:600c:2d85:b0:3cf:9cd9:a88b with SMTP id i5-20020a05600c2d8500b003cf9cd9a88bmr11815787wmg.92.1667873913706;
        Mon, 07 Nov 2022 18:18:33 -0800 (PST)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d6-20020adfe2c6000000b0022cc6b8df5esm8890354wrj.7.2022.11.07.18.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 18:18:33 -0800 (PST)
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
Subject: [PATCH v3 2/3] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Add vision mezzanine
Date:   Tue,  8 Nov 2022 02:18:15 +0000
Message-Id: <20221108021816.213084-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221108021816.213084-1-bryan.odonoghue@linaro.org>
References: <20221108021816.213084-1-bryan.odonoghue@linaro.org>
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

Enable both the IMX577

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
 .../dts/qcom/qrb5165-rb5-vision-mezzanine.dts | 64 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 33 ++++++++++
 3 files changed, 98 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index b0558d3389e5..78f6e78d8ed4 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -52,6 +52,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
new file mode 100644
index 000000000000..307b09094e7f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts
@@ -0,0 +1,64 @@
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
+
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
index 8ef0a9fe67dd..7199a86d2cbe 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3801,6 +3801,39 @@ tlmm: pinctrl@f100000 {
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
 			cci0_default: cci0-default-state {
 				cci0_i2c0_default: cci0-i2c0-default-pins {
 					/* SDA, SCL */
-- 
2.34.1

