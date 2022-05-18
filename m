Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC9652BCAA
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 16:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237825AbiERNaS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 09:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237927AbiERNaL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 09:30:11 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A15F61666AE
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 06:30:09 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id h14so2737858wrc.6
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 06:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=foZ6dspy82cYGpwpKNdGArEFQ0gYRwohDRDgkelpCf4=;
        b=oAp7EYC0w6+jz+ZodAbaRvi/HP3I2UUiqrOLuD5OHRoL6S22CYjwuZmqbLDOHmD7KI
         j2KsChHSO/Dsn6ODEzkiUG82m2mPfIyYiodAyf8EZbfHOBJVMf12UZthilwLaWppwGT4
         Dy8vPndPkR12duDcIpdNlBVidNwZa1gYoevNNIZtPVHU0fbmNfDkjUSgjW6bh9JZZQmT
         EEWvD+n1kgP/3eSFF08tmcVExtz8aRnmjr+Bs4Y2ItCsSPj/gsxzwb4rDWWvCi1IGYYN
         C4mho6dErPCP4N4NMzrfo3NRqVV6Fs+1HHdHLsZnolJwt/LDJK20KCwhsp0KiDJdtvpF
         K4Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=foZ6dspy82cYGpwpKNdGArEFQ0gYRwohDRDgkelpCf4=;
        b=AmnQLlFM7nkzjfSPYwGFwiTpWoXRSiKgZfkoSKmHdSVv/on4NoceQnxfEi7vd4+D/T
         raRM6TNvG0Y5y03lzls5/oUvm6ekg3uGjy1ZHZouiNEWA2DBnNpm6zf448cQDDnMevHh
         I3HsnMP5rhH5KgfrMJllNbZeYxtXnr7/yAyuSm+rARXzOGUlHTemfuAKmuqDHozZ+mfU
         h9DCVzC4wj0kItrUqy/+SeZ+aqbZJs1zo37vkIwDGsTb31FsZ5aaXmkXtPwtsGNeWXp6
         LVYRlIG+of8BCAsVJkcumjB8SxgX1aaBrKTXDiB1bpngm1KWsvHd6I8BLrYL12u7RkWo
         Nwlw==
X-Gm-Message-State: AOAM533yJcZoYGZ+5nR3HfgKX/jBFLNME1wXNnamc6HlHS5En0NBVoGW
        2MyeBveEzL+zwvjzZMp7zp9GZg==
X-Google-Smtp-Source: ABdhPJwWW357u1OYxJ1UGB7pS1idebUYuqZkILxJPfceVd8mb1bKABtlpxYfWjm6yx9of47cDJMuyA==
X-Received: by 2002:adf:efcb:0:b0:20d:24e:a1ce with SMTP id i11-20020adfefcb000000b0020d024ea1cemr16802543wrp.159.1652880608083;
        Wed, 18 May 2022 06:30:08 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v14-20020a056000144e00b0020cdf6ecafbsm2905580wrx.81.2022.05.18.06.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 06:30:07 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     vladimir.zapolskiy@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mmitkov@quicinc.com, jgrahsl@snap.com,
        hfink@snap.com, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 1/1] arm64: dts: qcom: qrb5165-rb5: Enable the IMX577 on cam1
Date:   Wed, 18 May 2022 14:30:04 +0100
Message-Id: <20220518133004.342775-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220518133004.342775-1-bryan.odonoghue@linaro.org>
References: <20220518133004.342775-1-bryan.odonoghue@linaro.org>
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
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 98 ++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 0e63f707b911..48b31790c434 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1203,6 +1203,43 @@ sdc2_card_det_n: sd-card-det-n {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	cam2_default: cam2-default {
+		rst {
+			pins = "gpio78";
+			function = "gpio";
+
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		mclk {
+			pins = "gpio96";
+			function = "cam_mclk";
+
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	cam2_suspend: cam2-suspend {
+		rst {
+			pins = "gpio78";
+			function = "gpio";
+
+			drive-strength = <2>;
+			bias-pull-down;
+			output-low;
+		};
+
+		mclk {
+			pins = "gpio96";
+			function = "cam_mclk";
+
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
 };
 
 &uart12 {
@@ -1294,3 +1331,64 @@ &qup_spi0_data_clk {
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
+		#address-cells = <1>;
+		#size-cells = <0>;
+
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
+		power-domains = <&camcc TITAN_TOP_GDSC>;
+		dovdd-supply  = <&vreg_l7f_1p8>;
+		avdd-supply = <&vdc_5v>;
+		dvdd-supply = <&vdc_5v>;
+
+		status = "okay";
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
-- 
2.36.1

