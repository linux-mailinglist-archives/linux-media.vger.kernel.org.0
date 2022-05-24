Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86EE7532BEE
	for <lists+linux-media@lfdr.de>; Tue, 24 May 2022 16:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238086AbiEXOC2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 May 2022 10:02:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238094AbiEXOCW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 May 2022 10:02:22 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B963448307
        for <linux-media@vger.kernel.org>; Tue, 24 May 2022 07:02:18 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id t6so25873046wra.4
        for <linux-media@vger.kernel.org>; Tue, 24 May 2022 07:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iXbAKg7nw/YPVpQzpMSW7CFDer8OTk9OFR3468QMlVU=;
        b=wRRSomMBWyLZtSm2GUksoxH8N5afcVR+fFJzKt0dzUhOp2edGNa6q92q+5LfkFoJIB
         c3wQ0YXdqN7uy65UARftVHRryTFY1eH/vM6a1zd+RXV3iM1rTQAmXvVMrsVJdKinpLxi
         3Qg/FF7C9DXilpHYaMvGdzhqBOv9ycLVstHi0xl5cNPZgkYBMEeWHSwxkZwtw/zFlCHk
         Ziuby3RJsNzJNFcyut5fQzqotk2AweF9ErmV9rRrhP3rv8N2lhPMKmPygvjUdE0PrT9Z
         kYctfvfN7TfiPRjhtd52Eo+OpbD5V68MMTwnLEC6H7R27fqSwjcDoHaF5pWYUdQ3HDEy
         1o9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iXbAKg7nw/YPVpQzpMSW7CFDer8OTk9OFR3468QMlVU=;
        b=gh1QShq9LZoCktyDrNqra91nMKnZVVqfisUVi7g7W7k+6XbzVhiKRJ9u/amsHKdF7L
         o4oNIH2WeIIIavdDoZ5SslDZsG/tt3wGRYZ6N2P/1HZZYO7HvWiIoxFd6OHQXnpfSTLB
         VFHOM+z8+G55CLYTe1PvkMJLyREs3oQHRntg9JWxAwfxkhd/S/Jf1+Bxi3hbYzilVWKU
         6NyH2n2HZ6NbPDMjErKiJfAw/7hh5sq2uo3C1IDiGfZqVYoU1AiKt24uG0ni20/SDn5P
         CxQG/Co7Od2qEzOcVL9hBVlzPMB98loYGJ7lY2tmA8XumGfkNKqDwRKnEgCUrsNDUC/Y
         1eVw==
X-Gm-Message-State: AOAM533267knUEY8CKcxkg61Zyn9/EruVwKrmEg0S7p44aNTSx5k53TV
        wPRvwHkxgu+R/3IRFd5987ygGg==
X-Google-Smtp-Source: ABdhPJzRAOMMaVGBLAFkdiNofBhPnbs39YQqKXkic4KUDYR0N2nuJv43ZCMpgcG+fzpbHenTIJ+s6A==
X-Received: by 2002:adf:d1ec:0:b0:20e:58c3:6998 with SMTP id g12-20020adfd1ec000000b0020e58c36998mr23067468wrd.280.1653400936241;
        Tue, 24 May 2022 07:02:16 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f9-20020adfc989000000b0020c5253d8e0sm12829030wrh.44.2022.05.24.07.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 07:02:15 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     vladimir.zapolskiy@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mmitkov@quicinc.com, jgrahsl@snap.com,
        hfink@snap.com, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 4/4] arm64: dts: qcom: qrb5165-rb5: Enable the IMX577 on cam2
Date:   Tue, 24 May 2022 15:02:07 +0100
Message-Id: <20220524140207.2758605-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220524140207.2758605-1-bryan.odonoghue@linaro.org>
References: <20220524140207.2758605-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The IMX577 is on CCI1/CSI2 providing four lanes of camera data.

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
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 60 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi     | 33 +++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 0e63f707b911..756ddeb7530b 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1294,3 +1294,63 @@ &qup_spi0_data_clk {
 	drive-strength = <6>;
 	bias-disable;
 };
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

