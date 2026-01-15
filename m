Return-Path: <linux-media+bounces-50771-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 803DAD23E2D
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 11:15:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 445273025F96
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 10:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABAB6361DC9;
	Thu, 15 Jan 2026 10:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcr/IgYk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BWTUXfc3"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C135336167E
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 10:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472028; cv=none; b=DkWxZDBn8dGdt6mbNo2DsCM9yNSabxsmdne5hUnVpjBozhMxczyG+A6aQlb0kjhvxmOQTIeAH7kmiCEH55GR2HzjNGUz/H4XT77b2bECYB9zexPYPZ/S0whk6oM2oJZ1kBoU3COiyojZP7qIZCa+O9Kp92VHoQflBNAFDQticLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472028; c=relaxed/simple;
	bh=ee7juG52A66Kq9G11MxdDsIfF4O//tB5Jvajm3XXffo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KcXHKfngTRFCMyN8GeEa89Zydp1d6Xc9pqHx1azaIgFhYVONEJingj4bjoemYh5aww0FT/LThFy+VuaXx2KRhI0InxaEHDqzxhsj+yxOZU8u93gH7t73q3fWxEbEVTXw/a0YCnrMocadKcQxgDpPoPO3I1iH1WMcxGPJNU4lbi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcr/IgYk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BWTUXfc3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6flnS1850956
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 10:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OntX6xVS5P0RG4FVCEOIReiWGNNrhfdEBD7/dZTRu6Y=; b=pcr/IgYkpOmqDp2C
	PXcFWpPvaOwlINQQha5P1I3nSFBeNmyLXm9N2+apOkJIIMUfnJJ4HyaXVxeU2mCh
	zNcTHK6JsE2VClegD5gtqM9uafeiCQEleEsgvULHT4VmAb9YGxhTqMBnj2p7xaBZ
	2kWCdWXqA5rIwRdwk3ijVu/58xeVBd1KFK/2ST2zHFypaoAyKpgR/+g6ag5sFXEw
	GmSa4RywY4J5okgFrkKEvpufEXS23AtZqPr1BRQ4DnDc4VYDAvCJCtfXeI358kjd
	7rEVtg0VUMvvTjvEQBQt5YowcMuM30Z3JbZXZlhenY3ZzuBAHpkmWWLdfwkqjdw4
	wh6nCw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bprej12jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 10:13:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ffb4222a4eso18374141cf.0
        for <linux-media@vger.kernel.org>; Thu, 15 Jan 2026 02:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768472023; x=1769076823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OntX6xVS5P0RG4FVCEOIReiWGNNrhfdEBD7/dZTRu6Y=;
        b=BWTUXfc3lYrQu2LEvuTd3XFMijmB+gDehfvkpJ1toHFnnFdF73uuHn3m3bCiYvmA0S
         yhQWe8MaHDzrbNNuM+Q8Dq8qNL3elCTkmIfgvWfjxPlDf6gghqeYcVAFbab0IASvJ+7u
         aaurSywn1NQBzYyPwZ2QrqmjQ+RUgUY/lgeDvxq32L2SqDnLUlN9xnKtIEzxgUHvv5KL
         4kwjahVQ62oBzJkYuh7gqcu7FVvlbTL/w89PYxSAvBn0YTKLPM/hVX4QzmZbmn1PivkL
         yyPhJiugNZX5TmJnrcH31wT6Kwh1IVI5ZnEMxW4f1PMy+ncnwmq482KAtL+htOpLgcZL
         nFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472023; x=1769076823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OntX6xVS5P0RG4FVCEOIReiWGNNrhfdEBD7/dZTRu6Y=;
        b=cTkPB0A6UnHmCWYii19mvO1aps4op2XRQ5+mWPcBdJaI/ddI+P4ZlCmyol3Sa9p6Xm
         Gc0AAGT7B4m1YHRTqoG2+7dnkuaMSIaYEfKETSthj9VLhrSFn5OIz9rd11VImlkGZv7v
         /29xY9zc3bu4bMDDYBRIbZj3b3Hbulyq40iU4uZqWQiGGkkWuP5AEbWhiWKWxoKnxoHX
         CCT90WTRKUkt1Nb7FOmkECnE6siFeTH5yEEun4NO64gr+1WfK/ETzCOmcqeSsGFRZl5E
         HlI4Vz5TRZZprJmFzZiO8okQUr7+hfYu9YYD8MlHOTrUR50jALkmI5bHcsD+Fip0LOn0
         1Rkg==
X-Forwarded-Encrypted: i=1; AJvYcCXfa9L6PhNafJSuB/Y9YuU9Pz0XjdV0YrbWqeY+XC0KyfISbLBqeoegmBAADA++vQ3+CJ3SWAzl8uOKWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yws0Mluoxw0ZYVT5iDsPIWFgdVAPiMcuXal1gGoEmoBV04vDZU/
	tjg6t9O/MGnBpgVpnarSaWX+h3nG97V5ChQA52ad9VUoxUc7iQZJfzATBGLG9AB62M6fqHOBwZO
	jB3CmYueKWdHcwftX3Q5o5DN2FTIe/11NI/YePNWK7o7AQ9/+683YrLMyZSSg8s52pyFs/qp3iQ
	==
X-Gm-Gg: AY/fxX4hydvw+rDuTif5Q7BOBl5IomSwJZKtD1bu8F5/X0UBqVHeIFfqJK+/SoPG3vW
	xjgj9RYokvTf3ImvHSMRGj2aWNyd8cix8xdsAbYJXaK1IH8jBMGlyTRoj8TvcBCOcVlSfh3/Iwx
	vRDASZboR5lufHPzY081HP6H+mPpTF9QP24pDlSZMIH2l4SibB/PSzwv+PciWdRhDMlobG6qgkP
	+BW+PCh7NpNXsNVcv0WwYM7ZR1hjfCy4PClt3Rtp0ikFvDy4WzaobZRcZNoU2buWQlSj5LJ36oC
	ckUCGcdztCEVMbtGYib/nZjbbrtSnhW6dnMAHJoAAlCDt3WbujBsP4pEdCuwDIojRPQet+B+AMw
	70fokSDnSmvU6lwGwvZEB5BVpF5B3RhiR/O+jyt+mYIhw3WwiLvIKHJtlAoE6W4ajtuqbS9SuUV
	r2
X-Received: by 2002:a05:622a:8c6:b0:4e7:2210:295f with SMTP id d75a77b69052e-501481e483dmr70948681cf.13.1768472023570;
        Thu, 15 Jan 2026 02:13:43 -0800 (PST)
X-Received: by 2002:a05:622a:8c6:b0:4e7:2210:295f with SMTP id d75a77b69052e-501481e483dmr70948331cf.13.1768472023101;
        Thu, 15 Jan 2026 02:13:43 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772340b9sm199959576d6.26.2026.01.15.02.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:13:42 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 18:12:41 +0800
Subject: [PATCH v3 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-sm6150_evk-v3-5-81526dd15543@oss.qualcomm.com>
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
In-Reply-To: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768471975; l=2955;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=ee7juG52A66Kq9G11MxdDsIfF4O//tB5Jvajm3XXffo=;
 b=ZH0SefqJdvjdAesIqr2NusUAYGk9tF2xZ+ky8RoKmgxqsxDaO/y+G2869byWdWgt0OjMxqqMr
 TzpfAs8J96KA0YXTMhM3zrhkPItDDOIxZ7MqFj1QmjhFOsiSeX+QYaZ
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MyBTYWx0ZWRfX3oKkh728rzhA
 aeVahZfebfAERbxE1lNaMyQvQZIQsxrrsdnopd1LQM18lYScc9kHFsK1izlL8ztr3Lk6uoAIslN
 08VXxrLf9jl2tV/lPTi/HCeR0ZLQEhmyT8U2GU2bOwT3gwRDdrepCIY9v6MjJMzHFCvKaMvd4hO
 Hf5hjy90FcsJFyuI4BaOQtHMgMXQs9oIvenl5osTR561VXEcj0Z3inXM2qps4jxAuPDmPZ3G48M
 1/oh8lkwkIrVR7NhPgqdp8fAb0WyFVOGi9TeYC3iYxyQ4knNCsQNx8YdHgH8DW/1f87VDBWv04d
 x5OuxKW/7BdPxd67E6zWYxWB0mRZs73pEtPsH/yHyWsoBkse6/X59IQGqjbGrkc2C8Hthuh+wgD
 +VIdUgbYSs3lOhtN2e/zRAMt2H7OpvgK/3R/+GhRHPkZVM9Jd8VbRnVIhniLx8kh09S7ZPS2bMM
 HeA46O/s12a4e4dT90A==
X-Proofpoint-ORIG-GUID: FoUsRgNvfGybuI4PW1_T0RwCCdHzp6OX
X-Authority-Analysis: v=2.4 cv=Rc+dyltv c=1 sm=1 tr=0 ts=6968bdd8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bL963-9QzuwlG1m339oA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: FoUsRgNvfGybuI4PW1_T0RwCCdHzp6OX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150073

Enable IMX577 via CCI on Taloss EVK Core Kit.

The Talos EVK board does not include a camera sensor
by default, this DTSO has enabled the Arducam 12.3MP
IMX577 Mini Camera Module on the CSI-1 interface.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
 .../boot/dts/qcom/talos-evk-camera-imx577.dtso     | 63 ++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 00652614e73582fa9bd5fbeff4836b9496721d2d..be9aeff2cd1555bc436e1b8eb78d8e1c9b84f9c4 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -339,8 +339,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
+dtbo-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtbo
+talos-evk-camera-imx577-dtbs	:= talos-evk.dtb talos-evk-camera-imx577.dtbo
 talos-evk-lvds-auo,g133han01-dtbs	:= \
 	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera-imx577.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..53006a861878f9112673b9a0ad954bed7a5fdca5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-evk-camera-imx577.dtso
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,qcs615-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&vreg_l11a>;
+	vdd-csiphy-1p8-supply = <&vreg_l12a>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep1>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam2_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		avdd-supply = <&vreg_s4a>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};

-- 
2.34.1


